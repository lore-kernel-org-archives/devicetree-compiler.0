From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] checks: Drop interrupt provider '#address-cells' check
Date: Tue, 28 Sep 2021 16:23:34 -0500
Message-ID: <20210928212335.2061125-2-robh@kernel.org>
References: <20210928212335.2061125-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210928212335.2061125-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

'#address-cells' is only needed when parsing 'interrupt-map' properties, so
remove it from the common interrupt-provider test.

Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/checks.c b/checks.c
index d4e7facd7f37..2efa36377e80 100644
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
 WARNING(interrupt_provider, check_interrupt_provider, NULL);
 
-- 
2.30.2

