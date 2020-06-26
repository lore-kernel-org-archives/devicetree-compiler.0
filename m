From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/3] dtc: Add sign preservation tests
Date: Fri, 26 Jun 2020 17:25:28 +0100
Message-ID: <20200626162528.2129-4-andrei.ziureaev@arm.com>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200626162528.2129-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Test whether dts and yaml outputs preserve the signs of integers.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---
 tests/run_tests.sh                    |  4 ++--
 tests/sign-preservation-bytes.dt.yaml |  5 +++++
 tests/sign-preservation-bytes.dts     |  7 +++++++
 tests/sign-preservation.dt.yaml       | 20 +++++++++++++++++++
 tests/sign-preservation.dts           | 28 +++++++++++++++++++++++++++
 5 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 tests/sign-preservation-bytes.dt.yaml
 create mode 100644 tests/sign-preservation-bytes.dts
 create mode 100644 tests/sign-preservation.dt.yaml
 create mode 100644 tests/sign-preservation.dts

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 294585b991e2..7745e5178995 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -619,7 +619,7 @@ dtc_tests () {
     done
 
     # Check -Odts preserving type information
-    for tree in type-preservation.dts; do
+    for tree in type-preservation.dts sign-preservation.dts; do
         run_dtc_test -I dts -O dts -o $tree.test.dts "$SRCDIR/$tree"
         run_dtc_test -I dts -O dts $tree.test.dts
         run_wrap_test cmp "$SRCDIR/$tree" $tree.test.dts
@@ -633,7 +633,7 @@ dtc_tests () {
 
     # Check -Oyaml output
     if ! $no_yaml; then
-            for tree in type-preservation; do
+            for tree in type-preservation sign-preservation sign-preservation-bytes; do
                 run_dtc_test -I dts -O yaml -o $tree.test.dt.yaml "$SRCDIR/$tree.dts"
                 run_wrap_test cmp "$SRCDIR/$tree.dt.yaml" $tree.test.dt.yaml
             done
diff --git a/tests/sign-preservation-bytes.dt.yaml b/tests/sign-preservation-bytes.dt.yaml
new file mode 100644
index 000000000000..6b807e345fb6
--- /dev/null
+++ b/tests/sign-preservation-bytes.dt.yaml
@@ -0,0 +1,5 @@
+---
+- int8-neg: [!u8 [-0xff]]
+  int8-array: [!u8 [-0x1, 0x2, -0xfe, 0xff]]
+  int8-array-neg: [!u8 [-0x1, -0x2, -0xfe, -0xff]]
+...
diff --git a/tests/sign-preservation-bytes.dts b/tests/sign-preservation-bytes.dts
new file mode 100644
index 000000000000..8d0bccd0fb0e
--- /dev/null
+++ b/tests/sign-preservation-bytes.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+
+/ {
+	int8-neg = /bits/ 8 <(-0xff)>;
+	int8-array = /bits/ 8 <(-0x01) 0x02 (-0xfe) 0xff>;
+	int8-array-neg = /bits/ 8 <(-0x01) (-0x02) (-0xfe) (-0xff)>;
+};
diff --git a/tests/sign-preservation.dt.yaml b/tests/sign-preservation.dt.yaml
new file mode 100644
index 000000000000..7a701f84b0a0
--- /dev/null
+++ b/tests/sign-preservation.dt.yaml
@@ -0,0 +1,20 @@
+---
+- '#address-cells': [[0x1]]
+  '#size-cells': [[0x0]]
+  subnode@1:
+    reg: [[0x1]]
+    int-neg: [[-0x1]]
+    int-matrix: [[0x0, -0x1], [0xfffffffe, -0xffffffff]]
+    int-matrix-neg: [[-0x1, -0x2], [-0xfffffffe, -0xffffffff]]
+    int16-neg: [!u16 [-0x3210]]
+    int16-array: [!u16 [-0x1234, 0x5678, 0x90ab, -0xcdef]]
+    int16-array-neg: [!u16 [-0x1234, -0x5678, -0x90ab, -0xcdef]]
+    int16-matrix: [!u16 [0x1234, -0x5678], [-0x90ab, 0xcdef]]
+    int16-matrix-neg: [!u16 [-0x1234, -0x5678], [-0x90ab, -0xcdef]]
+    int64-neg: [!u64 [-0xffffffffffffffff]]
+    int64-array: [!u64 [0x1, 0xffffffffffffffff, -0x1, -0xffffffffffffffff]]
+    int64-array-neg: [!u64 [-0x2, -0x8000000000000000]]
+    subsubnode:
+      subsubsubnode:
+        compatible: ["subsubsubnode1", [0x1234], [-0x1234], "subsubsubnode"]
+...
diff --git a/tests/sign-preservation.dts b/tests/sign-preservation.dts
new file mode 100644
index 000000000000..1d4b714628ed
--- /dev/null
+++ b/tests/sign-preservation.dts
@@ -0,0 +1,28 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <0x01>;
+	#size-cells = <0x00>;
+
+	sub1: subnode@1 {
+		reg = <0x01>;
+		int-neg = <(-0x01)>;
+		int-matrix = <0x00 (-0x01)>, int_matrix_label: <0xfffffffe (-0xffffffff)>;
+		int-matrix-neg = <(-0x01) (-0x02)>, int_matrix_neg_label: <(-0xfffffffe) (-0xffffffff)>;
+		int16-neg = /bits/ 16 <(-0x3210)>;
+		int16-array = /bits/ 16 <(-0x1234) 0x5678 0x90ab (-0xcdef)>;
+		int16-array-neg = /bits/ 16 <(-0x1234) (-0x5678) (-0x90ab) (-0xcdef)>;
+		int16-matrix = /bits/ 16 <0x1234 (-0x5678)>, <(-0x90ab) 0xcdef>;
+		int16-matrix-neg = /bits/ 16 <(-0x1234) (-0x5678)>, <(-0x90ab) (-0xcdef)>;
+		int64-neg = /bits/ 64 <(-0xffffffffffffffff)>;
+		int64-array = /bits/ 64 <0x01 0xffffffffffffffff (-0x01) (-0xffffffffffffffff)> int64_array_label_end:;
+		int64-array-neg = /bits/ 64 <(-0x02) (-0x8000000000000000)> int64_array_neg_label_end:;
+
+		subsub1: subsubnode {
+
+			subsubsub1: subsubsubnode {
+				compatible = "subsubsubnode1", <0x1234>, <(-0x1234)>, valuea: valueb: "subsubsubnode";
+			};
+		};
+	};
+};
-- 
2.17.1

