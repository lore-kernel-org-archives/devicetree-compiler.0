Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576F3350A29;
	Mon, 12 Jan 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227666; cv=none; b=Tz0SLQk3V6ZhG6lQIS94MISDe5cJa+6q8/M5gDGUSe5ZrcQyHhkcTLW3vKtHA/zcatIyWM1CoU+EN7/MID2zZUFZJ/7Bjro0gCaomKd45USNibq2oHCrhRRacR+TKK9tZPVg7Ux2YM4uz+BdtMfNeZ8K1qxWJGShfk/I0SEOetE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227666; c=relaxed/simple;
	bh=M1jJiNkil1ogha4+E0blrToU5uOsvyRp3h0wli3MwpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5D5ApyDoK2BoC0m1Wv4eVWQ+1LfMP/3EjjiISUrfvcZD0gd7EdcgHGGy64Ns8Z1wMv97S9E2ATAL7Boy8L0oNYmar0ZKSX7eivjX9buMnJl8wSSKMwAe3qVSybrLTiBb7cNAj/uS8yLGwMrbSEd0ME3lgNIf3MMOfzqxwekra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KXxGBT8q; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KXxGBT8q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3CBD21A27FC;
	Mon, 12 Jan 2026 14:21:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11D34606FA;
	Mon, 12 Jan 2026 14:21:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D310E103C9270;
	Mon, 12 Jan 2026 15:20:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227660; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ioSJXthUvZ+YQtI4bflfnpeu6berBaUGVjc2wmCUJk0=;
	b=KXxGBT8qSqMmyPXCjIyptIfSxWz3QUtpK4qGseKP2tn1zPs6EZTog0WnA0E0bvM/P+ph54
	BANVKru3TxYzwZA88pGnLOcpqhbRQe5m/o9vEKNj3imCw/BkDxrKyRBBi9UkvqAP9q+l/y
	7Cu+t/Yhz8HA3xsPd/Ek8dOIfgZ7P3YM4NjZcSAy3nZzHLSdVmqA3zMrgpwAO3cOfCWtrM
	I5dVifdQEp3koF1EOX8sLlOqA7EAEW70VBsZFkFaHy577DyGUgGZ7IWaXcP9Kq77y83VC0
	Vhpnrb3BlZlA9vzp3H9DSn0wy7vBVJqL5CqspC4IM/hlUBvOdd6Z+4yCduOjNA==
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
Subject: [RFC PATCH 25/77] Add support for FDT_EXPORT_SYM dtb tag
Date: Mon, 12 Jan 2026 15:19:15 +0100
Message-ID: <20260112142009.1006236-26-herve.codina@bootlin.com>
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

The FDT_EXPORT_SYM dtb tag is a meta-data tag defining an exported
symbol. It can be present in a node bloc meaning that a symbol is
exported at this node level. The node pointed to by this symbol is a
local node and identified by a phandle value.

The tag is followed by two values and a possible alignment padding:
  - name (string including \0)
      The export symbol name. I.e. the name used to reference this
      exported symbol.
  - padding:
      Padding (0x00) added to have the next value aligned on 32bit.
  - phandle (32bit)
      The phandle value identifying the node referenced by this symbol.

Example:
  FDT_EXPORT_SYM 'foo1' 0x00 0x00 0x00 0x00000004

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
  FDT_EXPORT_SYM 'foo' 0x00 0x00 0x00 0x00000004
  FDT_EXPORT_SYM 'bar' 0x00 0x00 0x00 0x00000008

Add support for this new dtb tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.h                    |  1 +
 fdtdump.c                | 12 +++++++++-
 flattree.c               | 47 ++++++++++++++++++++++++++++++++++++++--
 libfdt/fdt.c             | 17 +++++++++++++++
 libfdt/fdt.h             |  2 ++
 libfdt/libfdt_internal.h |  1 +
 livetree.c               |  2 +-
 7 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/dtc.h b/dtc.h
