From: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Subject: [PATCH 1/4] Microsoft Visual C patches
Date: Wed, 18 Jun 2014 20:01:48 +0300
Message-ID: <53A1C5FC.9040105@errapartengineering.com>
References: <539DBFC8.4050204@errapartengineering.com> <20140616104628.GB29264@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080504050302010507010700"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140616104628.GB29264-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is a multi-part message in MIME format.
--------------080504050302010507010700
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------080504050302010507010700
Content-Type: text/plain; charset=windows-1257;
 name="checks.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="checks.patch"

commit b8ad167d89d7f5ba6398ffeab6a7f9ece954f208
Author: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Date:   Wed Jun 18 18:43:17 2014 +0200

    * MSVC doesn't support 0-sized arrays.
    * Initialize check->inprogress, too.
    Signed-off-by: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>

diff --git a/checks.c b/checks.c
index 47eda65..bc3c259 100644
--- a/checks.c
+++ b/checks.c
@@ -69,6 +69,7 @@ struct check {
 		.warn = (w), \
 		.error = (e), \
 		.status = UNCHECKED, \
+		.inprogress = false, \
 		.num_prereqs = ARRAY_SIZE(nm##_prereqs), \
 		.prereq = nm##_prereqs, \
 	};
@@ -153,7 +154,7 @@ static bool run_check(struct check *c, struct node *dt)
 
 	c->inprogress = true;
 
-	for (i = 0; i < c->num_prereqs; i++) {
+	for (i = 0; i < c->num_prereqs && c->prereq[i]!=NULL; i++) {
 		struct check *prq = c->prereq[i];
 		error = error || run_check(prq, dt);
 		if (prq->status != PASSED) {
@@ -192,7 +193,7 @@ static inline void check_always_fail(struct check *c, struct node *dt)
 {
 	FAIL(c, "always_fail check");
 }
-TREE_CHECK(always_fail, NULL);
+TREE_CHECK(always_fail, NULL, 0);
 
 static void check_is_string(struct check *c, struct node *root,
 			    struct node *node)
@@ -209,9 +210,9 @@ static void check_is_string(struct check *c, struct node *root,
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
@@ -228,9 +229,9 @@ static void check_is_cell(struct check *c, struct node *root,
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
@@ -249,7 +250,7 @@ static void check_duplicate_node_names(struct check *c, struct node *dt,
 				FAIL(c, "Duplicate node name %s",
 				     child->fullpath);
 }
-NODE_ERROR(duplicate_node_names, NULL);
+NODE_ERROR(duplicate_node_names, NULL, 0);
 
 static void check_duplicate_property_names(struct check *c, struct node *dt,
 					   struct node *node)
@@ -266,7 +267,7 @@ static void check_duplicate_property_names(struct check *c, struct node *dt,
 		}
 	}
 }
-NODE_ERROR(duplicate_property_names, NULL);
+NODE_ERROR(duplicate_property_names, NULL, 0);
 
 #define LOWERCASE	"abcdefghijklmnopqrstuvwxyz"
 #define UPPERCASE	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
@@ -282,7 +283,7 @@ static void check_node_name_chars(struct check *c, struct node *dt,
 		FAIL(c, "Bad character '%c' in node %s",
 		     node->name[n], node->fullpath);
 }
-NODE_ERROR(node_name_chars, PROPNODECHARS "@");
+NODE_ERROR(node_name_chars, PROPNODECHARS "@", 0);
 
 static void check_node_name_format(struct check *c, struct node *dt,
 				   struct node *node)
@@ -302,7 +303,7 @@ static void check_property_name_chars(struct check *c, struct node *dt,
 		FAIL(c, "Bad character '%c' in property name \"%s\", node %s",
 		     prop->name[n], prop->name, node->fullpath);
 }
-PROP_ERROR(property_name_chars, PROPNODECHARS);
+PROP_ERROR(property_name_chars, PROPNODECHARS, 0);
 
 #define DESCLABEL_FMT	"%s%s%s%s%s"
 #define DESCLABEL_ARGS(node,prop,mark)		\
@@ -358,7 +359,7 @@ static void check_duplicate_label_prop(struct check *c, struct node *dt,
 		check_duplicate_label(c, dt, m->ref, node, prop, m);
 }
 ERROR(duplicate_label, NULL, check_duplicate_label_node,
-      check_duplicate_label_prop, NULL);
+      check_duplicate_label_prop, NULL, 0);
 
 static void check_explicit_phandles(struct check *c, struct node *root,
 				    struct node *node, struct property *prop)
@@ -417,7 +418,7 @@ static void check_explicit_phandles(struct check *c, struct node *root,
 
 	node->phandle = phandle;
 }
-PROP_ERROR(explicit_phandles, NULL);
+PROP_ERROR(explicit_phandles, NULL, 0);
 
 static void check_name_properties(struct check *c, struct node *root,
 				  struct node *node)
@@ -649,7 +650,7 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
 		FAIL(c, "/chosen has obsolete \"interrupt-controller\" "
 		     "property");
 }
-TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
+TREE_WARNING(obsolete_chosen_interrupt_controller, NULL, 0);
 
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
@@ -678,8 +679,10 @@ static void enable_warning_error(struct check *c, bool warn, bool error)
 
 	/* Raising level, also raise it for prereqs */
 	if ((warn && !c->warn) || (error && !c->error))
-		for (i = 0; i < c->num_prereqs; i++)
+		for (i = 0; i < c->num_prereqs && c->prereq[i] != NULL; i++)
 			enable_warning_error(c->prereq[i], warn, error);
+		/* check->prereq[i] might be NULL; this is because MSVC doesn't
+		 * support 0-sized arrays.  */
 
 	c->warn = c->warn || warn;
 	c->error = c->error || error;
@@ -696,9 +699,11 @@ static void disable_warning_error(struct check *c, bool warn, bool error)
 			struct check *cc = check_table[i];
 			int j;
 
-			for (j = 0; j < cc->num_prereqs; j++)
+			for (j = 0; j < cc->num_prereqs && cc->prereq[j] != NULL; j++)
 				if (cc->prereq[j] == c)
 					disable_warning_error(cc, warn, error);
+			/* check->prereq[j] might be NULL; this is because MSVC doesn't
+			 * support 0-sized arrays.  */
 		}
 	}
 

--------------080504050302010507010700--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
