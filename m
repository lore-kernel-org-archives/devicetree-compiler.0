From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/5] checks: Add an interrupt-map check
Date: Mon, 11 Oct 2021 14:12:42 -0500
Message-ID: <20211011191245.1009682-2-robh@kernel.org>
References: <20211011191245.1009682-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211011191245.1009682-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Add a check for parsing 'interrupt-map' properties. The check primarily
tests parsing 'interrupt-map' properties which depends on and the parent
interrupt controller (or another map) node.

Note that this does not require '#address-cells' in the interrupt-map
parent, but treats missing '#address-cells' as 0 which is how the Linux
kernel parses it. There's numerous cases that expect this behavior.

Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
 - Rework '#interrupt-cells' and '#address-cells' checks to rely on
   other checks (interrupt_provider and addr_size_cells)
---
 checks.c                           | 82 ++++++++++++++++++++++++++++++
 tests/bad-interrupt-map-mask.dts   | 20 ++++++++
 tests/bad-interrupt-map-parent.dts | 17 +++++++
 tests/bad-interrupt-map.dts        | 19 +++++++
 tests/run_tests.sh                 |  3 ++
 5 files changed, 141 insertions(+)
 create mode 100644 tests/bad-interrupt-map-mask.dts
 create mode 100644 tests/bad-interrupt-map-parent.dts
 create mode 100644 tests/bad-interrupt-map.dts

diff --git a/checks.c b/checks.c
index 8153793a3e7d..a72ae4cc0be9 100644
--- a/checks.c
+++ b/checks.c
@@ -1589,6 +1589,87 @@ static void check_interrupt_provider(struct check *c,
 }
 WARNING(interrupt_provider, check_interrupt_provider, NULL, &interrupts_extended_is_cell);
 
+static void check_interrupt_map(struct check *c,
+				struct dt_info *dti,
+				struct node *node)
+{
+	struct node *root = dti->dt;
+	struct property *prop, *irq_map_prop;
+	size_t cellsize, cell, map_cells;
+
+	irq_map_prop = get_property(node, "interrupt-map");
+	if (!irq_map_prop)
+		return;
+
+	if (node->addr_cells < 0) {
+		FAIL(c, dti, node,
+		     "Missing '#address-cells' in interrupt-map provider");
+		return;
+	}
+	cellsize = node_addr_cells(node);
+	cellsize += propval_cell(get_property(node, "#interrupt-cells"));
+
+	prop = get_property(node, "interrupt-map-mask");
+	if (prop && (prop->val.len != (cellsize * sizeof(cell_t))))
+		FAIL_PROP(c, dti, node, prop,
+			  "property size (%d) is invalid, expected %zu",
+			  prop->val.len, cellsize * sizeof(cell_t));
+
+	if (!is_multiple_of(irq_map_prop->val.len, sizeof(cell_t))) {
+		FAIL_PROP(c, dti, node, irq_map_prop,
+			  "property size (%d) is invalid, expected multiple of %zu",
+			  irq_map_prop->val.len, sizeof(cell_t));
+		return;
+	}
+
+	map_cells = irq_map_prop->val.len / sizeof(cell_t);
+	for (cell = 0; cell < map_cells; ) {
+		struct node *provider_node;
+		struct property *cellprop;
+		int phandle;
+		size_t parent_cellsize;
+
+		if ((cell + cellsize) >= map_cells) {
+			FAIL_PROP(c, dti, node, irq_map_prop,
+				  "property size (%d) too small, expected > %zu",
+				  irq_map_prop->val.len, (cell + cellsize) * sizeof(cell_t));
+			break;
+		}
+
+		phandle = propval_cell_n(irq_map_prop, cell + cellsize);
+
+		if ((phandle == 0) || (phandle == -1)) {
+			FAIL_PROP(c, dti, node, irq_map_prop,
+				  "Cell %zu is not a phandle(%d)",
+				  cell + cellsize, phandle);
+			break;
+		}
+		provider_node = get_node_by_phandle(root, phandle);
+		if (!provider_node) {
+			FAIL_PROP(c, dti, node, irq_map_prop,
+				  "Could not get phandle node for (cell %zu)",
+				  cell);
+			break;
+		}
+
+		cellprop = get_property(provider_node, "#interrupt-cells");
+		if (cellprop) {
+			parent_cellsize = propval_cell(cellprop);
+		} else {
+			FAIL(c, dti, node, "Missing property '#interrupt-cells' in node %s or bad phandle (referred from interrupt-map[%zu])",
+			     provider_node->fullpath, cell);
+			break;
+		}
+
+		cellprop = get_property(provider_node, "#address-cells");
+		if (cellprop)
+			parent_cellsize += propval_cell(cellprop);
+
+		cell += cellsize + 1 + parent_cellsize;
+	}
+}
+WARNING(interrupt_map, check_interrupt_map, NULL, &phandle_references, &addr_size_cells, &interrupt_provider);
+
 static void check_interrupts_property(struct check *c,
 				      struct dt_info *dti,
 				      struct node *node)
