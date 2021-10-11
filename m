From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 4/5] checks: Ensure '#interrupt-cells' only exists in interrupt providers
Date: Mon, 11 Oct 2021 14:12:44 -0500
Message-ID: <20211011191245.1009682-4-robh@kernel.org>
References: <20211011191245.1009682-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211011191245.1009682-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

The interrupt provider check currently checks if an interrupt provider
has #interrupt-cells, but not whether #interrupt-cells is present
outside of interrupt-providers. Rework the check to cover the latter
case.

Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/checks.c b/checks.c
index 1a39bfd2cd94..903083bfc423 100644
--- a/checks.c
+++ b/checks.c
@@ -1573,14 +1573,20 @@ static void check_interrupt_provider(struct check *c,
 				     struct node *node)
 {
 	struct property *prop;
+	bool irq_provider = node_is_interrupt_provider(node);
 
-	if (!node_is_interrupt_provider(node))
+	prop = get_property(node, "#interrupt-cells");
+	if (irq_provider && !prop) {
+		FAIL(c, dti, node,
+		     "Missing '#interrupt-cells' in interrupt provider");
 		return;
+	}
 
-	prop = get_property(node, "#interrupt-cells");
-	if (!prop)
+	if (!irq_provider && prop) {
 		FAIL(c, dti, node,
-		     "Missing #interrupt-cells in interrupt provider");
+		     "'#interrupt-cells' found, but node is not an interrupt provider");
+		return;
+	}
 }
 WARNING(interrupt_provider, check_interrupt_provider, NULL, &interrupts_extended_is_cell);
 
-- 
2.30.2

