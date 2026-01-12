Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11F4369208
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227711; cv=none; b=RDLyBjiTfYIrzp8p9utZsmHKmOoNn0lGK2ufcV8i1aqU2elcr+RT3LzAsjp3xnohagF+lxt9t44Cu/U94ivWV0o9Gg5eZPHE1Wd/h4R2fDKOXbxntEufz8dxOUvYEpUkyjr0/xEgYlU33nxZoQlW59LgPv9zIkZncHmEMVgWzvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227711; c=relaxed/simple;
	bh=ZBXmcC0Fkyrj5h9xVIfrIcc8lqyti1NkhaU/f3viA7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qk+ULeXbos56Z8GxurFQYa7wIWklgeR4lwsguZC1YY7OtCDqUJsBr0kaxp8U/X93tq321bYTEAryPvBAQHIvNsDhEeg4qyUoSmmyvhQ7pdKaAJsLBRt4AhP7wRMw1Yxpkpsbu++j8APAiAVFJNJibTboLJshyoIXSeJqHIeUSmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zKJmG5YM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zKJmG5YM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C6F211A2810;
	Mon, 12 Jan 2026 14:21:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C9B4606FA;
	Mon, 12 Jan 2026 14:21:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E07D0103C9260;
	Mon, 12 Jan 2026 15:21:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227705; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nwWkJJw+OXSJ1Qn8+lYWU/RhooacQw/uFer9xhANjtQ=;
	b=zKJmG5YMdgj4qBPHkImU/5GaFOWJHSOtPBdfECaCw48XwVAEo9LpAGgKUEeRFb6xoyBLhS
	VGMprxxPmH8aEroBRgMriyfFvDtU+e7XaKFHLsZJsxBQxliG3x41CglHyFilxxilA45yoo
	HatNSIJcDLhfBGi4hErRKWZfoM9QvMOT6eeSTJnvtLAqmUne7EzgX64+fQipbD19Nk4ARU
	J2BN+ZavcumD+87b/xnd9EBnTIRHGduH2mEmsZNOylUw49dF43kj7YywTFFQpK9WEBKlbQ
	xcShli3TtnmuseYkOijiA/s7z6chEToOdECaBENMZfJSqVvOUdn1QH5RhfUd/Q==
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
Subject: [RFC PATCH 56/77] Add support for FDT_BEGIN_NODE_REF_SYM dtb tag
Date: Mon, 12 Jan 2026 15:19:46 +0100
Message-ID: <20260112142009.1006236-57-herve.codina@bootlin.com>
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

The FDT_BEGIN_NODE_REF dtb tag is a meta-data tag defining a referenced
node.

This kind of nodes can be present in addon dtbs and identifies a node
external to the addon dtb but modified by the addon.

For instance, if an addon adds a sub-node a node existing in the
device-tree the addon is applied to, the existing node needs to be
referenced by the addon dtb. This is the purpose of FDT_BEGIN_NODE_REF.

This tag typically identifies what we call orphan nodes in dts.

The structure of FDT_BEGIN_NODE_REF is identical to the structure of
FDT_BEGIN_NODE except that the node name is not present and it is
replaced by the node symbol reference needed to reference the node in
the base device-tree when the addon device-tree blob is applied.

The FDT_BEGIN_NODE_REF block is terminated by a FDT_END_NODE tag.

The FDT_BEGIN_NODE_REF tag is followed by:
  - node symbol name (string including \0)
      The symbol name used to reference the node in the base device-tree
      when the addon is applied.
  - padding:
      Padding (0x00) added to have the next value aligned on 32bit.
  - Node structure (see FDT_BEGIN_NODE):
      Items provided by the addon to be merged in the referenced
      node when the addon is applied.
  - FDT_END_NODE tag

Example:
  FDT_BEGIN_NODE_REF 'foo1' 0x00 0x00 0x00 ... FDT_END_NODE

  This means that the external node referenced by 'foo1' is modified by
  the addon. Items to merge when the addon is applied are represented by
  the '...' part.

  This is what is encoded in the dtb when the related dts has the
  following orphan node:
    &foo1 {
      ...
    };

If several external nodes are modified by the addon (several orphan
nodes described in the addon), several FDT_BEGIN_NODE_REF are present.
Each of them related to an external node. For instance, having 'foo1'
and 'bar1' as external nodes leads to the following sequence:
  FDT_BEGIN_NODE_REF 'foo1' 0x00 0x00 0x00 ... FDT_END_NODE
  FDT_BEGIN_NODE_REF 'bar1' 0x00 0x00 0x00 ... FDT_END_NODE

The FDT_BEGIN_NODE_REF can be present only for a top level node.
Subnodes are identified by a FDT_BEGIN_NODE tag.

If FDT_BEGIN_NODE_REF tags are present in the dtb, they are present
after the root node definition (i.e. after the first FDT_BEGIN_NODE
/ FDT_END_NODE block).

