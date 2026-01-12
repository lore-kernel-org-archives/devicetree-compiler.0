Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8D246783;
	Mon, 12 Jan 2026 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227635; cv=none; b=JFNDDMYjhhAjpVN4d0mx2V6FSUYZcm1EM5AuHamvCrPejZg36mVYJfFsEi0pfn613QEsyFbtWXWMUzNmcsnGi8aPhhynmiwVmXeALftfXBVTGSZFC3WO5MsRPCAYyAt2rDn1eD9uw9L0l/AmLGcBXsQqB8ZTAqLLE8n2N+YyGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227635; c=relaxed/simple;
	bh=ASMfnfySi7bTxNB9DYI439TvBroyPcIu/bYgWZMO3zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m12DZkUkgoqdS0dH+kDA8cuO3CuKkNByidFWQxqvW8Dh0C/XoAjdgT45zg84K/ZuSSBsnAYPwZhX7SOk5mra3XPyhkYoC0ss1LcwlOuHm+Fv78bTi8Qs8b9t8s2pgKWFRchcwCOX1GP1u4sh82CMGAih4G/YcKl6t7xi13mMvwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UUzOLoV1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UUzOLoV1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5EC691A27F2;
	Mon, 12 Jan 2026 14:20:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33F1360760;
	Mon, 12 Jan 2026 14:20:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C82B103C9262;
	Mon, 12 Jan 2026 15:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227631; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VMgqV5/5POLzWoizLuLtWMxKI4gxwI+vjmwg1ydT5ME=;
	b=UUzOLoV1c8ksQuhQ/lO3FvHXP0iRbF9OBoB8XMhkMOLOWPJvu3+unK5Mv2LL82dQJnFXZO
	ISIyXnPjzCeE2uYsvrZ79t3eLKd6T3oW6aF2aCokx7PWPG8lvEedU2VJyjXSvkAZWBQ/9J
	JJzYV17N5SCAGrsuqCX1o5eolvzXyDkw2KoO5JcYvFYPLgj5yHJJMVSfv+2SkQ/hr2J6Wu
	BseJXUp0DJxZ5qwGp2VvCHWMVq+dQNLbgtjrUkGMG8HNR/m93F8mU7LFtNK/5nsw+GIAIz
	vHeOMKs+Zjr3K9RJxmi/lw+RIKwqUlvnCgUS6VJ0OKM2IGsLKnSst2h9TVIseg==
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
Subject: [RFC PATCH 06/77] Add support for FDT_REF_LOCAL dtb tag
Date: Mon, 12 Jan 2026 15:18:56 +0100
Message-ID: <20260112142009.1006236-7-herve.codina@bootlin.com>
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

FDT_REF_LOCAL dtb tag is a meta-data tag attached to a property.

It indicates that the property defined before this tag (FDT_PROP) uses a
phandle value and the node related to this phandle value is local (i.e.
the node is present in the device-tree blob).

It is followed by one value:
 - offset (32bit):
     Offset in the property data where the phandle is available.

Example:
  FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0x04
  FDT_REF_LOCAL 0x00000004

  This means that at the offset 4 of the property data, the value
  (0x01020304) is a phandle and the related node is available in the
  dtb.

  This is what is encoded in the dtb when the related dts has a property
  with the value set to <0xcafedeca &foo> with 'foo' a reference to an
  existing node where the phandle value is 0x01020304.

If several local phandles are used in the property data, several
FDT_REF_LOCAL are present after the FDT_PROP tag. Each of them points
with its offset value to the position of one phandle.

For instance, if a first property with 8 bytes of data has a phandle
value at offset 4 and a second property with 16 bytes of data has
phandle values at offset 0 and 8, the following tags sequence is
present:
  FDT_PROP 0x00000008 xxxxxxxx <data bytes>
  FDT_REF_LOCAL 0x00000004
  FDT_PROP 0x00000010 xxxxxxxx <data bytes>
  FDT_REF_LOCAL 0x00000000
  FDT_REF_LOCAL 0x00000008

Add support for this new dtb tag.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/all/aL-2fmYsbexEtpNp@zatzit/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 data.c       |  1 +
 dtc.h        |  1 +
 fdtdump.c    | 14 +++++++++++++-
 flattree.c   | 47 ++++++++++++++++++++++++++++++++++++++++++++++-
 libfdt/fdt.c | 24 ++++++++++++++++++++++--
 libfdt/fdt.h |  1 +
 6 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/data.c b/data.c
