From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Fri, 03 Feb 2017 19:44:06 +0000
Message-ID: <1486151046.7612.44.camel@hellion.org.uk>
References: <1485767585.7612.23.camel@hellion.org.uk>
         <20170130234932.GB14879@umbus.fritz.box>
         <1485851088.7612.32.camel@hellion.org.uk>
         <20170201001654.GB30639@umbus.fritz.box>
         <20170201010004.GG30639@umbus.fritz.box>
         <1485934446.7612.36.camel@hellion.org.uk>
         <20170202050553.GF13219@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170202050553.GF13219-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, 2017-02-02 at 16:05 +1100, David Gibson wrote:
> Feel free to send a patch and I'll think about it.

Please see below.

The diffstat is a rather large due to the need to plumb `outname`
through to all the check functions. That could perhaps be avoided by
adding it to `struct dt_info *dti` instead since that is already
available in most places, but there would still be the churn relating
to adding a parameter to `check_msg` and the various wrapper macros.
Happy to rework along those lines if you prefer it though.

Cheers,
Ian.

8<-------------

From 4fa93f32bb14f878dfe1a605b4b94b12d7e95a58 Mon Sep 17 00:00:00 2001
From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Date: Fri, 3 Feb 2017 08:29:39 +0000
Subject: [PATCH] Print output filename as part of warning messages

For example:
src/arm/at91-ariag25.dtb: Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name

If output is to stdout then the prefix is "<stdout>: ".

This helps to direct the developer to where to look when multiple files are
being compiled in parallel.

Quite intrusive into checks.c due to the need to plumb the output filename
throughout.

Signed-off-by: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
---
 checks.c | 143 +++++++++++++++++++++++++++++++++------------------------------
 dtc.c    |   2 +-
 dtc.h    |   2 +-
 3 files changed, 77 insertions(+), 70 deletions(-)

