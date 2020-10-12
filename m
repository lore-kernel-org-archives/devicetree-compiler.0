From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 10/11] checks: Fix signedness comparisons warnings
Date: Mon, 12 Oct 2020 17:19:47 +0100
Message-ID: <20201012161948.23994-11-andre.przywara@arm.com>
References: <20201012161948.23994-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201012161948.23994-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness in
comparisons in various parts in checks.c.

Fix those by making all affected variables unsigned. This covers return
values of the (unsigned) size_t type, phandles, variables holding sizes
in general and loop counters only ever counting positives values.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 checks.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/checks.c b/checks.c
index 7cb9011..e2c70d0 100644
--- a/checks.c
+++ b/checks.c
@@ -303,7 +303,7 @@ ERROR(duplicate_property_names, check_duplicate_property_names, NULL);
 static void check_node_name_chars(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
-	int n = strspn(node->name, c->data);
+	unsigned int n = strspn(node->name, c->data);
 
 	if (n < strlen(node->name))
 		FAIL(c, dti, node, "Bad character '%c' in node name",
@@ -363,7 +363,7 @@ static void check_property_name_chars(struct check *c, struct dt_info *dti,
 	struct property *prop;
 
 	for_each_property(node, prop) {
-		int n = strspn(prop->name, c->data);
+		unsigned int n = strspn(prop->name, c->data);
 
 		if (n < strlen(prop->name))
 			FAIL_PROP(c, dti, node, prop, "Bad character '%c' in property name",
@@ -380,7 +380,7 @@ static void check_property_name_chars_strict(struct check *c,
 
 	for_each_property(node, prop) {
 		const char *name = prop->name;
-		int n = strspn(name, c->data);
+		unsigned int n = strspn(name, c->data);
 
 		if (n == strlen(prop->name))
 			continue;
@@ -556,7 +556,7 @@ static void check_name_properties(struct check *c, struct dt_info *dti,
 	if (!prop)
 		return; /* No name property, that's fine */
 
-	if ((prop->val.len != node->basenamelen+1)
+	if ((prop->val.len != node->basenamelen + 1U)
 	    || (memcmp(prop->val.val, node->name, node->basenamelen) != 0)) {
 		FAIL(c, dti, node, "\"name\" property is incorrect (\"%s\" instead"
 		     " of base node name)", prop->val.val);
@@ -1367,7 +1367,7 @@ static void check_property_phandle_args(struct check *c,
 				          const struct provider *provider)
 {
 	struct node *root = dti->dt;
-	int cell, cellsize = 0;
+	unsigned int cell, cellsize = 0;
 
 	if (prop->val.len % sizeof(cell_t)) {
 		FAIL_PROP(c, dti, node, prop,
@@ -1584,7 +1584,8 @@ static void check_interrupts_property(struct check *c,
 	struct node *root = dti->dt;
 	struct node *irq_node = NULL, *parent = node;
 	struct property *irq_prop, *prop = NULL;
-	int irq_cells, phandle;
+	int irq_cells;
+	cell_t phandle;
 
 	irq_prop = get_property(node, "interrupts");
 	if (!irq_prop)
@@ -1750,7 +1751,7 @@ WARNING(graph_port, check_graph_port, NULL, &graph_nodes);
 static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
 					struct node *endpoint)
 {
-	int phandle;
+	cell_t phandle;
 	struct node *node;
 	struct property *prop;
 
@@ -1882,7 +1883,7 @@ static void enable_warning_error(struct check *c, bool warn, bool error)
 
 static void disable_warning_error(struct check *c, bool warn, bool error)
 {
-	int i;
+	unsigned int i;
 
 	/* Lowering level, also lower it for things this is the prereq
 	 * for */
@@ -1903,7 +1904,7 @@ static void disable_warning_error(struct check *c, bool warn, bool error)
 
 void parse_checks_option(bool warn, bool error, const char *arg)
 {
-	int i;
+	unsigned int i;
 	const char *name = arg;
 	bool enable = true;
 
@@ -1930,7 +1931,7 @@ void parse_checks_option(bool warn, bool error, const char *arg)
 
 void process_checks(bool force, struct dt_info *dti)
 {
-	int i;
+	unsigned int i;
 	int error = 0;
 
 	for (i = 0; i < ARRAY_SIZE(check_table); i++) {
-- 
2.17.5

