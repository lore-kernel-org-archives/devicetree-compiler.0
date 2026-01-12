Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E02DEA86
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227646; cv=none; b=nazObAmCXoCI+PpVwka0Pf5UIoYWoPJYmvha9/OYeqEDTjv5ImZqCC0nv84dHJs4KI7k0M/iWkUi7ArfNqqKqPsUuDgifklm6U7GmhfEpQhOgevpb7WPFlyq+DogZzfV1HDLJ+ZXtsCYIDsfqm1oBWhn9N6IKUY1yTBtfFt233E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227646; c=relaxed/simple;
	bh=qtSYMfEKE7N1RUZ+Et1MCf9TOQxcc6/qt8r1vbidjUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSeJwhR8jK9fGuodoNKV7o8RdOtKfLtYqVvCy/4Ed4gKLO/fvyzVICTgsbIMTMNUxA8EcqKUTpu2C4lMIFZixMf1giqYfeoCJbkieA8Z0R9NEOpUWF2qJ2OfQgF4CEQxmJhyJX9Luy5mb1bKwUpqu9z7Wr4lnDJOQmozwnN4skA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zDzGto/i; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zDzGto/i"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B06071A26D2;
	Mon, 12 Jan 2026 14:20:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86D67606FA;
	Mon, 12 Jan 2026 14:20:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9450A103C9266;
	Mon, 12 Jan 2026 15:20:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227638; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MbYI6yj1uJVvzjpvfvc/MoMnyr+zoT0U56BLtMvMqdk=;
	b=zDzGto/i7u9rJjqABjQYHXFwCjBZM1I7A0OI/FM/F+n5jCXBgFZRzha8W/cFyApQrxZQuH
	hFjXeTST7u7Kib8fxgWOO0aEdYHHMKXAvBn3LO1S1g3Wm8bjCZkUHie76ztfh5kOyCMfeQ
	GzcUt+oGkfP4cmCfuv8KWvGMJYFSOzjK3Eu0rSx1RhGP72fH/IAbCgegnQ8FfkCS+ff0Z9
	YLXYZJDRTPrVuA/ishACjl/2/UoUGqEbNyi3cI/DzR23ADc6KMZ0+OzYOTdqQePOBEAAPf
	XHHgdV91qd7G7uQazHXGzVwZzPRYoi1yJcJtjNFXBCGUrs30ibVZ/grDtD3RAg==
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
Subject: [RFC PATCH 11/77] Add support for FDT_REF_PHANDLE dtb tag
Date: Mon, 12 Jan 2026 15:19:01 +0100
Message-ID: <20260112142009.1006236-12-herve.codina@bootlin.com>
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

The FDT_REF_PHANDLE dtb tag is similar to the FDT_REF_LOCAL tag except
that it identifies a reference to an external phandle. The node
referenced by the phandle is not present in the device-tree blob.

The FDT_REF_PHANDLE dtb tag is a meta-data tag attached to a property.

It indicates that the property defined before this tag (FDT_PROP) uses a
phandle value and the node related to this phandle value is not local
node (i.e. the node is not present in the device-tree blob). This tag
can be available only in overlay or addon device-tree blobs. The phandle
value used in the property has to be resolved when the device-tree blob
is applied on top of a base device-tree.

It is followed by two values and a possible alignment padding:
 - offset (32bit):
     Offset in the property data where the phandle is available.
 - label (string including \0):
     The label to use to resolve the phandle value.
 - padding:
     Padding (0x00) added to have the next tag aligned on 32bit.

Example:
  FDT_PROP 0x00000008 xxxxxxxx 0x00 0x01 0x02 0x03 0xff 0xff 0xff 0xff
  FDT_REF_PHANDLE 0x00000004 "foo1" 0x00 0x00 0x00

  This means that at the offset 4 of the property data, the value
  (0xffffffff) is an unresolved phandle value and the related node is
  the node referenced by "foo1".

  This is what is encoded in the dtb when the related dts has a property
  with the value set to <0x00010203 &foo1> with 'foo1' a reference
  to an non local node.

If several non local phandles are used in the property data, several
FDT_REF_PHANDLE are present after the FDT_PROP tag. Each of them points
with its offset value to the position of one phandle.

For instance, if a first property with 8 bytes of data has a
unresolved phandle value at offset 4 referenced by "foo" and a second
property with 16 bytes of data has unresolved phandle values at offset 0
and 8 referenced by "bar" and "baz", the following tags sequence is
present:
  FDT_PROP 0x00000008 xxxxxxxx <data bytes>
  FDT_REF_PHANDLE 0x00000004 "foo" 0x00 0x00 0x00
  FDT_PROP 0x00000010 xxxxxxxx <data bytes>
  FDT_REF_LOCAL 0x00000000 "bar" 0x00 0x00 0x00
  FDT_REF_LOCAL 0x00000008 "baz" 0x00 0x00 0x00

Add support for this new dtb tag.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/all/aL-2fmYsbexEtpNp@zatzit/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.c        | 12 ++++++++++++
 fdtdump.c    | 10 ++++++++++
 flattree.c   | 37 +++++++++++++++++++++++++++++++++++++
 libfdt/fdt.c | 16 ++++++++++++++++
 libfdt/fdt.h |  2 ++
 5 files changed, 77 insertions(+)

diff --git a/dtc.c b/dtc.c
index d0b4de3..fe8e8e4 100644
--- a/dtc.c
+++ b/dtc.c
@@ -336,6 +336,18 @@ int main(int argc, char *argv[])
 	update_phandles_ref(dti);
 	mark_local_phandles(dti);
 
