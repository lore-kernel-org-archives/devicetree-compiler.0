From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 2/3] checks: Validate interrupt-map properties
Date: Mon, 18 May 2020 18:31:11 +0100
Message-ID: <20200518173112.24932-3-andre.przywara@arm.com>
References: <20200518173112.24932-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200518173112.24932-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The interrupt-map in an interrupt nexus is quite a tricky property: Each
entry contains five fields, the size of four of those depending on some
*-cells entries from two different nodes. This is even hard to validate
in a .dts file, especially when the associated interrupt controller is
described in a separate (included) file.

Add checks to validate those entries, by:
- Checking some basic properties of the interrupt nexus node.
- Checking that a map entry contains at least enough cells to point to
  the associated interrupt controller.
- Checking that the phandle points to an actual interrupt controller.
- Checking that there are enough entries to describe an interrupt in
  that interrupt controller's domain.

If each iteration passes and we exhaust exactly all the cells in the
interrupt-map property, the check passes.
Report errors on the way, and abort the check if that happens.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 checks.c                    | 84 +++++++++++++++++++++++++++++++++++++++++++++
 tests/bad-interrupt-map.dts | 21 ++++++++++++
 tests/run_tests.sh          |  1 +
 3 files changed, 106 insertions(+)
 create mode 100644 tests/bad-interrupt-map.dts

diff --git a/checks.c b/checks.c
index a8213c0..c712e56 100644
--- a/checks.c
+++ b/checks.c
@@ -1639,6 +1639,88 @@ static void check_interrupts_property(struct check *c,
 }
 WARNING(interrupts_property, check_interrupts_property, &phandle_references);
 
+static void check_interrupt_map(struct check *c, struct dt_info *dti,
+				struct node *node)
+{
+	struct property *map = get_property(node, "interrupt-map");
+	struct property *prop;
+	int i, cells, irq_cells;
+
+	/* We are only interested in interrupt nexus nodes. */
+	if (!map)
+		return;
+
+	if (map->val.len % sizeof(cell_t)) {
+		FAIL_PROP(c, dti, node, map,
+			  "size (%d) is invalid, expected multiple of %zu",
+			  map->val.len, sizeof(cell_t));
+		return;
+	}
+	cells = map->val.len / sizeof(cell_t);
+
+	prop = get_property(node, "#interrupt-cells");
+	assert(prop);		/* checked by interrupt_cells_is_cell */
+	irq_cells = propval_cell(prop);
+
+	for (i = 0; i < cells;) {
+		int phandle_idx = i + node_addr_cells(node) + irq_cells;
+		cell_t intc_phandle, intc_irq_cells, intc_addr_cells;
+		struct node *intc = NULL;
+
+		if (phandle_idx + 1 >= cells) {
+			FAIL_PROP(c, dti, node, map,
+				"insufficient cells for interrupt-map entry");
+			return;
+		}
+		intc_phandle = propval_cell_n(map, phandle_idx);
+		/* Give up if this is an overlay with external references */
+		if ((intc_phandle == 0 || intc_phandle == -1) &&
+		    dti->dtsflags & DTSF_PLUGIN)
+			break;
+		/* Avoid the assert in get_node_by_phandle() */
+		if (intc_phandle != 0)
+			intc = get_node_by_phandle(dti->dt, intc_phandle);
+		if (!intc) {
+			FAIL_PROP(c, dti, node, map,
+				  "invalid phandle for interrupt-map entry");
+			return;
+		}
+
+		if (!node_is_interrupt_provider(intc)) {
+			FAIL_PROP(c,dti, node, map,
+				  "interrupt-map phandle does not point to interrupt provider");
+			return;
+		}
+
+		prop = get_property(intc, "#address-cells");
+		if (!prop) {
+			/*
+			 * Linux treats non-existing #address-cells in the
+			 * interrupt parent as 0, and not 2, as the spec
+			 * suggests. Deal with that here.
+			 * We have a separate check for an explicit #a-c
+			 * in an interrupt provider that warns already.
+			 */
+			intc_addr_cells = 0;
+		} else
+			intc_addr_cells = propval_cell(prop);
+
+		prop = get_property(intc, "#interrupt-cells");
+		assert(prop);		/* checked by interrupt_cells_is_cell */
+		intc_irq_cells = propval_cell(prop);
+
+		if (phandle_idx + intc_addr_cells + intc_irq_cells >= cells) {
+			FAIL_PROP(c, dti, node, map,
+				"insufficient cells for interrupt-map entry");
+			return;
+		}
+		i = phandle_idx + 1 + intc_addr_cells + intc_irq_cells;
+	}
+}
+WARNING(interrupt_map, check_interrupt_map, NULL,
+	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
+	&interrupt_provider);
+
 static const struct bus_type graph_port_bus = {
 	.name = "graph-port",
 };
@@ -1814,6 +1896,8 @@ static struct check *check_table[] = {
 	&pci_device_reg,
 	&pci_device_bus_num,
 
+	&interrupt_map,
+
 	&simple_bus_bridge,
 	&simple_bus_reg,
 
diff --git a/tests/bad-interrupt-map.dts b/tests/bad-interrupt-map.dts
new file mode 100644
index 0000000..cf9618f
--- /dev/null
+++ b/tests/bad-interrupt-map.dts
@@ -0,0 +1,21 @@
+/dts-v1/;
+
+/ {
+	intc: interrupt-controller {
+		interrupt-controller;
+		#address-cells = <2>;
+		#interrupt-cells = <3>;
+	};
+
+	nexus-node {
+		#address-cells = <1>;
+		#interrupt-cells = <1>;
+/*
+ * The cells after the phandle are the address in the interrupt controller's
+ * domain. This here encodes 0 cells , but the actual number is 2 above.
+ */
+		interrupt-map = <0 0 &intc 1 42 4>,
+				<0 1 &intc 1 43 4>,
+				<0 2 &intc 1 44 4>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 294585b..7c149d9 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -715,6 +715,7 @@ dtc_tests () {
     run_sh_test "$SRCDIR/dtc-checkfails.sh" deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/bad-gpio.dts"
     check_tests "$SRCDIR/bad-interrupt-cells.dts" interrupts_property
     check_tests "$SRCDIR/bad-interrupt-controller.dts" interrupt_provider
+    check_tests "$SRCDIR/bad-interrupt-map.dts" interrupt_map
     run_sh_test "$SRCDIR/dtc-checkfails.sh" node_name_chars -- -I dtb -O dtb bad_node_char.dtb
     run_sh_test "$SRCDIR/dtc-checkfails.sh" node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test "$SRCDIR/dtc-checkfails.sh" property_name_chars -- -I dtb -O dtb bad_prop_char.dtb
-- 
2.14.1

