From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] dtc: Fix NULL pointer use in dtlabel + dtref case
Date: Mon, 30 Jan 2017 14:06:17 -0800
Message-ID: <20170130220617.19128-1-stephen.boyd@linaro.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=wEQ2rmAyuJrWMrcUW5ApDTz3dTBRJcvI+Ggyvzctj14=;
        b=DV68alPEV8p1pJrruAgPZBHCxTRlZYqHY7sswk/DmbSrL117qfZACgGCRnCUjERp3m
         rSgZZIRjUD+DubNlgjT/Ny7ZCAA3nJMEyLS2MWXH/KYyfTlrH7hxir7uD8POQAb4+PSa
         TVWIi8EG+tKwpcGnq50QjtLRubukPCqBmiog8=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If we have a construct like this:

	label: &handle {
		...
	};

Running dtc on it will cause a segfault, because we use 'target'
when it could be NULL. Move the add_label() call into the if
statement to fix this potentially bad use of a NULL pointer.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

Changes from v1:
 * Add a test to ensure we flag an error

 dtc-parser.y             | 6 +++---
 tests/run_tests.sh       | 1 +
 tests/test_label_ref.dts | 9 +++++++++
 3 files changed, 13 insertions(+), 3 deletions(-)
 create mode 100644 tests/test_label_ref.dts

diff --git a/dtc-parser.y b/dtc-parser.y
index b2fd4d155839..ca3f5003427c 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -171,10 +171,10 @@ devicetree:
 		{
 			struct node *target = get_node_by_ref($1, $3);
 
-			add_label(&target->labels, $2);
-			if (target)
+			if (target) {
+				add_label(&target->labels, $2);
 				merge_nodes(target, $4);
-			else
+			} else
 				ERROR(&@3, "Label or path %s not found", $3);
 			$$ = $1;
 		}
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 157dbaea7600..ed489dbdd269 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -511,6 +511,7 @@ dtc_tests () {
     run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.test.dtb
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge_path.test.dtb test_tree1_merge_path.dts
     tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
+    run_wrap_error_test $DTC -I dts -O dtb -o /dev/null test_label_ref.dts
 
     # Check prop/node delete functionality
     run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb test_tree1_delete.dts
diff --git a/tests/test_label_ref.dts b/tests/test_label_ref.dts
new file mode 100644
index 000000000000..7009c79531a7
--- /dev/null
+++ b/tests/test_label_ref.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+/ {
+
+};
+
+label: &handle {
+
+};
-- 
2.10.0.297.gf6727b0
