From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 1/3 v4] annotations: check for NULL position
Date: Fri,  2 Feb 2018 21:41:48 +0100
Message-ID: <1517604110-790-2-git-send-email-Julia.Lawall@lip6.fr>
References: <1517604110-790-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517604110-790-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Check for NULL position and NULL filename.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
v4: no change

 srcpos.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index cb6ed0e..9dd3297 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -244,12 +244,20 @@ srcpos_copy(struct srcpos *pos)
 char *
 srcpos_string(struct srcpos *pos)
 {
-	const char *fname = "<no-file>";
+	const char *fname;
 	char *pos_str;
 
-	if (pos->file && pos->file->name)
-		fname = pos->file->name;
+	if (!pos) {
+		xasprintf(&pos_str, "<no-file>:<no-line>");
+		return pos_str;
+	}
 
+	if (!pos->file)
+		fname = "<no-file>";
+	else if (!pos->file->name)
+		fname = "<no-filename>";
+	else
+		fname = pos->file->name;
 
 	if (pos->first_line != pos->last_line)
 		xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
-- 
2.7.4
