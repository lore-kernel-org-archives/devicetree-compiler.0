From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 1/2] checks: Validate interrupt-map properties
Date: Wed, 13 May 2020 17:33:38 +0100
Message-ID: <20200513163339.29607-2-andre.przywara@arm.com>
References: <20200513163339.29607-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200513163339.29607-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

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
 checks.c                    | 86 +++++++++++++++++++++++++++++++++++++++++++++
 tests/bad-interrupt-map.dts | 21 +++++++++++
 tests/run_tests.sh          |  2 ++
 3 files changed, 109 insertions(+)
 create mode 100644 tests/bad-interrupt-map.dts

diff --git a/checks.c b/checks.c
index 4b3c486..12518db 100644
--- a/checks.c
+++ b/checks.c
@@ -924,6 +924,90 @@ static void check_pci_device_reg(struct check *c, struct dt_info *dti, struct no
 }
 WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format, &pci_bridge);
 
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
+		FAIL_PROP(c, dti, node, map, "invalid length of interrupt-map");
+		return;
+	}
+	cells = map->val.len / sizeof(cell_t);
+
+	prop = get_property(node, "#interrupt-cells");
+	if (!prop) {
+		FAIL(c, dti, node, "missing #interrupt-cells in nexus\n");
+		return;
+	}
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
+		/* Avoid the assert in get_node_by_phandle(). */
+		if (intc_phandle != 0)
+			intc = get_node_by_phandle(dti->dt, intc_phandle);
+		if (!intc) {
+			FAIL_PROP(c, dti, node, map,
+				  "invalid phandle for interrupt-map entry");
+			return;
+		}
+
+		prop = get_property(intc, "interrupt-controller");
+		if (!prop) {
+			FAIL_PROP(c,dti, node, map,
+				  "interrupt-map phandle does not point to interrupt controller");
+			return;
+		}
+
+		prop = get_property(intc, "#address-cells");
+		if (!prop) {
+			FAIL_PROP(c,dti, node, map,
+				  "interrupt-controller misses #address-cells property");
+			/*
+			 * Linux treats non-existing #address-cells in the
+			 * interrupt parent as 0, and not 2, as the spec
+			 * suggests. Deal with that, but print the warning,
+			 * since we should have an explicit #a-c = 0 in the
+			 * controller node in this case.
+			 */
+			intc_addr_cells = 0;
+		} else
+			intc_addr_cells = propval_cell(prop);
+
+		prop = get_property(intc, "#interrupt-cells");
+		if (!prop) {
+			FAIL_PROP(c,dti, node, map,
+				  "interrupt-controller misses #interrupt-cells property");
+			return;
+		}
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
+WARNING(interrupt_map, check_interrupt_map, NULL);
+
 static const struct bus_type simple_bus = {
 	.name = "simple-bus",
 };
@@ -1792,6 +1876,8 @@ static struct check *check_table[] = {
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
index eccb85d..aec92fb 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -732,6 +732,8 @@ dtc_tests () {
     check_tests "$SRCDIR/pci-bridge-bad1.dts" pci_bridge
     check_tests "$SRCDIR/pci-bridge-bad2.dts" pci_bridge
 
+    check_tests "$SRCDIR/bad-interrupt-map.dts" interrupt_map
+
     check_tests "$SRCDIR/unit-addr-simple-bus-reg-mismatch.dts" simple_bus_reg
     check_tests "$SRCDIR/unit-addr-simple-bus-compatible.dts" simple_bus_reg
 
-- 
2.14.1

