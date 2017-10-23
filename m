From: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libfdt][PATCH v3] implement strnlen for systems that need it
Date: Sun, 22 Oct 2017 22:50:16 -0400
Message-ID: <20171023025016.3088-1-programmingkidx@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IXkjcSnDYlxWyCyrCsFnwtgwjAzgBd/BgGonjD7CRAw=;
        b=rtYmXca/28CymD77a1vhALkSXL0v4HmQMGKJxtz3dJIgIo5prPGH0jbmcoLukvUZfh
         Dc2AYTJCkAMGPvbU0d+IvVXGYhzMqYQg49TvBrO5DkuQ+HBvQ/cuMXAQ+5rBKqHWtLQ6
         108nTQoa5lJNbxnpFDxm5OXHnO7FgmJVSnKi//IX5o16tkWK1fW+R9Z96936tS20jFOZ
         cIYj6wNpBUuCEUMk6qnJP9oOmI8avuu/oE3OK7H+q1nIlQp0OPBd4w68DE3s8Lq+vlOI
         IsR0F1MBu6NrpFGGZDGMoMDiNWSzjv6JGD7QPeP2w0ZDwv1mLcxKwWwzaiHZoQNC9bhU
         6SnQ==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org
Cc: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Prior the Mac OS 10.7, the function strnlen() was not available. This patch
implements strnlen() on Mac OS X versions that are below 10.7.

Signed-off-by: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v3 changes:
- Replaced loop with memchr()

v2 changes:
- Simplified the code to make it static inline'ed
- Changed the type of count to size_t

 libfdt/libfdt_env.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index 952056c..d43b66b 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -109,4 +109,28 @@ static inline fdt64_t cpu_to_fdt64(uint64_t x)
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
+    const char *p = memchr(string, 0, max_count);
+    return p ? p - string : max_count;
+}
+
+#endif /* (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7) */
+
+#endif /* __APPLE__ */
+
 #endif /* _LIBFDT_ENV_H */
-- 
2.10.2
