From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3] checks: Warn on node-name and property name being the same
Date: Tue,  9 Feb 2021 22:15:10 -0600
Message-ID: <20210210041510.382114-1-kumar.gala@linaro.org>
References: <20210209175059.60057-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hOpDo131S/cOutNZvFC8yAmUJ5yP8l8kqyr4rnD4GoQ=;
        b=dA/zXyAmTAzzJv7DR4/5zPEaXszbakbEoCbR6NjSfVPxMB6XsUVAp0JoFIPo9+9jjo
         bcxja0WX+rCpQlCTrYkXClko1YnBcLMjIXBZFYK9Yg/MCVXztQYdqnGYdRE54dFrqqSZ
         U1XGpPg5g676Z+1Dcg2hJyuTbVxzWsP5nxLnWp8iISZ6xhOzW6eRrrXkhoyDqicc1x6e
         zE68+Izx+TuwExon0fNi/NawgxItXAi9dcL1wfIw/Xy6oD5CcpJilAqnEIswMqRdZ8Tx
         lOQ9/3hIExJsewWh9064Dk5YR4IWlmJ1ROqoo7zYYmzgHAoS442rvQvRMDl4AvV8xt9H
         Ou4Q==
In-Reply-To: <20210209175059.60057-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-5wv7dgnIgG8@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Treat a node-name and property name at the same level of tree as
a warning

Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 checks.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 17cb689..7f9e670 100644
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
+WARNING(node_name_vs_property_name, check_node_name_vs_property_name,
+	NULL, &node_name_chars);
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

