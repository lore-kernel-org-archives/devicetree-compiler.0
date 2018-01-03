From: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Subject: [PATCH] tests: Improve compatibility with other platforms
Date: Tue,  2 Jan 2018 20:55:32 -0600
Message-ID: <20180103025532.43393-1-kevans@FreeBSD.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

stat -c %s's equivalent on FreeBSD is stat -f %Uz; these differ enough, allow
STATSZ in the environment to specify local replacement for a stat that outputs
size in bytes of an argument.

Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
---
 tests/run_tests.sh | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index d36dffb..13c9f1c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -6,6 +6,11 @@ if [ -z "$CC" ]; then
     CC=gcc
 fi
 
+# stat differs between platforms
+if [ -z "$STATSZ" ]; then
+	STATSZ="stat -c %s"
+fi
+
 export QUIET_TEST=1
 STOP_ON_FAIL=0
 
@@ -114,7 +119,7 @@ run_wrap_error_test () {
 # $2: align base
 check_align () {
     shorten_echo "check_align $@:	"
-    local size=$(stat -c %s "$1")
+    local size=$($STATSZ "$1")
     local align="$2"
     (
 	if [ $(($size % $align)) -eq 0 ] ;then
@@ -714,7 +719,7 @@ fdtput_tests () {
     text=lorem.txt
 
     # Allow just enough space for $text
-    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
+    run_dtc_test -O dtb -p $($STATSZ $text) -o $dtb $dts
 
     # run_fdtput_test <expected-result> <file> <node> <property> <flags> <value>
     run_fdtput_test "a_model" $dtb / model -ts "a_model"
@@ -733,7 +738,7 @@ fdtput_tests () {
     run_fdtput_test "$(cat $text $text)" $dtb /randomnode blob -ts "$(cat $text $text)"
 
     # Start again with a fresh dtb
-    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
+    run_dtc_test -O dtb -p $($STATSZ $text) -o $dtb $dts
 
     # Node creation
     run_wrap_error_test $DTPUT $dtb -c /baldrick sod
@@ -761,7 +766,7 @@ fdtput_tests () {
     run_wrap_test $DTPUT $dtb -cp /chosen/son
 
     # Start again with a fresh dtb
-    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
+    run_dtc_test -O dtb -p $($STATSZ $text) -o $dtb $dts
 
     # Node delete
     run_wrap_test $DTPUT $dtb -c /chosen/node1 /chosen/node2 /chosen/node3
-- 
2.15.1
