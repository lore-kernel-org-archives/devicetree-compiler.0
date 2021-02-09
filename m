From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] checks: Error on node-name and property name being the same
Date: Tue,  9 Feb 2021 12:38:47 -0600
Message-ID: <20210209183847.62557-1-kumar.gala@linaro.org>
References: <20210209172451.56967-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RB502ORQJk4qbC4aWBBfUE8QZ/jaEH25KkQ63rJMsSA=;
        b=UkHZdVoyCjCRsP9YpFt/HBOu8pSxfNuRvElsPafRcKa87hZCwc6y8pF+t++gYiSBE1
         SJ3Ps2ZNyni5UtktVVJbZM+6+SrIZ5sn23wf/hpsK3ZXZUWwsuW1eCfCijzi0xLz8+no
         cW3uyKqWPNW6LKsE7Q79OjGej9YULcjBoacmW5tldT5Hj+8eHAvmKT4hD1grvk28Y3HK
         8VSB+1dR6FRoGy1KfpGJf8y6RKrIxtE3BcBsaV937Tesa1UwBhNjjWOw/lnJqggDMfBt
         mRHd3l8qUbd2YDMTljPR5rADlWyitj5QKxc92qoeKB3gWJ/VJe1qYbrh2vSBQ4374evG
         i3zg==
In-Reply-To: <20210209172451.56967-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Treat a node-name and property name at the same level of tree as
an error.

Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 checks.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 17cb689..4d1a4ef 100644
--- a/checks.c
+++ b/checks.c
@@ -330,6 +330,23 @@ static void check_node_name_format(struct check *c, struct dt_info *dti,
 }
 ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
 
+static void check_node_name_vs_property_name(struct check *c,
+					     struct dt_info *dti,
+					     struct node *node)
+{
+	struct property *prop;
+
+	if (!node->parent)
+		return;
+
+	for_each_property(node->parent, prop) {
+		if (streq(node->name, prop->name))
+			FAIL(c, dti, node, "node name and property name conflict");
+	}
+}
+ERROR(node_name_vs_property_name, check_node_name_vs_property_name,
+      NULL, &node_name_chars);
+
 static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
 				      struct node *node)
 {
@@ -1796,7 +1813,7 @@ WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
-	&name_is_string, &name_properties,
+	&name_is_string, &name_properties, &node_name_vs_property_name,
 
 	&duplicate_label,
 
-- 
2.29.2

