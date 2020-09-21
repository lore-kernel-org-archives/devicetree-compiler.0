From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 06/14] libfdt: fdt_get_string(): Fix comparison warnings
Date: Mon, 21 Sep 2020 17:52:55 +0100
Message-ID: <20200921165303.9115-7-andre.przywara@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200921165303.9115-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness in
comparisons in fdt_get_string().

In the first two cases, we have just established that the signed values
are not negative, so it's safe to cast the values to an unsigned type.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_ro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 3c8d143..ddb5a2d 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -53,7 +53,7 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 
 	err = -FDT_ERR_BADOFFSET;
 	absoffset = stroffset + fdt_off_dt_strings(fdt);
-	if (absoffset >= totalsize)
+	if (absoffset >= (unsigned)totalsize)
 		goto fail;
 	len = totalsize - absoffset;
 
@@ -61,7 +61,7 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 		if (stroffset < 0)
 			goto fail;
 		if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
-			if (stroffset >= fdt_size_dt_strings(fdt))
+			if ((unsigned)stroffset >= fdt_size_dt_strings(fdt))
 				goto fail;
 			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
 				len = fdt_size_dt_strings(fdt) - stroffset;
-- 
2.17.5

