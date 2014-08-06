From: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Subject: [PATCH] Properly handle embedded nul delimited string lists
Date: Wed,  6 Aug 2014 14:31:52 -0500
Message-ID: <1407353512-12182-2-git-send-email-jack@codezen.org>
References: <1407353512-12182-1-git-send-email-jack@codezen.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407353512-12182-1-git-send-email-jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

For example:

reserved-names="res1\0res2\0res3";

Where \0 is an actual embedded NUL in the source instead of a string
escape. To achieve this, use the len given by the lexer instead of
strlen.

Without this patch dtc will mangle the output and possibly hang on
realloc.
---
 data.c                       |   2 +-
 tests/embedded_nul.dts       | Bin 0 -> 152 bytes
 tests/embedded_nul_equiv.dts |   6 ++++++
 tests/run_tests.sh           |   4 ++++
 4 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 tests/embedded_nul.dts
 create mode 100644 tests/embedded_nul_equiv.dts

diff --git a/data.c b/data.c
index 4c50b12..8cae237 100644
--- a/data.c
+++ b/data.c
@@ -74,7 +74,7 @@ struct data data_copy_escape_string(const char *s, int len)
 	struct data d;
 	char *q;
 
-	d = data_grow_for(empty_data, strlen(s)+1);
+	d = data_grow_for(empty_data, len + 1);
 
 	q = d.val;
 	while (i < len) {
diff --git a/tests/embedded_nul.dts b/tests/embedded_nul.dts
new file mode 100644
index 0000000000000000000000000000000000000000..7b4993cc5452ba57f78cedf01715deaba55d8613
GIT binary patch
literal 152
zcmdN-DJj-1Gt{@{;?h^B=He_$Elw>eOHI+uOUz9zR<Ko2O2hyRNnpT`j0}{lku(=2
W=B0ym+b9@R7?6Y&?5w$Jt+@ajWGrd`

literal 0
HcmV?d00001

diff --git a/tests/embedded_nul_equiv.dts b/tests/embedded_nul_equiv.dts
new file mode 100644
index 0000000..e978204
--- /dev/null
+++ b/tests/embedded_nul_equiv.dts
@@ -0,0 +1,6 @@
+/dts-v1/;
+
+/ {
+	reserved-names = "aaaaaaaaaaaaaaaaaa\0bbbbbb\0ccccccccccccc";
+	reserved-ranges = < 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0  >;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f94d361..ace6e4f 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -275,6 +275,10 @@ libfdt_tests () {
     run_dtc_test -I dts -O dtb -o sourceoutput.test.dtb sourceoutput.dts
     run_dtc_test -I dts -O dtb -o sourceoutput.test.dts.test.dtb sourceoutput.test.dts
     run_test dtbs_equal_ordered sourceoutput.test.dtb sourceoutput.test.dts.test.dtb
+
+    run_dtc_test -I dts -O dtb -o embedded_nul.test.dtb embedded_nul.dts
+    run_dtc_test -I dts -O dtb -o embedded_nul_equiv.test.dtb embedded_nul_equiv.dts
+    run_test dtbs_equal_ordered embedded_nul.test.dtb embedded_nul_equiv.test.dtb
 }
 
 dtc_tests () {
-- 
2.0.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
