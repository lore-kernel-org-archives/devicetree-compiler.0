From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v6 2/3] dtc: dts source location annotation
Date: Fri, 02 Oct 2015 21:52:48 -0700
Message-ID: <560F5F20.30709@gmail.com>
References: <560F5D15.9060606@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=fgqgA500NqpSZJwDGEWAn2G45bLmWSHA41w4dmcTCbM=;
        b=wMMA0iC3DiHUPJvXJYNRc6b9m2/1tFmQSF2pQej8j3iu+mp4rdcd5qsef8OpdyUJl6
         Z3A+c93C8G6/Rp4QTdxNhUqCEvJkbSx/qBZ6R6uiVZwCICiJXcDAEgkCmCNJ/QNLOkT5
         3UBfwHScPaqNKIHaccgyERM0JvEJolRFMcSZQ85MDt93ot0vqew1LUbJM4Zbf2W7zf7e
         9HokmzHe3MxS00Asg2jjEPKRzMMcjQybaRUvzyE68orFzqQL8Dlaq6XZHG6nZeML0ZAX
         NLO5Xd11DJ9haySzlls4OEnHomEXcv96NMEPnHw4X3xAigrnPNDwFoMwKyrp8v90DBrN
         7Y4w==
In-Reply-To: <560F5D15.9060606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

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

  -----  long format  -----

  sdhci@f9824900 { /* qcom-apq8074-dragonboard.dts:14.3-18.5 */
        compatible = "qcom,sdhci-msm-v4"; /* qcom-msm8974.dtsi:240.4-37 */
        reg = <0xf9824900 0x11c 0xf9824000 0x800>; /* qcom-msm8974.dtsi:241.4-49 */
        reg-names = "hc_mem", "core_mem"; /* qcom-msm8974.dtsi:242.4-37 */
        interrupts = <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* qcom-msm8974.dtsi:243.4-38 */
        interrupt-names = "hc_irq", "pwr_irq"; /* qcom-msm8974.dtsi:244.4-42 */
        clocks = <0xd 0xd8 0xd 0xd7>; /* qcom-msm8974.dtsi:245.4-36 */
        clock-names = "core", "iface"; /* qcom-msm8974.dtsi:246.4-34 */
        status = "ok"; /* qcom-apq8074-dragonboard.dts:17.4-18 */
        bus-width = <0x8>; /* qcom-apq8074-dragonboard.dts:15.4-20 */
        non-removable; /* qcom-apq8074-dragonboard.dts:16.4-18 */
  }; /* qcom-apq8074-dragonboard.dts:14.3-18.5 */


  -----  short format (requires patch 3)  -----

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

TODO:

  - More testing.

Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 dtc-parser.y |   16 ++++++++--------
 dtc.c        |    9 +++++++++
 dtc.h        |    9 ++++++---
 flattree.c   |    2 +-
 fstree.c     |    7 ++++---
 livetree.c   |   20 ++++++++++++++------
 srcpos.c     |   35 +++++++++++++++++++++++++++++++++++
 srcpos.h     |    2 ++
 treesource.c |   38 +++++++++++++++++++++++++++++++++-----
 9 files changed, 112 insertions(+), 26 deletions(-)

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
@@ -158,6 +160,7 @@ struct node {
 	int addr_cells, size_cells;
 
 	struct label *labels;
+	struct srcpos *srcpos;
 };
 
 #define for_each_label_withdel(l0, l) \
