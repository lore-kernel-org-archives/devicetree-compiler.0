From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 5/5] checks: Add a sanity check for #.*-cells property value
Date: Mon, 11 Oct 2021 14:12:45 -0500
Message-ID: <20211011191245.1009682-5-robh@kernel.org>
References: <20211011191245.1009682-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211011191245.1009682-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

While in theory any value of number of cells is allowed for a #.*-cells
property, for all practical purposes the number of cells is never more than
a few cells. Add a check that the value is less than 255. This will catch
cases like this which will currently pass:

  #foo-cells = "bar";

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 903083bfc423..467442250eda 100644
--- a/checks.c
+++ b/checks.c
@@ -260,8 +260,14 @@ static void check_is_cell(struct check *c, struct dt_info *dti,
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
 	WARNING(nm, check_is_cell, (propname))
-- 
2.30.2

