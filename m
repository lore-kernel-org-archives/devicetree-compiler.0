From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 6/6] dtc: Add sign preservation and operation tests
Date: Tue, 14 Jul 2020 16:45:42 +0100
Message-ID: <20200714154542.18064-7-andrei.ziureaev@arm.com>
References: <20200714154542.18064-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200714154542.18064-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

There are two types of tests here:

1. Test whether dts and yaml outputs preserve the signs of integers in
all types

2. Test whether signed operations are performed as expected and whether
the results are formatted correctly

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---
 tests/operations-expected.dts   | 31 +++++++++++++++++++++++++++
 tests/operations.dt.yaml        | 29 +++++++++++++++++++++++++
 tests/operations.dts            | 38 +++++++++++++++++++++++++++++++++
 tests/run_tests.sh              | 13 ++++++++---
 tests/sign-preservation.dt.yaml | 23 ++++++++++++++++++++
 tests/sign-preservation.dts     | 31 +++++++++++++++++++++++++++
 6 files changed, 162 insertions(+), 3 deletions(-)
 create mode 100644 tests/operations-expected.dts
 create mode 100644 tests/operations.dt.yaml
 create mode 100644 tests/operations.dts
 create mode 100644 tests/sign-preservation.dt.yaml
 create mode 100644 tests/sign-preservation.dts

