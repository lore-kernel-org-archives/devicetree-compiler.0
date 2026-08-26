Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDF33D9025;
	Wed, 26 Aug 2026 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738001; cv=none; b=NUJol9BcMLehpDKOVCFn6x64vri4lUGJVR3rQRktI0AyBE7qXYNDI2sjuysZesFjvw5BJGk9r+NESqhcpueCdg7Mwhe2S5mReDa7grdBkq4nJfoJDzRJqXfKiAxIQNagplgN2Dd73ihUHkBhGo02piHzIzp4sycAZA5BQnTW7Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738001; c=relaxed/simple;
	bh=6LxYHe7p3QOVuiPMgefFUTWXsbSkAxNCdPuCY4acJXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2SLG6gI0+Nfb02QeWonqlAiy1EBKpLbCQRQp98yvOA/Kx2crE4w1FcgNaauCFfKkpY2eDnGU7SNujAw+QNVFUIBrCJAprbdv82DFZsMeWsdNOHK0jpxA4ixaMsx2ScLlCES/fA9Jxol1XUFAEP/cZCXyWrEQUg9K5Y9DjRhFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m6jL71lf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m6jL71lf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 458994E413C1;
	Wed, 26 Aug 2026 09:53:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12CE2604EC;
	Wed, 26 Aug 2026 09:53:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8705711C7AD65;
	Wed, 26 Aug 2026 11:53:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737997; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kPsatKdvDw0yzypuViRByxHI29/qFU4BeFECOdEb7kQ=;
	b=m6jL71lftZrcnMTSiUFzphnxf1nSrVYHOOmHnJlRrZC4KJxDJuqGIKmQwRciT9qsT45Bz0
	42yJFkRjtbwwpnHwHvHsGByTqrpocihvyo5pF0Xb61L6gwYIWW3/9oGakRCxahMBcCCdhP
	7fbmaTQSpK+bdQHtr3uk5/MZD7ebtains5u3eXHg5xru0EE2KaHPCBbhemBvi6X3HXkj8X
	R5JMql814Z1ghEDnKP/1S4XKVfFNJ6RY+zYS6CZx5/x1AKmZ9KT9Ea4Qb9hjUU2wBc1dQe
	HH9eTbE4zXHPrmvFPQxBJ0ZxM9ddBZuGBJmlzRM/5rw0N1TFhloK9f+RadVZTA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
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
Subject: [RFC PATCH v2 51/74] Add support for FDT_BEGIN_NODE_REF dtb tag
Date: Wed, 26 Aug 2026 11:49:20 +0200
Message-ID: <20260826094950.1088288-52-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826094950.1088288-1-herve.codina@bootlin.com>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The FDT_BEGIN_NODE_REF dtb tag is a tag defining a referenced node.

This kind of nodes can be present in addon dtbs and identifies a node
external to the addon dtb but modified by the addon.

For instance, if an addon adds a sub-node to a node existing in the
device-tree the addon is applied to, the existing node needs to be
referenced by the addon dtb. This is the purpose of FDT_BEGIN_NODE_REF.

This tag typically identifies what we call orphan nodes in dts.

The structure of FDT_BEGIN_NODE_REF is identical to the structure of
FDT_BEGIN_NODE except that the node name is not present and it is
replaced by the node symbol reference needed to reference the node in
the base device-tree when the addon device-tree blob is applied.

The FDT_BEGIN_NODE_REF block is terminated by a FDT_END_NODE tag.

The FDT_BEGIN_NODE_REF tag is followed by the length of the data part
(structured tag), the node symbol name, a possible alignment padding and
then the node structure. The FDT_BEGIN_NODE_REF block is terminated by a
FDT_END_NODE tag:
  - data part length (32bit): strlen(node symbol name) + 1
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
  FDT_BEGIN_NODE_REF 5 'foo1' 0x00 0x00 0x00 ... FDT_END_NODE

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
and 'bar10' as external nodes leads to the following sequence:
  FDT_BEGIN_NODE_REF 5 'foo1' 0x00 0x00 0x00 ... FDT_END_NODE
  FDT_BEGIN_NODE_REF 6 'bar10' 0x00 0x00 ... FDT_END_NODE

