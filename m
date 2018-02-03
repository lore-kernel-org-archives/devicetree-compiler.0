From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] dtc: add ability to make nodes conditional on them being referenced
Date: Sat,  3 Feb 2018 10:14:31 +0100
Message-ID: <20180203091432.19463-1-maxime.ripard@bootlin.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

From: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>

On i.MX, which carries a lot of pin-groups of which most are unused on
individual boards, they noticed that this plethora of nodes also results
in the runtime-lookup-performance also degrading [0].

A i.MX-specific solution defining the pingroups in the board files but
using macros to reference the pingroup-data was not well received.

This patch is trying to solve this issue in a more general way, by
adding the ability to mark nodes as needing to be referenced somewhere
in the tree.

To mark a node a needing to be referenced it must be prefixed with
/delete-if-unreferenced/. This makes dtc check the nodes reference-status
when creating the flattened tree, dropping it if unreferenced.

For example, the i.MX6SL pingroup

	/delete-if-unreferenced/ pinctrl_ecspi1_1: ecspi1grp-1 {
		fsl,pins = <
			MX6SL_PAD_ECSPI1_MISO__ECSPI1_MISO 0x100b1
			MX6SL_PAD_ECSPI1_MOSI__ECSPI1_MOSI 0x100b1
			MX6SL_PAD_ECSPI1_SCLK__ECSPI1_SCLK 0x100b1
		>;
	};

would only be included in the dtb if it got referenced somewhere
as pingroup via

	node {
		pinctrl-0 <&pinctrl_ecscpi1_1>;
	};

[0] http://thread.gmane.org/gmane.linux.ports.arm.kernel/275912/

Signed-off-by: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
---
Hi,

This is a respin of the patch previously sent by Heiko here:
https://patchwork.kernel.org/patch/3840371/

With hopefully all your comments addressed.

Let me know what you think,
Maxime

 checks.c     |  2 ++
 dtc-lexer.l  |  7 +++++++
 dtc-parser.y |  5 +++++
 dtc.h        |  4 ++++
 flattree.c   |  3 +++
 livetree.c   | 14 ++++++++++++++
 6 files changed, 35 insertions(+)

diff --git a/checks.c b/checks.c
index 1cded3658491..a1e0ad91b083 100644
--- a/checks.c
+++ b/checks.c
@@ -571,6 +571,8 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 
 			phandle = get_node_phandle(dt, refnode);
 			*((fdt32_t *)(prop->val.val + m->offset)) = cpu_to_fdt32(phandle);
+
+			reference_node(refnode);
 		}
 	}
 }
diff --git a/dtc-lexer.l b/dtc-lexer.l
index fd825ebba69c..2afde3acad8a 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -153,6 +153,13 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_DEL_NODE;
 		}
 
+<*>"/delete-if-unreferenced/"	{
+			DPRINT("Keyword: /delete-if-unreferenced/\n");
+			DPRINT("<PROPNODENAME>\n");
+			BEGIN(PROPNODENAME);
+			return DT_DEL_UNREFERENCED;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 44af170abfea..55c951c5327f 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -63,6 +63,7 @@ extern bool treesource_error;
 %token DT_BITS
 %token DT_DEL_PROP
 %token DT_DEL_NODE
+%token DT_DEL_UNREFERENCED
 %token <propnodename> DT_PROPNODENAME
 %token <integer> DT_LITERAL
 %token <integer> DT_CHAR_LITERAL
@@ -523,6 +524,10 @@ subnode:
 		{
 			$$ = name_node(build_node_delete(), $2);
 		}
+	| DT_DEL_UNREFERENCED subnode
+		{
+			$$ = mark_node_needs_reference($2);
+		}
 	| DT_LABEL subnode
 		{
 			add_label(&$2->labels, $1);
diff --git a/dtc.h b/dtc.h
index 3b18a42b866e..cb7e3752af5a 100644
--- a/dtc.h
+++ b/dtc.h
@@ -168,6 +168,8 @@ struct node {
 
 	struct label *labels;
 	const struct bus_type *bus;
+
+	int needs_reference, is_referenced;
 };
 
 #define for_each_label_withdel(l0, l) \
@@ -202,6 +204,8 @@ struct property *reverse_properties(struct property *first);
 struct node *build_node(struct property *proplist, struct node *children);
 struct node *build_node_delete(void);
 struct node *name_node(struct node *node, char *name);
+struct node *mark_node_needs_reference(struct node *node);
+struct node *reference_node(struct node *node);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
 struct node *add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
diff --git a/flattree.c b/flattree.c
index 8d268fb785db..39eb9934457b 100644
--- a/flattree.c
+++ b/flattree.c
@@ -258,6 +258,9 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	if (tree->deleted)
 		return;
 
+	if (tree->needs_reference && !tree->is_referenced)
+		return;
+
 	emit->beginnode(etarget, tree->labels);
 
 	if (vi->flags & FTF_FULLPATH)
diff --git a/livetree.c b/livetree.c
index 57b7db2ed153..4b595c4b5e0a 100644
--- a/livetree.c
+++ b/livetree.c
@@ -134,6 +134,20 @@ struct node *name_node(struct node *node, char *name)
 	return node;
 }
 
+struct node *mark_node_needs_reference(struct node *node)
+{
+	node->needs_reference = 1;
+
+	return node;
+}
+
+struct node *reference_node(struct node *node)
+{
+	node->is_referenced = 1;
+
+	return node;
+}
+
 struct node *merge_nodes(struct node *old_node, struct node *new_node)
 {
 	struct property *new_prop, *old_prop;
-- 
2.14.3
