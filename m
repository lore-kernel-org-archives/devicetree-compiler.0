Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D66C38F950;
	Wed, 26 Aug 2026 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737862; cv=none; b=sj9HlKgQWlYX9KCYD2rLDfqSt9Qda5J2h0rFuWnjHEVmnurJ4M7E7nTst7xbSoB7NDk3USGu6u7s06TXZsxQjV7Rh/EWUH+wcxWwCnRobVUzt856M5xN4ZUe2FC72czTMSnf5BYoAI8htGVAFCDWsQWUDDd8TTrWLNl6M7rTykQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737862; c=relaxed/simple;
	bh=D7xHo4kceGmmFdF/Hb4FSdlIC08QmG4nyyKBF0/fi10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnTRlR7Ppj1D8PavpzsdzoaQNiQggCNaS8egUHY04EF7q6g2vk/mnS1AXqs8EdlO7EOkX5SQ+qoVkdDzvvWo7N1txHF9H4mz3IkKe9AUtGWtQfVIX/jV+jMpFpCYsIZ3leRK+VQnY8af4M4RosvaJBiHyL0LMRcDJMYCKcGZxak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uPaM3St+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uPaM3St+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C703F4E413C3;
	Wed, 26 Aug 2026 09:50:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95BA5604EC;
	Wed, 26 Aug 2026 09:50:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABE3D11C7AD59;
	Wed, 26 Aug 2026 11:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737847; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=gzyjoTJJtakEbX8xtJOVm54sOg+W7HCFXvn1pYX5el0=;
	b=uPaM3St+XGwzsjsxI3pAqpTab4AIJbAtIt7RyuiN8Qw1yStqTuZBX3SMAtEvpbF1eyybBA
	Nceh/n7fMx7xXqNcbvK73+qlMqBrnF/hFLkCRb5usBhUhnf64A24IjOi9lnvlpkiqXY3WS
	7AJOopiVLEzfJ8W1sc4mYJr/W7xFZ5CY0xusU+AgA3mMzWUryTTR8x4gg7WgOyH/C6ROmG
	XLtlv2wk1nqLUMt7Wwv3WI4O0fr9uEebhZeRMP9tRFaxZu/4i4ob6IKyyE+EroP5A1dXPv
	Fpykv8CStRGdMfRHvjj+Im/5irpJkYVh1u9o7ZpmzkFWTiP3gtZTcCVkdwyh1g==
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
Subject: [RFC PATCH v2 07/74] Add support for FDT_PROPDATA_PHANDLE dtb tag
Date: Wed, 26 Aug 2026 11:48:36 +0200
Message-ID: <20260826094950.1088288-8-herve.codina@bootlin.com>
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

FDT_PROPDATA_PHANDLE dtb tag is a meta-data tag attached to a property.

It indicates that the property defined before this tag (FDT_PROP) uses a
phandle value and the node related to this phandle value is local (i.e.
the node is present in the device-tree blob).

It is followed by one value:
 - offset (32bit):
     Offset in the property data where the phandle is available.

Example:
  FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0x04
  FDT_PROPDATA_PHANDLE 0x00000004

  This means that at the offset 4 of the property data, the value
  (0x01020304) is a phandle and the related node is available in the
  dtb.

  This is what is encoded in the dtb when the related dts has a property
  with the value set to <0xcafedeca &foo> with 'foo' a reference to an
  existing node where the phandle value is 0x01020304.

If several local phandles are used in the property data, several
FDT_PROPDATA_PHANDLE are present after the FDT_PROP tag. Each of them
points with its offset value to the position of one phandle.

For instance, if a first property with 8 bytes of data has a phandle
value at offset 4 and a second property with 16 bytes of data has
phandle values at offset 0 and 8, the following tags sequence is
present:
  FDT_PROP 0x00000008 xxxxxxxx <data bytes>
  FDT_PROPDATA_PHANDLE 0x00000004
  FDT_PROP 0x00000010 xxxxxxxx <data bytes>
  FDT_PROPDATA_PHANDLE 0x00000000
  FDT_PROPDATA_PHANDLE 0x00000008

Add support for this new dtb tag.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/all/aL-2fmYsbexEtpNp@zatzit/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 data.c             |  3 ++-
 dtc.h              |  2 ++
 fdtdump.c          | 15 ++++++++++-
 flattree.c         | 63 ++++++++++++++++++++++++++++++++++++++++++++--
 libfdt/fdt.c       | 37 ++++++++++++++++++++++++++-
 libfdt/fdt.h       | 11 ++++++++
 libfdt/fdt_check.c | 46 ++++++++++++++++++++++++++++++---
 libfdt/libfdt.h    |  3 ++-
 treesource.c       |  1 +
 9 files changed, 171 insertions(+), 10 deletions(-)

