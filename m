From: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv2] Set last_comp_version correctly in new dtb and fix potential version issues in fdt_open_into
Date: Mon, 28 Dec 2020 15:42:43 -0800
Message-ID: <20201228234243.5058-1-jujugoboom@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJTlTuud2z5+kRSXkromg/VdCpuGawj8Ciu8T0PpCiU=;
        b=gz9r7rpcZ1WJj4KIaJmdXE8bEIKHyiFM4YJW6IzXmSpu64MrVyzi1ALK0wEsVT3+l8
         0TBKS6BCPNlJtzV62eHs9lZ8DPkv/JqQLWRbfeySO4DnkduIFsgFqAYNC5CCsMKYaK5Z
         3QSar0Vpd96+FmDVGTzf6tjd3MLBcYKTAjHmZWAXaDI9Vg1ZoUomCcLQhITEOi44FO3m
         9eSXRt2VvLaFf+PNV41eEJ2Q5fZfeS2LU4dl6DjKY7Ovd0PNyDypIiFkBe1dXw3MDcvO
         hlcZbqbE+LaeFYd9lUlrrIieiwdxoIrXPXWs2fod3tnn/Wbn7RdJed08lfVqdIYFaduO
         YvHw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi,

I've added checks to fdt_open_into to validate the version before reading into buffer, as well as maintaining the accurate
version information of the fdt when loaded into the buffer. Hopefully this would help stop any issues with reading a 
fdt with a lower than compatible verison into a buffer and it being misrepresented as a current version.

Signed-off-by: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 libfdt/fdt_rw.c | 10 ++++++----
 libfdt/fdt_sw.c |  2 +-
 libfdt/libfdt.h |  1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 68887b9..feab26c 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -428,12 +428,14 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 		struct_size = fdt_size_dt_struct(fdt);
-	} else {
+	} else if (fdt_version(fdt) == 16) {
 		struct_size = 0;
 		while (fdt_next_tag(fdt, struct_size, &struct_size) != FDT_END)
 			;
 		if (struct_size < 0)
 			return struct_size;
+	} else {
+		return -FDT_ERR_BADVERSION;
 	}
 
 	if (can_assume(LIBFDT_ORDER) ||
@@ -442,7 +444,7 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 		err = fdt_move(fdt, buf, bufsize);
 		if (err)
 			return err;
-		fdt_set_version(buf, 17);
+		fdt_set_version(buf, fdt_version(fdt));
 		fdt_set_size_dt_struct(buf, struct_size);
 		fdt_set_totalsize(buf, bufsize);
 		return 0;
@@ -470,8 +472,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	fdt_set_magic(buf, FDT_MAGIC);
 	fdt_set_totalsize(buf, bufsize);
-	fdt_set_version(buf, 17);
-	fdt_set_last_comp_version(buf, 16);
+	fdt_set_version(buf, fdt_version(fdt));
+	fdt_set_last_comp_version(buf, fdt_last_comp_version(fdt));
 	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
 
 	return 0;
diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 68b543c..4c569ee 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -377,7 +377,7 @@ int fdt_finish(void *fdt)
 	fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
 
 	/* And fix up fields that were keeping intermediate state. */
-	fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
+	fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
 	fdt_set_magic(fdt, FDT_MAGIC);
 
 	return 0;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 2bc16a8..73467f7 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -14,6 +14,7 @@ extern "C" {
 #endif
 
 #define FDT_FIRST_SUPPORTED_VERSION	0x02
+#define FDT_LAST_COMPATIBLE_VERSION 0x10
 #define FDT_LAST_SUPPORTED_VERSION	0x11
 
 /* Error codes: informative error codes */
-- 
2.25.1

