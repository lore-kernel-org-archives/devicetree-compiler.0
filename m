From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/5] checks: Make interrupt_provider check dependent on interrupts_extended_is_cell
Date: Mon, 11 Oct 2021 14:12:41 -0500
Message-ID: <20211011191245.1009682-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

If '#interrupt-cells' doesn't pass checks, no reason to run interrupt
provider check.

Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index fb3fc9cda4b1..8153793a3e7d 100644
--- a/checks.c
+++ b/checks.c
@@ -1587,7 +1587,7 @@ static void check_interrupt_provider(struct check *c,
 		FAIL(c, dti, node,
 		     "Missing #address-cells in interrupt provider");
 }
-WARNING(interrupt_provider, check_interrupt_provider, NULL);
+WARNING(interrupt_provider, check_interrupt_provider, NULL, &interrupts_extended_is_cell);
 
 static void check_interrupts_property(struct check *c,
 				      struct dt_info *dti,
-- 
2.30.2

