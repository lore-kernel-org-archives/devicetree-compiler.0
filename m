Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73552C08DB
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227646; cv=none; b=Cm41ZcwTdAr9QS8WcadeEycw4MbDj35DX3nYPPrearMGsQxFAdGgJ4EthKIC3kbmgAYAA9CvlfFbCM6fxeYqfmjjdZxrmHtNcIvTbrHSdQ1MBBSjR8aPzSnFVPjJmMYAave0aFgxX8OYHtnqTMe/hAP5lJQR30rOMC6l3xOgID0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227646; c=relaxed/simple;
	bh=4Sq/1CVeRzD85KIjpnxfyqvFZlORW4g64otbK0jjiWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+QCwL7ytzprGBmwzmjTQfQph4iqrxCx5R8IBC/iQL5v7z3Ki2jFVdSYBFAB4A5zMjaCwwLjdJ27EXQerJFOHngXUAZOdGiNvdolhLQp12eAwFTtrIgIcdZkguPVxpYYZdOjQ3CnpN+nL/jYxNhlxV0lZiRv79FEFzjSFLmqcSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WLsOu/ol; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WLsOu/ol"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1390EC20868;
	Mon, 12 Jan 2026 14:20:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BB4D606FA;
	Mon, 12 Jan 2026 14:20:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87B16103C9268;
	Mon, 12 Jan 2026 15:20:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227641; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wJikY3Tv3xBu71ohhuSowpW9N3sVjLEUGSxvZacmO+Y=;
	b=WLsOu/ol/7YG/u7o8QkS2b6QZvUfdGg6ICeirrUKJvnxFf7Yapj/uQ41efx0SYmA9OgX2+
	2JqNtzu4futS8loeLggavBt++yyrb+vLdi1/Be8wbO7TTMlMOB1pj4vl+VboTuJDRMApRO
	i83kixnVRIlUYZGaV+uc9n6F7xKf5GxXYdAbfY1OPA1UJn/enseW0Iahk7fp3PvYajmVmE
	tNVFJMjlSSiNvfZz/vwRG10oX49pqON0yaUdPQhf1NYslAM6ZpF9FWwAgFY+pEjHRqNU+g
	qBUJY2DCdyYAnGExDwZG7wwiigjluqYIEtzll+OCodygDkM5GufMhMZCQgQ05A==
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
Subject: [RFC PATCH 13/77] Introduce dt_flags field in dtb header
Date: Mon, 12 Jan 2026 15:19:03 +0100
Message-ID: <20260112142009.1006236-14-herve.codina@bootlin.com>
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

There is no simple way to identify a kind of dtb.

A dtb can be a "standard" device-tree blob but with the future support
for addon dtb, a dtb could be an addon dtb.

Whereas, looking at node structures and name, we can identify if a
"standard" dtb is a pure base device-tree or an overlay device-tree,
this will be no more possible with addons. Indeed, specific node such as
__local_fixups__ and/or __fixups__ present in overlays will be no more
present in addons.

In order to avoid any complex and error prone searches in the dtb
structure to identify whether or not a dtb is an addon, encode this
information directly in the dtb itself.

This is the purpose of the dt_flags field.

Prepare the support for 'addon' flag introducing the dt_flags field
in the dtb header.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c               |  4 ++++
 flattree.c              | 17 +++++++++++++----
 libfdt/fdt.h            |  5 ++++-
 libfdt/fdt_rw.c         |  4 ++++
 libfdt/libfdt.h         |  1 +
 tests/pylibfdt_tests.py |  6 +++---
 tests/testutils.c       |  2 +-
 tests/trees.S           |  1 +
 8 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index 7300280..5c78559 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -87,6 +87,10 @@ static void dump_blob(void *blob, bool debug)
 	if (version >= 17)
 		printf("// size_dt_struct:\t0x%"PRIx32"\n",
 		       fdt32_to_cpu(bph->size_dt_struct));
