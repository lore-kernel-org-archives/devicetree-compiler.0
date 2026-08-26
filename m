Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56323D9665;
	Wed, 26 Aug 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737911; cv=none; b=hyc898KNPt2aiGoThIodbW5AG8Kob/xzYaLg+aYxjfdpyaOH69vnuyP5x9PO6KoScfwexdj7jxcbh3Tt/FxKi+sK2nzdckHdMA2B72foZPXWOfDwjpeQsOn6EeYlSvcMRLwR92SznV+pyBggEWamGgFniF8HiFZMVi6VUrRYclE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737911; c=relaxed/simple;
	bh=vTIi1wfLkG3g2giTz2gEsEHnM2eVclEx2Uj8ZlKHxxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Urgx8nmAjlB5wrU1h+lDC9BD6Efg/NlQeTxpM2H1Yi+a1nxIb3efvpmtTRP806BZJJEI5Q9l5H8RXLE+sWQw3xFCTeRTOKbSs8Z42yd2WLZEQnQjUx7TIGN3k6E9BqrnyxqWOo6Bv8CHgCeuU2+ztiHBiK6eaNY6ar92AOoYC0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0mtePrEP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0mtePrEP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8D1754E413BF;
	Wed, 26 Aug 2026 09:51:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61F70604EC;
	Wed, 26 Aug 2026 09:51:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 525F411C7AD52;
	Wed, 26 Aug 2026 11:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737905; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VaY+fjwAIEwejGpSVj/58AGMV1/GWjDpvp3siuyaRFc=;
	b=0mtePrEPTZDUBY9m23JFf09nERz1arTdoLmM+coLsXoysc4krSlQZpcqEmglb64Y+0Cnq+
	iJ9pXneTiY8vMamrFtrhcdjRGDCsVz6uuxpO0KYh/YOyKDu5HbK+ktqiPnxeuB0dOrND8j
	yob/eO8POe2lYYsG8mHGmdQMrYUtRHGDM2XpqBv/LTxUzgplJVpDPlZSjHmfVhm6jsWHLH
	vZBvu5ErbZrUwN+RtfZikILnLn7/DqnVHdfNQafZu9TVf+dd0VXhm4PONwUpBl3vyGsntL
	0x0l32Gz4W6bWfg9bOAoiqJ/g8hUmpkX6kWv+GIdvSE+OPMyWvkYa5LP4BkIfQ==
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
Subject: [RFC PATCH v2 21/74] Add support for FDT_EXPORT_SYM dtb tag
Date: Wed, 26 Aug 2026 11:48:50 +0200
Message-ID: <20260826094950.1088288-22-herve.codina@bootlin.com>
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

The FDT_EXPORT_SYM dtb tag is a meta-data tag defining an exported
symbol. It can be present in a node bloc meaning that a symbol is
exported at this node level. The node pointed to by this symbol is a
local node and identified by a phandle value.

The tag is followed by the length of the data part (structured tag), two
values and a possible alignment padding:
  - data part length (32bit): 4 + strlen(name) + 1
  - phandle (32bit)
      The phandle value identifying the node referenced by this symbol.
  - name (string including \0)
      The export symbol name. I.e. the name used to reference this
      exported symbol.
  - padding:
      Padding (0x00) added to have the next value aligned on 32bit.

Example:
  FDT_EXPORT_SYM 9 0x00000004 'foo1' 0x00 0x00 0x00

  This means that 'foo1' is an exported symbol and the node referenced
  by this symbol is the node with the phandle value equals 4.

  This is what is encoded in the dtb when the related dts has the
  following exported symbol defined:
    /export/ foo1: &foo;
  with 'foo' a reference to an existing node where the phandle value is
  0x0000004.

If several symbols are exported at a given node level, several
FDT_EXPORT_SYM are present. Each of them defining one symbol.

For instance, exporting 'foo' pointing to phandle 4 and 'bar' pointing
to phandle 8 leads to the following sequence:
  FDT_EXPORT_SYM 8 0x00000004 'foo'
  FDT_EXPORT_SYM 8 0x00000008 'bar'

