From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 10/14] libfdt: libfdt_wip: Fix comparison warning
Date: Mon, 21 Sep 2020 17:52:59 +0100
Message-ID: <20200921165303.9115-11-andre.przywara@arm.com>
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
in a comparison in fdt_setprop_inplace_namelen_partial().

Since fdt_getprop_namelen() can return negative error values, check for
those first and bail out early.
Later on we can then safely cast the value to an unsigned type.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_wip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index f64139e..d1b4f1b 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -20,10 +20,10 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 
 	propval = fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
 					&proplen);
-	if (!propval)
+	if (!propval || proplen < 0)
 		return proplen;
 
-	if (proplen < (len + idx))
+	if ((unsigned)proplen < (len + idx))
 		return -FDT_ERR_NOSPACE;
 
 	memcpy((char *)propval + idx, val, len);
-- 
2.17.5

