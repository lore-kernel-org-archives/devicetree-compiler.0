From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 4/8] dtc: Wrap phandle validity check
Date: Fri, 11 Jun 2021 18:10:36 +0100
Message-ID: <20210611171040.25524-5-andre.przywara@arm.com>
References: <20210611171040.25524-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210611171040.25524-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

In several places we check for a returned phandle value to be valid,
for that it must not be 0 or "-1".

Wrap this check in a static inline function in dtc.h, and use ~0U instead
of -1 on the way, to keep everything in the unsigned realm.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 checks.c   | 10 +++++-----
 dtc.h      |  5 +++++
 livetree.c |  4 ++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/checks.c b/checks.c
index e6c7c3e..67647fa 100644
--- a/checks.c
+++ b/checks.c
@@ -520,7 +520,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 
 	phandle = propval_cell(prop);
 
-	if ((phandle == 0) || (phandle == -1)) {
+	if (!fdt_is_valid_phandle(phandle)) {
 		FAIL_PROP(c, dti, node, prop, "bad value (0x%x) in %s property",
 		     phandle, prop->name);
 		return 0;
@@ -1400,14 +1400,14 @@ static void check_property_phandle_args(struct check *c,
 	for (cell = 0; cell < prop->val.len / sizeof(cell_t); cell += cellsize + 1) {
 		struct node *provider_node;
 		struct property *cellprop;
-		int phandle;
+		cell_t phandle;
 
 		phandle = propval_cell_n(prop, cell);
 		/*
 		 * Some bindings use a cell value 0 or -1 to skip over optional
 		 * entries when each index position has a specific definition.
 		 */
-		if (phandle == 0 || phandle == -1) {
+		if (!fdt_is_valid_phandle(phandle)) {
 			/* Give up if this is an overlay with external references */
 			if (dti->dtsflags & DTSF_PLUGIN)
 				break;
@@ -1615,7 +1615,7 @@ static void check_interrupts_property(struct check *c,
 		prop = get_property(parent, "interrupt-parent");
 		if (prop) {
 			phandle = propval_cell(prop);
-			if ((phandle == 0) || (phandle == -1)) {
+			if (!fdt_is_valid_phandle(phandle)) {
 				/* Give up if this is an overlay with
 				 * external references */
 				if (dti->dtsflags & DTSF_PLUGIN)
@@ -1772,7 +1772,7 @@ static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
 
 	phandle = propval_cell(prop);
 	/* Give up if this is an overlay with external references */
-	if (phandle == 0 || phandle == -1)
+	if (!fdt_is_valid_phandle(phandle))
 		return NULL;
 
 	node = get_node_by_phandle(dti->dt, phandle);
diff --git a/dtc.h b/dtc.h
index 6296361..3357300 100644
--- a/dtc.h
+++ b/dtc.h
@@ -51,6 +51,11 @@ extern int annotate;		/* annotate .dts with input source location */
 
 typedef uint32_t cell_t;
 
+static inline bool fdt_is_valid_phandle(cell_t phandle)
+{
+	return phandle != 0 && phandle != ~0U;
+}
+
 static inline uint16_t dtb_ld16(const void *p)
 {
 	const uint8_t *bp = (const uint8_t *)p;
diff --git a/livetree.c b/livetree.c
index 7eacd02..cf2f63d 100644
--- a/livetree.c
+++ b/livetree.c
@@ -559,7 +559,7 @@ struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
 {
 	struct node *child, *node;
 
-	if ((phandle == 0) || (phandle == -1)) {
+	if (!fdt_is_valid_phandle(phandle)) {
 		assert(generate_fixups);
 		return NULL;
 	}
@@ -594,7 +594,7 @@ cell_t get_node_phandle(struct node *root, struct node *node)
 	static cell_t phandle = 1; /* FIXME: ick, static local */
 	struct data d = empty_data;
 
-	if ((node->phandle != 0) && (node->phandle != -1))
+	if (fdt_is_valid_phandle(node->phandle))
 		return node->phandle;
 
 	while (get_node_by_phandle(root, phandle))
-- 
2.17.5

