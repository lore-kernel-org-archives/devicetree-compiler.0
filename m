From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] checks: Error on node-name and property name being the same
Date: Tue,  9 Feb 2021 11:50:59 -0600
Message-ID: <20210209175059.60057-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kBbqTGujwf4dGe99XqmraeqjBBUPlWVQ0ZmmZmrg+i8=;
        b=VUL/6mB03aS2ZLo6YYldpiCsUHzm1dUuxvuC9thRFFjATCrOHcSxctK8aYwzIVtQsV
         0EHYwyZNOSBjpsAKgxpoTTSiKA3OwSwrFV1S+hQuYtfqDctMu17Bek0rdc4wbjKD1THD
         Dk1qgSga3lP2u7UAWqju9mIWLC40cpxOTznaLOpMV5ZuoRM+H6py/LhS+8IHc7c1EC6T
         ZgOugDXrC6vBzek3uxQ7H1UWrtQ0JHpUvNKxJrM+wh8DKZidsNUmrYtX6UOna87yLewe
         OAkCtgLu0sRUJ1DOlIz++T3B1YA372Lv4NVq8TLvOyDfri8AVY4Ir9n2ZQnF2luSBkS3
         ZnYA==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-5wv7dgnIgG8@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Treat a node-name and property name at the same level of tree as
an error.

Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 checks.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 17cb689..3f46043 100644
--- a/checks.c
+++ b/checks.c
@@ -330,6 +330,22 @@ static void check_node_name_format(struct check *c, struct dt_info *dti,
 }
 ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
 
+static void check_node_name_vs_property_name(struct check *c,
+					     struct dt_info *dti,
+					     struct node *node)
+{
+	struct property *prop;
+
+	if (node->parent) {
+		for_each_property(node->parent, prop) {
+			if (strcmp(node->name, prop->name) == 0)
+				FAIL(c, dti, node, "node name and property name conflict");
+		}
+	}
+}
+ERROR(node_name_vs_property_name, check_node_name_vs_property_name,
+      NULL, &node_name_chars);
+
 static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
 				      struct node *node)
 {
@@ -1796,7 +1812,7 @@ WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
-	&name_is_string, &name_properties,
+	&name_is_string, &name_properties, &node_name_vs_property_name,
 
 	&duplicate_label,
 
-- 
2.29.2

