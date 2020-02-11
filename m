From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 3/8] libfdt: Add support for disabling dtb checks
Date: Tue, 11 Feb 2020 13:09:40 -0700
Message-ID: <20200211200945.46606-4-sjg@chromium.org>
References: <20200211200945.46606-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eg6WFv958v3HFnKYyQcgtkVktqMW7+j6AzymLvcmt+Q=;
        b=dgQJU0dOjSpJB78rufbCR3sGYbtozG5/QQJ6tipZbc2Ug3xDGaJfdKAEKuce8KkEL6
         NNOpp244k8Uxlm2yuiwotOX46x9Rh8BvAuuopXQUupDHbBRZG5JIH2cIMuXaeFL7pjA8
         SC0A9Cu11nKDE91L2LLE9aLbK81NDuEKgrvWE=
In-Reply-To: <20200211200945.46606-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Support ASSUME_VALID_DTB to disable some sanity checks

If we assume that the DTB itself is valid then we can skip some checks and
save code space. Add various conditions to handle this.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v6:
- Always call fdt_ro_probe_(), etc. and have that function do the check
- Change check in fdt_get_property_namelen_() to VALID_DTB

Changes in v5:
- Split out VALID_DTB checks into a separate patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 libfdt/fdt.c    | 53 +++++++++++++++++++++++++++++--------------------
 libfdt/fdt_ro.c |  3 ++-
 libfdt/fdt_rw.c |  2 ++
 libfdt/fdt_sw.c | 19 +++++++++++-------
 4 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 3e37a4b..d4daf60 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -19,6 +19,9 @@ int32_t fdt_ro_probe_(const void *fdt)
 {
 	uint32_t totalsize = fdt_totalsize(fdt);
 
+	if (can_assume(VALID_DTB))
+		return totalsize;
+
 	if (fdt_magic(fdt) == FDT_MAGIC) {
 		/* Complete tree */
 		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
@@ -81,38 +84,44 @@ int fdt_check_header(const void *fdt)
 
 	if (fdt_magic(fdt) != FDT_MAGIC)
 		return -FDT_ERR_BADMAGIC;
-	hdrsize = fdt_header_size(fdt);
 	if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
 	    || (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION))
 		return -FDT_ERR_BADVERSION;
 	if (fdt_version(fdt) < fdt_last_comp_version(fdt))
 		return -FDT_ERR_BADVERSION;
+	hdrsize = fdt_header_size(fdt);
+	if (!can_assume(VALID_DTB)) {
 
-	if ((fdt_totalsize(fdt) < hdrsize)
-	    || (fdt_totalsize(fdt) > INT_MAX))
-		return -FDT_ERR_TRUNCATED;
-
-	/* Bounds check memrsv block */
-	if (!check_off_(hdrsize, fdt_totalsize(fdt), fdt_off_mem_rsvmap(fdt)))
-		return -FDT_ERR_TRUNCATED;
+		if ((fdt_totalsize(fdt) < hdrsize)
+		    || (fdt_totalsize(fdt) > INT_MAX))
+			return -FDT_ERR_TRUNCATED;
 
-	/* Bounds check structure block */
-	if (fdt_version(fdt) < 17) {
+		/* Bounds check memrsv block */
 		if (!check_off_(hdrsize, fdt_totalsize(fdt),
-				fdt_off_dt_struct(fdt)))
+				fdt_off_mem_rsvmap(fdt)))
 			return -FDT_ERR_TRUNCATED;
-	} else {
+	}
+
+	if (!can_assume(VALID_DTB)) {
+		/* Bounds check structure block */
+		if (fdt_version(fdt) < 17) {
+			if (!check_off_(hdrsize, fdt_totalsize(fdt),
+					fdt_off_dt_struct(fdt)))
+				return -FDT_ERR_TRUNCATED;
+		} else {
+			if (!check_block_(hdrsize, fdt_totalsize(fdt),
+					  fdt_off_dt_struct(fdt),
+					  fdt_size_dt_struct(fdt)))
+				return -FDT_ERR_TRUNCATED;
+		}
+
+		/* Bounds check strings block */
 		if (!check_block_(hdrsize, fdt_totalsize(fdt),
-				  fdt_off_dt_struct(fdt),
-				  fdt_size_dt_struct(fdt)))
+				  fdt_off_dt_strings(fdt),
+				  fdt_size_dt_strings(fdt)))
 			return -FDT_ERR_TRUNCATED;
 	}
 
