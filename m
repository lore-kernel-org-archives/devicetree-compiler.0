Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ADC3DF007
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737920; cv=none; b=oeGcgASPYE3cr9qDM+Wv++wrYCAB/SeM6gXMQA7RPTbHz2DcjHbd2izeY4vsS1EMoiu4OGS4ULVchrssfu3EiL5ROVr+Y0D7WtBFsOhZ1VZB700bey1eyUT/guQfw1Ulrq7W5q6LcGOz1ZW97gs5w7jmU8YsSDZ4A5WKOcL1Gb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737920; c=relaxed/simple;
	bh=AYO+n6Dv9yEKFnwvFGYw7hryLy7gNag7ZWzAOEESmYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icIgpilwmUlb0r4CDh4kxf+T5/9HBPt2nzRyw/Mz5CapKIePPbiOjkQ/g0n9Eak671mRFVS0KUUTeXADClyD/SUxpOe/PWfgtlqqez8k/sLtM+44kYWAIBL6FMOmCeNyOlKw6V5Wvi9ggQ1XcWegVFg40RbxafFLYc6T7TS6AAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yoe7+LR8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yoe7+LR8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 924DA4E413C1;
	Wed, 26 Aug 2026 09:51:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67D2C604EC;
	Wed, 26 Aug 2026 09:51:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BA6511C7AD5F;
	Wed, 26 Aug 2026 11:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737914; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=athVsAniPnfkJrxTge4D86IncTAbVzgSJZKyLxJhcts=;
	b=yoe7+LR8vVAOeMNjVnMd395TUEx+6rCUKoIwSrTAx13BgUFqEDMUINJ8/uHCspZPg9mg7c
	GeDhsms2/p0v/h/cZGjj/zKC9+Wwrz+tQPgfcjXuFybYomzAG3RhZn/5L+jjd+aLQ8Irhk
	P4Tq6+Pucv8fJcHqoPipUUpemIzwoOQjhnc8F0i4JQmp1ng4gbmjbE8GBzJSrAJITBAkpN
	lgWVE0O1XaiWzhK5pcCD5yu76Jw+deh6sRPsusgkXPK67jdoWNnxVt300GTQhj21nnDyzt
	yb8WH9/Y+mcQF9SiEc81S+ahccxzd0JIVbFse0udWqfpMx2GLz9oAlvdzo4Y6w==
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
Subject: [RFC PATCH v2 25/74] Add support for FDT_EXPORT_SYM_REF dtb tag
Date: Wed, 26 Aug 2026 11:48:54 +0200
Message-ID: <20260826094950.1088288-26-herve.codina@bootlin.com>
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

The FDT_EXPORT_SYM_REF dtb tag is similar to the FDT_EXPORT_SYM tag
except that it identifies a reference to an external phandle. The node
referenced by the phandle is not present in the device-tree blob.

The FDT_EXPORT_SYM_REF dtb tag is a meta-data tag defining an exported
symbol. It can be present in a node bloc meaning that a symbol is
exported at this node level. The node pointed to by this symbol is not a
local node (i.e. the node is not present in the device-tree blob.). This
tag can be available only in overlay or addon device-tree blobs. The
symbol has to be resolved when the device-tree blob is applied on top of
a base device-tree.

The tag is followed by the length of the data part (structured tag), two
values and a possible alignment padding:
  - data part length (32bit): strlen(label) + 1 + strlen(name) + 1
  - label (string including \0):
      The label to use to resolve this symbol. This label is the
      reference to the external phandle.
  - name (string including \0)
      The export symbol name. I.e. the name used to reference this
      exported symbol.
  - padding:
      Padding (0x00) added to have the next value aligned on 32bit.

Example:
  FDT_EXPORT_SYM_REF 11 'foo_a' 'foo1' 0x00

  This means that 'foo1' is an exported symbol and the node referenced
  by this symbol is external to the dtb (unresolved symbol). This
  external node is referenced by the "foo_a" label.

  This is what is encoded in the dtb when the related dts has the
  following exported symbol defined:
    /export/ foo1: &foo_a;
  with 'foo_a' a reference to a non local node.

