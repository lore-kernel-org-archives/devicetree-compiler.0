From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/5] checks: Drop interrupt provider '#address-cells' check
Date: Mon, 11 Oct 2021 14:12:43 -0500
Message-ID: <20211011191245.1009682-3-robh@kernel.org>
References: <20211011191245.1009682-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211011191245.1009682-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

'#address-cells' is only needed when parsing 'interrupt-map' properties, so
remove it from the common interrupt-provider test.

Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/checks.c b/checks.c
index a72ae4cc0be9..1a39bfd2cd94 100644
--- a/checks.c
+++ b/checks.c
@@ -1581,11 +1581,6 @@ static void check_interrupt_provider(struct check *c,
 	if (!prop)
 		FAIL(c, dti, node,
 		     "Missing #interrupt-cells in interrupt provider");
-
-	prop = get_property(node, "#address-cells");
-	if (!prop)
-		FAIL(c, dti, node,
-		     "Missing #address-cells in interrupt provider");
 }
 WARNING(interrupt_provider, check_interrupt_provider, NULL, &interrupts_extended_is_cell);
 
-- 
2.30.2

