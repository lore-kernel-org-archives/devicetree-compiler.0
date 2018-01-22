From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH] srcpos: drop special handling of tab
Date: Mon, 22 Jan 2018 09:08:45 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801220904060.4623@hadrien>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Align column number with those reported by gcc.  Thus, do not make a tab
count as 8 spaces.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
---

This replaces the patch about correcting column numbers.  That one should
be dropped.  This one, with the starting column as column 1 and no
expansion of tabs, follows the strategy of gcc.

julia

 srcpos.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 9d38459..cb6ed0e 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -209,8 +209,6 @@ struct srcpos srcpos_empty = {
 	.file = NULL,
 };

-#define TAB_SIZE      8
-
 void srcpos_update(struct srcpos *pos, const char *text, int len)
 {
 	int i;
@@ -224,9 +222,6 @@ void srcpos_update(struct srcpos *pos, const char *text, int len)
 		if (text[i] == '\n') {
 			current_srcfile->lineno++;
 			current_srcfile->colno = 1;
-		} else if (text[i] == '\t') {
-			current_srcfile->colno =
-				ALIGN(current_srcfile->colno, TAB_SIZE);
 		} else {
 			current_srcfile->colno++;
 		}
-- 
2.7.4
