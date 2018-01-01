From: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Subject: [PATCH 2/2] overlays: auto allocate phandles for nodes in base fdt
Date: Sun, 31 Dec 2017 20:14:34 -0600
Message-ID: <20180101021434.7826-3-kevans@FreeBSD.org>
References: <20180101021434.7826-1-kevans@FreeBSD.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180101021434.7826-1-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

The base dts is simply a copy of overlay_base_manual_symbols.dts with the forced
phandle removed, thus copyright notices remain intact.

Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
---
 tests/overlay_base_manual_symbols_auto_phandle.dts | 24 ++++++++++++++++++++++
 tests/run_tests.sh                                 |  6 ++++++
 2 files changed, 30 insertions(+)
 create mode 100644 tests/overlay_base_manual_symbols_auto_phandle.dts

diff --git a/tests/overlay_base_manual_symbols_auto_phandle.dts b/tests/overlay_base_manual_symbols_auto_phandle.dts
new file mode 100644
index 0000000..6acdcf8
--- /dev/null
+++ b/tests/overlay_base_manual_symbols_auto_phandle.dts
@@ -0,0 +1,24 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	test: test-node {
+		test-int-property = <42>;
+		test-str-property = "foo";
+
+		subtest: sub-test-node {
+			sub-test-property;
+		};
+	};
+	__symbols__ {
+		test = &test;
+	};
+};
+
+
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index d36dffb..6ed6d02 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -198,12 +198,18 @@ libfdt_overlay_tests () {
     run_test check_path overlay_base_manual_symbols.test.dtb not-exists "/__fixups__"
     run_test check_path overlay_base_manual_symbols.test.dtb not-exists "/__local_fixups__"
 
+    run_dtc_test -I dts -O dtb -o overlay_base_manual_symbols_auto_phandle.test.dtb overlay_base_manual_symbols_auto_phandle.dts
+    run_test check_path overlay_base_manual_symbols_auto_phandle.test.dtb exists "/__symbols__"
+    run_test check_path overlay_base_manual_symbols_auto_phandle.test.dtb not-exists "/__fixups__"
+    run_test check_path overlay_base_manual_symbols_auto_phandle.test.dtb not-exists "/__local_fixups__"
+
     run_dtc_test -I dts -O dtb -o overlay_overlay_manual_fixups.test.dtb overlay_overlay_manual_fixups.dts
     run_test check_path overlay_overlay_manual_fixups.test.dtb not-exists "/__symbols__"
     run_test check_path overlay_overlay_manual_fixups.test.dtb exists "/__fixups__"
     run_test check_path overlay_overlay_manual_fixups.test.dtb exists "/__local_fixups__"
 
     run_test overlay overlay_base_manual_symbols.test.dtb overlay_overlay_manual_fixups.test.dtb
+    run_test overlay overlay_base_manual_symbols_auto_phandle.test.dtb overlay_overlay_manual_fixups.test.dtb
 
     # test simplified plugin syntax
     run_dtc_test -@ -I dts -O dtb -o overlay_overlay_simple.dtb overlay_overlay_simple.dts
-- 
2.15.1
