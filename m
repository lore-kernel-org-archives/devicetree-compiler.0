Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447923BED56;
	Wed, 26 Aug 2026 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737845; cv=none; b=Y3gThdku/bdKBN3I6vSe8J+uyHzmm5s2k2680OQWSwxShRNNAQUDtWCTCdUZV3pxJhW1X4fDQl6LAk4YY++aFElJKBDXQh/5s//QuFfua7nHwamGV/diXzPfIIINh62Tu3LAWu6b0uoFzAZa2ea71DEz3LirfAhwFK5gnmO61TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737845; c=relaxed/simple;
	bh=IdaWCbhLxuMADF65gAwmxOCt/ZiQ0u2hAYloZMxwQqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZCzl+k9Xaue/BSFoq1wu9JSQzsknpDTNAEw19pKR5kH0N1+h/5F0psxuSOOR54Bahuomc7r+xbssZxXOYXnWGgjWTJhK86jIrPkEQBMqFMaRneNHqBQYcVa8muSRzaMGwHBM9FLqFyTLBZj6kTw0q8UONU/bbXzpE39bg4aAc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pW+Eikka; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pW+Eikka"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB18B4E413C1;
	Wed, 26 Aug 2026 09:50:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90CB0604EC;
	Wed, 26 Aug 2026 09:50:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E23D911C7AD55;
	Wed, 26 Aug 2026 11:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737836; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=s/Qex1klhgUuSLDyTxLdJ4YDpclPW8lihSwWOKlLUo0=;
	b=pW+EikkaJMxmx5q46ggOk2m4o6FCEShCxgNcnk/bVEOhGx0bUVZkakj0L3FkNirne1xBCF
	L/LArz5QkaMuvw0BjAY8npTEVGOH+YeK1Vn/CxA9dClD8T/ytRFNX5MKYUTPIrLFN5mMNE
	AOWD3wG4uSzzSqEGRqOvaO5rx6yjCwSUceQocmNY9kItwuTEjLe8vEnnWddgcJFufhMojE
	fyrMfnE5a2IAgSTY6H7Js1DaMFXlpQP/g74yVlFnmrgLv+ZSFVHF6qdqCkJnjlaTfxykWV
	dlXVGeWcjMfNoidb9fYKiPq9XP7GdtdMLSvkLRhXFsAr5hCEywnPkYkntzcN5g==
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
Subject: [RFC PATCH v2 02/74] Introduce v20 dtb version
Date: Wed, 26 Aug 2026 11:48:31 +0200
Message-ID: <20260826094950.1088288-3-herve.codina@bootlin.com>
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

This v20 version will add support for
 - metadata in device-tree blobs in order to have a better handling of
   phandles and unresolved references.
 - Addon device-tree blob (successor of device-tree overlay)
 - Import and export symbols feature
 - multiple trees in an addon device-tree blob (i.e. root device tree
   and orphan node tree)

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.h                                               |  2 +-
 fdtdump.c                                           |  2 +-
 flattree.c                                          |  3 +++
 libfdt/fdt.h                                        |  1 +
 libfdt/fdt_rw.c                                     | 13 +++++++------
 libfdt/libfdt.h                                     |  6 +++---
 tests/pylibfdt_tests.py                             |  6 +++---
 tests/treegen.c                                     |  2 +-
 .../unknown_tags_can_skip.fdtput.test.dtb.1.expect  |  2 +-
 tests/unknown_tags_can_skip.wip.test.dtb.1.expect   |  2 +-
 10 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/dtc.h b/dtc.h
index f0c2cde6..ef3f2682 100644
--- a/dtc.h
+++ b/dtc.h
@@ -29,7 +29,7 @@
 #define debug(...)
 #endif
 
-#define DEFAULT_FDT_VERSION	18
+#define DEFAULT_FDT_VERSION	20
 
 /*
  * Command line options
diff --git a/fdtdump.c b/fdtdump.c
index 5994e1d7..20854752 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -18,7 +18,7 @@
 #include "util.h"
 
 #define FDT_MAGIC_SIZE	4
-#define MAX_VERSION 18U
+#define MAX_VERSION 20U
 
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
diff --git a/flattree.c b/flattree.c
index ff57fc5d..dd451f0c 100644
--- a/flattree.c
+++ b/flattree.c
@@ -36,6 +36,9 @@ static struct version_info {
 	{18, 16, 17, FDT_V18_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
 	 FTF_LCVERSW},
+	{20, 18, 18, FDT_V20_SIZE,
+	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
+	 FTF_LCVERSW},
 };
 
 struct emitter {
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index a43b85c1..7c59fed2 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -90,5 +90,6 @@ struct fdt_property {
 #define FDT_V16_SIZE	FDT_V3_SIZE
 #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
 #define FDT_V18_SIZE	(FDT_V17_SIZE + 2 * sizeof(fdt32_t))
+#define FDT_V20_SIZE	FDT_V18_SIZE
 
 #endif /* FDT_H */
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 005efde8..1c6ce0a3 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -628,10 +628,11 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 		err = fdt_move(fdt, buf, bufsize);
 		if (err)
 			return err;
