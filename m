From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 1/8] libfdt: De-inline fdt_header_size()
Date: Tue, 11 Feb 2020 13:09:38 -0700
Message-ID: <20200211200945.46606-2-sjg@chromium.org>
References: <20200211200945.46606-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/XLiwztDaPrtPq2TJqccVoyehJYiDD62RhbfHTVki7I=;
        b=NaRATf944OfdQIVcQ0KGO71cwHxRBkQi9w3jbH31lX7z5r6uhEvBUv9cGmH4K2ohUu
         bKXSnuvHeaL3GncIkI/KCt43hnjRGuEnD3DR2CvTMP9P1xg45Q3Ip2NKVOvFZN19lTu0
         Vh/W13qGFp1WtxyVCB1BFfausf3StkvtFV17E=
In-Reply-To: <20200211200945.46606-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

There does not seem to be a strong reason to inline this function. Also
we are about to add some extra code to it which will increase its size.

Move it into fdt.c and use a simple declaration in libfdt.h

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v6: None
Changes in v5: None
Changes in v4:
- Add fdt_header_size to version.lds

Changes in v3:
- Add a new patch to de-inline fdt_header_size()

Changes in v2: None

 libfdt/fdt.c       | 5 +++++
 libfdt/libfdt.h    | 9 +++++----
 libfdt/version.lds | 1 +
 tests/testutils.c  | 1 -
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index d6ce7c0..3e37a4b 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -70,6 +70,11 @@ size_t fdt_header_size_(uint32_t version)
 		return FDT_V17_SIZE;
 }
 
+size_t fdt_header_size(const void *fdt)
+{
+	return fdt_header_size_(fdt_version(fdt));
+}
+
 int fdt_check_header(const void *fdt)
 {
 	size_t hdrsize;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index fc4c496..48f375c 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -266,11 +266,12 @@ fdt_set_hdr_(size_dt_struct);
  * fdt_header_size - return the size of the tree's header
  * @fdt: pointer to a flattened device tree
  */
+size_t fdt_header_size(const void *fdt);
+
+/**
+ * fdt_header_size_ - internal function which takes a version number
+ */
 size_t fdt_header_size_(uint32_t version);
-static inline size_t fdt_header_size(const void *fdt)
-{
-	return fdt_header_size_(fdt_version(fdt));
-}
 
 /**
  * fdt_check_header - sanity check a device tree header
diff --git a/libfdt/version.lds b/libfdt/version.lds
index ae32924..7ab85f1 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -20,6 +20,7 @@ LIBFDT_1.2 {
 		fdt_get_alias_namelen;
 		fdt_get_alias;
 		fdt_get_path;
+                fdt_header_size;
 		fdt_supernode_atdepth_offset;
 		fdt_node_depth;
 		fdt_parent_offset;
diff --git a/tests/testutils.c b/tests/testutils.c
index 5e494c5..53cb35f 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -261,7 +261,6 @@ void vg_prepare_blob(void *fdt, size_t bufsize)
 
 	VALGRIND_MAKE_MEM_UNDEFINED(blob, bufsize);
 	VALGRIND_MAKE_MEM_DEFINED(blob, FDT_V1_SIZE);
-	VALGRIND_MAKE_MEM_DEFINED(blob, fdt_header_size(fdt));
 
 	if (fdt_magic(fdt) == FDT_MAGIC) {
 		off_strings = fdt_off_dt_strings(fdt);
-- 
2.25.0.341.g760bfbb309-goog

