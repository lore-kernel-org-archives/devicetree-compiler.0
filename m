From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/5] checks: Pass boot_info instead of root node
Date: Sat,  3 Dec 2016 17:47:28 -0700
Message-ID: <1480812452-7561-2-git-send-email-sjg@chromium.org>
References: <1480812452-7561-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/SD0hWY1h++ywAiJnNp0UbvmPjlQCBWgdO9SDYJYwsU=;
        b=ATO3XXuTKhzy/iGoxDhLT7gLSBcHumQGmDeWAHfIzd2ZqYH468waLDGhNzVbQyGUVn
         GhI0lwxQXJr5kcX87ng/G5lndGKNMr8PdN5e3nad56BoPjdBTvUZu19QmFY70M9TJ0+4
         ppMK53/uKeDgU8dxD09LH8OAn6Pdt1Kqzrhysv3t6hfXiNhj8RbsuCb7xk9SQ0/Wu1SI
         RwAHA2+HIhU/p5WGC1kPC3C+GOls/g4GZ43ygyB61DexEPyoAFzWO/CqTAw1P/Ci/les
         B0xkwMpd1crxT8k377roY7H1fSbXaObJfyJISdLmX0oMkdaw3mWA2ylSV1HDgdg0SNnq
         WdQA==
In-Reply-To: <1480812452-7561-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

As preparation for overlay support we need to pass the boot info
parameter instead of the root node to each check method.

The root node can be retrieved by accessing boot info's dt member.

No other functional changes are made.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v3: None
Changes in v2: None

 checks.c | 78 ++++++++++++++++++++++++++++++++++------------------------------
 1 file changed, 42 insertions(+), 36 deletions(-)

