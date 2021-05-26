From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/5] checks: Add markers on known properties
Date: Tue, 25 May 2021 20:03:34 -0500
Message-ID: <20210526010335.860787-5-robh@kernel.org>
References: <20210526010335.860787-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210526010335.860787-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

For properties we already have checks for, we know the type and how to
parse them. Use this to add type and phandle markers so we have them when
the source did not (e.g. dtb format).

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 74 ++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/checks.c b/checks.c
index 7ff044df6837..69ad3eec50b5 100644
--- a/checks.c
+++ b/checks.c
@@ -58,6 +58,32 @@ struct check {
 #define CHECK(nm_, fn_, d_, ...) \
 	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
 
+static void marker_add(struct marker **list, enum markertype type, unsigned int offset)
+{
+	struct marker *m = *list;
+
+	/* Check if we already have the same marker */
+	for_each_marker_of_type(m, type)
+		if (m->type == type && m->offset == offset)
+			return;
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
+}
+
 static inline void  PRINTF(5, 6) check_msg(struct check *c, struct dt_info *dti,
 					   struct node *node,
 					   struct property *prop,
@@ -252,8 +278,12 @@ static void check_is_cell(struct check *c, struct dt_info *dti,
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
@@ -509,6 +539,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 		 * we treat it as having no phandle data for now. */
 		return 0;
 	}
+	marker_add(&prop->val.markers, TYPE_UINT32, 0);
 
 	phandle = propval_cell(prop);
 
@@ -748,7 +779,7 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
 			     struct node *node)
 {
 	struct property *prop;
-	int addr_cells, size_cells, entrylen;
+	int addr_cells, size_cells, entrylen, offset;
 
 	prop = get_property(node, "reg");
 	if (!prop)
@@ -766,10 +797,15 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
 	size_cells = node_size_cells(node->parent);
 	entrylen = (addr_cells + size_cells) * sizeof(cell_t);
 
-	if (!entrylen || (prop->val.len % entrylen) != 0)
+	if (!entrylen || (prop->val.len % entrylen) != 0) {
 		FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
 			  "(#address-cells == %d, #size-cells == %d)",
 			  prop->val.len, addr_cells, size_cells);
+		return;
+	}
+
+	for (offset = 0; offset < prop->val.len; offset += entrylen)
+		marker_add(&prop->val.markers, TYPE_UINT32, offset);
 }
 WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
 
@@ -777,7 +813,7 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 				struct node *node)
 {
 	struct property *prop;
-	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
+	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen, offset;
 	const char *ranges = c->data;
 
 	prop = get_property(node, ranges);
@@ -813,6 +849,9 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 			  "#size-cells == %d)", ranges, prop->val.len,
 			  p_addr_cells, c_addr_cells, c_size_cells);
 	}
+
+	for (offset = 0; offset < prop->val.len; offset += entrylen)
+		marker_add(&prop->val.markers, TYPE_UINT32, offset);
 }
 WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
 WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size_cells);
@@ -1408,19 +1447,6 @@ static void check_property_phandle_args(struct check *c,
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
@@ -1447,6 +1473,9 @@ static void check_property_phandle_args(struct check *c,
 				  "property size (%d) too small for cell size %d",
 				  prop->val.len, cellsize);
 		}
+
+		marker_add(&prop->val.markers, REF_PHANDLE, cell * sizeof(cell_t));
+		marker_add(&prop->val.markers, TYPE_UINT32, cell * sizeof(cell_t));
 	}
 }
 
@@ -1588,7 +1617,7 @@ static void check_interrupts_property(struct check *c,
 	struct node *root = dti->dt;
 	struct node *irq_node = NULL, *parent = node;
 	struct property *irq_prop, *prop = NULL;
-	int irq_cells, phandle;
+	int irq_cells, phandle, offset;
 
 	irq_prop = get_property(node, "interrupts");
 	if (!irq_prop)
@@ -1625,6 +1654,8 @@ static void check_interrupts_property(struct check *c,
 				FAIL(c, dti, irq_node,
 				     "Missing interrupt-controller or interrupt-map property");
 
+			marker_add(&prop->val.markers, TYPE_UINT32, 0);
+			marker_add(&prop->val.markers, REF_PHANDLE, 0);
 			break;
 		}
 
@@ -1647,7 +1678,11 @@ static void check_interrupts_property(struct check *c,
 		FAIL_PROP(c, dti, node, prop,
 			  "size is (%d), expected multiple of %d",
 			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
+		return;
 	}
+
+	for (offset = 0; offset < irq_prop->val.len; offset += irq_cells * sizeof(cell_t))
+		marker_add(&irq_prop->val.markers, TYPE_UINT32, offset);
 }
 WARNING(interrupts_property, check_interrupts_property, &phandle_references);
 
@@ -1771,6 +1806,9 @@ static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
 	if (!node)
 		FAIL_PROP(c, dti, endpoint, prop, "graph phandle is not valid");
 
+	marker_add(&prop->val.markers, TYPE_UINT32, 0);
+	marker_add(&prop->val.markers, REF_PHANDLE, 0);
+
 	return node;
 }
 
-- 
2.27.0

