From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] checks: add graph binding checks
Date: Tue, 12 Dec 2017 09:59:00 -0600
Message-ID: <20171212155900.32311-1-robh@kernel.org>
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
 checks.c | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/checks.c b/checks.c
index 6d8101e721f8..583a98ff4146 100644
--- a/checks.c
+++ b/checks.c
@@ -1377,6 +1377,145 @@ static void check_interrupts_property(struct check *c,
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
+	}
+
+	/* The parent of 'port' nodes can be either 'ports' or a device */
+	if (node->bus && !node->parent->bus &&
+	    (streq(node->parent->name, "ports") || get_property(node, "reg")))
+		node->parent->bus = &graph_ports_bus;
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
+	for_each_child(node, child)
+		cnt++;
+
+	if (cnt == 1 && node->addr_cells != -1)
+		FAIL(c, dti, "graph node '%s' has single child node, unit address is not necessary",
+		     node->fullpath);
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
+		FAIL(c, dti, "graph node '%s' malformed 'reg' property", node->fullpath);
+		return;
+	}
+
+	snprintf(unit_addr, sizeof(unit_addr), "%x", propval_cell(prop));
+	if (!streq(unitname, unit_addr))
+		FAIL(c, dti, "graph node '%s' unit address error, expected \"%s\"",
+		     node->fullpath, unit_addr);
+
+	if (node->parent->addr_cells != 1)
+		FAIL(c, dti, "'#address-cells' is %d, must be 1 in graph node '%s'",
+		     node->parent->addr_cells, node->fullpath);
+	if (node->parent->size_cells != 0)
+		FAIL(c, dti, "'#size-cells' is %d, must be 0 in graph node '%s'",
+		     node->parent->size_cells, node->fullpath);
+}
+
+static void check_graph_port(struct check *c, struct dt_info *dti,
+			     struct node *node)
+{
+	struct property *prop;
+
+	if (node->bus != &graph_port_bus)
+		return;
+
+	if (!strprefixeq(node->name, node->basenamelen, "port"))
+		FAIL(c, dti, "graph port node '%s' name should be 'port'",
+		     node->fullpath);
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
+		FAIL(c, dti, "graph endpoint node '%s' 'remote-endpoint' phandle is not valid",
+		     endpoint->fullpath);
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
+		FAIL(c, dti, "graph endpont node '%s' name should be 'endpoint'",
+		     node->fullpath);
+
+	check_graph_reg(c, dti, node);
+
+	remote_node = get_remote_endpoint(c, dti, node);
+	if (!remote_node)
+		return;
+
+	if (get_remote_endpoint(c, dti, remote_node) != node)
+		FAIL(c, dti, "graph endpoint node '%s' connection to '%s' is not bidirectional",
+		     node->fullpath, remote_node->fullpath);
+}
+WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
+
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
@@ -1433,6 +1572,8 @@ static struct check *check_table[] = {
 	&gpios_property,
 	&interrupts_property,
 
+	&graph_nodes, &graph_child_address, &graph_port, &graph_endpoint,
+
 	&chosen_node,
 	&known_aliases,	&alias_paths,
 
-- 
2.14.1