If several non local symbols are exported at a given node level, several
FDT_EXPORT_SYM_REF are present. Each of them defining one symbol.

For instance, exporting 'foo1' pointing the node referenced by 'foo_a'
and exporting 'bar' pointing to the node referenced by 'bar_b' leads to
the following sequence:
  FDT_EXPORT_SYM_REF 11 'foo_a' 'foo1' 0x00
  FDT_EXPORT_SYM_REF 10 'bar_b' 'bar'  0x00 0x00

Add support for this new dtb tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c          |  9 +++++++++
 flattree.c         | 44 ++++++++++++++++++++++++++++++++++++++++++++
 libfdt/fdt.c       | 30 ++++++++++++++++++++++++++++++
 libfdt/fdt.h       | 17 +++++++++++++++++
 libfdt/fdt_check.c | 38 +++++++++++++++++++++++++++++++++++++-
 5 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/fdtdump.c b/fdtdump.c
index f39f78c0..db5b53dc 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -215,6 +215,15 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 			continue;
 		}
 
+		if (tag == FDT_EXPORT_SYM_REF) {
+			p = get_structured_tag_data(tag, p, &d, &sz);
+			t = d;
+			s = d + strlen(t) + 1;
+			printf("%*s// [FDT_EXPORT_SYM_REF] '%s' -> '%s'\n", depth * shift, "",
+				s, t);
+			continue;
+		}
+
 		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
 			p = get_structured_tag_data(tag, p, &d, &sz);
 
diff --git a/flattree.c b/flattree.c
index 84acbb35..4e4727e9 100644
--- a/flattree.c
+++ b/flattree.c
@@ -54,6 +54,7 @@ struct emitter {
 	void (*propdata_phandle)(void *);
 	void (*propdata_phandle_ref)(void *);
 	void (*export_sym)(void *);
+	void (*export_sym_ref)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -118,6 +119,11 @@ static void bin_emit_export_sym(void *e)
 	bin_emit_cell(e, FDT_EXPORT_SYM);
 }
 
+static void bin_emit_export_sym_ref(void *e)
+{
+	bin_emit_cell(e, FDT_EXPORT_SYM_REF);
+}
+
 static struct emitter bin_emitter = {
 	.cell = bin_emit_cell,
 	.string = bin_emit_string,
@@ -129,6 +135,7 @@ static struct emitter bin_emitter = {
 	.propdata_phandle = bin_emit_propdata_phandle,
 	.propdata_phandle_ref = bin_emit_propdata_phandle_ref,
 	.export_sym = bin_emit_export_sym,
+	.export_sym_ref = bin_emit_export_sym_ref,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -264,6 +271,14 @@ static void asm_emit_export_sym(void *e)
 	asm_emit_cell(e, FDT_EXPORT_SYM);
 }
 
+static void asm_emit_export_sym_ref(void *e)
+{
+	FILE *f = e;
+
+	fprintf(f, "\t/* FDT_EXPORT_SYM_REF */\n");
+	asm_emit_cell(e, FDT_EXPORT_SYM_REF);
+}
+
 static struct emitter asm_emitter = {
 	.cell = asm_emit_cell,
 	.string = asm_emit_string,
@@ -275,6 +290,7 @@ static struct emitter asm_emitter = {
 	.propdata_phandle = asm_emit_propdata_phandle,
 	.propdata_phandle_ref = asm_emit_propdata_phandle_ref,
 	.export_sym = asm_emit_export_sym,
+	.export_sym_ref = asm_emit_export_sym_ref,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -323,7 +339,19 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 				emit->cell(etarget, exportsym->phandle);
 				emit->string(etarget, exportsym->name, 0);
 				emit->align(etarget, sizeof(cell_t));
+				continue;
 			}
+
+			if (exportsym->ref[0] == '/')
+				die("Export symbol uses a non local reference by path (%s)\n",
+				    exportsym->ref);
+
+			emit->export_sym_ref(etarget);
+			emit->cell(etarget, strlen(exportsym->ref) + 1 +
+				   strlen(exportsym->name) + 1);
+			emit->string(etarget, exportsym->ref, 0);
+			emit->string(etarget, exportsym->name, 0);
+			emit->align(etarget, sizeof(cell_t));
 		}
 	}
 
