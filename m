From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/3] Add a basic test for fdtdump
Date: Wed, 18 Jun 2014 01:00:24 -0600
Message-ID: <1403074825-5069-3-git-send-email-sjg@chromium.org>
References: <1403074825-5069-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403074825-5069-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

We can test fdtdump by comparing its output with the source file that was
compiled by dtc. Add a simple test that should at least catch regressions
in basic functionality.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 tests/fdtdump-runtest.sh | 30 ++++++++++++++++++++++++++++++
 tests/fdtdump.dts        | 37 +++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh       | 29 +++++++++++++++++++++++++++++
 tests/tests.sh           |  1 +
 4 files changed, 97 insertions(+)
 create mode 100644 tests/fdtdump-runtest.sh
 create mode 100644 tests/fdtdump.dts

diff --git a/tests/fdtdump-runtest.sh b/tests/fdtdump-runtest.sh
new file mode 100644
index 0000000..a0796da
--- /dev/null
+++ b/tests/fdtdump-runtest.sh
@@ -0,0 +1,30 @@
+#! /bin/sh
+
+# Arguments:
+#   $1 - source file to compile and compare with fdtdump output of the
+#	  compiled file.
+
+. ./tests.sh
+
+dts="$1"
+dtb="${dts}.dtb"
+out="${dts}.out"
+LOG=tmp.log.$$
+
+files="$dtb $out $LOG"
+
+rm -f $files
+trap "rm -f $files" 0
+
+verbose_run_log_check "$LOG" $VALGRIND $DTC -O dtb $dts -o $dtb
+$FDTDUMP ${dtb} | grep -v "//" >${out}
+
+if diff -w $dts $out >/dev/null; then
+    PASS
+else
+    if [ -z "$QUIET_TEST" ]; then
+	echo "DIFF :-:"
+	diff -w $dts $out
+    fi
+    FAIL "Results differ from expected"
+fi
diff --git a/tests/fdtdump.dts b/tests/fdtdump.dts
new file mode 100644
index 0000000..b9d917b
--- /dev/null
+++ b/tests/fdtdump.dts
@@ -0,0 +1,37 @@
+/dts-v1/;
+
+/memreserve/ 0 0xe;
+/ {
+	model = "MyBoardName";
+	compatible = "MyBoardName", "MyBoardFamilyName";
+	#address-cells = <0x00000002>;
+	#size-cells = <0x00000002>;
+	cpus {
+		linux,phandle = <0x00000001>;
+		#address-cells = <0x00000001>;
+		#size-cells = <0x00000000>;
+		PowerPC,970@0 {
+			device_type = "cpu";
+			reg = <0x00000000>;
+			linux,boot-cpu;
+			};
+		PowerPC,970@1 {
+			device_type = "cpu";
+			reg = <0x00000001>;
+		};
+	};
+	randomnode {
+		string =  "foo", "stuff";
+		bytes = [61 62 63 64 65];
+		child {
+		};
+	};
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000123 0x00000456 0x87654321>;
+	};
+	chosen {
+		bootargs = "root=/dev/sda2";
+		linux,platform = <0x00000600>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f205ce6..8273abf 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -138,6 +138,13 @@ run_fdtput_test () {
     base_run_test sh fdtput-runtest.sh "$expect" "$@"
 }
 
+run_fdtdump_test() {
+    file="$1"
+    shorten_echo fdtdump-runtest.sh "$file"
+    echo -n ":	"
+    base_run_test sh fdtdump-runtest.sh "$file"
+}
+
 tree1_tests () {
     TREE=$1
 
@@ -602,6 +609,25 @@ utilfdt_tests () {
     run_test utilfdt_test
 }
 
+fdtdump_tests () {
+    run_fdtdump_test fdtdump.dts
+    return
+
+    local dts=fdtdump.dts
+    local dtb=fdtdump.dts.dtb
+    local out=fdtdump.dts.out
+    run_dtc_test -O dtb $dts -o ${dtb}
+    $FDTDUMP ${dtb} | grep -v "//" >${out}
+    if cmp $dts $out >/dev/null; then
+	PASS
+    else
+	if [ -z "$QUIET_TEST" ]; then
+	    diff -w fdtdump.dts $out
+	fi
+	FAIL "Results differ from expected"
+    fi
+}
+
 while getopts "vt:me" ARG ; do
     case $ARG in
 	"v")
@@ -646,6 +672,9 @@ for set in $TESTSETS; do
 	"fdtput")
 	    fdtput_tests
 	    ;;
+	"fdtdump")
+	    fdtdump_tests
+	    ;;
     esac
 done
 
diff --git a/tests/tests.sh b/tests/tests.sh
index 31530d5..818fd09 100644
--- a/tests/tests.sh
+++ b/tests/tests.sh
@@ -21,6 +21,7 @@ FAIL_IF_SIGNAL () {
 DTC=../dtc
 DTGET=../fdtget
 DTPUT=../fdtput
+FDTDUMP=../fdtdump
 
 verbose_run () {
     if [ -z "$QUIET_TEST" ]; then
-- 
2.0.0.526.g5318336

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
