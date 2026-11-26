Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692293;
	b=LJfFj9XWXBElCMFvaIjgS15BpGhYVy/11obbsQYHbggE+7hqUe7Ojz6TYwiKr2tLJD1C
	 akv4CWLNxx7LIjP3Y7n0YIJAO9eWc3iVgbMb335l7TETNHI/pT4krX9xLlSciDrNlRSLh
	 /pgA04h5uS7on9Oq1VlS0YGnHMOV38fn2uRcwKe763IIquPWpZpm4ZQGvb7kY2GUGg5E/
	 n8BtCy7kCIPiChASwQxLSWVvNAGtj83VeEu6ltTYkyFy18GQ1jeSFlFtI17RAapT9UWc7
	 wuyRsPMhFTEjfKoH0OuKbriVx4E5YhpK/TO/lAzZ6278agQHWJhe340RAXzuzZkOyFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692293;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=VoQskt+q4RRRoA7TEsYHX9d9o3Fufn1/bRUZuwTUZb0=;
	b=PKP9uK86Y7E/ViDUoCj8Fj9xad6eQUk2kEDEobo6T/eqMWi9Lxyo6EDfhtPWUvwq2yRK
	 eI1mb5SZ6wvJtMZlSFMivaSMoheC5cKZHEGCzmjKBqrFcE1ZZsi5fsxvE9DRoIC6slACz
	 q+01SXD8A7n+/gv7gfoza0DmfySuNHyZ0KO9pTdr0w7F3dXpGnXlTFTohQGrSB+xmzN8p
	 qvqYYxzWra/6HyDnYr9TJimAqkzSqEZOtgeGxe4SuLsK5v0UpbpeYErXbKMBo3wYMoGMj
	 l1Y1xRVWHUh/F9SdV/+eTM1L9kxoJHJ20UIswxbbPPMnq1IsSR5e0ETrHMxUPI1zRrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XlIY16yg;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D9F606A6AD;
	Thu, 26 Nov 2026 11:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D9F606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XlIY16yg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 895EC1A1813;
	Thu, 26 Nov 2026 11:24:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E16E60237;
	Thu, 26 Nov 2026 11:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55ADF11E6B36E;
	Thu, 26 Nov 2026 12:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692290; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VoQskt+q4RRRoA7TEsYHX9d9o3Fufn1/bRUZuwTUZb0=;
	b=XlIY16ygZivPIv+uz7beubOKgenKNVRE0oNUSYWtm/648SAf4YXliCiGqYh4bk8nEDrl+l
	2GWsZvLidgRqtyDc/tAZLt+PRpOD4t4+NBpb/XIC6sC9fc1vf8AM9GeNHFKl0wDU7dRnVz
	8+4rK2beAXnUAmlRcekbi3P5bg3B8N7T0BFkrHWAXZX7ZH5ydUuAeQYOdGZOeu2c7UY1xA
	LspH2v9L3lSSU/DPcEVxfRQUm0vOivjNJ90OVolFkNIeBa3Q6ac3rFsxOiME3EvS8lJ5IE
	rajSOwdsumsgpxiOSh0JqwqVnjtzCsVbciBeSuq1kmFFth6S7RdLn8Ol0EgRYQ==
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
Subject: [PATCH v4 22/22] Introduce v18 dtb version
Date: Thu, 26 Nov 2026 12:22:39 +0100
Message-ID: <20261126112239.636284-23-herve.codina@bootlin.com>
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

This v18 version adds support for
  - Structured tags.
    Those tag value definitions will allow "old" libfdt, dtc and other
    tools to skip unknown tags if encountered in future dtb versions.

    libfdt, dtc and other tools implementing version v18 will be able to
    skip unknown tags available in dtbs generated with later versions of
    dtc.

  - dt_flags header field.
    For now, this flag field is set to 0. It is a placeholder for future
    dtb versions and could be used to store some dtb related information
    such as the kind of dtb. For instance, the future addons format will
    use this field to clearly identify that the dtb is an addon dtb.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.h                     |  2 +-
 fdtdump.c                 |  6 +++++-
 flattree.c                | 17 +++++++++++++++--
 libfdt/fdt.c              |  6 ++++--
 libfdt/fdt.h              |  4 ++++
 libfdt/fdt_rw.c           | 14 ++++++++++++--
 libfdt/fdt_sw.c           |  2 ++
 libfdt/libfdt.h           |  4 +++-
 pylibfdt/libfdt.i         |  9 +++++++++
 tests/Makefile.tests      |  1 +
 tests/dtflags_default.dts | 10 ++++++++++
 tests/meson.build         |  1 +
 tests/pylibfdt_tests.py   |  9 +++++----
 tests/run_tests.sh        |  7 ++++++-
 tests/testutils.c         |  2 +-
 tests/treegen.c           |  3 ++-
 tests/treegen_base.c      | 39 +++++++++++++++++++++++++++++++++++++++
 17 files changed, 120 insertions(+), 16 deletions(-)
 create mode 100644 tests/dtflags_default.dts