diff --git a/tests/operations-expected.dts b/tests/operations-expected.dts
new file mode 100644
index 0000000..fde094e
--- /dev/null
+++ b/tests/operations-expected.dts
@@ -0,0 +1,31 @@
+/dts-v1/;
+
+/ {
+	tri = <0x02 (-0x02) (-0x01) 0x01>;
+	or = <0x00 0x01 0x01 0x01 0x00 0x01 0x01 0x01>;
+	and = <0x00 0x00 0x00 0x01 0x00 0x00 0x00 0x01>;
+	bo = <0x03 0xffffffff 0xffffffff 0xffffffff>;
+	bx = <0x03 0xfffffffd 0xffffffff 0x01>;
+	ba = <0x00 0x02 0x00 0xfffffffe>;
+	eq = <0x00 0x00 0x01 0x01>;
+	neq = <0x01 0x01 0x00 0x00>;
+	l = <0x00 0x01 0x00 0x01 0x00>;
+	g = <0x01 0x00 0x01 0x00 0x00>;
+	leq = <0x00 0x01 0x00 0x01 0x01>;
+	geq = <0x01 0x00 0x01 0x00 0x01>;
+	lsh = <0x02 0xfffffffe 0x00 0x00>;
+	rsh = <0x01 0xfffffffe 0xffffffff 0xffffffff 0x00>;
+	add = <0x07 (-0x01) 0x01 (-0x07)>;
+	sub = <0x01 (-0x07) 0x07 (-0x01)>;
+	mul = <0x0c (-0x0c) (-0x0c) 0x0c>;
+	div = <0x01 (-0x01) (-0x01) 0x01 0x00>;
+	mod = <0x01 (-0x01) 0x01 (-0x01) 0x00>;
+	neg = <0x00 0x00 (-0x01) 0x01>;
+	bit-not = <0xffffffff 0xffffffff 0xfffffffe 0x00>;
+	log-not = <0x01 0x01 0x00 0x00>;
+	big-add = <0xffffffff 0xffffffff 0xfffffffe 0xfffffffe (-0x7fffffff)>;
+	big-sub = <0xfffffffe 0x02 0x00>;
+	big-div = /bits/ 64 <(-0x8000000000000000) 0x00 0x00>;
+	big-mod = /bits/ 64 <0x00 0x00>;
+	big-neg = <0x01 0xffffffff (-0x80000000) 0x80000000>;
+};
diff --git a/tests/operations.dt.yaml b/tests/operations.dt.yaml
new file mode 100644
index 0000000..0a5b712
--- /dev/null
+++ b/tests/operations.dt.yaml
@@ -0,0 +1,29 @@
+---
+- tri: [[0x2, -0x2, -0x1, 0x1]]
+  or: [[0x0, 0x1, 0x1, 0x1, 0x0, 0x1, 0x1, 0x1]]
+  and: [[0x0, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0, 0x1]]
+  bo: [[0x3, 0xffffffff, 0xffffffff, 0xffffffff]]
+  bx: [[0x3, 0xfffffffd, 0xffffffff, 0x1]]
+  ba: [[0x0, 0x2, 0x0, 0xfffffffe]]
+  eq: [[0x0, 0x0, 0x1, 0x1]]
+  neq: [[0x1, 0x1, 0x0, 0x0]]
+  l: [[0x0, 0x1, 0x0, 0x1, 0x0]]
+  g: [[0x1, 0x0, 0x1, 0x0, 0x0]]
+  leq: [[0x0, 0x1, 0x0, 0x1, 0x1]]
+  geq: [[0x1, 0x0, 0x1, 0x0, 0x1]]
+  lsh: [[0x2, 0xfffffffe, 0x0, 0x0]]
+  rsh: [[0x1, 0xfffffffe, 0xffffffff, 0xffffffff, 0x0]]
+  add: [[0x7, -0x1, 0x1, -0x7]]
+  sub: [[0x1, -0x7, 0x7, -0x1]]
+  mul: [[0xc, -0xc, -0xc, 0xc]]
+  div: [[0x1, -0x1, -0x1, 0x1, 0x0]]
+  mod: [[0x1, -0x1, 0x1, -0x1, 0x0]]
+  neg: [[0x0, 0x0, -0x1, 0x1]]
+  bit-not: [[0xffffffff, 0xffffffff, 0xfffffffe, 0x0]]
+  log-not: [[0x1, 0x1, 0x0, 0x0]]
+  big-add: [[0xffffffff, 0xffffffff, 0xfffffffe, 0xfffffffe, -0x7fffffff]]
+  big-sub: [[0xfffffffe, 0x2, 0x0]]
+  big-div: [!u64 [-0x8000000000000000, 0x0, 0x0]]
+  big-mod: [!u64 [0x0, 0x0]]
+  big-neg: [[0x1, 0xffffffff, -0x80000000, 0x80000000]]
+...
diff --git a/tests/operations.dts b/tests/operations.dts
new file mode 100644
index 0000000..4af7154
--- /dev/null
+++ b/tests/operations.dts
@@ -0,0 +1,38 @@
+/dts-v1/;
+
+/ {
+	tri = <(0 ? 1 : 2) (-0 ? -1 : -2) (1 ? -1 : -2) (-1 ? 1 : 2)>;
+	or  = <(0 || 0) (0 || 1) (1 || 0) (1 || 1) (-0 || -0) (0 || -1) (1 || -0) (-1 || -1)>;
+	and = <(0 && 0) (0 && 1) (1 && 0) (1 && 1) (-0 && -0) (0 && -1) (1 && -0) (-1 && -1)>;
+
+	bo  = <(2 | 1) (2 | -1) (-1 | 0) (-2 | -1)>;
+	bx  = <(2 ^ 1) (2 ^ -1) (-1 ^ 0) (-2 ^ -1)>;
+	ba  = <(2 & 1) (2 & -1) (-1 & 0) (-2 & -1)>;
+
+	eq  = <(4 == 3) (-4 == -3) (4 == 4) (-4 == -4)>;
+	neq = <(4 != 3) (-4 != -3) (4 != 4) (-4 != -4)>;
+
+	l   = <(4 <  3) (-4 <  3) (4 < -3) (-4 <  -3) (-0 < 0)>;
+	g   = <(4 >  3) (-4 >  3) (4 > -3) (-4 >  -3) (-0 > 0)>;
+	leq = <(4 <= 3) (-4 <= 3) (4 <= -3) (-4 <= -3) (-0 <= 0)>;
+	geq = <(4 >= 3) (-4 >= 3) (4 >= -3) (-4 >= -3) (-0 >= 0)>;
+
+	lsh = <(1 << 1) (-1 << 1) (-1 << -1) (-1 << 64)>;
+	rsh = <(2 >> 1) (-4 >> 1) (-1 >> -1) (-1 >> 64) (-0 >> 31)>;
+
+	add = <(4 + 3) (-4 + 3) (4 + -3) (-4 + -3)>;
+	sub = <(4 - 3) (-4 - 3) (4 - -3) (-4 - -3)>;
+	mul = <(4 * 3) (-4 * 3) (4 * -3) (-4 * -3)>;
+	div = <(4 / 3) (-4 / 3) (4 / -3) (-4 / -3) (-0 / 1)>;
+	mod = <(4 % 3) (-4 % 3) (4 % -3) (-4 % -3) (-0 % 1)>;
+
+	neg     = <(-0) (--0) (-1) (--1)>;
+	bit-not = <(~0) (~-0) (~1) (~-1)>;
+	log-not = <(!0) (!-0) (!1) (!-1)>;
+
+	big-add = <(0xfffffffe + 1) (1 + 0xfffffffe) (0xffffffff + -1) (-1 + 0xffffffff) (1 + -0x80000000)>;
+	big-sub = <(0xffffffff - 1) (1 - 0xffffffff) (-0x80000000 - -0x80000000)>;
+	big-div = /bits/ 64 <(0x8000000000000000 / -1) (-0xffffffffffffffff / 2)  (-0 / 0xffffffffffffffff)>;
+	big-mod = /bits/ 64 <(0x8000000000000000 % -1) (-0 % 0xffffffffffffffff)>;
+	big-neg = <(-0xffffffff) (--0xffffffff) (-0x80000000) (--0x80000000)>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 294585b..2de44c0 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -618,8 +618,8 @@ dtc_tests () {
 	run_test dtbs_equal_ordered $tree odts_$tree.test.dtb
     done
 
-    # Check -Odts preserving type information
-    for tree in type-preservation.dts; do
+    # Check -Odts preserving type and sign information
+    for tree in type-preservation.dts sign-preservation.dts; do
         run_dtc_test -I dts -O dts -o $tree.test.dts "$SRCDIR/$tree"
         run_dtc_test -I dts -O dts $tree.test.dts
         run_wrap_test cmp "$SRCDIR/$tree" $tree.test.dts
@@ -631,9 +631,16 @@ dtc_tests () {
         run_test dtbs_equal_ordered $tree.test.dtb $tree.test.dts.test.dtb
     done
 
+    # Check -Odts supporting all operations
+    for tree in operations; do
+        run_dtc_test -I dts -O dts -o $tree.test.dts "$SRCDIR/$tree.dts"
+        run_dtc_test -I dts -O dts $tree.test.dts
+        run_wrap_test cmp "$SRCDIR/$tree-expected.dts" $tree.test.dts
+    done
+
     # Check -Oyaml output
     if ! $no_yaml; then
-            for tree in type-preservation; do
+            for tree in type-preservation sign-preservation operations; do
                 run_dtc_test -I dts -O yaml -o $tree.test.dt.yaml "$SRCDIR/$tree.dts"
                 run_wrap_test cmp "$SRCDIR/$tree.dt.yaml" $tree.test.dt.yaml
             done
diff --git a/tests/sign-preservation.dt.yaml b/tests/sign-preservation.dt.yaml
new file mode 100644
index 0000000..bc85f5f
--- /dev/null
+++ b/tests/sign-preservation.dt.yaml
@@ -0,0 +1,23 @@
+---
+- '#address-cells': [[0x1]]
+  '#size-cells': [[0x0]]
+  subnode@1:
+    reg: [[0x1]]
+    int-neg: [[-0x1]]
+    int-matrix: [[0x0, -0x1], [0xffffffff, -0x7fffffff]]
+    int-matrix-neg: [[-0x1, -0x2], [-0x7ffffffe, -0x7fffffff]]
+    int8-neg: [!u8 [-0x7f]]
+    int8-array: [!u8 [-0x1, 0x2, -0x7e, 0xff]]
+    int8-array-neg: [!u8 [-0x1, -0x2, -0x7e, -0x7f]]
+    int16-neg: [!u16 [-0x3210]]
+    int16-array: [!u16 [-0x1234, 0x5678, 0x90ab, -0x7def]]
+    int16-array-neg: [!u16 [-0x1234, -0x5678, -0x70ab, -0x7def]]
+    int16-matrix: [!u16 [0x1234, -0x5678], [-0x70ab, 0xcdef]]
+    int16-matrix-neg: [!u16 [-0x1234, -0x5678], [-0x70ab, -0x7def]]
+    int64-neg: [!u64 [-0x7fffffffffffffff]]
+    int64-array: [!u64 [0x1, 0xffffffffffffffff, -0x1, -0x7fffffffffffffff]]
+    int64-array-neg: [!u64 [-0x2, -0x8000000000000000]]
+    subsubnode:
+      subsubsubnode:
+        compatible: ["subsubsubnode1", [0x1234], [-0x1234], "subsubsubnode"]
+...
diff --git a/tests/sign-preservation.dts b/tests/sign-preservation.dts
new file mode 100644
index 0000000..b7f557c
--- /dev/null
+++ b/tests/sign-preservation.dts
@@ -0,0 +1,31 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <0x01>;
+	#size-cells = <0x00>;
+
+	sub1: subnode@1 {
+		reg = <0x01>;
+		int-neg = <(-0x01)>;
+		int-matrix = <0x00 (-0x01)>, int_matrix_label: <0xffffffff (-0x7fffffff)>;
+		int-matrix-neg = <(-0x01) (-0x02)>, int_matrix_neg_label: <(-0x7ffffffe) (-0x7fffffff)>;
+		int8-neg = /bits/ 8 <(-0x7f)>;
+		int8-array = /bits/ 8 <(-0x01) 0x02 (-0x7e) 0xff>;
+		int8-array-neg = /bits/ 8 <(-0x01) (-0x02) (-0x7e) (-0x7f)>;
+		int16-neg = /bits/ 16 <(-0x3210)>;
+		int16-array = /bits/ 16 <(-0x1234) 0x5678 0x90ab (-0x7def)>;
+		int16-array-neg = /bits/ 16 <(-0x1234) (-0x5678) (-0x70ab) (-0x7def)>;
+		int16-matrix = /bits/ 16 <0x1234 (-0x5678)>, <(-0x70ab) 0xcdef>;
+		int16-matrix-neg = /bits/ 16 <(-0x1234) (-0x5678)>, <(-0x70ab) (-0x7def)>;
+		int64-neg = /bits/ 64 <(-0x7fffffffffffffff)>;
+		int64-array = /bits/ 64 <0x01 0xffffffffffffffff (-0x01) (-0x7fffffffffffffff)> int64_array_label_end:;
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

