From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 5/5] annotations: add --annotate-full option
Date: Mon,  8 Jan 2018 14:36:47 +0100
Message-ID: <1515418607-26764-6-git-send-email-Julia.Lawall@lip6.fr>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515418607-26764-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

With --annotate, one gets only short file names and line numbers.

With --annotate-full, one gets complete paths, starting and ending line
numbers and starting and ending columns.

--annotate-full indicates no-file and no-line for things that are not
connected to the source code (fixups, symbols, aliases, etc.).
--annotate simply has nothing in those cases.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
---
 dtc.c        | 13 +++++++++----
 dtc.h        |  1 +
 srcpos.c     | 27 +++++++++++++++++++--------
 srcpos.h     |  4 ++--
 treesource.c | 48 ++++++++++++++++++++++++++++--------------------
 5 files changed, 59 insertions(+), 34 deletions(-)

diff --git a/dtc.c b/dtc.c
index 371d04c..24b58eb 100644
--- a/dtc.c
+++ b/dtc.c
@@ -35,7 +35,8 @@ int phandle_format = PHANDLE_EPAPR;	/* Use linux,phandle or phandle properties *
 int generate_symbols;	/* enable symbols & fixup support */
 int generate_fixups;		/* suppress generation of fixups on symbol support */
 int auto_label_aliases;		/* auto generate labels -> aliases */
-bool annotate = false; /* annotate .dts with input source location */
+bool annotate = false;		/* annotate .dts with input source location */
+bool annotate_full = false; /* annotate .dts with full input source location */
 
 static int is_power_of_2(int x)
 {
@@ -61,7 +62,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 
 /* Usage related data. */
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@Ahv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@ATFhv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -82,9 +83,10 @@ static struct option const usage_long_opts[] = {
 	{"error",             a_argument, NULL, 'E'},
 	{"symbols",	     no_argument, NULL, '@'},
 	{"auto-alias",       no_argument, NULL, 'A'},
+	{"annotate",         no_argument, NULL, 'T'},
+	{"annotate-full",    no_argument, NULL, 'F'},
 	{"help",             no_argument, NULL, 'h'},
 	{"version",          no_argument, NULL, 'v'},
-	{"annotate",         no_argument, NULL, 'T'},
 	{NULL,               no_argument, NULL, 0x0},
 };
 static const char * const usage_opts_help[] = {
@@ -119,6 +121,7 @@ static const char * const usage_opts_help[] = {
 	"\n\tPrint this help and exit",
 	"\n\tPrint version and exit",
 	"\n\tAnnotate output .dts with input source file and line",
+	"\n\tAnnotate output .dts with input source file (full path) line and column",
 	NULL,
 };
 
@@ -188,6 +191,8 @@ int main(int argc, char *argv[])
 
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
+		case 'F':
+			annotate_full = true;
 		case 'T':
 			annotate = true;
 			break;
@@ -305,7 +310,7 @@ int main(int argc, char *argv[])
 	}
 
 	if (annotate && (!streq(inform, "dts") || !streq(outform, "dts")))
-		die("--annotate requires -I dts -O dts\n");
+		die("--annotate and --annotate-full require -I dts -O dts\n");
 
 	if (streq(inform, "dts"))
 		dti = dt_from_source(arg);
diff --git a/dtc.h b/dtc.h
index e7121ef..769f6a3 100644
--- a/dtc.h
+++ b/dtc.h
@@ -59,6 +59,7 @@ extern int generate_symbols;	/* generate symbols for nodes with labels */
 extern int generate_fixups;	/* generate fixups */
 extern int auto_label_aliases;	/* auto generate labels -> aliases */
 extern bool annotate;		/* annotate .dts with input source location */
+extern bool annotate_full;/* annotate .dts with detailed input source location */
 
 #define PHANDLE_LEGACY	0x1
 #define PHANDLE_EPAPR	0x2
diff --git a/srcpos.c b/srcpos.c
index fe756a7..8cf0c3d 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -363,19 +363,30 @@ out:
 }
 
 static char *
