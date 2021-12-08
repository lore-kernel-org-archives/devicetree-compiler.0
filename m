From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2] Support 'b' format for printing raw bytes with fdtget
Date: Wed,  8 Dec 2021 18:00:55 +0100
Message-ID: <20211208170055.13811-1-zajec5@gmail.com>
References: <20211206154953.17089-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WCETnYHSzMCvSN7SqOJAx3eX1JgtJ75WzZEXm2Z5hFs=;
        b=R3Bs7d5gcbStu/x9/fE0CkIjSG741dUk1RFdJkcOIvGBOmGYQrZG0gBNZEUu533jpM
         pE/UZcIdcnj8S8aFHthkGwZLimDeyZFvjOqtGBEOhU/a/poQHJSDCZnqPQ7ugkPmixrC
         4vEnUQOL3UjpCa7C8AhxvgeQOLn5VAzgPMfXPtT+0g0Dap8Cfk0tLcOnjsVgwROm3yJh
         jdvsxJDWkmKW/dIKk2cjNK+0UIW5BufMrVjKLbj4Q547UE+Z71MB2SFeXxMSQha6PjBV
         zR9SUzcxrTG7WdpabWZQHy3q0JjesjWU0j/7HEaf4CxyrLqSvXsuMHPjOI/zt+NBOz6W
         BtPA==
In-Reply-To: <20211206154953.17089-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

This commit adds support for 'b' (binary) format. Example usage:
fdtget -t b firmware.itb /images/foo data > image.raw

Support for encoding isn't added as there isn't any clean way of passing
binary data as command line argument.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V2: Update usage info & add tests

Alternatively I could use e.g. "r" (raw) instead of "b" (binary) if you
find it more accurate. Please let me know.
---
 Documentation/manual.txt |  2 +-
 fdtget.c                 |  5 +++++
 fdtput.c                 |  2 ++
 tests/run_tests.sh       |  2 ++
 tests/utilfdt_test.c     |  5 ++++-
 util.c                   | 21 +++++++++++----------
 util.h                   |  3 ++-
 7 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 97e53b9..73e0593 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -712,7 +712,7 @@ The syntax of the fdtget command is:
 
 where options are:
 
-    <type>    s=string, i=int, u=unsigned, x=hex
+    <type>    s=string, i=int, u=unsigned, x=hex, b=binary
         Optional modifier prefix:
             hh or b=byte, h=2 byte, l=4 byte (default)
 
diff --git a/fdtget.c b/fdtget.c
index 54fc6a0..6e4abf1 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -97,6 +97,11 @@ static int show_data(struct display_info *disp, const char *data, int len)
 	if (len == 0)
 		return 0;
 
+	if (disp->type == 'b') {
+		fwrite(data, 1, len, stdout);
+		return 0;
+	}
+
 	is_string = (disp->type) == 's' ||
 		(!disp->type && util_is_printable_string(data, len));
 	if (is_string) {
diff --git a/fdtput.c b/fdtput.c
index 428745a..99b0bf9 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -433,6 +433,8 @@ int main(int argc, char *argv[])
 			if (utilfdt_decode_type(optarg, &disp.type,
 					&disp.size))
 				usage("Invalid type string");
+			if (disp.type == 'b')
+				usage("Unsupported binary data type");
 			break;
 
 		case 'v':
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index d100d5a..484be18 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -855,6 +855,8 @@ fdtget_tests () {
     run_fdtget_test 8000 -tx $dtb /cpus/PowerPC,970@1 d-cache-size
     run_fdtget_test "61 62 63 0" -tbx $dtb /randomnode tricky1
     run_fdtget_test "a b c d de ea ad be ef" -tbx $dtb /randomnode blob
+    run_fdtget_test "MyBoardName\0MyBoardFamilyName\0" -tb $dtb / compatible
+    run_fdtget_test "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" -tb $dtb /randomnode blob
 
     # Here the property size is not a multiple of 4 bytes, so it should fail
     run_wrap_error_test $DTGET -tlx $dtb /randomnode mixed
diff --git a/tests/utilfdt_test.c b/tests/utilfdt_test.c
index c621759..906f250 100644
--- a/tests/utilfdt_test.c
+++ b/tests/utilfdt_test.c
@@ -73,6 +73,9 @@ static void check_sizes(char *modifier, int expected_size)
 
 	*ptr = 's';
 	check(fmt, 's', -1);
+
+	*ptr = 'b';
+	check(fmt, 'b', -1);
 }
 
 static void test_utilfdt_decode_type(void)
@@ -90,7 +93,7 @@ static void test_utilfdt_decode_type(void)
 	/* try every other character */
 	checkfail("");
 	for (ch = ' '; ch < 127; ch++) {
-		if (!strchr("iuxs", ch)) {
+		if (!strchr("iuxsb", ch)) {
 			*fmt = ch;
 			fmt[1] = '\0';
 			checkfail(fmt);
diff --git a/util.c b/util.c
index 40274fb..b9e88f1 100644
--- a/util.c
+++ b/util.c
@@ -340,24 +340,25 @@ int utilfdt_decode_type(const char *fmt, int *type, int *size)
 
 	/* get the conversion qualifier */
 	*size = -1;
-	if (strchr("hlLb", *fmt)) {
-		qualifier = *fmt++;
-		if (qualifier == *fmt) {
-			switch (*fmt++) {
-/* TODO:		case 'l': qualifier = 'L'; break;*/
-			case 'h':
+	for (; *(fmt + 1); fmt++) {
+		if (!strchr("hlLb", *fmt))
+			return -1;
+		if (qualifier) {
+			if (*fmt == 'h' && qualifier == 'h')
 				qualifier = 'b';
-				break;
-			}
+			else
+				return -1;
+		} else {
+			qualifier = *fmt;
 		}
 	}
 
 	/* we should now have a type */
-	if ((*fmt == '\0') || !strchr("iuxs", *fmt))
+	if (!strchr("iuxsb", *fmt))
 		return -1;
 
 	/* convert qualifier (bhL) to byte size */
-	if (*fmt != 's')
+	if (*fmt != 's' && *fmt != 'b')
 		*size = qualifier == 'b' ? 1 :
 				qualifier == 'h' ? 2 :
 				qualifier == 'l' ? 4 : -1;
diff --git a/util.h b/util.h
index c45b2c2..fa381fc 100644
--- a/util.h
+++ b/util.h
@@ -143,6 +143,7 @@ int utilfdt_write_err(const char *filename, const void *blob);
  *		i	signed integer
  *		u	unsigned integer
  *		x	hex
+ *		b	binary
  *
  * TODO: Implement ll modifier (8 bytes)
  * TODO: Implement o type (octal)
@@ -160,7 +161,7 @@ int utilfdt_decode_type(const char *fmt, int *type, int *size);
  */
 
 #define USAGE_TYPE_MSG \
-	"<type>\ts=string, i=int, u=unsigned, x=hex\n" \
+	"<type>\ts=string, i=int, u=unsigned, x=hex, b=binary\n" \
 	"\tOptional modifier prefix:\n" \
 	"\t\thh or b=byte, h=2 byte, l=4 byte (default)";
 
-- 
2.31.1