@@ -779,6 +807,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
 		case FDT_PROPDATA_PHANDLE:
 		case FDT_PROPDATA_PHANDLE_REF:
 		case FDT_EXPORT_SYM:
+		case FDT_EXPORT_SYM_REF:
 			return tag;
 		default:
 			break;
@@ -933,6 +962,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 	uint32_t offset;
 	uint32_t len;
 	const char *str;
+	const char *str2;
 
 	node = build_node(NULL, NULL, NULL, NULL);
 
@@ -1046,6 +1076,20 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			add_symbol(&node->exportsymlist, exportsym);
 			break;
 
+		case FDT_EXPORT_SYM_REF:
+			if (!(flags & FTF_EXPORT_IMPORT_SYM))
+				die("FDT_EXPORT_SYM_REF tag found in flat tree"
+					" version <20\n");
+			len = flat_read_word(dtbuf);
+			flat_read_subbuf(dtbuf, &subbuf, len);
+			flat_realign(dtbuf, sizeof(uint32_t));
+
+			str = flat_read_string_norealign(&subbuf); /* Ref */
+			str2 = flat_read_string_norealign(&subbuf); /* Name */
+			exportsym = build_exportsym(str2, str, 0, NULL);
+			add_symbol(&node->exportsymlist, exportsym);
+			break;
+
 		default:
 			die("Invalid opcode word %08x in device tree blob\n",
 			    val);
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 92732caf..9bab9149 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -335,6 +335,34 @@ static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffs
 		offset = sum;
 		break;
 
+	case FDT_EXPORT_SYM_REF:
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
@@ -366,6 +394,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
 	case FDT_PROPDATA_PHANDLE:
 	case FDT_PROPDATA_PHANDLE_REF:
 	case FDT_EXPORT_SYM:
+	case FDT_EXPORT_SYM_REF:
 		return false;
 	default:
 		break;
@@ -422,6 +451,7 @@ bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
 	case FDT_PROPDATA_PHANDLE:
 	case FDT_PROPDATA_PHANDLE_REF:
 	case FDT_EXPORT_SYM:
+	case FDT_EXPORT_SYM_REF:
 		return true;
 
 	default:
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index c6a5b3a1..624491a0 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -123,6 +123,23 @@ struct fdt_property {
  */
 #define FDT_EXPORT_SYM	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0x2000)
 
+/*
+ * Export external symbol tag (meta-data). varlen: label, name
+ *
+ * It defines an exported symbol. It can be present in a node bloc meaning that
+ * a symbol is exported at this node level. The node pointed to by this symbol
+ * is not a local node (i.e. the node is not present in the device-tree blob.).
+ * This tag can be available only in overlay or addon device-tree blobs. The
+ * symbol has to be resolved when the device-tree blob is applied on top of a
+ * base device-tree.
+ *
+ * label: Label to use to resolve this symbol. This label is the reference to
+ *        the external phandle.
+ * name: export symbol name, i.e. the name used to reference this exported
+ *       symbol.
+ */
+#define FDT_EXPORT_SYM_REF FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0x2001)
+
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 101efd73..19b35c8b 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -25,6 +25,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 	const fdt32_t *pfdt32;
 	const char *str;
 	uint32_t val;
+	int len;
 
 	if (can_assume(PERFECT))
 		return 0;
@@ -72,7 +73,6 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			/* The root node must have an empty name */
 			if (depth == 1) {
 				const char *name;
-				int len;
 
 				name = fdt_get_name(fdt, offset, &len);
 				if (!name)
@@ -203,6 +203,42 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 
 			break;
 
+		case FDT_EXPORT_SYM_REF:
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
+			/* Retrieve the reference */
+			str = fdt_offset_ptr(fdt, d, 1);
+			if (!str)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* Check that the reference is not an empty string */
+			len = strlen(str);
+			if (!len)
+				return -FDT_ERR_BADVALUE;
+
+			/* Retrieve the export symbol name */
+			d += len + 1;
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
-- 
2.55.0

