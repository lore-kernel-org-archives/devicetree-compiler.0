From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v5 1/2] dtc: dts source location annotation
Date: Wed, 30 Sep 2015 20:35:23 -0700
Message-ID: <560CA9FB.6050700@gmail.com>
References: <560CA87E.1010103@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=3CZ8ZZyMPTGS1dkZRwo6mbAdJdDkbzIatLoPSICmRbE=;
        b=0PJ2scQvw7oXUbhJOGlPqglsNAnhy6ksAtSWTFnK5IoEl44dk5eZXE6N3dcmZI6vnY
         nQDCivVyP6tXcqjP4DW5GOoNqixuIV+Mbs3vdnzxAg+Kbv4AoE4RKJFyBMs9DdGQmA+9
         aE9ksOzK3Q5mVZh1mUhDvHGr/aTEZDaHWdrF3CCtBynSUGuXJaM0q7grYCfuzwqHUHn6
         wZXkGbJptJhh5agfxqaxzV7VgPp4SMsiFuvkcC6g23ujhIAgmLAJCaTziUCS+r8StcfX
         Dfd5LFNwsBGs2YVDxzzKkb0zxqw5NQjY9E9uV5bF7f+4nBgzas6AEojQtE9YBHRbFq4a
         BHfA==
In-Reply-To: <560CA87E.1010103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Proof of concept patch.

Annotates input source file and line number of nodes and properties
as comments in output .dts file when --annotate flag is supplied.


A common dts source file convention is for a system .dts file
to include default SOC and/or device .dtsi files and then add
additional system specific properties or over-ride property values
from the .dtsi files.  It can be a time consuming and error prone
exercise to determine exactly what nodes, properties, and property
values are in the final .dtb binary blob and where they originated.

Modify the dtc compiler to read a (possibly cpp pre-processed) .dts
file and for the output .dts annotate each node and property with
the corresponding source location.

As an example, one device tree node for the dragonboard in the
Linux kernel source tree is: 

  sdhci@f9824900 { /* qcom-apq8074-dragonboard.dts:14 */
        compatible = "qcom,sdhci-msm-v4"; /* qcom-msm8974.dtsi:240 */
        reg = <0xf9824900 0x11c 0xf9824000 0x800>; /* qcom-msm8974.dtsi:241 */
        reg-names = "hc_mem", "core_mem"; /* qcom-msm8974.dtsi:242 */
        interrupts = <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* qcom-msm8974.dtsi:243 */
        interrupt-names = "hc_irq", "pwr_irq"; /* qcom-msm8974.dtsi:244 */
        clocks = <0xd 0xd8 0xd 0xd7>; /* qcom-msm8974.dtsi:245 */
        clock-names = "core", "iface"; /* qcom-msm8974.dtsi:246 */
        status = "ok"; /* qcom-apq8074-dragonboard.dts:17 */
        bus-width = <0x8>; /* qcom-apq8074-dragonboard.dts:15 */
        non-removable; /* qcom-apq8074-dragonboard.dts:16 */
  }; /* qcom-apq8074-dragonboard.dts:18 */


qcom-apq8074-dragonboard.dts:
   - last referenced the sdhci node
   - changed the value of the "status" property from "disabled" to "ok"
   - added two properties, "bus-width" and "non-removable"

qcom-msm8974.dtsi:
   - initially set the value the "status" property to "disabled"
     (not visible in the annotated .dts)
   - provided all of the other property values


When the dtc compiler is run within the Linux kernel build system,
the path of the source files will be the full absolute path, just
as seen for gcc warnings and errors.  I always trim away the path
leading up to the Linux kernel source tree by passing the kernel
build output through a sed pipe.  I have done the same to the
above example to remove the excessive verbosity in the source paths.

