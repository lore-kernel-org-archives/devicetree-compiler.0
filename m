Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F88C3AEF45;
	Tue, 10 Feb 2026 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744887; cv=none; b=sOwfB9GS/L97Ti3hau9nX4uWCkszftm+rqbD/ksus+YdTSIVOg89caaIdYqjibJzrHmwgDjPWhal19f1kKwUKHiJ30zJ1OavCM7sZpAll9q27Gy2oG8W/foGyD1VysXiWunYEbG970H06vv5VoLnzcw4Qtp2wPBiMJirfiJhs+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744887; c=relaxed/simple;
	bh=SYKpQnuz+Y5v0rw8rQaSB4C2BbMeU2JFsVkisVva0+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqJnJa0YOfqXei7Ulkoy0E9UZuuFCoYHKluKXY4GLx0ucT+voWZEYR5Te5VH3xfYyrGddcngwRDPnsw0as0HZRdNX9KQDU8P668DpF0mAzIAIUZPqvQhYAUtH3xi2te7BCaXmPHwikSt2HBDpBKuiUlfjuwGoowTKNdGP5NqbTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k+c9BIJV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k+c9BIJV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 61FE21A0DAD;
	Tue, 10 Feb 2026 17:34:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 320ED606C0;
	Tue, 10 Feb 2026 17:34:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D827810B91B35;
	Tue, 10 Feb 2026 18:34:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744883; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=iVTtB/uyZ3EoE86/WiaQu00UBhCqGXt3XbnwrkN05Go=;
	b=k+c9BIJVL37lclpgqPXKWbDwD0aoKcnnh9S9QOMiuVRGgbDMpuHC7EFTKQ6PuYELEpn3Ux
	vb+/Ys5r14GDuPSp5wOdgC/SdqV1yFKJT5AhFtYfrH3urMLzMTw3WfYBtu1pJZ4z13YnMQ
	oP2hZdOsg23OgRGXkyWf7XcEuPTMXJyFbKgRGtHKxdQgPNJ7A0C3QQunC+yClH0ehM90gu
	ddEPtVfd/+ZDxUF/oFtEM66vUId4r1tz5hO9UvwGqEfHqL8wc8L58hhhw+Jnos/KeiFcTG
	Iilf9Lb7Px3ks1064pxEQ7G7ORDE6jj6WY0B0zapDoJHfiY7swaj+2lyp+Ru0w==
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
Subject: [RFC PATCH 15/15] Introduce v18 dtb version
Date: Tue, 10 Feb 2026 18:33:43 +0100
Message-ID: <20260210173349.636766-16-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210173349.636766-1-herve.codina@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This v18 version will add support for
  - Structured tags.
    Those tags value definition will allow old libfdt, dtc and other
    tools to skip unknown tags if encountered in future dtb version.

  - dt_flags header field.
    For now this flag field is set to 0. It is a placeholder for future
    dtb version and could be used to store some dtb related information
    such as the kind of dtb.

  - last_comp_version_w header field.
    This field is similar to last_comp_version but for writing.
    It contains the lowest version of the devicetree data structure with
    which the version used can safely perform modifications (taking into
    account following rules related to unknown tags).
    If this lowest version is greater than the last known supported
    version, modification are simply forbidden and lead to a
    FDT_ERR_BADVERSION error.

For modification, when an unknown tag that can be skipped is involved
and last_comp_version_w allows modifications, the following rules
applies:
  - When a property is modified, tags related to this property are
    removed and the dtb version is downgraded.

  - When a property is removed, tags related to this property are
    obviously removed. The dtb version is kept unchanged.

  - When a property or a node is added, obviously no unknown tags are
    added and the dtb version is kept unchanged.

  - When a node is removed, tags related to this node are obviously
    removed. The dtb version is kept unchanged.

  - Adding, removing or modifying a property is not considered as a node
    modification and so, those operations have no impacts on unknown
    tags related to the node. Those node related tags are kept
    unchanged.

  - The only modification considered as a node modification is setting
    its name. We consider that this operation has no impact on tags
    related to the node. Here also, those node related tags and the dtb
    version are kept unchanged.

  - Global (dtb related) unknown tags are kept unchanged regardless the
    modification done.

