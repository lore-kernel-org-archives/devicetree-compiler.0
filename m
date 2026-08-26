Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0BC3E5EF3
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737935; cv=none; b=D+Xnz2ki2z4xEEwQD8bQEUJYEiMB+1t7UJcRob8STS1ISlzglFLG7n4tjRi0gsMABZ7hLv9GaIH2jUgILDBddzit05YEion56+rYqn8GDJgbfYc9DjuK/vSBir/MlKLlmaV6VCvItoToOnqDzFv9e623O5GtCCRPqib5IJrN4bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737935; c=relaxed/simple;
	bh=BJ8Fj//sItWxO6bAsVqoNzg9t0tUvTN/tXDeI8l+eu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZTWZpM8RmEa1sn1CUyZBgqpurvfNZYH4wJg3azjEd6Uz/E6pybi/XSy/ZrflywIdKZF1IeePfKMFWtE31adnD0XyV24S/GypguG5rbohSx50854BAKgwS7NoOOsrkZREaK15RxebQin4/SS0SjpwpUp4Frdei5u30lYVtL+TH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VZuRxuea; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VZuRxuea"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5BC7E4E413BF;
	Wed, 26 Aug 2026 09:52:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 30332604EC;
	Wed, 26 Aug 2026 09:52:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB8D011C7AD68;
	Wed, 26 Aug 2026 11:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737926; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hPRG4NHI02HcgZlEIXYdMfsHxz79JcKMx5zp7Mcw034=;
	b=VZuRxueaT67YacXdi1ll1qooce+qLKCKRRQ45OytD68Stn94Fbp4rObNX/8n6urYJiULbb
	Ljy/Oi0sao+EStoRrcoeWedE40f47uNiKpT8isZHwTpnW7o2aI1EHWKXWCCG4MQhdAJJDG
	tDQtbIoZUL3wS9rsjQ/ppZIHr9VygbUEX5/zOw6fJeQq5vDNB00mIlP9Cr7ziEptl7v3r1
	m+lKwPCbWPnIhUUBMTEJrwOpmrNI+OoyGyhQ8yl3ffhCUPVX/XerPye4wuOUQZuEfUbOMl
	QAOdqkt3MyZ/umwut+q3ZTiEXWRCbi/12CDqXs+kWvWxDKB336t6xrxLLDktLQ==
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
Subject: [RFC PATCH v2 31/74] Add support for FDT_IMPORT_SYM dtb tag
Date: Wed, 26 Aug 2026 11:49:00 +0200
Message-ID: <20260826094950.1088288-32-herve.codina@bootlin.com>
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

The FDT_IMPORT_SYM dtb tag is a meta-data tag defining an imported
symbol. It can be present globally in an addon dtb (i.e. outside nodes
definition) meaning that this symbol needs to be resolved when the dtb
is applied.

The tag is followed by the length of the data part (structured tag), two
values and possible alignment paddings:
  - data part length (32bit): strlen(name) + 1 + strlen(compatible) + 1
  - name (string including \0)
      The import symbol name. I.e. the name used to reference this
      imported symbol.
  - compatible (string including \0)
      The compatible string that can be used for symbol resolution.
      This string can be an empty string if it is not relevant.
  - padding:
      Padding (0x00) added to have the next value aligned on 32bit.

Example:
  FDT_IMPORT_SYM 13 'foo1' 'bar,foo' 0x00 0x00 0x00

  This means that 'foo1' is an imported symbol and it is 'bar,foo'
  compatible.

  This is what is encoded in the dtb when the related dts has the
  following imported symbol defined:
    /import/ foo1: "bar,foo";

If several symbols are imported, several FDT_IMPORT_SYM are present.
Each of them defining one imported symbol. For instance, importing
'foo1' ("bar,foo" compatible) and 'baz' ("bar,baz" compatible) leads
to the following sequence:
  FDT_IMPORT_SYM 13 'foo1' 'bar,foo' 0x00 0x00 0x00
  FDT_IMPORT_SYM 12 'baz' 'bar,baz'

