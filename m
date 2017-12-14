From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3] checks: add chosen node checks
Date: Thu, 14 Dec 2017 16:40:01 -0600
Message-ID: <20171214224001.17298-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add some checks for /chosen node. These check that chosen is located at
the root level and that bootargs and stdout-path properties are strings.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v3:
- Split into 3 separate checks
- Move next to check_obsolete_chosen_interrupt_controller

v2:
- New patch making an explicit chosen node test.

 checks.c             | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/bad-chosen.dts | 10 ++++++++++
 tests/run_tests.sh   |  3 +++
 3 files changed, 64 insertions(+)
 create mode 100644 tests/bad-chosen.dts

diff --git a/checks.c b/checks.c
index 66e5fd6405a5..1cded3658491 100644
--- a/checks.c
+++ b/checks.c
@@ -1052,6 +1052,56 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
 WARNING(obsolete_chosen_interrupt_controller,
 	check_obsolete_chosen_interrupt_controller, NULL);
 
+static void check_chosen_node_is_root(struct check *c, struct dt_info *dti,
+				      struct node *node)
+{
+	if (!streq(node->name, "chosen"))
+		return;
+
+	if (node->parent != dti->dt)
+		FAIL(c, dti, "chosen node '%s' must be at root node",
+		     node->fullpath);
+}
+WARNING(chosen_node_is_root, check_chosen_node_is_root, NULL);
+
+static void check_chosen_node_bootargs(struct check *c, struct dt_info *dti,
+				       struct node *node)
+{
+	struct property *prop;
+
+	if (!streq(node->name, "chosen"))
+		return;
+
+	prop = get_property(node, "bootargs");
+	if (!prop)
+		return;
+
+	c->data = prop->name;
+	check_is_string(c, dti, node);
+}
+WARNING(chosen_node_bootargs, check_chosen_node_bootargs, NULL);
+
+static void check_chosen_node_stdout_path(struct check *c, struct dt_info *dti,
+					  struct node *node)
+{
+	struct property *prop;
+
+	if (!streq(node->name, "chosen"))
+		return;
+
+	prop = get_property(node, "stdout-path");
+	if (!prop) {
+		prop = get_property(node, "linux,stdout-path");
+		if (!prop)
+			return;
+		FAIL(c, dti, "Use 'stdout-path' instead of 'linux,stdout-path'");
+	}
+
+	c->data = prop->name;
+	check_is_string(c, dti, node);
+}
+WARNING(chosen_node_stdout_path, check_chosen_node_stdout_path, NULL);
+
 struct provider {
 	const char *prop_name;
 	const char *cell_name;
@@ -1354,6 +1404,7 @@ static struct check *check_table[] = {
 	&avoid_default_addr_size,
 	&avoid_unnecessary_addr_size,
 	&obsolete_chosen_interrupt_controller,
+	&chosen_node_is_root, &chosen_node_bootargs, &chosen_node_stdout_path,
 
 	&clocks_property,
 	&cooling_device_property,
diff --git a/tests/bad-chosen.dts b/tests/bad-chosen.dts
new file mode 100644
index 000000000000..d6f53c68ddd9
--- /dev/null
+++ b/tests/bad-chosen.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+	node2 {
+		chosen {
+			bootargs = <0xdeadbeef>;
+			stdout-path = <1>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index d36dffbc4ef9..61c95f1fc899 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -547,6 +547,9 @@ dtc_tests () {
 
     check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell interrupt_cells_is_cell
     check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string label_is_string compatible_is_string_list names_is_string_list
+    check_tests bad-chosen.dts chosen_node_is_root
+    check_tests bad-chosen.dts chosen_node_bootargs
+    check_tests bad-chosen.dts chosen_node_stdout_path
     check_tests bad-reg-ranges.dts reg_format ranges_format
     check_tests bad-empty-ranges.dts ranges_format
     check_tests reg-ranges-root.dts reg_format ranges_format
-- 
2.14.1
