From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 1/3] checks: Add interrupt provider test
Date: Tue,  2 Jun 2020 12:04:17 +0100
Message-ID: <20200602110419.22488-2-andre.przywara@arm.com>
References: <20200602110419.22488-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200602110419.22488-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

An interrupt provider (an actual interrupt-controller node or an
interrupt nexus) should have both #address-cells and #interrupt-cells
properties explicitly defined.

Add an extra test for this. We check for the #interrupt-cells property
already, but this does not cover every controller so far, only those that
get referenced by an interrupts property in some node. Also we miss
interrupt nexus nodes.

A missing #address-cells property is less critical, but creates
ambiguities when used in interrupt-map properties, so warn about this as
well now.
This removes the now redundant warning in the existing interrupts test.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 checks.c                           | 32 ++++++++++++++++++++++++++------
 tests/bad-interrupt-controller.dts |  7 +++++++
 tests/run_tests.sh                 |  1 +
 3 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 tests/bad-interrupt-controller.dts

diff --git a/checks.c b/checks.c
index 4b3c486..23faca5 100644
--- a/checks.c
+++ b/checks.c
@@ -1547,6 +1547,28 @@ static bool node_is_interrupt_provider(struct node *node)
 
 	return false;
 }
+
+static void check_interrupt_provider(struct check *c,
+				     struct dt_info *dti,
+				     struct node *node)
+{
+	struct property *prop;
+
+	if (!node_is_interrupt_provider(node))
+		return;
+
+	prop = get_property(node, "#interrupt-cells");
+	if (!prop)
+		FAIL(c, dti, node,
+		     "Missing #interrupt-cells in interrupt provider");
+
+	prop = get_property(node, "#address-cells");
+	if (!prop)
+		FAIL(c, dti, node,
+		     "Missing #address-cells in interrupt provider");
+}
+WARNING(interrupt_provider, check_interrupt_provider, NULL);
+
 static void check_interrupts_property(struct check *c,
 				      struct dt_info *dti,
 				      struct node *node)
@@ -1602,12 +1624,8 @@ static void check_interrupts_property(struct check *c,
 		return;
 	}
 
+	/* Validity already verified by another test. */
 	prop = get_property(irq_node, "#interrupt-cells");
-	if (!prop) {
-		FAIL(c, dti, irq_node, "Missing #interrupt-cells in interrupt-parent");
-		return;
-	}
-
 	irq_cells = propval_cell(prop);
 	if (irq_prop->val.len % (irq_cells * sizeof(cell_t))) {
 		FAIL_PROP(c, dti, node, prop,
@@ -1615,7 +1633,8 @@ static void check_interrupts_property(struct check *c,
 			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
 	}
 }
-WARNING(interrupts_property, check_interrupts_property, &phandle_references);
+WARNING(interrupts_property, check_interrupts_property, &phandle_references,
+	&interrupt_cells_is_cell, &interrupt_provider);
 
 static const struct bus_type graph_port_bus = {
 	.name = "graph-port",
@@ -1828,6 +1847,7 @@ static struct check *check_table[] = {
 	&deprecated_gpio_property,
 	&gpios_property,
 	&interrupts_property,
+	&interrupt_provider,
 
 	&alias_paths,
 
diff --git a/tests/bad-interrupt-controller.dts b/tests/bad-interrupt-controller.dts
new file mode 100644
index 0000000..62fa118
--- /dev/null
+++ b/tests/bad-interrupt-controller.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+
+/ {
+	intc: interrupt-controller {
+		interrupt-controller;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index eccb85d..294585b 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -714,6 +714,7 @@ dtc_tests () {
     check_tests "$SRCDIR/bad-graph.dts" graph_endpoint
     run_sh_test "$SRCDIR/dtc-checkfails.sh" deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/bad-gpio.dts"
     check_tests "$SRCDIR/bad-interrupt-cells.dts" interrupts_property
+    check_tests "$SRCDIR/bad-interrupt-controller.dts" interrupt_provider
     run_sh_test "$SRCDIR/dtc-checkfails.sh" node_name_chars -- -I dtb -O dtb bad_node_char.dtb
     run_sh_test "$SRCDIR/dtc-checkfails.sh" node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test "$SRCDIR/dtc-checkfails.sh" property_name_chars -- -I dtb -O dtb bad_prop_char.dtb
-- 
2.14.1

