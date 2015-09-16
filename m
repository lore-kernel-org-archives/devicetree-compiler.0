From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 1/3] dtc: dts source location annotation
Date: Tue, 15 Sep 2015 21:22:18 -0700
Message-ID: <55F8EE7A.7080301@gmail.com>
References: <55F8EB35.5010601@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=HEb0UHVFzgv5X4uLSKVoA1OmStd3Se9UvH2BmA9E8qY=;
        b=Xq57G5xpyjlwGqXGUsWsEkMG0/xfi0+iipV6FKDOFU5WBhZB24GFg3ZueNdgM5R7Sm
         CNp3xTwT0IbdrDCuDGfC6lq6HPEhVt6t+1dWGaxDlLBg0445KTXq/kZG1RlWeZhR4E2l
         tPXRF6Zb9NFyGmpad0+F8Sq5IfUK//A9UijvhJC4MRl8NCyQS7lfO0eS7Mgk0dDVQ5+g
         z5u9sn38sWMzONLZPB4zGboe04P+8km5LTx4gKBWMM+67x7k/3b4GQX05EPcjz7gzJSY
         KrJ7q8dIgmmkepiq+dzwUqADrn63XKC5YA/MFl5H5FJscGE/8wW4RFHAuJmE2i0SpVCA
         tzhQ==
In-Reply-To: <55F8EB35.5010601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Proof of concept patch.

Annotates input source file and line number of nodes and properties
as comments in output .dts file when --annotate flag is supplied.

Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 dtc-lexer.l  |    2 +
 dtc.c        |    9 ++++++++
 dtc.h        |   14 +++++++++++++
 livetree.c   |   62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 srcpos.h     |    6 +++++
 treesource.c |   27 ++++++++++++++++++++-----
 6 files changed, 115 insertions(+), 5 deletions(-)

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
@@ -126,6 +127,16 @@ bool data_is_one_string(struct data d);
 #define MAX_NODENAME_LEN	31
 
 /* Live trees */