diff --git a/dtc.h b/dtc.h
index 8e02b2f8..91bae4d2 100644
--- a/dtc.h
+++ b/dtc.h
@@ -25,7 +25,7 @@
 #define debug(...)
 #endif
 
-#define DEFAULT_FDT_VERSION	17
+#define DEFAULT_FDT_VERSION	18
 
 /*
  * Command line options
diff --git a/fdtdump.c b/fdtdump.c
index 91759973..89186614 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -17,7 +17,7 @@
 #include "util.h"
 
 #define FDT_MAGIC_SIZE	4
-#define MAX_VERSION 17U
+#define MAX_VERSION 18U
 
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
@@ -114,6 +114,10 @@ static void dump_blob(void *blob, bool debug)
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
index 90ff62ae..a8188dbe 100644
--- a/flattree.c
+++ b/flattree.c
@@ -14,6 +14,7 @@
 #define FTF_STRTABSIZE	0x10
 #define FTF_STRUCTSIZE	0x20
 #define FTF_NOPS	0x40
+#define FTF_DTFLAGS	0x80
 
 static struct version_info {
 	int version;
@@ -31,6 +32,8 @@ static struct version_info {
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_NOPS},
 	{17, 16, FDT_V17_SIZE,
 	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
+	{18, 16, FDT_V18_SIZE,
+	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS},
 };
 
 struct emitter {
@@ -315,7 +318,7 @@ static struct data flatten_reserve_list(struct reserve_info *reservelist,
 static void make_fdt_header(struct fdt_header *fdt,
 			    struct version_info *vi,
 			    int reservesize, int dtsize, int strsize,
-			    int boot_cpuid_phys)
+			    int boot_cpuid_phys, uint32_t dt_flags)
 {
 	int reserve_off;
 
@@ -342,6 +345,8 @@ static void make_fdt_header(struct fdt_header *fdt,
 		fdt->size_dt_strings = cpu_to_fdt32(strsize);
 	if (vi->flags & FTF_STRUCTSIZE)
 		fdt->size_dt_struct = cpu_to_fdt32(dtsize);
+	if (vi->flags & FTF_DTFLAGS)
+		fdt->dt_flags = cpu_to_fdt32(dt_flags);
 }
 
 void dt_to_blob(FILE *f, struct dt_info *dti, int version)
@@ -369,7 +374,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 
 	/* Make header */
 	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
-			dti->boot_cpuid_phys);
+			dti->boot_cpuid_phys, 0);
 
 	/*
 	 * If the user asked for more space than is used, adjust the totalsize.
@@ -500,6 +505,11 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
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
@@ -964,6 +974,9 @@ struct dt_info *dt_from_blob(const char *fname)
 		flags |= FTF_NOPS;
 	}
 
+	if (version >= 18)
+		flags |= FTF_DTFLAGS;
+
 	inbuf_init(&memresvbuf,
 		   blob + off_mem_rsvmap, blob + totalsize);
 	inbuf_init(&dtbuf, blob + off_dt, blob + totalsize);
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index cce37c23..695938bc 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -76,13 +76,15 @@ size_t fdt_header_size_(uint32_t version)
 		return FDT_V3_SIZE;
 	else if (version <= 16)
 		return FDT_V16_SIZE;
-	else
+	else if (version <= 17)
 		return FDT_V17_SIZE;
+	else
+		return FDT_V18_SIZE;
 }
 
 size_t fdt_header_size(const void *fdt)
 {
-	return can_assume(LATEST) ? FDT_V17_SIZE :
+	return can_assume(LATEST) ? FDT_V18_SIZE :
 		fdt_header_size_(fdt_version(fdt));
 }
 
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 6b09b941..1afe549c 100644
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
@@ -138,5 +141,6 @@ struct fdt_property {
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
 #define FDT_V16_SIZE	FDT_V3_SIZE
 #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
+#define FDT_V18_SIZE	(FDT_V17_SIZE + sizeof(fdt32_t))
 
 #endif /* FDT_H */
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 110e27d9..f669919f 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -628,6 +628,7 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 	int newsize;
 	const char *fdtstart = fdt;
 	const char *fdtend = fdtstart + fdt_totalsize(fdt);
