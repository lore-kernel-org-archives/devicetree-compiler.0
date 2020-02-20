From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v7 1/8] libfdt: De-inline fdt_header_size()
Date: Thu, 20 Feb 2020 14:45:50 -0700
Message-ID: <20200220214557.176528-2-sjg@chromium.org>
References: <20200220214557.176528-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iBJRDlkP0BqeJUpDXwYXjz3Gf99HXwXYdySxu/JAA3I=;
        b=YMFtGpnDbbJEFVO02K2Ii3qJ+Idk21wq2QMjvEXMjYaxhEG+9PhNEhvvf+Lc776k9D
         yjV5xYMK6O1Lm1cDLhsl+m/v+0wLg0T0gP4Qf20tXxIEE91Fzlse0fwY43R8xnvhPvCw
         hc6KFAAaBQ+599wJ7hK8Aucjhb3JBFPFxCghw=
In-Reply-To: <20200220214557.176528-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v7:
- Drop vg_prepare_blob() valgrind changes for fdt_header_size()

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
 3 files changed, 11 insertions(+), 4 deletions(-)

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
-- 
2.25.0.265.gbab2e86ba0-goog

