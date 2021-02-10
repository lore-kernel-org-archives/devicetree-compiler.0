From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4] checks: Warn on node-name and property name being the same
Date: Wed, 10 Feb 2021 13:39:12 -0600
Message-ID: <20210210193912.799544-1-kumar.gala@linaro.org>
References: <20210209175059.60057-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HEOaByz8hClSuB8deCcM1H/Vvx06BpCvgWCDsLSvKM8=;
        b=ntA0nZyYY+SS1mlcyHE/40Q5xHy/gM4IzdMYlin676qZLO4jkRb1m/OTyk3X4eCjhW
         SDulwkgxtrxzdCQqU1Jt8j0rnvAdyU7NBB8aYabW0x0z9Skn3R4sJURhxQrawz7rCbrA
         nJ419WHBcEr/npmuRc38IFhUhK5rGOXOnyDfwhVeh0fWIPbad2xW8t15QKk72eqXulEI
         DXJFPGg20uasbW/mo7XSWITFO5t4J0d4Q7RJ2u1H/0qjBD0yiqQN6XysuMXumjt1z0Ul
         Jfb6uOeVNcDS2IgnOUqJz6hmr2dAQOpiDE8l1Q6Zuhog8Vc2fhguU4e/JkJwV+2M0w6T
         LFfg==
In-Reply-To: <20210209175059.60057-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, rob.herring-5wv7dgnIgG8@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Treat a node-name and property name at the same level of tree as
a warning

Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 checks.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 48e7fe9..c420772 100644
--- a/checks.c
+++ b/checks.c
@@ -331,6 +331,20 @@ static void check_node_name_format(struct check *c, struct dt_info *dti,
 }
 ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
 
+static void check_node_name_vs_property_name(struct check *c,
+					     struct dt_info *dti,
+					     struct node *node)
+{
+	if (!node->parent)
+		return;
+
+	if (get_property(node->parent, node->name)) {
+		FAIL(c, dti, node, "node name and property name conflict");
+	}
+}
+WARNING(node_name_vs_property_name, check_node_name_vs_property_name,
+	NULL, &node_name_chars);
+
 static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
 				      struct node *node)
 {
@@ -1797,7 +1811,7 @@ WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
-	&name_is_string, &name_properties,
+	&name_is_string, &name_properties, &node_name_vs_property_name,
 
 	&duplicate_label,
 
-- 
2.29.2