In all cases, if unknown tags are not involved in a modification, the
dtb version is not downgraded when the modification is node.

Compared to previous version, it is worth noting that the dtb is not
downgrade for all modification but only when unknown tags are removed
due a property modification.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.h                                         |  2 +-
 fdtdump.c                                     |  8 +++-
 flattree.c                                    | 37 +++++++++++++++----
 libfdt/fdt.h                                  |  5 +++
 libfdt/fdt_rw.c                               | 20 +++++++---
 libfdt/fdt_sw.c                               |  3 ++
 libfdt/libfdt.h                               |  7 +++-
 pylibfdt/libfdt.i                             | 18 +++++++++
 tests/dumptrees.c                             |  3 +-
 tests/pylibfdt_tests.py                       | 10 +++--
 tests/run_tests.sh                            | 26 +++++++++----
 tests/testdata.h                              |  1 +
 tests/testutils.c                             |  2 +-
 tests/trees.S                                 | 29 +++++++++++++--
 ...own_tags_can_skip.fdtput.test.dtb.0.expect |  1 +
 ...own_tags_can_skip.fdtput.test.dtb.1.expect |  3 +-
 ...own_tags_can_skip.fdtput.test.dtb.2.expect |  3 +-
 ...own_tags_can_skip.fdtput.test.dtb.3.expect |  3 +-
 ...own_tags_can_skip.fdtput.test.dtb.4.expect |  3 +-
 ...own_tags_can_skip.fdtput.test.dtb.5.expect |  3 +-
 ...own_tags_can_skip.fdtput.test.dtb.6.expect |  3 +-
 21 files changed, 152 insertions(+), 38 deletions(-)

diff --git a/dtc.h b/dtc.h
index 473552e..f0c2cde 100644
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
index eb8cda9..22ae798 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -18,7 +18,7 @@
 #include "util.h"
 
 #define FDT_MAGIC_SIZE	4
-#define MAX_VERSION 17U
+#define MAX_VERSION 18U
 
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
@@ -86,6 +86,12 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 	if (version >= 17)
 		printf("// size_dt_struct:\t0x%"PRIx32"\n",
 		       fdt32_to_cpu(bph->size_dt_struct));
