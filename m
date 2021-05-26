From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/5] checks: Drop interrupt_cells_is_cell check
Date: Tue, 25 May 2021 20:03:33 -0500
Message-ID: <20210526010335.860787-4-robh@kernel.org>
References: <20210526010335.860787-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210526010335.860787-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

With the prior commit, this check is now redundant.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c           | 3 +--
 tests/run_tests.sh | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/checks.c b/checks.c
index 6a01a2468c42..7ff044df6837 100644
--- a/checks.c
+++ b/checks.c
@@ -672,7 +672,6 @@ ERROR(omit_unused_nodes, fixup_omit_unused_nodes, NULL, &phandle_references, &pa
  */
 WARNING_IF_NOT_CELL(address_cells_is_cell, "#address-cells");
 WARNING_IF_NOT_CELL(size_cells_is_cell, "#size-cells");
-WARNING_IF_NOT_CELL(interrupt_cells_is_cell, "#interrupt-cells");
 
 WARNING_IF_NOT_STRING(device_type_is_string, "device_type");
 WARNING_IF_NOT_STRING(model_is_string, "model");
@@ -1809,7 +1808,7 @@ static struct check *check_table[] = {
 	&phandle_references, &path_references,
 	&omit_unused_nodes,
 
-	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
+	&address_cells_is_cell, &size_cells_is_cell,
 	&device_type_is_string, &model_is_string, &status_is_string,
 	&label_is_string,
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0e8ecdb40c2c..0e270feb3e47 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -691,7 +691,7 @@ dtc_tests () {
     run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
     check_tests "$SRCDIR/bad-name-property.dts" name_properties
 
-    check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupt_cells_is_cell
+    check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupts_extended_is_cell
     check_tests "$SRCDIR/bad-string-props.dts" device_type_is_string model_is_string status_is_string label_is_string compatible_is_string_list names_is_string_list
     check_tests "$SRCDIR/bad-chosen.dts" chosen_node_is_root
     check_tests "$SRCDIR/bad-chosen.dts" chosen_node_bootargs
@@ -740,7 +740,7 @@ dtc_tests () {
 
 
     # Check warning options
-    run_sh_test "$SRCDIR/dtc-checkfails.sh" address_cells_is_cell interrupt_cells_is_cell -n size_cells_is_cell -- -Wno_size_cells_is_cell -I dts -O dtb "$SRCDIR/bad-ncells.dts"
+    run_sh_test "$SRCDIR/dtc-checkfails.sh" address_cells_is_cell interrupts_extended_is_cell -n size_cells_is_cell -- -Wno_size_cells_is_cell -I dts -O dtb "$SRCDIR/bad-ncells.dts"
     run_sh_test "$SRCDIR/dtc-fails.sh" -n test-warn-output.test.dtb -I dts -O dtb "$SRCDIR/bad-ncells.dts"
     run_sh_test "$SRCDIR/dtc-fails.sh" test-error-output.test.dtb -I dts -O dtb bad-ncells.dts -Esize_cells_is_cell
     run_sh_test "$SRCDIR/dtc-checkfails.sh" always_fail -- -Walways_fail -I dts -O dtb "$SRCDIR/test_tree1.dts"
-- 
2.27.0

