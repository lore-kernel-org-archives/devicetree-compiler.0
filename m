From: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] tests: add -a option cases
Date: Wed, 13 Jul 2016 19:35:01 +0800
Message-ID: <1468409701-3310-1-git-send-email-timwang@asrmicro.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=NMe8qQiP0sttpRB0rt
	sfosH/tlpesuzS5di5N/rPZ4I=; b=fmT7Ze0BtH3+02kQdp7uYtTnKxp/gvJZft
	DBisiEui0Xqp0uzUwF8EUilfUCx6KtXlB5XCfdtRjMT+Q7cV4SzjX2IeiAv0pgGD
	Kk8XWZj3xd/Nwzgi9TpvbYpixj6bWqJTX07PFwSwGCPW34368DavL8Xe3g9dE/l3
	5+dUXFdns=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: wtt_usst-9Onoh4P/yGk@public.gmane.org, timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org

Signed-off-by: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
---
 tests/run_tests.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 7eb9b3d..6aed6d6 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -579,9 +579,10 @@ fdtput_tests () {
     dts=label01.dts
     dtb=$dts.fdtput.test.dtb
     text=lorem.txt
+    align=64
 
     # Allow just enough space for $text
-    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
+    run_dtc_test -O dtb -p $(stat -c %s $text) -a $align -o $dtb $dts
 
     # run_fdtput_test <expected-result> <file> <node> <property> <flags> <value>
     run_fdtput_test "a_model" $dtb / model -ts "a_model"
@@ -600,7 +601,7 @@ fdtput_tests () {
     run_fdtput_test "$(cat $text $text)" $dtb /randomnode blob -ts "$(cat $text $text)"
 
     # Start again with a fresh dtb
-    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
+    run_dtc_test -O dtb -p $(stat -c %s $text) -a $align -o $dtb $dts
 
     # Node creation
     run_wrap_error_test $DTPUT $dtb -c /baldrick sod
@@ -628,7 +629,7 @@ fdtput_tests () {
     run_wrap_test $DTPUT $dtb -cp /chosen/son
 
     # Start again with a fresh dtb
-    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
+    run_dtc_test -O dtb -p $(stat -c %s $text) -a $align -o $dtb $dts
 
     # Node delete
     run_wrap_test $DTPUT $dtb -c /chosen/node1 /chosen/node2 /chosen/node3
-- 
1.9.1

