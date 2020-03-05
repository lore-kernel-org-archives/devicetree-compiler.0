From: Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>
Subject: [PATCH] libfdt: fix undefined behaviour in fdt_splice_()
Date: Thu, 5 Mar 2020 15:04:45 +0100
Message-ID: <f2d09e81-7cb8-c5cc-9699-1ac05b0626ff@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

libfdt: fix undefined behaviour in fdt_splice_()

Along the lines of commit d0b3ab0a0f46 ("libfdt: Fix undefined behaviour
in fdt_offset_ptr()"), fdt_splice_() similarly may not use pointer
arithmetic to do overflow checks. (The left side of the checks added by
d4c7c25c9ed1 ["libfdt: check for potential overrun in _fdt_splice()"]
doesn't really lend itself to similar replacement though.)

Signed-off-by: Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>
---
The right side of the checks added by d4c7c25c9ed1 looks suspicious,
which is more noticable after the transformation done here:

	end - oldlen + newlen < (char *)fdt

	end - (char *)fdt + newlen < oldlen

	dsize + newlen < oldlen

--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -46,7 +46,7 @@ static int fdt_rw_probe_(void *fdt)
 			return err_; \
 	}
 
-static inline int fdt_data_size_(void *fdt)
+static inline unsigned int fdt_data_size_(void *fdt)
 {
 	return fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt);
 }
@@ -54,15 +54,16 @@ static inline int fdt_data_size_(void *f
 static int fdt_splice_(void *fdt, void *splicepoint, int oldlen, int newlen)
 {
 	char *p = splicepoint;
-	char *end = (char *)fdt + fdt_data_size_(fdt);
+	unsigned int dsize = fdt_data_size_(fdt);
+	size_t soff = p - (char *)fdt;
 
-	if (((p + oldlen) < p) || ((p + oldlen) > end))
+	if ((oldlen < 0) || (soff + oldlen < soff) || (soff + oldlen > dsize))
 		return -FDT_ERR_BADOFFSET;
-	if ((p < (char *)fdt) || ((end - oldlen + newlen) < (char *)fdt))
+	if ((p < (char *)fdt) || (dsize + newlen < oldlen))
 		return -FDT_ERR_BADOFFSET;
-	if ((end - oldlen + newlen) > ((char *)fdt + fdt_totalsize(fdt)))
+	if (dsize - oldlen + newlen > fdt_totalsize(fdt))
 		return -FDT_ERR_NOSPACE;
-	memmove(p + newlen, p + oldlen, end - p - oldlen);
+	memmove(p + newlen, p + oldlen, ((char *)fdt + dsize) - (p + oldlen));
 	return 0;
 }
 
