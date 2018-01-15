From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 2/3 v2] annotations: add positions
Date: Mon, 15 Jan 2018 19:24:09 +0100
Message-ID: <1516040650-9848-3-git-send-email-Julia.Lawall@lip6.fr>
References: <1516040650-9848-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516040650-9848-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

The parser is extended to record positions.  For productions with a
nodedef, this is the position of the nodedef, with preceding / if any.
For other productions it is the position of the complete set of terms
matched by the production.

srcpos structures are added to the property and node types, and to the
parameter lists of various functions that construct these types.  Nodes
and properties that are created by the compiler rather than from parsing
source code typically have NULL as the srcpos value.

merge_nodes, defined in livetree.c uses srcpos_extend to combine
multiple positions, resulting in a list of positions.

srcpos_extend is defined in srcpos.c and is somewhat complex.  It
addresses two issues: the lists of positions to merge may share a common
tail and the lists of positions to merge may contain duplicates.  In
srcpos_extend, the nested loops detect a common tail (merge_point) if
any.  The second list is then copied up to the merge point, and then the
resulting copy is placed at the end of a copy of the first list.
Duplicates are detected by srcpos_copy_list within the copying process.

srcpos_combine is also newly defined in srcpos.c.  It is only used to
merge positions of adjacent terms matched by the parser, and thus
doesn't have to be concerned with common tails and duplicates.

Another change to srcpos.c is to make srcpos_copy always do a full copy,
including a copy of the file substructure.  This is required because
when dtc is used on the output of cpp, the successive detected file
names overwrite the file name in the file structure.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---

