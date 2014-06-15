From: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Subject: [PATCH] Microsoft Visual C patches
Date: Sun, 15 Jun 2014 18:46:16 +0300
Message-ID: <539DBFC8.4050204@errapartengineering.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030204000609060800000609"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is a multi-part message in MIME format.
--------------030204000609060800000609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hallo,


The attached patches are the result of compiling the dtc with the 
Microsoft Visual C (MSVC) in order to be able to run the dtc under 
Microsoft Windows.

Short descriptions of the patches:
checks:		MSVC is unable to handle 0-sized array literals.
fopen:		Binary files should be opened in binary mode.
signed-char:	For MSVC, char defaults to signed char.
dtc-header:
   1) Variadic macro in the form "args..." is a GCC extension.
   2) MSVC requires 0 to be present in a struct literal.

On a Linux, all tests pass when these patches have been applied.

We have been using the dtc on Windows computers for a few days and 
haven't had any problems so far. In the case people are interested in 
having the MSVC project file(s) and the few lightweight compatibility 
functions required for compilation, let me know and I can clean them up 
for public use.


best regards,
Andrei

--------------030204000609060800000609
Content-Type: text/plain; charset=windows-1257;
 name="checks.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="checks.patch"

diff --git a/checks.c b/checks.c
index 47eda65..cf07864 100644
--- a/checks.c
+++ b/checks.c
@@ -61,17 +61,19 @@ struct check {
 #define CHECK_ENTRY(nm, tfn, nfn, pfn, d, w, e, ...)	       \
 	static struct check *nm##_prereqs[] = { __VA_ARGS__ }; \
 	static struct check nm = { \
-		.name = #nm, \
-		.tree_fn = (tfn), \
-		.node_fn = (nfn), \
-		.prop_fn = (pfn), \
-		.data = (d), \
-		.warn = (w), \
-		.error = (e), \
-		.status = UNCHECKED, \
-		.num_prereqs = ARRAY_SIZE(nm##_prereqs), \
-		.prereq = nm##_prereqs, \
+		#nm, \
+		(tfn), \
+		(nfn), \
+		(pfn), \
+		(d), \
+		(w), \
+		(e), \
+		UNCHECKED, \
+		false, \
+		ARRAY_SIZE(nm##_prereqs), \
+		nm##_prereqs \
 	};
+
 #define WARNING(nm, tfn, nfn, pfn, d, ...) \
 	CHECK_ENTRY(nm, tfn, nfn, pfn, d, true, false, __VA_ARGS__)
 #define ERROR(nm, tfn, nfn, pfn, d, ...) \
@@ -153,7 +155,7 @@ static bool run_check(struct check *c, struct node *dt)
 
 	c->inprogress = true;
 
-	for (i = 0; i < c->num_prereqs; i++) {
+	for (i = 0; i < c->num_prereqs && c->prereq[i]!=NULL; i++) {
 		struct check *prq = c->prereq[i];
 		error = error || run_check(prq, dt);
 		if (prq->status != PASSED) {
@@ -192,7 +194,7 @@ static inline void check_always_fail(struct check *c, struct node *dt)
 {
 	FAIL(c, "always_fail check");
 }
-TREE_CHECK(always_fail, NULL);
+TREE_CHECK(always_fail, NULL, 0);
 
 static void check_is_string(struct check *c, struct node *root,
 			    struct node *node)
@@ -209,9 +211,9 @@ static void check_is_string(struct check *c, struct node *root,
 		     propname, node->fullpath);
 }
 #define WARNING_IF_NOT_STRING(nm, propname) \
-	WARNING(nm, NULL, check_is_string, NULL, (propname))
+	WARNING(nm, NULL, check_is_string, NULL, (propname), 0)
 #define ERROR_IF_NOT_STRING(nm, propname) \
-	ERROR(nm, NULL, check_is_string, NULL, (propname))
+	ERROR(nm, NULL, check_is_string, NULL, (propname), 0)
 
 static void check_is_cell(struct check *c, struct node *root,
 			  struct node *node)
@@ -228,9 +230,9 @@ static void check_is_cell(struct check *c, struct node *root,
 		     propname, node->fullpath);
 }
 #define WARNING_IF_NOT_CELL(nm, propname) \
-	WARNING(nm, NULL, check_is_cell, NULL, (propname))
+	WARNING(nm, NULL, check_is_cell, NULL, (propname), 0)
 #define ERROR_IF_NOT_CELL(nm, propname) \
-	ERROR(nm, NULL, check_is_cell, NULL, (propname))
+	ERROR(nm, NULL, check_is_cell, NULL, (propname), 0)
 
 /*
  * Structural check functions
@@ -249,7 +251,7 @@ static void check_duplicate_node_names(struct check *c, struct node *dt,
 				FAIL(c, "Duplicate node name %s",
 				     child->fullpath);
 }
-NODE_ERROR(duplicate_node_names, NULL);
+NODE_ERROR(duplicate_node_names, NULL, 0);
 
 static void check_duplicate_property_names(struct check *c, struct node *dt,
 					   struct node *node)
@@ -266,7 +268,7 @@ static void check_duplicate_property_names(struct check *c, struct node *dt,
 		}
 	}
 }
-NODE_ERROR(duplicate_property_names, NULL);
+NODE_ERROR(duplicate_property_names, NULL, 0);
 
 #define LOWERCASE	"abcdefghijklmnopqrstuvwxyz"
 #define UPPERCASE	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
@@ -282,7 +284,7 @@ static void check_node_name_chars(struct check *c, struct node *dt,
 		FAIL(c, "Bad character '%c' in node %s",
 		     node->name[n], node->fullpath);
 }
-NODE_ERROR(node_name_chars, PROPNODECHARS "@");
+NODE_ERROR(node_name_chars, PROPNODECHARS "@", 0);
 
 static void check_node_name_format(struct check *c, struct node *dt,
 				   struct node *node)
@@ -302,7 +304,7 @@ static void check_property_name_chars(struct check *c, struct node *dt,
 		FAIL(c, "Bad character '%c' in property name \"%s\", node %s",
 		     prop->name[n], prop->name, node->fullpath);
 }
-PROP_ERROR(property_name_chars, PROPNODECHARS);
+PROP_ERROR(property_name_chars, PROPNODECHARS, 0);
 
 #define DESCLABEL_FMT	"%s%s%s%s%s"
 #define DESCLABEL_ARGS(node,prop,mark)		\
@@ -358,7 +360,7 @@ static void check_duplicate_label_prop(struct check *c, struct node *dt,
 		check_duplicate_label(c, dt, m->ref, node, prop, m);
 }
 ERROR(duplicate_label, NULL, check_duplicate_label_node,
-      check_duplicate_label_prop, NULL);
+      check_duplicate_label_prop, NULL, 0);
 
 static void check_explicit_phandles(struct check *c, struct node *root,
 				    struct node *node, struct property *prop)
@@ -417,7 +419,7 @@ static void check_explicit_phandles(struct check *c, struct node *root,
 
 	node->phandle = phandle;
 }
-PROP_ERROR(explicit_phandles, NULL);
+PROP_ERROR(explicit_phandles, NULL, 0);
 
 static void check_name_properties(struct check *c, struct node *root,
 				  struct node *node)
@@ -649,7 +651,7 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
 		FAIL(c, "/chosen has obsolete \"interrupt-controller\" "
 		     "property");
 }
-TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
+TREE_WARNING(obsolete_chosen_interrupt_controller, NULL, 0);
 
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
@@ -678,7 +680,7 @@ static void enable_warning_error(struct check *c, bool warn, bool error)
 
 	/* Raising level, also raise it for prereqs */
 	if ((warn && !c->warn) || (error && !c->error))
-		for (i = 0; i < c->num_prereqs; i++)
+		for (i = 0; i < c->num_prereqs && c->prereq[i] != NULL; i++)
 			enable_warning_error(c->prereq[i], warn, error);
 
 	c->warn = c->warn || warn;
@@ -696,7 +698,7 @@ static void disable_warning_error(struct check *c, bool warn, bool error)
 			struct check *cc = check_table[i];
 			int j;
 
-			for (j = 0; j < cc->num_prereqs; j++)
+			for (j = 0; j < cc->num_prereqs && cc->prereq[j] != NULL; j++)
 				if (cc->prereq[j] == c)
 					disable_warning_error(cc, warn, error);
 		}

--------------030204000609060800000609
Content-Type: text/plain; charset=windows-1257;
 name="fopen.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fopen.patch"

diff --git a/fstree.c b/fstree.c
index 4d2791c..6d1beec 100644
--- a/fstree.c
+++ b/fstree.c
@@ -52,7 +52,7 @@ static struct node *read_fstree(const char *dirname)
 			struct property *prop;
 			FILE *pfile;
 
-			pfile = fopen(tmpname, "r");
+			pfile = fopen(tmpname, "rb");
 			if (! pfile) {
 				fprintf(stderr,
 					"WARNING: Cannot open %s: %s\n",
diff --git a/srcpos.c b/srcpos.c
index 4549773..f534c22 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -77,7 +77,7 @@ static char *try_open(const char *dirname, const char *fname, FILE **fp)
 	else
 		fullname = join_path(dirname, fname);
 
-	*fp = fopen(fullname, "r");
+	*fp = fopen(fullname, "rb");
 	if (!*fp) {
 		free(fullname);
 		fullname = NULL;
diff --git a/dtc.c b/dtc.c
index d36ccdc..e3665b6 100644
--- a/dtc.c
+++ b/dtc.c
@@ -237,7 +237,7 @@ int main(int argc, char *argv[])
 	if (streq(outname, "-")) {
 		outf = stdout;
 	} else {
-		outf = fopen(outname, "w");
+		outf = fopen(outname, "wb");
 		if (! outf)
 			die("Couldn't open output file %s: %s\n",
 			    outname, strerror(errno));

--------------030204000609060800000609
Content-Type: text/plain; charset=windows-1257;
 name="signed-char.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="signed-char.patch"

diff --git a/treesource.c b/treesource.c
index bf7a626..2386b93 100644
--- a/treesource.c
+++ b/treesource.c
@@ -178,7 +178,7 @@ static void write_propval_bytes(FILE *f, struct data val)
 			m = m->next;
 		}
 
-		fprintf(f, "%02hhx", *bp++);
+		fprintf(f, "%02hhx", (unsigned char)(*bp++));
 		if ((const void *)bp >= propend)
 			break;
 		fprintf(f, " ");

--------------030204000609060800000609
Content-Type: text/plain; charset=windows-1257;
 name="dtc-header.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dtc-header.patch"

diff --git a/dtc.h b/dtc.h
index 20de073..a9d1775 100644
--- a/dtc.h
+++ b/dtc.h
@@ -38,9 +38,9 @@
 #include "util.h"
 
 #ifdef DEBUG
-#define debug(fmt,args...)	printf(fmt, ##args)
+#define debug(...)		printf(__VA_ARGS__)
 #else
-#define debug(fmt,args...)
+#define debug(...)
 #endif
 
 
@@ -87,8 +87,7 @@ struct data {
 	struct marker *markers;
 };
 
-
-#define empty_data ((struct data){ /* all .members = 0 or NULL */ })
+#define empty_data ((struct data){ 0 /* all .members = 0 or NULL */ })
 
 #define for_each_marker(m) \
 	for (; (m); (m) = (m)->next)

--------------030204000609060800000609--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
