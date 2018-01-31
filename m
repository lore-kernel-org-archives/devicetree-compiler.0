From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] checks: centralize printing of node path in check_msg
Date: Wed, 31 Jan 2018 08:57:03 -0600
Message-ID: <20180131145705.21335-2-robh@kernel.org>
References: <20180131145705.21335-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180131145705.21335-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Most error/warning messages print the node path as part of their error
message. Move printing of the node path into check_msg() so the
formatting can be standardized to the form:

<output file>: (ERROR|warning) (<check name>): <full node name>: <check message>

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 232 ++++++++++++++++++++++++++++-----------------------------------
 1 file changed, 104 insertions(+), 128 deletions(-)

diff --git a/checks.c b/checks.c
index 1cded3658491..54df014c1c79 100644
--- a/checks.c
+++ b/checks.c
@@ -72,7 +72,8 @@ struct check {
 #define CHECK(nm_, fn_, d_, ...) \
 	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
 
-static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_info *dti,
+static inline void  PRINTF(4, 5) check_msg(struct check *c, struct dt_info *dti,
+					   struct node *node,
 					   const char *fmt, ...)
 {
 	va_list ap;
@@ -83,17 +84,19 @@ static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_info *dti,
 		fprintf(stderr, "%s: %s (%s): ",
 			strcmp(dti->outname, "-") ? dti->outname : "<stdout>",
 			(c->error) ? "ERROR" : "Warning", c->name);
+		if (node)
+			fprintf(stderr, "%s: ", node->fullpath);
 		vfprintf(stderr, fmt, ap);
 		fprintf(stderr, "\n");
 	}
 	va_end(ap);
 }
 
-#define FAIL(c, dti, ...)						\
+#define FAIL(c, dti, node, ...)						\
 	do {								\
 		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
 		(c)->status = FAILED;					\
-		check_msg((c), dti, __VA_ARGS__);			\
+		check_msg((c), dti, node, __VA_ARGS__);			\
 	} while (0)
 
 static void check_nodes_props(struct check *c, struct dt_info *dti, struct node *node)
@@ -126,7 +129,7 @@ static bool run_check(struct check *c, struct dt_info *dti)
 		error = error || run_check(prq, dti);
 		if (prq->status != PASSED) {
 			c->status = PREREQ;
-			check_msg(c, dti, "Failed prerequisite '%s'",
+			check_msg(c, dti, NULL, "Failed prerequisite '%s'",
 				  c->prereq[i]->name);
 		}
 	}
@@ -156,7 +159,7 @@ out:
 static inline void check_always_fail(struct check *c, struct dt_info *dti,
 				     struct node *node)
 {
-	FAIL(c, dti, "always_fail check");
+	FAIL(c, dti, node, "always_fail check");
 }
 CHECK(always_fail, check_always_fail, NULL);
 
@@ -171,8 +174,7 @@ static void check_is_string(struct check *c, struct dt_info *dti,
 		return; /* Not present, assumed ok */
 
 	if (!data_is_one_string(prop->val))
-		FAIL(c, dti, "\"%s\" property in %s is not a string",
-		     propname, node->fullpath);
+		FAIL(c, dti, node, "\"%s\" property is not a string", propname);
 }
 #define WARNING_IF_NOT_STRING(nm, propname) \
 	WARNING(nm, check_is_string, (propname))
@@ -196,8 +198,8 @@ static void check_is_string_list(struct check *c, struct dt_info *dti,
 	while (rem > 0) {
 		l = strnlen(str, rem);
 		if (l == rem) {
-			FAIL(c, dti, "\"%s\" property in %s is not a string list",
-			     propname, node->fullpath);
+			FAIL(c, dti, node, "\"%s\" property is not a string list",
+			     propname);
 			break;
 		}
 		rem -= l + 1;
@@ -220,8 +222,8 @@ static void check_is_cell(struct check *c, struct dt_info *dti,
 		return; /* Not present, assumed ok */
 
 	if (prop->val.len != sizeof(cell_t))
-		FAIL(c, dti, "\"%s\" property in %s is not a single cell",
-		     propname, node->fullpath);
+		FAIL(c, dti, node, "\"%s\" property is not a single cell",
+		     propname);
 }
 #define WARNING_IF_NOT_CELL(nm, propname) \
 	WARNING(nm, check_is_cell, (propname))
@@ -242,8 +244,7 @@ static void check_duplicate_node_names(struct check *c, struct dt_info *dti,
 		     child2;
 		     child2 = child2->next_sibling)
 			if (streq(child->name, child2->name))
-				FAIL(c, dti, "Duplicate node name %s",
-				     child->fullpath);
+				FAIL(c, dti, node, "Duplicate node name");
 }
 ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
 
@@ -257,8 +258,8 @@ static void check_duplicate_property_names(struct check *c, struct dt_info *dti,
 			if (prop2->deleted)
 				continue;
 			if (streq(prop->name, prop2->name))
-				FAIL(c, dti, "Duplicate property name %s in %s",
-				     prop->name, node->fullpath);
+				FAIL(c, dti, node, "Duplicate property name %s",
+				     prop->name);
 		}
 	}
 }
