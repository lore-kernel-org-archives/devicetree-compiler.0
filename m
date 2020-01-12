From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] libfdt: Correct signed/unsigned comparisons
Date: Sun, 12 Jan 2020 11:52:08 -0700
Message-ID: <20200112185209.75847-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tGT6Iio0jX95pwxEyILT5mazt8InuFJ9fCI1UvRM73I=;
        b=kFr8+HaBLGptAV4vBH8uP2HtKReMaRvQPJwWk4He5CAvl7SqB5s/aJddz1qIGooEBD
         NXjtiMXwWL7UpeJ9ojyt7wFe39JBl+b+nHbp/THgGtsLNx3Y8z68w5S8MqrXqBRpKo57
         u/I2ShdEB7XIXT/4pD3LRPEhN05PFbqa4KNl8=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

These warnings appear when building U-Boot on x86 and some other targets.
Correct them by adding casts.

Example:

scripts/dtc/libfdt/fdt.c: In function ‘fdt_offset_ptr’:
scripts/dtc/libfdt/fdt.c:137:18: warning: comparison of integer expressions of different signedness: ‘unsigned int’ and ‘int’ [-Wsign-compare]
   if ((absoffset < offset)

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 libfdt/fdt.c          |  4 ++--
 libfdt/fdt_overlay.c  |  2 +-
 libfdt/fdt_ro.c       | 13 +++++++------
 libfdt/fdt_strerror.c |  2 +-
 libfdt/fdt_sw.c       |  9 +++++----
 libfdt/fdt_wip.c      |  2 +-
 6 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index d6ce7c0..8b29dbd 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -116,7 +116,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 	unsigned absoffset = offset + fdt_off_dt_struct(fdt);
 
 	if ((absoffset < offset)
-	    || ((absoffset + len) < absoffset)
+	    || ((absoffset + len) < (unsigned int)absoffset)
 	    || (absoffset + len) > fdt_totalsize(fdt))
 		return NULL;
 
@@ -283,7 +283,7 @@ int fdt_move(const void *fdt, void *buf, int bufsize)
 {
 	FDT_RO_PROBE(fdt);
 
-	if (fdt_totalsize(fdt) > bufsize)
+	if (fdt_totalsize(fdt) > (unsigned int)bufsize)
 		return -FDT_ERR_NOSPACE;
 
 	memmove(buf, fdt, fdt_totalsize(fdt));
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index b310e49..dba4f52 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -250,7 +250,7 @@ static int overlay_update_local_node_references(void *fdto,
 			return tree_len;
 		}
 
-		for (i = 0; i < (fixup_len / sizeof(uint32_t)); i++) {
+		for (i = 0; i < (int)(fixup_len / sizeof(uint32_t)); i++) {
 			fdt32_t adj_val;
 			uint32_t poffset;
 
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index a5c2797..e4c90d4 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -44,7 +44,7 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 		goto fail;
 
 	err = -FDT_ERR_BADOFFSET;
-	if (absoffset >= totalsize)
+	if (absoffset >= (unsigned int)totalsize)
 		goto fail;
 	len = totalsize - absoffset;
 
@@ -52,14 +52,14 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 		if (stroffset < 0)
 			goto fail;
 		if (fdt_version(fdt) >= 17) {
-			if (stroffset >= fdt_size_dt_strings(fdt))
+			if ((unsigned int)stroffset >= fdt_size_dt_strings(fdt))
 				goto fail;
 			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
 				len = fdt_size_dt_strings(fdt) - stroffset;
 		}
 	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
 		if ((stroffset >= 0)
-		    || (stroffset < -fdt_size_dt_strings(fdt)))
+		    || ((unsigned int)stroffset < -fdt_size_dt_strings(fdt)))
 			goto fail;
 		if ((-stroffset) < len)
 			len = -stroffset;
@@ -151,9 +151,10 @@ static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
 	int offset = n * sizeof(struct fdt_reserve_entry);
 	int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
 
-	if (absoffset < fdt_off_mem_rsvmap(fdt))
+	if ((unsigned int)absoffset < fdt_off_mem_rsvmap(fdt))
 		return NULL;
-	if (absoffset > fdt_totalsize(fdt) - sizeof(struct fdt_reserve_entry))
+	if ((unsigned int)absoffset > fdt_totalsize(fdt) -
+	    sizeof(struct fdt_reserve_entry))
 		return NULL;
 	return fdt_mem_rsv_(fdt, n);
 }
@@ -658,7 +659,7 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
 {
 	int offset;
 
-	if ((phandle == 0) || (phandle == -1))
+	if ((phandle == 0) || (phandle == (uint32_t)-1))
 		return -FDT_ERR_BADPHANDLE;
 
 	FDT_RO_PROBE(fdt);
diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
index 768db66..c02c6ef 100644
--- a/libfdt/fdt_strerror.c
+++ b/libfdt/fdt_strerror.c
@@ -48,7 +48,7 @@ const char *fdt_strerror(int errval)
 		return "<valid offset/length>";
 	else if (errval == 0)
 		return "<no error>";
-	else if (errval > -FDT_ERRTABSIZE) {
+	else if (errval > (int)-FDT_ERRTABSIZE) {
 		const char *s = fdt_errtable[-errval].str;
 
 		if (s)
diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 76bea22..e37d785 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -95,7 +95,8 @@ static void *fdt_grab_space_(void *fdt, size_t len)
 	spaceleft = fdt_totalsize(fdt) - fdt_off_dt_struct(fdt)
 		- fdt_size_dt_strings(fdt);
 
-	if ((offset + len < offset) || (offset + len > spaceleft))
+	if ((offset + len < (size_t)offset) ||
+	    (offset + len > (size_t)spaceleft))
 		return NULL;
 
 	fdt_set_size_dt_struct(fdt, offset + len);
@@ -108,7 +109,7 @@ int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags)
 					 sizeof(struct fdt_reserve_entry));
 	void *fdt = buf;
 
-	if (bufsize < hdrsize)
+	if ((unsigned int)bufsize < hdrsize)
 		return -FDT_ERR_NOSPACE;
 
 	if (flags & ~FDT_CREATE_FLAGS_ALL)
@@ -154,7 +155,7 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
 	if ((headsize + tailsize) > fdt_totalsize(fdt))
 		return -FDT_ERR_INTERNAL;
 
-	if ((headsize + tailsize) > bufsize)
+	if ((headsize + tailsize) > (size_t)bufsize)
 		return -FDT_ERR_NOSPACE;
 
 	oldtail = (char *)fdt + fdt_totalsize(fdt) - tailsize;
@@ -248,7 +249,7 @@ static int fdt_add_string_(void *fdt, const char *s)
 
 	offset = -strtabsize - len;
 	struct_top = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
-	if (fdt_totalsize(fdt) + offset < struct_top)
+	if (fdt_totalsize(fdt) + offset < (unsigned int)struct_top)
 		return 0; /* no more room :( */
 
 	memcpy(strtab + offset, s, len);
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index f64139e..82db674 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -23,7 +23,7 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 	if (!propval)
 		return proplen;
 
-	if (proplen < (len + idx))
+	if ((unsigned int)proplen < (len + idx))
 		return -FDT_ERR_NOSPACE;
 
 	memcpy((char *)propval + idx, val, len);
-- 
2.25.0.rc1.283.g88dfdc4193-goog

