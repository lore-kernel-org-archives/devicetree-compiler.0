From: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: [PATCH] DTC: Fix unprotected file name member access.
Date: Mon, 11 Jul 2016 00:17:08 +0200
Message-ID: <1468189028-1641-1-git-send-email-jcd@tribudubois.net>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
Cc: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
---
 srcpos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index af7fb3c..927ac54 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -252,7 +252,7 @@ void
 srcpos_dump(struct srcpos *pos)
 {
 	printf("file        : \"%s\"\n",
-	       pos->file ? (char *) pos->file : "<no file>");
+	       (pos->file && pos->file->name) ? pos->file->name : "<no file>");
 	printf("first_line  : %d\n", pos->first_line);
 	printf("first_column: %d\n", pos->first_column);
 	printf("last_line   : %d\n", pos->last_line);
@@ -267,7 +267,7 @@ srcpos_string(struct srcpos *pos)
 	const char *fname = "<no-file>";
 	char *pos_str;
 
-	if (pos)
+	if (pos->file && pos->file->name)
 		fname = pos->file->name;
 
 
-- 
2.7.4