diff --git a/checks.c b/checks.c
index 0381c98..2bd27a4 100644
--- a/checks.c
+++ b/checks.c
@@ -40,7 +40,7 @@ enum checkstatus {
 
 struct check;
 
-typedef void (*check_fn)(struct check *c, struct node *dt, struct node *node);
+typedef void (*check_fn)(struct check *c, struct boot_info *bi, struct node *node);
 
 struct check {
 	const char *name;
@@ -97,20 +97,21 @@ static inline void check_msg(struct check *c, const char *fmt, ...)
 		check_msg((c), __VA_ARGS__); \
 	} while (0)
 
-static void check_nodes_props(struct check *c, struct node *dt, struct node *node)
+static void check_nodes_props(struct check *c, struct boot_info *bi, struct node *node)
 {
 	struct node *child;
 
 	TRACE(c, "%s", node->fullpath);
 	if (c->fn)
-		c->fn(c, dt, node);
+		c->fn(c, bi, node);
 
 	for_each_child(node, child)
-		check_nodes_props(c, dt, child);
+		check_nodes_props(c, bi, child);
 }
 
-static bool run_check(struct check *c, struct node *dt)
+static bool run_check(struct check *c, struct boot_info *bi)
 {
+	struct node *dt = bi->dt;
 	bool error = false;
 	int i;
 
@@ -123,7 +124,7 @@ static bool run_check(struct check *c, struct node *dt)
 
 	for (i = 0; i < c->num_prereqs; i++) {
 		struct check *prq = c->prereq[i];
-		error = error || run_check(prq, dt);
+		error = error || run_check(prq, bi);
 		if (prq->status != PASSED) {
 			c->status = PREREQ;
 			check_msg(c, "Failed prerequisite '%s'",
@@ -134,7 +135,7 @@ static bool run_check(struct check *c, struct node *dt)
 	if (c->status != UNCHECKED)
 		goto out;
 
-	check_nodes_props(c, dt, dt);
+	check_nodes_props(c, bi, dt);
 
 	if (c->status == UNCHECKED)
 		c->status = PASSED;
@@ -153,14 +154,14 @@ out:
  */
 
 /* A check which always fails, for testing purposes only */
-static inline void check_always_fail(struct check *c, struct node *dt,
+static inline void check_always_fail(struct check *c, struct boot_info *bi,
 				     struct node *node)
 {
 	FAIL(c, "always_fail check");
 }
 CHECK(always_fail, check_always_fail, NULL);
 
-static void check_is_string(struct check *c, struct node *root,
+static void check_is_string(struct check *c, struct boot_info *bi,
 			    struct node *node)
 {
 	struct property *prop;
@@ -179,7 +180,7 @@ static void check_is_string(struct check *c, struct node *root,
 #define ERROR_IF_NOT_STRING(nm, propname) \
 	ERROR(nm, check_is_string, (propname))
 
-static void check_is_cell(struct check *c, struct node *root,
+static void check_is_cell(struct check *c, struct boot_info *bi,
 			  struct node *node)
 {
 	struct property *prop;
@@ -202,7 +203,7 @@ static void check_is_cell(struct check *c, struct node *root,
  * Structural check functions
  */
 
-static void check_duplicate_node_names(struct check *c, struct node *dt,
+static void check_duplicate_node_names(struct check *c, struct boot_info *bi,
 				       struct node *node)
 {
 	struct node *child, *child2;
@@ -217,7 +218,7 @@ static void check_duplicate_node_names(struct check *c, struct node *dt,
 }
 ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
 
-static void check_duplicate_property_names(struct check *c, struct node *dt,
+static void check_duplicate_property_names(struct check *c, struct boot_info *bi,
 					   struct node *node)
 {
 	struct property *prop, *prop2;
@@ -239,7 +240,7 @@ ERROR(duplicate_property_names, check_duplicate_property_names, NULL);
 #define DIGITS		"0123456789"
 #define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
 
-static void check_node_name_chars(struct check *c, struct node *dt,
+static void check_node_name_chars(struct check *c, struct boot_info *bi,
 				  struct node *node)
 {
 	int n = strspn(node->name, c->data);
@@ -250,7 +251,7 @@ static void check_node_name_chars(struct check *c, struct node *dt,
 }
 ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
 
-static void check_node_name_format(struct check *c, struct node *dt,
+static void check_node_name_format(struct check *c, struct boot_info *bi,
 				   struct node *node)
 {
 	if (strchr(get_unitname(node), '@'))
@@ -259,8 +260,8 @@ static void check_node_name_format(struct check *c, struct node *dt,
 }
 ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
 
-static void check_unit_address_vs_reg(struct check *c, struct node *dt,
-			     struct node *node)
+static void check_unit_address_vs_reg(struct check *c, struct boot_info *bi,
+				      struct node *node)
 {
 	const char *unitname = get_unitname(node);
 	struct property *prop = get_property(node, "reg");
@@ -283,7 +284,7 @@ static void check_unit_address_vs_reg(struct check *c, struct node *dt,
 }
 WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
 
-static void check_property_name_chars(struct check *c, struct node *dt,
+static void check_property_name_chars(struct check *c, struct boot_info *bi,
 				      struct node *node)
 {
 	struct property *prop;
@@ -305,10 +306,11 @@ ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
 	((prop) ? (prop)->name : ""), \
 	((prop) ? "' in " : ""), (node)->fullpath
 
-static void check_duplicate_label(struct check *c, struct node *dt,
+static void check_duplicate_label(struct check *c, struct boot_info *bi,
 				  const char *label, struct node *node,
 				  struct property *prop, struct marker *mark)
 {
+	struct node *dt = bi->dt;
 	struct node *othernode = NULL;
 	struct property *otherprop = NULL;
 	struct marker *othermark = NULL;
@@ -331,30 +333,31 @@ static void check_duplicate_label(struct check *c, struct node *dt,
 		     DESCLABEL_ARGS(othernode, otherprop, othermark));
 }
 
-static void check_duplicate_label_node(struct check *c, struct node *dt,
+static void check_duplicate_label_node(struct check *c, struct boot_info *bi,
 				       struct node *node)
 {
 	struct label *l;
 	struct property *prop;
 
 	for_each_label(node->labels, l)
-		check_duplicate_label(c, dt, l->label, node, NULL, NULL);
+		check_duplicate_label(c, bi, l->label, node, NULL, NULL);
 
 	for_each_property(node, prop) {
 		struct marker *m = prop->val.markers;
 
 		for_each_label(prop->labels, l)
-			check_duplicate_label(c, dt, l->label, node, prop, NULL);
+			check_duplicate_label(c, bi, l->label, node, prop, NULL);
 
 		for_each_marker_of_type(m, LABEL)
-			check_duplicate_label(c, dt, m->ref, node, prop, m);
+			check_duplicate_label(c, bi, m->ref, node, prop, m);
 	}
 }
 ERROR(duplicate_label, check_duplicate_label_node, NULL);
 
-static cell_t check_phandle_prop(struct check *c, struct node *root,
+static cell_t check_phandle_prop(struct check *c, struct boot_info *bi,
 				 struct node *node, const char *propname)
 {
+	struct node *root = bi->dt;
 	struct property *prop;
 	struct marker *m;
 	cell_t phandle;
@@ -398,18 +401,19 @@ static cell_t check_phandle_prop(struct check *c, struct node *root,
 	return phandle;
 }
 
-static void check_explicit_phandles(struct check *c, struct node *root,
+static void check_explicit_phandles(struct check *c, struct boot_info *bi,
 				    struct node *node)
 {
+	struct node *root = bi->dt;
 	struct node *other;
 	cell_t phandle, linux_phandle;
 
 	/* Nothing should have assigned phandles yet */
 	assert(!node->phandle);
 
-	phandle = check_phandle_prop(c, root, node, "phandle");
+	phandle = check_phandle_prop(c, bi, node, "phandle");
 
-	linux_phandle = check_phandle_prop(c, root, node, "linux,phandle");
+	linux_phandle = check_phandle_prop(c, bi, node, "linux,phandle");
 
 	if (!phandle && !linux_phandle)
 		/* No valid phandles; nothing further to check */
@@ -433,7 +437,7 @@ static void check_explicit_phandles(struct check *c, struct node *root,
 }
 ERROR(explicit_phandles, check_explicit_phandles, NULL);
 
-static void check_name_properties(struct check *c, struct node *root,
+static void check_name_properties(struct check *c, struct boot_info *bi,
 				  struct node *node)
 {
 	struct property **pp, *prop = NULL;
@@ -467,9 +471,10 @@ ERROR(name_properties, check_name_properties, NULL, &name_is_string);
  * Reference fixup functions
  */
 
-static void fixup_phandle_references(struct check *c, struct node *dt,
+static void fixup_phandle_references(struct check *c, struct boot_info *bi,
 				     struct node *node)
 {
+	struct node *dt = bi->dt;
 	struct property *prop;
 
 	for_each_property(node, prop) {
@@ -495,9 +500,10 @@ static void fixup_phandle_references(struct check *c, struct node *dt,
 ERROR(phandle_references, fixup_phandle_references, NULL,
       &duplicate_node_names, &explicit_phandles);
 
-static void fixup_path_references(struct check *c, struct node *dt,
+static void fixup_path_references(struct check *c, struct boot_info *bi,
 				  struct node *node)
 {
+	struct node *dt = bi->dt;
 	struct property *prop;
 
 	for_each_property(node, prop) {
@@ -534,7 +540,7 @@ WARNING_IF_NOT_STRING(device_type_is_string, "device_type");
 WARNING_IF_NOT_STRING(model_is_string, "model");
 WARNING_IF_NOT_STRING(status_is_string, "status");
 
-static void fixup_addr_size_cells(struct check *c, struct node *dt,
+static void fixup_addr_size_cells(struct check *c, struct boot_info *bi,
 				  struct node *node)
 {
 	struct property *prop;
@@ -558,7 +564,7 @@ WARNING(addr_size_cells, fixup_addr_size_cells, NULL,
 #define node_size_cells(n) \
 	(((n)->size_cells == -1) ? 1 : (n)->size_cells)
 
-static void check_reg_format(struct check *c, struct node *dt,
+static void check_reg_format(struct check *c, struct boot_info *bi,
 			     struct node *node)
 {
 	struct property *prop;
@@ -587,7 +593,7 @@ static void check_reg_format(struct check *c, struct node *dt,
 }
 WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
 
-static void check_ranges_format(struct check *c, struct node *dt,
+static void check_ranges_format(struct check *c, struct boot_info *bi,
 				struct node *node)
 {
 	struct property *prop;
@@ -631,7 +637,7 @@ WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
 /*
  * Style checks
  */
-static void check_avoid_default_addr_size(struct check *c, struct node *dt,
+static void check_avoid_default_addr_size(struct check *c, struct boot_info *bi,
 					  struct node *node)
 {
 	struct property *reg, *ranges;
@@ -657,9 +663,10 @@ WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
 	&addr_size_cells);
 
 static void check_obsolete_chosen_interrupt_controller(struct check *c,
-						       struct node *dt,
+						       struct boot_info *bi,
 						       struct node *node)
 {
+	struct node *dt = bi->dt;
 	struct node *chosen;
 	struct property *prop;
 
@@ -765,7 +772,6 @@ void parse_checks_option(bool warn, bool error, const char *arg)
 
 void process_checks(bool force, struct boot_info *bi)
 {
-	struct node *dt = bi->dt;
 	int i;
 	int error = 0;
 
@@ -773,7 +779,7 @@ void process_checks(bool force, struct boot_info *bi)
 		struct check *c = check_table[i];
 
 		if (c->warn || c->error)
-			error = error || run_check(c, dt);
+			error = error || run_check(c, bi);
 	}
 
 	if (error) {
-- 
2.8.0.rc3.226.g39d4020
