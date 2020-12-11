From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCHv3] libfdt: Internally perform potentially unaligned loads
Date: Thu, 10 Dec 2020 21:27:36 -0500
Message-ID: <20201211022736.31657-1-trini@konsulko.com>
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
time.  To address this, introduce and use new fdt{32,64}_ld_ functions
that call fdt{32,64}_to_cpu() as was done prior to the above mentioned
commits.  Leave the existing load functions as unaligned-safe and
include comments in both cases.

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
Changes in v3:
- Use a trailing rather than leading underscore in the function names
  (per David).
- Expand on the comments for both sets of functions based on feedback
  from David.

Changes in v2:
- Move the new internal functions to libfdt_internal.h (per Rob).
- Drop change to fdtget.c as it shouldn't use internal helpers, only
  exposed API.
- Add Rob's Reviewed-by
---
 libfdt/fdt_ro.c          | 20 ++++++++++----------
 libfdt/libfdt.h          |  8 +++-----
 libfdt/libfdt_internal.h | 19 +++++++++++++++++++
 3 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 91cc6fefe374..17584da25760 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -181,8 +181,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 	if (!can_assume(VALID_INPUT) && !re)
 		return -FDT_ERR_BADOFFSET;
 
-	*address = fdt64_ld(&re->address);
-	*size = fdt64_ld(&re->size);
+	*address = fdt64_ld_(&re->address);
+	*size = fdt64_ld_(&re->size);
 	return 0;
 }
 
@@ -192,7 +192,7 @@ int fdt_num_mem_rsv(const void *fdt)
 	const struct fdt_reserve_entry *re;
 
 	for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
-		if (fdt64_ld(&re->size) == 0)
+		if (fdt64_ld_(&re->size) == 0)
 			return i;
 	}
 	return -FDT_ERR_TRUNCATED;
@@ -370,7 +370,7 @@ static const struct fdt_property *fdt_get_property_by_offset_(const void *fdt,
 	prop = fdt_offset_ptr_(fdt, offset);
 
 	if (lenp)
-		*lenp = fdt32_ld(&prop->len);
+		*lenp = fdt32_ld_(&prop->len);
 
 	return prop;
 }
@@ -408,7 +408,7 @@ static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
 			offset = -FDT_ERR_INTERNAL;
 			break;
 		}
-		if (fdt_string_eq_(fdt, fdt32_ld(&prop->nameoff),
+		if (fdt_string_eq_(fdt, fdt32_ld_(&prop->nameoff),
 				   name, namelen)) {
 			if (poffset)
 				*poffset = offset;
@@ -461,7 +461,7 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 
 	/* Handle realignment */
 	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
-	    (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
+	    (poffset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -479,7 +479,7 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 		int namelen;
 
 		if (!can_assume(VALID_INPUT)) {
-			name = fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
+			name = fdt_get_string(fdt, fdt32_ld_(&prop->nameoff),
 					      &namelen);
 			if (!name) {
 				if (lenp)
@@ -488,13 +488,13 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 			}
 			*namep = name;
 		} else {
-			*namep = fdt_string(fdt, fdt32_ld(&prop->nameoff));
+			*namep = fdt_string(fdt, fdt32_ld_(&prop->nameoff));
 		}
 	}
 
 	/* Handle realignment */
 	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
-	    (offset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
+	    (offset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -519,7 +519,7 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
 			return 0;
 	}
 
-	return fdt32_ld(php);
+	return fdt32_ld_(php);
 }
 
 const char *fdt_get_alias_namelen(const void *fdt,
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 89adee3cd7f6..2bc16a8b3f79 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -126,12 +126,10 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
 uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
 
 /*
- * Alignment helpers:
- *     These helpers access words from a device tree blob.  They're
- *     built to work even with unaligned pointers on platforms (ike
- *     ARM) that don't like unaligned loads and stores
+ * External helpers to access words from a device tree blob. They're built
+ * to work even with unaligned pointers on platforms (such as ARMv5) that don't
+ * like unaligned loads and stores.
  */
-
 static inline uint32_t fdt32_ld(const fdt32_t *p)
 {
 	const uint8_t *bp = (const uint8_t *)p;
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index d4e0bd49c037..8b580aa50703 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -46,6 +46,25 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(void *fdt, int n)
 	return (void *)(uintptr_t)fdt_mem_rsv_(fdt, n);
 }
 
+/*
+ * Internal helpers to access tructural elements of the device tree blob
+ * (rather than for exaple reading integers from within property values).  We
+ * assume that we are either given a naturally aligned address for the platform
+ * or if we are not, we are on a platform where unaligned memory reads will be
+ * handled in a graceful manner.  If this is not the case there are _unaligned
+ * versions of these functions that follow and can be used.
+ *
+ */
+static inline uint32_t fdt32_ld_(const fdt32_t *p)
+{
+	return fdt32_to_cpu(*p);
+}
+
+static inline uint64_t fdt64_ld_(const fdt64_t *p)
+{
+	return fdt64_to_cpu(*p);
+}
+
 #define FDT_SW_MAGIC		(~FDT_MAGIC)
 
 /**********************************************************************/
-- 
2.17.1

