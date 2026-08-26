Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3EA3BE650;
	Wed, 26 Aug 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737881; cv=none; b=b0ctt6/ecJ7JEyQezmVzAUhrWv7dopqD9rUxBXOwciQJbPL/EG+s1HC/QsPtIPhfi6MvfxrBytxrktwKxou7MzDXt7sxNQO7v04Wbz5EtnJ7h4m8XNDD46fj6MvSiYGIOpTavEEPFO5DKBytqT+I5yNb3AVmVIeHGOJ+/4heK04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737881; c=relaxed/simple;
	bh=8xQx1dcmDpBPqlITQY/JTLwfrdw8dGAx2ZQrD2sD/u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcoJ9AeHRmhwTFFJOQ/Ge30c/MI9Y8h4Jd8mlQze3FH9mFCoDiPgEhBk05uejP/WqTCJZ/5enJvTNDiQKxbM4XD3qmkhJc34NdAJMLORtTZ4PwypJg8LhAyA6LZ6XrNcvie5wMPLi+SoHekIhalJwW7Lb+R6g33C64pBMi5Hx70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pl8LKskT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pl8LKskT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2F0134E413BF;
	Wed, 26 Aug 2026 09:51:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0A9C604EC;
	Wed, 26 Aug 2026 09:51:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9394D11C780F5;
	Wed, 26 Aug 2026 11:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737869; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mhdSEBHP6UBurcoeQQmbuoMjV9bmB9BBkPk4XB+lPzQ=;
	b=Pl8LKskTRCyRmJX6oFNMwhS3JcuCHMyEeuB1lazHY7RjYIUhNE5BydR12hd6xHwmeW/6Z8
	rJfVmqtLANLMgLhx+s3PszpfjHgN/JsIDfdgzA8+7U37YwDdjC2/+UY6dtnH0K0x+vykI6
	5kbwBxQWN9o1Si9IN4N5wofDnjWtaRzf+PBHE250tCH1Qm3K1ppTet197nBIohnYWylAF3
	mnQlmycocO3n0wCbTaD/IMYn2/Vw4aubmP0LZG9Xap5Gc0t0XZwkABf+ESSVU1cU22YI/E
	J4QssZKmbt+y/KjZQf7b1EzNFAOpTidYh4M3mDUNJ4ANAQIz9aZlWIo+fCZOZA==
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
Subject: [RFC PATCH v2 11/74] Add support for FDT_PROPDATA_PHANDLE_REF dtb tag
Date: Wed, 26 Aug 2026 11:48:40 +0200
Message-ID: <20260826094950.1088288-12-herve.codina@bootlin.com>
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

The FDT_PROPDATA_PHANDLE_REF dtb tag is similar to the
FDT_PROPDATA_PHANDLE tag except that it identifies a reference to an
external phandle. The node referenced by the phandle is not present in
the device-tree blob.

The FDT_PROPDATA_PHANDLE_REF dtb tag is a meta-data tag attached to a
property.

It indicates that the property defined before this tag (FDT_PROP) uses a
phandle value and the node related to this phandle value is not local
node (i.e. the node is not present in the device-tree blob). This tag
can be available only in overlay or addon device-tree blobs. The phandle
value used in the property has to be resolved when the device-tree blob
is applied on top of a base device-tree.

The tag is followed by the length of the data part (structured tag), two
values and a possible alignment padding:
 - data part length (32bit): 4 + strlen(label) + 1
 - offset (32bit):
     Offset in the property data where the phandle is available.
 - label (string including \0):
     The label to use to resolve the phandle value.
 - padding:
     Padding (0x00) added to have the next tag aligned on 32bit.

Example:
  FDT_PROP 0x00000008 xxxxxxxx 0x00 0x01 0x02 0x03 0xff 0xff 0xff 0xff
  FDT_PROPDATA_PHANDLE_REF 9 0x00000004 "foo1" 0x00 0x00 0x00

  This means that at the offset 4 of the property data, the value
  (0xffffffff) is an unresolved phandle value and the related node is
  the node referenced by "foo1".

  This is what is encoded in the dtb when the related dts has a property
  with the value set to <0x00010203 &foo1> with 'foo1' a reference
  to an non local node.

If several non local phandles are used in the property data, several
FDT_PROPDATA_PHANDLE_REF are present after the FDT_PROP tag. Each of
them points with its offset value to the position of one phandle.

For instance, if a first property with 8 bytes of data has a
unresolved phandle value at offset 4 referenced by "foo" and a second
property with 16 bytes of data has unresolved phandle values at offset 0
and 8 referenced by "bar" and "baz", the following tags sequence is
present:
  FDT_PROP 0x00000008 xxxxxxxx <data bytes>
  FDT_PROPDATA_PHANDLE_REF 8 0x00000004 "foo"
  FDT_PROP 0x00000010 xxxxxxxx <data bytes>
  FDT_PROPDATA_PHANDLE_REF 8 0x00000000 "bar"
  FDT_PROPDATA_PHANDLE_REF 8 0x00000008 "baz"