If FDT_IMPORT_SYM tags are present in the dtb, they are present after
the root node definition (i.e. after the FDT_END_NODE related to the
first FDT_BEGIN_NODE).

Add support for this new dtb tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c          | 10 ++++++
 flattree.c         | 76 +++++++++++++++++++++++++++++++++++++++++++++-
 libfdt/fdt.c       | 30 ++++++++++++++++++
 libfdt/fdt.h       | 14 +++++++++
 libfdt/fdt_check.c | 56 +++++++++++++++++++++++++++++-----
 5 files changed, 177 insertions(+), 9 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index db5b53dc..7e4c244d 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -224,6 +224,16 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 			continue;
 		}
 
+		if (tag == FDT_IMPORT_SYM) {
+			p = get_structured_tag_data(tag, p, &d, &sz);
+			s = d;
+			d = d + strlen(s) + 1;
+			t = d;
+			printf("%*s// [FDT_IMPORT_SYM] '%s' (%s)\n", depth * shift, "",
+				s, t);
+			continue;
+		}
+
 		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
 			p = get_structured_tag_data(tag, p, &d, &sz);
 
diff --git a/flattree.c b/flattree.c
index 45dc4ed4..4f4a185a 100644
--- a/flattree.c
+++ b/flattree.c
@@ -55,6 +55,7 @@ struct emitter {
 	void (*propdata_phandle_ref)(void *);
 	void (*export_sym)(void *);
 	void (*export_sym_ref)(void *);
+	void (*import_sym)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -124,6 +125,11 @@ static void bin_emit_export_sym_ref(void *e)
 	bin_emit_cell(e, FDT_EXPORT_SYM_REF);
 }
 
