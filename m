From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 09/14] libfdt: fdt_resize(): Fix comparison warning
Date: Mon, 21 Sep 2020 17:52:58 +0100
Message-ID: <20200921165303.9115-10-andre.przywara@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200921165303.9115-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness
in a comparison in fdt_resize().

A negative buffer size will surely do us no good, so let's rule this
case out first.
In the actual comparison we then know that a cast to an unsigned type is
safe.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_sw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 8a76adf..4c62922 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -152,6 +152,9 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
 
 	FDT_SW_PROBE(fdt);
 
+	if (bufsize < 0)
+		return -FDT_ERR_NOSPACE;
+
 	headsize = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
 	tailsize = fdt_size_dt_strings(fdt);
 
@@ -159,7 +162,7 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
 	    headsize + tailsize > fdt_totalsize(fdt))
 		return -FDT_ERR_INTERNAL;
 
-	if ((headsize + tailsize) > bufsize)
+	if ((headsize + tailsize) > (unsigned)bufsize)
 		return -FDT_ERR_NOSPACE;
 
 	oldtail = (char *)fdt + fdt_totalsize(fdt) - tailsize;
-- 
2.17.5

