From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 2/3 v4] annotations: add positions
Date: Fri,  2 Feb 2018 21:41:49 +0100
Message-ID: <1517604110-790-3-git-send-email-Julia.Lawall@lip6.fr>
References: <1517604110-790-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517604110-790-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

The parser is extended to record positions, in build_node,
build_node_delete, and build_property.

srcpos structures are added to the property and node types, and to the
parameter lists of the above functions that construct these types.
Nodes and properties that are created by the compiler rather than from
parsing source code have NULL as the srcpos value.

merge_nodes, defined in livetree.c uses srcpos_extend to combine
multiple positions, resulting in a list of positions.  srcpos_extend is
defined in srcpos.c and removes duplicates.  As srcpos_extend is
performing a union, it is O(n^2).  The recursion serves to copy the new
list and then add it to the front of the old one.  Using recursion keeps
the positions in order from newer to older.  On each recursive call, the
current element is compared against each element in the proposed new
tail, to avoid duplicates.  Since the list of positions is only extended
in srcpos_extend, and srcpos_extend does not produce lists with
duplicates, it is not necessary to check for the current element in the
tail of its own list.

Another change to srcpos.c is to make srcpos_copy always do a full copy,
including a copy of the file substructure.  This is required because
when dtc is used on the output of cpp, the successive detected file
names overwrite the file name in the file structure.  The next field
does not need to be deep copied, because it is only updated in newly
copied positions and the positions to which it points have also been
copied.  File names are only updated in uncopied position structures.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---

v4:

* Free old_prop->srcpos added in merge_nodes
* Dropped irrelevant whitespace changes around add_orphan_node
* Dropped test on xmalloc in srcpos_copy
* Added comments in the log message to justify the definition of
  srcpos_extend.  Eliminate some unnecessary checks by only checking in the
  newtail list, and not the copied one.

 dtc-parser.y | 13 ++++++++-----
 dtc.h        | 10 +++++++---
 flattree.c   |  4 ++--
 fstree.c     |  5 +++--
 livetree.c   | 37 +++++++++++++++++++++++++++----------
 srcpos.c     | 40 ++++++++++++++++++++++++++++++++++++++++
 srcpos.h     |  3 +++
 7 files changed, 90 insertions(+), 22 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 44af170..2bcdcab 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -175,7 +175,10 @@ devicetree:
 			 */
 			if (!($<flags>-1 & DTSF_PLUGIN))
 				ERROR(&@2, "Label or path %s not found", $1);
