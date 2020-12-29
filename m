From: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv3] Set last_comp_version correctly in new dtb and fix potential version issues in fdt_open_into
Date: Mon, 28 Dec 2020 20:17:49 -0800
Message-ID: <20201229041749.2187-1-jujugoboom@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OpiMxyfuSduSSbUV/NuHIyTtjOC2o9AacLh0Fw9D2RM=;
        b=KvcjSotZkgMLMOv+JngfJJj6GjhlrcAl47ltF14vUBXlFyK9X/BC7WAFk5BjwgDMNs
         8YcfeAJV2wSRRjfvAQ749yqUgayE2WGitCoovMg/XCYVAy793R8WwCTdCtusjEKOlVZY
         uzcE80h86hFhGIsa+jsK/cSZumlofWUAhqt5/7THMSSlf/R0TGEW7nr4ePx0d9FVZY7s
         lqVbDBI99K8iM8z4L67kEYJQ7q2NfNvwSr2tCpneTioAn+mR1i+3zsF66jhBZkW8t6VN
         SLjVZdJ+MBKAwh5zMrzAiu5/uaFYCdBpA7nY5mMf9J80pkM0O49gqXDhTPfqJwwp0FlF
         B9Mw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Changes in v3: 
- Remove noop version sets 
- Set version correctly on loaded fdt in fdt_open_into

Fixes: f1879e1a50eb ("Add limited read-only support for older (V2 and V3) device tree to libfdt.")

Signed-off-by: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 libfdt/fdt_rw.c | 4 +++-
 libfdt/fdt_sw.c | 2 +-
 libfdt/libfdt.h | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 68887b9..f13458d 100644
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

