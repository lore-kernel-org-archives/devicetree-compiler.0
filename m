From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] tests: Add a test case for the delete-if-unreferenced keyword
Date: Sat,  3 Feb 2018 10:14:32 +0100
Message-ID: <20180203091432.19463-2-maxime.ripard@bootlin.com>
References: <20180203091432.19463-1-maxime.ripard@bootlin.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180203091432.19463-1-maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

The newly introduced /delete-if-unreferenced/ needs a few test cases, make
sure to test them.

Signed-off-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
---
 tests/delete-unreferenced.dts | 15 +++++++++++++++
 tests/run_tests.sh            |  5 +++++
 2 files changed, 20 insertions(+)
 create mode 100644 tests/delete-unreferenced.dts

diff --git a/tests/delete-unreferenced.dts b/tests/delete-unreferenced.dts
new file mode 100644
index 000000000000..f119eec6a65d
--- /dev/null
+++ b/tests/delete-unreferenced.dts
@@ -0,0 +1,15 @@
+/dts-v1/;
+
+/ {
+	/delete-if-unreferenced/ node1: node1 {
+		bar = <0xdeadbeef>;
+	};
+
+	/delete-if-unreferenced/ node2: node2 {
+		foo = <0x42>;
+	};
+
+	node3: node3 {
+		test = <&node2>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0d30edfc0bc4..f0941c7757f4 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -543,6 +543,11 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb test_tree1_delete.dts
     tree1_tests dtc_tree1_delete.test.dtb
 
+    # Check delete-if-unreferenced functionality
+    run_dtc_test -I dts -O dtb -o delete-unreferenced.test.dtb delete-unreferenced.dts
+    run_test check_path delete-unreferenced.test.dtb not-exists "/node1"
+    run_test check_path delete-unreferenced.test.dtb exists "/node2"
+
     run_dtc_test -I dts -O dts -o delete_reinstate_multilabel.dts.test.dts delete_reinstate_multilabel.dts
     run_wrap_test cmp delete_reinstate_multilabel.dts.test.dts delete_reinstate_multilabel_ref.dts
 
-- 
2.14.3
