From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v7 4/5] Adjust libfdt.h to work with swig
Date: Tue, 21 Feb 2017 21:33:39 -0700
Message-ID: <20170222043340.17008-5-sjg@chromium.org>
References: <20170222043340.17008-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Z3ldiAIC+r07HD1AucJHnHbQvVM3TK6nbEsnYruJZ88=;
        b=ryZP4UCmUMkx5leQf4/iiXYBhV560YM21Bd/gdL1gVjdxTEoqc8UbYUfqfY82KxJUS
         CKvKrNZuUfaBgxlpOWCeq2Cbs6Rh9yza5zuRMnxh597vuhRYms4YRmDe055ukZhdjD00
         fCgqitJ/MpZyfErfIdsr+o3260G0seVxg9NM90ixW+P+knzLGGnDwOeWIR/K22QgCnQM
         L8W+3F/ilu2C5hKWPkXBb5gdHTxhm53txJhHs1DYzSwh8GEfDfgYTyuOSvcETSGYqfGK
         OXete9wuMVcZjnZh9Sn/r8LKe8wXyoNuZL9Y2Z8pnCGUbe97UADJP1QCHkVbXBLimlDs
         SoWA==
In-Reply-To: <20170222043340.17008-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v7: None
Changes in v6: None
Changes in v5:
- Update commit message
- Drop #ifdef around fdt_get_header() macros

Changes in v4:
- Add new patch to adjust libfdt.h to work with swig

Changes in v3: None
Changes in v2: None

 libfdt/libfdt.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c69e918..2aa8ff6 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -143,7 +143,9 @@
 /* Low-level functions (you probably don't need these)                */
 /**********************************************************************/
 
+#ifndef SWIG /* This functions are not useful in Python */
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
@@ -638,8 +639,10 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
  * Identical to fdt_getprop(), but only examine the first namelen
  * characters of name for matching the property name.
  */
+#ifndef SWIG /* Not available in Python */
 const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 				const char *name, int namelen, int *lenp);
+#endif
 static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
 					  const char *name, int namelen,
 					  int *lenp)
-- 
2.11.0.483.g087da7b7c-goog
