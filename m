From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/3] checks: Add markers on known properties
Date: Tue,  8 Jun 2021 15:46:24 -0500
Message-ID: <20210608204626.1545418-2-robh@kernel.org>
References: <20210608204626.1545418-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210608204626.1545418-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

For properties we already have checks for, we know the type and how to
parse them. Use this to add type and phandle markers so we have them when
the source did not (e.g. dtb format).

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
 - Set marker.ref on phandle markers
 - Avoid adding markers if there's any conflicting type markers.
---
 checks.c | 102 ++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 82 insertions(+), 20 deletions(-)

diff --git a/checks.c b/checks.c
index e6c7c3eeacac..0f51b9111be1 100644
--- a/checks.c
+++ b/checks.c
@@ -58,6 +58,38 @@ struct check {
 #define CHECK(nm_, fn_, d_, ...) \
 	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
 
+static struct marker *marker_add(struct marker **list, enum markertype type,
+				 unsigned int offset)
+{
+	struct marker *m = *list;
+
+	/* Check if we already have a different type or a type marker at the offset*/
+	for_each_marker_of_type(m, type) {
+		if ((m->type >= TYPE_UINT8) && (m->type != type))
+			return NULL;
+		if (m->type == type && m->offset == offset)
+			return NULL;
+	}
+
+	m = xmalloc(sizeof(*m));
+	m->type = type;
+	m->offset = offset;
+	m->next = NULL;
+	m->ref = NULL;
+
+	/* Find the insertion point, markers are in order by offset */
+	while (*list && ((*list)->offset < m->offset))
+		list = &((*list)->next);
+
+	if (*list) {
+		m->next = (*list)->next;
+		(*list)->next = m;
+	} else
+		*list = m;
+
+	return m;
+}
+
 static inline void  PRINTF(5, 6) check_msg(struct check *c, struct dt_info *dti,
 					   struct node *node,
 					   struct property *prop,
@@ -260,8 +292,12 @@ static void check_is_cell(struct check *c, struct dt_info *dti,
 	if (!prop)
 		return; /* Not present, assumed ok */
 
-	if (prop->val.len != sizeof(cell_t))
+	if (prop->val.len != sizeof(cell_t)) {
 		FAIL_PROP(c, dti, node, prop, "property is not a single cell");
+		return;
+	}
+
+	marker_add(&prop->val.markers, TYPE_UINT32, 0);
 }
 #define WARNING_IF_NOT_CELL(nm, propname) \
 	WARNING(nm, check_is_cell, (propname))
@@ -517,6 +553,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 		 * we treat it as having no phandle data for now. */
 		return 0;
 	}
+	marker_add(&prop->val.markers, TYPE_UINT32, 0);
 
 	phandle = propval_cell(prop);
 
@@ -756,7 +793,7 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
 			     struct node *node)
 {
 	struct property *prop;
-	int addr_cells, size_cells, entrylen;
+	int addr_cells, size_cells, entrylen, offset;
 
 	prop = get_property(node, "reg");
 	if (!prop)
@@ -774,10 +811,16 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
 	size_cells = node_size_cells(node->parent);
 	entrylen = (addr_cells + size_cells) * sizeof(cell_t);
 
-	if (!is_multiple_of(prop->val.len, entrylen))
+	if (!is_multiple_of(prop->val.len, entrylen)) {
 		FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
 			  "(#address-cells == %d, #size-cells == %d)",
 			  prop->val.len, addr_cells, size_cells);
+		return;
+	}
+
+	for (offset = 0; offset < prop->val.len; offset += entrylen)
+		if (!marker_add(&prop->val.markers, TYPE_UINT32, offset))
+			break;
 }
 WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
 
@@ -785,7 +828,7 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 				struct node *node)
 {
 	struct property *prop;
-	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
+	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen, offset;
 	const char *ranges = c->data;
 
 	prop = get_property(node, ranges);
@@ -821,6 +864,10 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 			  "#size-cells == %d)", ranges, prop->val.len,
 			  p_addr_cells, c_addr_cells, c_size_cells);
 	}
+
+	for (offset = 0; offset < prop->val.len; offset += entrylen)
+		if (!marker_add(&prop->val.markers, TYPE_UINT32, offset))
+			break;
 }
 WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
 WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size_cells);