-		if (can_assume(LATEST) || fdt_version(fdt) < 18) {
-			fdt_set_version(buf, 18);
+
+		if (can_assume(LATEST) || fdt_version(fdt) < 20) {
+			fdt_set_version(buf, 20);
 			fdt_set_dt_flags(buf, 0);
-			fdt_set_last_comp_version_w(buf, 17);
+			fdt_set_last_comp_version_w(buf, 18);
 		}
 		fdt_set_size_dt_struct(buf, struct_size);
 		fdt_set_totalsize(buf, bufsize);
@@ -661,10 +662,10 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	fdt_set_magic(buf, FDT_MAGIC);
 	fdt_set_totalsize(buf, bufsize);
-	fdt_set_version(buf, 18);
-	fdt_set_last_comp_version(buf, 16);
+	fdt_set_version(buf, 20);
+	fdt_set_last_comp_version(buf, 18);
 	fdt_set_dt_flags(buf, 0);
-	fdt_set_last_comp_version_w(buf, 17);
+	fdt_set_last_comp_version_w(buf, 18);
 	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
 
 	return 0;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 8e99e644..5e1e0d06 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -14,9 +14,9 @@ extern "C" {
 #endif
 
 #define FDT_FIRST_SUPPORTED_VERSION	0x02
-#define FDT_LAST_COMPATIBLE_VERSION	0x10
-#define FDT_LAST_COMPATIBLE_VERSION_W	0x11
-#define FDT_LAST_SUPPORTED_VERSION	0x12
+#define FDT_LAST_COMPATIBLE_VERSION	0x12
+#define FDT_LAST_COMPATIBLE_VERSION_W	0x12
+#define FDT_LAST_SUPPORTED_VERSION	0x14
 
 /* Error codes: informative error codes */
 #define FDT_ERR_NOTFOUND	1
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index c3aaf00f..bae52406 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -277,13 +277,13 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(self.fdt.off_dt_struct(), 96)
         self.assertEqual(self.fdt.off_dt_strings(), 660)
         self.assertEqual(self.fdt.off_mem_rsvmap(), 48)
-        self.assertEqual(self.fdt.version(), 18)
-        self.assertEqual(self.fdt.last_comp_version(), 16)
+        self.assertEqual(self.fdt.version(), 20)
+        self.assertEqual(self.fdt.last_comp_version(), 18)
         self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
         self.assertEqual(self.fdt.size_dt_strings(), 105)
         self.assertEqual(self.fdt.size_dt_struct(), 564)
         self.assertEqual(self.fdt.dt_flags(), 0)
-        self.assertEqual(self.fdt.last_comp_version_w(), 17)
+        self.assertEqual(self.fdt.last_comp_version_w(), 18)
 
     def testPack(self):
         """Test that we can pack the tree after deleting something"""
diff --git a/tests/treegen.c b/tests/treegen.c
index b0730ef6..36cb5508 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -127,7 +127,7 @@ static size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
 
 static size_t emit_fdt_header(struct buf *b)
 {
-	return emit_fdt_header_vers(b, 0x12, 0x10, 0x11);
+	return emit_fdt_header_vers(b, 0x14, 0x12, 0x12);
 }
 
 static void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
index 6d750f88..204d3d23 100644
--- a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
@@ -1,5 +1,5 @@
 /dts-v1/;
-// version:		18
+// version:		20
 // last_comp_version:	16
 // last_comp_version_w:	17
 
diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.1.expect b/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
index afd8a4af..a3f9307f 100644
--- a/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
+++ b/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
@@ -1,5 +1,5 @@
 /dts-v1/;
-// version:		18
+// version:		20
 // last_comp_version:	16
 // last_comp_version_w:	17
 
-- 
2.55.0