@@ -276,8 +277,8 @@ static void check_node_name_chars(struct check *c, struct dt_info *dti,
 	int n = strspn(node->name, c->data);
 
 	if (n < strlen(node->name))
-		FAIL(c, dti, "Bad character '%c' in node %s",
-		     node->name[n], node->fullpath);
+		FAIL(c, dti, node, "Bad character '%c' in node name",
+		     node->name[n]);
 }
 ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
 
@@ -287,8 +288,8 @@ static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
 	int n = strspn(node->name, c->data);
 
 	if (n < node->basenamelen)
-		FAIL(c, dti, "Character '%c' not recommended in node %s",
-		     node->name[n], node->fullpath);
+		FAIL(c, dti, node, "Character '%c' not recommended in node name",
+		     node->name[n]);
 }
 CHECK(node_name_chars_strict, check_node_name_chars_strict, PROPNODECHARSSTRICT);
 
@@ -296,8 +297,7 @@ static void check_node_name_format(struct check *c, struct dt_info *dti,
 				   struct node *node)
 {
 	if (strchr(get_unitname(node), '@'))
-		FAIL(c, dti, "Node %s has multiple '@' characters in name",
-		     node->fullpath);
+		FAIL(c, dti, node, "multiple '@' characters in node name");
 }
 ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
 
@@ -315,12 +315,10 @@ static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
 
 	if (prop) {
 		if (!unitname[0])
-			FAIL(c, dti, "Node %s has a reg or ranges property, but no unit name",
-			    node->fullpath);
+			FAIL(c, dti, node, "node has a reg or ranges property, but no unit name");
 	} else {
 		if (unitname[0])
-			FAIL(c, dti, "Node %s has a unit name, but no reg property",
-			    node->fullpath);
+			FAIL(c, dti, node, "node has a unit name, but no reg property");
 	}
 }
 WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
@@ -334,8 +332,8 @@ static void check_property_name_chars(struct check *c, struct dt_info *dti,
 		int n = strspn(prop->name, c->data);
 
 		if (n < strlen(prop->name))
-			FAIL(c, dti, "Bad character '%c' in property name \"%s\", node %s",
-			     prop->name[n], prop->name, node->fullpath);
+			FAIL(c, dti, node, "Bad character '%c' in property name \"%s\"",
+			     prop->name[n], prop->name);
 	}
 }
 ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
@@ -366,8 +364,8 @@ static void check_property_name_chars_strict(struct check *c,
 			n = strspn(name, c->data);
 		}
 		if (n < strlen(name))
-			FAIL(c, dti, "Character '%c' not recommended in property name \"%s\", node %s",
-			     name[n], prop->name, node->fullpath);
+			FAIL(c, dti, node, "Character '%c' not recommended in property name \"%s\"",
+			     name[n], prop->name);
 	}
 }
 CHECK(property_name_chars_strict, check_property_name_chars_strict, PROPNODECHARSSTRICT);