v2: Allow lists of positions, make srcpos_copy always do a full copy, move
annotation support into another patch.

 dtc-parser.y | 23 +++++++++++---------
 dtc.h        | 13 +++++++----
 flattree.c   |  2 +-
 fstree.c     |  8 ++++---
 livetree.c   | 44 ++++++++++++++++++++++++++-----------
 srcpos.c     | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 srcpos.h     |  5 +++++
 7 files changed, 135 insertions(+), 31 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 44af170..d668349 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -160,11 +160,11 @@ memreserve:
 devicetree:
 	  '/' nodedef
 		{
-			$$ = name_node($2, "");
+			$$ = name_node($2, "", &@$);
 		}
 	| devicetree '/' nodedef
 		{
-			$$ = merge_nodes($1, $3);
+			$$ = merge_nodes($1, $3, srcpos_combine(&@2, &@3));
 		}
 	| DT_REF nodedef
 		{
@@ -175,7 +175,10 @@ devicetree:
 			 */
 			if (!($<flags>-1 & DTSF_PLUGIN))
 				ERROR(&@2, "Label or path %s not found", $1);
-			$$ = add_orphan_node(name_node(build_node(NULL, NULL), ""), $2, $1);
+			$$ = add_orphan_node(
+					name_node(build_node(NULL, NULL), "",
+						  NULL),
+					$2, $1, &@2);
 		}
 	| devicetree DT_LABEL DT_REF nodedef
 		{
@@ -183,7 +186,7 @@ devicetree:
 
 			if (target) {
 				add_label(&target->labels, $2);
-				merge_nodes(target, $4);
+				merge_nodes(target, $4, &@4);
 			} else
 				ERROR(&@3, "Label or path %s not found", $3);
 			$$ = $1;
@@ -193,7 +196,7 @@ devicetree:
 			struct node *target = get_node_by_ref($1, $2);
 
 			if (target) {
-				merge_nodes(target, $3);
+				merge_nodes(target, $3, &@3);
 			} else {
 				/*
 				 * We rely on the rule being always:
@@ -201,7 +204,7 @@ devicetree:
 				 * so $-1 is what we want (plugindecl)
 				 */
 				if ($<flags>-1 & DTSF_PLUGIN)
-					add_orphan_node($1, $3, $2);
+					add_orphan_node($1, $3, $2, &@3);
 				else
 					ERROR(&@2, "Label or path %s not found", $2);
 			}
@@ -242,11 +245,11 @@ proplist:
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
@@ -517,11 +520,11 @@ subnodes:
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
diff --git a/dtc.h b/dtc.h
index 3b18a42..3a85058 100644
--- a/dtc.h
+++ b/dtc.h
@@ -149,6 +149,7 @@ struct property {
 	struct property *next;
 
 	struct label *labels;
+	struct srcpos *srcpos;
 };
 
 struct node {
@@ -168,6 +169,7 @@ struct node {
 
 	struct label *labels;
 	const struct bus_type *bus;
+	struct srcpos *srcpos;
 };
 
 #define for_each_label_withdel(l0, l) \
@@ -194,17 +196,20 @@ struct node {
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
-struct property *build_property(char *name, struct data val);
+struct property *build_property(char *name, struct data val,
+	struct srcpos *srcpos);
 struct property *build_property_delete(char *name);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
 
 struct node *build_node(struct property *proplist, struct node *children);
 struct node *build_node_delete(void);
-struct node *name_node(struct node *node, char *name);
+struct node *name_node(struct node *node, char *name, struct srcpos *srcpos);
 struct node *chain_node(struct node *first, struct node *list);
-struct node *merge_nodes(struct node *old_node, struct node *new_node);
-struct node *add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
+struct node *merge_nodes(struct node *old_node, struct node *new_node,
+	struct srcpos *srcpos);
+struct node *add_orphan_node(struct node *old_node, struct node *new_node,
+	char *ref, struct srcpos *srcpos);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
diff --git a/flattree.c b/flattree.c
index 8d268fb..f35ff5e 100644
--- a/flattree.c
+++ b/flattree.c
@@ -692,7 +692,7 @@ static struct property *flat_read_property(struct inbuf *dtbuf,
 
 	val = flat_read_data(dtbuf, proplen);
 
-	return build_property(name, val);
+	return build_property(name, val, NULL);
 }
 
 
diff --git a/fstree.c b/fstree.c
index ae7d06c..da7e537 100644
--- a/fstree.c
+++ b/fstree.c
@@ -60,7 +60,8 @@ static struct node *read_fstree(const char *dirname)
 			} else {
 				prop = build_property(xstrdup(de->d_name),
 						      data_copy_file(pfile,
-								     st.st_size));
+								     st.st_size),
+						      NULL);
 				add_property(tree, prop);
 				fclose(pfile);
 			}
@@ -68,7 +69,8 @@ static struct node *read_fstree(const char *dirname)
 			struct node *newchild;
 
 			newchild = read_fstree(tmpname);
-			newchild = name_node(newchild, xstrdup(de->d_name));
+			newchild = name_node(newchild, xstrdup(de->d_name),
+					     NULL);
 			add_child(tree, newchild);
 		}
 
@@ -84,7 +86,7 @@ struct dt_info *dt_from_fs(const char *dirname)
 	struct node *tree;
 
 	tree = read_fstree(dirname);
-	tree = name_node(tree, "");
+	tree = name_node(tree, "", NULL);
 
 	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree));
 }
diff --git a/livetree.c b/livetree.c
index 57b7db2..9317739 100644
--- a/livetree.c
+++ b/livetree.c
@@ -19,6 +19,7 @@
  */
 
 #include "dtc.h"