index 11b2169..9bae704 100644
--- a/data.c
+++ b/data.c
@@ -288,6 +288,7 @@ struct marker *alloc_marker(unsigned int offset, enum markertype type,
 	m->type = type;
 	m->ref = ref;
 	m->next = NULL;
+	m->is_local = 0;
 
 	return m;
 }
diff --git a/dtc.h b/dtc.h
index 3bbd97e..965321c 100644
--- a/dtc.h
+++ b/dtc.h
@@ -128,6 +128,7 @@ struct  marker {
 	enum markertype type;
 	unsigned int offset;
 	char *ref;
+	bool is_local;
 	struct marker *next;
 };
 
diff --git a/fdtdump.c b/fdtdump.c
index 95a2274..dffa9a6 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -57,8 +57,9 @@ static void dump_blob(void *blob, bool debug)
 	const char *p_strings = (const char *)blob + off_str;
 	uint32_t version = fdt32_to_cpu(bph->version);
 	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
-	uint32_t tag;
+	uint32_t tag, offset;
 	const char *p, *s, *t;
+	const char *last_prop_name = NULL;
 	int depth, sz, shift;
 	int i;
 	uint64_t addr, size;
@@ -105,6 +106,7 @@ static void dump_blob(void *blob, bool debug)
 		        (uintptr_t)p - blob_off - 4, tag, tagname(tag));
 
 		if (tag == FDT_BEGIN_NODE) {
+			last_prop_name = NULL;
 			s = p;
 			p = PALIGN(p + strlen(s) + 1, 4);
 
@@ -118,6 +120,7 @@ static void dump_blob(void *blob, bool debug)
 		}
 
 		if (tag == FDT_END_NODE) {
+			last_prop_name = NULL;
 			depth--;
 
 			printf("%*s};\n", depth * shift, "");
@@ -143,6 +146,15 @@ static void dump_blob(void *blob, bool debug)
 			printf("%*s%s", depth * shift, "", s);
 			utilfdt_print_data(t, sz);
 			printf(";\n");
+			last_prop_name = s;
+			continue;
+		}
+
+		if (tag == FDT_REF_LOCAL) {
+			offset = fdt32_to_cpu(GET_CELL(p));
+
+			printf("%*s// [FDT_REF_LOCAL] %s[%"PRIu32"]\n", depth * shift, "",
+				last_prop_name, offset);
 			continue;
 		}
 
diff --git a/flattree.c b/flattree.c
index c3887da..5c597ad 100644
--- a/flattree.c
+++ b/flattree.c
@@ -13,6 +13,7 @@
 #define FTF_STRTABSIZE	0x10
 #define FTF_STRUCTSIZE	0x20
 #define FTF_NOPS	0x40