-srcpos_string_short(struct srcpos *pos, bool first_line)
+srcpos_string_short(struct srcpos *pos, bool first_line, bool full)
 {
 	const char *fname = "<no-file>";
 	char *pos_str;
 	int rc;
 
 	if (pos) {
-		fname = shorten_to_initial_path(pos->file->name);
-		rc = asprintf(&pos_str, "%s:%d", fname,
+		if (full) {
+			rc = asprintf(&pos_str, "%s:%d:%d-%d:%d",
+				      pos->file->name,
+				      pos->first_line, pos->first_column,
+				      pos->last_line, pos->last_column);
+		}
+		else {
+			fname = shorten_to_initial_path(pos->file->name);
+			rc = asprintf(&pos_str, "%s:%d", fname,
 			      (first_line) ? pos->first_line: pos->last_line);
+		}
 	}
 	else {
-		rc = asprintf(&pos_str, "%s:<no-line>", fname);
+		if (full)
+			rc = asprintf(&pos_str, "%s:<no-line>", fname);
+		else
+			return NULL;
 	}
 
 	if (rc == -1)
@@ -385,15 +396,15 @@ srcpos_string_short(struct srcpos *pos, bool first_line)
 }
 
 char *
-srcpos_string_first(struct srcpos *pos)
+srcpos_string_first(struct srcpos *pos, bool full)
 {
-	return srcpos_string_short(pos, true);
+	return srcpos_string_short(pos, true, full);
 }
 
 char *
-srcpos_string_last(struct srcpos *pos)
+srcpos_string_last(struct srcpos *pos, bool full)
 {
-	return srcpos_string_short(pos, false);
+	return srcpos_string_short(pos, false, full);
 }
 
 void srcpos_verror(struct srcpos *pos, const char *prefix,
diff --git a/srcpos.h b/srcpos.h
index 9281cba..0f1dde4 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -109,8 +109,8 @@ extern struct srcpos *srcpos_copy_all(struct srcpos *pos);
 extern struct srcpos *srcpos_combine(struct srcpos *left_srcpos,
 	 struct srcpos *right_srcpos);
 extern char *srcpos_string(struct srcpos *pos);
-extern char *srcpos_string_first(struct srcpos *pos);
-extern char *srcpos_string_last(struct srcpos *pos);
+extern char *srcpos_string_first(struct srcpos *pos, bool full);
+extern char *srcpos_string_last(struct srcpos *pos, bool full);
 
 extern void PRINTF(3, 0) srcpos_verror(struct srcpos *pos, const char *prefix,
 					const char *fmt, va_list va);
diff --git a/treesource.c b/treesource.c
index 9a22b5e..e6af67e 100644
--- a/treesource.c
+++ b/treesource.c
@@ -203,13 +203,16 @@ static void write_propval(FILE *f, struct property *prop)
 	char *srcstr;
 
 	if (len == 0) {
+		fprintf(f, ";");
 		if (annotate) {
-			srcstr = srcpos_string_first(prop->srcpos);
-			fprintf(f, "; /* %s */\n", srcstr);
-			free(srcstr);
-		} else {
-			fprintf(f, ";\n");
+			srcstr = srcpos_string_first(prop->srcpos,
+						     annotate_full);
+			if (srcstr) {
+				fprintf(f, " /* %s */", srcstr);
+				free(srcstr);
+			}
 		}
+		fprintf(f, "\n");
 		return;
 	}
 
@@ -237,13 +240,15 @@ static void write_propval(FILE *f, struct property *prop)
 		write_propval_bytes(f, prop->val);
 	}
 
+	fprintf(f, ";");
 	if (annotate) {
-		srcstr = srcpos_string_first(prop->srcpos);
-		fprintf(f, "; /* %s */\n", srcstr);
-		free(srcstr);
-	} else {
-		fprintf(f, ";\n");
+		srcstr = srcpos_string_first(prop->srcpos, annotate_full);
+		if (srcstr) {
+			fprintf(f, " /* %s */", srcstr);
+			free(srcstr);
+		}
 	}
+	fprintf(f, "\n");
 }
 
 static void write_tree_source_node(FILE *f, struct node *tree, int level)
@@ -262,12 +267,13 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 		fprintf(f, "/ {");
 
 	if (annotate) {
-		srcstr = srcpos_string_first(tree->srcpos);
-		fprintf(f, " /* %s */\n", srcstr);
-		free(srcstr);
-	} else {
-		fprintf(f, "\n");
+		srcstr = srcpos_string_first(tree->srcpos, annotate_full);
+		if (srcstr) {
+			fprintf(f, " /* %s */", srcstr);
+			free(srcstr);
+		}
 	}
+	fprintf(f, "\n");
 
 	for_each_property(tree, prop) {
 		write_prefix(f, level+1);
@@ -281,13 +287,15 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 		write_tree_source_node(f, child, level+1);
 	}
 	write_prefix(f, level);
+	fprintf(f, "};");
 	if (annotate) {
-		srcstr = srcpos_string_last(tree->srcpos);
-		fprintf(f, "}; /* %s */\n", srcstr);
-		free(srcstr);
-	} else {
-		fprintf(f, "};\n");
+		srcstr = srcpos_string_last(tree->srcpos, annotate_full);
+		if (srcstr) {
+			fprintf(f, " /* %s */", srcstr);
+			free(srcstr);
+		}
 	}
+	fprintf(f, "\n");
 }
 
 
-- 
2.7.4
