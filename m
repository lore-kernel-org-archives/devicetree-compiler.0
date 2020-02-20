From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v7 4/8] libfdt: Add support for disabling sanity checks
Date: Thu, 20 Feb 2020 14:45:53 -0700
Message-ID: <20200220214557.176528-5-sjg@chromium.org>
References: <20200220214557.176528-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4oOYrtbVPRaOjYV3X5DMeFuGOGPOJUyGTRuwoXsGKs0=;
        b=Cfdxp/CHK+TYcAt4YS55s0fAH3oasNBFWAPSWL00rU2YuV1/t0oKwUJ7l1ZsS2nEzD
         FxHsTU6mJ2YrruKd4b8Cbj7Tf+86BGC2fEm677leYicDip42RBuwk5dZ15OJ8Lful9Re
         T6nOsUTOejqFrnsICekf93xunsNaXgnW6jwPU=
In-Reply-To: <20200220214557.176528-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Allow enabling ASSUME_VALID_INPUT to disable sanity checks on the device
tree and the parameters to libfdt. This assumption covers that cases where
the problem could be with either.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v7:
- Drop assumption check in fdt_next_tag()

Changes in v6:
- Don't add VALID_INPUT to fdt_get_property_namelen_()
- Drop assumption in fdt_nodename_eq_()

Changes in v5:
- Include just VALID_INPUT checks in this patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 libfdt/fdt.c    | 11 +++++----
 libfdt/fdt_ro.c | 61 +++++++++++++++++++++++++++++++++----------------
 2 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index d4daf60..0dabb92 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -129,10 +129,11 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 {
 	unsigned absoffset = offset + fdt_off_dt_struct(fdt);
 
-	if ((absoffset < offset)
-	    || ((absoffset + len) < absoffset)
-	    || (absoffset + len) > fdt_totalsize(fdt))
-		return NULL;
+	if (!can_assume(VALID_INPUT))
+		if ((absoffset < offset)
+		    || ((absoffset + len) < absoffset)
+		    || (absoffset + len) > fdt_totalsize(fdt))
+			return NULL;
 
 	if (fdt_version(fdt) >= 0x11)
 		if (((offset + len) < offset)
@@ -197,6 +198,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 
 int fdt_check_node_offset_(const void *fdt, int offset)
 {
+	if (can_assume(VALID_INPUT))
+		return offset;
 	if ((offset < 0) || (offset % FDT_TAGSIZE)
 	    || (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE))
 		return -FDT_ERR_BADOFFSET;
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 4c26fbe..9c32559 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -33,17 +33,26 @@ static int fdt_nodename_eq_(const void *fdt, int offset,
 
 const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 {
-	int32_t totalsize = fdt_ro_probe_(fdt);
-	uint32_t absoffset = stroffset + fdt_off_dt_strings(fdt);
+	int32_t totalsize;
+	uint32_t absoffset;
 	size_t len;
 	int err;
 	const char *s, *n;
 
+	if (can_assume(VALID_INPUT)) {
+		s = (const char *)fdt + fdt_off_dt_strings(fdt) + stroffset;
+
+		if (lenp)
+			*lenp = strlen(s);
+		return s;
+	}
+	totalsize = fdt_ro_probe_(fdt);
 	err = totalsize;
 	if (totalsize < 0)
 		goto fail;
 
 	err = -FDT_ERR_BADOFFSET;
+	absoffset = stroffset + fdt_off_dt_strings(fdt);
 	if (absoffset >= totalsize)
 		goto fail;
 	len = totalsize - absoffset;
@@ -151,10 +160,13 @@ static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
 	int offset = n * sizeof(struct fdt_reserve_entry);
 	int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
 
-	if (absoffset < fdt_off_mem_rsvmap(fdt))
-		return NULL;
-	if (absoffset > fdt_totalsize(fdt) - sizeof(struct fdt_reserve_entry))
-		return NULL;
+	if (!can_assume(VALID_INPUT)) {
+		if (absoffset < fdt_off_mem_rsvmap(fdt))
+			return NULL;
+		if (absoffset > fdt_totalsize(fdt) -
+		    sizeof(struct fdt_reserve_entry))
+			return NULL;
+	}
 	return fdt_mem_rsv_(fdt, n);
 }
 
@@ -164,7 +176,7 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 
 	FDT_RO_PROBE(fdt);
 	re = fdt_mem_rsv(fdt, n);
-	if (!re)
+	if (!can_assume(VALID_INPUT) && !re)
 		return -FDT_ERR_BADOFFSET;
 
 	*address = fdt64_ld(&re->address);
@@ -346,7 +358,8 @@ static const struct fdt_property *fdt_get_property_by_offset_(const void *fdt,
 	int err;
 	const struct fdt_property *prop;
 
-	if ((err = fdt_check_prop_offset_(fdt, offset)) < 0) {
+	if (!can_assume(VALID_INPUT) &&
+	    (err = fdt_check_prop_offset_(fdt, offset)) < 0) {
 		if (lenp)
 			*lenp = err;
 		return NULL;
@@ -462,14 +475,19 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 	if (namep) {
 		const char *name;
 		int namelen;
-		name = fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
-				      &namelen);
-		if (!name) {
-			if (lenp)
-				*lenp = namelen;
-			return NULL;
+
+		if (!can_assume(VALID_INPUT)) {
+			name = fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
+					      &namelen);
+			if (!name) {
+				if (lenp)
+					*lenp = namelen;
+				return NULL;
+			}
+			*namep = name;
+		} else {
+			*namep = fdt_string(fdt, fdt32_ld(&prop->nameoff));
 		}
-		*namep = name;
 	}
 
 	/* Handle realignment */
@@ -599,10 +617,12 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
 		}
 	}
 
-	if ((offset == -FDT_ERR_NOTFOUND) || (offset >= 0))
-		return -FDT_ERR_BADOFFSET;
-	else if (offset == -FDT_ERR_BADOFFSET)
-		return -FDT_ERR_BADSTRUCTURE;
+	if (!can_assume(VALID_INPUT)) {
+		if ((offset == -FDT_ERR_NOTFOUND) || (offset >= 0))
+			return -FDT_ERR_BADOFFSET;
+		else if (offset == -FDT_ERR_BADOFFSET)
+			return -FDT_ERR_BADSTRUCTURE;
+	}
 
 	return offset; /* error from fdt_next_node() */
 }
@@ -614,7 +634,8 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
 
 	err = fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
 	if (err)
-		return (err < 0) ? err : -FDT_ERR_INTERNAL;
+		return (can_assume(VALID_INPUT) || err < 0) ? err :
+			-FDT_ERR_INTERNAL;
 	return nodedepth;
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog

