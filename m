From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] tests: convert `echo -n` to `printf`
Date: Wed,  6 May 2015 01:55:46 -0400
Message-ID: <1430891746-30267-1-git-send-email-vapier@gentoo.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The -n option is not standard in POSIX, so convert to printf which should
work the same in every shell.

Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 tests/run_tests.sh | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index c870432..0dda54a 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -42,20 +42,20 @@ base_run_test() {
 
 shorten_echo () {
     limit=32
-    echo -n "$1"
+    printf "$1"
     shift
     for x; do
 	if [ ${#x} -le $limit ]; then
-	    echo -n " $x"
+	    printf " $x"
 	else
 	    short=$(echo "$x" | head -c$limit)
-	    echo -n " \"$short\"...<${#x} bytes>"
+	    printf " \"$short\"...<${#x} bytes>"
 	fi
     done
 }
 
 run_test () {
-    echo -n "$@:	"
+    printf "$@:	"
     if [ -n "$VALGRIND" -a -f $1.supp ]; then
 	VGSUPP="--suppressions=$1.supp"
     fi
@@ -63,7 +63,7 @@ run_test () {
 }
 
 run_sh_test () {
-    echo -n "$@:	"
+    printf "$@:	"
     base_run_test sh "$@"
 }
 
@@ -106,12 +106,12 @@ wrap_error () {
 
 run_wrap_error_test () {
     shorten_echo "$@"
-    echo -n " {!= 0}:	"
+    printf " {!= 0}:	"
     base_run_test wrap_error "$@"
 }
 
 run_dtc_test () {
-    echo -n "dtc $@:	"
+    printf "dtc $@:	"
     base_run_test wrap_test $VALGRIND $DTC "$@"
 }
 
@@ -126,7 +126,7 @@ asm_to_so_test () {
 run_fdtget_test () {
     expect="$1"
     shift
-    echo -n "fdtget-runtest.sh "$expect" $@:	"
+    printf "fdtget-runtest.sh "$expect" $@:	"
     base_run_test sh fdtget-runtest.sh "$expect" "$@"
 }
 
@@ -134,14 +134,14 @@ run_fdtput_test () {
     expect="$1"
     shift
     shorten_echo fdtput-runtest.sh "$expect" "$@"
-    echo -n ":	"
+    printf ":	"
     base_run_test sh fdtput-runtest.sh "$expect" "$@"
 }
 
 run_fdtdump_test() {
     file="$1"
     shorten_echo fdtdump-runtest.sh "$file"
-    echo -n ":	"
+    printf ":	"
     base_run_test sh fdtdump-runtest.sh "$file"
 }
 
-- 
2.4.0
