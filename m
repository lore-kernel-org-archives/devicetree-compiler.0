From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 4/6] checks: check for #{size,address}-cells without child nodes
Date: Tue, 12 Dec 2017 16:46:27 -0600
Message-ID: <20171212224629.28738-4-robh@kernel.org>
References: <20171212224629.28738-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212224629.28738-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add a check for unnecessary "#{size,address}-cells" when there's neither
a 'ranges' property nor child nodes with a 'reg' property.

An exception may be an overlay that adds nodes, but this case would need
"#{size,address}-cells" in the overlay to properly compile already.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- fix commit msg

 checks.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/checks.c b/checks.c
index e4f5cb9fd317..e0ec67be1b7a 100644
--- a/checks.c
+++ b/checks.c
@@ -981,6 +981,31 @@ static void check_avoid_default_addr_size(struct check *c, struct dt_info *dti,
 WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
 	&addr_size_cells);
 
+static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *dti,
+					      struct node *node)
+{
+	struct property *prop;
+	struct node *child;
+	bool has_reg = false;
+
+	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
+		return;
+
+	if (get_property(node, "ranges") || !node->children)
+		return;
+
+	for_each_child(node, child) {
+		prop = get_property(child, "reg");
+		if (prop)
+			has_reg = true;
+	}
+
+	if (!has_reg)
+		FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
+		     node->fullpath);
+}
+WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, NULL, &avoid_default_addr_size);
+
 static void check_obsolete_chosen_interrupt_controller(struct check *c,
 						       struct dt_info *dti,
 						       struct node *node)
@@ -1305,6 +1330,7 @@ static struct check *check_table[] = {
 	&simple_bus_reg,
 
 	&avoid_default_addr_size,
+	&avoid_unnecessary_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
 	&clocks_property,
-- 
2.14.1
