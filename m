From: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] checks: stop allowing nr-gpio, only allow nr-gpios
Date: Sun,  4 Apr 2021 16:50:42 -0700
Message-ID: <20210404235042.630817-1-ilya.lipnitskiy@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5nSxesaAzeYAMyTqPCXv7z9VUiWJegZGl6mLj8q0CLY=;
        b=eYOGMqg4kHDjGw2G5Sr1CbA94XayLP4/L1Opa+3DB/LcQPq8oAJPgNF/MkFZggIPEy
         osgR1f2grVlgi2Jdy2e60zVLxWMnCeWN9aDlxArLLeEY+BtPU5qN7yr0liN9BUc4Zlgl
         oxIfKfVZ3mgizlDehI37EtoMLuI6HXaL2OeVZPlge0byy3B+DUmemJP2kGPX1TKl07sq
         DqhAclycu+txV69LRBCaNQWE0+Q4p+6QVhmLOqtEqCW+rYtYiAGcog2RHMUF2Buuca62
         nGL0oJ80EIEihJ/QXxaIJ3Dz78W4+glqE5/Qm/BaQDtTkbsXtmA0osLhL+BG2sd1ieV7
         t+9Q==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

There are no instances of nr-gpio in the Linux kernel tree, only
"[<vendor>,]nr-gpios", so make the check stricter to not allow nr-gpio.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index c4207720ce8c..2800b5786b03 100644
--- a/checks.c
+++ b/checks.c
@@ -1494,7 +1494,7 @@ static bool prop_is_gpio(struct property *prop)
 	 * *-gpios and *-gpio can appear in property names,
 	 * so skip over any false matches (only one known ATM)
 	 */
-	if (strstr(prop->name, "nr-gpio"))
+	if (strstr(prop->name, "nr-gpios"))
 		return false;
 
 	str = strrchr(prop->name, '-');
-- 
2.31.1

