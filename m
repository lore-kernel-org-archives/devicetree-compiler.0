From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 3/5] checks: Add markers on known properties
Date: Tue, 27 Jul 2021 12:30:21 -0600
Message-ID: <20210727183023.3212077-4-robh@kernel.org>
References: <20210727183023.3212077-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210727183023.3212077-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

For properties we already have checks for, we know the type and how to
parse them. Use this to add type and phandle markers so we have them when
the source did not (e.g. dtb format).

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v3:
 - Rework marker_add() and callers into 3 functions. marker_add() just
   adds a marker. marker_add_type_annotations() adds type annotations
   at each entry offset. marker_add_phandle_annotation() adds a phandle
   and type annotation at a phandle offset.
 - Only add type info when no type markers are present at all.
 - Keep phandle ref check on phandle+args properties.
v2:
 - Set marker.ref on phandle markers
 - Avoid adding markers if there's any conflicting type markers.
---
 checks.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 5 deletions(-)

diff --git a/checks.c b/checks.c
index e2690e90f90c..b7ac1732b0b8 100644
--- a/checks.c
+++ b/checks.c
@@ -58,6 +58,56 @@ struct check {
 #define CHECK(nm_, fn_, d_, ...) \
 	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
 
+static struct marker *marker_add(struct marker **list, enum markertype type,
+				 unsigned int offset, char * ref)
+{
+	struct marker *m = *list;
+
+	m = xmalloc(sizeof(*m));
+	m->type = type;
+	m->offset = offset;
+	m->next = NULL;
+	m->ref = ref;
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
+static void marker_add_type_annotations(struct property *prop,
+					enum markertype type,
+					unsigned int entrylen)
+{
+	unsigned int offset;
+
+	assert(is_type_marker(type));
+
+	if (has_type_markers(prop->val.markers))
+		return;
+
+	for (offset = 0; offset < prop->val.len; offset += entrylen)
+		marker_add(&prop->val.markers, type, offset, NULL);
+}
+
+static void marker_add_phandle_annotation(struct property *prop,
+					  unsigned int cell,
+					  char *ref)
+{
+	if (!cell && has_type_markers(prop->val.markers))
+		return;
+
+	marker_add(&prop->val.markers, TYPE_UINT32, cell * sizeof(cell_t), NULL);
+	marker_add(&prop->val.markers, REF_PHANDLE, cell * sizeof(cell_t), ref);
+}
+
 static inline void  PRINTF(5, 6) check_msg(struct check *c, struct dt_info *dti,
 					   struct node *node,
 					   struct property *prop,
@@ -260,8 +310,12 @@ static void check_is_cell(struct check *c, struct dt_info *dti,
 	if (!prop)
 		return; /* Not present, assumed ok */
 
-	if (prop->val.len != sizeof(cell_t))
+	if (prop->val.len != sizeof(cell_t)) {
 		FAIL_PROP(c, dti, node, prop, "property is not a single cell");
+		return;
+	}
+
+	marker_add_type_annotations(prop, TYPE_UINT32, prop->val.len);
 }
 #define WARNING_IF_NOT_CELL(nm, propname) \
 	WARNING(nm, check_is_cell, (propname))
@@ -526,6 +580,8 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 		return 0;
 	}
 
+	marker_add_type_annotations(prop, TYPE_UINT32, prop->val.len);
+
 	return phandle;
 }
 
@@ -774,10 +830,14 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
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
+	marker_add_type_annotations(prop, TYPE_UINT32, entrylen);
 }
 WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
 
@@ -821,6 +881,8 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 			  "#size-cells == %d)", ranges, prop->val.len,
 			  p_addr_cells, c_addr_cells, c_size_cells);
 	}
+
+	marker_add_type_annotations(prop, TYPE_UINT32, entrylen);
 }
 WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
 WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size_cells);
@@ -1389,6 +1451,7 @@ static void check_property_phandle_args(struct check *c,
 {
 	struct node *root = dti->dt;
 	unsigned int cell, cellsize = 0;
+	bool has_type = has_type_markers(prop->val.markers);
 
 	if (!is_multiple_of(prop->val.len, sizeof(cell_t))) {
 		FAIL_PROP(c, dti, node, prop,
@@ -1417,7 +1480,7 @@ static void check_property_phandle_args(struct check *c,
 		}
 
 		/* If we have markers, verify the current cell is a phandle */
-		if (prop->val.markers) {
+		if (has_type) {
 			struct marker *m = prop->val.markers;
 			for_each_marker_of_type(m, REF_PHANDLE) {
 				if (m->offset == (cell * sizeof(cell_t)))
@@ -1454,7 +1517,11 @@ static void check_property_phandle_args(struct check *c,
 			FAIL_PROP(c, dti, node, prop,
 				  "property size (%d) too small for cell size %d",
 				  prop->val.len, cellsize);
+			break;
 		}
+
+		if (!has_type)
+			marker_add_phandle_annotation(prop, cell, provider_node->fullpath);
 	}
 }
 
@@ -1629,10 +1696,13 @@ static void check_interrupts_property(struct check *c,
 				FAIL_PROP(c, dti, parent, prop, "Bad phandle");
 				return;
 			}
-			if (!node_is_interrupt_provider(irq_node))
+			if (!node_is_interrupt_provider(irq_node)) {
 				FAIL(c, dti, irq_node,
 				     "Missing interrupt-controller or interrupt-map property");
+				return;
+			}
 
+			marker_add_phandle_annotation(prop, 0, irq_node->fullpath);
 			break;
 		}
 
@@ -1655,7 +1725,10 @@ static void check_interrupts_property(struct check *c,
 		FAIL_PROP(c, dti, node, prop,
 			  "size is (%d), expected multiple of %d",
 			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
+		return;
 	}
+
+	marker_add_type_annotations(irq_prop, TYPE_UINT32, irq_cells * sizeof(cell_t));
 }
 WARNING(interrupts_property, check_interrupts_property, &phandle_references);
 
@@ -1776,8 +1849,12 @@ static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
 		return NULL;
 
 	node = get_node_by_phandle(dti->dt, phandle);
-	if (!node)
+	if (!node) {
 		FAIL_PROP(c, dti, endpoint, prop, "graph phandle is not valid");
+		return NULL;
+	}
+
+	marker_add_phandle_annotation(prop, 0, node->fullpath);
 
 	return node;
 }
-- 
2.27.0

