From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] checks: Add a sanity check for #.*-cells property value
Date: Fri, 15 Oct 2021 16:35:27 -0500
Message-ID: <20211015213527.2237774-2-robh@kernel.org>
References: <20211015213527.2237774-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211015213527.2237774-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

While in theory any value of number of cells is allowed for a #.*-cells
property, for all practical purposes the number of cells is never more than
a few cells. Add a check that the value is less than 255. This will catch
cases like this which will currently pass:

  #foo-cells = "bar";

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v3:
 - Rename check_is_cell to check_is_provider_cell
v2:
 - new patch
---
 checks.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/checks.c b/checks.c
index 781ba1129a8e..704e99ebd66c 100644
--- a/checks.c
+++ b/checks.c
@@ -250,8 +250,9 @@ static void check_is_string_list(struct check *c, struct dt_info *dti,
 #define ERROR_IF_NOT_STRING_LIST(nm, propname) \
 	ERROR(nm, check_is_string_list, (propname))
 
-static void check_is_cell(struct check *c, struct dt_info *dti,
-			  struct node *node)
+/* A check for provider '#.*-cells' properties */
+static void check_is_provider_cell(struct check *c, struct dt_info *dti,
+				   struct node *node)
 {
 	struct property *prop;
 	char *propname = c->data;
@@ -260,13 +261,19 @@ static void check_is_cell(struct check *c, struct dt_info *dti,
 	if (!prop)
 		return; /* Not present, assumed ok */
 
-	if (prop->val.len != sizeof(cell_t))
+	if (prop->val.len != sizeof(cell_t)) {
 		FAIL_PROP(c, dti, node, prop, "property is not a single cell");
+		return;
+	}
+
+	/* Sanity test for reasonable number of cells */
+	if (propval_cell(prop) > 255)
+		FAIL_PROP(c, dti, node, prop, "cell size out of range (>255)");
 }
 #define WARNING_IF_NOT_CELL(nm, propname) \
-	WARNING(nm, check_is_cell, (propname))
+	WARNING(nm, check_is_provider_cell, (propname))
 #define ERROR_IF_NOT_CELL(nm, propname) \
-	ERROR(nm, check_is_cell, (propname))
+	ERROR(nm, check_is_provider_cell, (propname))
 
 /*
  * Structural check functions
-- 
2.30.2

