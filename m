From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 12/14] libfdt: fdt_get_string(): Fix sequential write comparison warnings
Date: Mon, 21 Sep 2020 17:53:01 +0100
Message-ID: <20200921165303.9115-13-andre.przywara@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200921165303.9115-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness in
comparisons in fdt_get_string().

The two occassions dealing with the sequential write case are a bit
tricky, since we deliberately abuse the negative values here.

As we have just established that stroffset is negative, we can use
casts to appease the compiler.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_ro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index ddb5a2d..059d302 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -68,9 +68,9 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 		}
 	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
 		if ((stroffset >= 0)
-		    || (stroffset < -fdt_size_dt_strings(fdt)))
+		    || (stroffset < -(int)fdt_size_dt_strings(fdt)))
 			goto fail;
-		if ((-stroffset) < len)
+		if ((unsigned)(-stroffset) < len)
 			len = -stroffset;
 	} else {
 		err = -FDT_ERR_INTERNAL;
-- 
2.17.5