Add support for this new dtb tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.h                    |  1 +
 fdtdump.c                | 11 ++++++++-
 flattree.c               | 53 ++++++++++++++++++++++++++++++++++++++--
 libfdt/fdt.c             | 29 ++++++++++++++++++++++
 libfdt/fdt.h             | 13 ++++++++++
 libfdt/fdt_check.c       | 40 ++++++++++++++++++++++++++++++
 libfdt/libfdt_internal.h |  1 +
 livetree.c               |  2 +-
 8 files changed, 146 insertions(+), 4 deletions(-)

diff --git a/dtc.h b/dtc.h
index 90341aa9..8a20d6da 100644
--- a/dtc.h
+++ b/dtc.h
@@ -289,6 +289,7 @@ struct symbol *build_exportsym(const char *name, const char *ref, cell_t phandle
 			       struct srcpos *srcpos);
 struct symbol *chain_symbol(struct symbol *first, struct symbol *list);
 struct symbol *reverse_symbol(struct symbol *list);
+void add_symbol(struct symbol **list, struct symbol *new);
 
 struct node *build_node(struct property *proplist, struct node *children,
 			struct symbol *exportsymlist, struct srcpos *srcpos);
diff --git a/fdtdump.c b/fdtdump.c
index 370db848..f39f78c0 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -84,7 +84,7 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 	const char *p_strings = (const char *)blob + off_str;
 	uint32_t version = fdt32_to_cpu(bph->version);
 	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
-	uint32_t tag, offset;
+	uint32_t tag, offset, val32;
 	const char *p, *d, *s, *t;
 	const char *last_prop_name = NULL;
 	int depth, sz, shift;
@@ -206,6 +206,15 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 			continue;
 		}
 
+		if (tag == FDT_EXPORT_SYM) {
+			p = get_structured_tag_data(tag, p, &d, &sz);
+			val32 = fdt32_to_cpu(GET_CELL(d));
+			s = d;
+			printf("%*s// [FDT_EXPORT_SYM] '%s' -> phandle 0x%08"PRIx32"\n",
+				depth * shift, "", s, val32);
+			continue;
+		}
+
 		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
 			p = get_structured_tag_data(tag, p, &d, &sz);
 
diff --git a/flattree.c b/flattree.c
index ac6bcd8f..84acbb35 100644
--- a/flattree.c
+++ b/flattree.c
@@ -16,6 +16,7 @@
 #define FTF_DTFLAGS	0x80
 #define FTF_LCVERSW	0x100
 #define FTF_PROPDATA_PHANDLE	0x200