diff --git a/checks.c b/checks.c
index 3d18e45..f0a0e7b 100644
--- a/checks.c
+++ b/checks.c
@@ -40,7 +40,8 @@ enum checkstatus {
 
 struct check;
 
-typedef void (*check_fn)(struct check *c, struct dt_info *dti, struct node *node);
+typedef void (*check_fn)(struct check *c, struct dt_info *dti,
+			 struct node *node, const char *outname);
 
 struct check {
 	const char *name;
@@ -73,16 +74,19 @@ struct check {
 	CHECK_ENTRY(_nm, _fn, _d, false, false, __VA_ARGS__)
 
 #ifdef __GNUC__
-static inline void check_msg(struct check *c, const char *fmt, ...) __attribute__((format (printf, 2, 3)));
+static inline void check_msg(struct check *c, const char *outname,
+			     const char *fmt, ...) __attribute__((format (printf, 3, 4)));
 #endif
-static inline void check_msg(struct check *c, const char *fmt, ...)
+static inline void check_msg(struct check *c, const char *outname,
+			     const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
 
 	if ((c->warn && (quiet < 1))
 	    || (c->error && (quiet < 2))) {
-		fprintf(stderr, "%s (%s): ",
+		fprintf(stderr, "%s: %s (%s): ",
+			strcmp(outname, "-") ? outname : "<stdout>",
 			(c->error) ? "ERROR" : "Warning", c->name);
 		vfprintf(stderr, fmt, ap);
 		fprintf(stderr, "\n");
@@ -90,26 +94,27 @@ static inline void check_msg(struct check *c, const char *fmt, ...)
 	va_end(ap);
 }
 
-#define FAIL(c, ...) \
-	do { \
-		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__); \
-		(c)->status = FAILED; \
-		check_msg((c), __VA_ARGS__); \
+#define FAIL(c, outname, ...)						\
+	do {								\
+		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
+		(c)->status = FAILED;					\
+		check_msg((c), outname, __VA_ARGS__);			\
 	} while (0)
 
-static void check_nodes_props(struct check *c, struct dt_info *dti, struct node *node)
+static void check_nodes_props(struct check *c, struct dt_info *dti,
+			      struct node *node, const char *outname)
 {
 	struct node *child;
 
 	TRACE(c, "%s", node->fullpath);
 	if (c->fn)
-		c->fn(c, dti, node);
+		c->fn(c, dti, node, outname);
 
 	for_each_child(node, child)
-		check_nodes_props(c, dti, child);
+		check_nodes_props(c, dti, child, outname);
 }
 
-static bool run_check(struct check *c, struct dt_info *dti)
+static bool run_check(struct check *c, struct dt_info *dti, const char *outname)
 {
 	struct node *dt = dti->dt;
 	bool error = false;
@@ -124,7 +129,7 @@ static bool run_check(struct check *c, struct dt_info *dti)
 
 	for (i = 0; i < c->num_prereqs; i++) {
 		struct check *prq = c->prereq[i];
-		error = error || run_check(prq, dti);
+		error = error || run_check(prq, dti, outname);
 		if (prq->status != PASSED) {
 			c->status = PREREQ;
 			check_msg(c, "Failed prerequisite '%s'",
@@ -135,7 +140,7 @@ static bool run_check(struct check *c, struct dt_info *dti)
 	if (c->status != UNCHECKED)
 		goto out;
 
-	check_nodes_props(c, dti, dt);
+	check_nodes_props(c, dti, dt, outname);
 
 	if (c->status == UNCHECKED)
 		c->status = PASSED;
@@ -155,14 +160,14 @@ out:
 
 /* A check which always fails, for testing purposes only */
 static inline void check_always_fail(struct check *c, struct dt_info *dti,
-				     struct node *node)
+				     struct node *node, const char *outname)
 {
-	FAIL(c, "always_fail check");
+	FAIL(c, outname, "always_fail check");
 }
 CHECK(always_fail, check_always_fail, NULL);
 
 static void check_is_string(struct check *c, struct dt_info *dti,
-			    struct node *node)
+			    struct node *node, const char *outname)
 {
 	struct property *prop;
 	char *propname = c->data;
@@ -181,7 +186,7 @@ static void check_is_string(struct check *c, struct dt_info *dti,
 	ERROR(nm, check_is_string, (propname))
 
 static void check_is_cell(struct check *c, struct dt_info *dti,
-			  struct node *node)
+			  struct node *node, const char *outname)
 {
 	struct property *prop;
 	char *propname = c->data;
@@ -204,7 +209,7 @@ static void check_is_cell(struct check *c, struct dt_info *dti,
  */
 
 static void check_duplicate_node_names(struct check *c, struct dt_info *dti,
-				       struct node *node)
+				       struct node *node, const char *outname)
 {
 	struct node *child, *child2;
 
@@ -219,7 +224,7 @@ static void check_duplicate_node_names(struct check *c, struct dt_info *dti,
 ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
 
 static void check_duplicate_property_names(struct check *c, struct dt_info *dti,
-					   struct node *node)
+					   struct node *node, const char *outname)
 {
 	struct property *prop, *prop2;
 
@@ -241,27 +246,27 @@ ERROR(duplicate_property_names, check_duplicate_property_names, NULL);
 #define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
 
 static void check_node_name_chars(struct check *c, struct dt_info *dti,
-				  struct node *node)
+				  struct node *node, const char *outname)
 {
 	int n = strspn(node->name, c->data);
 
 	if (n < strlen(node->name))
-		FAIL(c, "Bad character '%c' in node %s",
+		FAIL(c, outname, "Bad character '%c' in node %s",
 		     node->name[n], node->fullpath);
 }
 ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
 
 static void check_node_name_format(struct check *c, struct dt_info *dti,
-				   struct node *node)
+				   struct node *node, const char *outname)
 {
 	if (strchr(get_unitname(node), '@'))
-		FAIL(c, "Node %s has multiple '@' characters in name",
+		FAIL(c, outname, "Node %s has multiple '@' characters in name",
 		     node->fullpath);
 }
 ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
 
 static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
-				      struct node *node)
+				      struct node *node, const char *outname)
 {
 	const char *unitname = get_unitname(node);
 	struct property *prop = get_property(node, "reg");
@@ -274,18 +279,18 @@ static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
 
 	if (prop) {
 		if (!unitname[0])
-			FAIL(c, "Node %s has a reg or ranges property, but no unit name",
+			FAIL(c, outname, "Node %s has a reg or ranges property, but no unit name",
 			    node->fullpath);
 	} else {
 		if (unitname[0])
-			FAIL(c, "Node %s has a unit name, but no reg property",
+			FAIL(c, outname, "Node %s has a unit name, but no reg property",
 			    node->fullpath);
 	}
 }
 WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
 
 static void check_property_name_chars(struct check *c, struct dt_info *dti,
-				      struct node *node)
+				      struct node *node, const char *outname)
 {
 	struct property *prop;
 
@@ -293,7 +298,7 @@ static void check_property_name_chars(struct check *c, struct dt_info *dti,
 		int n = strspn(prop->name, c->data);
 
 		if (n < strlen(prop->name))
-			FAIL(c, "Bad character '%c' in property name \"%s\", node %s",
+			FAIL(c, outname, "Bad character '%c' in property name \"%s\", node %s",
 			     prop->name[n], prop->name, node->fullpath);
 	}
 }
@@ -308,7 +313,8 @@ ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
 
 static void check_duplicate_label(struct check *c, struct dt_info *dti,
 				  const char *label, struct node *node,
-				  struct property *prop, struct marker *mark)
+				  struct property *prop, struct marker *mark,
+				  const char *outname)
 {
 	struct node *dt = dti->dt;
 	struct node *othernode = NULL;
@@ -327,35 +333,36 @@ static void check_duplicate_label(struct check *c, struct dt_info *dti,
 		return;
 
 	if ((othernode != node) || (otherprop != prop) || (othermark != mark))
-		FAIL(c, "Duplicate label '%s' on " DESCLABEL_FMT
+		FAIL(c, outname, "Duplicate label '%s' on " DESCLABEL_FMT
 		     " and " DESCLABEL_FMT,
 		     label, DESCLABEL_ARGS(node, prop, mark),
 		     DESCLABEL_ARGS(othernode, otherprop, othermark));
 }
 
 static void check_duplicate_label_node(struct check *c, struct dt_info *dti,
-				       struct node *node)
+				       struct node *node, const char *outname)
 {
 	struct label *l;
 	struct property *prop;
 
 	for_each_label(node->labels, l)
-		check_duplicate_label(c, dti, l->label, node, NULL, NULL);
+		check_duplicate_label(c, dti, l->label, node, NULL, NULL, outname);
 
 	for_each_property(node, prop) {
 		struct marker *m = prop->val.markers;
 
 		for_each_label(prop->labels, l)
-			check_duplicate_label(c, dti, l->label, node, prop, NULL);
+			check_duplicate_label(c, dti, l->label, node, prop, NULL, outname);
 
 		for_each_marker_of_type(m, LABEL)
-			check_duplicate_label(c, dti, m->ref, node, prop, m);
+			check_duplicate_label(c, dti, m->ref, node, prop, m, outname);
 	}
 }
 ERROR(duplicate_label, check_duplicate_label_node, NULL);
 
 static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
-				 struct node *node, const char *propname)
+				 struct node *node, const char *propname,
+				 const char *outname)
 {
 	struct node *root = dti->dt;
 	struct property *prop;
@@ -367,7 +374,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 		return 0;
 
 	if (prop->val.len != sizeof(cell_t)) {
-		FAIL(c, "%s has bad length (%d) %s property",
+		FAIL(c, outname, "%s has bad length (%d) %s property",
 		     node->fullpath, prop->val.len, prop->name);
 		return 0;
 	}
@@ -379,7 +386,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 			/* "Set this node's phandle equal to some
 			 * other node's phandle".  That's nonsensical
 			 * by construction. */ {
-			FAIL(c, "%s in %s is a reference to another node",
+			FAIL(c, outname, "%s in %s is a reference to another node",
 			     prop->name, node->fullpath);
 		}
 		/* But setting this node's phandle equal to its own
@@ -393,7 +400,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 	phandle = propval_cell(prop);
 
 	if ((phandle == 0) || (phandle == -1)) {
-		FAIL(c, "%s has bad value (0x%x) in %s property",
+		FAIL(c, outname, "%s has bad value (0x%x) in %s property",
 		     node->fullpath, phandle, prop->name);
 		return 0;
 	}
@@ -402,7 +409,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 }
 
 static void check_explicit_phandles(struct check *c, struct dt_info *dti,
-				    struct node *node)
+				    struct node *node, const char *outname)
 {
 	struct node *root = dti->dt;
 	struct node *other;
@@ -411,16 +418,16 @@ static void check_explicit_phandles(struct check *c, struct dt_info *dti,
 	/* Nothing should have assigned phandles yet */
 	assert(!node->phandle);
 
-	phandle = check_phandle_prop(c, dti, node, "phandle");
+	phandle = check_phandle_prop(c, dti, node, "phandle", outname);
 
-	linux_phandle = check_phandle_prop(c, dti, node, "linux,phandle");
+	linux_phandle = check_phandle_prop(c, dti, node, "linux,phandle", outname);
 
 	if (!phandle && !linux_phandle)
 		/* No valid phandles; nothing further to check */
 		return;
 
 	if (linux_phandle && phandle && (phandle != linux_phandle))
-		FAIL(c, "%s has mismatching 'phandle' and 'linux,phandle'"
+		FAIL(c, outname, "%s has mismatching 'phandle' and 'linux,phandle'"
 		     " properties", node->fullpath);
 
 	if (linux_phandle && !phandle)
@@ -428,7 +435,7 @@ static void check_explicit_phandles(struct check *c, struct dt_info *dti,
 
 	other = get_node_by_phandle(root, phandle);
 	if (other && (other != node)) {
-		FAIL(c, "%s has duplicated phandle 0x%x (seen before at %s)",
+		FAIL(c, outname, "%s has duplicated phandle 0x%x (seen before at %s)",
 		     node->fullpath, phandle, other->fullpath);
 		return;
 	}
@@ -438,7 +445,7 @@ static void check_explicit_phandles(struct check *c, struct dt_info *dti,
 ERROR(explicit_phandles, check_explicit_phandles, NULL);
 
 static void check_name_properties(struct check *c, struct dt_info *dti,
-				  struct node *node)
+				  struct node *node, const char *outname)
 {
 	struct property **pp, *prop = NULL;
 
@@ -453,7 +460,7 @@ static void check_name_properties(struct check *c, struct dt_info *dti,
 
 	if ((prop->val.len != node->basenamelen+1)
 	    || (memcmp(prop->val.val, node->name, node->basenamelen) != 0)) {
-		FAIL(c, "\"name\" property in %s is incorrect (\"%s\" instead"
+		FAIL(c, outname, "\"name\" property in %s is incorrect (\"%s\" instead"
 		     " of base node name)", node->fullpath, prop->val.val);
 	} else {
 		/* The name property is correct, and therefore redundant.
@@ -472,7 +479,7 @@ ERROR(name_properties, check_name_properties, NULL, &name_is_string);
  */
 
 static void fixup_phandle_references(struct check *c, struct dt_info *dti,
-				     struct node *node)
+				     struct node *node, const char *outname)
 {
 	struct node *dt = dti->dt;
 	struct property *prop;
@@ -488,7 +495,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 			refnode = get_node_by_ref(dt, m->ref);
 			if (! refnode) {
 				if (!(dti->dtsflags & DTSF_PLUGIN))
-					FAIL(c, "Reference to non-existent node or "
+					FAIL(c, outname, "Reference to non-existent node or "
 							"label \"%s\"\n", m->ref);
 				else /* mark the entry as unresolved */
 					*((cell_t *)(prop->val.val + m->offset)) =
@@ -505,7 +512,7 @@ ERROR(phandle_references, fixup_phandle_references, NULL,
       &duplicate_node_names, &explicit_phandles);
 
 static void fixup_path_references(struct check *c, struct dt_info *dti,
-				  struct node *node)
+				  struct node *node, const char *outname)
 {
 	struct node *dt = dti->dt;
 	struct property *prop;
@@ -520,7 +527,7 @@ static void fixup_path_references(struct check *c, struct dt_info *dti,
 
 			refnode = get_node_by_ref(dt, m->ref);
 			if (!refnode) {
-				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
+				FAIL(c, outname, "Reference to non-existent node or label \"%s\"\n",
 				     m->ref);
 				continue;
 			}
@@ -545,7 +552,7 @@ WARNING_IF_NOT_STRING(model_is_string, "model");
 WARNING_IF_NOT_STRING(status_is_string, "status");
 
 static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
-				  struct node *node)
+				  struct node *node, const char *outname)
 {
 	struct property *prop;
 
@@ -569,7 +576,7 @@ WARNING(addr_size_cells, fixup_addr_size_cells, NULL,
 	(((n)->size_cells == -1) ? 1 : (n)->size_cells)
 
 static void check_reg_format(struct check *c, struct dt_info *dti,
-			     struct node *node)
+			     struct node *node, const char *outname)
 {
 	struct property *prop;
 	int addr_cells, size_cells, entrylen;
@@ -579,26 +586,26 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
 		return; /* No "reg", that's fine */
 
 	if (!node->parent) {
-		FAIL(c, "Root node has a \"reg\" property");
+		FAIL(c, outname, "Root node has a \"reg\" property");
 		return;
 	}
 
 	if (prop->val.len == 0)
-		FAIL(c, "\"reg\" property in %s is empty", node->fullpath);
+		FAIL(c, outname, "\"reg\" property in %s is empty", node->fullpath);
 
 	addr_cells = node_addr_cells(node->parent);
 	size_cells = node_size_cells(node->parent);
 	entrylen = (addr_cells + size_cells) * sizeof(cell_t);
 
 	if (!entrylen || (prop->val.len % entrylen) != 0)
-		FAIL(c, "\"reg\" property in %s has invalid length (%d bytes) "
+		FAIL(c, outname, "\"reg\" property in %s has invalid length (%d bytes) "
 		     "(#address-cells == %d, #size-cells == %d)",
 		     node->fullpath, prop->val.len, addr_cells, size_cells);
 }
 WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
 
 static void check_ranges_format(struct check *c, struct dt_info *dti,
-				struct node *node)
+				struct node *node, const char *outname)
 {
 	struct property *prop;
 	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
@@ -608,7 +615,7 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 		return;
 
 	if (!node->parent) {
-		FAIL(c, "Root node has a \"ranges\" property");
+		FAIL(c, outname, "Root node has a \"ranges\" property");
 		return;
 	}
 
@@ -620,17 +627,17 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
 
 	if (prop->val.len == 0) {
 		if (p_addr_cells != c_addr_cells)
-			FAIL(c, "%s has empty \"ranges\" property but its "
+			FAIL(c, outname, "%s has empty \"ranges\" property but its "
 			     "#address-cells (%d) differs from %s (%d)",
 			     node->fullpath, c_addr_cells, node->parent->fullpath,
 			     p_addr_cells);
 		if (p_size_cells != c_size_cells)
-			FAIL(c, "%s has empty \"ranges\" property but its "
+			FAIL(c, outname, "%s has empty \"ranges\" property but its "
 			     "#size-cells (%d) differs from %s (%d)",
 			     node->fullpath, c_size_cells, node->parent->fullpath,
 			     p_size_cells);
 	} else if ((prop->val.len % entrylen) != 0) {
-		FAIL(c, "\"ranges\" property in %s has invalid length (%d bytes) "
+		FAIL(c, outname, "\"ranges\" property in %s has invalid length (%d bytes) "
 		     "(parent #address-cells == %d, child #address-cells == %d, "
 		     "#size-cells == %d)", node->fullpath, prop->val.len,
 		     p_addr_cells, c_addr_cells, c_size_cells);
@@ -642,7 +649,7 @@ WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
  * Style checks
  */
 static void check_avoid_default_addr_size(struct check *c, struct dt_info *dti,
-					  struct node *node)
+					  struct node *node, const char *outname)
 {
 	struct property *reg, *ranges;
 
@@ -656,11 +663,11 @@ static void check_avoid_default_addr_size(struct check *c, struct dt_info *dti,
 		return;
 
 	if (node->parent->addr_cells == -1)
-		FAIL(c, "Relying on default #address-cells value for %s",
+		FAIL(c, outname, "Relying on default #address-cells value for %s",
 		     node->fullpath);
 
 	if (node->parent->size_cells == -1)
-		FAIL(c, "Relying on default #size-cells value for %s",
+		FAIL(c, outname, "Relying on default #size-cells value for %s",
 		     node->fullpath);
 }
 WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
@@ -668,7 +675,7 @@ WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
 
 static void check_obsolete_chosen_interrupt_controller(struct check *c,
 						       struct dt_info *dti,
-						       struct node *node)
+						       struct node *node, const char *outname)
 {
 	struct node *dt = dti->dt;
 	struct node *chosen;
@@ -684,7 +691,7 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
 
 	prop = get_property(chosen, "interrupt-controller");
 	if (prop)
-		FAIL(c, "/chosen has obsolete \"interrupt-controller\" "
+		FAIL(c, outname, "/chosen has obsolete \"interrupt-controller\" "
 		     "property");
 }
 WARNING(obsolete_chosen_interrupt_controller,
@@ -774,7 +781,7 @@ void parse_checks_option(bool warn, bool error, const char *arg)
 	die("Unrecognized check name \"%s\"\n", name);
 }
 
-void process_checks(bool force, struct dt_info *dti)
+void process_checks(bool force, struct dt_info *dti, const char *outname)
 {
 	int i;
 	int error = 0;
@@ -783,7 +790,7 @@ void process_checks(bool force, struct dt_info *dti)
 		struct check *c = check_table[i];
 
 		if (c->warn || c->error)
-			error = error || run_check(c, dti);
+			error = error || run_check(c, dti, outname);
 	}
 
 	if (error) {
diff --git a/dtc.c b/dtc.c
index a4edf4c..d218729 100644
--- a/dtc.c
+++ b/dtc.c
@@ -318,7 +318,7 @@ int main(int argc, char *argv[])
 		dti->boot_cpuid_phys = cmdline_boot_cpuid;
 
 	fill_fullpaths(dti->dt, "");
-	process_checks(force, dti);
+	process_checks(force, dti, outname);
 
 	/* on a plugin, generate by default */
 	if (dti->dtsflags & DTSF_PLUGIN) {
diff --git a/dtc.h b/dtc.h
index c6f125c..5eace23 100644
--- a/dtc.h
+++ b/dtc.h
@@ -263,7 +263,7 @@ void generate_local_fixups_tree(struct dt_info *dti, char *name);
 /* Checks */
 
 void parse_checks_option(bool warn, bool error, const char *arg);
-void process_checks(bool force, struct dt_info *dti);
+void process_checks(bool force, struct dt_info *dti, const char *outname);
 
 /* Flattened trees */
 
-- 
2.11.0
