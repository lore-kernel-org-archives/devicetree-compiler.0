From: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Fix test script to run also on dash shell
Date: Wed, 29 Jun 2022 19:32:10 +0300
Message-ID: <20220629163210.932198-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4dk2FFicaUKd8x+nvOtV1REpM8VyprhLsfMh0oSt0JE=;
        b=FV5qQXKHCgtKgyBvWN/2DzbRUSOfkaqzq2wrluzL7+XzD5nd3PiVv0Q7f31fYFH/9M
         3VGMnpQnIU8VqQJNdpFzWkHwUSKMn/DhqTnkM+Puw3nNnLG4+a1xhnz/fa4hkIQ728wN
         63Sz328/H6lLBmrWktM755LFMfimKQB8cAQcKzo0kfPFtgy/6DwGlDnjOmEkTIxJ2Aal
         Y5SleXM4Erw+zyt+Px72tj8rvp3WWGbqZb7i4mRdhOdOHmWvojmxcHkgPg19uvTBzDVl
         PshG7TotuDt42JiiWDSCvamMn/IC7AepysRJd4bMfoxTQ9WpTvzehI1MFUKa/M89UMLO
         TYhQ==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

/bin/sh points to dash instead of bash in some linux distros.
This fix allows test script to run on both.

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