+#define FTF_EXPORT_IMPORT_SYM	0x400
 
 static struct version_info {
 	int version;
@@ -39,7 +40,7 @@ static struct version_info {
 	 FTF_LCVERSW},
 	{20, 18, 18, FDT_V20_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
-	 FTF_LCVERSW|FTF_PROPDATA_PHANDLE},
+	 FTF_LCVERSW|FTF_PROPDATA_PHANDLE|FTF_EXPORT_IMPORT_SYM},
 };
 
 struct emitter {
@@ -52,6 +53,7 @@ struct emitter {
 	void (*property)(void *, struct label *labels);
 	void (*propdata_phandle)(void *);
 	void (*propdata_phandle_ref)(void *);
+	void (*export_sym)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -111,6 +113,11 @@ static void bin_emit_propdata_phandle_ref(void *e)
 	bin_emit_cell(e, FDT_PROPDATA_PHANDLE_REF);
 }
 
+static void bin_emit_export_sym(void *e)
+{
+	bin_emit_cell(e, FDT_EXPORT_SYM);
+}
+
 static struct emitter bin_emitter = {
 	.cell = bin_emit_cell,
 	.string = bin_emit_string,
@@ -121,6 +128,7 @@ static struct emitter bin_emitter = {
 	.property = bin_emit_property,
 	.propdata_phandle = bin_emit_propdata_phandle,
 	.propdata_phandle_ref = bin_emit_propdata_phandle_ref,
+	.export_sym = bin_emit_export_sym,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -248,6 +256,14 @@ static void asm_emit_propdata_phandle_ref(void *e)
 	asm_emit_cell(e, FDT_PROPDATA_PHANDLE_REF);
 }
 
+static void asm_emit_export_sym(void *e)
+{
+	FILE *f = e;
+
+	fprintf(f, "\t/* FDT_EXPORT_SYM */\n");
+	asm_emit_cell(e, FDT_EXPORT_SYM);
+}
+
 static struct emitter asm_emitter = {
 	.cell = asm_emit_cell,
 	.string = asm_emit_string,
@@ -258,6 +274,7 @@ static struct emitter asm_emitter = {
 	.property = asm_emit_property,
 	.propdata_phandle = asm_emit_propdata_phandle,
 	.propdata_phandle_ref = asm_emit_propdata_phandle_ref,
+	.export_sym = asm_emit_export_sym,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -279,6 +296,7 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 			 void *etarget, struct data *strbuf,
 			 struct version_info *vi)
 {
+	struct symbol *exportsym;
 	struct property *prop;
 	struct node *child;
 	bool seen_name_prop = false;
@@ -296,6 +314,19 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 
 	emit->align(etarget, sizeof(cell_t));
 
+	if (vi->flags & FTF_EXPORT_IMPORT_SYM) {
+		for_each_symbol(tree->exportsymlist, exportsym) {
+			if (exportsym->is_local) {
+				emit->export_sym(etarget);
+				emit->cell(etarget, sizeof(cell_t) +
+					strlen(exportsym->name) + 1);
+				emit->cell(etarget, exportsym->phandle);
+				emit->string(etarget, exportsym->name, 0);
+				emit->align(etarget, sizeof(cell_t));
+			}
+		}
+	}
+
 	for_each_property(tree, prop) {
 		int nameoff;
 
@@ -747,6 +778,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
 		case FDT_END:
 		case FDT_PROPDATA_PHANDLE:
 		case FDT_PROPDATA_PHANDLE_REF:
+		case FDT_EXPORT_SYM:
 			return tag;
 		default:
 			break;
@@ -913,8 +945,10 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 		node->name = xstrdup(flatname);
 
 	do {
+		struct symbol *exportsym;
 		struct node *child;
 		struct marker *m;
+		cell_t phandle;
 
 		val = flat_read_tag(dtbuf);
 		switch (val) {
@@ -997,6 +1031,21 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			prop->val = data_append_markers(prop->val, m);
 			break;
 
+		case FDT_EXPORT_SYM:
+			if (!(flags & FTF_EXPORT_IMPORT_SYM))
+				die("FDT_EXPORT_SYM tag found in flat tree"
+					" version <20\n");
+			len = flat_read_word(dtbuf);
+			flat_read_subbuf(dtbuf, &subbuf, len);
+			flat_realign(dtbuf, sizeof(uint32_t));
+
+			phandle = flat_read_word(&subbuf);
+			str = flat_read_string_norealign(&subbuf);
+			exportsym = build_exportsym(str, NULL, phandle, NULL);
+			exportsym->is_local = true;
+			add_symbol(&node->exportsymlist, exportsym);
+			break;
+
 		default:
 			die("Invalid opcode word %08x in device tree blob\n",
 			    val);
@@ -1120,7 +1169,7 @@ struct dt_info *dt_from_blob(const char *fname)
 		flags |= FTF_DTFLAGS | FTF_LCVERSW;
 
 	if (version >= 20) {
-		flags |= FTF_PROPDATA_PHANDLE;
+		flags |= FTF_PROPDATA_PHANDLE | FTF_EXPORT_IMPORT_SYM;
 		dtsflags |= fdt32_to_cpu(fdt->dt_flags) & FDT_FLAG_ADDON ?
 				DTSF_ADDON : 0;
 	}
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index d23b886b..92732caf 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -308,6 +308,33 @@ static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffs
 		offset = sum;
 		break;
 
+	case FDT_EXPORT_SYM:
+		tmp_offset = fdt_get_structured_tag_data(tag, fdt, offset, &len);
+		if (tmp_offset < 0)
+			return FDT_END; /* premature end */
+
+		sum = tmp_offset + len;
+
+		/* Check phandle */
+		tmp32p = fdt_offset_ptr(fdt, tmp_offset, sizeof(*tmp32p));
+		if (!can_assume(VALID_DTB) && !tmp32p)
+			return FDT_END; /* premature end */
+		tmp_offset += sizeof(fdt32_t);
+
+		/* Check name */
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
 	default:
 		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
 			return FDT_END;
@@ -338,6 +365,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
 	case FDT_END:
 	case FDT_PROPDATA_PHANDLE:
 	case FDT_PROPDATA_PHANDLE_REF:
+	case FDT_EXPORT_SYM:
 		return false;
 	default:
 		break;
@@ -393,6 +421,7 @@ bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
 	switch (tag) {
 	case FDT_PROPDATA_PHANDLE:
 	case FDT_PROPDATA_PHANDLE_REF:
+	case FDT_EXPORT_SYM:
 		return true;
 
 	default:
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 255e9447..c6a5b3a1 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -110,6 +110,19 @@ struct fdt_property {
  */
 #define FDT_PROPDATA_PHANDLE_REF  FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0x1001)
 
+/*
+ * Export symbol tag (meta-data). varlen: name, phandle
+ *
+ * It defines an exported symbol. It can be present in a node bloc meaning that
+ * a symbol is exported at this node level. The node pointed to by this symbol
+ * is a local node and identified by a phandle value.
+ *
+ * phandle: phandle value identifying the node referenced by this symbol
+ * name: export symbol name, i.e. the name used to reference this exported
+ *       symbol.
+ */
+#define FDT_EXPORT_SYM	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0x2000)
+
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 96dd7dc0..101efd73 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -21,6 +21,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 	const char *propname;
 	int proplen;
 	bool expect_end = false;
+	bool subnode_found = false;
 	const fdt32_t *pfdt32;
 	const char *str;
 	uint32_t val;
@@ -63,6 +64,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 
 		case FDT_BEGIN_NODE:
 			prop = NULL;
+			subnode_found = false;
 			depth++;
 			if (depth > INT_MAX)
 				return -FDT_ERR_BADSTRUCTURE;
@@ -83,6 +85,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 
 		case FDT_END_NODE:
 			prop = NULL;
+			subnode_found = true;
 			if (depth == 0)
 				return -FDT_ERR_BADSTRUCTURE;
 			depth--;
@@ -163,6 +166,43 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 				return -FDT_ERR_BADVALUE;
 			break;
 
+		case FDT_EXPORT_SYM:
+			/* Export symbols must be in a node */
+			if (depth == 0)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* and before any properties or subnodes */
+			if (prop || subnode_found)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			d = fdt_get_structured_tag_data(tag, fdt,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+
+			/* Retrieve the phandle value */
+			pfdt32 = fdt_offset_ptr(fdt, d, sizeof(*pfdt32));
+			if (!pfdt32)
+				return -FDT_ERR_BADSTRUCTURE;
+			val = fdt32_ld(pfdt32);
+
+			/* Check the phandle value */
+			tmp = fdt_node_offset_by_phandle(fdt, val);
+			if (tmp < 0)
+				return tmp;
+
+			/* Retrieve the export symbol name */
+			d += sizeof(fdt32_t);
+			str = fdt_offset_ptr(fdt, d, 1);
+			if (!str)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* Check that the name is not an empty string */
+			if (!strlen(str))
+				return -FDT_ERR_BADVALUE;
+
+			break;
+
 		default:
 			return -FDT_ERR_INTERNAL;
 		}
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 47dfc0d4..7ef1d995 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -9,6 +9,7 @@
 
 #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
 #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
+#define FDT_CELLALIGN(x)	(FDT_ALIGN((x), FDT_CELLSIZE))
 
 int32_t fdt_ro_probe_(const void *fdt);
 #define FDT_RO_PROBE(fdt)						\
diff --git a/livetree.c b/livetree.c
index 8c94e81f..35cf1de5 100644
--- a/livetree.c
+++ b/livetree.c
@@ -74,7 +74,7 @@ struct symbol *reverse_symbol(struct symbol *list)
 	return head;
 }
 
-static void add_symbol(struct symbol **list, struct symbol *new)
+void add_symbol(struct symbol **list, struct symbol *new)
 {
 	struct symbol **s;
 
-- 
2.55.0