The FDT_BEGIN_NODE_REF can be present only for a top level node.
Subnodes are identified by a FDT_BEGIN_NODE tag.

If FDT_BEGIN_NODE_REF tags are present in the dtb, they are present
after the root node definition (i.e. after the first FDT_BEGIN_NODE
/ FDT_END_NODE block).

Add support for this new dtb tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c                |  12 +++++
 flattree.c               | 114 ++++++++++++++++++++++++++++++++-------
 libfdt/fdt.c             |  95 +++++++++++++++++++++++++++++++-
 libfdt/fdt.h             |  18 +++++++
 libfdt/fdt_check.c       |  47 +++++++++++++++-
 libfdt/fdt_ro.c          |  46 +++++++++++++++-
 libfdt/libfdt_internal.h |  10 ++++
 7 files changed, 317 insertions(+), 25 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index 7e4c244d..d68c07b9 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -206,6 +206,18 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 			continue;
 		}
 
+		if (tag == FDT_BEGIN_NODE_REF) {
+			last_prop_name = NULL;
+
+			p = get_structured_tag_data(tag, p, &d, &sz);
+			s = d;
+
+			printf("%*s&%s {\n", depth * shift, "", s);
+
+			depth++;
+			continue;
+		}
+
 		if (tag == FDT_EXPORT_SYM) {
 			p = get_structured_tag_data(tag, p, &d, &sz);
 			val32 = fdt32_to_cpu(GET_CELL(d));
diff --git a/flattree.c b/flattree.c
index bd6974b8..b5223089 100644
--- a/flattree.c
+++ b/flattree.c
@@ -17,6 +17,7 @@
 #define FTF_LCVERSW	0x100
 #define FTF_PROPDATA_PHANDLE	0x200
 #define FTF_EXPORT_IMPORT_SYM	0x400
+#define FTF_ORPHAN	0x800
 
 static struct version_info {
 	int version;
@@ -40,7 +41,7 @@ static struct version_info {
 	 FTF_LCVERSW},
 	{20, 18, 18, FDT_V20_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
-	 FTF_LCVERSW|FTF_PROPDATA_PHANDLE|FTF_EXPORT_IMPORT_SYM},
+	 FTF_LCVERSW|FTF_PROPDATA_PHANDLE|FTF_EXPORT_IMPORT_SYM|FTF_ORPHAN},
 };
 
 struct emitter {
@@ -56,6 +57,7 @@ struct emitter {
 	void (*export_sym)(void *);
 	void (*export_sym_ref)(void *);
 	void (*import_sym)(void *);
+	void (*beginnode_ref)(void *, struct label *labels);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -130,6 +132,11 @@ static void bin_emit_import_sym(void *e)
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
@@ -143,6 +150,7 @@ static struct emitter bin_emitter = {
 	.export_sym = bin_emit_export_sym,
 	.export_sym_ref = bin_emit_export_sym_ref,
 	.import_sym = bin_emit_import_sym,
+	.beginnode_ref = bin_emit_beginnode_ref,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -297,6 +305,18 @@ static void asm_emit_import_sym(void *e)
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
@@ -310,6 +330,7 @@ static struct emitter asm_emitter = {
 	.export_sym = asm_emit_export_sym,
 	.export_sym_ref = asm_emit_export_sym_ref,
 	.import_sym = asm_emit_import_sym,
+	.beginnode_ref = asm_emit_beginnode_ref,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -340,13 +361,18 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	if (tree->deleted)
 		return;
 
-	emit->beginnode(etarget, tree->labels);
-
-	if (vi->flags & FTF_FULLPATH)
-		emit->string(etarget, tree->fullpath, 0);
-	else
-		emit->string(etarget, tree->name, 0);
+	if ((vi->flags & FTF_ORPHAN) && tree->ref) {
+		emit->beginnode_ref(etarget, tree->labels);
+		emit->cell(etarget, strlen(tree->ref) + 1);
+		emit->string(etarget, tree->ref, 0);
+	} else {
+		emit->beginnode(etarget, tree->labels);
 
+		if (vi->flags & FTF_FULLPATH)
+			emit->string(etarget, tree->fullpath, 0);
+		else
+			emit->string(etarget, tree->name, 0);
+	}
 	emit->align(etarget, sizeof(cell_t));
 
 	if (vi->flags & FTF_EXPORT_IMPORT_SYM) {
@@ -510,6 +536,22 @@ static void flatten_imports(struct symbol *importsymlist, struct emitter *emit,
 	}
 }
 
+static void flatten_orphans(struct node *orphanlist, struct emitter *emit,
+			    void *etarget, struct data *strbuf,
+			    struct version_info *vi, uint32_t dt_flags)
+{
+	struct node *orphan;
+
+	if (!(vi->flags & FTF_ORPHAN))
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
@@ -533,6 +575,9 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 
 	flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
 	flatten_imports(dti->importsymlist, &bin_emitter, &dtbuf, vi, dt_flags);
+	flatten_orphans(dti->orphanlist, &bin_emitter, &dtbuf, &strbuf, vi,
+			dt_flags);
+
 	bin_emit_cell(&dtbuf, FDT_END);
 
 	reservebuf = flatten_reserve_list(dti->reservelist, vi);
@@ -626,6 +671,9 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 
 	if (dti->importsymlist)
 		die("Import symbols not supported in asm format\n");
+	if (dti->orphanlist)
+		die("Orphan nodes not supported in asm format\n");
+
 
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
@@ -850,6 +898,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
 		case FDT_END:
 		case FDT_PROPDATA_PHANDLE:
 		case FDT_PROPDATA_PHANDLE_REF:
+		case FDT_BEGIN_NODE_REF:
 		case FDT_EXPORT_SYM:
 		case FDT_EXPORT_SYM_REF:
 		case FDT_IMPORT_SYM:
@@ -1013,7 +1062,8 @@ static const char *nodename_from_path(const char *ppath, const char *cpath)
 
 static struct node *unflatten_tree(struct inbuf *dtbuf,
 				   struct inbuf *strbuf,
-				   const char *parent_flatname, int flags)
+				   const char *parent_flatname, int flags,
+				   bool is_orphan_node)
 {
 	struct property *prop = NULL;
 	struct node *node;
@@ -1026,14 +1076,22 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
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
+		len = flat_read_word(dtbuf);
+		flat_read_subbuf(dtbuf, &subbuf, len);
+		flat_realign(dtbuf, sizeof(uint32_t));
+
+		str = flat_read_string_norealign(&subbuf);
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
@@ -1053,7 +1111,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 
 		case FDT_BEGIN_NODE:
 			prop = NULL;
-			child = unflatten_tree(dtbuf,strbuf, flatname, flags);
+			child = unflatten_tree(dtbuf, strbuf, flatname, flags, false);
 			add_child(node, child);
 			break;
 
@@ -1151,6 +1209,11 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
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
@@ -1178,6 +1241,8 @@ struct dt_info *dt_from_blob(const char *fname)
 	struct node *tree;
 	struct symbol *importsymlist = NULL;
 	struct symbol *importsym;
+	struct node *orphanlist = NULL;
+	struct node *orphan;
 	uint32_t val;
 	int flags = 0;
 	unsigned int dtsflags = DTSF_V1;
@@ -1276,7 +1341,7 @@ struct dt_info *dt_from_blob(const char *fname)
 		flags |= FTF_DTFLAGS | FTF_LCVERSW;
 
 	if (version >= 20) {
-		flags |= FTF_PROPDATA_PHANDLE | FTF_EXPORT_IMPORT_SYM;
+		flags |= FTF_PROPDATA_PHANDLE | FTF_EXPORT_IMPORT_SYM | FTF_ORPHAN;
 		dtsflags |= fdt32_to_cpu(fdt->dt_flags) & FDT_FLAG_ADDON ?
 				DTSF_ADDON : 0;
 	}
@@ -1291,7 +1356,7 @@ struct dt_info *dt_from_blob(const char *fname)
 	if (val != FDT_BEGIN_NODE)
 		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
 
-	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
+	tree = unflatten_tree(&dtbuf, &strbuf, "", flags, false);
 
 	val = flat_read_tag(&dtbuf);
 
@@ -1303,6 +1368,15 @@ struct dt_info *dt_from_blob(const char *fname)
 				val = flat_read_tag(&dtbuf);
 			}
 		}
+
+		if (flags & FTF_ORPHAN) {
+			while (val == FDT_BEGIN_NODE_REF) {
+				orphan = unflatten_tree(&dtbuf, &strbuf, "", flags,
+							true);
+				addon_add_orphan_node(&orphanlist, orphan);
+				val = flat_read_tag(&dtbuf);
+			}
+		}
 	}
 
 	if (val != FDT_END)
@@ -1316,5 +1390,5 @@ struct dt_info *dt_from_blob(const char *fname)
 		dtsflags |= DTSF_PLUGIN;
 
 	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys,
-			     importsymlist, NULL);
+			     importsymlist, orphanlist);
 }
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index b48c3248..f8dd0862 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -308,6 +308,27 @@ static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffs
 		offset = sum;
 		break;
 
