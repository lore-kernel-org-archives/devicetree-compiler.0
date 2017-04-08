From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] Fix a few whitespace and style nits
Date: Sat,  8 Apr 2017 10:14:42 -0600
Message-ID: <20170408161442.9064-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=xAAi6J18UQeYCapL4+ZY7kF5Ahf7IbddZ/TZfQe/mFM=;
        b=XDiTUIIvxynmJqGz9g+nCFsBJ/BajLwLD5K3RNvKmykxhcDzU2PfypTJQQFUkF4r+c
         NVWk9oikJPcS/fZF7072yL4KosSZFUdfMQ8BhakFdUxD5TjfximWmdrMKGG19Q5ykmtX
         zxj/9b9jAxSpDLqedN6ULrG6ophLzE8Pic9l0NM3/jj/TUzVNm7IJDJczKJF/qA127qW
         9vONZS2dBhfE6BgtTpzyGvUc4Vd/u2PsK+fKwVmZzsSEnQcWeMvT8XLxXCGkhBnaCvqq
         rUNVLCX5APrGs+1MkHLCaQ03+tnc53C2sf3MA7et6dJzgF4sH0eJyWoVFgW7Rb9aIAgT
         NJ9w==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

These were noticed when synching with U-Boot's downstream tree.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 libfdt/fdt_empty_tree.c | 1 -
 libfdt/fdt_ro.c         | 4 ++--
 libfdt/fdt_rw.c         | 4 ++--
 libfdt/fdt_wip.c        | 4 ++--
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/libfdt/fdt_empty_tree.c b/libfdt/fdt_empty_tree.c
index f72d13b..f2ae9b7 100644
--- a/libfdt/fdt_empty_tree.c
+++ b/libfdt/fdt_empty_tree.c
@@ -81,4 +81,3 @@ int fdt_create_empty_tree(void *buf, int bufsize)
 
 	return fdt_open_into(buf, buf, bufsize);
 }
-
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 3d00d2e..08de2cc 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -60,7 +60,7 @@ static int _fdt_nodename_eq(const void *fdt, int offset,
 {
 	const char *p = fdt_offset_ptr(fdt, offset + FDT_TAGSIZE, len+1);
 
-	if (! p)
+	if (!p)
 		/* short match */
 		return 0;
 
@@ -327,7 +327,7 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 	const struct fdt_property *prop;
 
 	prop = fdt_get_property_namelen(fdt, nodeoffset, name, namelen, lenp);
-	if (! prop)
+	if (!prop)
 		return NULL;
 
 	return prop->data;
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 3fd5847..8b487f6 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -207,7 +207,7 @@ static int _fdt_resize_property(void *fdt, int nodeoffset, const char *name,
 	int err;
 
 	*prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
-	if (! (*prop))
+	if (!*prop)
 		return oldlen;
 
 	if ((err = _fdt_splice_struct(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
@@ -323,7 +323,7 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 	FDT_RW_CHECK_HEADER(fdt);
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
-	if (! prop)
+	if (!prop)
 		return len;
 
 	proplen = sizeof(*prop) + FDT_TAGALIGN(len);
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index 6aaab39..5e85919 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -82,7 +82,7 @@ int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 	int proplen;
 
 	propval = fdt_getprop(fdt, nodeoffset, name, &proplen);
-	if (! propval)
+	if (!propval)
 		return proplen;
 
 	if (proplen != len)
@@ -107,7 +107,7 @@ int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
 	int len;
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
-	if (! prop)
+	if (!prop)
 		return len;
 
 	_fdt_nop_region(prop, len + sizeof(*prop));
-- 
2.12.2.715.g7642488e1d-goog
