From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v11 4/5] Adjust libfdt.h to work with swig
Date: Fri, 17 Mar 2017 16:14:33 -0600
Message-ID: <20170317221434.15390-5-sjg@chromium.org>
References: <20170317221434.15390-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LWvIXeGNGc8mOyaTPNTXlTIVQd3qQt7TGDuENMXM/0Y=;
        b=Z674bwYd7ayAhnXQeSxoYj185f5hLPNmQVWup3buA4zS6XfV9Rk5XhpHrPNS5hm0MC
         fJCUaj5i/62TnypGGcF3m6Z20MiMB61EXnQCl/WzpbvCMbCd7Tu5RVhUqCZOh6uHkKgr
         YMpbLf1wvvOt7sxa1MtP2lW4tdqaWc5jeQoP54/6hsZrRPJ1BQimxk+1EKlQqwW6eKNc
         hCX7UgpboU6PxHzKdvVjN63NKYgQopGrS+2HTXMOB4991h0UV9Bwcd6/ZcUltFCjkZcQ
         kgUZX4lqGsqHFW0kRryhkRCh6QzFKS4wfCc3uECUkysI+bAsTnUyf1QGwOXxMgN/zL6c
         yp1A==
In-Reply-To: <20170317221434.15390-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

There are a few places where libfdt.h cannot be used as is with swig:

- macros like fdt_totalsize() have to be defined as C declarations
- fdt_offset_ptr() and fdt_getprop_namelen() need special treatment due to
    a TODO in the wrapper for fdt_getprop(). However they are not useful to
    Python so can be removed

Add #ifdefs to work around these problem.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v11: None
Changes in v10: None
Changes in v9: None
Changes in v8:
- Drop all the namelen functions from the Python bindings

Changes in v7: None
Changes in v6: None
Changes in v5:
- Update commit message
- Drop #ifdef around fdt_get_header() macros

Changes in v4:
- Add new patch to adjust libfdt.h to work with swig

Changes in v3: None
Changes in v2: None

 libfdt/libfdt.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index ac42e04..2c9ddb4 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -143,7 +143,9 @@
 /* Low-level functions (you probably don't need these)                */
 /**********************************************************************/
 
+#ifndef SWIG /* This function is not useful in Python */
 const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int checklen);
+#endif
 static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
 {
 	return (void *)(uintptr_t)fdt_offset_ptr(fdt, offset, checklen);
@@ -210,7 +212,6 @@ int fdt_next_subnode(const void *fdt, int offset);
 /**********************************************************************/
 /* General functions                                                  */
 /**********************************************************************/
-
 #define fdt_get_header(fdt, field) \
 	(fdt32_to_cpu(((const struct fdt_header *)(fdt))->field))
 #define fdt_magic(fdt)			(fdt_get_header(fdt, magic))
@@ -354,8 +355,10 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size);
  * useful for finding subnodes based on a portion of a larger string,
  * such as a full path.
  */
+#ifndef SWIG /* Not available in Python */
 int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
 			       const char *name, int namelen);
+#endif
 /**
  * fdt_subnode_offset - find a subnode of a given node
  * @fdt: pointer to the device tree blob
@@ -391,7 +394,9 @@ int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
  * Identical to fdt_path_offset(), but only consider the first namelen
  * characters of path as the path name.
  */
+#ifndef SWIG /* Not available in Python */
 int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
+#endif
 
 /**
  * fdt_path_offset - find a tree node by its full path
@@ -550,10 +555,12 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
  * Identical to fdt_get_property(), but only examine the first namelen
  * characters of name for matching the property name.
  */
+#ifndef SWIG /* Not available in Python */
 const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 						    int nodeoffset,
 						    const char *name,
 						    int namelen, int *lenp);
+#endif
 
 /**
  * fdt_get_property - find a given property in a given node
@@ -624,8 +631,10 @@ static inline struct fdt_property *fdt_get_property_w(void *fdt, int nodeoffset,
  *		-FDT_ERR_BADSTRUCTURE,
  *		-FDT_ERR_TRUNCATED, standard meanings
  */
+#ifndef SWIG /* This function is not useful in Python */
 const void *fdt_getprop_by_offset(const void *fdt, int offset,
 				  const char **namep, int *lenp);
+#endif
 
 /**
  * fdt_getprop_namelen - get property value based on substring
@@ -638,6 +647,7 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
  * Identical to fdt_getprop(), but only examine the first namelen
  * characters of name for matching the property name.
  */
+#ifndef SWIG /* Not available in Python */
 const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 				const char *name, int namelen, int *lenp);
 static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
@@ -647,6 +657,7 @@ static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
 	return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
 						      namelen, lenp);
 }
+#endif
 
 /**
  * fdt_getprop - retrieve the value of a given property
@@ -707,8 +718,10 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset);
  * Identical to fdt_get_alias(), but only examine the first namelen
  * characters of name for matching the alias name.
  */
+#ifndef SWIG /* Not available in Python */
 const char *fdt_get_alias_namelen(const void *fdt,
 				  const char *name, int namelen);
+#endif
 
 /**
  * fdt_get_alias - retrieve the path referenced by a given alias
@@ -1106,10 +1119,12 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
  * of the name. It is useful when you want to manipulate only one value of
  * an array and you have a string that doesn't end with \0.
  */
+#ifndef SWIG /* Not available in Python */
 int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 					const char *name, int namelen,
 					uint32_t idx, const void *val,
 					int len);
+#endif
 
 /**
  * fdt_setprop_inplace - change a property's value, but not its size
@@ -1139,8 +1154,10 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
  *	-FDT_ERR_BADSTRUCTURE,
  *	-FDT_ERR_TRUNCATED, standard meanings
  */
+#ifndef SWIG /* Not available in Python */
 int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 			const void *val, int len);
+#endif
 
 /**
  * fdt_setprop_inplace_u32 - change the value of a 32-bit integer property
@@ -1734,8 +1751,10 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name);
  * creating subnodes based on a portion of a larger string, such as a
  * full path.
  */
+#ifndef SWIG /* Not available in Python */
 int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 			    const char *name, int namelen);
+#endif
 
 /**
  * fdt_add_subnode - creates a new node
-- 
2.12.0.367.g23dc2f6d3c-goog
