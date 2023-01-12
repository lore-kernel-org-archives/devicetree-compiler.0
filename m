From: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] checks: Update #{size,address}-cells check for 'dma-ranges'
Date: Thu, 12 Jan 2023 20:56:54 +0800
Message-ID: <20230112125654.13390-1-qun-wei.lin@mediatek.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FfyeTZ0NkJ4XeyP3fEsLCnzULCGLE3QSbSVNft3A3BA=;
        b=UBLNI2L+1kZOW5pFRfXH4Tf502vQzuGWEJI7QzJDwvev0yiEH3UEkjxLGHaj65XA7aoX239CpE8kr2+j1Lr3bil4nqtjBZFm/GcuDb0J8FWNlBi+JixVmAETaOvwjCO0MEBwOgUkdvt8kAcz41bhV1Yp31pOM+ao2EFNsFWljzU=;
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kuan-ying.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ladon.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

The "dma-ranges" property value is a sequence of
	child-address  parent-address  child-size

The size of each field is determined by taking the child's
"#address-cells" value, the parent's "#address-cells" value,
and the child's "#size-cells" value.

However, in the following example, it gives a false alarm:
+-----------------------------------+---------------------------------------+
| ranges.dts                        | dma-ranges.dts                        |
+-----------------------------------+---------------------------------------+
| /dts-v1/;                         | /dts-v1/;                             |
|                                   |                                       |
| /{                                | /{                                    |
|   #address-cells = <1>;           |   #address-cells = <1>;               |
|                                   |                                       |
|   parent {                        |   parent {                            |
|     #address-cells = <1>;         |     #address-cells = <1>;             |
|     #size-cells = <1>;            |     #size-cells = <1>;                |
|     ranges = <0x0 0xe000 0x1000>; |     dma-ranges = <0x0 0xe000 0x1000>; |
|     child {                       |     child {                           |
|       ...                         |       ...                             |
|     };                            |     };                                |
|   };                              |   };                                  |
| };                                | };                                    |
+-----------------------------------+---------------------------------------+
| no warning                        | Warning (avoid_unnecessary_addr_size) |
+-----------------------------------+---------------------------------------+

Same as "ranges", it should not be reported in this check.

Signed-off-by: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 checks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index afa8f23..607e0f2 100644
--- a/checks.c
+++ b/checks.c
@@ -1232,7 +1232,7 @@ static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *d
 	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
 		return;
 
-	if (get_property(node, "ranges") || !node->children)
+	if (get_property(node, "ranges") || get_property(node, "dma-ranges") || !node->children)
 		return;
 
 	for_each_child(node, child) {
@@ -1242,7 +1242,7 @@ static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *d
 	}
 
 	if (!has_reg)
-		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property");
+		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ranges\", \"dma-ranges\" or child \"reg\" property");
 }
 WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, NULL, &avoid_default_addr_size);
 
-- 
2.18.0

