From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] libfdt: tests: Add a test to check phandles are not overwritten
Date: Wed, 19 Apr 2023 08:51:49 +0200
Message-ID: <20230419065149.137663-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org

Application of an overlay should not overwrite already existing phandles
as this probably breaks references in the base device tree.

Note this is currently failing.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Hello,

I found an old conversation[1] about this bug during the spring cleanup of
my mailbox. I tried fixing the problem, but didn't manage in the short
time I planned to spend on this. So here comes only a test that
currently fails. I don't know yet if/when I will look again into this
problem, but if someone else fixes it, I won't be angry. :-)

Best regards
Uwe

[1] https://www.spinics.net/lists/devicetree-compiler/msg03932.html

 tests/overlay_base_phandle.dts    | 17 +++++++++++++++++
 tests/overlay_overlay_phandle.dts | 23 +++++++++++++++++++++++
 tests/run_tests.sh                | 14 ++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 tests/overlay_base_phandle.dts
 create mode 100644 tests/overlay_overlay_phandle.dts

diff --git a/tests/overlay_base_phandle.dts b/tests/overlay_base_phandle.dts
new file mode 100644
index 000000000000..623b9269d7dd
--- /dev/null
+++ b/tests/overlay_base_phandle.dts
@@ -0,0 +1,17 @@
+/*
+ * Copyright (c) 2023 Uwe Kleine-König
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	node_a: a {
+		prop = "blub";
+	};
+
+	node_b: b {
+		a = <&node_a>;
+	};
+};
diff --git a/tests/overlay_overlay_phandle.dts b/tests/overlay_overlay_phandle.dts
new file mode 100644
index 000000000000..b6ee1e35085e
--- /dev/null
+++ b/tests/overlay_overlay_phandle.dts
@@ -0,0 +1,23 @@
+/*
+ * Copyright (c) 2023 Uwe Kleine-König
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path = "/";
+
+		__overlay__ {
+			node_a2: a {
+			};
+
+			c {
+				a = <&node_a2>;
+			};
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f899d8cbfe69..ada4af428058 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1028,6 +1028,20 @@ fdtoverlay_tests() {
     run_dtc_test -@ -I dts -O dtb -o $stacked_addlabeldtb $stacked_addlabel
 
     run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addlabeldtb} ${stacked_bardtb} ${stacked_bazdtb}
+
+    # verify that labels are not overwritten
+    run_dtc_test -@ -I dts -O dtb -o overlay_base_phandle.test.dtb "$SRCDIR/overlay_base_phandle.dts"
+    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb "$SRCDIR/overlay_overlay_phandle.dts"
+    run_wrap_test $FDTOVERLAY -i overlay_base_phandle.test.dtb -o overlay_base_phandleO.test.dtb overlay_overlay_phandle.test.dtb
+
+    ba=$($DTGET overlay_base_phandleO.test.dtb /b a)
+    ca=$($DTGET overlay_base_phandleO.test.dtb /c a)
+    shorten_echo "check phandle wasn't overwritten:	"
+    if test "$ba" = "$ca"; then
+	    PASS
+    else
+	    FAIL
+    fi
 }
 
 pylibfdt_tests () {

base-commit: 2cdf93a6d402a161edf16de6011bd5ad76382e92
-- 
2.39.2

