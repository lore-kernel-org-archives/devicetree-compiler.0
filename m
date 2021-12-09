From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V4] Support 'r' format for printing raw bytes with fdtget
Date: Thu,  9 Dec 2021 07:14:20 +0100
Message-ID: <20211209061420.29466-1-zajec5@gmail.com>
References: <20211209053041.17984-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9iAbOW94NcfD1Y2ISg9ZiNyTiITU/2nBqRes9vCarmw=;
        b=XLUW6wcAwOwbA66YcCXEIHUXA1JNGm2NwMHq1oMblyITeUfCs45NZ5D+8rd1KMcitn
         80ZjP/hIlNPmpx8oE3sGphWHxpns6FhA7OCBFDSQzLkvPBg3+328DokNGH3cXrZnvLt0
         XWu4EC5CG/hSwaczrxegOgq95GZ7+ZeVGhiEcOXsBBBsypeJdGANn6z6vSEtTyv8WaLF
         UYUvGJ4AoSC6caa3W84b6XR4lpAmKkhl+ABU9DGs/Cll+DyfhTVKB0KQOwjBe/5zKWbE
         UwT8n1eFnIMSZ4ltbOiLqW0eCK/Ny27v2/QlzUwIQmAzU9O69aI3m+MNu3d6/PH00HGH
         eK7A==
In-Reply-To: <20211209053041.17984-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

FT is sometimes used for storing raw data. That is quite common for
U-Boot FIT images.

Extracting such data is not trivial currently. Using type 's' (string)
will replace every 0x00 (NUL) with 0x20 (space). Using type 'x' will
print bytes but in xxd incompatible format.

This commit adds support for 'r' (raw) format. Example usage:
fdtget -t r firmware.itb /images/foo data > image.raw

Support for encoding isn't added as there isn't any clean way of passing
binary data as command line argument.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V2: Update usage info & add tests
V3: Use "r" instead of "b" to avoid confusiong with qualifier
V4: Don't rework utilfdt_decode_type() code handling qualifiers
---
 Documentation/manual.txt | 2 +-
 fdtget.c                 | 5 +++++
 fdtput.c                 | 2 ++
 tests/run_tests.sh       | 2 ++
 tests/utilfdt_test.c     | 5 ++++-
 util.c                   | 4 ++--
 util.h                   | 3 ++-
 7 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 97e53b9..cf4b253 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -712,7 +712,7 @@ The syntax of the fdtget command is:
 
 where options are:
 
-    <type>    s=string, i=int, u=unsigned, x=hex
+    <type>    s=string, i=int, u=unsigned, x=hex, r=raw
         Optional modifier prefix:
             hh or b=byte, h=2 byte, l=4 byte (default)
 
diff --git a/fdtget.c b/fdtget.c
index 54fc6a0..dd70985 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -97,6 +97,11 @@ static int show_data(struct display_info *disp, const char *data, int len)
 	if (len == 0)
 		return 0;
 
+	if (disp->type == 'r') {
+		fwrite(data, 1, len, stdout);
+		return 0;
+	}
+
 	is_string = (disp->type) == 's' ||
 		(!disp->type && util_is_printable_string(data, len));
 	if (is_string) {
diff --git a/fdtput.c b/fdtput.c
index 428745a..c2fecf4 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -433,6 +433,8 @@ int main(int argc, char *argv[])
 			if (utilfdt_decode_type(optarg, &disp.type,
 					&disp.size))
 				usage("Invalid type string");
+			if (disp.type == 'r')
+				usage("Unsupported raw data type");
 			break;
 
 		case 'v':
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index d100d5a..11068e1 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -855,6 +855,8 @@ fdtget_tests () {
     run_fdtget_test 8000 -tx $dtb /cpus/PowerPC,970@1 d-cache-size
     run_fdtget_test "61 62 63 0" -tbx $dtb /randomnode tricky1
     run_fdtget_test "a b c d de ea ad be ef" -tbx $dtb /randomnode blob
+    run_fdtget_test "MyBoardName\0MyBoardFamilyName\0" -tr $dtb / compatible
+    run_fdtget_test "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" -tr $dtb /randomnode blob
 
     # Here the property size is not a multiple of 4 bytes, so it should fail
     run_wrap_error_test $DTGET -tlx $dtb /randomnode mixed
diff --git a/tests/utilfdt_test.c b/tests/utilfdt_test.c
index c621759..ba6462f 100644
--- a/tests/utilfdt_test.c
+++ b/tests/utilfdt_test.c
@@ -73,6 +73,9 @@ static void check_sizes(char *modifier, int expected_size)
 
 	*ptr = 's';
 	check(fmt, 's', -1);
+
+	*ptr = 'r';
+	check(fmt, 'r', -1);
 }
 
 static void test_utilfdt_decode_type(void)
@@ -90,7 +93,7 @@ static void test_utilfdt_decode_type(void)
 	/* try every other character */
 	checkfail("");
 	for (ch = ' '; ch < 127; ch++) {
-		if (!strchr("iuxs", ch)) {
+		if (!strchr("iuxsr", ch)) {
 			*fmt = ch;
 			fmt[1] = '\0';
 			checkfail(fmt);
diff --git a/util.c b/util.c
index 40274fb..14d3868 100644
--- a/util.c
+++ b/util.c
@@ -353,11 +353,11 @@ int utilfdt_decode_type(const char *fmt, int *type, int *size)
 	}
 
 	/* we should now have a type */
-	if ((*fmt == '\0') || !strchr("iuxs", *fmt))
+	if ((*fmt == '\0') || !strchr("iuxsr", *fmt))
 		return -1;
 
 	/* convert qualifier (bhL) to byte size */
-	if (*fmt != 's')
+	if (*fmt != 's' && *fmt != 'r')
 		*size = qualifier == 'b' ? 1 :
 				qualifier == 'h' ? 2 :
 				qualifier == 'l' ? 4 : -1;
diff --git a/util.h b/util.h
index c45b2c2..7a4e910 100644
--- a/util.h
+++ b/util.h
@@ -143,6 +143,7 @@ int utilfdt_write_err(const char *filename, const void *blob);
  *		i	signed integer
  *		u	unsigned integer
  *		x	hex
+ *		r	raw
  *
  * TODO: Implement ll modifier (8 bytes)
  * TODO: Implement o type (octal)
@@ -160,7 +161,7 @@ int utilfdt_decode_type(const char *fmt, int *type, int *size);
  */
 
 #define USAGE_TYPE_MSG \
-	"<type>\ts=string, i=int, u=unsigned, x=hex\n" \
+	"<type>\ts=string, i=int, u=unsigned, x=hex, r=raw\n" \
 	"\tOptional modifier prefix:\n" \
 	"\t\thh or b=byte, h=2 byte, l=4 byte (default)";
 
-- 
2.31.1

