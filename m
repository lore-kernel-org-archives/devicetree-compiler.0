From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] tests: overlay: Rename the device tree blobs to be more explicit
Date: Tue, 11 Oct 2016 16:44:07 +0200
Message-ID: <20161011144407.32125-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Rename the blobs to have a more explicit output that will give us a clearer
idea about whether a DT (and the test) has been compiled using a dtc with
our without overlays support.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 tests/run_tests.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index b49fa62a74e1..e4139dd035ad 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -171,23 +171,23 @@ BAD_FIXUP_TREES="bad_index \
 
 overlay_tests () {
     # Overlay tests that don't require overlay support in dtc
-    run_dtc_test -I dts -O dtb -o overlay_base.test.dtb overlay_base.dts
-    run_dtc_test -I dts -O dtb -o overlay_overlay.test.dtb overlay_overlay_nodtc.dts
-    run_test overlay overlay_base.test.dtb overlay_overlay.test.dtb
+    run_dtc_test -I dts -O dtb -o overlay_base_no_symbols.test.dtb overlay_base.dts
+    run_dtc_test -I dts -O dtb -o overlay_overlay_no_symbols.test.dtb overlay_overlay_nodtc.dts
+    run_test overlay overlay_base_no_symbols.test.dtb overlay_overlay_no_symbols.test.dtb
 
     # Overlay tests that requires overlay support in dtc
     echo "/dts-v1/; / {};" | $DTC -@ > /dev/null 2>&1
     if [ $? -eq 0 ]; then
-        run_dtc_test -@ -I dts -O dtb -o overlay_base.test.dtb overlay_base.dts
-        run_dtc_test -@ -I dts -O dtb -o overlay_overlay.test.dtb overlay_overlay_dtc.dts
-        run_test overlay overlay_base.test.dtb overlay_overlay.test.dtb
+        run_dtc_test -@ -I dts -O dtb -o overlay_base_with_symbols.test.dtb overlay_base.dts
+        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols.test.dtb overlay_overlay_dtc.dts
+        run_test overlay overlay_base_with_symbols.test.dtb overlay_overlay_with_symbols.test.dtb
     fi
 
     # Bad fixup tests
     for test in $BAD_FIXUP_TREES; do
 	tree="overlay_bad_fixup_$test"
 	run_dtc_test -I dts -O dtb -o $tree.test.dtb $tree.dts
-	run_test overlay_bad_fixup overlay_base.test.dtb $tree.test.dtb
+	run_test overlay_bad_fixup overlay_base_no_symbols.test.dtb $tree.test.dtb
     done
 }
 
-- 
2.9.3
