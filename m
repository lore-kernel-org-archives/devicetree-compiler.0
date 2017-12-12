From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 6/6] checks: add a chosen node check
Date: Tue, 12 Dec 2017 16:46:29 -0600
Message-ID: <20171212224629.28738-6-robh@kernel.org>
References: <20171212224629.28738-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212224629.28738-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add a check for /chosen node. This checks that chosen is located at the
root level and that bootargs and stdout-path properties are strings.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- New patch making an explicit chosen node test.

 checks.c                         | 32 ++++++++++++++++++++++++++++++++
 tests/bad-chosen-bootargs.dts    |  7 +++++++
 tests/bad-chosen-location.dts    |  8 ++++++++
 tests/bad-chosen-stdout-path.dts |  9 +++++++++
 tests/run_tests.sh               |  3 +++
 5 files changed, 59 insertions(+)
 create mode 100644 tests/bad-chosen-bootargs.dts
 create mode 100644 tests/bad-chosen-location.dts
 create mode 100644 tests/bad-chosen-stdout-path.dts

diff --git a/checks.c b/checks.c
index 66e5fd6405a5..234e97ffb905 100644
--- a/checks.c
+++ b/checks.c
@@ -636,6 +636,37 @@ static void check_names_is_string_list(struct check *c, struct dt_info *dti,
 }
 WARNING(names_is_string_list, check_names_is_string_list, NULL);
 
+static void check_chosen_node(struct check *c, struct dt_info *dti,
+				    struct node *node)
+{
+	struct property *prop;
+
+	if (!streq(node->name, "chosen"))
+		return;
+
+	if (node->parent->parent) {
+		FAIL(c, dti, "chosen node must be at root node (%s)",
+		     node->parent->name);
+	}
+
+	prop = get_property(node, "bootargs");
+	if (prop) {
+		c->data = prop->name;
+		check_is_string(c, dti, node);
+	}
+
+	prop = get_property(node, "linux,stdout-path");
+	if (prop)
+		FAIL(c, dti, "Use 'stdout-path' instead of 'linux,stdout-path'");
+
+	prop = get_property(node, "stdout-path");
+	if (prop) {
+		c->data = prop->name;
+		check_is_string(c, dti, node);
+	}
+}
+WARNING(chosen_node, check_chosen_node, NULL);
+
 static void check_alias_paths(struct check *c, struct dt_info *dti,
 				    struct node *node)
 {
@@ -1377,6 +1408,7 @@ static struct check *check_table[] = {
 	&interrupts_property,
 
 	&alias_paths,
+	&chosen_node,
 
 	&always_fail,
 };
diff --git a/tests/bad-chosen-bootargs.dts b/tests/bad-chosen-bootargs.dts
new file mode 100644
index 000000000000..fb72a820b340
--- /dev/null
+++ b/tests/bad-chosen-bootargs.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+
+/ {
+	chosen {
+		bootargs = <0xdeadbeef>;
+	};
+};
diff --git a/tests/bad-chosen-location.dts b/tests/bad-chosen-location.dts
new file mode 100644
index 000000000000..0f6de5ed7ed3
--- /dev/null
+++ b/tests/bad-chosen-location.dts
@@ -0,0 +1,8 @@
+/dts-v1/;
+
+/ {
+	node2 {
+		chosen {
+		};
+	};
+};
diff --git a/tests/bad-chosen-stdout-path.dts b/tests/bad-chosen-stdout-path.dts
new file mode 100644
index 000000000000..a022e68e96ec
--- /dev/null
+++ b/tests/bad-chosen-stdout-path.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+/ {
+	chosen {
+		linux,stdout-path = "foo";
+		stdout-path = <1>;
+	};
+
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index d36dffbc4ef9..8b45b81b2e61 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -547,6 +547,9 @@ dtc_tests () {
 
     check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell interrupt_cells_is_cell
     check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string label_is_string compatible_is_string_list names_is_string_list
+    check_tests bad-chosen-location.dts chosen_node
+    check_tests bad-chosen-bootargs.dts chosen_node
+    check_tests bad-chosen-stdout-path.dts chosen_node
     check_tests bad-reg-ranges.dts reg_format ranges_format
     check_tests bad-empty-ranges.dts ranges_format
     check_tests reg-ranges-root.dts reg_format ranges_format
-- 
2.14.1
