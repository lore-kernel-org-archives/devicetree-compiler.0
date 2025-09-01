Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFE314A4F0
	for <devicetree-compiler@vger.kernel.org>; Mon,  1 Sep 2025 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729412; cv=none; b=oSDUtLBOxHBCWnn+di64riB1p+9z0r4X1Iu1TtiZWrBIqZ9DY5e236tH0wcUWAlo8eacem3pG7TqEP/8OwwaAOTsxgDgZSW2BzsJ7CplhtsopWhEAfDRIq91gFRXWOXSSCBPGldmxAWcoLmjI5FVRHsowrvaX2yCnerJlboNuwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729412; c=relaxed/simple;
	bh=qpg3rXHH/c22podplho6JR1W/ZyY18TtxGfDJJ7/2bg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P2Rw53pIwgrXGIyAExqWQr9zxSrQ9TUVSzvNdHSZmPw2xFeJp5Rdg0c6yMgS1Gv284GLJC4CuPdzx4lDJk4Mv9bitCWweSpHbMSuHeAwA6xzotvjguZKJ80LEC3vR1iFjaWYWMPZawJvHfJVjbzsfck37aW48YdfNa6Afq4d3eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4cFp1G6Q6rzYnJ0F;
	Mon,  1 Sep 2025 20:22:58 +0800 (CST)
Received: from w025.hihonor.com (10.68.28.69) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Sep
 2025 20:23:19 +0800
