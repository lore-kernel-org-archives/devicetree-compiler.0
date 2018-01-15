From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH] srcpos: correct column numbers
Date: Mon, 15 Jan 2018 19:33:03 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801151932100.25462@hadrien>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The start of a line is column 0, at least according to emacs.

Every character counts, so need to increment by 1 before adjusting for tab.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
---
 srcpos.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 9d38459..e8fced9 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -154,7 +154,7 @@ void srcfile_push(const char *fname)
 	srcfile->prev = current_srcfile;

 	srcfile->lineno = 1;
-	srcfile->colno = 1;
+	srcfile->colno = 0;

 	current_srcfile = srcfile;
 }
@@ -223,8 +223,9 @@ void srcpos_update(struct srcpos *pos, const char *text, int len)
 	for (i = 0; i < len; i++)
 		if (text[i] == '\n') {
 			current_srcfile->lineno++;
-			current_srcfile->colno = 1;
+			current_srcfile->colno = 0;
 		} else if (text[i] == '\t') {
+			current_srcfile->colno++;
 			current_srcfile->colno =
 				ALIGN(current_srcfile->colno, TAB_SIZE);
 		} else {
-- 
2.7.4