+	if (version >= 18) {
+		printf("// dt_flags:\t\t0x%"PRIx32"\n",
+		       fdt32_to_cpu(bph->dt_flags));
+		printf("// last_comp_version_w:\t%"PRIu32"\n",
+		       fdt32_to_cpu(bph->last_comp_version_w));
+	}
 	printf("\n");
 
 	for (i = 0; ; i++) {
diff --git a/flattree.c b/flattree.c
index 23813e2..ffd3cc5 100644
--- a/flattree.c
+++ b/flattree.c
@@ -13,23 +13,29 @@
 #define FTF_STRTABSIZE	0x10
 #define FTF_STRUCTSIZE	0x20
 #define FTF_NOPS	0x40
+#define FTF_DTFLAGS	0x80
+#define FTF_LCVERSW	0x100
 
 static struct version_info {
 	int version;
 	int last_comp_version;
+	int last_comp_version_w;
 	int hdr_size;
 	int flags;
 } version_table[] = {
-	{1, 1, FDT_V1_SIZE,
+	{1, 1, 0, FDT_V1_SIZE,
 	 FTF_FULLPATH|FTF_VARALIGN|FTF_NAMEPROPS},
-	{2, 1, FDT_V2_SIZE,
+	{2, 1, 0, FDT_V2_SIZE,
 	 FTF_FULLPATH|FTF_VARALIGN|FTF_NAMEPROPS|FTF_BOOTCPUID},
-	{3, 1, FDT_V3_SIZE,
+	{3, 1, 0, FDT_V3_SIZE,
 	 FTF_FULLPATH|FTF_VARALIGN|FTF_NAMEPROPS|FTF_BOOTCPUID|FTF_STRTABSIZE},
-	{16, 16, FDT_V3_SIZE,
+	{16, 16, 0, FDT_V3_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_NOPS},
-	{17, 16, FDT_V17_SIZE,
+	{17, 16, 0, FDT_V17_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
+	{18, 16, 17, FDT_V18_SIZE,
+	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
+	 FTF_LCVERSW},
 };
 
 struct emitter {
@@ -314,7 +320,7 @@ static struct data flatten_reserve_list(struct reserve_info *reservelist,
 static void make_fdt_header(struct fdt_header *fdt,
 			    struct version_info *vi,
 			    int reservesize, int dtsize, int strsize,
-			    int boot_cpuid_phys)
+			    int boot_cpuid_phys, uint32_t dt_flags)
 {
 	int reserve_off;
 
@@ -341,6 +347,10 @@ static void make_fdt_header(struct fdt_header *fdt,
 		fdt->size_dt_strings = cpu_to_fdt32(strsize);
 	if (vi->flags & FTF_STRUCTSIZE)
 		fdt->size_dt_struct = cpu_to_fdt32(dtsize);
+	if (vi->flags & FTF_DTFLAGS)
+		fdt->dt_flags = cpu_to_fdt32(dt_flags);
+	if (vi->flags & FTF_LCVERSW)
+		fdt->last_comp_version_w = cpu_to_fdt32(vi->last_comp_version_w);
 }
 
 void dt_to_blob(FILE *f, struct dt_info *dti, int version)
@@ -368,7 +378,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 
 	/* Make header */
 	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
-			dti->boot_cpuid_phys);
+			dti->boot_cpuid_phys, 0);
 
 	/*
 	 * If the user asked for more space than is used, adjust the totalsize.
@@ -499,6 +509,16 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 			symprefix, symprefix);
 	}
 
+	if (vi->flags & FTF_DTFLAGS) {
+		fprintf(f, "\t/* dt_flags */\n");
+		asm_emit_cell(f, 0);
+	}
+
+	if (vi->flags & FTF_LCVERSW) {
+		fprintf(f, "\t/* last_comp_version_w */\n");
+		asm_emit_cell(f, vi->last_comp_version_w);
+	}
+
 	/*
 	 * Reserve map entries.
 	 * Align the reserve map to a doubleword boundary.
@@ -955,6 +975,9 @@ struct dt_info *dt_from_blob(const char *fname)
 		flags |= FTF_NOPS;
 	}
 
+	if (version >= 18)
+		flags |= FTF_DTFLAGS | FTF_LCVERSW;
+
 	inbuf_init(&memresvbuf,
 		   blob + off_mem_rsvmap, blob + totalsize);
 	inbuf_init(&dtbuf, blob + off_dt, blob + totalsize);
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 2e07599..56aa75b 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -26,6 +26,10 @@ struct fdt_header {
 
 	/* version 17 fields below */
 	fdt32_t size_dt_struct;		 /* size of the structure block */
+
+	/* version 18 fields below */
+	fdt32_t dt_flags;		/* Ored value of FDT_FLAG_XXXX */
+	fdt32_t last_comp_version_w;	/* last compatible version for writing */
 };
 
 struct fdt_reserve_entry {
@@ -85,5 +89,6 @@ struct fdt_property {
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
 #define FDT_V16_SIZE	FDT_V3_SIZE
 #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
+#define FDT_V18_SIZE	(FDT_V17_SIZE + 2 * sizeof(fdt32_t))
 
 #endif /* FDT_H */
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index a8f53b4..0a4a03f 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -34,13 +34,17 @@ static int fdt_rw_probe_(void *fdt)
 		return 0;
 	FDT_RO_PROBE(fdt);
 
-	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
-		return -FDT_ERR_BADVERSION;
+	if (!can_assume(LATEST)) {
+		if (fdt_version(fdt) < 17)
+			return -FDT_ERR_BADVERSION;
+		else if (fdt_version(fdt) >= 18 &&
+			 fdt_last_comp_version_w(fdt) > FDT_LAST_SUPPORTED_VERSION)
+			return -FDT_ERR_BADVERSION;
+	}
 	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
 				   fdt_size_dt_struct(fdt)))
 		return -FDT_ERR_BADLAYOUT;
 
-	fdt_downgrade_version(fdt);
 	return 0;
 }
 
@@ -582,7 +586,11 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 		err = fdt_move(fdt, buf, bufsize);
 		if (err)
 			return err;
-		fdt_set_version(buf, 17);
+		if (can_assume(LATEST) || fdt_version(fdt) < 18) {
+			fdt_set_version(buf, 18);
+			fdt_set_dt_flags(buf, 0);
+			fdt_set_last_comp_version_w(buf, 17);
+		}
 		fdt_set_size_dt_struct(buf, struct_size);
 		fdt_set_totalsize(buf, bufsize);
 		return 0;
@@ -611,8 +619,10 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	fdt_set_magic(buf, FDT_MAGIC);
 	fdt_set_totalsize(buf, bufsize);
-	fdt_set_version(buf, 17);
+	fdt_set_version(buf, 18);
 	fdt_set_last_comp_version(buf, 16);
+	fdt_set_dt_flags(buf, 0);
+	fdt_set_last_comp_version_w(buf, 17);
 	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
 
 	return 0;
diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 4c569ee..10da0d6 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -137,6 +137,9 @@ int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags)
 	fdt_set_off_dt_struct(fdt, fdt_off_mem_rsvmap(fdt));
 	fdt_set_off_dt_strings(fdt, 0);
 
+	fdt_set_dt_flags(fdt, 0);
+	fdt_set_last_comp_version_w(fdt, FDT_LAST_COMPATIBLE_VERSION_W);
+
 	return 0;
 }
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 7a10f66..71c7de5 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -15,7 +15,8 @@ extern "C" {
 
 #define FDT_FIRST_SUPPORTED_VERSION	0x02
 #define FDT_LAST_COMPATIBLE_VERSION	0x10
-#define FDT_LAST_SUPPORTED_VERSION	0x11
+#define FDT_LAST_COMPATIBLE_VERSION_W	0x11
+#define FDT_LAST_SUPPORTED_VERSION	0x12
 
 /* Error codes: informative error codes */
 #define FDT_ERR_NOTFOUND	1
@@ -284,6 +285,8 @@ int fdt_next_subnode(const void *fdt, int offset);
 #define fdt_boot_cpuid_phys(fdt)	(fdt_get_header(fdt, boot_cpuid_phys))
 #define fdt_size_dt_strings(fdt)	(fdt_get_header(fdt, size_dt_strings))
 #define fdt_size_dt_struct(fdt)		(fdt_get_header(fdt, size_dt_struct))
+#define fdt_dt_flags(fdt)		(fdt_get_header(fdt, dt_flags))
+#define fdt_last_comp_version_w(fdt)	(fdt_get_header(fdt, last_comp_version_w))
 
 #define fdt_set_hdr_(name) \
 	static inline void fdt_set_##name(void *fdt, uint32_t val) \
@@ -301,6 +304,8 @@ fdt_set_hdr_(last_comp_version)
 fdt_set_hdr_(boot_cpuid_phys)
 fdt_set_hdr_(size_dt_strings)
 fdt_set_hdr_(size_dt_struct)
+fdt_set_hdr_(dt_flags)
+fdt_set_hdr_(last_comp_version_w)
 #undef fdt_set_hdr_
 
 /**
diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 1f9c047..90966bd 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -281,6 +281,22 @@ class FdtRo(object):
         """
         return fdt_size_dt_struct(self._fdt)
 
+    def dt_flags(self):
+        """Return flags from the header
+
+        Returns:
+            flags value from the header
+        """
+        return fdt_dt_flags(self._fdt)
+
+    def last_comp_version_w(self):
+        """Return the last compatible version for writing of the device tree
+
+        Returns:
+            Last compatible version number for writing of the device tree
+        """
+        return fdt_last_comp_version_w(self._fdt)
+
     def num_mem_rsv(self, quiet=()):
         """Return the number of memory reserve-map records
 
@@ -1215,6 +1231,8 @@ uint32_t fdt_last_comp_version(const void *fdt);
 uint32_t fdt_boot_cpuid_phys(const void *fdt);
 uint32_t fdt_size_dt_strings(const void *fdt);
 uint32_t fdt_size_dt_struct(const void *fdt);
+uint32_t fdt_dt_flags(const void *fdt);
+uint32_t fdt_last_comp_version_w(const void *fdt);
 
 int fdt_property_string(void *fdt, const char *name, const char *val);
 int fdt_property_cell(void *fdt, const char *name, uint32_t val);
diff --git a/tests/dumptrees.c b/tests/dumptrees.c
index 4732fff..c05d216 100644
--- a/tests/dumptrees.c
+++ b/tests/dumptrees.c
@@ -27,7 +27,8 @@ static struct {
 	TREE(two_roots),
 	TREE(named_root),
 	TREE(unknown_tags_can_skip),
-	TREE(unknown_tags_no_skip)
+	TREE(unknown_tags_no_skip),
+	TREE(last_comp_version_w_future)
 };
 
 #define NUM_TREES	(sizeof(trees) / sizeof(trees[0]))
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index a4f73ed..72c98c5 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -285,14 +285,16 @@ class PyLibfdtBasicTests(unittest.TestCase):
         """Test that we can access the header values"""
         self.assertEqual(self.fdt.magic(), 0xd00dfeed)
         self.assertEqual(self.fdt.totalsize(), len(self.fdt._fdt))
-        self.assertEqual(self.fdt.off_dt_struct(), 88)
-        self.assertEqual(self.fdt.off_dt_strings(), 652)
-        self.assertEqual(self.fdt.off_mem_rsvmap(), 40)
-        self.assertEqual(self.fdt.version(), 17)
+        self.assertEqual(self.fdt.off_dt_struct(), 96)
+        self.assertEqual(self.fdt.off_dt_strings(), 660)
+        self.assertEqual(self.fdt.off_mem_rsvmap(), 48)
+        self.assertEqual(self.fdt.version(), 18)
         self.assertEqual(self.fdt.last_comp_version(), 16)
         self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
         self.assertEqual(self.fdt.size_dt_strings(), 105)
         self.assertEqual(self.fdt.size_dt_struct(), 564)
+        self.assertEqual(self.fdt.dt_flags(), 0)
+        self.assertEqual(self.fdt.last_comp_version_w(), 17)
 
     def testPack(self):
         """Test that we can pack the tree after deleting something"""
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e88f641..1253b88 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -576,7 +576,8 @@ libfdt_tests () {
     run_test dtbs_equal_ordered cell-overflow.test.dtb cell-overflow-results.test.dtb
 
     # check full tests
-    for good in test_tree1.dtb unknown_tags_can_skip.dtb; do
+    for good in test_tree1.dtb unknown_tags_can_skip.dtb \
+		last_comp_version_w_future.dtb; do
 	run_test check_full $good
     done
     for bad in truncated_property.dtb truncated_string.dtb \
@@ -1044,32 +1045,41 @@ fdtput_tests () {
 
     # TODO: Add tests for verbose mode?
 
+    # Not allowed to modify a dtb due to last_comp_version_w
+    # FDT_ERR_BADVERSION error code is returned
+    dtb=last_comp_version_w_future.fdtput.test.dtb
+    cp last_comp_version_w_future.dtb $dtb
+    run_wrap_error_test $DTPUT $dtb /subnode prop-int -tu 123
+    run_wrap_error_test $DTPUT $dtb -d /subnode prop-int
+    run_wrap_error_test $DTPUT $dtb -c /new-node
+    run_wrap_error_test $DTPUT $dtb -r /subnode
+
     # Modify a dtb containing some "unknown" tags that can be skipped
     dtb=unknown_tags_can_skip.fdtput.test.dtb
     cp unknown_tags_can_skip.dtb $dtb
     base_run_test wrap_fdtdump $dtb $dtb.0.out
     # Remove unneeded header fields (keep those related to versions)
-    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.0.out
     base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
 
     run_fdtput_test "vwxyz" $dtb / prop-str -ts "vwxyz"
     base_run_test wrap_fdtdump $dtb $dtb.1.out
     # Remove unneeded header fields (keep those related to versions)
-    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.1.out
     base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
 
     cp unknown_tags_can_skip.dtb $dtb
     run_wrap_test $DTPUT $dtb -c /tst-fdtput
     base_run_test wrap_fdtdump $dtb $dtb.2.out
     # Remove unneeded header fields (keep those related to versions)
-    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.2.out
     base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
     run_wrap_test $DTPUT $dtb -c /tst-fdtput/n1 /tst-fdtput/n2 /tst-fdtput/n3
     run_wrap_test $DTPUT $dtb -r /tst-fdtput/n1 /tst-fdtput/n3
     run_fdtget_test "n2" $dtb -l  /tst-fdtput
     base_run_test wrap_fdtdump $dtb $dtb.3.out
     # Remove unneeded header fields (keep those related to versions)
-    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.3.out
     base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
 
     cp unknown_tags_can_skip.dtb $dtb
@@ -1077,21 +1087,21 @@ fdtput_tests () {
     run_fdtget_test "prop-int" $dtb -p  /
     base_run_test wrap_fdtdump $dtb $dtb.4.out
     # Remove unneeded header fields (keep those related to versions)
-    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.4.out
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.4.out
     base_run_test check_diff $dtb.4.out "$SRCDIR/$dtb.4.expect"
 
     cp unknown_tags_can_skip.dtb $dtb
     run_wrap_test $DTPUT $dtb /subnode2 prop-tst-fdtput -ts "Test fdtput"
     base_run_test wrap_fdtdump $dtb $dtb.5.out
     # Remove unneeded header fields (keep those related to versions)
-    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.5.out
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.5.out
     base_run_test check_diff $dtb.5.out "$SRCDIR/$dtb.5.expect"
 
     cp unknown_tags_can_skip.dtb $dtb
     run_wrap_test $DTPUT $dtb -r /subnode2/subsubnode
     base_run_test wrap_fdtdump $dtb $dtb.6.out
     # Remove unneeded header fields (keep those related to versions)
-    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.6.out
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.6.out
     base_run_test check_diff $dtb.6.out "$SRCDIR/$dtb.6.expect"
 }
 
diff --git a/tests/testdata.h b/tests/testdata.h
index aef04ab..26c7c18 100644
--- a/tests/testdata.h
+++ b/tests/testdata.h
@@ -59,4 +59,5 @@ extern struct fdt_header two_roots;
 extern struct fdt_header named_root;
 extern struct fdt_header unknown_tags_can_skip;
 extern struct fdt_header unknown_tags_no_skip;
+extern struct fdt_header last_comp_version_w_future;
 #endif /* ! __ASSEMBLER__ */
diff --git a/tests/testutils.c b/tests/testutils.c
index 54da2e4..728d89c 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -344,7 +344,7 @@ void *open_blob_rw(const void *blob)
 {
 	int err;
 	void *buf;
-	int newsize = fdt_totalsize(blob) + 8;
+	int newsize = fdt_totalsize(blob) + 8 + 2 * 4;
 
 	buf = xmalloc(newsize);
 	err = fdt_open_into(blob, buf, newsize);
diff --git a/tests/trees.S b/tests/trees.S
index 221c9fd..73b2d0b 100644
--- a/tests/trees.S
+++ b/tests/trees.S
@@ -8,7 +8,7 @@
 	.byte	(\val) & 0xff
 	.endm
 
-	.macro	treehdr_vers	tree vers last_comp_vers
+	.macro	treehdr_vers	tree vers last_comp_vers last_comp_vers_w
 	.balign	8
 	.globl	\tree
 \tree :
@@ -22,10 +22,12 @@
 	fdtlong	0
 	fdtlong	(\tree\()_strings_end - \tree\()_strings)
 	fdtlong	(\tree\()_struct_end - \tree\()_struct)
+	fdtlong	0
+	fdtlong	\last_comp_vers_w
 	.endm
 
 	.macro	treehdr	tree
-	treehdr_vers \tree 0x11 0x10
+	treehdr_vers \tree 0x12 0x10 0x11
 	.endm
 
 	.macro	rsvmape	addrh, addrl, lenh, lenl
@@ -334,7 +336,7 @@ named_root_end:
 	 * Use a really future dtb version to check version downgrade on
 	 * modification.
 	 */
-	treehdr_vers	unknown_tags_can_skip 0xffffffff 0x10
+	treehdr_vers	unknown_tags_can_skip 0xffffffff 0x10 0x11
 	empty_rsvmap	unknown_tags_can_skip
 
 unknown_tags_can_skip_struct:
@@ -438,3 +440,24 @@ unknown_tags_no_skip_strings:
 unknown_tags_no_skip_strings_end:
 
 unknown_tags_no_skip_end:
+
+
+	/* Tree with last_comp_version_w set to avoid any modifications */
+	treehdr_vers	last_comp_version_w_future 0xffffffff 0x10 0xffffffff
+	empty_rsvmap	last_comp_version_w_future
+
+last_comp_version_w_future_struct:
+	beginn	""
+		propu64	last_comp_version_w_future, prop_int, 1, 2
+		beginn	"subnode"
+			propu64	last_comp_version_w_future, prop_int, 1, 2
+		endn
+	endn
+	fdtlong	FDT_END
+last_comp_version_w_future_struct_end:
+
+last_comp_version_w_future_strings:
+	string	last_comp_version_w_future, prop_int, "prop-int"
+last_comp_version_w_future_strings_end:
+
+last_comp_version_w_future_end:
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
index b611a87..2de0fe4 100644
--- a/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
@@ -1,6 +1,7 @@
 /dts-v1/;
 // version:		4294967295
 // last_comp_version:	16
+// last_comp_version_w:	17
 
 // Unknown tag ignored: 0xd0000000, data lng 4 00000001
 / {
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
index 8b331f3..aac87c7 100644
--- a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
@@ -1,6 +1,7 @@
 /dts-v1/;
-// version:		17
+// version:		18
 // last_comp_version:	16
+// last_comp_version_w:	17
 
 // Unknown tag ignored: 0xd0000000, data lng 4 00000001
 / {
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
index e2dfe91..ef42222 100644
--- a/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
@@ -1,6 +1,7 @@
 /dts-v1/;
-// version:		17
+// version:		4294967295
 // last_comp_version:	16
+// last_comp_version_w:	17
 
 // Unknown tag ignored: 0xd0000000, data lng 4 00000001
 / {
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
index d12ce6f..1c902dc 100644
--- a/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
@@ -1,6 +1,7 @@
 /dts-v1/;
-// version:		17
+// version:		4294967295
 // last_comp_version:	16
+// last_comp_version_w:	17
 
 // Unknown tag ignored: 0xd0000000, data lng 4 00000001
 / {
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
index bb40346..b0630e6 100644
--- a/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
@@ -1,6 +1,7 @@
 /dts-v1/;
-// version:		17
+// version:		4294967295
 // last_comp_version:	16
+// last_comp_version_w:	17
 
 // Unknown tag ignored: 0xd0000000, data lng 4 00000001
 / {
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
index 5a5e574..2475cd3 100644
--- a/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
@@ -1,6 +1,7 @@
 /dts-v1/;
-// version:		17
+// version:		4294967295
 // last_comp_version:	16
+// last_comp_version_w:	17
 
 // Unknown tag ignored: 0xd0000000, data lng 4 00000001
 / {
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
index f62c1e1..7485b9f 100644
--- a/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
@@ -1,6 +1,7 @@
 /dts-v1/;
-// version:		17
+// version:		4294967295
 // last_comp_version:	16
+// last_comp_version_w:	17
 
 // Unknown tag ignored: 0xd0000000, data lng 4 00000001
 / {
-- 
2.52.0

