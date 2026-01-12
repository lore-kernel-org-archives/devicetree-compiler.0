Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CE02E1722;
	Mon, 12 Jan 2026 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227648; cv=none; b=O/+IU9fLjb8IDR/K8x3D8kt+CKsjf1CIhqdozl3o3401axsmno5YRqIvd9wsVU/GLGRoDIOND1sTRrw3yBaABeyohtd5tgfb6hepzQN34U9YWzXFO7kxm+RCFd4j1TSpKSuHMjJJwyXwPZCMgrLDwKFmC269vCej2SaT1QchPnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227648; c=relaxed/simple;
	bh=CGhVj0rPDjrSgzY9Y2DyIxpIJAgBRyAzL1bzNjUQQ1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h79toinO0rpfBv+OJbKMRplJSzwP95p2XZzbX9eEl4UbFxCh1ANNGxVpC9hri8ceUP0Cl4PpsjBLWddjZ/Xra5MMZ/a+9jqg38INSE6r3/oW9QYSsw2xIq5+RQGRRQ+J5BeA6OiSAC3GB/BJz18aouKUvjW8TMlD6762It/uByI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zu/p2taW; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zu/p2taW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 75DF61A27FA;
	Mon, 12 Jan 2026 14:20:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B681606FA;
	Mon, 12 Jan 2026 14:20:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B327103C926D;
	Mon, 12 Jan 2026 15:20:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227644; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3OKVz8i59SL65e0p8xDL+tkJPTJE7M038p7RDTRf2m0=;
	b=zu/p2taWdblR8lmPwxKjUVGNgI5FGn3i6SziPhJYE98ezluUZAtsAC5a9SHUit9xvTHqeb
	VV+yLxuuCDKS9TdUR6+qVCwkuqB3iTWAHTHvLBr9ZTzpbqtd/bf0CZFe1dnTBRzGQyKMFR
	FTAKp1LHXV4p2ULE34oflvIitpQzT5h1vpGV2lsr1wkL0PKzrlF4hGau/9VPOoYwLQQK7P
	TWVpHHHgXKQFKLN+U+CKfIwKsVv7JkpIHR4yIEYo6fh23AR44n9Bd8MgGiPSltFbGx2YgD
	46i5T4dE0a+aEpoOrzV3LhEsVX91br+mb4mybhbD95z+Gcw1Ht+gpWO8oB8hiQ==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH 15/77] Add support for /addon/ keyword
Date: Mon, 12 Jan 2026 15:19:05 +0100
Message-ID: <20260112142009.1006236-16-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The dts /addon/ keyword allows to mark a dts as an addon dts.

This is similar to /plugin/ used for overlay dts but specific to addon
dts.

It is also worth noting that a dts tagged with /addon/ will lead to a
dtb with the dt_flags set to FDT_FLAG_ADDON (0x1).

This allows to identify without any ambiguity an addon dts and an addon
dtb.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c        | 26 +++++++++++++-------------
 dtc-lexer.l     |  5 +++++
 dtc-parser.y    |  5 +++++
 dtc.h           |  1 +
 fdtdump.c       |  6 +++++-
 flattree.c      | 18 ++++++++++++++----
 libfdt/fdt.h    |  1 +
 libfdt/libfdt.h |  1 +
 treesource.c    |  5 ++++-
 9 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/checks.c b/checks.c
index 041e565..2be19c0 100644
--- a/checks.c
+++ b/checks.c
@@ -616,7 +616,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 
 			refnode = get_node_by_ref(dt, m->ref);
 			if (! refnode) {
-				if (!(dti->dtsflags & DTSF_PLUGIN))
+				if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)))
 					FAIL(c, dti, node, "Reference to non-existent node or "
 							"label \"%s\"\n", m->ref);
 				else /* mark the entry as unresolved */
@@ -718,8 +718,8 @@ static void check_alias_paths(struct check *c, struct dt_info *dti,
 			continue;
 		}
 
-		/* This check does not work for overlays with external paths */
-		if (!(dti->dtsflags & DTSF_PLUGIN) &&
+		/* This check does not work for overlays nor addons with external paths */
+		if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)) &&
 		    (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val))) {
 			FAIL_PROP(c, dti, node, prop, "aliases property is not a valid node (%s)",
 				  prop->val.val);
@@ -1417,8 +1417,8 @@ static void check_property_phandle_args(struct check *c,
 		 * entries when each index position has a specific definition.
 		 */
 		if (!phandle_is_valid(phandle)) {
-			/* Give up if this is an overlay with external references */
-			if (dti->dtsflags & DTSF_PLUGIN)
+			/* Give up if this is an overlay or addon with external references */
+			if (dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))
 				break;
 
 			cellsize = 0;
@@ -1651,8 +1651,8 @@ static void check_interrupt_map(struct check *c,
 
 		phandle = propval_cell_n(irq_map_prop, cell);
 		if (!phandle_is_valid(phandle)) {
-			/* Give up if this is an overlay with external references */
-			if (!(dti->dtsflags & DTSF_PLUGIN))
+			/* Give up if this is an overlay or an addon with external references */
+			if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)))
 				FAIL_PROP(c, dti, node, irq_map_prop,
 					  "Cell %zu is not a phandle(%d)",
 					  cell, phandle);
@@ -1720,9 +1720,9 @@ static void check_interrupts_property(struct check *c,
 		if (prop) {
 			phandle = propval_cell(prop);
 			if (!phandle_is_valid(phandle)) {
-				/* Give up if this is an overlay with
+				/* Give up if this is an overlay with or an addon
 				 * external references */
-				if (dti->dtsflags & DTSF_PLUGIN)
+				if (dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))
 					return;
 				FAIL_PROP(c, dti, parent, prop, "Invalid phandle");
 				continue;
@@ -1838,8 +1838,8 @@ static void check_graph_port(struct check *c, struct dt_info *dti,
 
 	check_graph_reg(c, dti, node);
 
-	/* skip checks below for overlays */
-	if (dti->dtsflags & DTSF_PLUGIN)
+	/* skip checks below for overlays or addons */
+	if (dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))
 		return;
 
 	if (!strprefixeq(node->name, node->basenamelen, "port"))
@@ -1880,8 +1880,8 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
 
 	check_graph_reg(c, dti, node);
 
-	/* skip checks below for overlays */
-	if (dti->dtsflags & DTSF_PLUGIN)
+	/* skip checks below for overlays or addons */
+	if (dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))
 		return;
 
 	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 15d585c..a4a8e0b 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -111,6 +111,11 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_PLUGIN;
 		}
 
+<*>"/addon/"	{
+			DPRINT("Keyword: /addon/\n");
+			return DT_ADDON;
+		}
+
 <*>"/memreserve/"	{
 			DPRINT("Keyword: /memreserve/\n");
 			BEGIN_DEFAULT();
diff --git a/dtc-parser.y b/dtc-parser.y
index 4d5eece..d8914d2 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -53,6 +53,7 @@ static bool is_ref_relative(const char *ref)
 
 %token DT_V1
 %token DT_PLUGIN
+%token DT_ADDON
 %token DT_MEMRESERVE
 %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
@@ -120,6 +121,10 @@ header:
 		{
 			$$ = DTSF_V1 | DTSF_PLUGIN;
 		}
+	| DT_V1 ';' DT_ADDON ';'
+		{
+			$$ = DTSF_V1 | DTSF_ADDON;
+		}
 	;
 
 headers:
diff --git a/dtc.h b/dtc.h
index 08c9f07..c0fffd2 100644
--- a/dtc.h
+++ b/dtc.h
@@ -336,6 +336,7 @@ struct dt_info {
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
 #define DTSF_PLUGIN	0x0002	/* /plugin/ */
+#define DTSF_ADDON	0x0004	/* /addon/ */
 
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
diff --git a/fdtdump.c b/fdtdump.c
index 5c78559..9b6f41a 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -67,7 +67,6 @@ static void dump_blob(void *blob, bool debug)
 	depth = 0;
 	shift = 4;
 
-	printf("/dts-v1/;\n");
 	printf("// magic:\t\t0x%"PRIx32"\n", fdt32_to_cpu(bph->magic));
 	printf("// totalsize:\t\t0x%"PRIx32" (%"PRIu32")\n",
 	       totalsize, totalsize);
@@ -91,6 +90,11 @@ static void dump_blob(void *blob, bool debug)
 		printf("// dt_flags:\t\t0x%"PRIx32"\n",
 		       fdt32_to_cpu(bph->dt_flags));
 	}
+	printf("/dts-v1/;\n");
+	if (version >= 18) {
+		if (fdt32_to_cpu(bph->dt_flags) & FDT_FLAG_ADDON)
+			printf("/addon/;\n");
+	}
 	printf("\n");
 
 	for (i = 0; ; i++) {
diff --git a/flattree.c b/flattree.c
index 2e2ffcb..bedb286 100644
--- a/flattree.c
+++ b/flattree.c
@@ -412,6 +412,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 	struct data dtbuf      = empty_data;
 	struct data strbuf     = empty_data;
 	struct fdt_header fdt;
+	uint32_t dt_flags = 0;
 	int padlen = 0;
 
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
@@ -421,6 +422,8 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 	if (!vi)
 		die("Unknown device tree blob version %d\n", version);
 
+	dt_flags |= dti->dtsflags & DTSF_ADDON ? FDT_FLAG_ADDON : 0;
+
 	flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
 	bin_emit_cell(&dtbuf, FDT_END);
 
@@ -428,7 +431,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 
 	/* Make header */
 	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
-			dti->boot_cpuid_phys, 0);
+			dti->boot_cpuid_phys, dt_flags);
 
 	/*
 	 * If the user asked for more space than is used, adjust the totalsize.
@@ -511,6 +514,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	struct data strbuf = empty_data;
 	struct reserve_info *re;
 	const char *symprefix = "dt";
+	uint32_t dt_flags = 0;
 
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
@@ -519,6 +523,8 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	if (!vi)
 		die("Unknown device tree blob version %d\n", version);
 
+	dt_flags |= dti->dtsflags & DTSF_ADDON ? FDT_FLAG_ADDON : 0;
+
 	fprintf(f, "/* autogenerated by dtc, do not edit */\n\n");
 
 	emit_label(f, symprefix, "blob_start");
@@ -561,7 +567,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 
 	if (vi->flags & FTF_DTFLAGS) {
 		fprintf(f, "\t/* dt_flags */\n");
-		asm_emit_cell(f, 0);
+		asm_emit_cell(f, dt_flags);
 	}
 
 	/*
@@ -897,6 +903,7 @@ struct dt_info *dt_from_blob(const char *fname)
 	struct node *tree;
 	uint32_t val;
 	int flags = 0;
+	unsigned int dtsflags = 0;
 
 	f = srcfile_relative_open(fname, NULL);
 
@@ -988,8 +995,11 @@ struct dt_info *dt_from_blob(const char *fname)
 		flags |= FTF_NOPS;
 	}
 
-	if (version >= 18)
+	if (version >= 18) {
 		flags |= FTF_REF_XXX | FTF_DTFLAGS;
+		dtsflags |= fdt32_to_cpu(fdt->dt_flags) & FDT_FLAG_ADDON ?
+				DTSF_ADDON : 0;
+	}
 
 	inbuf_init(&memresvbuf,
 		   blob + off_mem_rsvmap, blob + totalsize);
@@ -1012,5 +1022,5 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	fclose(f);
 
-	return build_dt_info(DTSF_V1, reservelist, tree, boot_cpuid_phys);
+	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_phys);
 }
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 128e7bc..94f65e6 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -51,6 +51,7 @@ struct fdt_property {
 #endif /* !__ASSEMBLER__ */
 
 #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
+#define FDT_FLAG_ADDON  0x1
 #define FDT_TAGSIZE	sizeof(fdt32_t)
 
 #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 9777f32..37459a6 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -302,6 +302,7 @@ int fdt_next_subnode(const void *fdt, int offset);
 #define fdt_boot_cpuid_phys(fdt)	(fdt_get_header(fdt, boot_cpuid_phys))
 #define fdt_size_dt_strings(fdt)	(fdt_get_header(fdt, size_dt_strings))
 #define fdt_size_dt_struct(fdt)		(fdt_get_header(fdt, size_dt_struct))
+#define fdt_dt_flags(fdt)		(fdt_get_header(fdt, dt_flags))
 
 #define fdt_set_hdr_(name) \
 	static inline void fdt_set_##name(void *fdt, uint32_t val) \
diff --git a/treesource.c b/treesource.c
index d25f01f..1db6390 100644
--- a/treesource.c
+++ b/treesource.c
@@ -369,7 +369,10 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 {
 	struct reserve_info *re;
 
-	fprintf(f, "/dts-v1/;\n\n");
+	fprintf(f, "/dts-v1/;\n");
+	if (dti->dtsflags & DTSF_ADDON)
+		fprintf(f, "/addon/;\n");
+	fprintf(f, "\n");
 
 	for (re = dti->reservelist; re; re = re->next) {
 		struct label *l;
-- 
2.52.0

