From: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: [PATCH] convert-dtsv0-lexer.l: fix memory leak
Date: Wed, 13 Jul 2016 00:35:50 +0200
Message-ID: <1468362950-32027-1-git-send-email-jcd@tribudubois.net>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
Cc: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

CID 132822 (#1 of 1): Resource leak (RESOURCE_LEAK)
9. leaked_storage: Variable newname going out of scope leaks the storage it points to

Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
---
 convert-dtsv0-lexer.l | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/convert-dtsv0-lexer.l b/convert-dtsv0-lexer.l
index 259e527..8d8289b 100644
--- a/convert-dtsv0-lexer.l
+++ b/convert-dtsv0-lexer.l
@@ -208,6 +208,12 @@ static void convert_file(const char *fname)
 	char *newname;
 
 	newname = xmalloc(len + sizeof(suffix));
+
+	if (!newname) {
+		die("failed to allocate memory for input file %s: %s\n",
+		    fname, strerror(errno));
+	}
+
 	memcpy(newname, fname, len);
 	memcpy(newname + len, suffix, sizeof(suffix));
 
@@ -223,6 +229,8 @@ static void convert_file(const char *fname)
 
 	while(yylex())
 		;
+
+	free(newname);
 }
 
 int main(int argc, char *argv[])
-- 
2.7.4
