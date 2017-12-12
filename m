From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 5/6] checks: add aliases node checks
Date: Tue, 12 Dec 2017 16:46:28 -0600
Message-ID: <20171212224629.28738-5-robh@kernel.org>
References: <20171212224629.28738-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212224629.28738-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add checks for aliases node that all properties follow alias naming
convention and the values are a valid path.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- Drop known name check
- Add character set check for alias names

 checks.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/checks.c b/checks.c
index e0ec67be1b7a..66e5fd6405a5 100644
--- a/checks.c
+++ b/checks.c
@@ -636,6 +636,28 @@ static void check_names_is_string_list(struct check *c, struct dt_info *dti,
 }
 WARNING(names_is_string_list, check_names_is_string_list, NULL);
 
+static void check_alias_paths(struct check *c, struct dt_info *dti,
+				    struct node *node)
+{
+	struct property *prop;
+
+	if (!streq(node->name, "aliases"))
+		return;
+
+	for_each_property(node, prop) {
+		if (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val)) {
+			FAIL(c, dti, "aliases property '%s' is not a valid node (%s)",
+			     prop->name, prop->val.val);
+			continue;
+		}
+		if (strspn(prop->name, LOWERCASE DIGITS "-") != strlen(prop->name))
+			FAIL(c, dti, "aliases property name '%s' is not valid",
+			     prop->name);
+
+	}
+}
+WARNING(alias_paths, check_alias_paths, NULL);
+
 static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
@@ -1354,6 +1376,8 @@ static struct check *check_table[] = {
 	&gpios_property,
 	&interrupts_property,
 
+	&alias_paths,
+
 	&always_fail,
 };
 
-- 
2.14.1