+#define FTF_REF_XXX	0x80
 
 static struct version_info {
 	int version;
@@ -31,7 +32,7 @@ static struct version_info {
 	{17, 16, FDT_V17_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
 	{18, 18, FDT_V18_SIZE,
-	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
+	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_REF_XXX},
 };
 
 struct emitter {
@@ -42,6 +43,7 @@ struct emitter {
 	void (*beginnode)(void *, struct label *labels);
 	void (*endnode)(void *, struct label *labels);
 	void (*property)(void *, struct label *labels);
+	void (*ref_local)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -91,6 +93,11 @@ static void bin_emit_property(void *e, struct label *labels)
 	bin_emit_cell(e, FDT_PROP);
 }
 
+static void bin_emit_ref_local(void *e)
+{
+	bin_emit_cell(e, FDT_REF_LOCAL);
+}
+
 static struct emitter bin_emitter = {
 	.cell = bin_emit_cell,
 	.string = bin_emit_string,
@@ -99,6 +106,7 @@ static struct emitter bin_emitter = {
 	.beginnode = bin_emit_beginnode,
 	.endnode = bin_emit_endnode,
 	.property = bin_emit_property,
+	.ref_local = bin_emit_ref_local,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -210,6 +218,14 @@ static void asm_emit_property(void *e, struct label *labels)
 	asm_emit_cell(e, FDT_PROP);
 }
 
+static void asm_emit_ref_local(void *e)
+{
+	FILE *f = e;
+
+	fprintf(f, "\t/* FDT_REF_LOCAL */\n");
+	asm_emit_cell(e, FDT_REF_LOCAL);
+}
+
 static struct emitter asm_emitter = {
 	.cell = asm_emit_cell,
 	.string = asm_emit_string,
@@ -218,6 +234,7 @@ static struct emitter asm_emitter = {
 	.beginnode = asm_emit_beginnode,
 	.endnode = asm_emit_endnode,
 	.property = asm_emit_property,
+	.ref_local = asm_emit_ref_local,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -242,6 +259,7 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	struct property *prop;
 	struct node *child;
 	bool seen_name_prop = false;
+	struct marker *m;
 
 	if (tree->deleted)
 		return;
@@ -272,6 +290,17 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 
 		emit->data(etarget, prop->val);
 		emit->align(etarget, sizeof(cell_t));
+
+		if (vi->flags & FTF_REF_XXX) {
+			m = prop->val.markers;
+			for_each_marker_of_type(m, REF_PHANDLE) {
+				if (m->is_local) {
+					emit->ref_local(etarget);
+					emit->cell(etarget, m->offset);
+					continue;
+				}
+			}
+		}
 	}
 
 	if ((vi->flags & FTF_NAMEPROPS) && !seen_name_prop) {
@@ -737,6 +766,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 	struct node *node;
 	const char *flatname;
 	uint32_t val;
+	uint32_t offset;
 
 	node = build_node(NULL, NULL, NULL);
 
@@ -751,6 +781,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 	do {
 		struct property *prop;
 		struct node *child;
+		struct marker *m;
 
 		val = flat_read_word(dtbuf);
 		switch (val) {
@@ -782,6 +813,17 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			/* Ignore */
 			break;
 
+		case FDT_REF_LOCAL:
+			if (!(flags & FTF_REF_XXX))
+				die("REF_LOCAL tag found in flat tree"
+				    " version <18\n");
+
+			offset = flat_read_word(dtbuf);
+			m = alloc_marker(offset, REF_PHANDLE, NULL);
+			m->is_local = true;
+			prop->val = data_append_markers(prop->val, m);
+			break;
+
 		default:
 			die("Invalid opcode word %08x in device tree blob\n",
 			    val);
@@ -900,6 +942,9 @@ struct dt_info *dt_from_blob(const char *fname)
 		flags |= FTF_NOPS;
 	}
 
+	if (version >= 18)
+		flags |= FTF_REF_XXX;
+
 	inbuf_init(&memresvbuf,
 		   blob + off_mem_rsvmap, blob + totalsize);
 	inbuf_init(&dtbuf, blob + off_dt, blob + totalsize);
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index ce051a0..7268fb6 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -161,7 +161,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 
 uint32_t fdt_next_tag_full(const void *fdt, int startoffset, int *nextoffset)
 {
-	const fdt32_t *tagp, *lenp;
+	const fdt32_t *tagp, *lenp, *tmp32p;
 	uint32_t tag, len, sum;
 	int offset = startoffset;
 	const char *p;
@@ -209,6 +209,14 @@ uint32_t fdt_next_tag_full(const void *fdt, int startoffset, int *nextoffset)
 	case FDT_NOP:
 		break;
 
+	case FDT_REF_LOCAL:
+		/* Skip offset value */
+		tmp32p = fdt_offset_ptr(fdt, offset, sizeof(*tmp32p));
+		if (!can_assume(VALID_DTB) && !tmp32p)
+			return FDT_END; /* premature end */
+		offset += sizeof(fdt32_t);
+		break;
+
 	default:
 		return FDT_END;
 	}
@@ -239,10 +247,22 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		case FDT_PROP:
 		case FDT_NOP:
 		case FDT_END:
-			/* Next tag is not new tag introduced in v18 -> Ok */
+			/*
+			 * Next tag is not a meta-data tag -> Ok this next tag
+			 * has to be handle by fd_next_tag().
+			 * Filter out any potential meta-data tag returning
+			 * nextoffset pointing to this current next tag.
+			 */
 			*nextoffset = tmp_offset;
 			return tag;
 
+		case FDT_REF_LOCAL:
+			/*
+			 * Next tag is a meta-data tag present in the middle
+			 * of the structure -> Skip it and look at next one
+			 */
+			break;
+
 		default:
 			break;
 		}
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 9372353..f8efdf1 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -55,6 +55,7 @@ struct fdt_property {
 #define FDT_PROP	0x3		/* Property: name off,
 					   size, content */
 #define FDT_NOP		0x4		/* nop */
+#define FDT_REF_LOCAL   0x5		/* local phandle reference: offset */
 #define FDT_END		0x9
 
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
-- 
2.52.0

