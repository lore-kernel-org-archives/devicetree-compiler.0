From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] checks: Relax SPI slave checks
Date: Mon, 28 Sep 2020 15:19:42 -0500
Message-ID: <20200928201942.3242124-2-robh@kernel.org>
References: <20200928201942.3242124-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200928201942.3242124-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

SPI slaves only have a single child node and therefore don't need
'#address-cells' nor '#size-cells', so let's skip the check for those when
'spi-slave' is present.

Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/checks.c b/checks.c
index 17cb6890d45a..c923295c6e40 100644
--- a/checks.c
+++ b/checks.c
@@ -1102,13 +1102,12 @@ static void check_spi_bus_bridge(struct check *c, struct dt_info *dti, struct no
 	if (node->bus != &spi_bus || !node->children)
 		return;
 
-	if (get_property(node, "spi-slave"))
-		spi_addr_cells = 0;
-	if (node_addr_cells(node) != spi_addr_cells)
-		FAIL(c, dti, node, "incorrect #address-cells for SPI bus");
-	if (node_size_cells(node) != 0)
-		FAIL(c, dti, node, "incorrect #size-cells for SPI bus");
-
+	if (!get_property(node, "spi-slave")) {
+		if (node_addr_cells(node) != spi_addr_cells)
+			FAIL(c, dti, node, "incorrect #address-cells for SPI bus");
+		if (node_size_cells(node) != 0)
+			FAIL(c, dti, node, "incorrect #size-cells for SPI bus");
+	}
 }
 WARNING(spi_bus_bridge, check_spi_bus_bridge, NULL, &addr_size_cells);
 
-- 
2.25.1

