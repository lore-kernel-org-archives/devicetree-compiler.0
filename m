From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 3/7] libfdt: Add support for disabling dtb checks
Date: Wed,  5 Feb 2020 22:40:30 -0700
Message-ID: <20200206054034.162732-4-sjg@chromium.org>
References: <20200206054034.162732-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eGD51MfY8FpaahB0VP6gYaKl+vK1l36GS2X+8RvwcQg=;
        b=NF6zjy3Z613b4dgLh/iDdMXvE+TXv/c6+EavRvpotbjXGqDJItSnCtylUSsBG7NQsK
         QAVV9mdtReegFFRU4c62gmrkGOwMKwqe25MJjGRictSbKhj5nzBzSglczVkKy7lGXSI8
         fCYilbcXvl6V8Lh22rbnc6t87HMWz/eqDt8hg=
In-Reply-To: <20200206054034.162732-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v5:
- Split out VALID_DTB checks into a separate patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 libfdt/fdt.c             | 50 ++++++++++++++++++++++------------------
 libfdt/fdt_ro.c          |  7 ++++--
 libfdt/fdt_rw.c          |  7 +++++-
 libfdt/fdt_sw.c          | 30 ++++++++++++++++--------
 libfdt/libfdt_internal.h |  7 ++++--
 5 files changed, 64 insertions(+), 37 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 3e37a4b..03f2b7d 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -81,38 +81,44 @@ int fdt_check_header(const void *fdt)
 
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
 
@@ -142,7 +148,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 
 	*nextoffset = -FDT_ERR_TRUNCATED;
 	tagp = fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
-	if (!tagp)
+	if (!can_assume(VALID_DTB) && !tagp)
 		return FDT_END; /* premature end */
 	tag = fdt32_to_cpu(*tagp);
 	offset += FDT_TAGSIZE;
@@ -154,13 +160,13 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
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
index a5c2797..b41083f 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -289,9 +289,12 @@ const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 	const char *nameptr;
 	int err;
 
-	if (((err = fdt_ro_probe_(fdt)) < 0)
-	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0))
+	if (!can_assume(VALID_DTB)) {
+		if ((err = fdt_ro_probe_(fdt)) < 0)
 			goto fail;
+		if ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
+			goto fail;
+	}
 
 	nameptr = nh->name;
 
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 8795947..7a41a31 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -13,6 +13,8 @@
 static int fdt_blocks_misordered_(const void *fdt,
 				  int mem_rsv_size, int struct_size)
 {
+	if (can_assume(VALID_DTB))
+		return false;
 	return (fdt_off_mem_rsvmap(fdt) < FDT_ALIGN(sizeof(struct fdt_header), 8))
 		|| (fdt_off_dt_struct(fdt) <
 		    (fdt_off_mem_rsvmap(fdt) + mem_rsv_size))
@@ -24,6 +26,8 @@ static int fdt_blocks_misordered_(const void *fdt,
 
 static int fdt_rw_probe_(void *fdt)
 {
+	if (can_assume(VALID_DTB))
+		return 0;
 	FDT_RO_PROBE(fdt);
 
 	if (fdt_version(fdt) < 17)
@@ -40,7 +44,8 @@ static int fdt_rw_probe_(void *fdt)
 #define FDT_RW_PROBE(fdt) \
 	{ \
 		int err_; \
-		if ((err_ = fdt_rw_probe_(fdt)) != 0) \
+		if (!can_assume(VALID_DTB) && \
+		    (err_ = fdt_rw_probe_(fdt)) != 0) \
 			return err_; \
 	}
 
diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 76bea22..8fca816 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -12,17 +12,20 @@
 
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
 
 #define FDT_SW_PROBE(fdt) \
 	{ \
 		int err; \
-		if ((err = fdt_sw_probe_(fdt)) != 0) \
+		if (!can_assume(VALID_DTB) && (err = fdt_sw_probe_(fdt)) != 0) \
 			return err; \
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
 
@@ -60,7 +64,11 @@ static int fdt_sw_probe_memrsv_(void *fdt)
  */
 static int fdt_sw_probe_struct_(void *fdt)
 {
-	int err = fdt_sw_probe_(fdt);
+	int err;
+
+	if (can_assume(VALID_DTB))
+		return 0;
+	err = fdt_sw_probe_(fdt);
 	if (err)
 		return err;
 
@@ -72,7 +80,8 @@ static int fdt_sw_probe_struct_(void *fdt)
 #define FDT_SW_PROBE_STRUCT(fdt) \
 	{ \
 		int err; \
-		if ((err = fdt_sw_probe_struct_(fdt)) != 0) \
+		if (!can_assume(VALID_DTB) && \
+		    (err = fdt_sw_probe_struct_(fdt)) != 0) \
 			return err; \
 	}
 
@@ -151,7 +160,8 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
 	headsize = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
 	tailsize = fdt_size_dt_strings(fdt);
 
-	if ((headsize + tailsize) > fdt_totalsize(fdt))
+	if (!can_assume(VALID_DTB) &&
+	    headsize + tailsize > fdt_totalsize(fdt))
 		return -FDT_ERR_INTERNAL;
 
 	if ((headsize + tailsize) > bufsize)
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 1e31d10..1aa732b 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -14,8 +14,11 @@ int32_t fdt_ro_probe_(const void *fdt);
 #define FDT_RO_PROBE(fdt)					\
 	{							\
 		int32_t totalsize_;				\
-		if ((totalsize_ = fdt_ro_probe_(fdt)) < 0)	\
-			return totalsize_;			\
+		if (!can_assume(VALID_DTB)) {			\
+			totalsize_ = fdt_ro_probe_(fdt);	\
+			if (totalsize_ < 0)			\
+				return totalsize_;		\
+		}						\
 	}
 
 int fdt_check_node_offset_(const void *fdt, int offset);
-- 
2.25.0.341.g760bfbb309-goog