+#include "srcpos.h"
 
 /*
  * Tree building functions
@@ -50,7 +51,8 @@ void delete_labels(struct label **labels)
 		label->deleted = 1;
 }
 
-struct property *build_property(char *name, struct data val)
+struct property *build_property(char *name, struct data val,
+				struct srcpos *srcpos)
 {
 	struct property *new = xmalloc(sizeof(*new));
 
@@ -58,6 +60,7 @@ struct property *build_property(char *name, struct data val)
 
 	new->name = name;
 	new->val = val;
+	new->srcpos = srcpos_copy(srcpos);
 
 	return new;
 }
@@ -125,16 +128,18 @@ struct node *build_node_delete(void)
 	return new;
 }
 
-struct node *name_node(struct node *node, char *name)
+struct node *name_node(struct node *node, char *name, struct srcpos *srcpos)
 {
 	assert(node->name == NULL);
 
 	node->name = name;
+	node->srcpos = srcpos_copy(srcpos);
 
 	return node;
 }
 
-struct node *merge_nodes(struct node *old_node, struct node *new_node)
+struct node *merge_nodes(struct node *old_node, struct node *new_node,
+			 struct srcpos *new_node_begin_srcpos)
 {
 	struct property *new_prop, *old_prop;
 	struct node *new_child, *old_child;
@@ -169,6 +174,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 
 				old_prop->val = new_prop->val;
 				old_prop->deleted = 0;
+				old_prop->srcpos = new_prop->srcpos;
 				free(new_prop);
 				new_prop = NULL;
 				break;
@@ -198,7 +204,8 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		/* Search for a collision.  Merge if there is */
 		for_each_child_withdel(old_node, old_child) {
 			if (streq(old_child->name, new_child->name)) {
-				merge_nodes(old_child, new_child);
+				merge_nodes(old_child, new_child,
+					    new_child->srcpos);
 				new_child = NULL;
 				break;
 			}
@@ -209,6 +216,9 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 			add_child(old_node, new_child);
 	}
 
+	old_node->srcpos =
+		srcpos_extend(new_node_begin_srcpos, old_node->srcpos);
+
 	/* The new node contents are now merged into the old node.  Free
 	 * the new node. */
 	free(new_node);
@@ -216,7 +226,8 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	return old_node;
 }
 
-struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
+struct node *add_orphan_node(struct node *dt, struct node *new_node, char *ref,
+			      struct srcpos *srcpos)
 {
 	static unsigned int next_orphan_fragment = 0;
 	struct node *node;
@@ -227,13 +238,13 @@ struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 	d = data_add_marker(d, REF_PHANDLE, ref);
 	d = data_append_integer(d, 0xffffffff, 32);
 
-	p = build_property("target", d);
+	p = build_property("target", d, srcpos);
 
 	xasprintf(&name, "fragment@%u",
 			next_orphan_fragment++);
-	name_node(new_node, "__overlay__");
+	name_node(new_node, "__overlay__", srcpos);
 	node = build_node(p, new_node);
-	name_node(node, name);
+	name_node(node, name, srcpos);
 
 	add_child(dt, node);
 	return dt;
@@ -331,7 +342,8 @@ void append_to_property(struct node *node,
 		p->val = d;
 	} else {
 		d = data_append_data(empty_data, data, len);
-		p = build_property(name, d);
+		/* used from fixup or local_fixup, so no position */
+		p = build_property(name, d, NULL);
 		add_property(node, p);
 	}
 }
@@ -587,13 +599,17 @@ cell_t get_node_phandle(struct node *root, struct node *node)
 	    && (phandle_format & PHANDLE_LEGACY))
 		add_property(node,
 			     build_property("linux,phandle",
-					    data_append_cell(empty_data, phandle)));
+					    data_append_cell(empty_data,
+							     phandle),
+					    NULL));
 
 	if (!get_property(node, "phandle")
 	    && (phandle_format & PHANDLE_EPAPR))
 		add_property(node,
 			     build_property("phandle",
-					    data_append_cell(empty_data, phandle)));
+					    data_append_cell(empty_data,
+							     phandle),
+					    NULL));
 
 	/* If the node *does* have a phandle property, we must
 	 * be dealing with a self-referencing phandle, which will be
@@ -768,7 +784,7 @@ static struct node *build_and_name_child_node(struct node *parent, char *name)
 	struct node *node;
 
 	node = build_node(NULL, NULL);
-	name_node(node, xstrdup(name));
+	name_node(node, xstrdup(name), NULL);
 	add_child(parent, node);
 
 	return node;
@@ -827,9 +843,11 @@ static void generate_label_tree_internal(struct dt_info *dti,
 			}
 
 			/* insert it */