+	uint32_t dt_flags;
 	char *tmp;
 
 	FDT_RO_PROBE(fdt);
@@ -637,6 +638,11 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 		return err;
 	mem_rsv_size = (err + 1) * sizeof(struct fdt_reserve_entry);
 
+	if (can_assume(LATEST) || fdt_version(fdt) >= 18)
+		dt_flags = fdt_dt_flags(fdt);
+	else
+		dt_flags = 0;
+
 	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 		struct_size = fdt_size_dt_struct(fdt);
 	} else if (fdt_version(fdt) == 16) {
@@ -655,7 +661,10 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 		err = fdt_move(fdt, buf, bufsize);
 		if (err)
 			return err;
-		fdt_set_version(buf, 17);
+		if (can_assume(LATEST) || fdt_version(fdt) < 18) {
+			fdt_set_version(buf, 18);
+			fdt_set_dt_flags(buf, dt_flags);
+		}
 		fdt_set_size_dt_struct(buf, struct_size);
 		fdt_set_totalsize(buf, bufsize);
 		return 0;
@@ -684,8 +693,9 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	fdt_set_magic(buf, FDT_MAGIC);
 	fdt_set_totalsize(buf, bufsize);
-	fdt_set_version(buf, 17);
+	fdt_set_version(buf, 18);
 	fdt_set_last_comp_version(buf, 16);
+	fdt_set_dt_flags(buf, dt_flags);
 	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
 
 	return 0;
diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index f5053ee7..15cf8ac3 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -137,6 +137,8 @@ int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags)
 	fdt_set_off_dt_struct(fdt, fdt_off_mem_rsvmap(fdt));
 	fdt_set_off_dt_strings(fdt, 0);
 