@@ -184,16 +187,16 @@ struct node {
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
-struct property *build_property(char *name, struct data val);
+struct property *build_property(char *name, struct data val, struct srcpos *srcpos);
 struct property *build_property_delete(char *name);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
 
 struct node *build_node(struct property *proplist, struct node *children);
 struct node *build_node_delete(void);
-struct node *name_node(struct node *node, char *name);
+struct node *name_node(struct node *node, char *name, struct srcpos *srcpos);
 struct node *chain_node(struct node *first, struct node *list);
-struct node *merge_nodes(struct node *old_node, struct node *new_node);
+struct node *merge_nodes(struct node *old_node, struct node *new_node, struct srcpos *srcpos);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
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
@@ -50,7 +51,7 @@ void delete_labels(struct label **labels
 		label->deleted = 1;
 }
 
-struct property *build_property(char *name, struct data val)
+struct property *build_property(char *name, struct data val, struct srcpos *srcpos)
 {
 	struct property *new = xmalloc(sizeof(*new));
 
@@ -58,6 +59,7 @@ struct property *build_property(char *na
 
 	new->name = name;
 	new->val = val;
+	new->srcpos = srcpos_copy_all(srcpos);
 
 	return new;
 }
@@ -125,16 +127,17 @@ struct node *build_node_delete(void)
 	return new;
 }
 
-struct node *name_node(struct node *node, char *name)
+struct node *name_node(struct node *node, char *name, struct srcpos *srcpos)
 {
 	assert(node->name == NULL);
 
 	node->name = name;
+	node->srcpos = srcpos_copy_all(srcpos);
 
 	return node;
 }
 
-struct node *merge_nodes(struct node *old_node, struct node *new_node)
+struct node *merge_nodes(struct node *old_node, struct node *new_node, struct srcpos *new_node_begin_srcpos)
 {
 	struct property *new_prop, *old_prop;
 	struct node *new_child, *old_child;
@@ -169,6 +172,7 @@ struct node *merge_nodes(struct node *ol
 
 				old_prop->val = new_prop->val;
 				old_prop->deleted = 0;
+				old_prop->srcpos = new_prop->srcpos;
 				free(new_prop);
 				new_prop = NULL;
 				break;
@@ -198,7 +202,7 @@ struct node *merge_nodes(struct node *ol
 		/* Search for a collision.  Merge if there is */
 		for_each_child_withdel(old_node, old_child) {
 			if (streq(old_child->name, new_child->name)) {
-				merge_nodes(old_child, new_child);
+				merge_nodes(old_child, new_child, new_child->srcpos);
 				new_child = NULL;
 				break;
 			}
@@ -209,6 +213,8 @@ struct node *merge_nodes(struct node *ol
 			add_child(old_node, new_child);
 	}
 
+	old_node->srcpos = srcpos_copy_all(new_node_begin_srcpos);
+
 	/* The new node contents are now merged into the old node.  Free
 	 * the new node. */
 	free(new_node);
@@ -535,13 +541,15 @@ cell_t get_node_phandle(struct node *roo
 	    && (phandle_format & PHANDLE_LEGACY))
 		add_property(node,
 			     build_property("linux,phandle",
-					    data_append_cell(empty_data, phandle)));
+					    data_append_cell(empty_data, phandle),
+					    NULL));
 
 	if (!get_property(node, "phandle")
 	    && (phandle_format & PHANDLE_EPAPR))
 		add_property(node,
 			     build_property("phandle",
-					    data_append_cell(empty_data, phandle)));
+					    data_append_cell(empty_data, phandle),
+					    NULL));
 
 	/* If the node *does* have a phandle property, we must
 	 * be dealing with a self-referencing phandle, which will be
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
+			srcstr = srcpos_string(prop->srcpos);
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
+		srcstr = srcpos_string(prop->srcpos);
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
+		srcstr = srcpos_string(tree->srcpos);
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
+		srcstr = srcpos_string(tree->srcpos);
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
@@ -134,11 +134,11 @@ memreserve:
 devicetree:
 	  '/' nodedef
 		{
-			$$ = name_node($2, "");
+			$$ = name_node($2, "", &@1);
 		}
 	| devicetree '/' nodedef
 		{
-			$$ = merge_nodes($1, $3);
+			$$ = merge_nodes($1, $3, srcpos_combine(&@2, &@3));
 		}
 
 	| devicetree DT_LABEL DT_REF nodedef
@@ -147,7 +147,7 @@ devicetree:
 
 			add_label(&target->labels, $2);
 			if (target)
-				merge_nodes(target, $4);
+				merge_nodes(target, $4, &@4);
 			else
 				ERROR(&@3, "Label or path %s not found", $3);
 			$$ = $1;
@@ -157,7 +157,7 @@ devicetree:
 			struct node *target = get_node_by_ref($1, $2);
 
 			if (target)
-				merge_nodes(target, $3);
+				merge_nodes(target, $3, &@3);
 			else
 				ERROR(&@2, "Label or path %s not found", $2);
 			$$ = $1;
@@ -197,11 +197,11 @@ proplist:
 propdef:
 	  DT_PROPNODENAME '=' propdata ';'
 		{
-			$$ = build_property($1, $3);
+			$$ = build_property($1, $3, &@$);
 		}
 	| DT_PROPNODENAME ';'
 		{
-			$$ = build_property($1, empty_data);
+			$$ = build_property($1, empty_data, &@$);
 		}
 	| DT_DEL_PROP DT_PROPNODENAME ';'
 		{
@@ -456,11 +456,11 @@ subnodes:
 subnode:
 	  DT_PROPNODENAME nodedef
 		{
-			$$ = name_node($2, $1);
+			$$ = name_node($2, $1, &@$);
 		}
 	| DT_DEL_NODE DT_PROPNODENAME ';'
 		{
-			$$ = name_node(build_node_delete(), $2);
+			$$ = name_node(build_node_delete(), $2, &@$);
 		}
 	| DT_LABEL subnode
 		{
Index: b/srcpos.c
===================================================================
--- a/srcpos.c
+++ b/srcpos.c
@@ -246,6 +246,41 @@ srcpos_copy(struct srcpos *pos)
 	return pos_new;
 }
 
+struct srcpos *
+srcpos_copy_all(struct srcpos *pos)
+{
+	struct srcpos *pos_new;
+	struct srcfile_state *srcfile_state;
+
+	if (!pos)
+		return NULL;
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
+struct srcpos *
+srcpos_combine(struct srcpos *left_srcpos, struct srcpos *right_srcpos)
+{
+	struct srcpos *pos_new;
+
+	pos_new = srcpos_copy(left_srcpos);
+
+	pos_new->last_line = right_srcpos->last_line;
+	pos_new->last_column = right_srcpos->last_column;
+
+	return pos_new;
+}
+
 
 
 void
Index: b/srcpos.h
===================================================================
--- a/srcpos.h
+++ b/srcpos.h
@@ -104,6 +104,8 @@ extern struct srcpos srcpos_empty;
 
 extern void srcpos_update(struct srcpos *pos, const char *text, int len);
 extern struct srcpos *srcpos_copy(struct srcpos *pos);
+extern struct srcpos *srcpos_copy_all(struct srcpos *pos);
+extern struct srcpos *srcpos_combine(struct srcpos *left_srcpos, struct srcpos *right_srcpos);
 extern char *srcpos_string(struct srcpos *pos);
 extern void srcpos_dump(struct srcpos *pos);
 
Index: b/flattree.c
===================================================================
--- a/flattree.c
+++ b/flattree.c
@@ -692,7 +692,7 @@ static struct property *flat_read_proper
 
 	val = flat_read_data(dtbuf, proplen);
 
-	return build_property(name, val);
+	return build_property(name, val, NULL);
 }
 
 
Index: b/fstree.c
===================================================================
--- a/fstree.c
+++ b/fstree.c
@@ -60,7 +60,8 @@ static struct node *read_fstree(const ch
 			} else {
 				prop = build_property(xstrdup(de->d_name),
 						      data_copy_file(pfile,
-								     st.st_size));
+								     st.st_size),
+						      NULL);
 				add_property(tree, prop);
 				fclose(pfile);
 			}
@@ -68,7 +69,7 @@ static struct node *read_fstree(const ch
 			struct node *newchild;
 
 			newchild = read_fstree(tmpname);
-			newchild = name_node(newchild, xstrdup(de->d_name));
+			newchild = name_node(newchild, xstrdup(de->d_name), NULL);
 			add_child(tree, newchild);
 		}
 
@@ -84,7 +85,7 @@ struct boot_info *dt_from_fs(const char
 	struct node *tree;
 
 	tree = read_fstree(dirname);
-	tree = name_node(tree, "");
+	tree = name_node(tree, "", NULL);
 
 	return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
 }
