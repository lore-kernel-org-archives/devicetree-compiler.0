Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF335EDA4;
	Mon, 12 Jan 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227674; cv=none; b=gj8/6GjADSrtc8sstDwIWj391xpqtsUL5Mh28U6DPzFfXtVJSyXFHrN12CfNFkmz6y0aAJ0qfT2m0OPDu0jIDHfzqJInUJ5plL3y9Faj0XRT7NbtQN0yUBtA9w+nVjEUSEI/qLPItPEpGJUsmPAds671epTKdw3q0z3i+h+2mjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227674; c=relaxed/simple;
	bh=tOVMJYuO8prfhsCsN/Amr9P2xRVZLHjCprcPJLv7o2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gi9M2Qg+wBui/3reZGMO61sY1kF/RpMh33fc53HkEgez/ZrHPLn0zJ06/ZViphw/2pCRkgLz0RF14ixhC8oNSyyDvszBkyGdoVh4REBTPjabz8cDEunRHrjTuS/seQShLHp5rVRb34eAKDEu8Jj4hBKbvwEdQ8D3CsqnyvlQcIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cpG326GH; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cpG326GH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A9DFA1A2803;
	Mon, 12 Jan 2026 14:21:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80FF7606FA;
	Mon, 12 Jan 2026 14:21:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98E94103C9285;
	Mon, 12 Jan 2026 15:21:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227666; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=T4jTgWAUMEz0XkU45RA92bUyAxdBYgzEme5177ZYF7Q=;
	b=cpG326GHbDM1DIau/FH+xERYMtx6EqjsNFxkVbYYe/sP7heY9rq9xZr1jB+Jv+bdwwthUO
	eZ8o/BVX5hW2Eppiazrt1smzXVNSEmAhYenciIlPsR1e+mGpu2T+7Z5dmRZumv9fwvjqMi
	KOBiM6BtaU8dtHrurLsJ0deCNVV9b+codfcheWV/L/iIifOArLYTsU2geCcVagCyrabdv0
	6NlbOkCxXm60kYQ+IBTIjBhzeMypT9yWGm5+TORGtAn7qE8Z60AC68UjOpEgMrLSRR42Lo
	QoeexDBTC0wRbZmCHiK2XhdBKKMjP+xl+cbEayc+5U76MABH1kZh1Or96rsoBw==
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
Subject: [RFC PATCH 29/77] Add support for FDT_EXPORT_SYM_REF dtb tag
Date: Mon, 12 Jan 2026 15:19:19 +0100
Message-ID: <20260112142009.1006236-30-herve.codina@bootlin.com>
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

It is followed by three values and a possible alignment padding:
  - name (string including \0)
      The export symbol name. I.e. the name used to reference this
      exported symbol.
  - padding:
      Padding (0x00) added to have the next value aligned on 32bit.
  - phandle (32bit)
      A placeholder for a phandle value.
      This placeholder can be used during some dtb manipulation to store
      a temporary phandle value.
      In terms of FDT_EXPORT_SYM_REF definition, it has no meaningful
      signification and will be probably set to 0xffffffff, the
      unresolved phandle value.
  - label (string including \0):
      The label to use to resolve this symbol. This label is the
      reference to the external phandle.
  - padding:
      Padding (0x00) added to have the next value aligned on 32bit.

Example:
  FDT_EXPORT_SYM_REF 'foo1' 0x00 0x00 0x00 0xffffffff 'foo_a' 0x00 0x00

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
and exporting 'bar1' pointing to the node referenced by 'bar_b' leads to
the following sequence:
  FDT_EXPORT_SYM_REF 'foo1' 0x00 0x00 0x00 'foo_a' 0x00 0x00
  FDT_EXPORT_SYM_REF 'bar1' 0x00 0x00 0x00 'bar_b' 0x00 0x00

Add support for this new dtb tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c    | 12 ++++++++++++
 flattree.c   | 40 ++++++++++++++++++++++++++++++++++++++++
 libfdt/fdt.c | 24 ++++++++++++++++++++++++
 libfdt/fdt.h |  2 ++
 4 files changed, 78 insertions(+)

diff --git a/fdtdump.c b/fdtdump.c
index d1af5b6..8baadc4 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -186,6 +186,18 @@ static void dump_blob(void *blob, bool debug)
 			continue;
 		}
 
