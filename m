Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692241;
	b=1vzj7w2RSrD4UgSPhvVW5FmJ2mbQN65Lf9t4jJj7sUi8e33xqt5M3UNx14G0bgZJRbcd
	 5qNzSd7Q1FX6KT4ZgiqHcFukYiYPQpDZj0KpjI5Q2hIgWYTrZNIPIa9qKfd9xfpBtgUlD
	 Q1QX8OgRm55je7lfRjSTbgH4ME0KUgMNe3b2tXw5tPhEhYnh32Ww32++m3IMdIKS5vzku
	 gKnRUxalzCDUtGBOGuxNJ5vl1QaprNqh6IDurIA0fjykcT1AomtPURVBkHofE53aHYs//
	 YPuDQCJPcQdRrQNyE44cM7c8+vPXPFOfMsdA8qu3jwDPb3/vQFXEMPqw19rkqn4rfmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692241;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=VwsLFudVYxAHVPd8Pq52BGkeWhNG+2iCPX3GrxsYvHU=;
	b=oMxbajAkH28nuMBt3fODbN0HzqJqmmFEgpvLOWPGnEW/x00uydbBOfkoq/7l6EEi+vo2
	 8sltGhFMYpTNY8A+whG3/qdDpBvb/1JvjQnN2jomYBoMow1yoWwfTRc+++DQEuyrDNyn5
	 m39ydrzNGcK5yQioXVaDCMN1wX5QDlcTsZvlw63FiBz1YBYfTnvY1Wx6gJozJmxDiPulH
	 a5yDBWryyI+AwUPGN0vTKOwTtfhC2hwEyQtl1W5DG1bIsQn5HCxg6M/+UaPn/R1Zp0fj3
	 bdzEFjS79wPDQ/7tYdOpKcN+ravz49Y/iWcm1Ra93wDY2s4L4oTq9J68JWucaVa/W4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QzrXw7Pd;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00EE606A6AD
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 11:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D00EE606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QzrXw7Pd
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7D41C2B9CA;
	Thu, 26 Nov 2026 11:24:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 842C060237;
	Thu, 26 Nov 2026 11:23:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA19F11E6B324;
	Thu, 26 Nov 2026 12:23:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692237; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VwsLFudVYxAHVPd8Pq52BGkeWhNG+2iCPX3GrxsYvHU=;
	b=QzrXw7PdwiMRt5tbP6r7iM9ScT/U8OdOlVp2D/TqjvoxQk0te/sUI+6mZen5JFfxacoetP
	4BXCeU7og4rGFt/dxsKNcwbC5WiEuJY4ENuN+bFzwupp6aqqf7zxYy8jACu/KF6EXplmyz
	9fuEP+KuMpM9OT3U6St0QGTCOBnn8maQUD16vullrXo1cG+4uKKerdl7zu1OWpSK6IssaS
	b4OF8JK1QdJ6vi4QgK1RaatvG+hDta/LC8MHAeWnkMqy+jGfRvdxfMvHqSX0fyCCAMt4sp
	eAknqaYntOvt7MAmF6yZNEnhlNIGcImpbJCWISfFsaMzoR7dGkmEIrHlVL7rZg==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 10/22] tests: treegen: Export tree generation primitives
Date: Thu, 26 Nov 2026 12:22:27 +0100
Message-ID: <20261126112239.636284-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Tree generation primitives are statically defined in treegen.c.

In order to allow harnesses and related tree generation to be grouped in
specific source files, export the generation primitives.

No functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/treegen.c | 63 +++++++++++++++++--------------------
 tests/treegen.h | 83 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+), 35 deletions(-)
 create mode 100644 tests/treegen.h

diff --git a/tests/treegen.c b/tests/treegen.c
index f210a525..b65f8eb5 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -20,18 +20,11 @@
 #include "testdata.h"
 #include "util.h"
 