Implementation notes:

  - The source location of each node and property is saved in the
    respective node or property during the parse phase because
    the source location information no longer available when the
    final values are written out from dt_to_source() and the
    functions that it calls.

  - A check is added to dtc.c to ensure that input and output format
    are both device tree source.  An alternate choice would be to
    turn off the --annotate flag if either the input file or the
    output file is not device tree source.  In the alternate case,
    the disabling of --annotate could be silent or a warning could
    be issued.


Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 dtc-parser.y |   20 ++++++++++++++++----
 dtc.c        |    9 +++++++++
 dtc.h        |    7 +++++++
 livetree.c   |   20 ++++++++++++++++++++
 srcpos.c     |   42 ++++++++++++++++++++++++++++++++++++++++++
 srcpos.h     |    2 ++
 treesource.c |   38 +++++++++++++++++++++++++++++++++-----
 7 files changed, 129 insertions(+), 9 deletions(-)

Index: b/dtc.h
===================================================================
--- a/dtc.h
+++ b/dtc.h
@@ -54,6 +54,7 @@ extern int reservenum;		/* Number of mem
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
+extern bool annotate;		/* annotate .dts with input source location */
 
 #define PHANDLE_LEGACY	0x1
 #define PHANDLE_EPAPR	0x2
@@ -140,6 +141,7 @@ struct property {
 	struct property *next;
 
 	struct label *labels;
+	struct srcpos *srcpos;
 };
 
 struct node {
@@ -158,6 +160,8 @@ struct node {
 	int addr_cells, size_cells;
 
 	struct label *labels;
+	struct srcpos *begin_srcpos;
+	struct srcpos *end_srcpos;
 };
 
 #define for_each_label_withdel(l0, l) \
@@ -185,6 +189,7 @@ void add_label(struct label **labels, ch
 void delete_labels(struct label **labels);
 
 struct property *build_property(char *name, struct data val);
+void srcpos_property(struct property *prop, struct srcpos *srcpos);
 struct property *build_property_delete(char *name);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
@@ -192,6 +197,8 @@ struct property *reverse_properties(stru
 struct node *build_node(struct property *proplist, struct node *children);
 struct node *build_node_delete(void);
 struct node *name_node(struct node *node, char *name);
+void begin_srcpos_node(struct node *node, struct srcpos *srcpos);
+void end_srcpos_node(struct node *node, struct srcpos *srcpos);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
 
Index: b/livetree.c
===================================================================
--- a/livetree.c
+++ b/livetree.c
@@ -19,6 +19,7 @@
  */
 
 #include "dtc.h"
+#include "srcpos.h"
 
 /*
  * Tree building functions
@@ -74,6 +75,11 @@ struct property *build_property_delete(c
 	return new;
 }
 
+void srcpos_property(struct property *prop, struct srcpos *srcpos)
+{
+	prop->srcpos = srcpos_copy_all(srcpos);
+}
+
 struct property *chain_property(struct property *first, struct property *list)
 {
 	assert(first->next == NULL);
@@ -134,6 +140,16 @@ struct node *name_node(struct node *node
 	return node;
 }
 
+void begin_srcpos_node(struct node *node, struct srcpos *srcpos)
+{
+	node->begin_srcpos = srcpos_copy_all(srcpos);
+}
+
+void end_srcpos_node(struct node *node, struct srcpos *srcpos)
+{
+	node->end_srcpos = srcpos_copy_all(srcpos);
+}
+
 struct node *merge_nodes(struct node *old_node, struct node *new_node)
 {
 	struct property *new_prop, *old_prop;
@@ -169,6 +185,7 @@ struct node *merge_nodes(struct node *ol
 
 				old_prop->val = new_prop->val;
 				old_prop->deleted = 0;
+				old_prop->srcpos = new_prop->srcpos;
 				free(new_prop);
 				new_prop = NULL;
 				break;
@@ -209,6 +226,9 @@ struct node *merge_nodes(struct node *ol
 			add_child(old_node, new_child);
 	}
 
+	old_node->begin_srcpos = new_node->begin_srcpos;
+	old_node->end_srcpos = new_node->end_srcpos;
+
 	/* The new node contents are now merged into the old node.  Free
 	 * the new node. */
 	free(new_node);
Index: b/treesource.c
===================================================================
--- a/treesource.c
+++ b/treesource.c
@@ -200,9 +200,16 @@ static void write_propval(FILE *f, struc
 	int nnotstring = 0, nnul = 0;
 	int nnotstringlbl = 0, nnotcelllbl = 0;
 	int i;
+	char *srcstr;
 
 	if (len == 0) {
-		fprintf(f, ";\n");
+		if (annotate) {
+			srcstr = srcpos_string_short(prop->srcpos);
+			fprintf(f, "; /* %s */\n", srcstr);
+			free(srcstr);
+		} else {
+			fprintf(f, ";\n");
+		}
 		return;
 	}
 
@@ -230,7 +237,13 @@ static void write_propval(FILE *f, struc
 		write_propval_bytes(f, prop->val);
 	}
 
-	fprintf(f, ";\n");
+	if (annotate) {
+		srcstr = srcpos_string_short(prop->srcpos);
+		fprintf(f, "; /* %s */\n", srcstr);
+		free(srcstr);
+	} else {
+		fprintf(f, ";\n");
+	}
 }
 
 static void write_tree_source_node(FILE *f, struct node *tree, int level)
@@ -238,14 +251,23 @@ static void write_tree_source_node(FILE
 	struct property *prop;
 	struct node *child;
 	struct label *l;
+	char *srcstr;
 
 	write_prefix(f, level);
 	for_each_label(tree->labels, l)
 		fprintf(f, "%s: ", l->label);
+
 	if (tree->name && (*tree->name))
-		fprintf(f, "%s {\n", tree->name);
+		fprintf(f, "%s {", tree->name);
 	else
-		fprintf(f, "/ {\n");
+		fprintf(f, "/ {");
+	if (annotate) {
+		srcstr = srcpos_string_short(tree->begin_srcpos);
+		fprintf(f, " /* %s */\n", srcstr);
+		free(srcstr);
+	} else {
+		fprintf(f, "\n");
+	}
 
 	for_each_property(tree, prop) {
 		write_prefix(f, level+1);
@@ -259,7 +281,13 @@ static void write_tree_source_node(FILE
 		write_tree_source_node(f, child, level+1);
 	}
 	write_prefix(f, level);
-	fprintf(f, "};\n");
+	if (annotate) {
+		srcstr = srcpos_string_short(tree->end_srcpos);
+		fprintf(f, "}; /* %s */\n", srcstr);
+		free(srcstr);
+	} else {
+		fprintf(f, "};\n");
+	}
 }
 
 
Index: b/dtc.c
===================================================================
--- a/dtc.c
+++ b/dtc.c
@@ -29,6 +29,7 @@ int reservenum;		/* Number of memory res
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
+bool annotate = false;	/* annotate .dts with input source location */
 
 static void fill_fullpaths(struct node *tree, const char *prefix)
 {
@@ -71,6 +72,7 @@ static struct option const usage_long_op
 	{"error",             a_argument, NULL, 'E'},
 	{"help",             no_argument, NULL, 'h'},
 	{"version",          no_argument, NULL, 'v'},
+	{"annotate",         no_argument, NULL, 'A'},
 	{NULL,               no_argument, NULL, 0x0},
 };
 static const char * const usage_opts_help[] = {
@@ -101,6 +103,7 @@ static const char * const usage_opts_hel
 	"\n\tEnable/disable errors (prefix with \"no-\")",
 	"\n\tPrint this help and exit",
 	"\n\tPrint version and exit",
+	"\n\tAnnotate output .dts with input source file and line",
 	NULL,
 };
 
@@ -125,6 +128,9 @@ int main(int argc, char *argv[])
 
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
+		case 'A':
+			annotate = true;
+			break;
 		case 'I':
 			inform = optarg;
 			break;
@@ -213,6 +219,9 @@ int main(int argc, char *argv[])
 		fprintf(depfile, "%s:", outname);
 	}
 
+	if (annotate && (!streq(inform, "dts") || !streq(outform, "dts")))
+		die("--annotate requires -I dts -O dts\n");
+
 	if (streq(inform, "dts"))
 		bi = dt_from_source(arg);
 	else if (streq(inform, "fs"))
Index: b/dtc-parser.y
===================================================================
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -134,10 +134,12 @@ memreserve:
 devicetree:
 	  '/' nodedef
 		{
+			begin_srcpos_node($2, &@1);
 			$$ = name_node($2, "");
 		}
 	| devicetree '/' nodedef
 		{
+			begin_srcpos_node($3, &@2);
 			$$ = merge_nodes($1, $3);
 		}
 
@@ -146,20 +148,25 @@ devicetree:
 			struct node *target = get_node_by_ref($1, $3);
 
 			add_label(&target->labels, $2);
-			if (target)
+			if (target) {
+				begin_srcpos_node($4, &@3);
 				merge_nodes(target, $4);
-			else
+			} else {
 				ERROR(&@3, "Label or path %s not found", $3);
+			}
 			$$ = $1;
 		}
 	| devicetree DT_REF nodedef
 		{
 			struct node *target = get_node_by_ref($1, $2);
 
-			if (target)
+
+			if (target) {
+				begin_srcpos_node($3, &@2);
 				merge_nodes(target, $3);
-			else
+			} else {
 				ERROR(&@2, "Label or path %s not found", $2);
+			}
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE DT_REF ';'
@@ -180,6 +187,7 @@ nodedef:
 	  '{' proplist subnodes '}' ';'
 		{
 			$$ = build_node($2, $3);
+			end_srcpos_node($$, &@4);
 		}
 	;
 
@@ -198,10 +206,12 @@ propdef:
 	  DT_PROPNODENAME '=' propdata ';'
 		{
 			$$ = build_property($1, $3);
+			srcpos_property($$, &@1);
 		}
 	| DT_PROPNODENAME ';'
 		{
 			$$ = build_property($1, empty_data);
+			srcpos_property($$, &@1);
 		}
 	| DT_DEL_PROP DT_PROPNODENAME ';'
 		{
@@ -456,11 +466,13 @@ subnodes:
 subnode:
 	  DT_PROPNODENAME nodedef
 		{
+			begin_srcpos_node($2, &@1);
 			$$ = name_node($2, $1);
 		}
 	| DT_DEL_NODE DT_PROPNODENAME ';'
 		{
 			$$ = name_node(build_node_delete(), $2);
+			begin_srcpos_node($$, &@2);
 		}
 	| DT_LABEL subnode
 		{
Index: b/srcpos.c
===================================================================
--- a/srcpos.c
+++ b/srcpos.c
@@ -246,6 +246,25 @@ srcpos_copy(struct srcpos *pos)
 	return pos_new;
 }
 
+struct srcpos *
+srcpos_copy_all(struct srcpos *pos)
+{
+	struct srcpos *pos_new;
+	struct srcfile_state *srcfile_state;
+
+	pos_new = srcpos_copy(pos);
+
+	if (pos_new) {
+		/* allocate without free */
+		srcfile_state = xmalloc(sizeof(struct srcfile_state));
+		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
+
+		pos_new->file = srcfile_state;
+	}
+
+	return pos_new;
+}
+
 
 
 void
@@ -291,6 +310,29 @@ srcpos_string(struct srcpos *pos)
 
 	return pos_str;
 }
+
+char *
+srcpos_string_short(struct srcpos *pos)
+{
+	const char *fname = "<no-file>";
+	char *pos_str;
+	int rc;
+
+	if (pos)
+		fname = pos->file->name;
+
+
+	if (!pos)
+		rc = asprintf(&pos_str, "%s:0", fname);
+	else
+		rc = asprintf(&pos_str, "%s:%d", fname,
+			      pos->first_line);
+
+	if (rc == -1)
+		die("Couldn't allocate in srcpos_string_short");
+
+	return pos_str;
+}
 
 void srcpos_verror(struct srcpos *pos, const char *prefix,
 		   const char *fmt, va_list va)
Index: b/srcpos.h
===================================================================
--- a/srcpos.h
+++ b/srcpos.h
@@ -104,7 +104,9 @@ extern struct srcpos srcpos_empty;
 
 extern void srcpos_update(struct srcpos *pos, const char *text, int len);
 extern struct srcpos *srcpos_copy(struct srcpos *pos);
+extern struct srcpos *srcpos_copy_all(struct srcpos *pos);
 extern char *srcpos_string(struct srcpos *pos);
+extern char *srcpos_string_short(struct srcpos *pos);
 extern void srcpos_dump(struct srcpos *pos);
 
 extern void srcpos_verror(struct srcpos *pos, const char *prefix,