+	case FDT_BEGIN_NODE_REF:
+		tmp_offset = fdt_get_structured_tag_data(tag, fdt, offset, &len);
+		if (tmp_offset < 0)
+			return FDT_END; /* premature end */
+
+		sum = tmp_offset + len;
+
+		/* Check ref */
+		do {
+			p = fdt_offset_ptr(fdt, tmp_offset++, 1);
+		} while (p && (*p != '\0'));
+		if (!can_assume(VALID_DTB) && !p)
+			return FDT_END; /* premature end */
+
+		if (!can_assume(VALID_INPUT) && (uint32_t)tmp_offset > sum)
+			return FDT_END; /* premature end */
+
+		/* Skip the whole data bloc */
+		offset = sum;
+		break;
+
 	case FDT_EXPORT_SYM:
 		tmp_offset = fdt_get_structured_tag_data(tag, fdt, offset, &len);
 		if (tmp_offset < 0)
@@ -424,6 +445,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
 	case FDT_EXPORT_SYM:
 	case FDT_EXPORT_SYM_REF:
 	case FDT_IMPORT_SYM:
+	case FDT_BEGIN_NODE_REF:
 		return false;
 	default:
 		break;
@@ -484,6 +506,7 @@ bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
 	case FDT_IMPORT_SYM:
 		return true;
 
