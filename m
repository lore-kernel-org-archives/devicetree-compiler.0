From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] checks: add phandle with arg property checks
Date: Mon, 14 Aug 2017 16:48:06 -0500
Message-ID: <20170814214807.338-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Many common bindings follow the same pattern of client properties
containing a phandle and N arg cells where N is defined in the provider
with a '#<specifier>-cells' property. Add a checks for properties
following this pattern.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/checks.c b/checks.c
index afabf64337d5..c0450e118043 100644
--- a/checks.c
+++ b/checks.c
@@ -956,6 +956,120 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
 WARNING(obsolete_chosen_interrupt_controller,
 	check_obsolete_chosen_interrupt_controller, NULL);
 
+struct provider {
+	const char *prop_name;
+	const char *cell_name;
+	bool optional;
+};
+
+static void check_property_phandle_args(struct check *c,
+					  struct dt_info *dti,
+				          struct node *node,
+				          struct property *prop,
+				          const struct provider *provider)
+{
+	struct marker *m = prop->val.markers;
+
+	if (!m) {
+		FAIL(c, dti, "Missing phandles in %s:%s",
+		     node->fullpath, prop->name);
+		return;
+	}
+	for_each_marker_of_type(m, REF_PHANDLE) {
+		int cellsize;
+		struct node *root = dti->dt;
+		struct node *provider_node;
+		struct property *cellprop;
+
+		provider_node = get_node_by_ref(root, m->ref);
+		if (!provider_node) {
+			FAIL(c, dti, "Could not get provider for %s:%s",
+			     node->fullpath, prop->name);
+			break;
+		}
+
+		cellprop = get_property(provider_node, provider->cell_name);
+		if (cellprop) {
+			cellsize = propval_cell(cellprop);
+		} else if (provider->optional) {
+			cellsize = 0;
+		} else {
+			FAIL(c, dti, "Missing %s in provider %s for %s",
+			     provider->cell_name,
+		     	     provider_node->fullpath,
+	     		     node->fullpath);
+			break;
+		}
+
+		if (prop->val.len < ((cellsize + 1) * sizeof(cell_t))) {
+			FAIL(c, dti, "%s property size (%d) too small for cell size %d in %s",
+			     prop->name, prop->val.len, cellsize, node->fullpath);
+		}
+	}
+}
+
+static const struct provider providers[] = {
+	{ "clocks", "#clock-cells" },
+	{ "phys", "#phy-cells" },
+	{ "interrupts-extended", "#interrupt-cells" },
+	{ "mboxes", "#mbox-cells" },
+	{ "pwms", "#pwm-cells" },
+	{ "dmas", "#dma-cells" },
+	{ "resets", "#reset-cells" },
+	{ "hwlocks", "#hwlock-cells" },
+	{ "power-domains", "#power-domain-cells" },
+	{ "io-channels", "#io-channel-cells" },
+	{ "iommus", "#iommu-cells" },
+	{ "mux-controls", "#mux-control-cells" },
+	{ "cooling-device", "#cooling-cells" },
+	{ "thermal-sensors", "#thermal-sensor-cells" },
+	{ "sound-dais", "#sound-dai-cells" },
+	{ "msi-parent", "#msi-cells", true },
+	{ NULL },
+};
+
+static void check_provider_cells_property(struct check *c,
+					  struct dt_info *dti,
+				          struct node *node)
+{
+	int i;
+
+	for (i = 0; providers[i].prop_name; i++) {
+		struct property *prop = get_property(node, providers[i].prop_name);
+		if (!prop)
+			continue;
+		check_property_phandle_args(c, dti, node, prop, &providers[i]);
+	}
+}
+WARNING(provider_cells_property, check_provider_cells_property, NULL);
+
+static void check_gpio_cells_property(struct check *c,
+					  struct dt_info *dti,
+				          struct node *node)
+{
+	struct property *prop;
+
+	for_each_property(node, prop) {
+		char *str;
+		struct provider provider;
+
+		/* Skip over false matches */
+		if (strstr(prop->name, "nr-gpio"))
+			continue;
+
+		str = strrchr(prop->name, '-');
+		if (!str || !(streq(str, "-gpio") || streq(str, "-gpios")))
+			continue;
+
+		provider.prop_name = prop->name;
+		provider.cell_name = "#gpio-cells";
+		provider.optional = false;
+		check_property_phandle_args(c, dti, node, prop, &provider);
+	}
+
+}
+WARNING(gpio_cells_property, check_gpio_cells_property, NULL);
+
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
@@ -987,6 +1101,9 @@ static struct check *check_table[] = {
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
+	&provider_cells_property,
+	&gpio_cells_property,
+
 	&always_fail,
 };
 
-- 
2.11.0