@@ -400,7 +398,7 @@ static void check_duplicate_label(struct check *c, struct dt_info *dti,
 		return;
 
 	if ((othernode != node) || (otherprop != prop) || (othermark != mark))
-		FAIL(c, dti, "Duplicate label '%s' on " DESCLABEL_FMT
+		FAIL(c, dti, node, "Duplicate label '%s' on " DESCLABEL_FMT
 		     " and " DESCLABEL_FMT,
 		     label, DESCLABEL_ARGS(node, prop, mark),
 		     DESCLABEL_ARGS(othernode, otherprop, othermark));
@@ -440,8 +438,8 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 		return 0;
 
 	if (prop->val.len != sizeof(cell_t)) {
-		FAIL(c, dti, "%s has bad length (%d) %s property",
-		     node->fullpath, prop->val.len, prop->name);
+		FAIL(c, dti, node, "bad length (%d) %s property",
+		     prop->val.len, prop->name);
 		return 0;
 	}
 
@@ -452,8 +450,8 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 			/* "Set this node's phandle equal to some
 			 * other node's phandle".  That's nonsensical
 			 * by construction. */ {
-			FAIL(c, dti, "%s in %s is a reference to another node",
-			     prop->name, node->fullpath);
+			FAIL(c, dti, node, "%s is a reference to another node",
+			     prop->name);
 		}
 		/* But setting this node's phandle equal to its own
 		 * phandle is allowed - that means allocate a unique
@@ -466,8 +464,8 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 	phandle = propval_cell(prop);
 
 	if ((phandle == 0) || (phandle == -1)) {
-		FAIL(c, dti, "%s has bad value (0x%x) in %s property",
-		     node->fullpath, phandle, prop->name);
+		FAIL(c, dti, node, "bad value (0x%x) in %s property",
+		     phandle, prop->name);
 		return 0;
 	}
 
@@ -493,16 +491,16 @@ static void check_explicit_phandles(struct check *c, struct dt_info *dti,
 		return;
 
 	if (linux_phandle && phandle && (phandle != linux_phandle))
-		FAIL(c, dti, "%s has mismatching 'phandle' and 'linux,phandle'"
-		     " properties", node->fullpath);
+		FAIL(c, dti, node, "mismatching 'phandle' and 'linux,phandle'"
+		     " properties");
 
 	if (linux_phandle && !phandle)
 		phandle = linux_phandle;
 
 	other = get_node_by_phandle(root, phandle);
 	if (other && (other != node)) {
-		FAIL(c, dti, "%s has duplicated phandle 0x%x (seen before at %s)",
-		     node->fullpath, phandle, other->fullpath);
+		FAIL(c, dti, node, "duplicated phandle 0x%x (seen before at %s)",
+		     phandle, other->fullpath);
 		return;
 	}
 
@@ -526,8 +524,8 @@ static void check_name_properties(struct check *c, struct dt_info *dti,
 
 	if ((prop->val.len != node->basenamelen+1)
 	    || (memcmp(prop->val.val, node->name, node->basenamelen) != 0)) {
-		FAIL(c, dti, "\"name\" property in %s is incorrect (\"%s\" instead"
-		     " of base node name)", node->fullpath, prop->val.val);
+		FAIL(c, dti, node, "\"name\" property is incorrect (\"%s\" instead"
+		     " of base node name)", prop->val.val);
 	} else {
 		/* The name property is correct, and therefore redundant.
 		 * Delete it */
@@ -561,7 +559,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 			refnode = get_node_by_ref(dt, m->ref);
 			if (! refnode) {
 				if (!(dti->dtsflags & DTSF_PLUGIN))
-					FAIL(c, dti, "Reference to non-existent node or "
+					FAIL(c, dti, node, "Reference to non-existent node or "
 							"label \"%s\"\n", m->ref);
 				else /* mark the entry as unresolved */
 					*((fdt32_t *)(prop->val.val + m->offset)) =
@@ -593,7 +591,7 @@ static void fixup_path_references(struct check *c, struct dt_info *dti,
 
 			refnode = get_node_by_ref(dt, m->ref);
 			if (!refnode) {
-				FAIL(c, dti, "Reference to non-existent node or label \"%s\"\n",
+				FAIL(c, dti, node, "Reference to non-existent node or label \"%s\"\n",
 				     m->ref);
 				continue;
 			}
@@ -646,12 +644,12 @@ static void check_alias_paths(struct check *c, struct dt_info *dti,
 
 	for_each_property(node, prop) {
 		if (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val)) {
-			FAIL(c, dti, "aliases property '%s' is not a valid node (%s)",
+			FAIL(c, dti, node, "aliases property '%s' is not a valid node (%s)",
 			     prop->name, prop->val.val);
 			continue;
 		}
 		if (strspn(prop->name, LOWERCASE DIGITS "-") != strlen(prop->name))
-			FAIL(c, dti, "aliases property name '%s' is not valid",
+			FAIL(c, dti, node, "aliases property name '%s' is not valid",
 			     prop->name);
 
 	}
@@ -693,21 +691,21 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
 		return; /* No "reg", that's fine */
 
 	if (!node->parent) {
-		FAIL(c, dti, "Root node has a \"reg\" property");
+		FAIL(c, dti, node, "Root node has a \"reg\" property");
 		return;
 	}
 
 	if (prop->val.len == 0)
-		FAIL(c, dti, "\"reg\" property in %s is empty", node->fullpath);
+		FAIL(c, dti, node, "\"reg\" property is empty");
 
 	addr_cells = node_addr_cells(node->parent);
 	size_cells = node_size_cells(node->parent);
 	entrylen = (addr_cells + size_cells) * sizeof(cell_t);
 
 	if (!entrylen || (prop->val.len % entrylen) != 0)
-		FAIL(c, dti, "\"reg\" property in %s has invalid length (%d bytes) "
+		FAIL(c, dti, node, "\"reg\" property has invalid length (%d bytes) "
 		     "(#address-cells == %d, #size-cells == %d)",
-		     node->fullpath, prop->val.len, addr_cells, size_cells);
+		     prop->val.len, addr_cells, size_cells);
 }
 WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
 
@@ -722,7 +720,7 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 		return;
 
 	if (!node->parent) {
-		FAIL(c, dti, "Root node has a \"ranges\" property");
+		FAIL(c, dti, node, "Root node has a \"ranges\" property");
 		return;
 	}
 
@@ -734,19 +732,19 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 
 	if (prop->val.len == 0) {
 		if (p_addr_cells != c_addr_cells)
-			FAIL(c, dti, "%s has empty \"ranges\" property but its "
+			FAIL(c, dti, node, "empty \"ranges\" property but its "
 			     "#address-cells (%d) differs from %s (%d)",
-			     node->fullpath, c_addr_cells, node->parent->fullpath,
+			     c_addr_cells, node->parent->fullpath,
 			     p_addr_cells);
 		if (p_size_cells != c_size_cells)
-			FAIL(c, dti, "%s has empty \"ranges\" property but its "
+			FAIL(c, dti, node, "empty \"ranges\" property but its "
 			     "#size-cells (%d) differs from %s (%d)",
-			     node->fullpath, c_size_cells, node->parent->fullpath,
+			     c_size_cells, node->parent->fullpath,
 			     p_size_cells);
 	} else if ((prop->val.len % entrylen) != 0) {
-		FAIL(c, dti, "\"ranges\" property in %s has invalid length (%d bytes) "
+		FAIL(c, dti, node, "\"ranges\" property has invalid length (%d bytes) "
 		     "(parent #address-cells == %d, child #address-cells == %d, "
-		     "#size-cells == %d)", node->fullpath, prop->val.len,
+		     "#size-cells == %d)", prop->val.len,
 		     p_addr_cells, c_addr_cells, c_size_cells);
 	}
 }
@@ -769,39 +767,31 @@ static void check_pci_bridge(struct check *c, struct dt_info *dti, struct node *
 
 	if (!strprefixeq(node->name, node->basenamelen, "pci") &&
 	    !strprefixeq(node->name, node->basenamelen, "pcie"))
-		FAIL(c, dti, "Node %s node name is not \"pci\" or \"pcie\"",
-			     node->fullpath);
+		FAIL(c, dti, node, "node name is not \"pci\" or \"pcie\"");
 
 	prop = get_property(node, "ranges");
 	if (!prop)
-		FAIL(c, dti, "Node %s missing ranges for PCI bridge (or not a bridge)",
-			     node->fullpath);
+		FAIL(c, dti, node, "missing ranges for PCI bridge (or not a bridge)");
 
 	if (node_addr_cells(node) != 3)
-		FAIL(c, dti, "Node %s incorrect #address-cells for PCI bridge",
-			     node->fullpath);
+		FAIL(c, dti, node, "incorrect #address-cells for PCI bridge");
 	if (node_size_cells(node) != 2)
-		FAIL(c, dti, "Node %s incorrect #size-cells for PCI bridge",
-			     node->fullpath);
+		FAIL(c, dti, node, "incorrect #size-cells for PCI bridge");
 
 	prop = get_property(node, "bus-range");
 	if (!prop) {
-		FAIL(c, dti, "Node %s missing bus-range for PCI bridge",
-			     node->fullpath);
+		FAIL(c, dti, node, "missing bus-range for PCI bridge");
 		return;
 	}
 	if (prop->val.len != (sizeof(cell_t) * 2)) {
-		FAIL(c, dti, "Node %s bus-range must be 2 cells",
-			     node->fullpath);
+		FAIL(c, dti, node, "bus-range must be 2 cells");
 		return;
 	}
 	cells = (cell_t *)prop->val.val;
 	if (fdt32_to_cpu(cells[0]) > fdt32_to_cpu(cells[1]))
-		FAIL(c, dti, "Node %s bus-range 1st cell must be less than or equal to 2nd cell",
-			     node->fullpath);
+		FAIL(c, dti, node, "bus-range 1st cell must be less than or equal to 2nd cell");
 	if (fdt32_to_cpu(cells[1]) > 0xff)
-		FAIL(c, dti, "Node %s bus-range maximum bus number must be less than 256",
-			     node->fullpath);
+		FAIL(c, dti, node, "bus-range maximum bus number must be less than 256");
 }
 WARNING(pci_bridge, check_pci_bridge, NULL,
 	&device_type_is_string, &addr_size_cells);
@@ -831,8 +821,8 @@ static void check_pci_device_bus_num(struct check *c, struct dt_info *dti, struc
 		max_bus = fdt32_to_cpu(cells[0]);
 	}
 	if ((bus_num < min_bus) || (bus_num > max_bus))
-		FAIL(c, dti, "Node %s PCI bus number %d out of range, expected (%d - %d)",
-		     node->fullpath, bus_num, min_bus, max_bus);
+		FAIL(c, dti, node, "PCI bus number %d out of range, expected (%d - %d)",
+		     bus_num, min_bus, max_bus);
 }
 WARNING(pci_device_bus_num, check_pci_device_bus_num, NULL, &reg_format, &pci_bridge);
 
@@ -849,25 +839,22 @@ static void check_pci_device_reg(struct check *c, struct dt_info *dti, struct no
 
 	prop = get_property(node, "reg");
 	if (!prop) {
-		FAIL(c, dti, "Node %s missing PCI reg property", node->fullpath);
+		FAIL(c, dti, node, "missing PCI reg property");
 		return;
 	}
 
 	cells = (cell_t *)prop->val.val;
 	if (cells[1] || cells[2])
-		FAIL(c, dti, "Node %s PCI reg config space address cells 2 and 3 must be 0",
-			     node->fullpath);
+		FAIL(c, dti, node, "PCI reg config space address cells 2 and 3 must be 0");
 
 	reg = fdt32_to_cpu(cells[0]);
 	dev = (reg & 0xf800) >> 11;
 	func = (reg & 0x700) >> 8;
 
 	if (reg & 0xff000000)
-		FAIL(c, dti, "Node %s PCI reg address is not configuration space",
-			     node->fullpath);
+		FAIL(c, dti, node, "PCI reg address is not configuration space");
 	if (reg & 0x000000ff)
-		FAIL(c, dti, "Node %s PCI reg config space address register number must be 0",
-			     node->fullpath);
+		FAIL(c, dti, node, "PCI reg config space address register number must be 0");
 
 	if (func == 0) {
 		snprintf(unit_addr, sizeof(unit_addr), "%x", dev);
@@ -879,8 +866,8 @@ static void check_pci_device_reg(struct check *c, struct dt_info *dti, struct no
 	if (streq(unitname, unit_addr))
 		return;
 
-	FAIL(c, dti, "Node %s PCI unit address format error, expected \"%s\"",
-	     node->fullpath, unit_addr);
+	FAIL(c, dti, node, "PCI unit address format error, expected \"%s\"",
+	     unit_addr);
 }
 WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format, &pci_bridge);
 
@@ -936,7 +923,7 @@ static void check_simple_bus_reg(struct check *c, struct dt_info *dti, struct no
 
 	if (!cells) {
 		if (node->parent->parent && !(node->bus == &simple_bus))
-			FAIL(c, dti, "Node %s missing or empty reg/ranges property", node->fullpath);
+			FAIL(c, dti, node, "missing or empty reg/ranges property");
 		return;
 	}
 
@@ -946,8 +933,8 @@ static void check_simple_bus_reg(struct check *c, struct dt_info *dti, struct no
 
 	snprintf(unit_addr, sizeof(unit_addr), "%"PRIx64, reg);
 	if (!streq(unitname, unit_addr))
-		FAIL(c, dti, "Node %s simple-bus unit address format error, expected \"%s\"",
-		     node->fullpath, unit_addr);
+		FAIL(c, dti, node, "simple-bus unit address format error, expected \"%s\"",
+		     unit_addr);
 }
 WARNING(simple_bus_reg, check_simple_bus_reg, NULL, &reg_format, &simple_bus_bridge);
 
@@ -963,14 +950,12 @@ static void check_unit_address_format(struct check *c, struct dt_info *dti,
 		return;
 
 	if (!strncmp(unitname, "0x", 2)) {
-		FAIL(c, dti, "Node %s unit name should not have leading \"0x\"",
-		    node->fullpath);
+		FAIL(c, dti, node, "unit name should not have leading \"0x\"");
 		/* skip over 0x for next test */
 		unitname += 2;
 	}
 	if (unitname[0] == '0' && isxdigit(unitname[1]))
-		FAIL(c, dti, "Node %s unit name should not have leading 0s",
-		    node->fullpath);
+		FAIL(c, dti, node, "unit name should not have leading 0s");
 }
 WARNING(unit_address_format, check_unit_address_format, NULL,
 	&node_name_format, &pci_bridge, &simple_bus_bridge);
@@ -993,12 +978,10 @@ static void check_avoid_default_addr_size(struct check *c, struct dt_info *dti,
 		return;
 
 	if (node->parent->addr_cells == -1)
-		FAIL(c, dti, "Relying on default #address-cells value for %s",
-		     node->fullpath);
+		FAIL(c, dti, node, "Relying on default #address-cells value");
 
 	if (node->parent->size_cells == -1)
-		FAIL(c, dti, "Relying on default #size-cells value for %s",
-		     node->fullpath);
+		FAIL(c, dti, node, "Relying on default #size-cells value");
 }
 WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
 	&addr_size_cells);
@@ -1023,8 +1006,7 @@ static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *d
 	}
 
 	if (!has_reg)
-		FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
-		     node->fullpath);
+		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property");
 }
 WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, NULL, &avoid_default_addr_size);
 
@@ -1046,7 +1028,7 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
 
 	prop = get_property(chosen, "interrupt-controller");
 	if (prop)
-		FAIL(c, dti, "/chosen has obsolete \"interrupt-controller\" "
+		FAIL(c, dti, node, "/chosen has obsolete \"interrupt-controller\" "
 		     "property");
 }
 WARNING(obsolete_chosen_interrupt_controller,
@@ -1059,8 +1041,7 @@ static void check_chosen_node_is_root(struct check *c, struct dt_info *dti,
 		return;
 
 	if (node->parent != dti->dt)
-		FAIL(c, dti, "chosen node '%s' must be at root node",
-		     node->fullpath);
+		FAIL(c, dti, node, "chosen node must be at root node");
 }
 WARNING(chosen_node_is_root, check_chosen_node_is_root, NULL);
 
@@ -1094,7 +1075,7 @@ static void check_chosen_node_stdout_path(struct check *c, struct dt_info *dti,
 		prop = get_property(node, "linux,stdout-path");
 		if (!prop)
 			return;
-		FAIL(c, dti, "Use 'stdout-path' instead of 'linux,stdout-path'");
+		FAIL(c, dti, node, "Use 'stdout-path' instead of 'linux,stdout-path'");
 	}
 
 	c->data = prop->name;
@@ -1118,8 +1099,8 @@ static void check_property_phandle_args(struct check *c,
 	int cell, cellsize = 0;
 
 	if (prop->val.len % sizeof(cell_t)) {
-		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %zu in node %s",
-		     prop->name, prop->val.len, sizeof(cell_t), node->fullpath);
+		FAIL(c, dti, node, "property '%s' size (%d) is invalid, expected multiple of %zu",
+		     prop->name, prop->val.len, sizeof(cell_t));
 		return;
 	}
 
@@ -1150,14 +1131,14 @@ static void check_property_phandle_args(struct check *c,
 					break;
 			}
 			if (!m)
-				FAIL(c, dti, "Property '%s', cell %d is not a phandle reference in %s",
-				     prop->name, cell, node->fullpath);
+				FAIL(c, dti, node, "Property '%s', cell %d is not a phandle reference",
+				     prop->name, cell);
 		}
 
 		provider_node = get_node_by_phandle(root, phandle);
 		if (!provider_node) {
-			FAIL(c, dti, "Could not get phandle node for %s:%s(cell %d)",
-			     node->fullpath, prop->name, cell);
+			FAIL(c, dti, node, "Could not get phandle node for %s(cell %d)",
+			     prop->name, cell);
 			break;
 		}
 
@@ -1167,16 +1148,16 @@ static void check_property_phandle_args(struct check *c,
 		} else if (provider->optional) {
 			cellsize = 0;
 		} else {
-			FAIL(c, dti, "Missing property '%s' in node %s or bad phandle (referred from %s:%s[%d])",
+			FAIL(c, dti, node, "Missing property '%s' in node %s or bad phandle (referred from %s[%d])",
 			     provider->cell_name,
 			     provider_node->fullpath,
-			     node->fullpath, prop->name, cell);
+			     prop->name, cell);
 			break;
 		}
 
 		if (prop->val.len < ((cell + cellsize + 1) * sizeof(cell_t))) {
-			FAIL(c, dti, "%s property size (%d) too small for cell size %d in %s",
-			     prop->name, prop->val.len, cellsize, node->fullpath);
+			FAIL(c, dti, node, "%s property size (%d) too small for cell size %d",
+			     prop->name, prop->val.len, cellsize);
 		}
 	}
 }
@@ -1278,8 +1259,8 @@ static void check_deprecated_gpio_property(struct check *c,
 		if (!streq(str, "gpio"))
 			continue;
 
-		FAIL(c, dti, "'[*-]gpio' is deprecated, use '[*-]gpios' instead for %s:%s",
-		     node->fullpath, prop->name);
+		FAIL(c, dti, node, "'[*-]gpio' is deprecated, use '[*-]gpios' instead for %s",
+		     prop->name);
 	}
 
 }
@@ -1313,9 +1294,8 @@ static void check_interrupts_property(struct check *c,
 		return;
 
 	if (irq_prop->val.len % sizeof(cell_t))
-		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %zu in node %s",
-		     irq_prop->name, irq_prop->val.len, sizeof(cell_t),
-		     node->fullpath);
+		FAIL(c, dti, node, "property '%s' size (%d) is invalid, expected multiple of %zu",
+		     irq_prop->name, irq_prop->val.len, sizeof(cell_t));
 
 	while (parent && !prop) {
 		if (parent != node && node_is_interrupt_provider(parent)) {
@@ -1333,14 +1313,12 @@ static void check_interrupts_property(struct check *c,
 
 			irq_node = get_node_by_phandle(root, phandle);
 			if (!irq_node) {
-				FAIL(c, dti, "Bad interrupt-parent phandle for %s",
-				     node->fullpath);
+				FAIL(c, dti, node, "Bad interrupt-parent phandle");
 				return;
 			}
 			if (!node_is_interrupt_provider(irq_node))
-				FAIL(c, dti,
-				     "Missing interrupt-controller or interrupt-map property in %s",
-				     irq_node->fullpath);
+				FAIL(c, dti, irq_node,
+				     "Missing interrupt-controller or interrupt-map property");
 
 			break;
 		}
@@ -1349,23 +1327,21 @@ static void check_interrupts_property(struct check *c,
 	}
 
 	if (!irq_node) {
-		FAIL(c, dti, "Missing interrupt-parent for %s", node->fullpath);
+		FAIL(c, dti, node, "Missing interrupt-parent");
 		return;
 	}
 
 	prop = get_property(irq_node, "#interrupt-cells");
 	if (!prop) {
-		FAIL(c, dti, "Missing #interrupt-cells in interrupt-parent %s",
-		     irq_node->fullpath);
+		FAIL(c, dti, irq_node, "Missing #interrupt-cells in interrupt-parent");
 		return;
 	}
 
 	irq_cells = propval_cell(prop);
 	if (irq_prop->val.len % (irq_cells * sizeof(cell_t))) {
-		FAIL(c, dti,
-		     "interrupts size is (%d), expected multiple of %d in %s",
-		     irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)),
-		     node->fullpath);
+		FAIL(c, dti, node,
+		     "interrupts size is (%d), expected multiple of %d",
+		     irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
 	}
 }
 WARNING(interrupts_property, check_interrupts_property, &phandle_references);
-- 
2.14.1