diff --git a/data.c b/data.c
index 5b25aa06..9bae7047 100644
--- a/data.c
+++ b/data.c
@@ -127,7 +127,7 @@ struct data data_insert_at_marker(struct data d, struct marker *m,
 	return d;
 }
 
-static struct data data_append_markers(struct data d, struct marker *m)
+struct data data_append_markers(struct data d, struct marker *m)
 {
 	struct marker **mp = &d.markers;
 
@@ -288,6 +288,7 @@ struct marker *alloc_marker(unsigned int offset, enum markertype type,
 	m->type = type;
 	m->ref = ref;
 	m->next = NULL;
+	m->is_local = 0;
 
 	return m;
 }
diff --git a/dtc.h b/dtc.h
index ef3f2682..64eaffde 100644
--- a/dtc.h
+++ b/dtc.h
@@ -128,6 +128,7 @@ struct  marker {
 	enum markertype type;
 	unsigned int offset;
 	char *ref;
+	bool is_local;
 	struct marker *next;
 };
 
@@ -187,6 +188,7 @@ struct data data_insert_data(struct data d, struct marker *m, struct data old);
 struct marker *alloc_marker(unsigned int offset, enum markertype type,
 			    char *ref);
 struct data data_add_marker(struct data d, enum markertype type, char *ref);
+struct data data_append_markers(struct data d, struct marker *m);
 
 bool data_is_one_string(struct data d);
 
diff --git a/fdtdump.c b/fdtdump.c
index f26d3a89..4ee9acc3 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -84,8 +84,9 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 	const char *p_strings = (const char *)blob + off_str;
 	uint32_t version = fdt32_to_cpu(bph->version);
 	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
-	uint32_t tag;
+	uint32_t tag, offset;
 	const char *p, *d, *s, *t;
+	const char *last_prop_name = NULL;
 	int depth, sz, shift;
 	int i;
 	uint64_t addr, size;
@@ -138,6 +139,7 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 		        (uintptr_t)p - blob_off - 4, tag, tagname(tag));
 
 		if (tag == FDT_BEGIN_NODE) {
+			last_prop_name = NULL;
 			s = p;
 			p = PALIGN(p + strlen(s) + 1, 4);
 
@@ -151,6 +153,7 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 		}
 
 		if (tag == FDT_END_NODE) {
+			last_prop_name = NULL;
 			depth--;
 
 			printf("%*s};\n", depth * shift, "");
@@ -176,6 +179,16 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 			printf("%*s%s", depth * shift, "", s);
 			utilfdt_print_data(t, sz);
 			printf(";\n");
+			last_prop_name = s;
+			continue;
+		}
+
+		if (tag == FDT_PROPDATA_PHANDLE) {
+			p = get_structured_tag_data(tag, p, &d, &sz);
+			offset = fdt32_to_cpu(GET_CELL(d));
+
+			printf("%*s// [FDT_PROPDATA_PHANDLE] %s[%"PRIu32"]\n", depth * shift, "",
+				last_prop_name, offset);
 			continue;
 		}
 
diff --git a/flattree.c b/flattree.c
index dd451f0c..92d191d5 100644
--- a/flattree.c
+++ b/flattree.c
@@ -15,6 +15,7 @@
 #define FTF_NOPS	0x40
 #define FTF_DTFLAGS	0x80
 #define FTF_LCVERSW	0x100
