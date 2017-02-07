From: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: [PATCH] srcpos.c: Fix dereference after null check
Date: Tue,  7 Feb 2017 18:08:14 +0100
Message-ID: <20170207170814.26168-1-jcd@tribudubois.net>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

When running coverity on dtc source code the following error is reported.

=========================================================================
250 srcpos_string(struct srcpos *pos)
251{
252        const char *fname = "<no-file>";
253        char *pos_str;
254
   1. Condition pos, taking false branch.
   2. var_compare_op: Comparing pos to null implies that pos might be null.
255        if (pos)
256                fname = pos->file->name;
257
258
   CID 1026108 (#1 of 1): Dereference after null check (FORWARD_NULL)3. var_deref_op: Dereferencing null pointer pos.
259        if (pos->first_line != pos->last_line)

=======================================================================

Fixed the srcpos_string() function assuming the pos argument could be NULL.

Fixed the fname assignement checking the name was indeed set in the
provided pos structure.

As srcpos_string() can now return NULL, fixed srcpos_verror() to handle this
situation.

Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
---
 srcpos.c | 44 ++++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index aa3aad0..cec790c 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -249,24 +249,28 @@ srcpos_copy(struct srcpos *pos)
 char *
 srcpos_string(struct srcpos *pos)
 {
-	const char *fname = "<no-file>";
-	char *pos_str;
+	char *pos_str = NULL;
 
-	if (pos)
-		fname = pos->file->name;
+	if (pos) {
+		const char *fname = "<no-file>";
 
+		if (pos->file && pos->file->name) {
+			fname = pos->file->name;
+		}
 
-	if (pos->first_line != pos->last_line)
-		xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
-			  pos->first_line, pos->first_column,
-			  pos->last_line, pos->last_column);
-	else if (pos->first_column != pos->last_column)
-		xasprintf(&pos_str, "%s:%d.%d-%d", fname,
-			  pos->first_line, pos->first_column,
-			  pos->last_column);
-	else
-		xasprintf(&pos_str, "%s:%d.%d", fname,
-			  pos->first_line, pos->first_column);
+		if (pos->first_line != pos->last_line) {
+			xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
+				  pos->first_line, pos->first_column,
+				  pos->last_line, pos->last_column);
+		} else if (pos->first_column != pos->last_column) {
+			xasprintf(&pos_str, "%s:%d.%d-%d", fname,
+				  pos->first_line, pos->first_column,
+				  pos->last_column);
+		} else {
+			xasprintf(&pos_str, "%s:%d.%d", fname,
+				  pos->first_line, pos->first_column);
+		}
+	}
 
 	return pos_str;
 }
@@ -278,11 +282,15 @@ void srcpos_verror(struct srcpos *pos, const char *prefix,
 
 	srcstr = srcpos_string(pos);
 
-	fprintf(stderr, "%s: %s ", prefix, srcstr);
+	if (srcstr) {
+		fprintf(stderr, "%s: %s ", prefix, srcstr);
+		free(srcstr);
+	} else {
+		fprintf(stderr, "%s: <unknown> ", prefix);
+	}
+
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");
-
-	free(srcstr);
 }
 
 void srcpos_error(struct srcpos *pos, const char *prefix,
-- 
2.9.3
