From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Fri, 17 Jan 2020 10:31:06 -0500
Message-ID: <20200117153106.29909-1-trini@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>

6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" introduced
changes to support unaligned reads for ARM platforms and 11738cf01f15
"libfdt: Don't use memcpy to handle unaligned reads on ARM" improved the
performance of these helpers.

Ultimately however, these helpers should not exist.  Unaligned access
only occurs when images are forced out of alignment by the user.  This
unalignment is not supported and introduces problems later on as other
parts of the system image are unaligned and they too require alignment.

Revert both of these changes.

Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
By way of a little more explanation, looking at the archives it seems
that the initial bug reporter said that they had a platform that was
using U-Boot and had the "fdt_high=0xffffffff" set in the environment.
What that does is to tell U-Boot to not do any of the sanity checks and
relocation to ensure alignment that it would normally do because the
user knows best.  This later came up on the U-Boot list as once the DTB
was loaded, Linux is unhappy because it demands correct alignment.

I only realized libfdt had introduced changes here when it was reported
that boot time had gotten much slower once we merged this change in.  It
would be best to just drop it.
---
 fdtget.c        |  2 +-
 libfdt/fdt_ro.c | 18 +++++++++---------
 libfdt/libfdt.h | 33 +--------------------------------
 3 files changed, 11 insertions(+), 42 deletions(-)

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
index a5c2797cde65..01b4b8579a00 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -167,8 +167,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 	if (!re)
 		return -FDT_ERR_BADOFFSET;
 
-	*address = fdt64_ld(&re->address);
-	*size = fdt64_ld(&re->size);
+	*address = fdt64_to_cpu(re->address);
+	*size = fdt64_to_cpu(re->size);
 	return 0;
 }
 
@@ -178,7 +178,7 @@ int fdt_num_mem_rsv(const void *fdt)
 	const struct fdt_reserve_entry *re;
 
 	for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
-		if (fdt64_ld(&re->size) == 0)
+		if (fdt64_to_cpu(re->size) == 0)
 			return i;
 	}
 	return -FDT_ERR_TRUNCATED;
@@ -355,7 +355,7 @@ static const struct fdt_property *fdt_get_property_by_offset_(const void *fdt,
 	prop = fdt_offset_ptr_(fdt, offset);
 
 	if (lenp)
-		*lenp = fdt32_ld(&prop->len);
+		*lenp = fdt32_to_cpu(prop->len);
 
 	return prop;
 }
@@ -392,7 +392,7 @@ static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
 			offset = -FDT_ERR_INTERNAL;
 			break;
 		}
-		if (fdt_string_eq_(fdt, fdt32_ld(&prop->nameoff),
+		if (fdt_string_eq_(fdt, fdt32_to_cpu(prop->nameoff),
 				   name, namelen)) {
 			if (poffset)
 				*poffset = offset;
@@ -445,7 +445,7 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 
 	/* Handle realignment */
 	if (fdt_version(fdt) < 0x10 && (poffset + sizeof(*prop)) % 8 &&
-	    fdt32_ld(&prop->len) >= 8)
+	    fdt32_to_cpu(prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -461,7 +461,7 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 	if (namep) {
 		const char *name;
 		int namelen;
-		name = fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
+		name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff),
 				      &namelen);
 		if (!name) {
 			if (lenp)
@@ -473,7 +473,7 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 
 	/* Handle realignment */
 	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
-	    fdt32_ld(&prop->len) >= 8)
+	    fdt32_to_cpu(prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -498,7 +498,7 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
 			return 0;
 	}
 
-	return fdt32_ld(php);
+	return fdt32_to_cpu(*php);
 }
 
 const char *fdt_get_alias_namelen(const void *fdt,
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index fc4c4962a01c..d4ebe915cf46 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
 
 uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
 
-/*
- * Alignment helpers:
- *     These helpers access words from a device tree blob.  They're
- *     built to work even with unaligned pointers on platforms (ike
- *     ARM) that don't like unaligned loads and stores
- */
-
-static inline uint32_t fdt32_ld(const fdt32_t *p)
-{
-	const uint8_t *bp = (const uint8_t *)p;
-
-	return ((uint32_t)bp[0] << 24)
-		| ((uint32_t)bp[1] << 16)
-		| ((uint32_t)bp[2] << 8)
-		| bp[3];
-}
-
 static inline void fdt32_st(void *property, uint32_t value)
 {
 	uint8_t *bp = (uint8_t *)property;
@@ -144,20 +127,6 @@ static inline void fdt32_st(void *property, uint32_t value)
 	bp[3] = value & 0xff;
 }
 
-static inline uint64_t fdt64_ld(const fdt64_t *p)
-{
-	const uint8_t *bp = (const uint8_t *)p;
-
-	return ((uint64_t)bp[0] << 56)
-		| ((uint64_t)bp[1] << 48)
-		| ((uint64_t)bp[2] << 40)
-		| ((uint64_t)bp[3] << 32)
-		| ((uint64_t)bp[4] << 24)
-		| ((uint64_t)bp[5] << 16)
-		| ((uint64_t)bp[6] << 8)
-		| bp[7];
-}
-
 static inline void fdt64_st(void *property, uint64_t value)
 {
 	uint8_t *bp = (uint8_t *)property;
@@ -232,7 +201,7 @@ int fdt_next_subnode(const void *fdt, int offset);
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