index 024e172..22816ba 100644
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
index 9b6f41a..d1af5b6 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -57,7 +57,7 @@ static void dump_blob(void *blob, bool debug)
 	const char *p_strings = (const char *)blob + off_str;
 	uint32_t version = fdt32_to_cpu(bph->version);
 	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
-	uint32_t tag, offset;
+	uint32_t tag, offset, val32;
 	const char *p, *s, *t;
 	const char *last_prop_name = NULL;
 	int depth, sz, shift;
@@ -176,6 +176,16 @@ static void dump_blob(void *blob, bool debug)
 			continue;
 		}
 
+		if (tag == FDT_EXPORT_SYM) {
+			s = p;
+			p = PALIGN(p + strlen(s) + 1, 4);
+			val32 = fdt32_to_cpu(GET_CELL(p));
+
+			printf("%*s// [FDT_EXPORT_SYM] '%s' -> phandle 0x%08"PRIx32"\n",
+				depth * shift, "", s, val32);
+			continue;
+		}
+
 		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
 		break;
 	}
diff --git a/flattree.c b/flattree.c
index 36b795d..bd52e81 100644
--- a/flattree.c
+++ b/flattree.c
@@ -15,6 +15,7 @@
 #define FTF_NOPS	0x40
 #define FTF_REF_XXX	0x80
 #define FTF_DTFLAGS	0x100
