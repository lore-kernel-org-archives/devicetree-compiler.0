From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 13/14] libfdt: fdt_node_offset_by_phandle(): Fix comparison warning
Date: Mon, 21 Sep 2020 17:53:02 +0100
Message-ID: <20200921165303.9115-14-andre.przywara@arm.com>
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
in a comparison in fdt_node_offset_by_phandle().

Uses a better suited bitwise NOT operator to denote the special value of
-1, which automatically results in an unsigned type.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_ro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 059d302..44ad7ec 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -680,7 +680,7 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
 {
 	int offset;
 
-	if ((phandle == 0) || (phandle == -1))
+	if ((phandle == 0) || (phandle == ~0U))
 		return -FDT_ERR_BADPHANDLE;
 
 	FDT_RO_PROBE(fdt);
-- 
2.17.5

