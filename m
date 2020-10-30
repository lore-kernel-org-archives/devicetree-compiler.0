From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] libfdt: Default to assuming aligned reads are OK
Date: Fri, 30 Oct 2020 14:56:58 -0400
Message-ID: <20201030185658.4655-1-trini@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Start with commit 6dcb8ba4 "libfdt: Add helpers for accessing unaligned
words" which introduced changes to support unaligned reads for ARM
platforms and 11738cf01f15 "libfdt: Don't use memcpy to handle unaligned
reads on ARM" to improve the performance of these helpers, libfdt has
defaulted to assuming that unaligned memory access could be a fatal
problem.

Upon further discussion on the mailing list, we leave the improved
unaligned-safe memory load functions available if needed, but go back to
using fdt{32,64}_to_cpu() for access as generally platforms handle
unaligned access safely and there is still a sizable performance and
size impact of using the always-safe helpers in all cases.

Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 fdtget.c        |  2 +-
 libfdt/fdt_ro.c | 20 ++++++++++----------
 libfdt/libfdt.h |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 777582e2d45f..7cee28718cbc 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -62,7 +62,7 @@ static int show_cell_list(struct display_info *disp, const char *data, int len,
 	for (i = 0; i < len; i += size, p += size) {
 		if (i)
 			printf(" ");
-		value = size == 4 ? fdt32_ld((const fdt32_t *)p) :
+		value = size == 4 ? fdt32_to_cpu(*(const fdt32_t *)p) :
 			size == 2 ? (*p << 8) | p[1] : *p;
 		printf(fmt, value);
 	}
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 91cc6fefe374..5bc27ac97317 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -181,8 +181,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 	if (!can_assume(VALID_INPUT) && !re)
 		return -FDT_ERR_BADOFFSET;
 
-	*address = fdt64_ld(&re->address);
-	*size = fdt64_ld(&re->size);
+	*address = fdt64_to_cpu(re->address);
+	*size = fdt64_to_cpu(re->size);
 	return 0;
 }
 
@@ -192,7 +192,7 @@ int fdt_num_mem_rsv(const void *fdt)
 	const struct fdt_reserve_entry *re;
 
 	for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
-		if (fdt64_ld(&re->size) == 0)
+		if (fdt64_to_cpu(re->size) == 0)
 			return i;
 	}
 	return -FDT_ERR_TRUNCATED;
@@ -370,7 +370,7 @@ static const struct fdt_property *fdt_get_property_by_offset_(const void *fdt,
 	prop = fdt_offset_ptr_(fdt, offset);
 
 	if (lenp)
-		*lenp = fdt32_ld(&prop->len);
+		*lenp = fdt32_to_cpu(prop->len);
 
 	return prop;
 }
@@ -408,7 +408,7 @@ static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
 			offset = -FDT_ERR_INTERNAL;
 			break;
 		}
-		if (fdt_string_eq_(fdt, fdt32_ld(&prop->nameoff),
+		if (fdt_string_eq_(fdt, fdt32_to_cpu(prop->nameoff),
 				   name, namelen)) {
 			if (poffset)
 				*poffset = offset;
@@ -461,7 +461,7 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 
 	/* Handle realignment */
 	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
-	    (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
+	    (poffset + sizeof(*prop)) % 8 && fdt32_to_cpu(prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -479,7 +479,7 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 		int namelen;
 
 		if (!can_assume(VALID_INPUT)) {
-			name = fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
+			name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff),
 					      &namelen);
 			if (!name) {
 				if (lenp)
@@ -488,13 +488,13 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 			}
 			*namep = name;
 		} else {
-			*namep = fdt_string(fdt, fdt32_ld(&prop->nameoff));
+			*namep = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 		}
 	}
 
 	/* Handle realignment */
 	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
-	    (offset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
+	    (offset + sizeof(*prop)) % 8 && fdt32_to_cpu(prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -519,7 +519,7 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
 			return 0;
 	}
 
-	return fdt32_ld(php);
+	return fdt32_to_cpu(*php);
 }
 
 const char *fdt_get_alias_namelen(const void *fdt,
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 544d3efff584..5004300e7ddc 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -236,7 +236,7 @@ int fdt_next_subnode(const void *fdt, int offset);
 /* General functions                                                  */
 /**********************************************************************/
 #define fdt_get_header(fdt, field) \
-	(fdt32_ld(&((const struct fdt_header *)(fdt))->field))
+	(fdt32_to_cpu(((const struct fdt_header *)(fdt))->field))
 #define fdt_magic(fdt)			(fdt_get_header(fdt, magic))
 #define fdt_totalsize(fdt)		(fdt_get_header(fdt, totalsize))
 #define fdt_off_dt_struct(fdt)		(fdt_get_header(fdt, off_dt_struct))
-- 
2.17.1

