From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3] checks: add graph binding checks
Date: Tue, 13 Feb 2018 17:00:59 -0600
Message-ID: <20180213230059.455-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add checks for DT graph bindings. These checks check node names,
unit-addresses and link connections on ports, port, and endpoint nodes.

The graph nodes are matched by finding nodes named 'endpoint' or with a
'remote-endpoint' property. We can't match on 'ports' or 'port' nodes
because those names are used for non-graph nodes. While the graph nodes
aren't really buses, using the bus pointer to tag matched nodes is
convenient.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v3:
- Rebase on top of recent failure messages rework.
- Fix bug in matching logic for setting graph node bus.
- Don't throw error for a single child with non-zero unit-address. Ports 
can be optional and we may not have a 0 port.

v2:
- add test case
- fix unused variable error

 checks.c            | 148 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/bad-graph.dts |  24 +++++++++
 tests/run_tests.sh  |   3 ++
 3 files changed, 175 insertions(+)
 create mode 100644 tests/bad-graph.dts

diff --git a/checks.c b/checks.c
index 4659f55764f0..b6c8b5c08fab 100644
--- a/checks.c
+++ b/checks.c
@@ -1385,6 +1385,152 @@ static void check_interrupts_property(struct check *c,
 }
 WARNING(interrupts_property, check_interrupts_property, &phandle_references);
 
+static const struct bus_type graph_port_bus = {
+	.name = "graph-port",
+};
+
+static const struct bus_type graph_ports_bus = {
+	.name = "graph-ports",
+};
+
+static void check_graph_nodes(struct check *c, struct dt_info *dti,
+			      struct node *node)
+{
+	struct node *child;
+
+	for_each_child(node, child) {
+		if (!(strprefixeq(child->name, child->basenamelen, "endpoint") ||
+		      get_property(child, "remote-endpoint")))
+			continue;
+
+		node->bus = &graph_port_bus;
+
+		/* The parent of 'port' nodes can be either 'ports' or a device */
+		if (!node->parent->bus &&
+		    (streq(node->parent->name, "ports") || get_property(node, "reg")))
+			node->parent->bus = &graph_ports_bus;
+
+		break;
+	}
+
+}
+WARNING(graph_nodes, check_graph_nodes, NULL);
+
+static void check_graph_child_address(struct check *c, struct dt_info *dti,
+				      struct node *node)
+{
+	int cnt = 0;
+	struct node *child;
+
+	if (node->bus != &graph_ports_bus && node->bus != &graph_port_bus)
+		return;
+
+	for_each_child(node, child) {
+		struct property *prop = get_property(child, "reg");
+
+		/* No error if we have any non-zero unit address */
+		if (prop && propval_cell(prop) != 0)
+			return;
+
+		cnt++;
+	}
+
+	if (cnt == 1 && node->addr_cells != -1)
+		FAIL(c, dti, node, "graph node has single child node '%s', #address-cells/#size-cells are not necessary",
+		     node->children->name);
+}
+WARNING(graph_child_address, check_graph_child_address, NULL, &graph_nodes);
+
+static void check_graph_reg(struct check *c, struct dt_info *dti,
+			    struct node *node)
+{
+	char unit_addr[9];
+	const char *unitname = get_unitname(node);
+	struct property *prop;
+
+	prop = get_property(node, "reg");
+	if (!prop || !unitname)
+		return;
+
+	if (!(prop->val.val && prop->val.len == sizeof(cell_t))) {
+		FAIL(c, dti, node, "graph node malformed 'reg' property");
+		return;
+	}
+
+	snprintf(unit_addr, sizeof(unit_addr), "%x", propval_cell(prop));
+	if (!streq(unitname, unit_addr))
+		FAIL(c, dti, node, "graph node unit address error, expected \"%s\"",
+		     unit_addr);
+
+	if (node->parent->addr_cells != 1)
+		FAIL_PROP(c, dti, node, get_property(node, "#address-cells"),
+			  "graph node '#address-cells' is %d, must be 1",
+			  node->parent->addr_cells);
+	if (node->parent->size_cells != 0)
+		FAIL_PROP(c, dti, node, get_property(node, "#size-cells"),
+			  "graph node '#size-cells' is %d, must be 0",
+			  node->parent->size_cells);
+}
+
+static void check_graph_port(struct check *c, struct dt_info *dti,
+			     struct node *node)
+{
+	if (node->bus != &graph_port_bus)
+		return;
+
+	if (!strprefixeq(node->name, node->basenamelen, "port"))
+		FAIL(c, dti, node, "graph port node name should be 'port'");
+
+	check_graph_reg(c, dti, node);
+}
+WARNING(graph_port, check_graph_port, NULL, &graph_nodes);
+
+static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
+					struct node *endpoint)
+{
+	int phandle;
+	struct node *node;
+	struct property *prop;
+
+	prop = get_property(endpoint, "remote-endpoint");
+	if (!prop)
+		return NULL;
+
+	phandle = propval_cell(prop);
+	/* Give up if this is an overlay with external references */
+	if (phandle == 0 || phandle == -1)
+		return NULL;
+
+	node = get_node_by_phandle(dti->dt, phandle);
+	if (!node)
+		FAIL_PROP(c, dti, endpoint, prop, "graph phandle is not valid");
+
+	return node;
+}
+
+static void check_graph_endpoint(struct check *c, struct dt_info *dti,
+				 struct node *node)
+{
+	struct node *remote_node;
+
+	if (!node->parent || node->parent->bus != &graph_port_bus)
+		return;
+
+	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
+		FAIL(c, dti, node, "graph endpont node name should be 'endpoint'");
+
+	check_graph_reg(c, dti, node);
+
+	remote_node = get_remote_endpoint(c, dti, node);
+	if (!remote_node)
+		return;
+
+	if (get_remote_endpoint(c, dti, remote_node) != node)
+		FAIL(c, dti, node, "graph connection to node '%s' is not bidirectional",
+		     remote_node->fullpath);
+}
+WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
+
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
@@ -1444,6 +1590,8 @@ static struct check *check_table[] = {
 
 	&alias_paths,
 
+	&graph_nodes, &graph_child_address, &graph_port, &graph_endpoint,
+
 	&always_fail,
 };
 
diff --git a/tests/bad-graph.dts b/tests/bad-graph.dts
new file mode 100644
index 000000000000..522da0edbbc8
--- /dev/null
+++ b/tests/bad-graph.dts
@@ -0,0 +1,24 @@
+/dts-v1/;
+
+/ {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		bad_endpoint: port-a@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			endpoint@d0 {
+				reg = <0>;
+				remote-endpoint = <0xdeadbeef>;
+			};
+
+		};
+
+		port@1 {
+			reg = <0>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0d30edfc0bc4..3c758b016c2c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -573,6 +573,9 @@ dtc_tests () {
     check_tests unit-addr-leading-0s.dts unit_address_format
     check_tests bad-phandle-cells.dts interrupts_extended_property
     check_tests bad-gpio.dts gpios_property
+    check_tests bad-graph.dts graph_child_address
+    check_tests bad-graph.dts graph_port
+    check_tests bad-graph.dts graph_endpoint
     run_sh_test dtc-checkfails.sh deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb bad-gpio.dts
     check_tests bad-interrupt-cells.dts interrupts_property
     run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_node_char.dtb
-- 
2.14.1
