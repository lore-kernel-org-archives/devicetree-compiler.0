Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7474B2DECC2;
	Mon, 12 Jan 2026 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227683; cv=none; b=luleG9bCdcLtpirf7OB28GTrTgAu00VPn0ymJ1MRnF+b0UiTYrdB5Xu4X/G0iPEgY8qsSuXnTEO8P9smx50RkTzMydQsCwMuBI8EMZvpy1kVVjznMyKwg7dY0FkLvuX0f1wZUIASiapPm6NDQD5GU2hkJedwhEMVNP3PKNHnMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227683; c=relaxed/simple;
	bh=ZJrs0Z3SKgZFS1A96+FV4YeboNIHPrdwFQ18c6DZA40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqIu1WrbxBMhLEnR11DQ8/Wd4v8KHalt2sZksysw5jGJBIb+YO96KwE84YoHSnT/k85PjcmwsFmUiTYcIJEK7xFtzUM80QudNFSUqnKqFK13m9H4KnCGikuyVByt13wdIVrwgLkA7w3pGHUVJ56h9HOeY1SxUN9xDqWsXC2E6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lpNYi9Rn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lpNYi9Rn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C046AC2086E;
	Mon, 12 Jan 2026 14:20:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43933606FA;
	Mon, 12 Jan 2026 14:21:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AF87103C9262;
	Mon, 12 Jan 2026 15:21:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227675; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=I6GH7vXbKZIW9LpPDtXPJBa156zcpyu+Pq4lngBAFn4=;
	b=lpNYi9RnGPtiZfcIigxV6YodWnu2/5400VoE2MacVxlrkwB+/fR67mD/ZpXtKU/Krt2+9O
	ezv1zFbvNySFxxvDulO5JlT9bfE5W1dUBEA3rnL49AnpoRgS1YcIzHtmKkqPxS4Z9+PHRa
	pq2SM5WnAK3sHrcuz0SX1oEzENkPKKD3E/qdKad1RS9OmyjL0W1df7cUaLo6kypz/1heCP
	OHZ6PY2/PgpfFfpzTtLXopjoTAoskgvabi1yyctXlFLRWXpL25yOZcCHF1hpH9QkGCw/FF
	Ui8AAB+b1pcsQC4UcspZ/TvKqS04udK7kfXR3zcsHPVBnTTL/aaAaCF+UvCUAg==
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
Subject: [RFC PATCH 35/77] Add support for FDT_IMPORT_SYM dtb tag
Date: Mon, 12 Jan 2026 15:19:25 +0100
Message-ID: <20260112142009.1006236-36-herve.codina@bootlin.com>
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

The FDT_IMPORT_SYM dtb tag is a meta-data tag defining an imported
symbol. It can be present globally in an addon dtb (i.e. outside nodes
definition) meaning that this symbol needs to be resolved when the dtb
is applied.

The tag is followed by two values and possible alignment paddings:
  - name (string including \0)
      The import symbol name. I.e. the name used to reference this
      imported symbol.
  - padding:
      Padding (0x00) added to have the next value aligned on 32bit.
  - compatible (string including \0)
      The compatible string that can be used for symbol resolution.
      This string can be an empty string if it is not relevant.
  - padding:
      Padding (0x00) added to have the next value aligned on 32bit.

Example:
  FDT_IMPORT_SYM 'foo1' 0x00 0x00 0x00 'bar,foo'

  This means that 'foo1' is an imported symbol and it is 'bar,foo'
  compatible.

  This is what is encoded in the dtb when the related dts has the
  following imported symbol defined:
    /import/ foo1: "bar,foo";

If several symbols are imported, several FDT_IMPORT_SYM are present.
Each of them defining one imported symbol. For instance, importing
'foo1' ("bar,foo" compatible) and 'baz1' ("bar,baz" compatible) leads
to the following sequence:
  FDT_IMPORT_SYM 'foo1' 0x00 0x00 0x00 'bar,foo'
  FDT_IMPORT_SYM 'baz1' 0x00 0x00 0x00 'bar,baz'

If FDT_IMPORT_SYM tags are present in the dtb, they are present after
the root node definition (i.e. after the FDT_END_NODE related to the
first FDT_BEGIN_NODE).

Add support for this new dtb tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c    | 11 +++++++++
 flattree.c   | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 libfdt/fdt.c | 28 ++++++++++++++++++++++
 libfdt/fdt.h |  1 +
 4 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/fdtdump.c b/fdtdump.c
index 8baadc4..04e6e38 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -198,6 +198,17 @@ static void dump_blob(void *blob, bool debug)
 			continue;
 		}
 
+		if (tag == FDT_IMPORT_SYM) {
+			s = p;
+			p = PALIGN(p + strlen(s) + 1, 4);
+			t = p;
+			p = PALIGN(p + strlen(t) + 1, 4);
+
+			printf("%*s// [FDT_IMPORT_SYM] '%s' (%s)\n", depth * shift, "",
+				s, t);
+			continue;
+		}
+
 		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
 		break;
 	}
