From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] checks: Add 'dma-ranges' check
Date: Tue,  3 Mar 2020 13:39:31 -0600
Message-ID: <20200303193931.1653-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Generalize the existing 'ranges' check to also work for 'dma-ranges'
which has the same parsing requirements.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c                 | 23 +++++++++++++----------
 tests/bad-dma-ranges.dts | 12 ++++++++++++
 tests/run_tests.sh       |  1 +
 3 files changed, 26 insertions(+), 10 deletions(-)
 create mode 100644 tests/bad-dma-ranges.dts

diff --git a/checks.c b/checks.c
index 756f0fa9203f..8acbc05961f7 100644
--- a/checks.c
+++ b/checks.c
@@ -765,13 +765,15 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 {
 	struct property *prop;
 	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
+	const char *ranges = c->data;
 
-	prop = get_property(node, "ranges");
+	prop = get_property(node, ranges);
 	if (!prop)
 		return;
 
 	if (!node->parent) {
-		FAIL_PROP(c, dti, node, prop, "Root node has a \"ranges\" property");
+		FAIL_PROP(c, dti, node, prop, "Root node has a \"%s\" property",
+			  ranges);
 		return;
 	}
 
@@ -783,23 +785,24 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 
 	if (prop->val.len == 0) {
 		if (p_addr_cells != c_addr_cells)
-			FAIL_PROP(c, dti, node, prop, "empty \"ranges\" property but its "
+			FAIL_PROP(c, dti, node, prop, "empty \"%s\" property but its "
 				  "#address-cells (%d) differs from %s (%d)",
-				  c_addr_cells, node->parent->fullpath,
+				  ranges, c_addr_cells, node->parent->fullpath,
 				  p_addr_cells);
 		if (p_size_cells != c_size_cells)
-			FAIL_PROP(c, dti, node, prop, "empty \"ranges\" property but its "
+			FAIL_PROP(c, dti, node, prop, "empty \"%s\" property but its "
 				  "#size-cells (%d) differs from %s (%d)",
-				  c_size_cells, node->parent->fullpath,
+				  ranges, c_size_cells, node->parent->fullpath,
 				  p_size_cells);
 	} else if ((prop->val.len % entrylen) != 0) {
-		FAIL_PROP(c, dti, node, prop, "\"ranges\" property has invalid length (%d bytes) "
+		FAIL_PROP(c, dti, node, prop, "\"%s\" property has invalid length (%d bytes) "
 			  "(parent #address-cells == %d, child #address-cells == %d, "
-			  "#size-cells == %d)", prop->val.len,
+			  "#size-cells == %d)", ranges, prop->val.len,
 			  p_addr_cells, c_addr_cells, c_size_cells);
 	}
 }
-WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
+WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
+WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size_cells);
 
 static const struct bus_type pci_bus = {
 	.name = "PCI",
@@ -1780,7 +1783,7 @@ static struct check *check_table[] = {
 	&property_name_chars_strict,
 	&node_name_chars_strict,
 
-	&addr_size_cells, &reg_format, &ranges_format,
+	&addr_size_cells, &reg_format, &ranges_format, &dma_ranges_format,
 
 	&unit_address_vs_reg,
 	&unit_address_format,
diff --git a/tests/bad-dma-ranges.dts b/tests/bad-dma-ranges.dts
new file mode 100644
index 000000000000..fbe7ab82cb91
--- /dev/null
+++ b/tests/bad-dma-ranges.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	node {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		dma-ranges = <0 0 0 0 0>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e37ae5934b46..ac0ffc2e3f93 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -664,6 +664,7 @@ dtc_tests () {
     check_tests "$SRCDIR/bad-reg-ranges.dts" reg_format ranges_format
     check_tests "$SRCDIR/bad-empty-ranges.dts" ranges_format
     check_tests "$SRCDIR/reg-ranges-root.dts" reg_format ranges_format
+    check_tests "$SRCDIR/bad-dma-ranges.dts" dma_ranges_format
     check_tests "$SRCDIR/default-addr-size.dts" avoid_default_addr_size
     check_tests "$SRCDIR/obsolete-chosen-interrupt-controller.dts" obsolete_chosen_interrupt_controller
     check_tests "$SRCDIR/reg-without-unit-addr.dts" unit_address_vs_reg
-- 
2.20.1