+	/*
+	 * With FDT_REF_PHANDLE added in dtbs, we need to identified
+	 * if some unresolved phandle references are allowed in the dtb
+	 * we have parsed (needed for process_check() to run properly).
+	 *
+	 * Identify plugin device-trees (overlays) based on specific node
+	 * presence.
+	 */
+	if (get_subnode(dti->dt, "__fixups__") ||
+	    get_subnode(dti->dt, "__local_fixups__"))
+		dti->dtsflags |= DTSF_PLUGIN;
+
 	process_checks(force, dti);
 
 	if (auto_label_aliases)
diff --git a/fdtdump.c b/fdtdump.c
index dffa9a6..7300280 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -158,6 +158,16 @@ static void dump_blob(void *blob, bool debug)
 			continue;
 		}
 
+		if (tag == FDT_REF_PHANDLE) {
+			offset = fdt32_to_cpu(GET_CELL(p));
+			s = p;
+			p = PALIGN(p + strlen(s) + 1, 4);
+
+			printf("%*s// [FDT_REF_PHANDLE] %s[%"PRIu32"], ref = %s\n",
+				depth * shift, "", last_prop_name, offset, s);
+			continue;
+		}
+
 		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
 		break;
 	}
diff --git a/flattree.c b/flattree.c
index 5c597ad..07f7545 100644
--- a/flattree.c
+++ b/flattree.c
@@ -44,6 +44,7 @@ struct emitter {
 	void (*endnode)(void *, struct label *labels);
 	void (*property)(void *, struct label *labels);
 	void (*ref_local)(void *);
+	void (*ref_phandle)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -98,6 +99,11 @@ static void bin_emit_ref_local(void *e)
 	bin_emit_cell(e, FDT_REF_LOCAL);
 }
 
+static void bin_emit_ref_phandle(void *e)
+{
+	bin_emit_cell(e, FDT_REF_PHANDLE);
+}
+
 static struct emitter bin_emitter = {
 	.cell = bin_emit_cell,
 	.string = bin_emit_string,
@@ -107,6 +113,7 @@ static struct emitter bin_emitter = {
 	.endnode = bin_emit_endnode,
 	.property = bin_emit_property,
 	.ref_local = bin_emit_ref_local,
+	.ref_phandle = bin_emit_ref_phandle,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -226,6 +233,14 @@ static void asm_emit_ref_local(void *e)
 	asm_emit_cell(e, FDT_REF_LOCAL);
 }
 
+static void asm_emit_ref_phandle(void *e)
+{
+	FILE *f = e;
+
+	fprintf(f, "\t/* FDT_REF_PHANDLE */\n");
+	asm_emit_cell(e, FDT_REF_PHANDLE);
+}
+
 static struct emitter asm_emitter = {
 	.cell = asm_emit_cell,
 	.string = asm_emit_string,
@@ -235,6 +250,7 @@ static struct emitter asm_emitter = {
 	.endnode = asm_emit_endnode,
 	.property = asm_emit_property,
 	.ref_local = asm_emit_ref_local,
+	.ref_phandle = asm_emit_ref_phandle,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -299,6 +315,15 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 					emit->cell(etarget, m->offset);
 					continue;
 				}
+
+				if (m->ref[0] == '/')
+					die("Phandle uses a non local reference by path (%s)\n",
+					    m->ref);
+
+				emit->ref_phandle(etarget);
+				emit->cell(etarget, m->offset);
+				emit->string(etarget, m->ref, 0);
+				emit->align(etarget, sizeof(cell_t));
 			}
 		}
 	}
@@ -767,6 +792,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 	const char *flatname;
 	uint32_t val;
 	uint32_t offset;
+	const char *str;
 
 	node = build_node(NULL, NULL, NULL);
 
@@ -824,6 +850,17 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			prop->val = data_append_markers(prop->val, m);
 			break;
 
+		case FDT_REF_PHANDLE:
+			if (!(flags & FTF_REF_XXX))
+				die("REF_PHANDLE tag found in flat tree"
+					" version <18\n");
+
+			offset = flat_read_word(dtbuf);
+			str = flat_read_string(dtbuf);
+			m = alloc_marker(offset, REF_PHANDLE, xstrdup(str));
+			prop->val = data_append_markers(prop->val, m);
+			break;
+
 		default:
 			die("Invalid opcode word %08x in device tree blob\n",
 			    val);
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 7268fb6..8f3c35d 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -217,6 +217,21 @@ uint32_t fdt_next_tag_full(const void *fdt, int startoffset, int *nextoffset)
 		offset += sizeof(fdt32_t);
 		break;
 
+	case FDT_REF_PHANDLE:
+		/* Skip offset value */
+		tmp32p = fdt_offset_ptr(fdt, offset, sizeof(*tmp32p));
+		if (!can_assume(VALID_DTB) && !tmp32p)
+			return FDT_END; /* premature end */
+		offset += sizeof(fdt32_t);
+
+		/* Skip ref */
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
@@ -257,6 +272,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 			return tag;
 
 		case FDT_REF_LOCAL:
+		case FDT_REF_PHANDLE:
 			/*
 			 * Next tag is a meta-data tag present in the middle
 			 * of the structure -> Skip it and look at next one
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index f8efdf1..530d2e5 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -56,6 +56,8 @@ struct fdt_property {
 					   size, content */
 #define FDT_NOP		0x4		/* nop */
 #define FDT_REF_LOCAL   0x5		/* local phandle reference: offset */
+#define FDT_REF_PHANDLE 0x6		/* external phandle reference: offset,
+					   external label */
 #define FDT_END		0x9
 
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
-- 
2.52.0