Received: from localhost.localdomain (10.144.17.252) by w025.hihonor.com
 (10.68.28.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Sep
 2025 20:23:19 +0800
From: yuan linyu <yuanlinyu@honor.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: <devicetree-compiler@vger.kernel.org>, yuan linyu <yuanlinyu@honor.com>
Subject: [PATCH] label: collect labels to __phandles__ node in interger format
Date: Mon, 1 Sep 2025 20:22:58 +0800
Message-ID: <20250901122258.2557912-1-yuanlinyu@honor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To w025.hihonor.com
 (10.68.28.69)

Currently labels are collect to __symbols__ node in path string format,
the libufdt have no support of it when do overlay.

Add a new method which collect labels in __phandles__ node which each
entry is an interger format, it will allow libufdt to keep labels when
do (stack) overlay.

The new method including below points,
1. add an option -P for dtc tool, it will create __phandles__ node and
labels in interger foramt
2. add new function in fdt_overlay.c to support merge __phandles__ node
3. add overlay test which test -P option
---
 dtc.c                |  18 +++-
 dtc.h                |   4 +-
 libfdt/fdt_overlay.c | 250 ++++++++++++++++++++++++++++++++++++++-----
 livetree.c           |  76 +++++++++++--
 tests/run_tests.sh   |  84 +++++++++++++++
 5 files changed, 392 insertions(+), 40 deletions(-)

diff --git a/dtc.c b/dtc.c
index b3445b7d6473..c62da2888a6f 100644
--- a/dtc.c
+++ b/dtc.c
@@ -18,6 +18,7 @@ int padsize;		/* Additional padding to blob */
 int alignsize;		/* Additional padding to blob according to the alignsize */
 int phandle_format = PHANDLE_EPAPR;	/* Use linux,phandle or phandle properties */
 int generate_symbols;	/* enable symbols & fixup support */
+int generate_phandles; /* collect phandles to __phandles node */
 int generate_fixups;		/* suppress generation of fixups on symbol support */
 int auto_label_aliases;		/* auto generate labels -> aliases */
 int annotate;		/* Level of annotation: 1 for input source location
@@ -47,7 +48,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 
 /* Usage related data. */
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@LAThv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@PLAThv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -67,6 +68,7 @@ static struct option const usage_long_opts[] = {
 	{"warning",           a_argument, NULL, 'W'},
 	{"error",             a_argument, NULL, 'E'},
 	{"symbols",	     no_argument, NULL, '@'},
+	{"phandles",	     no_argument, NULL, 'P'},
 	{"local-fixups",     no_argument, NULL, 'L'},
 	{"auto-alias",       no_argument, NULL, 'A'},
 	{"annotate",         no_argument, NULL, 'T'},
@@ -105,6 +107,7 @@ static const char * const usage_opts_help[] = {
 	"\n\tEnable/disable warnings (prefix with \"no-\")",
 	"\n\tEnable/disable errors (prefix with \"no-\")",
 	"\n\tEnable generation of symbols",
+	"\n\tEnable generation of phandles",
 	"\n\tPossibly generates a __local_fixups__ and a __fixups__ node at the root node",
 	"\n\tEnable auto-alias of labels",
 	"\n\tAnnotate output .dts with input source file and line (-T -T for more details)",
@@ -255,6 +258,9 @@ int main(int argc, char *argv[])
 			generate_symbols = 1;
 			break;
 
+		case 'P':
+			generate_phandles = 1;
+			break;
 		case 'L':
 			generate_fixups = 1;
 			break;
@@ -336,10 +342,16 @@ int main(int argc, char *argv[])
 	process_checks(force, dti);
 
 	if (auto_label_aliases)
-		generate_label_tree(dti, "aliases", false);
+		generate_label_tree(dti, "aliases");
+
+	if (generate_phandles || generate_symbols)
+		allocate_phandle(dti);
 
 	if (generate_symbols)
-		generate_label_tree(dti, "__symbols__", true);
+		generate_label_tree(dti, "__symbols__");
+
+	if (generate_phandles)
+		generate_phandles_tree(dti, "__phandles__");
 
 	if (generate_fixups) {
 		generate_fixups_tree(dti, "__fixups__");
diff --git a/dtc.h b/dtc.h
index 3a220b9afc99..92689a6bb70e 100644
--- a/dtc.h
+++ b/dtc.h
@@ -339,7 +339,9 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys);
 void sort_tree(struct dt_info *dti);
-void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
+void allocate_phandle(struct dt_info *dti);
+void generate_label_tree(struct dt_info *dti, const char *name);
+void generate_phandles_tree(struct dt_info *dti, const char *name);
 void generate_fixups_tree(struct dt_info *dti, const char *name);
 void generate_local_fixups_tree(struct dt_info *dti, const char *name);
 
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index e6b9eb643958..c080bca8665e 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -305,10 +305,49 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 						    delta);
 }
 
+/**
+ * overlay_adjust_phandles_node - Adjust properties of __phandles__
+ * @fdto: Device tree overlay blob
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_adjust_phandles_node() update all the values of property
+ * in overlay __phandles__ node.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_adjust_phandles_node(void *fdto, uint32_t delta)
+{
+	int phandles;
+	int offset;
+
+	phandles = fdt_subnode_offset(fdto, 0, "__phandles__");
+	if (phandles < 0) {
+		if (phandles == -FDT_ERR_NOTFOUND)
+			return 0;
+
+		return phandles;
+	}
+
+	fdt_for_each_property_offset(offset, fdto, phandles) {
+		const fdt32_t *val;
+		const char *name;
+		int len;
+
+		val = fdt_getprop_by_offset(fdto, offset, &name, &len);
+		if (!val || len != sizeof(uint32_t))
+			return -FDT_ERR_BADOVERLAY;
+
+		fdt32_st((void *)(uintptr_t)val, fdt32_ld(val) + delta);
+	}
+
+	return 0;
+}
+
 /**
  * overlay_fixup_one_phandle - Set an overlay phandle to the base one
  * @fdto: Device tree overlay blob
- * @symbols_off: Node offset of the symbols node in the base device tree
  * @path: Path to a node holding a phandle in the overlay
  * @path_len: number of path characters to consider
  * @name: Name of the property holding the phandle reference in the overlay
@@ -327,7 +366,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
+static int overlay_fixup_one_phandle(void *fdto,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
 				     int poffset, uint32_t phandle)
@@ -335,9 +374,6 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 	fdt32_t phandle_prop;
 	int fixup_off;
 
-	if (symbols_off < 0)
-		return symbols_off;
-
 	fixup_off = fdt_path_offset_namelen(fdto, path, path_len);
 	if (fixup_off == -FDT_ERR_NOTFOUND)
 		return -FDT_ERR_BADOVERLAY;
@@ -351,6 +387,58 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 						   sizeof(phandle_prop));
 }
 
+/**
+ * overlay_get_fixup_phandle - Get phandle for a lable from the base
+ * @fdt: Device tree blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @phandles_off: Node offset of the phandle node in the base device tree
+ * @label: label that need to resolve phandle
+ * @phandle: Phandle that resolved
+ *
+ * overlay_get_fixup_phandle() resolves a label phandle pointing to
+ * a node in the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_get_fixup_phandle(void *fdt, int symbols_off,
+		int phandles_off, const char *label, uint32_t *phandle)
+{
+	const fdt32_t *val;
+	const char *symbol_path;
+	int prop_len;
+	int symbol_off;
+
+	*phandle = (uint32_t)-1;
+	if (symbols_off == -FDT_ERR_NOTFOUND &&
+	    phandles_off == -FDT_ERR_NOTFOUND)
+		return -FDT_ERR_NOTFOUND;
+
+	if (phandles_off != -FDT_ERR_NOTFOUND) {
+		val = fdt_getprop(fdt, phandles_off, label, &prop_len);
+		if (!val || prop_len != sizeof(*val))
+			return -FDT_ERR_INTERNAL;
+
+		*phandle = fdt32_ld_(val);
+	} else {
+		symbol_path = fdt_getprop(fdt, symbols_off, label, &prop_len);
+		if (!symbol_path)
+			return prop_len;
+
+		symbol_off = fdt_path_offset(fdt, symbol_path);
+		if (symbol_off < 0)
+			return symbol_off;
+
+		*phandle = fdt_get_phandle(fdt, symbol_off);
+	}
+
+	if (!*phandle || *phandle > FDT_MAX_PHANDLE)
+		return -FDT_ERR_NOTFOUND;
+
+	return 0;
+}
+
 /**
  * overlay_fixup_phandle - Set an overlay phandle to the base one
  * @fdt: Base Device Tree blob
@@ -371,14 +459,12 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
  *      Negative error code on failure
  */
 static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
-				 int property)
+				 int phandles_off, int property)
 {
 	const char *value;
 	const char *label;
 	int len;
-	const char *symbol_path;
-	int prop_len;
-	int symbol_off;
+	int err;
 	uint32_t phandle;
 
 	value = fdt_getprop_by_offset(fdto, property,
@@ -390,17 +476,10 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		return len;
 	}
 
-	symbol_path = fdt_getprop(fdt, symbols_off, label, &prop_len);
-	if (!symbol_path)
-		return prop_len;
-	
-	symbol_off = fdt_path_offset(fdt, symbol_path);
-	if (symbol_off < 0)
-		return symbol_off;
-	
-	phandle = fdt_get_phandle(fdt, symbol_off);
-	if (!phandle)
-		return -FDT_ERR_NOTFOUND;
+	err = overlay_get_fixup_phandle(fdt, symbols_off, phandles_off,
+					label, &phandle);
+	if (err < 0)
+		return err;
 
 	do {
 		const char *path, *name, *fixup_end;
@@ -441,7 +520,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		if ((*endptr != '\0') || (endptr <= (sep + 1)))
 			return -FDT_ERR_BADOVERLAY;
 
-		ret = overlay_fixup_one_phandle(fdto, symbols_off,
+		ret = overlay_fixup_one_phandle(fdto,
 						path, path_len, name, name_len,
 						poffset, phandle);
 		if (ret)
@@ -470,7 +549,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
  */
 static int overlay_fixup_phandles(void *fdt, void *fdto)
 {
-	int fixups_off, symbols_off;
+	int fixups_off, symbols_off, phandles_off;
 	int property;
 
 	/* We can have overlays without any fixups */
@@ -482,13 +561,18 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 
 	/* And base DTs without symbols */
 	symbols_off = fdt_path_offset(fdt, "/__symbols__");
-	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND)))
+	if (symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND))
 		return symbols_off;
 
