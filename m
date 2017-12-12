From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/6] checks: add string list check
Date: Tue, 12 Dec 2017 16:46:25 -0600
Message-ID: <20171212224629.28738-2-robh@kernel.org>
References: <20171212224629.28738-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212224629.28738-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add a check for string list properties with compatible being the first
check.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- Add tests

 checks.c                   | 34 ++++++++++++++++++++++++++++++++++
 tests/bad-string-props.dts |  5 +++++
 tests/run_tests.sh         |  2 +-
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 8d52d78c1dca..cf670ddc4a5c 100644
--- a/checks.c
+++ b/checks.c
@@ -179,6 +179,36 @@ static void check_is_string(struct check *c, struct dt_info *dti,
 #define ERROR_IF_NOT_STRING(nm, propname) \
 	ERROR(nm, check_is_string, (propname))
 
+static void check_is_string_list(struct check *c, struct dt_info *dti,
+				 struct node *node)
+{
+	int rem, l;
+	struct property *prop;
+	char *propname = c->data;
+	char *str;
+
+	prop = get_property(node, propname);
+	if (!prop)
+		return; /* Not present, assumed ok */
+
+	str = prop->val.val;
+	rem = prop->val.len;
+	while (rem > 0) {
+		l = strnlen(str, rem);
+		if (l == rem) {
+			FAIL(c, dti, "\"%s\" property in %s is not a string list",
+			     propname, node->fullpath);
+			break;
+		}
+		rem -= l + 1;
+		str += l + 1;
+	}
+}
+#define WARNING_IF_NOT_STRING_LIST(nm, propname) \
+	WARNING(nm, check_is_string_list, (propname))
+#define ERROR_IF_NOT_STRING_LIST(nm, propname) \
+	ERROR(nm, check_is_string_list, (propname))
+
 static void check_is_cell(struct check *c, struct dt_info *dti,
 			  struct node *node)
 {
@@ -588,6 +618,8 @@ WARNING_IF_NOT_STRING(model_is_string, "model");
 WARNING_IF_NOT_STRING(status_is_string, "status");
 WARNING_IF_NOT_STRING(label_is_string, "label");
 
+WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
+
 static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
@@ -1239,6 +1271,8 @@ static struct check *check_table[] = {
 	&device_type_is_string, &model_is_string, &status_is_string,
 	&label_is_string,
 
+	&compatible_is_string_list,
+
 	&property_name_chars_strict,
 	&node_name_chars_strict,
 
diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
index 04194da50636..9362ee815965 100644
--- a/tests/bad-string-props.dts
+++ b/tests/bad-string-props.dts
@@ -5,4 +5,9 @@
 	model = <0xdeadbeef>;
 	status = <0xdeadbeef>;
 	label = <0xdeadbeef>;
+
+
+	node {
+		compatible = "good", <0xdeadbeef>;
+	};
 };
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e7505255043d..910a71cafe16 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -546,7 +546,7 @@ dtc_tests () {
     check_tests bad-name-property.dts name_properties
 
     check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell interrupt_cells_is_cell
-    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string label_is_string
+    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string label_is_string compatible_is_string_list
     check_tests bad-reg-ranges.dts reg_format ranges_format
     check_tests bad-empty-ranges.dts ranges_format
     check_tests reg-ranges-root.dts reg_format ranges_format
-- 
2.14.1
