From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/6] checks: add a string check for 'label' property
Date: Tue, 12 Dec 2017 16:46:24 -0600
Message-ID: <20171212224629.28738-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add a string property check for 'label' property. 'label' is a human
readable string typically used to identify connectors or ports on devices.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- Move chosen node checks to patch 6.
- Add tests.

 checks.c                   | 2 ++
 tests/bad-string-props.dts | 1 +
 tests/run_tests.sh         | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 334c2a4a0527..8d52d78c1dca 100644
--- a/checks.c
+++ b/checks.c
@@ -586,6 +586,7 @@ WARNING_IF_NOT_CELL(interrupt_cells_is_cell, "#interrupt-cells");
 WARNING_IF_NOT_STRING(device_type_is_string, "device_type");
 WARNING_IF_NOT_STRING(model_is_string, "model");
 WARNING_IF_NOT_STRING(status_is_string, "status");
+WARNING_IF_NOT_STRING(label_is_string, "label");
 
 static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
 				  struct node *node)
@@ -1236,6 +1237,7 @@ static struct check *check_table[] = {
 
 	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
 	&device_type_is_string, &model_is_string, &status_is_string,
+	&label_is_string,
 
 	&property_name_chars_strict,
 	&node_name_chars_strict,
diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
index 396f82069cf7..04194da50636 100644
--- a/tests/bad-string-props.dts
+++ b/tests/bad-string-props.dts
@@ -4,4 +4,5 @@
 	device_type = <0xdeadbeef>;
 	model = <0xdeadbeef>;
 	status = <0xdeadbeef>;
+	label = <0xdeadbeef>;
 };
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 850bc165e757..e7505255043d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -546,7 +546,7 @@ dtc_tests () {
     check_tests bad-name-property.dts name_properties
 
     check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell interrupt_cells_is_cell
-    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string
+    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string label_is_string
     check_tests bad-reg-ranges.dts reg_format ranges_format
     check_tests bad-empty-ranges.dts ranges_format
     check_tests reg-ranges-root.dts reg_format ranges_format
-- 
2.14.1
