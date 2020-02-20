From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v7 6/8] libfdt: Add support for disabling version checks
Date: Thu, 20 Feb 2020 14:45:55 -0700
Message-ID: <20200220214557.176528-7-sjg@chromium.org>
References: <20200220214557.176528-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cxvY3H4kp7DVGhOnqPLa0KXWWvuTIinEZv1sNM2vuHw=;
        b=oEXws2VfebTuEgMBS1A4a1BRSdPNawb5T80ge0vFenAKqB9RkYEA/KZri6+e6snUSe
         8jzf/ciLtiHF7BbevjwqM5Gkn6M9FIQ5CdbFTvlKwB6wMvpTrI0Yg9wYA25MFw2a+mqE
         jUS3RlqOs+4QKUEEhYuv5TR3iWLQ6ptfxgfBw=
In-Reply-To: <20200220214557.176528-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Allow enabling FDT_ASSUME_LATEST to disable version checks.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 libfdt/fdt.c    | 34 +++++++++++++++++++++-------------
 libfdt/fdt_ro.c | 16 ++++++++--------
 libfdt/fdt_rw.c |  6 +++---
 3 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 0dabb92..4419204 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -24,10 +24,13 @@ int32_t fdt_ro_probe_(const void *fdt)
 
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
@@ -75,7 +78,8 @@ size_t fdt_header_size_(uint32_t version)
 
 size_t fdt_header_size(const void *fdt)
 {
-	return fdt_header_size_(fdt_version(fdt));
+	return can_assume(LATEST) ? FDT_V17_SIZE :
+		fdt_header_size_(fdt_version(fdt));
 }
 
 int fdt_check_header(const void *fdt)
@@ -84,11 +88,14 @@ int fdt_check_header(const void *fdt)
 
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
 
@@ -104,7 +111,7 @@ int fdt_check_header(const void *fdt)
 
 	if (!can_assume(VALID_DTB)) {
 		/* Bounds check structure block */
-		if (fdt_version(fdt) < 17) {
+		if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
 			if (!check_off_(hdrsize, fdt_totalsize(fdt),
 					fdt_off_dt_struct(fdt)))
 				return -FDT_ERR_TRUNCATED;
@@ -135,7 +142,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 		    || (absoffset + len) > fdt_totalsize(fdt))
 			return NULL;
 
-	if (fdt_version(fdt) >= 0x11)
+	if (can_assume(LATEST) || fdt_version(fdt) >= 0x11)
 		if (((offset + len) < offset)
 		    || ((offset + len) > fdt_size_dt_struct(fdt)))
 			return NULL;
@@ -175,7 +182,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
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
index 9c32559..2fa768e 100644
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
@@ -307,7 +307,7 @@ const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 
 	nameptr = nh->name;
 
-	if (fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
 		/*
 		 * For old FDT versions, match the naming conventions of V16:
 		 * give only the leaf name (after all /). The actual tree
@@ -380,7 +380,7 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
 	/* Prior to version 16, properties may need realignment
 	 * and this API does not work. fdt_getprop_*() will, however. */
 
-	if (fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
 		if (lenp)
 			*lenp = -FDT_ERR_BADVERSION;
 		return NULL;
@@ -427,7 +427,7 @@ const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 {
 	/* Prior to version 16, properties may need realignment
 	 * and this API does not work. fdt_getprop_*() will, however. */
-	if (fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
 		if (lenp)
 			*lenp = -FDT_ERR_BADVERSION;
 		return NULL;
@@ -458,8 +458,8 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 		return NULL;
 
 	/* Handle realignment */
-	if (fdt_version(fdt) < 0x10 && (poffset + sizeof(*prop)) % 8 &&
-	    fdt32_ld(&prop->len) >= 8)
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
+	    (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -491,8 +491,8 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
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
index 4a95ce2..fe13671 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -28,12 +28,12 @@ static int fdt_rw_probe_(void *fdt)
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
@@ -425,7 +425,7 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
 		* sizeof(struct fdt_reserve_entry);
 
-	if (fdt_version(fdt) >= 17) {
+	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 		struct_size = fdt_size_dt_struct(fdt);
 	} else {
 		struct_size = 0;
-- 
2.25.0.265.gbab2e86ba0-goog

