From: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Subject: [PATCH] Properly handle \0 delimited string lists
Date: Tue, 10 Jun 2014 14:57:36 -0500
Message-ID: <1402430256-8359-1-git-send-email-jack@codezen.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

reserved-names="res1\0res2\0res3";

Is valid DTS. This one-liner expands data based on the len given by the lexer
instead of strlen.

Without this patch, realloc gets confused and hangs. For example:

*** Error in `./dtc': realloc(): invalid next size: 0x0000000001961670
***
---
 data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