+	fdt_set_dt_flags(fdt, 0);
+
 	return 0;
 }
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 82965e32..ef5580de 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -15,7 +15,7 @@ extern "C" {
 
 #define FDT_FIRST_SUPPORTED_VERSION	0x02
 #define FDT_LAST_COMPATIBLE_VERSION	0x10
-#define FDT_LAST_SUPPORTED_VERSION	0x11
+#define FDT_LAST_SUPPORTED_VERSION	0x12
 
 /* Error codes: informative error codes */
 #define FDT_ERR_NOTFOUND	1
@@ -284,6 +284,7 @@ int fdt_next_subnode(const void *fdt, int offset);
 #define fdt_boot_cpuid_phys(fdt)	(fdt_get_header(fdt, boot_cpuid_phys))
 #define fdt_size_dt_strings(fdt)	(fdt_get_header(fdt, size_dt_strings))
 #define fdt_size_dt_struct(fdt)		(fdt_get_header(fdt, size_dt_struct))
+#define fdt_dt_flags(fdt)		(fdt_get_header(fdt, dt_flags))
 
 #define fdt_set_hdr_(name) \
 	static inline void fdt_set_##name(void *fdt, uint32_t val) \
@@ -301,6 +302,7 @@ fdt_set_hdr_(last_comp_version)
 fdt_set_hdr_(boot_cpuid_phys)
 fdt_set_hdr_(size_dt_strings)
 fdt_set_hdr_(size_dt_struct)
+fdt_set_hdr_(dt_flags)
 #undef fdt_set_hdr_
 
 /**
diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index e4a9357d..1a0e805d 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -298,6 +298,14 @@ class FdtRo(object):
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
     def num_mem_rsv(self, quiet=()):
         """Return the number of memory reserve-map records
 
@@ -1411,6 +1419,7 @@ uint32_t fdt_last_comp_version(const void *fdt);
 uint32_t fdt_boot_cpuid_phys(const void *fdt);
 uint32_t fdt_size_dt_strings(const void *fdt);
 uint32_t fdt_size_dt_struct(const void *fdt);
+uint32_t fdt_dt_flags(const void *fdt);
 
 int fdt_property_string(void *fdt, const char *name, const char *val);
 int fdt_property_cell(void *fdt, const char *name, uint32_t val);
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index f22e26b4..6ed202f0 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -46,6 +46,7 @@ TESTS_TREES_L = test_tree1.dtb bad_node_char.dtb bad_node_format.dtb \
 	bad_prop_char.dtb ovf_size_strings.dtb truncated_property.dtb \
 	truncated_string.dtb truncated_memrsv.dtb unterminated_memrsv.dtb \
 	two_roots.dtb named_root.dtb root_offset_12.dtb bad_proplen.dtb \
+	dtflags_default.dtb \
 	unknown_tags_can_skip.dtb \
 	unknown_tags_removed.dtb \
 	unknown_tags_rw_node1_prop1_modified_ab.dtb \
diff --git a/tests/dtflags_default.dts b/tests/dtflags_default.dts
new file mode 100644
index 00000000..3ef867e8
--- /dev/null
+++ b/tests/dtflags_default.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+
+/ {
+	prop = <1>;
+};
diff --git a/tests/meson.build b/tests/meson.build
index c68f43bd..fee879a3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -23,6 +23,7 @@ treegen_dtb = custom_target(
     'named_root.dtb',
     'root_offset_12.dtb',
     'bad_proplen.dtb',
+    'dtflags_default.dtb',
     'unknown_tags_can_skip.dtb',
     'unknown_tags_removed.dtb',
     'unknown_tags_rw_node1_prop1_modified_ab.dtb',
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index e2f9c6d5..5ecfc320 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -301,10 +301,10 @@ class PyLibfdtBasicTests(unittest.TestCase):
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
         self.fdt.set_boot_cpuid_phys(0x42)
@@ -312,6 +312,7 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.fdt.set_boot_cpuid_phys(0)
         self.assertEqual(self.fdt.size_dt_strings(), 105)
         self.assertEqual(self.fdt.size_dt_struct(), 564)
+        self.assertEqual(self.fdt.dt_flags(), 0)
 
     def testPack(self):
         """Test that we can pack the tree after deleting something"""
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 431d45b8..6be3cae9 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -618,7 +618,8 @@ libfdt_tests () {
     run_test dtbs_equal_ordered cell-overflow.test.dtb cell-overflow-results.test.dtb
 
     # check full tests
-    for good in test_tree1.dtb unknown_tags_can_skip.dtb unknown_tags_removed.dtb; do
+    for good in test_tree1.dtb unknown_tags_can_skip.dtb unknown_tags_removed.dtb \
+		dtflags_default.dtb; do
 	run_test check_full $good
     done
     for bad in truncated_property.dtb truncated_string.dtb \
@@ -1053,6 +1054,10 @@ dtc_tests () {
     # Tests with "unknown tags"
     run_dtc_test -I dtb -O dtb -o unknown_tags_can_skip.dtb.dtb unknown_tags_can_skip.dtb
     run_test dtbs_equal_ordered --noskip-nop unknown_tags_can_skip.dtb.dtb unknown_tags_removed.dtb
+
+    # Tests dt_flags header field (default value)
+    run_dtc_test -I dts -O dtb -o dtflags_default.dts.dtb "$SRCDIR/dtflags_default.dts"
+    run_test dtbs_equal_ordered dtflags_default.dts.dtb dtflags_default.dtb
 }
 
 cmp_tests () {
diff --git a/tests/testutils.c b/tests/testutils.c
index d8760f91..c022989e 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -338,7 +338,7 @@ void *open_blob_rw(const void *blob)
 {
 	int err;
 	void *buf;
-	int newsize = fdt_totalsize(blob) + 8;
+	int newsize = fdt_totalsize(blob) + 8 + 4;
 
 	buf = xmalloc(newsize);
 	err = fdt_open_into(blob, buf, newsize);
diff --git a/tests/treegen.c b/tests/treegen.c
index f6836fde..c7afa83d 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -108,12 +108,13 @@ size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
 	emit_u32(b, 0);	/* boot_cpuid_phys */
 	emit_u32(b, 0);	/* size_dt_strings */
 	emit_u32(b, 0);	/* size_dt_struct */
+	emit_u32(b, 0);	/* dt_flags */
 	return off;
 }
 
 size_t emit_fdt_header(struct buf *b)
 {
-	return emit_fdt_header_vers(b, 0x11, 0x10);
+	return emit_fdt_header_vers(b, 0x12, 0x10);
 }
 
 void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
diff --git a/tests/treegen_base.c b/tests/treegen_base.c
index 726b9741..ee4469ec 100644
--- a/tests/treegen_base.c
+++ b/tests/treegen_base.c
@@ -533,6 +533,44 @@ static struct buf make_bad_proplen(void)
 	return b;
 }
 
+/* Tree matching dtflags_default.dts */
+static struct buf make_dtflags_default(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+			p = emit_prop_u32(&b, 0, 1);
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+		size_t s;
+
+		s = emit_string(&b, "prop");
+		fill_prop_name(&b, strs, p, s);
+
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
 /* Tree generators */
 static const struct treegen treegens[] = {
 	TREE(test_tree1),
@@ -545,6 +583,7 @@ static const struct treegen treegens[] = {
 	TREE(named_root),
 	TREE(root_offset_12),
 	TREE(bad_proplen),
+	TREE(dtflags_default),
 };
 
 /* Harness */
-- 
2.56.1

