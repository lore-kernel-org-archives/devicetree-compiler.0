From: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] Fix test script to run also on dash shell
Date: Mon,  4 Jul 2022 10:37:22 +0300
Message-ID: <20220704073722.1075849-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QoFneJZCnpOgsm5/uxersAPjHkreqZImwarYJx9oFic=;
        b=GEHsmwkh3ekjX1I8TOcmkeoOHMu1QVC1ONvBq1e4sIiyYDHzGipIbxr+hIHIwWoR9s
         VOpUDCgYT+TtDizRAjlFH+2dWDfNBaiFaAtsT6sCaa0b68sWwyq6+GIXu4P0BvAfawNt
         ppnpSe2ZxC4wqTd3nWchLIIeQWb7mOAubmuus2dd3EpbCEF8DAtbuybJtiWzWKTUdzlX
         2dGQ3axXw59rGi4X0P9PzZj6xpTDQaYFmJ7aAqErtPRMreiPd2ZcJ46k+zzUhex9s6ju
         JhZr3DhVGo5Z2kV380jcMvuSSk0NZy3yvWVsuTx+tjWK/j1OCCUcSMBw+1asz7mPNd+z
         zeTA==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

/bin/sh points to dash instead of bash in some linux distros.
One test would fail if dash was used, this fix will allow all tests
to run properly on dash too.

dash built-in printf does not support "\xNN" -hex escape format.
"\NNN" -octal escape format is supported by both bash and dash printf.

Replaced "$(echo "$expect")" because this actually runs /bin/echo
instead of shell internal echo and in some cases causes "\NNN" escapes
to be printed as the actual characters they represent instead of the
escape sequence itself.

Cosmetic quotes added to make printout a bit clearer.

Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
---
 tests/run_tests.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index c78351d..1b16eb8 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -195,7 +195,7 @@ asm_to_so_test () {
 run_fdtget_test () {
     expect="$1"
     shift
-    printf "fdtget-runtest.sh %s $*:	" "$(echo $expect)"
+    printf "fdtget-runtest.sh \"%s\" $*:	" "$expect"
     base_run_test sh "$SRCDIR/fdtget-runtest.sh" "$expect" "$@"
 }
 
@@ -862,7 +862,7 @@ fdtget_tests () {
     run_fdtget_test "61 62 63 0" -tbx $dtb /randomnode tricky1
     run_fdtget_test "a b c d de ea ad be ef" -tbx $dtb /randomnode blob
     run_fdtget_test "MyBoardName\0MyBoardFamilyName\0" -tr $dtb / compatible
-    run_fdtget_test "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" -tr $dtb /randomnode blob
+    run_fdtget_test "\012\013\014\015\336\352\255\276\357" -tr $dtb /randomnode blob
 
     # Here the property size is not a multiple of 4 bytes, so it should fail
     run_wrap_error_test $DTGET -tlx $dtb /randomnode mixed
-- 
2.33.3