Add support for this new dtb tag.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/all/aL-2fmYsbexEtpNp@zatzit/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c          | 10 ++++++
 flattree.c         | 78 +++++++++++++++++++++++++++++++++++++++++++++-
 libfdt/fdt.c       | 30 ++++++++++++++++++
 libfdt/fdt.h       | 14 +++++++++
 libfdt/fdt_check.c | 34 ++++++++++++++++++++
 5 files changed, 165 insertions(+), 1 deletion(-)

diff --git a/fdtdump.c b/fdtdump.c
index 4ee9acc3..2acf3210 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -192,6 +192,16 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 			continue;
 		}
 
+		if (tag == FDT_PROPDATA_PHANDLE_REF) {
+			p = get_structured_tag_data(tag, p, &d, &sz);
+			offset = fdt32_to_cpu(GET_CELL(d));
+			s = d;
+
+			printf("%*s// [FDT_PROPDATA_PHANDLE_REF] %s[%"PRIu32"], ref = %s\n",
+				depth * shift, "", last_prop_name, offset, s);
+			continue;
+		}
+
 		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
 			p = get_structured_tag_data(tag, p, &d, &sz);
 
diff --git a/flattree.c b/flattree.c
index 92d191d5..abc50873 100644
--- a/flattree.c
+++ b/flattree.c
@@ -51,6 +51,7 @@ struct emitter {
 	void (*endnode)(void *, struct label *labels);
 	void (*property)(void *, struct label *labels);
 	void (*propdata_phandle)(void *);
+	void (*propdata_phandle_ref)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -105,6 +106,11 @@ static void bin_emit_propdata_phandle(void *e)
 	bin_emit_cell(e, FDT_PROPDATA_PHANDLE);
 }
 
+static void bin_emit_propdata_phandle_ref(void *e)
+{
+	bin_emit_cell(e, FDT_PROPDATA_PHANDLE_REF);
+}
+
 static struct emitter bin_emitter = {
 	.cell = bin_emit_cell,
 	.string = bin_emit_string,
@@ -114,6 +120,7 @@ static struct emitter bin_emitter = {
 	.endnode = bin_emit_endnode,
 	.property = bin_emit_property,
 	.propdata_phandle = bin_emit_propdata_phandle,
+	.propdata_phandle_ref = bin_emit_propdata_phandle_ref,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -233,6 +240,14 @@ static void asm_emit_propdata_phandle(void *e)
 	asm_emit_cell(e, FDT_PROPDATA_PHANDLE);
 }
 
+static void asm_emit_propdata_phandle_ref(void *e)
+{
+	FILE *f = e;
+
+	fprintf(f, "\t/* FDT_PROPDATA_PHANDLE_REF */\n");
+	asm_emit_cell(e, FDT_PROPDATA_PHANDLE_REF);
+}
+
 static struct emitter asm_emitter = {
 	.cell = asm_emit_cell,
 	.string = asm_emit_string,
@@ -242,6 +257,7 @@ static struct emitter asm_emitter = {
 	.endnode = asm_emit_endnode,
 	.property = asm_emit_property,
 	.propdata_phandle = asm_emit_propdata_phandle,
+	.propdata_phandle_ref = asm_emit_propdata_phandle_ref,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -306,6 +322,16 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 					emit->cell(etarget, m->offset);
 					continue;
 				}
+
+				if (m->ref[0] == '/')
+					die("Phandle uses a non local reference by path (%s)\n",
+					    m->ref);
+
+				emit->propdata_phandle_ref(etarget);
+				emit->cell(etarget, sizeof(cell_t) + strlen(m->ref) + 1);
+				emit->cell(etarget, m->offset);
+				emit->string(etarget, m->ref, 0);
+				emit->align(etarget, sizeof(cell_t));
 			}
 		}
 	}
@@ -626,6 +652,16 @@ static void inbuf_init(struct inbuf *inb, void *base, void *limit)
 	inb->ptr = inb->base;
 }
 
+static void flat_read_subbuf(struct inbuf *inb, struct inbuf *subbuf, int len)
+{
+	if ((inb->ptr + len) > inb->limit)
+		die("Premature end of data parsing flat device tree\n");
+
+	inbuf_init(subbuf, inb->ptr, inb->ptr + len);
+
+	inb->ptr += len;
+}
+
 static void flat_read_chunk(struct inbuf *inb, void *p, int len)
 {
 	if ((inb->ptr + len) > inb->limit)
@@ -704,6 +740,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
 		case FDT_NOP:
 		case FDT_END:
 		case FDT_PROPDATA_PHANDLE:
+		case FDT_PROPDATA_PHANDLE_REF:
 			return tag;
 		default:
 			break;
@@ -713,7 +750,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
 	die("Cannot skip unknown tag 0x%08x\n", tag);
 }
 
