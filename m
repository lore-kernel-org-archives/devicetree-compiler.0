From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Thu, 23 Feb 2017 08:44:00 +0000
Message-ID: <1487839440.7612.76.camel@hellion.org.uk>
References: <1485767585.7612.23.camel@hellion.org.uk>
         <20170130234932.GB14879@umbus.fritz.box>
         <1485851088.7612.32.camel@hellion.org.uk>
         <20170201001654.GB30639@umbus.fritz.box>
         <20170201010004.GG30639@umbus.fritz.box>
         <1485934446.7612.36.camel@hellion.org.uk>
         <20170202050553.GF13219@umbus.fritz.box>
         <1486151046.7612.44.camel@hellion.org.uk> <20170210041122.GA25381@umbus>
         <1487520043.7612.59.camel@hellion.org.uk>
         <20170223034219.GG12577@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170223034219.GG12577-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, 2017-02-23 at 14:42 +1100, David Gibson wrote:
> Ok looks good.=A0=A0Except that since you wrote it I've merged some other
> patches adding more FAIL() calls, so this now causes compile errors.
>=20
> Can you please rebase onto current master, fix up for the new calls
> and resend.

Done.

8----------

From 011d25c56ba77f1050c4c9d1f15b531ce0a4ab9d Mon Sep 17 00:00:00 2001
From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Date: Fri, 3 Feb 2017 08:29:39 +0000
Subject: [PATCH] Print output filename as part of warning messages

For example:
src/arm/at91-ariag25.dtb: Warning (unit_address_vs_reg): Node /memory has a=
 reg or ranges property, but no unit name

If output is to stdout then the prefix is "<stdout>: ".

This helps to direct the developer to where to look when multiple files are
being compiled in parallel.

Signed-off-by: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
---
 checks.c | 83 +++++++++++++++++++++++++++++++++---------------------------=
----
 dtc.c    |  2 ++
 dtc.h    |  1 +
 3 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/checks.c b/checks.c
