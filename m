From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 5/6] libfdt: fdt_get_string(): Fix sequential write comparison warnings
Date: Thu,  1 Oct 2020 17:46:29 +0100
Message-ID: <20201001164630.4980-6-andre.przywara@arm.com>
References: <20201001164630.4980-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201001164630.4980-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness in
comparisons in fdt_get_string().

Introduce a new usigned variable, which holds the actual (negated)
stroffset value, so we avoid negating all the other variables and have
proper types everywhere.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_ro.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index e192184..91cc6fe 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -67,11 +67,13 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 				len = fdt_size_dt_strings(fdt) - stroffset;
 		}
 	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
-		if ((stroffset >= 0)
-		    || (stroffset < -fdt_size_dt_strings(fdt)))
+		unsigned int sw_stroffset = -stroffset;
+
+		if ((stroffset >= 0) ||
+		    (sw_stroffset > fdt_size_dt_strings(fdt)))
 			goto fail;
-		if ((-stroffset) < len)
-			len = -stroffset;
+		if (sw_stroffset < len)
+			len = sw_stroffset;
 	} else {
 		err = -FDT_ERR_INTERNAL;
 		goto fail;
-- 
2.17.5