+#define FTF_EXPORT_IMPORT_SYM 0x200
 
 static struct version_info {
 	int version;
@@ -34,7 +35,7 @@ static struct version_info {
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
 	{18, 18, FDT_V18_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_REF_XXX|
-	 FTF_DTFLAGS},
+	 FTF_DTFLAGS|FTF_EXPORT_IMPORT_SYM},
 };
 
 struct emitter {
@@ -47,6 +48,7 @@ struct emitter {
 	void (*property)(void *, struct label *labels);
 	void (*ref_local)(void *);
 	void (*ref_phandle)(void *);
+	void (*export_sym)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -106,6 +108,11 @@ static void bin_emit_ref_phandle(void *e)
 	bin_emit_cell(e, FDT_REF_PHANDLE);
 }
 
+static void bin_emit_export_sym(void *e)
+{
+	bin_emit_cell(e, FDT_EXPORT_SYM);
+}
+
 static struct emitter bin_emitter = {
 	.cell = bin_emit_cell,
 	.string = bin_emit_string,
@@ -116,6 +123,7 @@ static struct emitter bin_emitter = {
 	.property = bin_emit_property,
 	.ref_local = bin_emit_ref_local,
 	.ref_phandle = bin_emit_ref_phandle,
+	.export_sym = bin_emit_export_sym,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -243,6 +251,14 @@ static void asm_emit_ref_phandle(void *e)
 	asm_emit_cell(e, FDT_REF_PHANDLE);
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
@@ -253,6 +269,7 @@ static struct emitter asm_emitter = {
 	.property = asm_emit_property,
 	.ref_local = asm_emit_ref_local,
 	.ref_phandle = asm_emit_ref_phandle,
+	.export_sym = asm_emit_export_sym,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -274,6 +291,7 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 			 void *etarget, struct data *strbuf,
 			 struct version_info *vi)
 {
+	struct symbol *exportsym;
 	struct property *prop;
 	struct node *child;
 	bool seen_name_prop = false;
@@ -342,6 +360,18 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 		emit->align(etarget, sizeof(cell_t));
 	}
 
+	if (vi->flags & FTF_EXPORT_IMPORT_SYM) {
+		for_each_symbol(tree->exportsymlist, exportsym) {
+			if (exportsym->is_local) {
+				emit->export_sym(etarget);
+				emit->string(etarget, exportsym->name, 0);
+				emit->align(etarget, sizeof(cell_t));
+				emit->cell(etarget, exportsym->phandle);
+				continue;
+			}
+		}
+	}
+
 	for_each_child(tree, child) {
 		flatten_tree(child, emit, etarget, strbuf, vi);
 	}
@@ -820,9 +850,11 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 		node->name = xstrdup(flatname);
 
 	do {
+		struct symbol *exportsym;
 		struct property *prop;
 		struct node *child;
 		struct marker *m;
+		cell_t phandle;
 
 		val = flat_read_word(dtbuf);
 		switch (val) {
@@ -876,6 +908,17 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			prop->val = data_append_markers(prop->val, m);
 			break;
 
+		case FDT_EXPORT_SYM:
+			if (!(flags & FTF_EXPORT_IMPORT_SYM))
+				die("FDT_EXPORT_SYM tag found in flat tree"
+					" version <18\n");
+			str = flat_read_string(dtbuf);
+			phandle = flat_read_word(dtbuf);
+			exportsym = build_exportsym(str, NULL, phandle, NULL);
+			exportsym->is_local = true;
+			add_symbol(&node->exportsymlist, exportsym);
+			break;
+
 		default:
 			die("Invalid opcode word %08x in device tree blob\n",
 			    val);
@@ -996,7 +1039,7 @@ struct dt_info *dt_from_blob(const char *fname)
 	}
 
 	if (version >= 18) {
-		flags |= FTF_REF_XXX | FTF_DTFLAGS;
+		flags |= FTF_REF_XXX | FTF_DTFLAGS | FTF_EXPORT_IMPORT_SYM;
 		dtsflags |= fdt32_to_cpu(fdt->dt_flags) & FDT_FLAG_ADDON ?
 				DTSF_ADDON : 0;
 	}
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 8f3c35d..44d7399 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -232,6 +232,22 @@ uint32_t fdt_next_tag_full(const void *fdt, int startoffset, int *nextoffset)
 			return FDT_END; /* premature end */
 		break;
 
+	case FDT_EXPORT_SYM:
+		/* Skip name */
+		do {
+			p = fdt_offset_ptr(fdt, offset++, 1);
+		} while (p && (*p != '\0'));
+		if (!can_assume(VALID_DTB) && !p)
+			return FDT_END; /* premature end */
+		offset = FDT_CELLALIGN(offset);
+
+		/* Skip phandle */
+		tmp32p = fdt_offset_ptr(fdt, offset, sizeof(*tmp32p));
+		if (!can_assume(VALID_DTB) && !tmp32p)
+			return FDT_END; /* premature end */
+		offset += sizeof(fdt32_t);
+		break;
+
 	default:
 		return FDT_END;
 	}
@@ -273,6 +289,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 
 		case FDT_REF_LOCAL:
 		case FDT_REF_PHANDLE:
+		case FDT_EXPORT_SYM:
 			/*
 			 * Next tag is a meta-data tag present in the middle
 			 * of the structure -> Skip it and look at next one
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 94f65e6..e85bc07 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -53,6 +53,7 @@ struct fdt_property {
 #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
 #define FDT_FLAG_ADDON  0x1
 #define FDT_TAGSIZE	sizeof(fdt32_t)
+#define FDT_CELLSIZE	sizeof(fdt32_t)
 
 #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
 #define FDT_END_NODE	0x2		/* End node */
@@ -63,6 +64,7 @@ struct fdt_property {
 #define FDT_REF_PHANDLE 0x6		/* external phandle reference: offset,
 					   external label */
 #define FDT_END		0x9
+#define FDT_EXPORT_SYM	0xa		/* export symbol: name, phandle value */
 
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 0e103ca..d80d218 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -9,6 +9,7 @@
 
 #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
 #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
+#define FDT_CELLALIGN(x)	(FDT_ALIGN((x), FDT_CELLSIZE))
 
 int32_t fdt_ro_probe_(const void *fdt);
 #define FDT_RO_PROBE(fdt)						\
diff --git a/livetree.c b/livetree.c
index 7cf3ee5..7efa1da 100644
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
2.52.0