+		if (tag == FDT_EXPORT_SYM_REF) {
+			s = p;
+			p = PALIGN(p + strlen(s) + 1, 4);
+			val32 = fdt32_to_cpu(GET_CELL(p));
+			t = p;
+			p = PALIGN(p + strlen(t) + 1, 4);
+
+			printf("%*s// [FDT_EXPORT_SYM_REF] '%s' -> '%s'\n", depth * shift, "",
+				s, t);
+			continue;
+		}
+
 		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
 		break;
 	}
diff --git a/flattree.c b/flattree.c
index bd52e81..d970259 100644
--- a/flattree.c
+++ b/flattree.c
@@ -49,6 +49,7 @@ struct emitter {
 	void (*ref_local)(void *);
 	void (*ref_phandle)(void *);
 	void (*export_sym)(void *);
+	void (*export_sym_ref)(void *);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -113,6 +114,11 @@ static void bin_emit_export_sym(void *e)
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
@@ -124,6 +130,7 @@ static struct emitter bin_emitter = {
 	.ref_local = bin_emit_ref_local,
 	.ref_phandle = bin_emit_ref_phandle,
 	.export_sym = bin_emit_export_sym,
+	.export_sym_ref = bin_emit_export_sym_ref,
 };
 
 static void emit_label(FILE *f, const char *prefix, const char *label)
@@ -259,6 +266,14 @@ static void asm_emit_export_sym(void *e)
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
@@ -270,6 +285,7 @@ static struct emitter asm_emitter = {
 	.ref_local = asm_emit_ref_local,
 	.ref_phandle = asm_emit_ref_phandle,
 	.export_sym = asm_emit_export_sym,
+	.export_sym = asm_emit_export_sym_ref,
 };
 
 static int stringtable_insert(struct data *d, const char *str)
@@ -369,6 +385,18 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 				emit->cell(etarget, exportsym->phandle);
 				continue;
 			}
+
+			if (exportsym->ref[0] == '/')
+				die("Export symbol uses a non local reference by path (%s)\n",
+				    m->ref);
+
+			emit->export_sym_ref(etarget);
+			emit->string(etarget, exportsym->name, 0);
+			emit->align(etarget, sizeof(cell_t));
+			/* Placeholder for the phandle */
+			emit->cell(etarget, exportsym->phandle);
+			emit->string(etarget, exportsym->ref, 0);
+			emit->align(etarget, sizeof(cell_t));
 		}
 	}
 
@@ -838,6 +866,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 	uint32_t val;
 	uint32_t offset;
 	const char *str;
+	const char *str2;
 
 	node = build_node(NULL, NULL, NULL, NULL);
 
@@ -919,6 +948,17 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 			add_symbol(&node->exportsymlist, exportsym);
 			break;
 
+		case FDT_EXPORT_SYM_REF:
+			if (!(flags & FTF_EXPORT_IMPORT_SYM))
+				die("FDT_EXPORT_SYM_REF tag found in flat tree"
+					" version <18\n");
+			str = flat_read_string(dtbuf); /* Name */
+			phandle = flat_read_word(dtbuf); /* Phandle */
+			str2 = flat_read_string(dtbuf); /* Ref */
+			exportsym = build_exportsym(str, str2, phandle, NULL);
+			add_symbol(&node->exportsymlist, exportsym);
+			break;
+
 		default:
 			die("Invalid opcode word %08x in device tree blob\n",
 			    val);
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 44d7399..febfa71 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -248,6 +248,29 @@ uint32_t fdt_next_tag_full(const void *fdt, int startoffset, int *nextoffset)
 		offset += sizeof(fdt32_t);
 		break;
 
+	case FDT_EXPORT_SYM_REF:
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
+
+		/* Skip external name */
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
@@ -290,6 +313,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		case FDT_REF_LOCAL:
 		case FDT_REF_PHANDLE:
 		case FDT_EXPORT_SYM:
+		case FDT_EXPORT_SYM_REF:
 			/*
 			 * Next tag is a meta-data tag present in the middle
 			 * of the structure -> Skip it and look at next one
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index e85bc07..c23723b 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -65,6 +65,8 @@ struct fdt_property {
 					   external label */
 #define FDT_END		0x9
 #define FDT_EXPORT_SYM	0xa		/* export symbol: name, phandle value */
+#define FDT_EXPORT_SYM_REF 0xb		/* export symbol: name, phandle value (maybe
+					   unresolved), external label */
 
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
-- 
2.52.0

