Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178DB25A33F;
	Mon, 12 Jan 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227633; cv=none; b=ANWHoh+st9ckCS0d5IB6gfQGj4mgUiyufPvUkeG/Vy3qhBNClrNJuHhZpEfbONMdawT5fr+P2MyV3rCkcw9y2kccoAlBnqJ8EFoJHBpD8HjhmoLvSrLr0zo/wjxuo84nbwb7D5N+mZVDbN/7fs7AKZ9tlAVNmShN/uwPJUIQTm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227633; c=relaxed/simple;
	bh=Mmcnvo0XQvPuBaHpA8xKSUDM+QmtNvCssITIOUQPOUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctPUj7SueeZBQr8XIFWBaMJEfxf3IHujfS34bfuKtSXYgmoFVpkFqStX6QvNHij6B1ogTuvmgkOaU2dzaQG4LC90XRD0zOUVvT9sJt3IJt4nD7MGmK7NH/Xz2tQHaFRmWHo86m3KPchAtxVjyS7S2lb+742Gl/iypypXnWhwMdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OPRxTGVe; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OPRxTGVe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 472814E42087;
	Mon, 12 Jan 2026 14:20:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D8566074A;
	Mon, 12 Jan 2026 14:20:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFEEE103C9260;
	Mon, 12 Jan 2026 15:20:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227624; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lkchoh9jnV9vrtFbWNI6rxkfKR+PqzEYzU7fTeN5IPA=;
	b=OPRxTGVeRm3nhA2Uh9NnEvPOIsY/IK5i/iv+LF6b7CiD4tMUU0PwBcvx/Pye2/aCFmMWE9
	CW3qpvUhuAONPsH5N5uEJ6f3+bm9aDbTLO6cMK6iQV0SsCfKtYbrz+2ezSEOcR/f+7y1TD
	I1jU2bikrSlRR+sqGwAsDT/YadH29pB9SBNdhSg3WkJq+BDuKJ297uoQ6v2a6pKO6pDUrQ
	7GuTVYZSbEwegVgLHup+nJTxy/+AlKLyEnpDtApBHQpmpsxqSxzV74ijkMjBjJKlMzBp99
	4Qp/eWc6Z+S8hNEjS8pCwuFL4BhtHL1eXzPYHIPIyBixt2fi1xo7QjdslAFHTg==
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
Subject: [RFC PATCH 02/77] Introduce v18 dtb version
Date: Mon, 12 Jan 2026 15:18:52 +0100
Message-ID: <20260112142009.1006236-3-herve.codina@bootlin.com>
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

This v18 version will add support for
 - metadata in device-tree blobs in order to have a better handling of
   phandles and unresolved references.
 - Addon device-tree blob (successor of device-tree overlay)
 - Import and export symbols feature
 - multiple trees in a addon device-tree blob (i.e. root device tree and
   orphan node tree)

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.h                   |  2 +-
 fdtdump.c               |  2 +-
 flattree.c              |  2 ++
 libfdt/fdt.h            |  1 +
 libfdt/fdt_rw.c         | 13 +++++++------
 libfdt/libfdt.h         |  2 +-
 tests/pylibfdt_tests.py |  2 +-
 tests/trees.S           |  2 +-
 8 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/dtc.h b/dtc.h
index 3a220b9..186caad 100644
--- a/dtc.h
+++ b/dtc.h
@@ -29,7 +29,7 @@
 #define debug(...)
 #endif
 
-#define DEFAULT_FDT_VERSION	17
+#define DEFAULT_FDT_VERSION	18
 
 /*
  * Command line options
diff --git a/fdtdump.c b/fdtdump.c
index d424869..ec25edf 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -18,7 +18,7 @@
 #include "util.h"
 
 #define FDT_MAGIC_SIZE	4
-#define MAX_VERSION 17U
+#define MAX_VERSION 18U
 
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
diff --git a/flattree.c b/flattree.c
index 30e6de2..c3887da 100644
--- a/flattree.c
+++ b/flattree.c
@@ -30,6 +30,8 @@ static struct version_info {
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_NOPS},
 	{17, 16, FDT_V17_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
+	{18, 18, FDT_V18_SIZE,
+	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
 };
 
 struct emitter {
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index a07abfc..9372353 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -62,5 +62,6 @@ struct fdt_property {
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
 #define FDT_V16_SIZE	FDT_V3_SIZE
 #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
+#define FDT_V18_SIZE	FDT_V17_SIZE
 
 #endif /* FDT_H */
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 7475caf..00e32bb 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -28,13 +28,13 @@ static int fdt_rw_probe_(void *fdt)
 		return 0;
 	FDT_RO_PROBE(fdt);
 
-	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
+	if (!can_assume(LATEST) && fdt_version(fdt) < 18)
 		return -FDT_ERR_BADVERSION;
 	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
 				   fdt_size_dt_struct(fdt)))
 		return -FDT_ERR_BADLAYOUT;
-	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
-		fdt_set_version(fdt, 17);
+	if (!can_assume(LATEST) && fdt_version(fdt) > 18)
+		fdt_set_version(fdt, 18);
 
 	return 0;
 }
@@ -455,7 +455,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 		err = fdt_move(fdt, buf, bufsize);
 		if (err)
 			return err;
-		fdt_set_version(buf, 17);
+		fdt_set_version(buf, 18);
+		fdt_set_last_comp_version(buf, 18);
 		fdt_set_size_dt_struct(buf, struct_size);
 		fdt_set_totalsize(buf, bufsize);
 		return 0;
@@ -484,8 +485,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	fdt_set_magic(buf, FDT_MAGIC);
 	fdt_set_totalsize(buf, bufsize);
-	fdt_set_version(buf, 17);
-	fdt_set_last_comp_version(buf, 16);
+	fdt_set_version(buf, 18);
+	fdt_set_last_comp_version(buf, 18);
 	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
 
 	return 0;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 7a10f66..c5cd35d 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -15,7 +15,7 @@ extern "C" {
 
 #define FDT_FIRST_SUPPORTED_VERSION	0x02
 #define FDT_LAST_COMPATIBLE_VERSION	0x10
-#define FDT_LAST_SUPPORTED_VERSION	0x11
+#define FDT_LAST_SUPPORTED_VERSION	0x12
 
 /* Error codes: informative error codes */
 #define FDT_ERR_NOTFOUND	1
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index a4f73ed..373e11a 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -288,7 +288,7 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(self.fdt.off_dt_struct(), 88)
         self.assertEqual(self.fdt.off_dt_strings(), 652)
         self.assertEqual(self.fdt.off_mem_rsvmap(), 40)
-        self.assertEqual(self.fdt.version(), 17)
+        self.assertEqual(self.fdt.version(), 18)
         self.assertEqual(self.fdt.last_comp_version(), 16)
         self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
         self.assertEqual(self.fdt.size_dt_strings(), 105)
diff --git a/tests/trees.S b/tests/trees.S
index d69f7f1..ecd43bc 100644
--- a/tests/trees.S
+++ b/tests/trees.S
@@ -17,7 +17,7 @@
 	fdtlong	(\tree\()_struct - \tree)
 	fdtlong	(\tree\()_strings - \tree)
 	fdtlong	(\tree\()_rsvmap - \tree)
-	fdtlong	0x11
+	fdtlong	0x12
 	fdtlong	0x10
 	fdtlong	0
 	fdtlong	(\tree\()_strings_end - \tree\()_strings)
-- 
2.52.0