+	case FDT_BEGIN_NODE_REF: /* Not metadata but rather node definition */
 	default:
 		break;
 	}
@@ -506,11 +529,15 @@ bool fdt_tag_is_property_metadata(uint32_t tag)
 
 int fdt_check_node_offset_(const void *fdt, int offset)
 {
+	uint32_t tag;
+
 	if (!can_assume(VALID_INPUT)
 	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
 		return -FDT_ERR_BADOFFSET;
 
-	if (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE)
+
+	tag = fdt_next_tag(fdt, offset, &offset);
+	if (tag != FDT_BEGIN_NODE && tag != FDT_BEGIN_NODE_REF)
 		return -FDT_ERR_BADOFFSET;
 
 	return offset;
@@ -546,6 +573,10 @@ int fdt_root_offset(const void *fdt)
 		case FDT_BEGIN_NODE:
 			return offset;
 
+		case FDT_BEGIN_NODE_REF:
+			/* An orphan node cannot be considered as a "first" node */
+			return -FDT_ERR_NOTFOUND;
+
 		default:
 			break;
 		}
@@ -587,6 +618,10 @@ int fdt_next_node(const void *fdt, int offset, int *depth)
 				(*depth)++;
 			break;
 
+		case FDT_BEGIN_NODE_REF:
+			/* An orphan node cannot be found using fdt_next_node() */
+			return -FDT_ERR_BADSTRUCTURE;
+
 		case FDT_END_NODE:
 			if (depth && ((--(*depth)) < 0))
 				return nextoffset;
@@ -632,6 +667,64 @@ int fdt_next_subnode(const void *fdt, int offset)
 	return offset;
 }
 
