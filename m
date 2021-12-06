From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Support 'b' format for printing raw bytes with fdtget
Date: Mon,  6 Dec 2021 16:49:53 +0100
Message-ID: <20211206154953.17089-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9qX29ZKebtDRxC9trwZPco/hcO5EN2iVVkQApInCDW4=;
        b=Ht1So438m0kc/xtbdQe6PeoBBjRYzPPIi1zxlhl5At9y3203A9D2cxNbUmJOViXomn
         IUvYNuCfgC/RN3PtiaFKrF/vVdArZ7LVmAuYd8wKFqPIbHFCJTPo+QnPPkLS7mP3Ej0D
         CS2wI2+a/1BNE1Hvr69+Iklk5TzUB3KTGkjT+sQ+9Ur32ZSYAfXW2x/pYQAKNxzr4NXt
         JQv3jiyKfbmqyxFkorNEnmv4JqUpQr7ESJUbzg9ghe4JC3j08fYjCaFFn725oInjT0nd
         su+CrS8lhxYlAvl6rfG91tgNUuCvXH4h7XIRE85XC6XG04jDs+Lp3wlPMbdK2yEZJEto
         i2Jw==
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

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 fdtget.c |  5 +++++
 util.c   | 24 ++++++++++++++----------
 2 files changed, 19 insertions(+), 10 deletions(-)

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
diff --git a/util.c b/util.c
index 40274fb..4fa76c5 100644
--- a/util.c
+++ b/util.c
@@ -340,24 +340,28 @@ int utilfdt_decode_type(const char *fmt, int *type, int *size)
 
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
+	if (!strchr("iuxsb", *fmt)) {
+		if (*fmt)
+			fprintf(stderr, "invalid type: %c\n", *fmt);
 		return -1;
+	}
 
 	/* convert qualifier (bhL) to byte size */
-	if (*fmt != 's')
+	if (*fmt != 's' && *fmt != 'b')
 		*size = qualifier == 'b' ? 1 :
 				qualifier == 'h' ? 2 :
 				qualifier == 'l' ? 4 : -1;
-- 
2.31.1

