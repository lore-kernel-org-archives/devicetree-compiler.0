From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 4/5] Adjust libfdt.h to work with swig
Date: Sun,  5 Feb 2017 13:13:22 -0700
Message-ID: <20170205201323.15411-5-sjg@chromium.org>
References: <20170205201323.15411-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fVxKCoaxkqt1xP1DoiP1bAcapX7XrP0g+DMOo47KNW0=;
        b=boJmodGdvL5qyD/FLh5LA9YjS0UZHQ4F0F0TReQ8+V966krtoJiKXoyQ+T9yzMyBgg
         Vsw9FugeFa4DjswFrhdCrqe4FHLaoFfUt3FJ7w1fzs/fhGi5+zhkbHui+/5Q+WpJhgIL
         Jg85HZkjKltgD5Cav9jPB5FB4AzAerFoi9rWaS3TONgCHDmJj9q+OlD+uxhlOKCSUIwl
         JZLHXBszl/LnRWvPm1qmGcsb6F2U76DUUYbl0k6MVyf7MYKPmpFoHCbSFjJGnDtDiTK2
         EK+wYml5unOo8I5bF7I15lGZSy6MuMP6sgw2vR0YD1NIBtmLBemdRvEfZ5rJByLMywJ2
         wTnw==
In-Reply-To: <20170205201323.15411-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
    a TODO in the wrapper for fdt_getprop()

The second one can hopefully be resolved by someone with more knowledge of
SWIG than me.

Add #ifdefs to work around this problem.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v4:
- Add new patch to adjust libfdt.h to work with swig

Changes in v3: None
Changes in v2: None

 libfdt/libfdt.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c69e918..2e78754 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -143,7 +143,9 @@
 /* Low-level functions (you probably don't need these)                */
 /**********************************************************************/
 
+#ifndef SWIG /* Use a special rule in libfdt.swig instead */
 const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int checklen);
+#endif
 static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
 {
 	return (void *)(uintptr_t)fdt_offset_ptr(fdt, offset, checklen);
@@ -210,7 +212,7 @@ int fdt_next_subnode(const void *fdt, int offset);
 /**********************************************************************/
 /* General functions                                                  */
 /**********************************************************************/
-
+#ifndef SWIG /* Repeated in libfdt.swig (we cannot use macros) */
 #define fdt_get_header(fdt, field) \
 	(fdt32_to_cpu(((const struct fdt_header *)(fdt))->field))
 #define fdt_magic(fdt)			(fdt_get_header(fdt, magic))
@@ -223,6 +225,7 @@ int fdt_next_subnode(const void *fdt, int offset);
 #define fdt_boot_cpuid_phys(fdt)	(fdt_get_header(fdt, boot_cpuid_phys))
 #define fdt_size_dt_strings(fdt)	(fdt_get_header(fdt, size_dt_strings))
 #define fdt_size_dt_struct(fdt)		(fdt_get_header(fdt, size_dt_struct))
+#endif /* SWIG */
 
 #define __fdt_set_hdr(name) \
 	static inline void fdt_set_##name(void *fdt, uint32_t val) \
@@ -638,8 +641,10 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
  * Identical to fdt_getprop(), but only examine the first namelen
  * characters of name for matching the property name.
  */
+#ifndef SWIG /* Use a special rule in libfdt.swig instead */
 const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 				const char *name, int namelen, int *lenp);
+#endif
 static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
 					  const char *name, int namelen,
 					  int *lenp)
-- 
2.11.0.483.g087da7b7c-goog