@@ -1887,6 +1968,7 @@ static struct check *check_table[] = {
 	&gpios_property,
 	&interrupts_property,
 	&interrupt_provider,
+	&interrupt_map,
 
 	&alias_paths,
 
diff --git a/tests/bad-interrupt-map-mask.dts b/tests/bad-interrupt-map-mask.dts
new file mode 100644
index 000000000000..10eaffd62310
--- /dev/null
+++ b/tests/bad-interrupt-map-mask.dts
@@ -0,0 +1,20 @@
+/dts-v1/;
+
+/ {
+	interrupt-parent = <&intc>;
+	intc: interrupt-controller {
+		#interrupt-cells = <3>;
+		interrupt-controller;
+	};
+
+	node {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-map = <1 &intc 1 2 3>;
+		interrupt-map-mask = <0 0>;
+
+		child {
+			interrupts = <1>;
+		};
+	};
+};
diff --git a/tests/bad-interrupt-map-parent.dts b/tests/bad-interrupt-map-parent.dts
new file mode 100644
index 000000000000..fe88ce2fe76f
--- /dev/null
+++ b/tests/bad-interrupt-map-parent.dts
@@ -0,0 +1,17 @@
+/dts-v1/;
+
+/ {
+	interrupt-parent = <&intc>;
+	intc: interrupt-controller {
+	};
+
+	node {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-map = <1 &intc 1 2 3>;
+
+		child {
+			interrupts = <1>;
+		};
+	};
+};
diff --git a/tests/bad-interrupt-map.dts b/tests/bad-interrupt-map.dts
new file mode 100644
index 000000000000..6df8f93ae00c
--- /dev/null
+++ b/tests/bad-interrupt-map.dts
@@ -0,0 +1,19 @@
+/dts-v1/;
+
+/ {
+	interrupt-parent = <&intc>;
+	intc: interrupt-controller {
+		#interrupt-cells = <3>;
+		interrupt-controller;
+	};
+
+	node {
+		/* Missing #address-cells = <0>; */
+		#interrupt-cells = <1>;
+		interrupt-map = <1 &intc 1 2 3>;
+
+		child {
+			interrupts = <1>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0e270feb3e47..d100d5aaa21f 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -717,6 +717,9 @@ dtc_tests () {
     run_sh_test "$SRCDIR/dtc-checkfails.sh" -n deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/good-gpio.dts"
     check_tests "$SRCDIR/bad-interrupt-cells.dts" interrupts_property
     check_tests "$SRCDIR/bad-interrupt-controller.dts" interrupt_provider
+    check_tests "$SRCDIR/bad-interrupt-map.dts" interrupt_map
+    check_tests "$SRCDIR/bad-interrupt-map-parent.dts" interrupt_map
+    check_tests "$SRCDIR/bad-interrupt-map-mask.dts" interrupt_map
     run_sh_test "$SRCDIR/dtc-checkfails.sh" node_name_chars -- -I dtb -O dtb bad_node_char.dtb
     run_sh_test "$SRCDIR/dtc-checkfails.sh" node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test "$SRCDIR/dtc-checkfails.sh" property_name_chars -- -I dtb -O dtb bad_prop_char.dtb
-- 
2.30.2