@@ -1400,6 +1447,7 @@ static void check_property_phandle_args(struct check *c,
 	for (cell = 0; cell < prop->val.len / sizeof(cell_t); cell += cellsize + 1) {
 		struct node *provider_node;
 		struct property *cellprop;
+		struct marker *m;
 		int phandle;
 
 		phandle = propval_cell_n(prop, cell);
@@ -1416,19 +1464,6 @@ static void check_property_phandle_args(struct check *c,
 			continue;
 		}
 
-		/* If we have markers, verify the current cell is a phandle */
-		if (prop->val.markers) {
-			struct marker *m = prop->val.markers;
-			for_each_marker_of_type(m, REF_PHANDLE) {
-				if (m->offset == (cell * sizeof(cell_t)))
-					break;
-			}
-			if (!m)
-				FAIL_PROP(c, dti, node, prop,
-					  "cell %d is not a phandle reference",
-					  cell);
-		}
-
 		provider_node = get_node_by_phandle(root, phandle);
 		if (!provider_node) {
 			FAIL_PROP(c, dti, node, prop,
@@ -1454,7 +1489,13 @@ static void check_property_phandle_args(struct check *c,
 			FAIL_PROP(c, dti, node, prop,
 				  "property size (%d) too small for cell size %d",
 				  prop->val.len, cellsize);
+			break;
 		}
+
+		marker_add(&prop->val.markers, TYPE_UINT32, cell * sizeof(cell_t));
+		m = marker_add(&prop->val.markers, REF_PHANDLE, cell * sizeof(cell_t));
+		if (m)
+			m->ref = provider_node->fullpath;
 	}
 }
 
@@ -1596,7 +1637,7 @@ static void check_interrupts_property(struct check *c,
 	struct node *root = dti->dt;
 	struct node *irq_node = NULL, *parent = node;
 	struct property *irq_prop, *prop = NULL;
-	int irq_cells, phandle;
+	int irq_cells, phandle, offset;
 
 	irq_prop = get_property(node, "interrupts");
 	if (!irq_prop)
@@ -1614,6 +1655,8 @@ static void check_interrupts_property(struct check *c,
 
 		prop = get_property(parent, "interrupt-parent");
 		if (prop) {
+			struct marker *m;
+
 			phandle = propval_cell(prop);
 			if ((phandle == 0) || (phandle == -1)) {
 				/* Give up if this is an overlay with
@@ -1629,10 +1672,16 @@ static void check_interrupts_property(struct check *c,
 				FAIL_PROP(c, dti, parent, prop, "Bad phandle");
 				return;
 			}
-			if (!node_is_interrupt_provider(irq_node))
+			if (!node_is_interrupt_provider(irq_node)) {
 				FAIL(c, dti, irq_node,
 				     "Missing interrupt-controller or interrupt-map property");
+				return;
+			}
 
+			marker_add(&prop->val.markers, TYPE_UINT32, 0);
+			m = marker_add(&prop->val.markers, REF_PHANDLE, 0);
+			if (m)
+				m->ref = irq_node->fullpath;
 			break;
 		}
 
@@ -1655,7 +1704,12 @@ static void check_interrupts_property(struct check *c,
 		FAIL_PROP(c, dti, node, prop,
 			  "size is (%d), expected multiple of %d",
 			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
+		return;
 	}
+
+	for (offset = 0; offset < irq_prop->val.len; offset += irq_cells * sizeof(cell_t))
+		if (!marker_add(&irq_prop->val.markers, TYPE_UINT32, offset))
+			break;
 }
 WARNING(interrupts_property, check_interrupts_property, &phandle_references);
 
@@ -1763,6 +1817,7 @@ static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
 					struct node *endpoint)
 {
 	int phandle;
+	struct marker *m;
 	struct node *node;
 	struct property *prop;
 
@@ -1776,8 +1831,15 @@ static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
 		return NULL;
 
 	node = get_node_by_phandle(dti->dt, phandle);
-	if (!node)
+	if (!node) {
 		FAIL_PROP(c, dti, endpoint, prop, "graph phandle is not valid");
+		return NULL;
+	}
+
+	marker_add(&prop->val.markers, TYPE_UINT32, 0);
+	m = marker_add(&prop->val.markers, REF_PHANDLE, 0);
+	if (m)
+		m->ref = node->fullpath;
 
 	return node;
 }
-- 
2.27.0