+struct src {
+	char *name;
+	int lineno;
+};
+
+struct prop_src {
+	struct prop_src *prev;
+	struct src src;
+};
+
 struct label {
 	bool deleted;
 	char *label;
@@ -140,6 +151,7 @@ struct property {
 	struct property *next;
 
 	struct label *labels;
+	struct src src;
 };
 
 struct node {
@@ -158,6 +170,8 @@ struct node {
 	int addr_cells, size_cells;
 
 	struct label *labels;
+	struct src begin_src;
+	struct src end_src;
 };
 
 #define for_each_label_withdel(l0, l) \
Index: b/livetree.c
===================================================================
--- a/livetree.c
+++ b/livetree.c
@@ -19,6 +19,9 @@
  */
 
 #include "dtc.h"
+#include "srcpos.h"
+
+struct prop_src *prev_prop_src = NULL;
 
 /*
  * Tree building functions
@@ -58,6 +61,13 @@ struct property *build_property(char *na
 
 	new->name = name;
 	new->val = val;
+	if (current_srcfile) {
+		new->src.name = current_srcfile->name;
+		new->src.lineno = current_srcfile->lineno;
+	} else {
+		new->src.name = "__builtin__";
+		new->src.lineno = 0;
+	}
 
 	return new;
 }
@@ -97,10 +107,40 @@ struct property *reverse_properties(stru
 	return head;
 }
 
+void push_prop_src(void)
+{
+	struct prop_src *new = xmalloc(sizeof(*new));
+
+	memset(new, 0, sizeof(*new));
+
+	if (current_srcfile) {
+		new->src.name = current_srcfile->name;
+		new->src.lineno = current_srcfile->lineno;
+	} else {
+		new->src.name = "__builtin__";
+		new->src.lineno = 0;
+	}
+
+	new->prev = prev_prop_src;
+	prev_prop_src = new;
+}
+
+void pop_prop_src(void)
+{
+	struct prop_src *prev;
+
+	if (prev_prop_src) {
+		prev = prev_prop_src->prev;
+		free(prev_prop_src);
+		prev_prop_src = prev;
+	}
+}
+
 struct node *build_node(struct property *proplist, struct node *children)
 {
 	struct node *new = xmalloc(sizeof(*new));
 	struct node *child;
+	struct prop_src *prev;
 
 	memset(new, 0, sizeof(*new));
 
@@ -111,6 +151,24 @@ struct node *build_node(struct property
 		child->parent = new;
 	}
 
+	prev = prev_prop_src;
+	if (prev) {
+		new->begin_src.name = prev->src.name;
+		new->begin_src.lineno = prev->src.lineno;
+		pop_prop_src();
+	} else {
+		new->begin_src.name = "__builtin__";
+		new->begin_src.lineno = 0;
+	}
+
+	if (current_srcfile) {
+		new->end_src.name = current_srcfile->name;
+		new->end_src.lineno = current_srcfile->lineno;
+	} else {
+		new->end_src.name = "__builtin__";
+		new->end_src.lineno = 0;
+	}
+
 	return new;
 }
 
@@ -169,6 +227,7 @@ struct node *merge_nodes(struct node *ol
 
 				old_prop->val = new_prop->val;
 				old_prop->deleted = 0;
+				old_prop->src = new_prop->src;
 				free(new_prop);
 				new_prop = NULL;
 				break;
@@ -209,6 +268,9 @@ struct node *merge_nodes(struct node *ol
 			add_child(old_node, new_child);
 	}
 
+	old_node->begin_src = new_node->begin_src;
+	old_node->end_src = new_node->end_src;
+
 	/* The new node contents are now merged into the old node.  Free
 	 * the new node. */
 	free(new_node);
Index: b/treesource.c
===================================================================
--- a/treesource.c
+++ b/treesource.c
@@ -202,7 +202,11 @@ static void write_propval(FILE *f, struc
 	int i;
 
 	if (len == 0) {
-		fprintf(f, ";\n");
+		if (annotate)
+			fprintf(f, "; /* %s:%d */\n",
+				prop->src.name, prop->src.lineno);
+		else
+			fprintf(f, ";\n");
 		return;
 	}
 
@@ -230,7 +234,10 @@ static void write_propval(FILE *f, struc
 		write_propval_bytes(f, prop->val);
 	}
 
-	fprintf(f, ";\n");
+	if (annotate)
+		fprintf(f, "; /* %s:%d */\n", prop->src.name, prop->src.lineno);
+	else
+		fprintf(f, ";\n");
 }
 
 static void write_tree_source_node(FILE *f, struct node *tree, int level)
@@ -242,10 +249,16 @@ static void write_tree_source_node(FILE
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
+		fprintf(f, " /* %s:%d */\n",
+			tree->begin_src.name, tree->begin_src.lineno);
+	} else
+		fprintf(f, "\n");
 
 	for_each_property(tree, prop) {
 		write_prefix(f, level+1);
@@ -259,7 +272,11 @@ static void write_tree_source_node(FILE
 		write_tree_source_node(f, child, level+1);
 	}
 	write_prefix(f, level);
-	fprintf(f, "};\n");
+	if (annotate)
+		fprintf(f, "}; /* %s:%d */\n",
+			tree->end_src.name, tree->end_src.lineno);
+	else
+		fprintf(f, "};\n");
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
+	{"annotate",         no_argument, NULL, 'a'},
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
+		case 'a':
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
Index: b/dtc-lexer.l
===================================================================
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -249,6 +249,8 @@ static void lexical_error(const char *fm
 				DPRINT("<PROPNODENAME>\n");
 				BEGIN(PROPNODENAME);
 			}
+			if (yytext[0] == '{')
+				push_prop_src();
 			return yytext[0];
 		}
 
Index: b/srcpos.h
===================================================================
--- a/srcpos.h
+++ b/srcpos.h
@@ -34,6 +34,8 @@ struct srcfile_state {
 extern FILE *depfile; /* = NULL */
 extern struct srcfile_state *current_srcfile; /* = NULL */
 
+extern struct prop_src *prev_prop_src; /* = NULL */
+
 /**
  * Open a source file.
  *
@@ -58,6 +60,10 @@ FILE *srcfile_relative_open(const char *
 void srcfile_push(const char *fname);
 bool srcfile_pop(void);
 
+void push_prop_src(void);
+void pop_prop_src(void);
+
+
 /**
  * Add a new directory to the search path for input files
  *
