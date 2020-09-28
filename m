From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] checks: Allow PCI bridge child nodes without an address
Date: Mon, 28 Sep 2020 15:19:41 -0500
Message-ID: <20200928201942.3242124-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Some PCI bridge nodes have child nodes such as an interrupt controller
which are not PCI devices. Allow these nodes which don't have a
unit-address.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/checks.c b/checks.c
index b7955dbd71ca..17cb6890d45a 100644
--- a/checks.c
+++ b/checks.c
@@ -891,10 +891,8 @@ static void check_pci_device_reg(struct check *c, struct dt_info *dti, struct no
 		return;
 
 	prop = get_property(node, "reg");
-	if (!prop) {
-		FAIL(c, dti, node, "missing PCI reg property");
+	if (!prop)
 		return;
-	}
 
 	cells = (cell_t *)prop->val.val;
 	if (cells[1] || cells[2])
-- 
2.25.1

