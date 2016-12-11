From: Gabriel Smith <ga29smith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dtc: Fix memory leak in character literal parsing
Date: Sun, 11 Dec 2016 15:13:16 -0500
Message-ID: <1481487196-20830-1-git-send-email-ga29smith@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=/raj2ZNbhSf789nUm1zLGOtCYL2WM+5vIV+LNfkl2+Q=;
        b=TexOC6qegD9ziHQamU2uJwqqC8D9oPt37QiPPd/wTcJZE7Gu1+g3Hx9jI/+s1eZS+Y
         ZPM7RAsfH1pWngsOmaeLRKos7ZEUE2Fl2/1ug3im4Z7FChF8JcHOrqyrX6HsiKbYhYEr
         /Ho1DZq84pQLVxUJ35Kz2CSZ4Skv+kLLkZdnuUrOxWAa8G7nKu7Qn+O+uOZhqbwiAcLF
         rInpVxtZfgvjlAn62I07yLVJ5a2D2st7qNjSSfSCMWPZiW+S8zeS6G2GSEyFmbyoYacj
         V5si5ldc/AVISEAe52+3crBojZphe0mW8f7T0knqV1mc/dI1Lao1vhFHWtIXiA3eaa7X
         nAZA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gabriel Smith <ga29smith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The data struct used for parsing character literals was never freed
resulting in a few bytes leaked for every character.

Signed-off-by: Gabriel Smith <ga29smith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 dtc-lexer.l | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 790fbf6..f252ab9 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -184,16 +184,16 @@ static void lexical_error(const char *fmt, ...);
 			if (d.len == 1) {
 				lexical_error("Empty character literal");
 				yylval.integer = 0;
-				return DT_CHAR_LITERAL;
-			}
-
-			yylval.integer = (unsigned char)d.val[0];
+			} else {
+				yylval.integer = (unsigned char)d.val[0];
 
-			if (d.len > 2)
-				lexical_error("Character literal has %d"
-					      " characters instead of 1",
-					      d.len - 1);
+				if (d.len > 2)
+					lexical_error("Character literal has %d"
+						      " characters instead of 1",
+						      d.len - 1);
+			}
 
+			data_free(d);
 			return DT_CHAR_LITERAL;
 		}
 
-- 
2.7.4
