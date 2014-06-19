From: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH 1/4] Microsoft Visual C patches
Date: Thu, 19 Jun 2014 17:17:40 +0300
Message-ID: <53A2F104.90701@errapartengineering.com>
References: <539DBFC8.4050204@errapartengineering.com> <20140616104628.GB29264@voom.redhat.com> <53A1C5FC.9040105@errapartengineering.com> <20140619111459.GM29264@voom.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140619111459.GM29264-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

First, thanks for accepting 3 of the patches!

19.06.2014 14:14, David Gibson kirjutas:
> Ugh, this is by far the ugliest of these workarounds, and the reason
> for it in the code is really non-obvious.  I'll have to think about
> this some more.

Good point. Kind of careless of me not to pay attention to that aspect.

What about dropping the field "num_prereqs" altogether? It forces 
someone looping over the field "prereq" to think about the end condition 
and comparision with NULL (or nullptr) is an obvious answer. A diff is 
at the end of the letter.

>>      * Initialize check->inprogress, too.
>
> Why..?

Stumbled over that one - the value of inprogress was in some cases 
initialized to "true" when compiled with MSVC.

According to the C99 draft 
(http://www.open-std.org/jtc1/sc22/WG14/www/docs/n1256.pdf, pages 
137,138), in static storage all fields are initialized to zero, null, 0.

