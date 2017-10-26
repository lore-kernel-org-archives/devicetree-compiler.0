From: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libfdt][PATCH v4] implement strnlen for systems that need it
Date: Wed, 25 Oct 2017 21:13:46 -0400
Message-ID: <20171026011346.5758-1-programmingkidx@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DPR0cWQHfJLT42dGNgvzEWdcHjUcTthQfQcpTVpOKNc=;
        b=oSdbaTpallPy/C6L3e3Id06wzjuTU9DjrT4HS+TlrvCTr5UbPXEAVwvj0/Gvj/6dAE
         gT0aguSD1Lo+NoP1b4fueEdr1sUPAHcfl8qiGBzD7bEuEyzB9QPNsT5Y9PzoJHITk+8Z
         SStJF5Bv6uf9YdknffNtc2ic92LDeoaj2oxiRJQGJAtadENiRbX8VtVXOFfY8LBueGCH
         5DDYLm2/2dR00e/RV+6B0yVp8WKZtnaKGWgDmdCuf5E0BdrLpSbrvkRBD/orkaTQ1Ulu
         Ecly+LwTBM4ROu4UaGnIi6Sh+RUU4+eUsFZyNr6COV32kn+Y+pgks7BF4tooCpNzjgSL
         gqQA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org
Cc: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Prior the Mac OS 10.7, the function strnlen() was not available. This patch
implements strnlen() on Mac OS X versions that are below 10.7.

Signed-off-by: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v4 changes:
- Added check for definition of MAC_OS_X_VERSION_10_7
- Renamed strnlen to fdt_strnlen
- Added macro that defines strnlen as fdt_strnlen

v3 changes:
- Replaced loop with memchr()

v2 changes:
- Simplified the code to make it static inline'ed
- Changed the type of count to size_t

 libfdt/libfdt_env.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index 952056c..41fac04 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -109,4 +109,31 @@ static inline fdt64_t cpu_to_fdt64(uint64_t x)
 #undef CPU_TO_FDT16
 #undef EXTRACT_BYTE
 
+#ifdef __APPLE__
+#include <AvailabilityMacros.h>
+
+/* strnlen() is not available on Mac OS < 10.7 */
+# if !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLOWED < \
+                                         MAC_OS_X_VERSION_10_7)
+
+#define strnlen fdt_strnlen
+
+/*
+ * fdt_strnlen: returns the length of a string or max_count - which ever is
+ * smallest.
+ * Input 1 string: the string whose size is to be determined
+ * Input 2 max_count: the maximum value returned by this function
+ * Output: length of the string or max_count (the smallest of the two)
+ */
+static inline size_t fdt_strnlen(const char *string, size_t max_count)
+{
+    const char *p = memchr(string, 0, max_count);
+    return p ? p - string : max_count;
+}
+
+#endif /* !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLOWED <
+          MAC_OS_X_VERSION_10_7) */
+
+#endif /* __APPLE__ */
+
 #endif /* _LIBFDT_ENV_H */
-- 
2.10.2
