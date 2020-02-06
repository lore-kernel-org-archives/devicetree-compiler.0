From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 6/7] libfdt: Add support for disabling version checks
Date: Wed,  5 Feb 2020 22:40:33 -0700
Message-ID: <20200206054034.162732-7-sjg@chromium.org>
References: <20200206054034.162732-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yV3/sfTz9q4R7Mv7EeNVcj9mXPdUB4DF5Yu3x1EcKgc=;
        b=P7req5GH1iWSOOofHW0GO9/U4QQRy//oVwjwsSirDQXzWA2czUlIIQgpCe23CVZWQ6
         iJ4tQRVb1x3jejW/F+kAe/GaBLXMnDDqntpM4xR5uHSFAsTCKxCaVT1GI/gLVFqHqgMk
         NiSKGf8j0BfwG6CuEX7k/We+JJiO5F5q9pAQg=
In-Reply-To: <20200206054034.162732-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Allow enabling FDT_ASSUME_LATEST to disable version checks.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 libfdt/fdt.c    | 34 +++++++++++++++++++++-------------
 libfdt/fdt_ro.c | 16 ++++++++--------
 libfdt/fdt_rw.c |  6 +++---
 3 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index e2c1da0..0ac8736 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -21,10 +21,13 @@ int32_t fdt_ro_probe_(const void *fdt)
 
 	if (fdt_magic(fdt) == FDT_MAGIC) {
 		/* Complete tree */
-		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
-			return -FDT_ERR_BADVERSION;
-		if (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION)
-			return -FDT_ERR_BADVERSION;
+		if (!can_assume(LATEST)) {
+			if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
+				return -FDT_ERR_BADVERSION;
+			if (fdt_last_comp_version(fdt) >
+					FDT_LAST_SUPPORTED_VERSION)
+				return -FDT_ERR_BADVERSION;
+		}
 	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
 		/* Unfinished sequential-write blob */
 		if (fdt_size_dt_struct(fdt) == 0)
@@ -72,7 +75,8 @@ size_t fdt_header_size_(uint32_t version)
 
 size_t fdt_header_size(const void *fdt)
 {
-	return fdt_header_size_(fdt_version(fdt));
+	return can_assume(LATEST) ? FDT_V17_SIZE :
+		fdt_header_size_(fdt_version(fdt));
 }
 
 int fdt_check_header(const void *fdt)
@@ -81,11 +85,14 @@ int fdt_check_header(const void *fdt)
 
 	if (fdt_magic(fdt) != FDT_MAGIC)
 		return -FDT_ERR_BADMAGIC;
-	if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
-	    || (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION))
-		return -FDT_ERR_BADVERSION;
-	if (fdt_version(fdt) < fdt_last_comp_version(fdt))
-		return -FDT_ERR_BADVERSION;
+	if (!can_assume(LATEST)) {
+		if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
+		    || (fdt_last_comp_version(fdt) >
+			FDT_LAST_SUPPORTED_VERSION))
+			return -FDT_ERR_BADVERSION;
+		if (fdt_version(fdt) < fdt_last_comp_version(fdt))
+			return -FDT_ERR_BADVERSION;
+	}
 	hdrsize = fdt_header_size(fdt);
 	if (!can_assume(VALID_DTB)) {
 
@@ -101,7 +108,7 @@ int fdt_check_header(const void *fdt)
 
 	if (!can_assume(VALID_DTB)) {
 		/* Bounds check structure block */
-		if (fdt_version(fdt) < 17) {
+		if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
 			if (!check_off_(hdrsize, fdt_totalsize(fdt),
 					fdt_off_dt_struct(fdt)))
 				return -FDT_ERR_TRUNCATED;
@@ -132,7 +139,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 		    || (absoffset + len) > fdt_totalsize(fdt))
 			return NULL;
 
-	if (fdt_version(fdt) >= 0x11)
+	if (can_assume(LATEST) || fdt_version(fdt) >= 0x11)
 		if (((offset + len) < offset)
 		    || ((offset + len) > fdt_size_dt_struct(fdt)))
 			return NULL;
@@ -172,7 +179,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		/* skip-name offset, length and value */
 		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
 			+ fdt32_to_cpu(*lenp);
-		if (fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
+		if (!can_assume(LATEST) &&
+		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
 		    ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
 			offset += 4;
 		break;
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 07c13c9..63cb60e 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -60,7 +60,7 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 	if (fdt_magic(fdt) == FDT_MAGIC) {
 		if (stroffset < 0)
 			goto fail;
-		if (fdt_version(fdt) >= 17) {
+		if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 			if (stroffset >= fdt_size_dt_strings(fdt))
 				goto fail;
 			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
@@ -311,7 +311,7 @@ const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 
 	nameptr = nh->name;
 
-	if (fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
 		/*
 		 * For old FDT versions, match the naming conventions of V16:
 		 * give only the leaf name (after all /). The actual tree
@@ -384,7 +384,7 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
 	/* Prior to version 16, properties may need realignment
 	 * and this API does not work. fdt_getprop_*() will, however. */
 
-	if (fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
 		if (lenp)
 			*lenp = -FDT_ERR_BADVERSION;
 		return NULL;
@@ -431,7 +431,7 @@ const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 {
 	/* Prior to version 16, properties may need realignment
 	 * and this API does not work. fdt_getprop_*() will, however. */
-	if (fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
 		if (lenp)
 			*lenp = -FDT_ERR_BADVERSION;
 		return NULL;
@@ -462,8 +462,8 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 		return NULL;
 
 	/* Handle realignment */
-	if (fdt_version(fdt) < 0x10 && (poffset + sizeof(*prop)) % 8 &&
-	    fdt32_ld(&prop->len) >= 8)
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
+	    (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -495,8 +495,8 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 	}
 
 	/* Handle realignment */
-	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
-	    fdt32_ld(&prop->len) >= 8)
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
+	    (offset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 75f70d9..a18e123 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -30,12 +30,12 @@ static int fdt_rw_probe_(void *fdt)
 		return 0;
 	FDT_RO_PROBE(fdt);
 
-	if (fdt_version(fdt) < 17)
+	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
 		return -FDT_ERR_BADVERSION;
 	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
 				   fdt_size_dt_struct(fdt)))
 		return -FDT_ERR_BADLAYOUT;
-	if (fdt_version(fdt) > 17)
+	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
 		fdt_set_version(fdt, 17);
 
 	return 0;
@@ -428,7 +428,7 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
 		* sizeof(struct fdt_reserve_entry);
 
-	if (fdt_version(fdt) >= 17) {
+	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 		struct_size = fdt_size_dt_struct(fdt);
 	} else {
 		struct_size = 0;
-- 
2.25.0.341.g760bfbb309-goog