According to MSDN 
(http://msdn.microsoft.com/en-us/library/81k8cwsz.aspx), initilization 
is required: "If initializer-list has fewer values than an aggregate 
type, the remaining members or elements of the aggregate type are 
initialized to 0. The initial value of an automatic identifier not 
explicitly initialized is undefined."

> I've applied patches 2, 3, and 4.  But for future reference, please remember:
>
>    * Patches should be inline, not attachments
>    * Commit message and signed-off-by lines should not be indented
>    * Commit messages need more details on the reason for the patch (see
>      the changes I've made for examples).
>    * Commit messages need a 1 line summary at the top (2, 3, and 4 have
>      this, but 1 doesn't)
>    * There should be a blank line between the 1-lite summary and the
>      remainder of the commit message

Thanks again.

Is there an automated command to format the commit message per the 
requirements?


best regards,
Andrei

--------------------------------------------------------

diff --git a/checks.c b/checks.c
index 47eda65..fe90dfc 100644
--- a/checks.c
+++ b/checks.c
@@ -54,12 +54,11 @@ struct check {
  	bool warn, error;
  	enum checkstatus status;
  	bool inprogress;
-	int num_prereqs;
  	struct check **prereq;
  };

  #define CHECK_ENTRY(nm, tfn, nfn, pfn, d, w, e, ...)	       \
-	static struct check *nm##_prereqs[] = { __VA_ARGS__ }; \
+	static struct check *nm##_prereqs[] = { __VA_ARGS__, NULL }; \
  	static struct check nm = { \
  		.name = #nm, \
  		.tree_fn = (tfn), \
@@ -69,7 +68,6 @@ struct check {
  		.warn = (w), \
  		.error = (e), \
  		.status = UNCHECKED, \
-		.num_prereqs = ARRAY_SIZE(nm##_prereqs), \
  		.prereq = nm##_prereqs, \
  	};
  #define WARNING(nm, tfn, nfn, pfn, d, ...) \
@@ -153,7 +151,7 @@ static bool run_check(struct check *c, struct node *dt)

  	c->inprogress = true;

-	for (i = 0; i < c->num_prereqs; i++) {
+	for (i = 0; c->prereq[i] != NULL; i++) {
  		struct check *prq = c->prereq[i];
  		error = error || run_check(prq, dt);
  		if (prq->status != PASSED) {
@@ -192,7 +190,7 @@ static inline void check_always_fail(struct check 
*c, struct node *dt)
  {
  	FAIL(c, "always_fail check");
  }
-TREE_CHECK(always_fail, NULL);
+TREE_CHECK(always_fail, NULL, NULL);

  static void check_is_string(struct check *c, struct node *root,
  			    struct node *node)
@@ -209,9 +207,9 @@ static void check_is_string(struct check *c, struct 
node *root,
  		     propname, node->fullpath);
  }
  #define WARNING_IF_NOT_STRING(nm, propname) \
-	WARNING(nm, NULL, check_is_string, NULL, (propname))
+	WARNING(nm, NULL, check_is_string, NULL, (propname), NULL)
  #define ERROR_IF_NOT_STRING(nm, propname) \
-	ERROR(nm, NULL, check_is_string, NULL, (propname))
+	ERROR(nm, NULL, check_is_string, NULL, (propname), NULL)

  static void check_is_cell(struct check *c, struct node *root,
  			  struct node *node)
@@ -228,9 +226,9 @@ static void check_is_cell(struct check *c, struct 
node *root,
  		     propname, node->fullpath);
  }
  #define WARNING_IF_NOT_CELL(nm, propname) \
-	WARNING(nm, NULL, check_is_cell, NULL, (propname))
+	WARNING(nm, NULL, check_is_cell, NULL, (propname), NULL)
  #define ERROR_IF_NOT_CELL(nm, propname) \
-	ERROR(nm, NULL, check_is_cell, NULL, (propname))
+	ERROR(nm, NULL, check_is_cell, NULL, (propname), NULL)

  /*
   * Structural check functions
@@ -249,7 +247,7 @@ static void check_duplicate_node_names(struct check 
*c, struct node *dt,
  				FAIL(c, "Duplicate node name %s",
  				     child->fullpath);
  }
-NODE_ERROR(duplicate_node_names, NULL);
+NODE_ERROR(duplicate_node_names, NULL, NULL);

  static void check_duplicate_property_names(struct check *c, struct 
node *dt,
  					   struct node *node)
@@ -266,7 +264,7 @@ static void check_duplicate_property_names(struct 
check *c, struct node *dt,
  		}
  	}
  }
-NODE_ERROR(duplicate_property_names, NULL);
+NODE_ERROR(duplicate_property_names, NULL, NULL);

  #define LOWERCASE	"abcdefghijklmnopqrstuvwxyz"
  #define UPPERCASE	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
@@ -282,7 +280,7 @@ static void check_node_name_chars(struct check *c, 
struct node *dt,
  		FAIL(c, "Bad character '%c' in node %s",
  		     node->name[n], node->fullpath);
  }
-NODE_ERROR(node_name_chars, PROPNODECHARS "@");
+NODE_ERROR(node_name_chars, PROPNODECHARS "@", NULL);

  static void check_node_name_format(struct check *c, struct node *dt,
  				   struct node *node)
@@ -302,7 +300,7 @@ static void check_property_name_chars(struct check 
*c, struct node *dt,
  		FAIL(c, "Bad character '%c' in property name \"%s\", node %s",
  		     prop->name[n], prop->name, node->fullpath);
  }
-PROP_ERROR(property_name_chars, PROPNODECHARS);
+PROP_ERROR(property_name_chars, PROPNODECHARS, NULL);

  #define DESCLABEL_FMT	"%s%s%s%s%s"
  #define DESCLABEL_ARGS(node,prop,mark)		\
@@ -358,7 +356,7 @@ static void check_duplicate_label_prop(struct check 
*c, struct node *dt,
  		check_duplicate_label(c, dt, m->ref, node, prop, m);
  }
  ERROR(duplicate_label, NULL, check_duplicate_label_node,
-      check_duplicate_label_prop, NULL);
+      check_duplicate_label_prop, NULL, NULL);

  static void check_explicit_phandles(struct check *c, struct node *root,
  				    struct node *node, struct property *prop)
@@ -417,7 +415,7 @@ static void check_explicit_phandles(struct check *c, 
struct node *root,

  	node->phandle = phandle;
  }
-PROP_ERROR(explicit_phandles, NULL);
+PROP_ERROR(explicit_phandles, NULL, NULL);

  static void check_name_properties(struct check *c, struct node *root,
  				  struct node *node)
@@ -649,7 +647,7 @@ static void 
check_obsolete_chosen_interrupt_controller(struct check *c,
  		FAIL(c, "/chosen has obsolete \"interrupt-controller\" "
  		     "property");
  }
-TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
+TREE_WARNING(obsolete_chosen_interrupt_controller, NULL, NULL);

  static struct check *check_table[] = {
  	&duplicate_node_names, &duplicate_property_names,
@@ -678,7 +676,7 @@ static void enable_warning_error(struct check *c, 
bool warn, bool error)

  	/* Raising level, also raise it for prereqs */
  	if ((warn && !c->warn) || (error && !c->error))
-		for (i = 0; i < c->num_prereqs; i++)
+		for (i = 0; c->prereq[i] != NULL; i++)
  			enable_warning_error(c->prereq[i], warn, error);

  	c->warn = c->warn || warn;
@@ -696,7 +694,7 @@ static void disable_warning_error(struct check *c, 
bool warn, bool error)
  			struct check *cc = check_table[i];
  			int j;

-			for (j = 0; j < cc->num_prereqs; j++)
+			for (j = 0; cc->prereq[j] != NULL; j++)
  				if (cc->prereq[j] == c)
  					disable_warning_error(cc, warn, error);
  		}

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