diff --git a/flattree.c b/flattree.c
index 47a289f..add02f0 100644
--- a/flattree.c
+++ b/flattree.c
@@ -50,6 +50,7 @@ struct emitter {
 	void (*ref_phandle)(void *);
 	void (*export_sym)(void *);
 	void (*export_sym_ref)(void *);
+	void (*import_sym)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -119,6 +120,11 @@ static void bin_emit_export_sym_ref(void *e)
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
@@ -131,6 +137,7 @@ static struct emitter bin_emitter = {
 	.ref_phandle = bin_emit_ref_phandle,
 	.export_sym = bin_emit_export_sym,
 	.export_sym_ref = bin_emit_export_sym_ref,
+	.import_sym = bin_emit_import_sym,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -274,6 +281,17 @@ static void asm_emit_export_sym_ref(void *e)
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
@@ -286,6 +304,7 @@ static struct emitter asm_emitter = {
 	.ref_phandle = asm_emit_ref_phandle,
 	.export_sym = asm_emit_export_sym,
 	.export_sym = asm_emit_export_sym_ref,
+	.import_sym = asm_emit_import_sym,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -461,6 +480,26 @@ static void make_fdt_header(struct fdt_header *fdt,
 		fdt->dt_flags = cpu_to_fdt32(dt_flags);
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
+		emit->string(etarget, importsym->name, 0);
+		emit->align(etarget, sizeof(cell_t));
+		emit->string(etarget, importsym->compatible, 0);
+		emit->align(etarget, sizeof(cell_t));
+	}
+}
+
 void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 {
 	struct version_info *vi = NULL;
@@ -483,6 +522,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 	dt_flags |= dti->dtsflags & DTSF_ADDON ? FDT_FLAG_ADDON : 0;
 
 	flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
+	flatten_imports(dti->importsymlist, &bin_emitter, &dtbuf, vi, dt_flags);
 	bin_emit_cell(&dtbuf, FDT_END);
 
 	reservebuf = flatten_reserve_list(dti->reservelist, vi);
@@ -574,6 +614,9 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	const char *symprefix = "dt";
 	uint32_t dt_flags = 0;
 
+	if (dti->importsymlist)
+		die("Import symbols not supported in asm format\n");
+
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
 			vi = &version_table[i];
@@ -810,6 +853,16 @@ static struct property *flat_read_property(struct inbuf *dtbuf,
 	return build_property(name, val, NULL);
 }
 
+static struct symbol *flat_read_importsym(struct inbuf *inb)
+{
+	const char *name;
+	const char *compatible;
+
+	name = flat_read_string(inb);
+	compatible =  flat_read_string(inb);
+
+	return build_importsym(name, compatible, NULL);
+}
 
 static struct reserve_info *flat_read_mem_reserve(struct inbuf *inb)
 {
@@ -984,6 +1037,8 @@ struct dt_info *dt_from_blob(const char *fname)
 	int sizeleft;
 	struct reserve_info *reservelist;
 	struct node *tree;
+	struct symbol *importsymlist = NULL;
+	struct symbol *importsym;
 	uint32_t val;
 	int flags = 0;
 	unsigned int dtsflags = 0;
@@ -1098,6 +1153,17 @@ struct dt_info *dt_from_blob(const char *fname)
 	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
 
 	val = flat_read_word(&dtbuf);
+
+	if (dtsflags & DTSF_ADDON) {
+		if (flags & FTF_EXPORT_IMPORT_SYM) {
+			while (val == FDT_IMPORT_SYM) {
+				importsym = flat_read_importsym(&dtbuf);
+				add_symbol(&importsymlist, importsym);
+				val = flat_read_word(&dtbuf);
+			}
+		}
+	}
+
 	if (val != FDT_END)
 		die("Device tree blob doesn't end with FDT_END\n");
 
@@ -1105,5 +1171,5 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	fclose(f);
 
-	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_phys, NULL);
+	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_phys, importsymlist);
 }
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index febfa71..c169dd9 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -271,6 +271,23 @@ uint32_t fdt_next_tag_full(const void *fdt, int startoffset, int *nextoffset)
 			return FDT_END; /* premature end */
 		break;
 
+	case FDT_IMPORT_SYM:
+		/* Skip name */
+		do {
+			p = fdt_offset_ptr(fdt, offset++, 1);
+		} while (p && (*p != '\0'));
+		if (!can_assume(VALID_DTB) && !p)
+			return FDT_END; /* premature end */
+		offset = FDT_CELLALIGN(offset);
+
+		/* Skip compatible */
+		do {
+			p = fdt_offset_ptr(fdt, offset++, 1);
+		} while (p && (*p != '\0'));
+		if (!can_assume(VALID_DTB) && !p)
+			return FDT_END; /* premature end */
+		break;
+
 	default:
 		return FDT_END;
 	}
@@ -286,6 +303,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 {
 	uint32_t tag, tmp_tag;
 	int tmp_offset, tmp_next;
+	int is_skip_to_end = 0;
 
 	/* Retrieve next tag */
 	tag = fdt_next_tag_full(fdt, startoffset, nextoffset);
@@ -300,6 +318,9 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		case FDT_END_NODE:
 		case FDT_PROP:
 		case FDT_NOP:
+			if (is_skip_to_end)
+				break;
+
 		case FDT_END:
 			/*
 			 * Next tag is not a meta-data tag -> Ok this next tag
@@ -320,6 +341,13 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 			 */
 			break;
 
+		case FDT_IMPORT_SYM:
+			/* Those tags are available at the root level, after the
+			 * root node -> Skip everything until FDT_END
+			 */
+			is_skip_to_end = 1;
+			break;
+
 		default:
 			break;
 		}
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index c23723b..b6c23ef 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -67,6 +67,7 @@ struct fdt_property {
 #define FDT_EXPORT_SYM	0xa		/* export symbol: name, phandle value */
 #define FDT_EXPORT_SYM_REF 0xb		/* export symbol: name, phandle value (maybe
 					   unresolved), external label */
+#define FDT_IMPORT_SYM	0xc		/* import symbol: name, compatible */
 
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
-- 
2.52.0

