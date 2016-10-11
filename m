From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/3] tests: overlay: Add test suffix to the compiled blobs
Date: Tue, 11 Oct 2016 10:10:33 +0200
Message-ID: <20161011081033.28604-3-maxime.ripard@free-electrons.com>
References: <20161011081033.28604-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161011081033.28604-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The compiled blobs in the overlay tests do not have the test suffix which
is usually used to clean up and ignore the test artifacts.

Let's add that suffix.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 tests/run_tests.sh | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index dc19f80b2fb6..b49fa62a74e1 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -171,23 +171,23 @@ BAD_FIXUP_TREES="bad_index \
 
 overlay_tests () {
     # Overlay tests that don't require overlay support in dtc
-    run_dtc_test -I dts -O dtb -o overlay_base.dtb overlay_base.dts
-    run_dtc_test -I dts -O dtb -o overlay_overlay.dtb overlay_overlay_nodtc.dts
-    run_test overlay overlay_base.dtb overlay_overlay.dtb
+    run_dtc_test -I dts -O dtb -o overlay_base.test.dtb overlay_base.dts
+    run_dtc_test -I dts -O dtb -o overlay_overlay.test.dtb overlay_overlay_nodtc.dts
+    run_test overlay overlay_base.test.dtb overlay_overlay.test.dtb
 
     # Overlay tests that requires overlay support in dtc
     echo "/dts-v1/; / {};" | $DTC -@ > /dev/null 2>&1
     if [ $? -eq 0 ]; then
-        run_dtc_test -@ -I dts -O dtb -o overlay_base.dtb overlay_base.dts
-        run_dtc_test -@ -I dts -O dtb -o overlay_overlay.dtb overlay_overlay_dtc.dts
-        run_test overlay overlay_base.dtb overlay_overlay.dtb
+        run_dtc_test -@ -I dts -O dtb -o overlay_base.test.dtb overlay_base.dts
+        run_dtc_test -@ -I dts -O dtb -o overlay_overlay.test.dtb overlay_overlay_dtc.dts
+        run_test overlay overlay_base.test.dtb overlay_overlay.test.dtb
     fi
 
     # Bad fixup tests
     for test in $BAD_FIXUP_TREES; do
 	tree="overlay_bad_fixup_$test"
-	run_dtc_test -I dts -O dtb -o $tree.dtb $tree.dts
-	run_test overlay_bad_fixup overlay_base.dtb $tree.dtb
+	run_dtc_test -I dts -O dtb -o $tree.test.dtb $tree.dts
+	run_test overlay_bad_fixup overlay_base.test.dtb $tree.test.dtb
     done
 }
 
-- 
2.9.3
