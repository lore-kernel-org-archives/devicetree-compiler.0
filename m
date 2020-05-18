From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH v2 3/3] checks: interrupt-map: Dump entries on error
Date: Mon, 18 May 2020 18:31:12 +0100
Message-ID: <20200518173112.24932-4-andre.przywara@arm.com>
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

While the interrupt-map property is now validated, the current error
messages will probably leave people scratching their head on what the
actual problem is.

To help with the diagnosis, dump the map property formatted in a way
that corresponds to the actual interpretation from an IRQ consumer's
point of view. While this can't pinpoint the actual problem, it's much
easier to see what went wrong, especially when comparing it to the .dts
source.

As this will generate one line per mapped interrupt, it can be
potentially long on those larger maps.
A report would look like this:
Warning (interrupt_map): /soc/pci@1c00000:interrupt-map: invalid phandle for interrupt-map entry
        < <0x0 0x0 0x0>, <0x1>, <&gic@17a00000>, <0x0>, <0x87 0x4 0x0> >,
        < <0x0 0x0 0x2>, <0x1>, <&invalid>, >

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 checks.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/checks.c b/checks.c
index c712e56..ebc0f33 100644
--- a/checks.c
+++ b/checks.c
@@ -1639,6 +1639,80 @@ static void check_interrupts_property(struct check *c,
 }
 WARNING(interrupts_property, check_interrupts_property, &phandle_references);
 
+static void dump_cell_group(struct property *prop, int index, int cells,
+			    int nr_cells)
+{
+	int limit, i;
+
+	if (index + cells > nr_cells)
+		limit = nr_cells - index;
+	else
+		limit = cells;
+
+	fputs("<", stderr);
+	for (i = 0; i < limit; i++) {
+		cell_t v = propval_cell_n(prop, index + i);
+		fprintf(stderr, "%s0x%x", i == 0 ? "" : " ", v);
+	}
+	if (limit < cells)
+		fputs(", MISSING", stderr);
+	fputs(">", stderr);
+}
+
+static void dump_interrupt_map(struct node *root, struct node *nexus,
+			       struct property *map, int irq_cells)
+{
+	int cells = map->val.len / 4;
+	struct property *prop;
+	int value;
+	int i;
+
+	for (i = 0; i < cells;) {
+		struct node *intc = NULL;
+
+		fprintf(stderr, "%s\t< ", i == 0 ? "" : ",\n");
+		dump_cell_group(map, i, node_addr_cells(nexus), cells);
+		fputs(", ", stderr);
+		dump_cell_group(map, i + node_addr_cells(nexus), irq_cells, cells);
+		fputs(", <&", stderr);
+		i += node_addr_cells(nexus) + irq_cells;
+		if (i >= cells)
+			break;
+		value = propval_cell_n(map, i);
+		if (value != 0)
+			intc = get_node_by_phandle(root, value);
+		fprintf(stderr, "%s>, ",
+			intc && intc->name ? intc->name : "invalid");
+		if (!intc) {
+			fprintf(stderr, ">\n");
+			return;
+		}
+		/*
+		 * Linux treats non-existing #address-cells in the interrupt
+		 * parent as 0 (and not 2, as the spec says).
+		 * Deal with that, since many DTs rely on that.
+		 */
+		prop = get_property(intc, "#address-cells");
+		if (prop)
+			value = propval_cell(prop);
+		else
+			value = 0;
+		dump_cell_group(map, i + 1, value, cells);
+		fputs(", ", stderr);
+		i += 1 + value;
+
+		prop = get_property(intc, "#interrupt-cells");
+		if (prop) {
+			value = propval_cell(prop);
+			dump_cell_group(map, i, value, cells);
+		} else
+			fputs("<?>", stderr);
+		fputs(" >", stderr);
+		i += value;
+	}
+	fputs("\n", stderr);
+}
+
 static void check_interrupt_map(struct check *c, struct dt_info *dti,
 				struct node *node)
 {
@@ -1670,6 +1744,7 @@ static void check_interrupt_map(struct check *c, struct dt_info *dti,
 		if (phandle_idx + 1 >= cells) {
 			FAIL_PROP(c, dti, node, map,
 				"insufficient cells for interrupt-map entry");
+			dump_interrupt_map(dti->dt, node, map, irq_cells);
 			return;
 		}
 		intc_phandle = propval_cell_n(map, phandle_idx);
@@ -1683,12 +1758,14 @@ static void check_interrupt_map(struct check *c, struct dt_info *dti,
 		if (!intc) {
 			FAIL_PROP(c, dti, node, map,
 				  "invalid phandle for interrupt-map entry");
+			dump_interrupt_map(dti->dt, node, map, irq_cells);
 			return;
 		}
 
 		if (!node_is_interrupt_provider(intc)) {
 			FAIL_PROP(c,dti, node, map,
 				  "interrupt-map phandle does not point to interrupt provider");
+			dump_interrupt_map(dti->dt, node, map, irq_cells);
 			return;
 		}
 
@@ -1712,6 +1789,7 @@ static void check_interrupt_map(struct check *c, struct dt_info *dti,
 		if (phandle_idx + intc_addr_cells + intc_irq_cells >= cells) {
 			FAIL_PROP(c, dti, node, map,
 				"insufficient cells for interrupt-map entry");
+			dump_interrupt_map(dti->dt, node, map, irq_cells);
 			return;
 		}
 		i = phandle_idx + 1 + intc_addr_cells + intc_irq_cells;
-- 
2.14.1