+static void bin_emit_import_sym(void *e)
+{
+	bin_emit_cell(e, FDT_IMPORT_SYM);
+}
+
 static struct emitter bin_emitter = {
 	.cell = bin_emit_cell,
 	.string = bin_emit_string,
@@ -136,6 +142,7 @@ static struct emitter bin_emitter = {
 	.propdata_phandle_ref = bin_emit_propdata_phandle_ref,
 	.export_sym = bin_emit_export_sym,
 	.export_sym_ref = bin_emit_export_sym_ref,
+	.import_sym = bin_emit_import_sym,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -279,6 +286,17 @@ static void asm_emit_export_sym_ref(void *e)
 	asm_emit_cell(e, FDT_EXPORT_SYM_REF);
 }
 
+static void asm_emit_import_sym(void *e)
+{
+	/*
+	 * Import symbols are an feature introduced for addons.
+	 * Addons device-tree blob have to reason to be in the asm format.
+	 *
+	 * Need to be implemented if really needed.
+	 */
+	die("FDT_IMPORT_SYM not supported in asm output\n");
+}
+
 static struct emitter asm_emitter = {
 	.cell = asm_emit_cell,
 	.string = asm_emit_string,
@@ -291,6 +309,7 @@ static struct emitter asm_emitter = {
 	.propdata_phandle_ref = asm_emit_propdata_phandle_ref,
 	.export_sym = asm_emit_export_sym,
 	.export_sym_ref = asm_emit_export_sym_ref,
+	.import_sym = asm_emit_import_sym,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -470,6 +489,27 @@ static void make_fdt_header(struct fdt_header *fdt,
 		fdt->last_comp_version_w = cpu_to_fdt32(vi->last_comp_version_w);
 }
 
+static void flatten_imports(struct symbol *importsymlist, struct emitter *emit,
+			 void *etarget, struct version_info *vi, uint32_t dt_flags)
+{
+	struct symbol *importsym;
+
+	if (!(vi->flags & FTF_EXPORT_IMPORT_SYM))
+		return;
+
+	if (!(dt_flags & FDT_FLAG_ADDON) && importsymlist)
+		die("Only addons can have an import list\n");
+
+	for_each_symbol(importsymlist, importsym) {
+		emit->import_sym(etarget);
+		emit->cell(etarget, strlen(importsym->name) + 1 +
+			   strlen(importsym->compatible) + 1);
+		emit->string(etarget, importsym->name, 0);
+		emit->string(etarget, importsym->compatible, 0);
+		emit->align(etarget, sizeof(cell_t));
+	}
+}
+
 void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 {
 	struct version_info *vi = NULL;
@@ -492,6 +532,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 	dt_flags |= dti->dtsflags & DTSF_ADDON ? FDT_FLAG_ADDON : 0;
 
 	flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
+	flatten_imports(dti->importsymlist, &bin_emitter, &dtbuf, vi, dt_flags);
 	bin_emit_cell(&dtbuf, FDT_END);
 
 	reservebuf = flatten_reserve_list(dti->reservelist, vi);
@@ -583,6 +624,9 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	const char *symprefix = "dt";
 	uint32_t dt_flags = 0;
 
+	if (dti->importsymlist)
+		die("Import symbols not supported in asm format\n");
+
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
 			vi = &version_table[i];
@@ -808,6 +852,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
 		case FDT_PROPDATA_PHANDLE_REF:
 		case FDT_EXPORT_SYM:
 		case FDT_EXPORT_SYM_REF:
+		case FDT_IMPORT_SYM:
 			return tag;
 		default:
 			break;
@@ -903,6 +948,22 @@ static struct property *flat_read_property(struct inbuf *dtbuf,
 	return build_property(name, val, NULL);
 }
 
+static struct symbol *flat_read_importsym(struct inbuf *inb)
+{
+	struct inbuf subbuf;
+	uint32_t len;
+	const char *name;
+	const char *compatible;
+
+	len = flat_read_word(inb);
+	flat_read_subbuf(inb, &subbuf, len);
+	flat_realign(inb, sizeof(uint32_t));
+
+	name = flat_read_string_norealign(&subbuf);
+	compatible =  flat_read_string_norealign(&subbuf);
+
+	return build_importsym(name, compatible, NULL);
+}
 
 static struct reserve_info *flat_read_mem_reserve(struct inbuf *inb)
 {
@@ -1115,6 +1176,8 @@ struct dt_info *dt_from_blob(const char *fname)
 	int sizeleft;
 	struct reserve_info *reservelist;
 	struct node *tree;
+	struct symbol *importsymlist = NULL;
+	struct symbol *importsym;
 	uint32_t val;
 	int flags = 0;
 	unsigned int dtsflags = DTSF_V1;
@@ -1231,6 +1294,17 @@ struct dt_info *dt_from_blob(const char *fname)
 	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
 
 	val = flat_read_tag(&dtbuf);
+
+	if (dtsflags & DTSF_ADDON) {
+		if (flags & FTF_EXPORT_IMPORT_SYM) {
+			while (val == FDT_IMPORT_SYM) {
+				importsym = flat_read_importsym(&dtbuf);
+				add_symbol(&importsymlist, importsym);
+				val = flat_read_tag(&dtbuf);
+			}
+		}
+	}
+
 	if (val != FDT_END)
 		die("Device tree blob doesn't end with FDT_END\n");
 
@@ -1241,5 +1315,5 @@ struct dt_info *dt_from_blob(const char *fname)
 	if (get_subnode(tree, "__fixups__") || get_subnode(tree, "__local_fixups__"))
 		dtsflags |= DTSF_PLUGIN;
 
-	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys, NULL);
+	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys, importsymlist);
 }
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 9bab9149..b48c3248 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -363,6 +363,34 @@ static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffs
 		offset = sum;
 		break;
 
+	case FDT_IMPORT_SYM:
+		tmp_offset = fdt_get_structured_tag_data(tag, fdt, offset, &len);
+		if (tmp_offset < 0)
+			return FDT_END; /* premature end */
+
+		sum = tmp_offset + len;
+
+		/* Check name */
+		do {
+			p = fdt_offset_ptr(fdt, tmp_offset++, 1);
+		} while (p && (*p != '\0'));
+		if (!can_assume(VALID_DTB) && !p)
+			return FDT_END; /* premature end */
+
+		/* Check compatible */
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
@@ -395,6 +423,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
 	case FDT_PROPDATA_PHANDLE_REF:
 	case FDT_EXPORT_SYM:
 	case FDT_EXPORT_SYM_REF:
+	case FDT_IMPORT_SYM:
 		return false;
 	default:
 		break;
@@ -452,6 +481,7 @@ bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
 	case FDT_PROPDATA_PHANDLE_REF:
 	case FDT_EXPORT_SYM:
 	case FDT_EXPORT_SYM_REF:
+	case FDT_IMPORT_SYM:
 		return true;
 
 	default:
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 624491a0..04f47784 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -140,6 +140,20 @@ struct fdt_property {
  */
 #define FDT_EXPORT_SYM_REF FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0x2001)
 
+/*
+ * Import symbol tag (meta-data). varlen: name, compatible
+ *
+ * It defines an imported symbol. It can be present globally in an addon dtb
+ * (i.e. outside nodes definition) meaning that this symbol needs to be resolved
+ * when the dtb is applied.
+ *
+ * name: import symbol name, i.e. the name used to reference this imported
+ *       symbol.
+ * compatible: compatible string that can be used for symbol resolution.
+ *             This string can be an empty string if it is not relevant.
+ */
+#define FDT_IMPORT_SYM	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0x2100)
+
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 19b35c8b..7ce3fdd2 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -20,8 +20,9 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 	const void *prop = NULL;
 	const char *propname;
 	int proplen;
-	bool expect_end = false;
+	bool root_node_found = false;
 	bool subnode_found = false;
+	bool import_sym_found = false;
 	const fdt32_t *pfdt32;
 	const char *str;
 	uint32_t val;
@@ -50,10 +51,6 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 		if (nextoffset < 0)
 			return nextoffset;
 
-		/* If we see two root nodes, something is wrong */
-		if (expect_end && tag != FDT_END && tag != FDT_NOP)
-			return -FDT_ERR_BADSTRUCTURE;
-
 		switch (tag) {
 		case FDT_NOP:
 			break;
@@ -70,10 +67,20 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			if (depth > INT_MAX)
 				return -FDT_ERR_BADSTRUCTURE;
 
-			/* The root node must have an empty name */
+			/* Root node specific checks */
 			if (depth == 1) {
 				const char *name;
 
+				/* If we see two root nodes, something is wrong */
+				if (root_node_found)
+					return -FDT_ERR_BADSTRUCTURE;
+				root_node_found = true;
+
+				/* Import symbols must be after the root node */
+				if (import_sym_found)
+					return -FDT_ERR_BADSTRUCTURE;
+
+				/* The root node must have an empty name */
 				name = fdt_get_name(fdt, offset, &len);
 				if (!name)
 					return len;
@@ -89,8 +96,6 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			if (depth == 0)
 				return -FDT_ERR_BADSTRUCTURE;
 			depth--;
-			if (depth == 0)
-				expect_end = true;
 			break;
 
 		case FDT_PROP:
@@ -239,6 +244,41 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 
 			break;
 
+		case FDT_IMPORT_SYM:
+			/* Import symbols are supported only in addons */
+			if (!(fdt_dt_flags(fdt) & FDT_FLAG_ADDON))
+				return -FDT_ERR_BADVALUE;
+
+			import_sym_found = true;
+
+			d = fdt_get_structured_tag_data(tag, fdt,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+
+			/* Retrieve the import symbol name */
+			str = fdt_offset_ptr(fdt, d, 1);
+			if (!str)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* Check that the name is not an empty string */
+			len = strlen(str);
+			if (!len)
+				return -FDT_ERR_BADVALUE;
+
+			/* Retrieve the compatible */
+			d += len + 1;
+			str = fdt_offset_ptr(fdt, d, 1);
+			if (!str)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/*
+			 * The compatible string can be an empty string
+			 * -> No additional check
+			 */
+
+			break;
+
 		default:
 			return -FDT_ERR_INTERNAL;
 		}
-- 
2.55.0

