From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/6] checks: add string list check for *-names properties
Date: Tue, 12 Dec 2017 16:46:26 -0600
Message-ID: <20171212224629.28738-3-robh@kernel.org>
References: <20171212224629.28738-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212224629.28738-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add a string list check for common properties ending in "-names" such as
reg-names or interrupt-names.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- Ensure "-names" is at end of the prop name.
- Add tests

 checks.c                   | 18 +++++++++++++++++-
 tests/bad-string-props.dts |  1 +
 tests/run_tests.sh         |  2 +-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index cf670ddc4a5c..e4f5cb9fd317 100644
--- a/checks.c
+++ b/checks.c
@@ -620,6 +620,22 @@ WARNING_IF_NOT_STRING(label_is_string, "label");
 
 WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
 
+static void check_names_is_string_list(struct check *c, struct dt_info *dti,
+				       struct node *node)
+{
+	struct property *prop;
+
+	for_each_property(node, prop) {
+		const char *s = strrchr(prop->name, '-');
+		if (!s || !streq(s, "-names"))
+			continue;
+
+		c->data = prop->name;
+		check_is_string_list(c, dti, node);
+	}
+}
+WARNING(names_is_string_list, check_names_is_string_list, NULL);
+
 static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
@@ -1271,7 +1287,7 @@ static struct check *check_table[] = {
 	&device_type_is_string, &model_is_string, &status_is_string,
 	&label_is_string,
 
-	&compatible_is_string_list,
+	&compatible_is_string_list, &names_is_string_list,
 
 	&property_name_chars_strict,
 	&node_name_chars_strict,
diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
index 9362ee815965..6694704a5fc2 100644
--- a/tests/bad-string-props.dts
+++ b/tests/bad-string-props.dts
@@ -6,6 +6,7 @@
 	status = <0xdeadbeef>;
 	label = <0xdeadbeef>;
 
+	foobar-names = "foo", <1>;
 
 	node {
 		compatible = "good", <0xdeadbeef>;
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 910a71cafe16..d36dffbc4ef9 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -546,7 +546,7 @@ dtc_tests () {
     check_tests bad-name-property.dts name_properties
 
     check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell interrupt_cells_is_cell
-    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string label_is_string compatible_is_string_list
+    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string label_is_string compatible_is_string_list names_is_string_list
     check_tests bad-reg-ranges.dts reg_format ranges_format
     check_tests bad-empty-ranges.dts ranges_format
     check_tests reg-ranges-root.dts reg_format ranges_format
-- 
2.14.1