Add support for this new dtb tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c    |  11 ++++++
 flattree.c   | 103 ++++++++++++++++++++++++++++++++++++++++++---------
 libfdt/fdt.c |  10 +++++
 libfdt/fdt.h |   2 +
 4 files changed, 108 insertions(+), 18 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index 04e6e38..7d58e3d 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -176,6 +176,17 @@ static void dump_blob(void *blob, bool debug)
 			continue;
 		}
 
+		if (tag == FDT_BEGIN_NODE_REF) {
+			last_prop_name = NULL;
+			s = p;
+			p = PALIGN(p + strlen(s) + 1, 4);
+
+			printf("%*s&%s {\n", depth * shift, "", s);
+
+			depth++;
+			continue;
+		}
+
 		if (tag == FDT_EXPORT_SYM) {
 			s = p;
 			p = PALIGN(p + strlen(s) + 1, 4);
diff --git a/flattree.c b/flattree.c
index 412c7f8..27f7608 100644
--- a/flattree.c
+++ b/flattree.c
@@ -51,6 +51,7 @@ struct emitter {
 	void (*export_sym)(void *);
 	void (*export_sym_ref)(void *);
 	void (*import_sym)(void *);
+	void (*beginnode_ref)(void *, struct label *labels);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -125,6 +126,11 @@ static void bin_emit_import_sym(void *e)
 	bin_emit_cell(e, FDT_IMPORT_SYM);
 }
 
+static void bin_emit_beginnode_ref(void *e, struct label *labels)
+{
+	bin_emit_cell(e, FDT_BEGIN_NODE_REF);
+}
+
 static struct emitter bin_emitter = {
 	.cell = bin_emit_cell,
 	.string = bin_emit_string,
@@ -138,6 +144,7 @@ static struct emitter bin_emitter = {
 	.export_sym = bin_emit_export_sym,
 	.export_sym_ref = bin_emit_export_sym_ref,
 	.import_sym = bin_emit_import_sym,
+	.beginnode_ref = bin_emit_beginnode_ref,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -292,6 +299,18 @@ static void asm_emit_import_sym(void *e)
 	die("FDT_IMPORT_SYM not supported in asm output\n");
 }
 
+static void asm_emit_beginnode_ref(void *e, struct label *labels)
+{
+	/*
+	 * Orphan nodes (FDT_BEGIN_NODE_REF tags) are an feature
+	 * introduced for addons.
+	 * Addons device-tree blob have to reason to be in the asm format.
+	 *
+	 * Need to be implemented if really needed.
+	 */
+	die("FDT_BEGIN_NODE_REF not supported in asm output\n");
+}
+
 static struct emitter asm_emitter = {
 	.cell = asm_emit_cell,
 	.string = asm_emit_string,
@@ -305,6 +324,7 @@ static struct emitter asm_emitter = {
 	.export_sym = asm_emit_export_sym,
 	.export_sym = asm_emit_export_sym_ref,
 	.import_sym = asm_emit_import_sym,
+	.beginnode_ref = asm_emit_beginnode_ref,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -335,13 +355,17 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	if (tree->deleted)
 		return;
 
-	emit->beginnode(etarget, tree->labels);
-
-	if (vi->flags & FTF_FULLPATH)
-		emit->string(etarget, tree->fullpath, 0);
-	else
-		emit->string(etarget, tree->name, 0);
+	if ((vi->flags & FTF_REF_XXX) && tree->ref) {
+		emit->beginnode_ref(etarget, tree->labels);
+		emit->string(etarget, tree->ref, 0);
+	} else {
+		emit->beginnode(etarget, tree->labels);
 
+		if (vi->flags & FTF_FULLPATH)
+			emit->string(etarget, tree->fullpath, 0);
+		else
+			emit->string(etarget, tree->name, 0);
+	}
 	emit->align(etarget, sizeof(cell_t));
 
 	for_each_property(tree, prop) {
@@ -500,6 +524,22 @@ static void flatten_imports(struct symbol *importsymlist, struct emitter *emit,
 	}
 }
 
+static void flatten_orphans(struct node *orphanlist, struct emitter *emit,
+			    void *etarget, struct data *strbuf,
+			    struct version_info *vi, uint32_t dt_flags)
+{
+	struct node *orphan;
+
+	if (!(vi->flags & FTF_REF_XXX))
+		return;
+
+	if (!(dt_flags & FDT_FLAG_ADDON) && orphanlist)
+		die("Only addons can have orphan nodes\n");
+
+	for_each_orphan(orphanlist, orphan)
+		flatten_tree(orphan, emit, etarget, strbuf, vi);
+}
+
 void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 {
 	struct version_info *vi = NULL;
@@ -523,6 +563,9 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 
 	flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
 	flatten_imports(dti->importsymlist, &bin_emitter, &dtbuf, vi, dt_flags);
+	flatten_orphans(dti->orphanlist, &bin_emitter, &dtbuf, &strbuf, vi,
+			dt_flags);
+
 	bin_emit_cell(&dtbuf, FDT_END);
 
 	reservebuf = flatten_reserve_list(dti->reservelist, vi);
@@ -616,6 +659,9 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 
 	if (dti->importsymlist)
 		die("Import symbols not supported in asm format\n");
+	if (dti->orphanlist)
+		die("Orphan nodes not supported in asm format\n");
+
 
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
@@ -912,7 +958,8 @@ static const char *nodename_from_path(const char *ppath, const char *cpath)
 
 static struct node *unflatten_tree(struct inbuf *dtbuf,
 				   struct inbuf *strbuf,
-				   const char *parent_flatname, int flags)
+				   const char *parent_flatname, int flags,
+				   bool is_orphan_node)
 {
 	struct node *node;
 	const char *flatname;
@@ -922,14 +969,18 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 	const char *str2;
 
 	node = build_node(NULL, NULL, NULL, NULL);
-
-	flatname = flat_read_string(dtbuf);
-
-	if (flags & FTF_FULLPATH)
-		node->name = xstrdup(nodename_from_path(parent_flatname,
-							flatname));
-	else
-		node->name = xstrdup(flatname);
+	if (is_orphan_node) {
+		str = flat_read_string(dtbuf);
+		orphan_node(node, str);
+		flatname = "";
+	} else {
+		flatname = flat_read_string(dtbuf);
+		if (flags & FTF_FULLPATH)
+			node->name = xstrdup(nodename_from_path(parent_flatname,
+					     flatname));
+		else
+			node->name = xstrdup(flatname);
+	}
 
 	do {
 		struct symbol *exportsym;
@@ -949,7 +1000,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			break;
 
 		case FDT_BEGIN_NODE:
-			child = unflatten_tree(dtbuf,strbuf, flatname, flags);
+			child = unflatten_tree(dtbuf, strbuf, flatname, flags, false);
 			add_child(node, child);
 			break;
 
@@ -1012,6 +1063,11 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			add_symbol(&node->exportsymlist, exportsym);
 			break;
 
+		case FDT_BEGIN_NODE_REF:
+			/* FDT_BEGIN_NODE_REF can only be at the FDT top level. */
+			die("Unexpected FDT_BEGIN_NODE_REF tag\n");
+			break;
+
 		default:
 			die("Invalid opcode word %08x in device tree blob\n",
 			    val);
@@ -1039,6 +1095,8 @@ struct dt_info *dt_from_blob(const char *fname)
 	struct node *tree;
 	struct symbol *importsymlist = NULL;
 	struct symbol *importsym;
+	struct node *orphanlist = NULL;
+	struct node *orphan;
 	uint32_t val;
 	int flags = 0;
 	unsigned int dtsflags = 0;
@@ -1150,7 +1208,7 @@ struct dt_info *dt_from_blob(const char *fname)
 	if (val != FDT_BEGIN_NODE)
 		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
 
-	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
+	tree = unflatten_tree(&dtbuf, &strbuf, "", flags, false);
 
 	val = flat_read_word(&dtbuf);
 
@@ -1162,6 +1220,15 @@ struct dt_info *dt_from_blob(const char *fname)
 				val = flat_read_word(&dtbuf);
 			}
 		}
+
+		if (flags & FTF_REF_XXX) {
+			while (val == FDT_BEGIN_NODE_REF) {
+				orphan = unflatten_tree(&dtbuf, &strbuf, "", flags,
+							true);
+				addon_add_orphan_node(&orphanlist, orphan);
+				val = flat_read_word(&dtbuf);
+			}
+		}
 	}
 
 	if (val != FDT_END)
@@ -1172,5 +1239,5 @@ struct dt_info *dt_from_blob(const char *fname)
 	fclose(f);
 
 	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_phys,
-			     importsymlist, NULL);
+			     importsymlist, orphanlist);
 }
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index c169dd9..dc58d2d 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -232,6 +232,15 @@ uint32_t fdt_next_tag_full(const void *fdt, int startoffset, int *nextoffset)
 			return FDT_END; /* premature end */
 		break;
 