+	phandles_off = fdt_path_offset(fdt, "/__phandles__");
+	if (phandles_off < 0 && phandles_off != -FDT_ERR_NOTFOUND)
+		return phandles_off;
+
 	fdt_for_each_property_offset(property, fdto, fixups_off) {
 		int ret;
 
-		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
+		ret = overlay_fixup_phandle(fdt, fdto, symbols_off,
+					phandles_off, property);
 		if (ret)
 			return ret;
 	}
@@ -640,19 +724,62 @@ static int overlay_update_local_conflicting_references(void *fdto,
 							  fdto_phandle);
 }
 
+/**
+ * overlay_update_conflicting_phandles - resolve conflicting in __phandles__
+ * @fdto: Device tree overlay blob
+ * @fdtophandles: fdto __phandles__ node offset
+ * @fdt_phandle: Value to replace phandles with
+ * @fdto_phandle: Value to be replaced
+ *
+ * Replaces all values with value @fdto_phandle by @fdt_phandle.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_conflicting_phandles(void *fdto, int fdtophandles,
+						uint32_t fdt_phandle,
+						uint32_t fdto_phandle)
+{
+	int phandle_prop;
+
+	if (fdtophandles < 0)
+		return 0;
+
+	fdt_for_each_property_offset(phandle_prop, fdto, fdtophandles) {
+		const fdt32_t *phandle_val;
+		int phandle_len;
+		uint32_t phandle;
+
+		phandle_val = fdt_getprop_by_offset(fdto, phandle_prop,
+						  NULL, &phandle_len);
+		if (!phandle_val || phandle_len != sizeof(uint32_t))
+			return -FDT_ERR_BADOVERLAY;
+
+		phandle = fdt32_ld(phandle_val);
+		if (phandle != fdto_phandle)
+			continue;
+
+		fdt32_st((void *)(uintptr_t)phandle_val, fdt_phandle);
+	}
+
+	return 0;
+}
+
 /**
  * overlay_prevent_phandle_overwrite_node - Helper function for overlay_prevent_phandle_overwrite
  * @fdt: Base Device tree blob
  * @fdtnode: Node in fdt that is checked for an overwrite
  * @fdto: Device tree overlay blob
  * @fdtonode: Node in fdto matching @fdtnode
+ * @fdtophandles: fdto __phandles__ offset
  *
  * returns:
  *      0 on success
  *      Negative error code on failure
  */
 static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
