From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] libfdt: Make fdt{32,64}_ld() default to assuming unaligned access is safe
Date: Wed,  4 Nov 2020 08:46:45 -0500
Message-ID: <20201104134645.30138-1-trini@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Commits 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words"
introduced changes to support unaligned reads for ARM platforms and
11738cf01f15 "libfdt: Don't use memcpy to handle unaligned reads on ARM"
improved the performance of these helpers.

On further discussion, while there are potential cases where we could be
used on platforms that do not fixup unaligned reads for us, making this
choice the default is very expensive in terms of binary size and access
time.  To address this, suffix the existing fdt{32,64}_ld functions with
_unaligned and introduce new load functions that call
fdt{32,64}_to_cpu() as was done prior to the above mentioned commits.

Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 libfdt/libfdt.h | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index b600c8d6dd41..307ba745c92f 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -126,13 +126,22 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
 uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
 
 /*
- * Alignment helpers:
- *     These helpers access words from a device tree blob.  They're
- *     built to work even with unaligned pointers on platforms (ike
- *     ARM) that don't like unaligned loads and stores
+ * Load functions.  Assume that we are on a platform where unaligned memory
+ * reads will be handled in a graceful manner and that we do not need to ensure
+ * our reads are aligned.  If this is not the case there are _unaligned
+ * versions of these functions that follow and can be used.
  */
-
 static inline uint32_t fdt32_ld(const fdt32_t *p)
+{
+	return fdt32_to_cpu(*p);
+}
+
+static inline uint64_t fdt64_ld(const fdt64_t *p)
+{
+	return fdt64_to_cpu(*p);
+}
+
+static inline uint32_t fdt32_ld_unaligned(const fdt32_t *p)
 {
 	const uint8_t *bp = (const uint8_t *)p;
 
@@ -152,7 +161,7 @@ static inline void fdt32_st(void *property, uint32_t value)
 	bp[3] = value & 0xff;
 }
 
-static inline uint64_t fdt64_ld(const fdt64_t *p)
+static inline uint64_t fdt64_ld_unaligned(const fdt64_t *p)
 {
 	const uint8_t *bp = (const uint8_t *)p;
 
-- 
2.17.1

