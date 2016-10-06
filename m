From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 4/4] tests: overlay: Move back the bad fixup tests
Date: Thu,  6 Oct 2016 13:39:59 +0200
Message-ID: <20161006113959.30865-5-maxime.ripard@free-electrons.com>
References: <20161006113959.30865-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161006113959.30865-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The bad fixups tests were meant to be usable even for a non-overlay-enabled
dtc.

Move them out of that check.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 tests/run_tests.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 10b41bca85cb..dc19f80b2fb6 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -181,14 +181,14 @@ overlay_tests () {
         run_dtc_test -@ -I dts -O dtb -o overlay_base.dtb overlay_base.dts
         run_dtc_test -@ -I dts -O dtb -o overlay_overlay.dtb overlay_overlay_dtc.dts
         run_test overlay overlay_base.dtb overlay_overlay.dtb
-
-	# Bad fixup tests
-	for test in $BAD_FIXUP_TREES; do
-	    tree="overlay_bad_fixup_$test"
-	    run_dtc_test -I dts -O dtb -o $tree.dtb $tree.dts
-	    run_test overlay_bad_fixup overlay_base.dtb $tree.dtb
-	done
     fi
+
+    # Bad fixup tests
+    for test in $BAD_FIXUP_TREES; do
+	tree="overlay_bad_fixup_$test"
+	run_dtc_test -I dts -O dtb -o $tree.dtb $tree.dts
+	run_test overlay_bad_fixup overlay_base.dtb $tree.dtb
+    done
 }
 
 tree1_tests () {
-- 
2.9.3
