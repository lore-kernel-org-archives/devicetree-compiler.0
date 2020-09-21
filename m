From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 11/14] libfdt: overlay: Fix comparison warning
Date: Mon, 21 Sep 2020 17:53:00 +0100
Message-ID: <20200921165303.9115-12-andre.przywara@arm.com>
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
a comparison in overlay_update_local_node_references().

This happens because the division of a signed int by an unsigned int
promotes the dividend to unsigned first (ANSI C standard 6.1.3.8).

As in this case we basically just divide by 4, we can do the division
separately earlier, which preserves the original type.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_overlay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index b310e49..d217e79 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -241,6 +241,7 @@ static int overlay_update_local_node_references(void *fdto,
 
 		if (fixup_len % sizeof(uint32_t))
 			return -FDT_ERR_BADOVERLAY;
+		fixup_len /= sizeof(uint32_t);
 
 		tree_val = fdt_getprop(fdto, tree_node, name, &tree_len);
 		if (!tree_val) {
@@ -250,7 +251,7 @@ static int overlay_update_local_node_references(void *fdto,
 			return tree_len;
 		}
 
-		for (i = 0; i < (fixup_len / sizeof(uint32_t)); i++) {
+		for (i = 0; i < fixup_len; i++) {
 			fdt32_t adj_val;
 			uint32_t poffset;
 
-- 
2.17.5