-						  void *fdto, int fdtonode)
+			void *fdto, int fdtonode, int fdtophandles)
 {
 	uint32_t fdt_phandle, fdto_phandle;
 	int fdtochild;
@@ -673,6 +800,12 @@ static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
 								  fdto_phandle);
 		if (ret)
 			return ret;
+
+		ret = overlay_update_conflicting_phandles(fdto, fdtophandles,
+							fdt_phandle,
+							fdto_phandle);
+		if (ret)
+			return ret;
 	}
 
 	fdt_for_each_subnode(fdtochild, fdto, fdtonode) {
@@ -689,7 +822,7 @@ static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
 			continue;
 
 		ret = overlay_prevent_phandle_overwrite_node(fdt, fdtchild,
-							     fdto, fdtochild);
+					fdto, fdtochild, fdtophandles);
 		if (ret)
 			return ret;
 	}
@@ -712,6 +845,7 @@ static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
  */
 static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
 {
+	int fdtophandles = fdt_subnode_offset(fdto, 0, "__phandles__");
 	int fragment;
 
 	fdt_for_each_subnode(fragment, fdto, 0) {
@@ -737,7 +871,7 @@ static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
 			return target;
 
 		ret = overlay_prevent_phandle_overwrite_node(fdt, target,
-							     fdto, overlay);
+					fdto, overlay, fdtophandles);
 		if (ret)
 			return ret;
 	}
@@ -1037,6 +1171,59 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 	return 0;
 }
 