+	if (version >= 18) {
+		printf("// dt_flags:\t\t0x%"PRIx32"\n",
+		       fdt32_to_cpu(bph->dt_flags));
+	}
 	printf("\n");
 
 	for (i = 0; ; i++) {
diff --git a/flattree.c b/flattree.c
index 07f7545..2e2ffcb 100644
--- a/flattree.c
+++ b/flattree.c
@@ -14,6 +14,7 @@
 #define FTF_STRUCTSIZE	0x20
 #define FTF_NOPS	0x40
 #define FTF_REF_XXX	0x80
+#define FTF_DTFLAGS	0x100
 
 static struct version_info {
 	int version;
@@ -32,7 +33,8 @@ static struct version_info {
 	{17, 16, FDT_V17_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
 	{18, 18, FDT_V18_SIZE,
-	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_REF_XXX},
+	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_REF_XXX|
+	 FTF_DTFLAGS},
 };
 
 struct emitter {
@@ -370,7 +372,7 @@ static struct data flatten_reserve_list(struct reserve_info *reservelist,
 static void make_fdt_header(struct fdt_header *fdt,
 			    struct version_info *vi,
 			    int reservesize, int dtsize, int strsize,
-			    int boot_cpuid_phys)
+			    int boot_cpuid_phys, uint32_t dt_flags)
 {
 	int reserve_off;
 
@@ -397,6 +399,8 @@ static void make_fdt_header(struct fdt_header *fdt,
 		fdt->size_dt_strings = cpu_to_fdt32(strsize);
 	if (vi->flags & FTF_STRUCTSIZE)
 		fdt->size_dt_struct = cpu_to_fdt32(dtsize);
+	if (vi->flags & FTF_DTFLAGS)
+		fdt->dt_flags = cpu_to_fdt32(dt_flags);
 }
 
 void dt_to_blob(FILE *f, struct dt_info *dti, int version)
@@ -424,7 +428,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 
 	/* Make header */
 	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
-			dti->boot_cpuid_phys);
+			dti->boot_cpuid_phys, 0);
 
 	/*
 	 * If the user asked for more space than is used, adjust the totalsize.
@@ -555,6 +559,11 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 			symprefix, symprefix);
 	}
 
+	if (vi->flags & FTF_DTFLAGS) {
+		fprintf(f, "\t/* dt_flags */\n");
+		asm_emit_cell(f, 0);
+	}
+
 	/*
 	 * Reserve map entries.
 	 * Align the reserve map to a doubleword boundary.
@@ -980,7 +989,7 @@ struct dt_info *dt_from_blob(const char *fname)
 	}
 
 	if (version >= 18)
-		flags |= FTF_REF_XXX;
+		flags |= FTF_REF_XXX | FTF_DTFLAGS;
 
 	inbuf_init(&memresvbuf,
 		   blob + off_mem_rsvmap, blob + totalsize);
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 530d2e5..128e7bc 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -26,6 +26,9 @@ struct fdt_header {
 
 	/* version 17 fields below */
 	fdt32_t size_dt_struct;		 /* size of the structure block */
+
+	/* version 18 fields below */
+	fdt32_t dt_flags;		/* Ored value of FDT_FLAG_XXXX */
 };
 
 struct fdt_reserve_entry {
@@ -65,6 +68,6 @@ struct fdt_property {
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
 #define FDT_V16_SIZE	FDT_V3_SIZE
 #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
-#define FDT_V18_SIZE	FDT_V17_SIZE
+#define FDT_V18_SIZE	(FDT_V17_SIZE + sizeof(fdt32_t))
 
 #endif /* FDT_H */
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 00e32bb..1528b33 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -457,6 +457,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 			return err;
 		fdt_set_version(buf, 18);
 		fdt_set_last_comp_version(buf, 18);
+		if (can_assume(LATEST) || fdt_version(fdt) < 18)
+			fdt_set_dt_flags(buf, 0);
 		fdt_set_size_dt_struct(buf, struct_size);
 		fdt_set_totalsize(buf, bufsize);
 		return 0;
@@ -487,6 +489,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 	fdt_set_totalsize(buf, bufsize);
 	fdt_set_version(buf, 18);
 	fdt_set_last_comp_version(buf, 18);
+	if (can_assume(LATEST) || fdt_version(fdt) < 18)
+		fdt_set_dt_flags(buf, 0);
 	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
 
 	return 0;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index d1a9cd5..9777f32 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -319,6 +319,7 @@ fdt_set_hdr_(last_comp_version)
 fdt_set_hdr_(boot_cpuid_phys)
 fdt_set_hdr_(size_dt_strings)
 fdt_set_hdr_(size_dt_struct)
+fdt_set_hdr_(dt_flags)
 #undef fdt_set_hdr_
 
 /**
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 373e11a..7d5ab0b 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -285,9 +285,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         """Test that we can access the header values"""
         self.assertEqual(self.fdt.magic(), 0xd00dfeed)
         self.assertEqual(self.fdt.totalsize(), len(self.fdt._fdt))
-        self.assertEqual(self.fdt.off_dt_struct(), 88)
-        self.assertEqual(self.fdt.off_dt_strings(), 652)
-        self.assertEqual(self.fdt.off_mem_rsvmap(), 40)
+        self.assertEqual(self.fdt.off_dt_struct(), 96)
+        self.assertEqual(self.fdt.off_dt_strings(), 660)
+        self.assertEqual(self.fdt.off_mem_rsvmap(), 48)
         self.assertEqual(self.fdt.version(), 18)
         self.assertEqual(self.fdt.last_comp_version(), 16)
         self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
diff --git a/tests/testutils.c b/tests/testutils.c
index 54da2e4..2d5cfb3 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -344,7 +344,7 @@ void *open_blob_rw(const void *blob)
 {
 	int err;
 	void *buf;
-	int newsize = fdt_totalsize(blob) + 8;
+	int newsize = fdt_totalsize(blob) + 8 + 4;
 
 	buf = xmalloc(newsize);
 	err = fdt_open_into(blob, buf, newsize);
diff --git a/tests/trees.S b/tests/trees.S
index ecd43bc..56c1002 100644
--- a/tests/trees.S
+++ b/tests/trees.S
@@ -22,6 +22,7 @@
 	fdtlong	0
 	fdtlong	(\tree\()_strings_end - \tree\()_strings)
 	fdtlong	(\tree\()_struct_end - \tree\()_struct)
+	fdtlong	0
 	.endm
 
 	.macro	rsvmape	addrh, addrl, lenh, lenl
-- 
2.52.0