index cce0cca..0e8b978 100644
--- a/checks.c
+++ b/checks.c
@@ -73,16 +73,19 @@ struct check {
 	CHECK_ENTRY(_nm, _fn, _d, false, false, __VA_ARGS__)
=20
 #ifdef __GNUC__
-static inline void check_msg(struct check *c, const char *fmt, ...) __attr=
ibute__((format (printf, 2, 3)));
+static inline void check_msg(struct check *c, struct dt_info *dti,
+			     const char *fmt, ...) __attribute__((format (printf, 3, 4)));
 #endif
-static inline void check_msg(struct check *c, const char *fmt, ...)
+static inline void check_msg(struct check *c, struct dt_info *dti,
+			     const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
=20
 	if ((c->warn && (quiet < 1))
 	    || (c->error && (quiet < 2))) {
-		fprintf(stderr, "%s (%s): ",
+		fprintf(stderr, "%s: %s (%s): ",
+			strcmp(dti->outname, "-") ? dti->outname : "<stdout>",
 			(c->error) ? "ERROR" : "Warning", c->name);
 		vfprintf(stderr, fmt, ap);
 		fprintf(stderr, "\n");
@@ -90,11 +93,11 @@ static inline void check_msg(struct check *c, const cha=
r *fmt, ...)
 	va_end(ap);
 }
=20
-#define FAIL(c, ...) \
-	do { \
-		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__); \
-		(c)->status =3D FAILED; \
-		check_msg((c), __VA_ARGS__); \
+#define FAIL(c, dti, ...)						\
+	do {								\
+		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
+		(c)->status =3D FAILED;					\
+		check_msg((c), dti, __VA_ARGS__);			\
 	} while (0)
=20
 static void check_nodes_props(struct check *c, struct dt_info *dti, struct=
 node *node)
@@ -127,7 +130,7 @@ static bool run_check(struct check *c, struct dt_info *=
dti)
 		error =3D error || run_check(prq, dti);
 		if (prq->status !=3D PASSED) {
 			c->status =3D PREREQ;
-			check_msg(c, "Failed prerequisite '%s'",
+			check_msg(c, dti, "Failed prerequisite '%s'",
 				  c->prereq[i]->name);
 		}
 	}
@@ -157,7 +160,7 @@ out:
 static inline void check_always_fail(struct check *c, struct dt_info *dti,
 				     struct node *node)
 {
-	FAIL(c, "always_fail check");
+	FAIL(c, dti, "always_fail check");
 }
 CHECK(always_fail, check_always_fail, NULL);
=20
@@ -172,7 +175,7 @@ static void check_is_string(struct check *c, struct dt_=
info *dti,
 		return; /* Not present, assumed ok */
=20
 	if (!data_is_one_string(prop->val))
-		FAIL(c, "\"%s\" property in %s is not a string",
+		FAIL(c, dti, "\"%s\" property in %s is not a string",
 		     propname, node->fullpath);
 }
 #define WARNING_IF_NOT_STRING(nm, propname) \
@@ -191,7 +194,7 @@ static void check_is_cell(struct check *c, struct dt_in=
fo *dti,
 		return; /* Not present, assumed ok */
=20
 	if (prop->val.len !=3D sizeof(cell_t))
-		FAIL(c, "\"%s\" property in %s is not a single cell",
+		FAIL(c, dti, "\"%s\" property in %s is not a single cell",
 		     propname, node->fullpath);
 }
 #define WARNING_IF_NOT_CELL(nm, propname) \
@@ -213,7 +216,7 @@ static void check_duplicate_node_names(struct check *c,=
 struct dt_info *dti,
 		     child2;
 		     child2 =3D child2->next_sibling)
 			if (streq(child->name, child2->name))
-				FAIL(c, "Duplicate node name %s",
+				FAIL(c, dti, "Duplicate node name %s",
 				     child->fullpath);
 }
 ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
@@ -228,7 +231,7 @@ static void check_duplicate_property_names(struct check=
 *c, struct dt_info *dti,
 			if (prop2->deleted)
 				continue;
 			if (streq(prop->name, prop2->name))
-				FAIL(c, "Duplicate property name %s in %s",
+				FAIL(c, dti, "Duplicate property name %s in %s",
 				     prop->name, node->fullpath);
 		}
 	}
@@ -247,7 +250,7 @@ static void check_node_name_chars(struct check *c, stru=
ct dt_info *dti,
 	int n =3D strspn(node->name, c->data);
=20
 	if (n < strlen(node->name))
-		FAIL(c, "Bad character '%c' in node %s",
+		FAIL(c, dti, "Bad character '%c' in node %s",
 		     node->name[n], node->fullpath);
 }
 ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
@@ -258,7 +261,7 @@ static void check_node_name_chars_strict(struct check *=
c, struct dt_info *dti,
 	int n =3D strspn(node->name, c->data);
=20
 	if (n < node->basenamelen)
-		FAIL(c, "Character '%c' not recommended in node %s",
+		FAIL(c, dti, "Character '%c' not recommended in node %s",
 		     node->name[n], node->fullpath);
 }
 CHECK(node_name_chars_strict, check_node_name_chars_strict, PROPNODECHARSS=
TRICT);
@@ -267,7 +270,7 @@ static void check_node_name_format(struct check *c, str=
uct dt_info *dti,
 				   struct node *node)
 {
 	if (strchr(get_unitname(node), '@'))
-		FAIL(c, "Node %s has multiple '@' characters in name",
+		FAIL(c, dti, "Node %s has multiple '@' characters in name",
 		     node->fullpath);
 }
 ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
@@ -286,11 +289,11 @@ static void check_unit_address_vs_reg(struct check *c=
, struct dt_info *dti,
=20
 	if (prop) {
 		if (!unitname[0])
-			FAIL(c, "Node %s has a reg or ranges property, but no unit name",
+			FAIL(c, dti, "Node %s has a reg or ranges property, but no unit name",
 			    node->fullpath);
 	} else {
 		if (unitname[0])
-			FAIL(c, "Node %s has a unit name, but no reg property",
+			FAIL(c, dti, "Node %s has a unit name, but no reg property",
 			    node->fullpath);
 	}
 }
@@ -305,7 +308,7 @@ static void check_property_name_chars(struct check *c, =
struct dt_info *dti,
 		int n =3D strspn(prop->name, c->data);
=20
 		if (n < strlen(prop->name))
-			FAIL(c, "Bad character '%c' in property name \"%s\", node %s",
+			FAIL(c, dti, "Bad character '%c' in property name \"%s\", node %s",
 			     prop->name[n], prop->name, node->fullpath);
 	}
 }
@@ -337,7 +340,7 @@ static void check_property_name_chars_strict(struct che=
ck *c,
 			n =3D strspn(name, c->data);
 		}
 		if (n < strlen(name))
-			FAIL(c, "Character '%c' not recommended in property name \"%s\", node %=
s",
+			FAIL(c, dti, "Character '%c' not recommended in property name \"%s\", n=
ode %s",
 			     name[n], prop->name, node->fullpath);
 	}
 }
@@ -371,7 +374,7 @@ static void check_duplicate_label(struct check *c, stru=
ct dt_info *dti,
 		return;
=20
 	if ((othernode !=3D node) || (otherprop !=3D prop) || (othermark !=3D mar=
k))
-		FAIL(c, "Duplicate label '%s' on " DESCLABEL_FMT
+		FAIL(c, dti, "Duplicate label '%s' on " DESCLABEL_FMT
 		     " and " DESCLABEL_FMT,
 		     label, DESCLABEL_ARGS(node, prop, mark),
 		     DESCLABEL_ARGS(othernode, otherprop, othermark));
@@ -411,7 +414,7 @@ static cell_t check_phandle_prop(struct check *c, struc=
t dt_info *dti,
 		return 0;
=20
 	if (prop->val.len !=3D sizeof(cell_t)) {
-		FAIL(c, "%s has bad length (%d) %s property",
+		FAIL(c, dti, "%s has bad length (%d) %s property",
 		     node->fullpath, prop->val.len, prop->name);
 		return 0;
 	}
@@ -423,7 +426,7 @@ static cell_t check_phandle_prop(struct check *c, struc=
t dt_info *dti,
 			/* "Set this node's phandle equal to some
 			 * other node's phandle".  That's nonsensical
 			 * by construction. */ {
-			FAIL(c, "%s in %s is a reference to another node",
+			FAIL(c, dti, "%s in %s is a reference to another node",
 			     prop->name, node->fullpath);
 		}
 		/* But setting this node's phandle equal to its own
@@ -437,7 +440,7 @@ static cell_t check_phandle_prop(struct check *c, struc=
t dt_info *dti,
 	phandle =3D propval_cell(prop);
=20
 	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
-		FAIL(c, "%s has bad value (0x%x) in %s property",
+		FAIL(c, dti, "%s has bad value (0x%x) in %s property",
 		     node->fullpath, phandle, prop->name);
 		return 0;
 	}
@@ -464,7 +467,7 @@ static void check_explicit_phandles(struct check *c, st=
ruct dt_info *dti,
 		return;
=20
 	if (linux_phandle && phandle && (phandle !=3D linux_phandle))
-		FAIL(c, "%s has mismatching 'phandle' and 'linux,phandle'"
+		FAIL(c, dti, "%s has mismatching 'phandle' and 'linux,phandle'"
 		     " properties", node->fullpath);
=20
 	if (linux_phandle && !phandle)
@@ -472,7 +475,7 @@ static void check_explicit_phandles(struct check *c, st=
ruct dt_info *dti,
=20
 	other =3D get_node_by_phandle(root, phandle);
 	if (other && (other !=3D node)) {
-		FAIL(c, "%s has duplicated phandle 0x%x (seen before at %s)",
+		FAIL(c, dti, "%s has duplicated phandle 0x%x (seen before at %s)",
 		     node->fullpath, phandle, other->fullpath);
 		return;
 	}
@@ -497,7 +500,7 @@ static void check_name_properties(struct check *c, stru=
ct dt_info *dti,
=20
 	if ((prop->val.len !=3D node->basenamelen+1)
 	    || (memcmp(prop->val.val, node->name, node->basenamelen) !=3D 0)) {
-		FAIL(c, "\"name\" property in %s is incorrect (\"%s\" instead"
+		FAIL(c, dti, "\"name\" property in %s is incorrect (\"%s\" instead"
 		     " of base node name)", node->fullpath, prop->val.val);
 	} else {
 		/* The name property is correct, and therefore redundant.
@@ -532,7 +535,7 @@ static void fixup_phandle_references(struct check *c, s=
truct dt_info *dti,
 			refnode =3D get_node_by_ref(dt, m->ref);
 			if (! refnode) {
 				if (!(dti->dtsflags & DTSF_PLUGIN))
-					FAIL(c, "Reference to non-existent node or "
+					FAIL(c, dti, "Reference to non-existent node or "
 							"label \"%s\"\n", m->ref);
 				else /* mark the entry as unresolved */
 					*((cell_t *)(prop->val.val + m->offset)) =3D
@@ -564,7 +567,7 @@ static void fixup_path_references(struct check *c, stru=
ct dt_info *dti,
=20
 			refnode =3D get_node_by_ref(dt, m->ref);
 			if (!refnode) {
-				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
+				FAIL(c, dti, "Reference to non-existent node or label \"%s\"\n",
 				     m->ref);
 				continue;
 			}
@@ -623,19 +626,19 @@ static void check_reg_format(struct check *c, struct =
dt_info *dti,
 		return; /* No "reg", that's fine */
=20
 	if (!node->parent) {
-		FAIL(c, "Root node has a \"reg\" property");
+		FAIL(c, dti, "Root node has a \"reg\" property");
 		return;
 	}
=20
 	if (prop->val.len =3D=3D 0)
-		FAIL(c, "\"reg\" property in %s is empty", node->fullpath);
+		FAIL(c, dti, "\"reg\" property in %s is empty", node->fullpath);
=20
 	addr_cells =3D node_addr_cells(node->parent);
 	size_cells =3D node_size_cells(node->parent);
 	entrylen =3D (addr_cells + size_cells) * sizeof(cell_t);
=20
 	if (!entrylen || (prop->val.len % entrylen) !=3D 0)
-		FAIL(c, "\"reg\" property in %s has invalid length (%d bytes) "
+		FAIL(c, dti, "\"reg\" property in %s has invalid length (%d bytes) "
 		     "(#address-cells =3D=3D %d, #size-cells =3D=3D %d)",
 		     node->fullpath, prop->val.len, addr_cells, size_cells);
 }
@@ -652,7 +655,7 @@ static void check_ranges_format(struct check *c, struct=
 dt_info *dti,
 		return;
=20
 	if (!node->parent) {
-		FAIL(c, "Root node has a \"ranges\" property");
+		FAIL(c, dti, "Root node has a \"ranges\" property");
 		return;
 	}
=20
@@ -664,17 +667,17 @@ static void check_ranges_format(struct check *c, stru=
ct dt_info *dti,
=20
 	if (prop->val.len =3D=3D 0) {
 		if (p_addr_cells !=3D c_addr_cells)
-			FAIL(c, "%s has empty \"ranges\" property but its "
+			FAIL(c, dti, "%s has empty \"ranges\" property but its "
 			     "#address-cells (%d) differs from %s (%d)",
 			     node->fullpath, c_addr_cells, node->parent->fullpath,
 			     p_addr_cells);
 		if (p_size_cells !=3D c_size_cells)
-			FAIL(c, "%s has empty \"ranges\" property but its "
+			FAIL(c, dti, "%s has empty \"ranges\" property but its "
 			     "#size-cells (%d) differs from %s (%d)",
 			     node->fullpath, c_size_cells, node->parent->fullpath,
 			     p_size_cells);
 	} else if ((prop->val.len % entrylen) !=3D 0) {
-		FAIL(c, "\"ranges\" property in %s has invalid length (%d bytes) "
+		FAIL(c, dti, "\"ranges\" property in %s has invalid length (%d bytes) "
 		     "(parent #address-cells =3D=3D %d, child #address-cells =3D=3D %d, "
 		     "#size-cells =3D=3D %d)", node->fullpath, prop->val.len,
 		     p_addr_cells, c_addr_cells, c_size_cells);
@@ -700,11 +703,11 @@ static void check_avoid_default_addr_size(struct chec=
k *c, struct dt_info *dti,
 		return;
=20
 	if (node->parent->addr_cells =3D=3D -1)
-		FAIL(c, "Relying on default #address-cells value for %s",
+		FAIL(c, dti, "Relying on default #address-cells value for %s",
 		     node->fullpath);
=20
 	if (node->parent->size_cells =3D=3D -1)
-		FAIL(c, "Relying on default #size-cells value for %s",
+		FAIL(c, dti, "Relying on default #size-cells value for %s",
 		     node->fullpath);
 }
 WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
@@ -728,7 +731,7 @@ static void check_obsolete_chosen_interrupt_controller(=
struct check *c,
=20
 	prop =3D get_property(chosen, "interrupt-controller");
 	if (prop)
-		FAIL(c, "/chosen has obsolete \"interrupt-controller\" "
+		FAIL(c, dti, "/chosen has obsolete \"interrupt-controller\" "
 		     "property");
 }
 WARNING(obsolete_chosen_interrupt_controller,
diff --git a/dtc.c b/dtc.c
index a4edf4c..9c30c33 100644
--- a/dtc.c
+++ b/dtc.c
@@ -309,6 +309,8 @@ int main(int argc, char *argv[])
 	else
 		die("Unknown input format \"%s\"\n", inform);
=20
+	dti->outname =3D outname;
+
 	if (depfile) {
 		fputc('\n', depfile);
 		fclose(depfile);
diff --git a/dtc.h b/dtc.h
index c6f125c..1ac2a1e 100644
--- a/dtc.h
+++ b/dtc.h
@@ -246,6 +246,7 @@ struct dt_info {
 	struct reserve_info *reservelist;
 	uint32_t boot_cpuid_phys;
 	struct node *dt;		/* the device tree */
+	const char *outname;		/* filename being written to, "-" for stdout */
 };
=20
 /* DTS version flags definitions */
--=20
2.11.0