+/**
+ * overlay_phandles_update - Update the phandles of base tree after a merge
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_phandles_update() updates the phandles of the base tree with the
+ * phandles of the applied overlay
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_phandles_update(void *fdt, void *fdto)
+{
+	int root_pha, ov_pha, prop, val_len;
+	int ret;
+	const char *val;
+	const char *name;
+	void *p;
+
+	ov_pha = fdt_subnode_offset(fdto, 0, "__phandles__");
+
+	/* if no overlay phandles exist no problem */
+	if (ov_pha < 0)
+		return 0;
+
+	root_pha = fdt_subnode_offset(fdt, 0, "__phandles__");
+
+	/* it no root symbols exist we should create them */
+	if (root_pha == -FDT_ERR_NOTFOUND)
+		root_pha = fdt_add_subnode(fdt, 0, "__phandles__");
+
+	/* any error is fatal now */
+	if (root_pha < 0)
+		return root_pha;
+
+	/* iterate over each overlay symbol */
+	fdt_for_each_property_offset(prop, fdto, ov_pha) {
+		val = fdt_getprop_by_offset(fdto, prop, &name, &val_len);
+		if (!val)
+			return val_len;
+
+		ret = fdt_setprop_placeholder(fdt, root_pha, name,
+				sizeof(uint32_t), &p);
+		if (ret < 0)
+			return ret;
+
+		memcpy(p, val, sizeof(uint32_t));
+	}
+
+	return 0;
+}
+
 int fdt_overlay_apply(void *fdt, void *fdto)
 {
 	uint32_t delta;
@@ -1059,6 +1246,11 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
+	/* Increase value of all properties in phandles node by delta */
+	ret = overlay_adjust_phandles_node(fdto, delta);
+	if (ret)
+		goto err;
+
 	/* Update fdto's phandles using symbols from fdt */
 	ret = overlay_fixup_phandles(fdt, fdto);
 	if (ret)
@@ -1073,6 +1265,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
+	ret = overlay_phandles_update(fdt, fdto);
+	if (ret)
+		goto err;
+
 	ret = overlay_symbol_update(fdt, fdto);
 	if (ret)
 		goto err;
diff --git a/livetree.c b/livetree.c
index f328824c3bc6..7f6094a31dc6 100644
--- a/livetree.c
+++ b/livetree.c
@@ -908,12 +908,25 @@ static bool any_label_tree(struct dt_info *dti, struct node *node)
 	return false;
 }
 
-static void generate_label_tree_internal(struct dt_info *dti,
-					 struct node *an, struct node *node,
-					 bool allocph)
+static void allocate_phandle_internal(struct dt_info *dti, struct node *node)
 {
 	struct node *dt = dti->dt;
 	struct node *c;
+
+	/* if there are labels */
+	if (node->labels) {
+		/* force allocation of a phandle for this node */
+		(void)get_node_phandle(dt, node);
+	}
+
+	for_each_child(node, c)
+		allocate_phandle_internal(dti, c);
+}
+
+static void generate_label_tree_internal(struct dt_info *dti,
+					 struct node *an, struct node *node)
+{
+	struct node *c;
 	struct property *p;
 	struct label *l;
 
@@ -939,14 +952,44 @@ static void generate_label_tree_internal(struct dt_info *dti,
 				NULL);
 			add_property(an, p);
 		}
+	}
 
-		/* force allocation of a phandle for this node */
-		if (allocph)
-			(void)get_node_phandle(dt, node);
+	for_each_child(node, c)
+		generate_label_tree_internal(dti, an, c);
+}
+
+static void generate_phandles_tree_internal(struct dt_info *dti,
+						struct node *pn,
+						struct node *node)
+{
+	struct node *c;
+	struct property *p;
+	struct label *l;
+	struct data d;
+
+	/* if there are labels */
+	if (node->labels) {
+
+		/* now add the phandle for each label of the node */
+		for_each_label(node->labels, l) {
+			/* check whether the label already exists */
+			p = get_property(pn, l->label);
+			if (p) {
+				fprintf(stderr, "WARNING: label %s already"
+					" exists in /%s", l->label,
+					pn->name);
+				continue;
+			}
+
+			d = data_add_marker(empty_data, TYPE_UINT32, NULL);
+			d = data_append_cell(d, node->phandle);
+			p = build_property(l->label, d, NULL);
+			add_property(pn, p);
+		}
 	}
 
 	for_each_child(node, c)
-		generate_label_tree_internal(dti, an, c, allocph);
+		generate_phandles_tree_internal(dti, pn, c);
 }
 
 static bool any_fixup_tree(struct dt_info *dti, struct node *node)
