From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 4/4] Add tests for fdtgrep
Date: Sun,  7 Nov 2021 15:43:46 -0700
Message-ID: <20211107224346.3181320-5-sjg@chromium.org>
References: <20211107224346.3181320-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bH5LG95wYx6Np8uKxN87wGI/9k5k083q24Ki4xH6ctM=;
        b=SRxftqhI+P9oUwJoqg2LRNW/Ul1Uw8Pc9PFt2gugT0RgGVr1YE18v658pxWxJqa3pP
         Q41vo5tFvDWoXiW8IuJNx/fMy589Ehja9v97Tht+35FbkkhXmCKDPI7MRxsnEADpT86h
         snqeFju0UdNzm55JAUwqVioEistYgwfVfMVHM=
In-Reply-To: <20211107224346.3181320-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add some tests to cover the current functionality.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v4:
- Chop back to the minimal useful functionality
- Rebase to master
- Update cover letter for developments over the past 6 years

 tests/grep.dts     |  23 ++++++++++
 tests/run_tests.sh | 111 ++++++++++++++++++++++++++++++++++++++++++++-
 tests/testutils.sh |   1 +
 3 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 tests/grep.dts

diff --git a/tests/grep.dts b/tests/grep.dts
new file mode 100644
index 0000000..fb4f55e
--- /dev/null
+++ b/tests/grep.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/dts-v1/;
+/ {
+	model = "MyBoardName";
+	compatible = "MyBoardName", "MyBoardFamilyName";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	chosen {
+		bootargs = "root=/dev/sda2";
+		linux,platform = <0x600>;
+	};
+	holiday {
+		compatible = "ixtapa", "mexico";
+		weather = "sunny";
+		status = "okay";
+		flight-1 {
+			airline = "alaska";
+		};
+		flight-2 {
+			airline = "lan";
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index d100d5a..a32f871 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1032,6 +1032,112 @@ pylibfdt_tests () {
     tot_tests=$((tot_tests + $total_tests))
 }
 
+# Check the number of lines generated matches what we expect
+# Args:
+#   $1: Expected number of lines
+#   $2...: Command line to run to generate output
+check_lines() {
+    local base="$1"
+
+    shift
+    lines=$($@ | wc -l)
+    if [ "$base" != "$lines" ]; then
+	echo "Expected $base lines but got $lines lines"
+	false
+    fi
+}
+
+# Check the number of bytes generated matches what we expect
+# Args:
+#   $1: Expected number of bytes
+#   $2...: Command line to run to generate output
+check_bytes() {
+    local base="$1"
+
+    shift
+    bytes=$($@ | wc -c)
+    if [ "$base" != "$bytes" ]; then
+	echo "Expected $base bytes but got $bytes bytes"
+	false
+    fi
+}
+
+# Check that $2 and $3 are equal. $1 is the test name to display
+equal_test () {
+    echo -n "$1:	"
+    if [ "$2" == "$3" ]; then
+	PASS
+    else
+	FAIL "$2 != $3"
+    fi
+}
+
+fdtgrep_tests () {
+    local all_lines        # Total source lines in .dts file
+    local dt_start
+    local lines
+    local node_lines       # Number of lines of 'struct' output
+    local tmp
+
+    tmp=/tmp/tests.$$
+
+    # Test up the test file
+    dts=grep.dts
+    dtb=grep.dtb
+    run_dtc_test -O dtb -p 0x1000 -o $dtb $dts
+
+    # Count the number of lines in the source file and the number of lines
+    # that don't relate to nodes (i.e. the SPDX and /dts-v1/ lines)
+    all_lines=$(cat $dts | wc -l)
+    node_lines=$(($all_lines - 2))
+
+    # Tests for each argument are roughly in alphabetical order
+
+    # Test -n
+    run_wrap_test check_lines 0 $DTGREP -n // $dtb
+
+    run_wrap_test check_lines 0 $DTGREP -n chosen $dtb
+    run_wrap_test check_lines 0 $DTGREP -n holiday $dtb
+    run_wrap_test check_lines 0 $DTGREP -n \"\" $dtb
+    run_wrap_test check_lines 6 $DTGREP -n /chosen $dtb
+    run_wrap_test check_lines 7 $DTGREP -n /holiday $dtb
+    run_wrap_test check_lines 11 $DTGREP -n /chosen -n /holiday $dtb
+
+    # Using -n and -N together is undefined, so we don't have tests for that
+    # The same applies for -p/-P
+    run_wrap_error_test $DTGREP -n chosen -N holiday $dtb
+    run_wrap_error_test $DTGREP -p chosen -P holiday $dtb
+
+    # Test -o: this should output just the .dts file to a file
+    # Where there is non-dts output it should go to stdout
+    rm -f $tmp
+    run_wrap_test check_lines 0 $DTGREP $dtb -o $tmp
+    run_wrap_test check_lines $node_lines cat $tmp
+
+    # Test -p: we get the nodes containing these properties
+    run_wrap_test check_lines 6 $DTGREP -p compatible -n / $dtb
+    run_wrap_test check_lines 5 $DTGREP -p bootargs -n / $dtb
+
+    # Now similar tests for -P
+    # First get the number of property lines (containing '=')
+    lines=$(grep "=" $dts |wc -l)
+    run_wrap_test check_lines $(($node_lines - 2)) $DTGREP -P compatible \
+	-n // $dtb
+    run_wrap_test check_lines $(($node_lines - 1)) $DTGREP -P bootargs \
+	-n // $dtb
+    run_wrap_test check_lines $(($node_lines - 3)) $DTGREP -P compatible \
+	-P bootargs -n // $dtb
+
+    # Now some dtb tests. The dts tests above have tested the basic grepping
+    # features so we only need to concern ourselves with things that are
+    # different about dtb/bin output.
+
+    # An empty node list should just give us just the FDT_END tag
+    run_wrap_test check_bytes 4 $DTGREP -n // -O bin $dtb
+
+    rm -f $tmp
+}
+
 while getopts "vt:me" ARG ; do
     case $ARG in
 	"v")
@@ -1050,7 +1156,7 @@ while getopts "vt:me" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdtoverlay"
+    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdtoverlay fdtgrep"
 
     # Test pylibfdt if the libfdt Python module is available.
     if ! $no_python; then
@@ -1090,6 +1196,9 @@ for set in $TESTSETS; do
         "fdtoverlay")
 	    fdtoverlay_tests
 	    ;;
+	"fdtgrep")
+	    fdtgrep_tests
+	    ;;
     esac
 done
 
diff --git a/tests/testutils.sh b/tests/testutils.sh
index 6b2f0d1..3a75c48 100644
--- a/tests/testutils.sh
+++ b/tests/testutils.sh
@@ -27,6 +27,7 @@ DTGET=${TEST_BINDIR}/fdtget
 DTPUT=${TEST_BINDIR}/fdtput
 FDTDUMP=${TEST_BINDIR}/fdtdump
 FDTOVERLAY=${TEST_BINDIR}/fdtoverlay
+DTGREP=${TEST_BINDIR}/fdtgrep
 
 verbose_run () {
     if [ -z "$QUIET_TEST" ]; then
-- 
2.34.0.rc0.344.g81b53c2807-goog