+int fdt_check_orphan_offset(const void *fdt, int offset, int *data_offset)
+{
+	int nextoffset;
+	uint32_t tag;
+	int d;
+
+	tag = fdt_next_tag(fdt, offset, &nextoffset);
+	switch (tag) {
+	case FDT_BEGIN_NODE_REF:
+		if (data_offset) {
+			d = fdt_get_structured_tag_data(tag, fdt,
+							offset + FDT_TAGSIZE,
+							NULL);
+			if (d < 0)
+				return d;
+			*data_offset = d;
+		}
+		break;
+	default:
+		return -FDT_ERR_BADOFFSET;
+	}
+
+	return nextoffset;
+}
+
+int fdt_next_orphan_offset(const void *fdt, int offset)
+{
+	int nextoffset = 0;
+	uint32_t tag;
+
+	if (offset < 0)
+		return offset;
+
+	if (offset != 0) {
+		nextoffset = fdt_check_orphan_offset(fdt, offset, NULL);
+		if (nextoffset < 0)
+			return nextoffset;
+	}
+
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+
+		switch (tag) {
+		case FDT_BEGIN_NODE_REF:
+			return offset;
+
+		case FDT_END:
+			if (nextoffset < 0)
+				return nextoffset;
+
+			return -FDT_ERR_NOTFOUND;
+		}
+	} while (tag != FDT_BEGIN_NODE_REF);
+
+	return offset;
+}
+
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
 				 int slen)
 {
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 04f47784..52f5fd5f 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -154,6 +154,24 @@ struct fdt_property {
  */
 #define FDT_IMPORT_SYM	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0x2100)
 
+/*
+ * Node reference tag. varlen: node symbol name
+ *
+ * It defines a node external to the dtb but modified by the dtb. It can be
+ * present in an addon dtb.
+ *
+ * For instance, if an addon adds a sub-node to a node existing in the
+ * device-tree the addon is applied to, the existing node needs to be
+ * referenced by the addon dtb. This is the purpose of FDT_BEGIN_NODE_REF.
+ *
+ * node symbol name: The symbol name used to reference the node in the base
+ *                   device-tree when the addon is applied.
+ *
+ * Following the tag and its related node symbol name, the node structure is
+ * present. After the node structure, the FTD_END_NODE tag is present.
+ */
+#define FDT_BEGIN_NODE_REF FDT_TAG_NO_SKIP(FDT_TAG_DATA_VARLEN, 0x2200)
+
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 7ce3fdd2..d2a959c0 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -23,6 +23,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 	bool root_node_found = false;
 	bool subnode_found = false;
 	bool import_sym_found = false;
+	bool orphan_found = false;
 	const fdt32_t *pfdt32;
 	const char *str;
 	uint32_t val;
@@ -80,6 +81,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 				if (import_sym_found)
 					return -FDT_ERR_BADSTRUCTURE;
 
+				/* Orphan nodes must be after the root node */
+				if (orphan_found)
+					return -FDT_ERR_BADSTRUCTURE;
+
 				/* The root node must have an empty name */
 				name = fdt_get_name(fdt, offset, &len);
 				if (!name)
@@ -133,7 +138,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			val = fdt32_ld(pfdt32);
 
 			/* Check the phandle value */
-			tmp = fdt_node_offset_by_phandle(fdt, val);
+			if (!(fdt_dt_flags(fdt) & FDT_FLAG_ADDON))
+				tmp = fdt_node_offset_by_phandle(fdt, val);
+			else
+				tmp = fdta_node_offset_by_phandle(fdt, val);
 			if (tmp < 0)
 				return tmp;
 			break;
@@ -192,7 +200,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			val = fdt32_ld(pfdt32);
 
 			/* Check the phandle value */
-			tmp = fdt_node_offset_by_phandle(fdt, val);
+			if (!(fdt_dt_flags(fdt) & FDT_FLAG_ADDON))
+				tmp = fdt_node_offset_by_phandle(fdt, val);
+			else
+				tmp = fdta_node_offset_by_phandle(fdt, val);
 			if (tmp < 0)
 				return tmp;
 
@@ -249,6 +260,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			if (!(fdt_dt_flags(fdt) & FDT_FLAG_ADDON))
 				return -FDT_ERR_BADVALUE;
 
+			/* Orphans must be after import symbols */
+			if (orphan_found)
+				return -FDT_ERR_BADSTRUCTURE;
+
 			import_sym_found = true;
 
 			d = fdt_get_structured_tag_data(tag, fdt,
@@ -279,6 +294,34 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 
 			break;
 
+		case FDT_BEGIN_NODE_REF:
+			if (!(fdt_dt_flags(fdt) & FDT_FLAG_ADDON))
+				return -FDT_ERR_BADVALUE;
+
+			prop = NULL;
+			depth++;
+
+			/* Orphan nodes can only be present as top level nodes */
+			if (depth != 1)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			orphan_found = true;
+
+			d = fdt_get_structured_tag_data(tag, fdt,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+
+			/* Retrieve the reference */
+			str = fdt_offset_ptr(fdt, d, 1);
+			if (!str)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* Check that the reference is not an empty string */
+			if (!strlen(str))
+				return -FDT_ERR_BADVALUE;
+			break;
+
 		default:
 			return -FDT_ERR_INTERNAL;
 		}
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index ea6a540d..917ecc33 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -317,6 +317,8 @@ const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
 	const struct fdt_node_header *nh;
 	const char *nameptr;
+	int nextoffset;
+	uint32_t tag;
 	int err;
 
 	if (!nodeoffset) {
@@ -332,6 +334,18 @@ const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
 			goto fail;
 
+	/*
+	 * fdt_check_node_offset_() considers FDT_BEGIN_NODE_REF as a node.
+	 * A FDT_BEGIN_NODE_REF tag, which represents an orphan node, doesn't
+	 * have any 'name' attached but only a reference to the external node
+	 * the orphan node refers to. No way to get a name.
+	 */
+	tag = fdt_next_tag(fdt, nodeoffset, &nextoffset);
+	if (tag == FDT_BEGIN_NODE_REF) {
+		err = FDT_ERR_BADOFFSET;
+		goto fail;
+	}
+
 	nh = fdt_offset_ptr_(fdt, nodeoffset);
 	nameptr = nh->name;
 
@@ -760,7 +774,7 @@ int fdt_node_offset_by_prop_value(const void *fdt, int startoffset,
 	return offset; /* error from fdt_next_node() */
 }
 
-int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
+static int fdt_node_offset_by_phandle_(const void *fdt, int start_node_offset, uint32_t phandle)
 {
 	int offset;
 
@@ -775,7 +789,7 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
 	 * we want, we scan over them again making our way to the next
 	 * node.  Still it's the easiest to implement approach;
 	 * performance can come later. */
-	for (offset = fdt_next_node(fdt, -1, NULL);
+	for (offset = fdt_next_node(fdt, start_node_offset, NULL);
 	     offset >= 0;
 	     offset = fdt_next_node(fdt, offset, NULL)) {
 		if (fdt_get_phandle(fdt, offset) == phandle)
@@ -785,6 +799,34 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
 	return offset; /* error from fdt_next_node() */
 }
 
+int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
+{
+	return fdt_node_offset_by_phandle_(fdt, -1, phandle);
+}
+
+int fdta_node_offset_by_phandle(const void *fdta, uint32_t phandle)
+{
+	int orphan;
+	int node;
+
+	/* Look at root node tree */
+	node = fdt_node_offset_by_phandle_(fdta, -1, phandle);
+	if (node >= 0)
+		return node;
+
+	/* Look at orphans and their trees */
+	fdt_for_each_orphan(orphan, fdta) {
+		if (fdt_get_phandle(fdta, orphan) == phandle)
+			return orphan;
+
+		node = fdt_node_offset_by_phandle_(fdta, orphan, phandle);
+		if (node >= 0)
+			return node;
+	}
+
+	return -FDT_ERR_NOTFOUND;
+}
+
 int fdt_stringlist_contains(const char *strlist, int listlen, const char *str)
 {
 	int len = strlen(str);
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 7ef1d995..be47639d 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -61,6 +61,16 @@ static inline const char *fdt_find_string_(const char *strtab, int tabsize,
 
 int fdt_node_end_offset_(void *fdt, int nodeoffset);
 
+int fdt_check_orphan_offset(const void *fdt, int offset, int *data_offset);
+int fdt_next_orphan_offset(const void *fdt, int offset);
+
+#define fdt_for_each_orphan(orphan, fdt)			\
+	for (orphan = fdt_next_orphan_offset(fdt, 0);		\
+	     orphan >= 0;					\
+	     orphan = fdt_next_orphan_offset(fdt, orphan))
+
+int fdta_node_offset_by_phandle(const void *fdta, uint32_t phandle);
+
 static inline const void *fdt_offset_ptr_(const void *fdt, int offset)
 {
 	return (const char *)fdt + fdt_off_dt_struct(fdt) + offset;
-- 
2.55.0