@@ -1112,12 +1155,27 @@ static int generate_local_fixups_tree_internal(struct dt_info *dti,
 	return ret;
 }
 
-void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
+void allocate_phandle(struct dt_info *dti)
+{
+	if (!any_label_tree(dti, dti->dt))
+		return;
+	allocate_phandle_internal(dti, dti->dt);
+}
+
+void generate_label_tree(struct dt_info *dti, const char *name)
 {
 	if (!any_label_tree(dti, dti->dt))
 		return;
 	generate_label_tree_internal(dti, build_root_node(dti->dt, name),
-				     dti->dt, allocph);
+				     dti->dt);
+}
+
+void generate_phandles_tree(struct dt_info *dti, const char *name)
+{
+	if (!any_label_tree(dti, dti->dt))
+		return;
+	generate_phandles_tree_internal(dti, build_root_node(dti->dt, name),
+					dti->dt);
 }
 
 void generate_fixups_tree(struct dt_info *dti, const char *name)
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f07092b76b43..00fcecbe739a 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1090,6 +1090,89 @@ fdtoverlay_tests() {
     run_wrap_test test "$bd" = "$pd"
 }
 
+fdtoverlay_phandles_tests() {
+    base="$SRCDIR/overlay_base.dts"
+    basedtb=overlay_base.fdoverlay.phandles.test.dtb
+    overlay="$SRCDIR/overlay_overlay_manual_fixups.dts"
+    overlaydtb=overlay_overlay_manual_fixups.fdoverlay.phandles.test.dtb
+    targetdtb=target.fdoverlay.phandles.test.dtb
+
+    run_dtc_test -P -I dts -O dtb -o $basedtb $base
+    run_dtc_test -P -I dts -O dtb -o $overlaydtb $overlay
+
+    # test that the new property is installed
+    run_fdtoverlay_test foobar "/test-node" "test-str-property" "-ts" ${basedtb} ${targetdtb} ${overlaydtb}
+
+    stacked_base="$SRCDIR/stacked_overlay_base.dts"
+    stacked_basedtb=stacked_overlay_base.fdtoverlay.phandles.test.dtb
+    stacked_bar="$SRCDIR/stacked_overlay_bar.dts"
+    stacked_bardtb=stacked_overlay_bar.fdtoverlay.phandles.test.dtb
+    stacked_baz="$SRCDIR/stacked_overlay_baz.dts"
+    stacked_bazdtb=stacked_overlay_baz.fdtoverlay.phandles.test.dtb
+    stacked_targetdtb1=stacked_overlay_target.fdtoverlay.phandles1.test.dtb
+    stacked_targetdtb2=stacked_overlay_target.fdtoverlay.phandles2.test.dtb
+    stacked_targetdtb3=stacked_overlay_target.fdtoverlay.phandles3.test.dtb
+
+    run_dtc_test -P -I dts -O dtb -o $stacked_basedtb $stacked_base
+    run_dtc_test -P -I dts -O dtb -o $stacked_bardtb $stacked_bar
+    run_dtc_test -P -I dts -O dtb -o $stacked_bazdtb $stacked_baz
+
+    # test that baz correctly inserted the property
+    run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-ts" ${stacked_basedtb} ${stacked_targetdtb1} ${stacked_bardtb} ${stacked_bazdtb}
+
+    # test that bar and baz are correctly appended to __phandles__
+    run_fdtoverlay_test "2" "/__phandles__"  "bar" "-tu" ${stacked_basedtb} ${stacked_targetdtb2} ${stacked_bardtb}
+    run_fdtoverlay_test "3" "/__phandles__"  "baz" "-tu" ${stacked_basedtb} ${stacked_targetdtb3} ${stacked_bardtb} ${stacked_bazdtb}
+
+    overlay_long_path="$SRCDIR/overlay_overlay_long_path.dts"
+    overlay_long_pathdtb=overlay_overlay_long_path.fdoverlay.phandles.test.dtb
+    target_long_pathdtb=overlay_overlay_long_path_target.fdoverlay.phandles.test.dtb
+    run_dtc_test -P -I dts -O dtb -o $overlay_long_pathdtb $overlay_long_path
+
+    # test that fdtoverlay manages to apply overlays with long target path
+    run_fdtoverlay_test lpath "/test-node/sub-test-node/sub-test-node-with-very-long-target-path/test-0" "prop" "-ts" ${basedtb} ${target_long_pathdtb} ${overlay_long_pathdtb}
+
+    # test adding a label to the root of a fragment
+    stacked_base_nolabel="$SRCDIR/stacked_overlay_base_nolabel.dts"
+    stacked_base_nolabeldtb=stacked_overlay_base_nolabel.phandles.test.dtb
+    stacked_addlabel="$SRCDIR/stacked_overlay_addlabel.dts"
+    stacked_addlabeldtb=stacked_overlay_addlabel.phandles.test.dtb
+    stacked_addlabel_targetdtb=stacked_overlay_target_nolabel.fdtoverlay.phandles.test.dtb
+
+    run_dtc_test -P -I dts -O dtb -o $stacked_base_nolabeldtb $stacked_base_nolabel
+    run_dtc_test -P -I dts -O dtb -o $stacked_addlabeldtb $stacked_addlabel
+
+    run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addlabeldtb} ${stacked_bardtb} ${stacked_bazdtb}
+
+    # verify that phandles are not overwritten
+    run_dtc_test -P -I dts -O dtb -o overlay_base_phandle.phandles.test.dtb "$SRCDIR/overlay_base_phandle.dts"
+    run_dtc_test -P -I dts -O dtb -o overlay_overlay_phandle.phandles.test.dtb "$SRCDIR/overlay_overlay_phandle.dts"
+    run_wrap_test $FDTOVERLAY -i overlay_base_phandle.phandles.test.dtb -o overlay_base_phandleO.phandles.test.dtb overlay_overlay_phandle.phandles.test.dtb
+
+    pa=$($DTGET overlay_base_phandleO.phandles.test.dtb /a phandle)
+    pb=$($DTGET overlay_base_phandleO.phandles.test.dtb /b phandle)
+    pc=$($DTGET overlay_base_phandleO.phandles.test.dtb /c phandle)
+    pd=$($DTGET overlay_base_phandleO.phandles.test.dtb /d phandle)
+    ba=$($DTGET overlay_base_phandleO.phandles.test.dtb /b a)
+    bd=$($DTGET overlay_base_phandleO.phandles.test.dtb /b d)
+    cb=$($DTGET overlay_base_phandleO.phandles.test.dtb /c b)
+    da=$($DTGET overlay_base_phandleO.phandles.test.dtb /d a)
+    db=$($DTGET overlay_base_phandleO.phandles.test.dtb /d b)
+    dc=$($DTGET overlay_base_phandleO.phandles.test.dtb /d c)
+
+    shorten_echo "check phandle to noda a wasn't overwritten:	"
+    run_wrap_test test "$ba-$da" = "$pa-$pa"
+
+    shorten_echo "check phandle to noda b wasn't overwritten:	"
+    run_wrap_test test "$cb-$db" = "$pb-$pb"
+
+    shorten_echo "check phandle to noda c wasn't overwritten:	"
+    run_wrap_test test "$dc" = "$pc"
+
+    shorten_echo "check phandle to noda d wasn't overwritten:	"
+    run_wrap_test test "$bd" = "$pd"
+}
+
 pylibfdt_tests () {
     run_dtc_test -I dts -O dtb -o test_props.dtb "$SRCDIR/test_props.dts"
     TMP=/tmp/tests.stderr.$$
@@ -1168,6 +1251,7 @@ for set in $TESTSETS; do
 	    ;;
         "fdtoverlay")
 	    fdtoverlay_tests
+	    fdtoverlay_phandles_tests
 	    ;;
     esac
 done
-- 
2.25.1