-	/* Bounds check strings block */
-	if (!check_block_(hdrsize, fdt_totalsize(fdt),
-			  fdt_off_dt_strings(fdt), fdt_size_dt_strings(fdt)))
-		return -FDT_ERR_TRUNCATED;
-
 	return 0;
 }
 
@@ -142,7 +151,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 
 	*nextoffset = -FDT_ERR_TRUNCATED;
 	tagp = fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
-	if (!tagp)
+	if (!can_assume(VALID_DTB) && !tagp)
 		return FDT_END; /* premature end */
 	tag = fdt32_to_cpu(*tagp);
 	offset += FDT_TAGSIZE;
@@ -154,13 +163,13 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		do {
 			p = fdt_offset_ptr(fdt, offset++, 1);
 		} while (p && (*p != '\0'));
-		if (!p)
+		if (!can_assume(VALID_DTB) && !p)
 			return FDT_END; /* premature end */
 		break;
 
 	case FDT_PROP:
 		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
-		if (!lenp)
+		if (!can_assume(VALID_DTB) && !lenp)
 			return FDT_END; /* premature end */
 		/* skip-name offset, length and value */
 		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index a5c2797..4c26fbe 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -388,7 +388,8 @@ static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
 	     (offset = fdt_next_property_offset(fdt, offset))) {
 		const struct fdt_property *prop;
 
-		if (!(prop = fdt_get_property_by_offset_(fdt, offset, lenp))) {
+		prop = fdt_get_property_by_offset_(fdt, offset, lenp);
+		if (!can_assume(VALID_DTB) && !prop) {
 			offset = -FDT_ERR_INTERNAL;
 			break;
 		}
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 8795947..707c00a 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -24,6 +24,8 @@ static int fdt_blocks_misordered_(const void *fdt,
 
 static int fdt_rw_probe_(void *fdt)
 {
+	if (can_assume(VALID_DTB))
+		return 0;
 	FDT_RO_PROBE(fdt);
 
 	if (fdt_version(fdt) < 17)
diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 76bea22..96365b4 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -12,10 +12,13 @@
 
 static int fdt_sw_probe_(void *fdt)
 {
-	if (fdt_magic(fdt) == FDT_MAGIC)
-		return -FDT_ERR_BADSTATE;
-	else if (fdt_magic(fdt) != FDT_SW_MAGIC)
-		return -FDT_ERR_BADMAGIC;
+	if (!can_assume(VALID_DTB)) {
+		if (fdt_magic(fdt) == FDT_MAGIC)
+			return -FDT_ERR_BADSTATE;
+		else if (fdt_magic(fdt) != FDT_SW_MAGIC)
+			return -FDT_ERR_BADMAGIC;
+	}
+
 	return 0;
 }
 
@@ -38,7 +41,7 @@ static int fdt_sw_probe_memrsv_(void *fdt)
 	if (err)
 		return err;
 
-	if (fdt_off_dt_strings(fdt) != 0)
+	if (!can_assume(VALID_DTB) && fdt_off_dt_strings(fdt) != 0)
 		return -FDT_ERR_BADSTATE;
 	return 0;
 }
@@ -46,7 +49,8 @@ static int fdt_sw_probe_memrsv_(void *fdt)
 #define FDT_SW_PROBE_MEMRSV(fdt) \
 	{ \
 		int err; \
-		if ((err = fdt_sw_probe_memrsv_(fdt)) != 0) \
+		if (!can_assume(VALID_DTB) && \
+		    (err = fdt_sw_probe_memrsv_(fdt)) != 0) \
 			return err; \
 	}
 
@@ -151,7 +155,8 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
 	headsize = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
 	tailsize = fdt_size_dt_strings(fdt);
 
-	if ((headsize + tailsize) > fdt_totalsize(fdt))
+	if (!can_assume(VALID_DTB) &&
+	    headsize + tailsize > fdt_totalsize(fdt))
 		return -FDT_ERR_INTERNAL;
 
 	if ((headsize + tailsize) > bufsize)
-- 
2.25.0.341.g760bfbb309-goog