+	case FDT_BEGIN_NODE_REF:
+		/* Skip ref */
+		do {
+			p = fdt_offset_ptr(fdt, offset++, 1);
+		} while (p && (*p != '\0'));
+		if (!can_assume(VALID_DTB) && !p)
+			return FDT_END; /* premature end */
+		break;
+
 	case FDT_EXPORT_SYM:
 		/* Skip name */
 		do {
@@ -342,6 +351,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 			break;
 
 		case FDT_IMPORT_SYM:
+		case FDT_BEGIN_NODE_REF:
 			/* Those tags are available at the root level, after the
 			 * root node -> Skip everything until FDT_END
 			 */
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index b6c23ef..8a39458 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -63,6 +63,8 @@ struct fdt_property {
 #define FDT_REF_LOCAL   0x5		/* local phandle reference: offset */
 #define FDT_REF_PHANDLE 0x6		/* external phandle reference: offset,
 					   external label */
+#define FDT_BEGIN_NODE_REF 0x7		/* Same as FDT_BEGIN_NODE but with
+					   reference instead of name */
 #define FDT_END		0x9
 #define FDT_EXPORT_SYM	0xa		/* export symbol: name, phandle value */
 #define FDT_EXPORT_SYM_REF 0xb		/* export symbol: name, phandle value (maybe
-- 
2.52.0