-/*
- * Buffer with write cursor.  Emit helpers write at the cursor, advance it, and
- * return the offset at which data was written.
- */
-struct buf {
-	char *data;
-	size_t size, cursor;
-};
+#include "treegen.h"
 
 #define CHUNKSIZE	1024
 
-static struct buf buf_init(void)
+struct buf buf_init(void)
 {
 	struct buf b = { NULL, 0, 0 };
 
@@ -40,7 +33,7 @@ static struct buf buf_init(void)
 
 /* Low-level helpers */
 
-static size_t emit_bytes(struct buf *b, const void *data, int len)
+size_t emit_bytes(struct buf *b, const void *data, int len)
 {
 	size_t off = b->cursor;
 
@@ -59,28 +52,28 @@ static size_t emit_bytes(struct buf *b, const void *data, int len)
 	return off;
 }
 
-static size_t emit_u32(struct buf *b, uint32_t val)
+size_t emit_u32(struct buf *b, uint32_t val)
 {
 	fdt32_t beval = cpu_to_fdt32(val);
 
 	return emit_bytes(b, &beval, sizeof(beval));
 }
 
-static size_t emit_u64(struct buf *b, uint64_t val)
+size_t emit_u64(struct buf *b, uint64_t val)
 {
 	fdt64_t beval = cpu_to_fdt64(val);
 
 	return emit_bytes(b, &beval, sizeof(beval));
 }
 
-static size_t emit_string(struct buf *b, const char *str)
+size_t emit_string(struct buf *b, const char *str)
 {
 	return emit_bytes(b, str, strlen(str) + 1);
 }
 
 #define MAX_ALIGNMENT	8
 
-static size_t emit_align(struct buf *b, size_t alignment)
+size_t emit_align(struct buf *b, size_t alignment)
 {
 	size_t pad = ((b->cursor + alignment - 1) & ~(alignment - 1)) - b->cursor;
 	static const char zeros[MAX_ALIGNMENT];
@@ -91,12 +84,12 @@ static size_t emit_align(struct buf *b, size_t alignment)
 	return emit_bytes(b, zeros, pad);
 }
 
-static size_t start_block(struct buf *b)
+size_t start_block(struct buf *b)
 {
 	return b->cursor;
 }
 
-static void fill_prop_name(struct buf *b, size_t strs, size_t prop, size_t stroff)
+void fill_prop_name(struct buf *b, size_t strs, size_t prop, size_t stroff)
 {
 	struct fdt_property *fp = (struct fdt_property *)(b->data + prop);
 
@@ -105,8 +98,8 @@ static void fill_prop_name(struct buf *b, size_t strs, size_t prop, size_t strof
 
 /* FDT structure helpers */
 
-static size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
-				   uint32_t last_comp_version)
+size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
+			    uint32_t last_comp_version)
 {
 	size_t off = emit_u32(b, FDT_MAGIC);
 
@@ -122,19 +115,19 @@ static size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
 	return off;
 }
 
-static size_t emit_fdt_header(struct buf *b)
+size_t emit_fdt_header(struct buf *b)
 {
 	return emit_fdt_header_vers(b, 0x11, 0x10);
 }
 
-static void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
+void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
 {
 	struct fdt_header *fh = (struct fdt_header *)(b->data + hdr);
 
 	fh->off_mem_rsvmap = cpu_to_fdt32(rsvmap - hdr);
 }
 
-static void finish_struct_block(struct buf *b, size_t hdr, size_t start)
+void finish_struct_block(struct buf *b, size_t hdr, size_t start)
 {
 	struct fdt_header *fh = (struct fdt_header *)(b->data + hdr);
 
@@ -142,7 +135,7 @@ static void finish_struct_block(struct buf *b, size_t hdr, size_t start)
 	fh->size_dt_struct = cpu_to_fdt32(b->cursor - start);
 }
 
-static void finish_strings_block(struct buf *b, size_t hdr, size_t start)
+void finish_strings_block(struct buf *b, size_t hdr, size_t start)
 {
 	struct fdt_header *fh = (struct fdt_header *)(b->data + hdr);
 
@@ -150,14 +143,14 @@ static void finish_strings_block(struct buf *b, size_t hdr, size_t start)
 	fh->size_dt_strings = cpu_to_fdt32(b->cursor - start);
 }
 
-static void finish_totalsize(struct buf *b, size_t hdr)
+void finish_totalsize(struct buf *b, size_t hdr)
 {
 	struct fdt_header *fh = (struct fdt_header *)(b->data + hdr);
 
 	fh->totalsize = cpu_to_fdt32(b->cursor - hdr);
 }
 
-static size_t emit_rsvmap_entry(struct buf *b, uint64_t addr, uint64_t size)
+size_t emit_rsvmap_entry(struct buf *b, uint64_t addr, uint64_t size)
 {
 	size_t off = emit_u64(b, addr);
 
@@ -165,12 +158,12 @@ static size_t emit_rsvmap_entry(struct buf *b, uint64_t addr, uint64_t size)
 	return off;
 }
 
-static size_t emit_rsvmap_term(struct buf *b)
+size_t emit_rsvmap_term(struct buf *b)
 {
 	return emit_rsvmap_entry(b, 0, 0);
 }
 
-static void emit_rsvmap_empty(struct buf *b, size_t hdr)
+void emit_rsvmap_empty(struct buf *b, size_t hdr)
 {
 	size_t rsvmap = start_block(b);
 
@@ -178,7 +171,7 @@ static void emit_rsvmap_empty(struct buf *b, size_t hdr)
 	finish_rsvmap(b, hdr, rsvmap);
 }
 
-static size_t emit_begin_node(struct buf *b, const char *name)
+size_t emit_begin_node(struct buf *b, const char *name)
 {
 	size_t off = emit_u32(b, FDT_BEGIN_NODE);
 
@@ -187,17 +180,17 @@ static size_t emit_begin_node(struct buf *b, const char *name)
 	return off;
 }
 
-static size_t emit_end_node(struct buf *b)
+size_t emit_end_node(struct buf *b)
 {
 	return emit_u32(b, FDT_END_NODE);
 }
 
-static size_t emit_fdt_end(struct buf *b)
+size_t emit_fdt_end(struct buf *b)
 {
 	return emit_u32(b, FDT_END);
 }
 
-static size_t emit_prop_header(struct buf *b, int nameoff, int len)
+size_t emit_prop_header(struct buf *b, int nameoff, int len)
 {
 	size_t off = emit_u32(b, FDT_PROP);
 
@@ -206,12 +199,12 @@ static size_t emit_prop_header(struct buf *b, int nameoff, int len)
 	return off;
 }
 
-static size_t emit_prop_nil(struct buf *b, int nameoff)
+size_t emit_prop_nil(struct buf *b, int nameoff)
 {
 	return emit_prop_header(b, nameoff, 0);
 }
 
-static size_t emit_prop_u32(struct buf *b, int nameoff, uint32_t val)
+size_t emit_prop_u32(struct buf *b, int nameoff, uint32_t val)
 {
 	size_t off = emit_prop_header(b, nameoff, 4);
 
@@ -219,7 +212,7 @@ static size_t emit_prop_u32(struct buf *b, int nameoff, uint32_t val)
 	return off;
 }
 
-static size_t emit_prop_u64(struct buf *b, int nameoff, uint64_t val)
+size_t emit_prop_u64(struct buf *b, int nameoff, uint64_t val)
 {
 	size_t off = emit_prop_header(b, nameoff, 8);
 
@@ -227,7 +220,7 @@ static size_t emit_prop_u64(struct buf *b, int nameoff, uint64_t val)
 	return off;
 }
 
-static size_t emit_prop_str(struct buf *b, int nameoff, const char *str)
+size_t emit_prop_str(struct buf *b, int nameoff, const char *str)
 {
 	int len = strlen(str) + 1;
 	size_t off = emit_prop_header(b, nameoff, len);
@@ -240,7 +233,7 @@ static size_t emit_prop_str(struct buf *b, int nameoff, const char *str)
 #define emit_prop_strings(b, nameoff, ...) \
 	emit_prop_strings_(b, nameoff, __VA_ARGS__, NULL)
 
-static size_t emit_prop_strings_(struct buf *b, int nameoff, ...)
+size_t emit_prop_strings_(struct buf *b, int nameoff, ...)
 {
 	size_t off = emit_prop_header(b, nameoff, 0);
 	size_t start = b->cursor;
diff --git a/tests/treegen.h b/tests/treegen.h
new file mode 100644
index 00000000..8512085d
--- /dev/null
+++ b/tests/treegen.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef TREEGEN_H
+#define TREEGEN_H
+/*
+ * treegen - generate test device tree blobs
+ *
+ */
+#include <stddef.h>
+#include <stdint.h>
+#include "tests.h" /* ARRAY_SIZE() */
+
+/*
+ * Buffer with write cursor.  Emit helpers write at the cursor, advance it, and
+ * return the offset at which data was written.
+ */
+struct buf {
+	char *data;
+	size_t size, cursor;
+};
+
+struct buf buf_init(void);
+
+/* Low-level helpers */
+size_t emit_bytes(struct buf *b, const void *data, int len);
+size_t emit_u32(struct buf *b, uint32_t val);
+size_t emit_u64(struct buf *b, uint64_t val);
+size_t emit_string(struct buf *b, const char *str);
+size_t emit_align(struct buf *b, size_t alignment);
+
+size_t start_block(struct buf *b);
+
+void fill_prop_name(struct buf *b, size_t strs, size_t prop, size_t stroff);
+
+/* FDT structure helpers */
+size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
+			    uint32_t last_comp_version);
+size_t emit_fdt_header(struct buf *b);
+
+void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap);
+void finish_struct_block(struct buf *b, size_t hdr, size_t start);
+void finish_strings_block(struct buf *b, size_t hdr, size_t start);
+void finish_totalsize(struct buf *b, size_t hdr);
+
+size_t emit_rsvmap_entry(struct buf *b, uint64_t addr, uint64_t size);
+size_t emit_rsvmap_term(struct buf *b);
+void emit_rsvmap_empty(struct buf *b, size_t hdr);
+
+size_t emit_begin_node(struct buf *b, const char *name);
+size_t emit_end_node(struct buf *b);
+size_t emit_fdt_end(struct buf *b);
+size_t emit_prop_header(struct buf *b, int nameoff, int len);
+size_t emit_prop_nil(struct buf *b, int nameoff);
+size_t emit_prop_u32(struct buf *b, int nameoff, uint32_t val);
+size_t emit_prop_u64(struct buf *b, int nameoff, uint64_t val);
+size_t emit_prop_str(struct buf *b, int nameoff, const char *str);
+
+#define emit_prop_strings(b, nameoff, ...) \
+	emit_prop_strings_(b, nameoff, __VA_ARGS__, NULL)
+
+size_t emit_prop_strings_(struct buf *b, int nameoff, ...);
+
+
+/* Tree generator */
+struct treegen {
+	struct buf (*generator)(void);
+	const char *filename;
+};
+#define TREE(name)	{ make_##name, #name ".dtb" }
+
+/* Tree harness */
+struct treeharness {
+	const char *name;
+	const struct treegen *tab_treegen;
+	unsigned int nb_treegen;
+};
+#define TREEHARNESS(name_, tab_treegen_) \
+	{ \
+		.name = name_, \
+		.tab_treegen = tab_treegen_, \
+		.nb_treegen = ARRAY_SIZE(tab_treegen_), \
+	}
+
+#endif /* TREEGEN_H */
-- 
2.56.1