-			$$ = add_orphan_node(name_node(build_node(NULL, NULL), ""), $2, $1);
+			$$ = add_orphan_node(
+					name_node(build_node(NULL, NULL, NULL),
+						  ""),
+					$2, $1);
 		}
 	| devicetree DT_LABEL DT_REF nodedef
 		{
@@ -224,7 +227,7 @@ devicetree:
 nodedef:
 	  '{' proplist subnodes '}' ';'
 		{
-			$$ = build_node($2, $3);
+			$$ = build_node($2, $3, &@$);
 		}
 	;
 
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
@@ -521,7 +524,7 @@ subnode:
 		}
 	| DT_DEL_NODE DT_PROPNODENAME ';'
 		{
-			$$ = name_node(build_node_delete(), $2);
+			$$ = name_node(build_node_delete(&@$), $2);
 		}
 	| DT_LABEL subnode
 		{
diff --git a/dtc.h b/dtc.h
index 3b18a42..42106c2 100644
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
@@ -194,13 +196,15 @@ struct node {
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
-struct property *build_property(char *name, struct data val);
+struct property *build_property(char *name, struct data val,
+	struct srcpos *srcpos);
 struct property *build_property_delete(char *name);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
 
-struct node *build_node(struct property *proplist, struct node *children);
-struct node *build_node_delete(void);
+struct node *build_node(struct property *proplist, struct node *children,
+			struct srcpos *srcpos);
+struct node *build_node_delete(struct srcpos *srcpos);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
diff --git a/flattree.c b/flattree.c
index 8d268fb..61b3e4d 100644
--- a/flattree.c
+++ b/flattree.c
@@ -692,7 +692,7 @@ static struct property *flat_read_property(struct inbuf *dtbuf,
 
 	val = flat_read_data(dtbuf, proplen);
 
-	return build_property(name, val);
+	return build_property(name, val, NULL);
 }
 
 
@@ -750,7 +750,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 	char *flatname;
 	uint32_t val;
 
-	node = build_node(NULL, NULL);
+	node = build_node(NULL, NULL, NULL);
 
 	flatname = flat_read_string(dtbuf);
 
diff --git a/fstree.c b/fstree.c
index ae7d06c..1e7eeba 100644
--- a/fstree.c
+++ b/fstree.c
@@ -34,7 +34,7 @@ static struct node *read_fstree(const char *dirname)
 	if (!d)
 		die("Couldn't opendir() \"%s\": %s\n", dirname, strerror(errno));
 
-	tree = build_node(NULL, NULL);
+	tree = build_node(NULL, NULL, NULL);
 
 	while ((de = readdir(d)) != NULL) {
 		char *tmpname;
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
diff --git a/livetree.c b/livetree.c
index 57b7db2..99aa2c3 100644
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
@@ -97,7 +100,8 @@ struct property *reverse_properties(struct property *first)
 	return head;
 }
 
-struct node *build_node(struct property *proplist, struct node *children)
+struct node *build_node(struct property *proplist, struct node *children,
+			struct srcpos *srcpos)
 {
 	struct node *new = xmalloc(sizeof(*new));
 	struct node *child;
@@ -106,6 +110,7 @@ struct node *build_node(struct property *proplist, struct node *children)
 
 	new->proplist = reverse_properties(proplist);
 	new->children = children;
+	new->srcpos = srcpos_copy(srcpos);
 
 	for_each_child(new, child) {
 		child->parent = new;
@@ -114,13 +119,14 @@ struct node *build_node(struct property *proplist, struct node *children)
 	return new;
 }
 
-struct node *build_node_delete(void)
+struct node *build_node_delete(struct srcpos *srcpos)
 {
 	struct node *new = xmalloc(sizeof(*new));
 
 	memset(new, 0, sizeof(*new));
 
 	new->deleted = 1;
+	new->srcpos = srcpos_copy(srcpos);
 
 	return new;
 }
@@ -169,6 +175,8 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 
 				old_prop->val = new_prop->val;
 				old_prop->deleted = 0;
+				free(old_prop->srcpos);
+				old_prop->srcpos = new_prop->srcpos;
 				free(new_prop);
 				new_prop = NULL;
 				break;
@@ -209,6 +217,8 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 			add_child(old_node, new_child);
 	}
 
+	old_node->srcpos = srcpos_extend(new_node->srcpos, old_node->srcpos);
+
 	/* The new node contents are now merged into the old node.  Free
 	 * the new node. */
 	free(new_node);
@@ -227,12 +237,12 @@ struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 	d = data_add_marker(d, REF_PHANDLE, ref);
 	d = data_append_integer(d, 0xffffffff, 32);
 
-	p = build_property("target", d);
+	p = build_property("target", d, NULL);
 
 	xasprintf(&name, "fragment@%u",
 			next_orphan_fragment++);
 	name_node(new_node, "__overlay__");
-	node = build_node(p, new_node);
+	node = build_node(p, new_node, NULL);
 	name_node(node, name);
 
 	add_child(dt, node);
@@ -331,7 +341,8 @@ void append_to_property(struct node *node,
 		p->val = d;
 	} else {
 		d = data_append_data(empty_data, data, len);
-		p = build_property(name, d);
+		/* used from fixup or local_fixup, so no position */
+		p = build_property(name, d, NULL);
 		add_property(node, p);
 	}
 }
@@ -587,13 +598,17 @@ cell_t get_node_phandle(struct node *root, struct node *node)
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
@@ -767,7 +782,7 @@ static struct node *build_and_name_child_node(struct node *parent, char *name)
 {
 	struct node *node;
 
-	node = build_node(NULL, NULL);
+	node = build_node(NULL, NULL, NULL);
 	name_node(node, xstrdup(name));
 	add_child(parent, node);
 
@@ -827,9 +842,11 @@ static void generate_label_tree_internal(struct dt_info *dti,
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
index 9dd3297..c6688e7 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -207,6 +207,7 @@ struct srcpos srcpos_empty = {
 	.last_line = 0,
 	.last_column = 0,
 	.file = NULL,
+	.next = NULL,
 };
 
 void srcpos_update(struct srcpos *pos, const char *text, int len)
@@ -234,13 +235,52 @@ struct srcpos *
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
+struct srcpos *srcpos_extend(struct srcpos *pos, struct srcpos *newtail)
+{
+	struct srcpos *next, *p;
+
+	if (!pos)
+		return newtail;
+
+	next = srcpos_extend(pos->next, newtail);
+
+	for (p = newtail; p != NULL; p = p->next)
+		if (same_pos(pos, p))
+			return next;
+
+	pos = srcpos_copy(pos);
+	pos->next = next;
+	return pos;
+}
+
 char *
 srcpos_string(struct srcpos *pos)
 {
diff --git a/srcpos.h b/srcpos.h
index 9ded12a..d88e7cb 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -74,6 +74,7 @@ struct srcpos {
     int last_line;
     int last_column;
     struct srcfile_state *file;
+    struct srcpos *next;
 };
 
 #define YYLTYPE struct srcpos
@@ -105,6 +106,8 @@ extern struct srcpos srcpos_empty;
 
 extern void srcpos_update(struct srcpos *pos, const char *text, int len);
 extern struct srcpos *srcpos_copy(struct srcpos *pos);
+extern struct srcpos *srcpos_extend(struct srcpos *new_srcpos,
+				    struct srcpos *old_srcpos);
 extern char *srcpos_string(struct srcpos *pos);
 
 extern void PRINTF(3, 0) srcpos_verror(struct srcpos *pos, const char *prefix,
-- 
2.7.4
