From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 1/5] annotations: Check for NULL pos
Date: Mon,  8 Jan 2018 14:36:43 +0100
Message-ID: <1515418607-26764-2-git-send-email-Julia.Lawall@lip6.fr>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515418607-26764-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Check for NULL position and file name.  Check for xasprintf failure.
Builds on a patch proposed by Frank Rowand:

https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00377.html

Annotation extension will introduce the possibility of the position
being NULL.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
---
 srcpos.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 9d38459..7f2626c 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -249,24 +249,35 @@ srcpos_copy(struct srcpos *pos)
 char *
 srcpos_string(struct srcpos *pos)
 {
-	const char *fname = "<no-file>";
+	const char *fname;
 	char *pos_str;
-
-	if (pos->file && pos->file->name)
+	int rc;
+
+	if (!pos) {
+		rc = asprintf(&pos_str, "%s:<no-line>", fname);
+		goto out;
+        } else if (!pos->file)
+		fname = "<no-file>";
+	else if (!pos->file->name)
+		fname = "<no-filename>";
+	else
 		fname = pos->file->name;
 
-
 	if (pos->first_line != pos->last_line)
-		xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
-			  pos->first_line, pos->first_column,
-			  pos->last_line, pos->last_column);
+		rc = xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
+			       pos->first_line, pos->first_column,
+			       pos->last_line, pos->last_column);
 	else if (pos->first_column != pos->last_column)
-		xasprintf(&pos_str, "%s:%d.%d-%d", fname,
-			  pos->first_line, pos->first_column,
-			  pos->last_column);
+		rc = xasprintf(&pos_str, "%s:%d.%d-%d", fname,
+			       pos->first_line, pos->first_column,
+			       pos->last_column);
 	else
-		xasprintf(&pos_str, "%s:%d.%d", fname,
-			  pos->first_line, pos->first_column);
+		rc = xasprintf(&pos_str, "%s:%d.%d", fname,
+			       pos->first_line, pos->first_column);
+
+out:
+	if (rc == -1)
+		die("Couldn't allocate in srcpos string");
 
 	return pos_str;
 }
-- 
2.7.4
