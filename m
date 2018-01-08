From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 3/5] annotations: short annotations
Date: Mon,  8 Jan 2018 14:36:45 +0100
Message-ID: <1515418607-26764-4-git-send-email-Julia.Lawall@lip6.fr>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515418607-26764-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Based on the following patch by Frank Rowand (no changes):

https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00378.html

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
---
 srcpos.c     | 34 ++++++++++++++++++++++++++++++++++
 srcpos.h     |  2 ++
 treesource.c |  8 ++++----
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 1a4db9c..85657c6 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -317,6 +317,40 @@ out:
 	return pos_str;
 }
 
+static char *
+srcpos_string_short(struct srcpos *pos, bool first_line)
+{
+	const char *fname = "<no-file>";
+	char *pos_str;
+	int rc;
+
+	if (pos) {
+		fname = pos->file->name;
+		rc = asprintf(&pos_str, "%s:%d", fname,
+			      (first_line) ? pos->first_line: pos->last_line);
+	}
+	else {
+		rc = asprintf(&pos_str, "%s:<no-line>", fname);
+	}
+
+	if (rc == -1)
+		die("Couldn't allocate in srcpos_string_short");
+
+	return pos_str;
+}
+
+char *
+srcpos_string_first(struct srcpos *pos)
+{
+	return srcpos_string_short(pos, true);
+}
+
+char *
+srcpos_string_last(struct srcpos *pos)
+{
+	return srcpos_string_short(pos, false);
+}
+
 void srcpos_verror(struct srcpos *pos, const char *prefix,
 		   const char *fmt, va_list va)
 {
diff --git a/srcpos.h b/srcpos.h
index ec69d89..9281cba 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -109,6 +109,8 @@ extern struct srcpos *srcpos_copy_all(struct srcpos *pos);
 extern struct srcpos *srcpos_combine(struct srcpos *left_srcpos,
 	 struct srcpos *right_srcpos);
 extern char *srcpos_string(struct srcpos *pos);
+extern char *srcpos_string_first(struct srcpos *pos);
+extern char *srcpos_string_last(struct srcpos *pos);
 
 extern void PRINTF(3, 0) srcpos_verror(struct srcpos *pos, const char *prefix,
 					const char *fmt, va_list va);
diff --git a/treesource.c b/treesource.c
index a99eca4..9a22b5e 100644
--- a/treesource.c
+++ b/treesource.c
@@ -204,7 +204,7 @@ static void write_propval(FILE *f, struct property *prop)
 
 	if (len == 0) {
 		if (annotate) {
-			srcstr = srcpos_string(prop->srcpos);
+			srcstr = srcpos_string_first(prop->srcpos);
 			fprintf(f, "; /* %s */\n", srcstr);
 			free(srcstr);
 		} else {
@@ -238,7 +238,7 @@ static void write_propval(FILE *f, struct property *prop)
 	}
 
 	if (annotate) {
-		srcstr = srcpos_string(prop->srcpos);
+		srcstr = srcpos_string_first(prop->srcpos);
 		fprintf(f, "; /* %s */\n", srcstr);
 		free(srcstr);
 	} else {
@@ -262,7 +262,7 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 		fprintf(f, "/ {");
 
 	if (annotate) {
-		srcstr = srcpos_string(tree->srcpos);
+		srcstr = srcpos_string_first(tree->srcpos);
 		fprintf(f, " /* %s */\n", srcstr);
 		free(srcstr);
 	} else {
@@ -282,7 +282,7 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 	}
 	write_prefix(f, level);
 	if (annotate) {
-		srcstr = srcpos_string(tree->srcpos);
+		srcstr = srcpos_string_last(tree->srcpos);
 		fprintf(f, "}; /* %s */\n", srcstr);
 		free(srcstr);
 	} else {
-- 
2.7.4