-static const char *flat_read_string(struct inbuf *inb)
+static const char *flat_read_string_norealign(struct inbuf *inb)
 {
 	int len = 0;
 	const char *p = inb->ptr;
@@ -729,6 +766,15 @@ static const char *flat_read_string(struct inbuf *inb)
 
 	inb->ptr += len;
 
+	return str;
+}
+
+static const char *flat_read_string(struct inbuf *inb)
+{
+	const char *str;
+
+	str = flat_read_string_norealign(inb);
+
 	flat_realign(inb, sizeof(uint32_t));
 
 	return str;
@@ -844,8 +890,11 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 	struct property *prop = NULL;
 	struct node *node;
 	const char *flatname;
+	struct inbuf subbuf;
 	uint32_t val;
 	uint32_t offset;
+	uint32_t len;
+	const char *str;
 
 	node = build_node(NULL, NULL, NULL);
 
@@ -915,6 +964,33 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			prop->val = data_append_markers(prop->val, m);
 			break;
 
+		case FDT_PROPDATA_PHANDLE_REF:
+			if (!(flags & FTF_PROPDATA_PHANDLE))
+				die("PROPDATA_PHANDLE_REF tag found in flat tree"
+					" version <20\n");
+
+			if (!prop)
+				die("PROPDATA_PHANDLE_REF tag found without a previous PROP tag");
+
+			len = flat_read_word(dtbuf);
+			flat_read_subbuf(dtbuf, &subbuf, len);
+			flat_realign(dtbuf, sizeof(uint32_t));
+
+			offset = flat_read_word(&subbuf);
+			str = flat_read_string_norealign(&subbuf);
+
+			/*
+			 * A reference to a phandle is present in the property
+			 * Mark the whole property as TYPE_UINT32.
+			 */
+			property_add_marker(prop, TYPE_UINT32, 0, NULL);
+
+			/* Mark the offset as a external phandle reference */
+			m = alloc_marker(offset, REF_PHANDLE, xstrdup(str));
+			m->is_local = false;
+			prop->val = data_append_markers(prop->val, m);
+			break;
+
 		default:
 			die("Invalid opcode word %08x in device tree blob\n",
 			    val);
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 3762fbef..d23b886b 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -281,6 +281,33 @@ static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffs
 		offset = sum;
 		break;
 
+	case FDT_PROPDATA_PHANDLE_REF:
+		tmp_offset = fdt_get_structured_tag_data(tag, fdt, offset, &len);
+		if (tmp_offset < 0)
+			return FDT_END; /* premature end */
+
+		sum = tmp_offset + len;
+
+		/* Check offset value */
+		tmp32p = fdt_offset_ptr(fdt, tmp_offset, sizeof(*tmp32p));
+		if (!can_assume(VALID_DTB) && !tmp32p)
+			return FDT_END; /* premature end */
+		tmp_offset += sizeof(fdt32_t);
+
+		/* Check ref string */
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
@@ -310,6 +337,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
 	case FDT_NOP:
 	case FDT_END:
 	case FDT_PROPDATA_PHANDLE:
+	case FDT_PROPDATA_PHANDLE_REF:
 		return false;
 	default:
 		break;
@@ -364,6 +392,7 @@ bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
 {
 	switch (tag) {
 	case FDT_PROPDATA_PHANDLE:
+	case FDT_PROPDATA_PHANDLE_REF:
 		return true;
 
 	default:
@@ -377,6 +406,7 @@ bool fdt_tag_is_property_metadata(uint32_t tag)
 {
 	switch (tag) {
 	case FDT_PROPDATA_PHANDLE:
+	case FDT_PROPDATA_PHANDLE_REF:
 		return true;
 	default:
 		break;
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 2f681088..c151aa2b 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -95,6 +95,20 @@ struct fdt_property {
  */
 #define FDT_PROPDATA_PHANDLE   FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0x1000)
 
+/*
+ * external phandle tag (meta-data). varlen: offset, string label
+ *
+ * It indicates that the property defined before this tag (FDT_PROP) uses a
+ * phandle value and the node related to this phandle value is not local
+ * node (i.e. the node is not present in the device-tree blob). The phandle
+ * value used in the property has to be resolved when the device-tree blob
+ * is applied on top of a base device-tree.
+ *
+ * offset: Offset in the property data where the phandle is available
+ * label: The label to use to resolve the phandle value
+ */
+#define FDT_PROPDATA_PHANDLE_REF  FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0x1001)
+
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index ac297841..96dd7dc0 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -22,6 +22,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 	int proplen;
 	bool expect_end = false;
 	const fdt32_t *pfdt32;
+	const char *str;
 	uint32_t val;
 
 	if (can_assume(PERFECT))
@@ -129,6 +130,39 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 				return tmp;
 			break;
 
+		case FDT_PROPDATA_PHANDLE_REF:
+			/* Be sure that a property is available before this tag */
+			if (!prop)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			d = fdt_get_structured_tag_data(tag, fdt,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+
+			/* Retrieve the offset of the phandle in the property */
+			pfdt32 = fdt_offset_ptr(fdt, d, sizeof(*pfdt32));
+			if (!pfdt32)
+				return -FDT_ERR_BADSTRUCTURE;
+			tmp = fdt32_to_cpu(*pfdt32);
+
+			/* Check this offset */
+			if (tmp % sizeof(fdt32_t))
+				return -FDT_ERR_BADVALUE;
+			if ((uint32_t)proplen < tmp + sizeof(fdt32_t))
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* Retrieve the reference */
+			d += sizeof(fdt32_t);
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
-- 
2.55.0

