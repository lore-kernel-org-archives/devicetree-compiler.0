From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 4/6] libfdt: libfdt_wip: Fix comparison warning
Date: Thu,  1 Oct 2020 17:46:28 +0100
Message-ID: <20201001164630.4980-5-andre.przywara@arm.com>
References: <20201001164630.4980-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201001164630.4980-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness
in a comparison in fdt_setprop_inplace_namelen_partial().

fdt_getprop_namelen() will only return negative error values in "proplen"
if the return value is NULL. So we can rely on "proplen" being positive
in our case and can safely cast it to an unsigned type.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_wip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index f64139e..c2d7566 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -23,7 +23,7 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 	if (!propval)
 		return proplen;
 
-	if (proplen < (len + idx))
+	if ((unsigned)proplen < (len + idx))
 		return -FDT_ERR_NOSPACE;
 
 	memcpy((char *)propval + idx, val, len);
-- 
2.17.5