+#define FTF_PROPDATA_PHANDLE	0x200
 
 static struct version_info {
 	int version;
@@ -38,7 +39,7 @@ static struct version_info {
 	 FTF_LCVERSW},
 	{20, 18, 18, FDT_V20_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
-	 FTF_LCVERSW},
+	 FTF_LCVERSW|FTF_PROPDATA_PHANDLE},
 };
 
 struct emitter {
@@ -49,6 +50,7 @@ struct emitter {
 	void (*beginnode)(void *, struct label *labels);
 	void (*endnode)(void *, struct label *labels);
 	void (*property)(void *, struct label *labels);
+	void (*propdata_phandle)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -98,6 +100,11 @@ static void bin_emit_property(void *e, struct label *labels)
 	bin_emit_cell(e, FDT_PROP);
 }
 
+static void bin_emit_propdata_phandle(void *e)
+{
+	bin_emit_cell(e, FDT_PROPDATA_PHANDLE);
+}
+
 static struct emitter bin_emitter = {
 	.cell = bin_emit_cell,
 	.string = bin_emit_string,
@@ -106,6 +113,7 @@ static struct emitter bin_emitter = {
 	.beginnode = bin_emit_beginnode,
 	.endnode = bin_emit_endnode,
 	.property = bin_emit_property,
+	.propdata_phandle = bin_emit_propdata_phandle,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -217,6 +225,14 @@ static void asm_emit_property(void *e, struct label *labels)
 	asm_emit_cell(e, FDT_PROP);
 }
 
+static void asm_emit_propdata_phandle(void *e)
+{
+	FILE *f = e;
+
+	fprintf(f, "\t/* FDT_PROPDATA_PHANDLE */\n");
+	asm_emit_cell(e, FDT_PROPDATA_PHANDLE);
+}
+
 static struct emitter asm_emitter = {
 	.cell = asm_emit_cell,
 	.string = asm_emit_string,
@@ -225,6 +241,7 @@ static struct emitter asm_emitter = {
 	.beginnode = asm_emit_beginnode,
 	.endnode = asm_emit_endnode,
 	.property = asm_emit_property,
+	.propdata_phandle = asm_emit_propdata_phandle,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -249,6 +266,7 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	struct property *prop;
 	struct node *child;
 	bool seen_name_prop = false;
+	struct marker *m;
 
 	if (tree->deleted)
 		return;
@@ -279,6 +297,17 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 
 		emit->data(etarget, prop->val);
 		emit->align(etarget, sizeof(cell_t));
+
+		if (vi->flags & FTF_PROPDATA_PHANDLE) {
+			m = prop->val.markers;
+			for_each_marker_of_type(m, REF_PHANDLE) {
+				if (m->is_local) {
+					emit->propdata_phandle(etarget);
+					emit->cell(etarget, m->offset);
+					continue;
+				}
+			}
+		}
 	}
 
 	if ((vi->flags & FTF_NAMEPROPS) && !seen_name_prop) {
@@ -674,6 +703,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
 		case FDT_PROP:
 		case FDT_NOP:
 		case FDT_END:
+		case FDT_PROPDATA_PHANDLE:
 			return tag;
 		default:
 			break;
@@ -811,9 +841,11 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 				   struct inbuf *strbuf,
 				   const char *parent_flatname, int flags)
 {
+	struct property *prop = NULL;
 	struct node *node;
 	const char *flatname;
 	uint32_t val;
+	uint32_t offset;
 
 	node = build_node(NULL, NULL, NULL);
 
@@ -826,8 +858,8 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 		node->name = xstrdup(flatname);
 
 	do {
-		struct property *prop;
 		struct node *child;
+		struct marker *m;
 
 		val = flat_read_tag(dtbuf);
 		switch (val) {
@@ -840,11 +872,13 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			break;
 
 		case FDT_BEGIN_NODE:
+			prop = NULL;
 			child = unflatten_tree(dtbuf,strbuf, flatname, flags);
 			add_child(node, child);
 			break;
 
 		case FDT_END_NODE:
+			prop = NULL;
 			break;
 
 		case FDT_END:
@@ -859,6 +893,28 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			/* Ignore */
 			break;
 
+		case FDT_PROPDATA_PHANDLE:
+			if (!(flags & FTF_PROPDATA_PHANDLE))
+				die("PROPDATA_PHANDLE tag found in flat tree"
+				    " version <20\n");
+
+			if (!prop)
+				die("PROPDATA_PHANDLE tag found without a previous PROP tag");
+
+			offset = flat_read_word(dtbuf);
+
+			/*
+			 * A reference to a phandle is present in the property
+			 * Mark the whole property as TYPE_UINT32.
+			 */
+			property_add_marker(prop, TYPE_UINT32, 0, NULL);
+
+			/* Mark the offset as a local phandle reference */
+			m = alloc_marker(offset, REF_PHANDLE, NULL);
+			m->is_local = true;
+			prop->val = data_append_markers(prop->val, m);
+			break;
+
 		default:
 			die("Invalid opcode word %08x in device tree blob\n",
 			    val);
@@ -981,6 +1037,9 @@ struct dt_info *dt_from_blob(const char *fname)
 	if (version >= 18)
 		flags |= FTF_DTFLAGS | FTF_LCVERSW;
 
+	if (version >= 20)
+		flags |= FTF_PROPDATA_PHANDLE;
+
 	inbuf_init(&memresvbuf,
 		   blob + off_mem_rsvmap, blob + totalsize);
 	inbuf_init(&dtbuf, blob + off_dt, blob + totalsize);
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 8c026f26..3762fbef 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -213,7 +213,7 @@ int fdt_get_structured_tag_data(uint32_t tag, const void *fdt, int offset,
 
 static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffset)
 {
-	const fdt32_t *tagp, *lenp;
+	const fdt32_t *tagp, *lenp, *tmp32p;
 	uint32_t tag, len, sum;
 	int offset = startoffset;
 	int tmp_offset;
@@ -262,6 +262,25 @@ static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffs
 	case FDT_NOP:
 		break;
 
+	case FDT_PROPDATA_PHANDLE:
+		tmp_offset = fdt_get_structured_tag_data(tag, fdt, offset, &len);
+		if (tmp_offset < 0)
+			return FDT_END; /* premature end */
+
+		sum = tmp_offset + len;
+
+		if (!can_assume(VALID_DTB) && len < FDT_CELLSIZE)
+			return FDT_END; /* premature end */
+
+		/* Check offset value */
+		tmp32p = fdt_offset_ptr(fdt, tmp_offset, sizeof(*tmp32p));
+		if (!can_assume(VALID_DTB) && !tmp32p)
+			return FDT_END; /* premature end */
+
+		/* Skip the whole data bloc */
+		offset = sum;
+		break;
+
 	default:
 		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
 			return FDT_END;
@@ -290,6 +309,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
 	case FDT_PROP:
 	case FDT_NOP:
 	case FDT_END:
+	case FDT_PROPDATA_PHANDLE:
 		return false;
 	default:
 		break;
@@ -342,11 +362,26 @@ uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *nextoffset,
 
 bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
 {
+	switch (tag) {
+	case FDT_PROPDATA_PHANDLE:
+		return true;
+
+	default:
+		break;
+	}
+
 	return false;
 }
 
 bool fdt_tag_is_property_metadata(uint32_t tag)
 {
+	switch (tag) {
+	case FDT_PROPDATA_PHANDLE:
+		return true;
+	default:
+		break;
+	}
+
 	return false;
 }
 
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 7c59fed2..2f681088 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -84,6 +84,17 @@ struct fdt_property {
 #define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
 #define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)
 
+/*
+ * local phandle tag (meta-data). 1 cell: offset
+ *
+ * It indicates that the property defined before this tag (FDT_PROP) uses a
+ * phandle value and the node related to this phandle value is local (i.e.
+ * the node is present in the device-tree blob).
+ *
+ * offset: Offset in the property data where the phandle is available
+ */
+#define FDT_PROPDATA_PHANDLE   FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0x1000)
+
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 2fd5b61d..ac297841 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -14,12 +14,15 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 {
 	int err;
 	int num_memrsv;
-	int offset, nextoffset = 0;
+	int offset, nextoffset = 0, d, tmp;
 	uint32_t tag;
 	unsigned int depth = 0;
-	const void *prop;
+	const void *prop = NULL;
 	const char *propname;
+	int proplen;
 	bool expect_end = false;
+	const fdt32_t *pfdt32;
+	uint32_t val;
 
 	if (can_assume(PERFECT))
 		return 0;
@@ -58,6 +61,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			return 0;
 
 		case FDT_BEGIN_NODE:
+			prop = NULL;
 			depth++;
 			if (depth > INT_MAX)
 				return -FDT_ERR_BADSTRUCTURE;
@@ -77,6 +81,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			break;
 
 		case FDT_END_NODE:
+			prop = NULL;
 			if (depth == 0)
 				return -FDT_ERR_BADSTRUCTURE;
 			depth--;
@@ -86,9 +91,42 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 
 		case FDT_PROP:
 			prop = fdt_getprop_by_offset(fdt, offset, &propname,
-						     &err);
+						     &proplen);
 			if (!prop)
-				return err;
+				return proplen;
+			break;
+
+		case FDT_PROPDATA_PHANDLE:
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
+			/* Retrieve the phandle value from the property */
+			pfdt32 = prop;
+			pfdt32 += tmp / sizeof(fdt32_t);
+			val = fdt32_ld(pfdt32);
+
+			/* Check the phandle value */
+			tmp = fdt_node_offset_by_phandle(fdt, val);
+			if (tmp < 0)
+				return tmp;
 			break;
 
 		default:
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 5e1e0d06..ee811266 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -150,7 +150,8 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
  * be set to the offset immediately following the tag.
  *
  * returns:
- *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_END),
+ *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_END
+ *	or any other known tags),
  *	FDT_END, if offset is out of bounds
  */
 uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
diff --git a/treesource.c b/treesource.c
index bf648bf6..0e33e3e1 100644
--- a/treesource.c
+++ b/treesource.c
@@ -168,6 +168,7 @@ static struct marker **add_marker(struct marker **mi,
 	nm->offset = offset;
 	nm->ref = ref;
 	nm->next = *mi;
+	nm->is_local = 0;
 	*mi = nm;
 
 	return &nm->next;
-- 
2.55.0

