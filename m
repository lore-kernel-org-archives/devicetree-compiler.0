From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Fix ambiguous grammar for devicetree rule
Date: Mon, 20 Nov 2017 17:12:18 +0000
Message-ID: <20171120171218.3320-1-grant@tiffany.secretlab.ca>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Dq7e2w4MJoyAoXgFBIuPqNdFBAeo+mUdizX+5E5WX+E=;
        b=0m/GoXL/gNIKWkqWYGgChFpVJfRkKC+7lJsURw/jyPYw+0ryaJomq5hVrJOsXi067q
         Eqcg7oCKwefwE1VBR3RtN4c1PNjEgbKEjrZuD6ZuP49x3/0fP1CvEBnQtx+/FxJYaJZ8
         Uzdv4jr1Z1/sWwnv3EyYsbHtv5rdS4ytYF4QZHUynbVAx6ZuouoD11XZJCup7whD3hUv
         8fAUgHAfUgobsgHvkScLayKaWB/f6kbj9VH3jkk/L7tQFx++FHJi0rh9CY1HNLPxA3V2
         1JlqKDCUozSItLoPyG7OESA6U5c7Hfu6EUoSgx6ILcjlWu6d2vn26ImrPGTbfrG4dODv
         76OA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

From: Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>

Commit 737b2df3, "overlay: Add syntactic sugar version of overlays"
introduced an empty rule for "devicetree" that created ambiguities in
the grammar and causes the following warning:

         BISON dtc-parser.tab.c
  dtc-parser.y: warning: 3 shift/reduce conflicts [-Wconflicts-sr]

Fix the grammar by explicitly testing for the condition the
new overlay grammar wants to use. This means duplicating a very small
amount of grammar processing code, but the alternative seems to be a
more invasive reorganization of the devicetree rule. Better to fix it
this way now and save the reorg for a separate patch

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 17 +++++++++++------
 dtc.h        |  2 +-
 livetree.c   |  3 ++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index affc81a..44af170 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -166,7 +166,17 @@ devicetree:
 		{
 			$$ = merge_nodes($1, $3);
 		}
-
+	| DT_REF nodedef
+		{
+			/*
+			 * We rely on the rule being always:
+			 *   versioninfo plugindecl memreserves devicetree
+			 * so $-1 is what we want (plugindecl)
+			 */
+			if (!($<flags>-1 & DTSF_PLUGIN))
+				ERROR(&@2, "Label or path %s not found", $1);
+			$$ = add_orphan_node(name_node(build_node(NULL, NULL), ""), $2, $1);
+		}
 	| devicetree DT_LABEL DT_REF nodedef
 		{
 			struct node *target = get_node_by_ref($1, $3);
@@ -209,11 +219,6 @@ devicetree:
 
 			$$ = $1;
 		}
-	| /* empty */
-		{
-			/* build empty node */
-			$$ = name_node(build_node(NULL, NULL), "");
-		}
 	;
 
 nodedef:
diff --git a/dtc.h b/dtc.h
index 35cf926..84187a1 100644
--- a/dtc.h
+++ b/dtc.h
@@ -203,7 +203,7 @@ struct node *build_node_delete(void);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
-void add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
+struct node *add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
diff --git a/livetree.c b/livetree.c
index 6846ad2..4a3d893 100644
--- a/livetree.c
+++ b/livetree.c
@@ -216,7 +216,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	return old_node;
 }
 
-void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
+struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 {
 	static unsigned int next_orphan_fragment = 0;
 	struct node *node;
@@ -236,6 +236,7 @@ void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 	name_node(node, name);
 
 	add_child(dt, node);
+	return dt;
 }
 
 struct node *chain_node(struct node *first, struct node *list)
-- 
2.11.0
