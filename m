From: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Subject: [PATCH 2/2] Add embedded nul string list test
Date: Mon, 16 Jun 2014 11:35:52 -0500
Message-ID: <1402936552-10249-3-git-send-email-jack@codezen.org>
References: <1402936552-10249-1-git-send-email-jack@codezen.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402936552-10249-1-git-send-email-jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

---
 tests/nul_string_list.dtb | Bin 0 -> 127 bytes
 tests/nul_string_list.dts | Bin 0 -> 66 bytes
 tests/run_tests.sh        |   3 +++
 3 files changed, 3 insertions(+)
 create mode 100644 tests/nul_string_list.dtb
 create mode 100644 tests/nul_string_list.dts

diff --git a/tests/nul_string_list.dtb b/tests/nul_string_list.dtb
new file mode 100644
index 0000000000000000000000000000000000000000..ea2bc3915d8129c849d2cc7b247bc9d1a201256c
GIT binary patch
literal 127
zcmcb>`|m9S14BI!TL5tZ5NiOjAP@@xF$nMjF-Q&_FhT{GfwVM;U6fj!T2z*52xAz*
W7{*|gOhA$oswPD@FEKZ@m;nI8VH4E=

literal 0
HcmV?d00001

diff --git a/tests/nul_string_list.dts b/tests/nul_string_list.dts
new file mode 100644
index 0000000000000000000000000000000000000000..845a14425fd36db3fac2934d1412dbb2cd8fb3a9
GIT binary patch
literal 66
zcmdN-DJj-1Gt{@{;?h^B=He_$Elw>eOHI+uOUz9zR<Ko2f{GY2Kp93bhOv@0SFJS{
E0H@#-od5s;

literal 0
HcmV?d00001

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f205ce6..3b0b500 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -310,6 +310,9 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_comments-cmp.test.dtb comments-cmp.dts
     run_test dtbs_equal_ordered dtc_comments.test.dtb dtc_comments-cmp.test.dtb
 
+    run_dtc_test -I dts -O dtb -o dtc_nul_string_list.dtb nul_string_list.dts
+    run_test dtbs_equal_ordered dtc_nul_string_list.dtb nul_string_list.dtb
+
     # Check aliases support in fdt_path_offset
     run_dtc_test -I dts -O dtb -o aliases.dtb aliases.dts
     run_test get_alias aliases.dtb
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
