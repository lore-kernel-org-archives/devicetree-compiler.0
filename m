From: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libfdt][PATCH v2] implement strnlen for systems that need it
Date: Fri, 20 Oct 2017 13:55:48 -0400
Message-ID: <20171020175548.2566-1-programmingkidx@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bCmXvg3SoX/9rCAUQF9MVTZK5zvIK0CpGVO6oIwTYbk=;
        b=oMhURQ6ZuuuZw0z2Tj8tsFHuruWQS4QthFAKFMyf/OTynmEfM7kzPv3M+vMWhV/QXj
         efmEyKsFgnfEaBhGh27jn+ox1kplj7KQivW6vGdgPQaSDBYEVK0clpUlxUyYdPPnlQ9C
         /ly5E9nJTgbZoLIhkmmEhhLaOq0yLR4ZQRCw+jd7lQlogPvj25/UJWKdGIWsCt/QtMH9
         EedmrOq+y1AuOSLBVUJ92KkwKf0dBOMPoOFFVecPhwifG/giomd9kULS2wmA7O4rApX2
         F0y6feT+W4WnPwZ4waVLM6cwecTx98pVyVTrENKU6K5QIUOPSk8WLPezDYPfM22aBfeT
         KoWQ==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Prior the Mac OS 10.7, the function strnlen() was not available. This patch
implements strnlen() on Mac OS X versions that are below 10.7.

Signed-off-by: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2 changes:
- Simplified the code to make it static inline'ed
- Changed the type of count to size_t

 libfdt/libfdt_env.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index 952056c..2569339 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -109,4 +109,33 @@ static inline fdt64_t cpu_to_fdt64(uint64_t x)
 #undef CPU_TO_FDT16
 #undef EXTRACT_BYTE

+#ifdef __APPLE__
+#include <AvailabilityMacros.h>
+
+#define MAC_OS_X_VERSION_10_7 1070
+
+/* strnlen() is not available on Mac OS < 10.7 */
+# if (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7)
+
+/*
+ * strnlen: returns the length of a string or max_count - which ever is smallest
+ * Input 1 string: the string whose size is to be determined
+ * Input 2 max_count: the maximum value returned by this function
+ * Output: length of the string or max_count (the smallest of the two)
+ */
+static inline size_t strnlen(const char *string, size_t max_count)
+{
+    size_t count;
+    for (count = 0; count < max_count; count++) {
+        if (string[count] == '\0') {
+            break;
+        }
+    }
+    return count;
+}
+
+#endif /* (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7) */
+
+#endif /* __APPLE__ */
+
 #endif /* _LIBFDT_ENV_H */
-- 
2.13.5 (Apple Git-94)