+			/* no position information for symbols and aliases */
 			p = build_property(l->label,
 				data_copy_mem(node->fullpath,
-						strlen(node->fullpath) + 1));
+					      strlen(node->fullpath) + 1),
+				NULL);
 			add_property(an, p);
 		}
 
diff --git a/srcpos.c b/srcpos.c
index 9067ba3..2ed794b 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -207,6 +207,7 @@ struct srcpos srcpos_empty = {
 	.last_line = 0,
 	.last_column = 0,
 	.file = NULL,
+	.next = NULL,
 };
 
 #define TAB_SIZE      8
@@ -240,13 +241,83 @@ struct srcpos *
 srcpos_copy(struct srcpos *pos)
 {
 	struct srcpos *pos_new;
+	struct srcfile_state *srcfile_state;
+
+	if (!pos)
+		return NULL;
 
 	pos_new = xmalloc(sizeof(struct srcpos));
 	memcpy(pos_new, pos, sizeof(struct srcpos));
 
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
 	return pos_new;
 }
 
+static bool same_pos(struct srcpos *p1, struct srcpos *p2)
+{
+	return (p1->first_line == p2->first_line &&
+		p1->first_column == p2->first_column &&
+		p1->last_line == p2->last_line &&
+		p1->last_column == p2->last_column &&
+		!strcmp(p1->file->name, p2->file->name));
+}
+
+static struct srcpos *srcpos_copy_list(struct srcpos *pos, struct srcpos *end,
+				       struct srcpos *newtail)
+{
+	struct srcpos *next, *p;
+
+	if (pos == end)
+		return newtail;
+
+	next = srcpos_copy_list(pos->next, end, newtail);
+
+	for (p = next; p != NULL; p = p->next)
+		if (same_pos(pos, p))
+			return next;
+
+	pos = srcpos_copy(pos);
+	pos->next = next;
+	return pos;
+}
+
+struct srcpos *srcpos_extend(struct srcpos *new_srcpos,
+			     struct srcpos *old_srcpos)
+{
+	struct srcpos *pos, *p;
+	struct srcpos *merge_point = NULL;
+
+	for (pos = new_srcpos; pos->next != NULL; pos = pos->next)
+		for (p = old_srcpos; p != NULL; p = p->next)
+			if (pos->next == p) {
+				merge_point = p;
+				goto after;
+			}
+after:
+	old_srcpos = srcpos_copy_list(old_srcpos, merge_point, NULL);
+	return srcpos_copy_list(new_srcpos, NULL, old_srcpos);
+}
+
 char *
 srcpos_string(struct srcpos *pos)
 {
diff --git a/srcpos.h b/srcpos.h
index 9ded12a..c22d6ba 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -74,6 +74,7 @@ struct srcpos {
     int last_line;
     int last_column;
     struct srcfile_state *file;
+    struct srcpos *next;
 };
 
 #define YYLTYPE struct srcpos
@@ -105,6 +106,10 @@ extern struct srcpos srcpos_empty;
 
 extern void srcpos_update(struct srcpos *pos, const char *text, int len);
 extern struct srcpos *srcpos_copy(struct srcpos *pos);
+extern struct srcpos *srcpos_combine(struct srcpos *left_srcpos,
+				     struct srcpos *right_srcpos);
+extern struct srcpos *srcpos_extend(struct srcpos *new_srcpos,
+				    struct srcpos *old_srcpos);
 extern char *srcpos_string(struct srcpos *pos);
 
 extern void PRINTF(3, 0) srcpos_verror(struct srcpos *pos, const char *prefix,
-- 
2.7.4
