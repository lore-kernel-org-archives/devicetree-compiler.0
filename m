From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 4/5] annotations: shorten file names
Date: Mon,  8 Jan 2018 14:36:46 +0100
Message-ID: <1515418607-26764-5-git-send-email-Julia.Lawall@lip6.fr>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515418607-26764-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The file name provided on the command line is represented by its
basename only.  Other names are represented as relative offsets from the
directory of the starting one.

This has to be adapted in the case of files on which cpp has been run
first.  In that case, at least when using scripts/dtc/dtx_diff from the
Linux kernel, the command line file name is -, representing standard
input.  The starting file name is then taken from the first line
beginning with #, as detected by a call to srcpos_set_line.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
---
 srcpos.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 85657c6..fe756a7 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -33,6 +33,9 @@ struct search_path {
 /* This is the list of directories that we search for source files */
 static struct search_path *search_path_head, **search_path_tail;
 
+/* Detect infinite include recursion. */
+#define MAX_SRCFILE_DEPTH     (100)
+static int srcfile_depth; /* = 0 */
 
 static char *get_dirname(const char *path)
 {
@@ -51,11 +54,50 @@ static char *get_dirname(const char *path)
 
 FILE *depfile; /* = NULL */
 struct srcfile_state *current_srcfile; /* = NULL */
+static char *initial_path; /* = NULL */
+static int initial_pathlen; /* = NULL */
+static bool initial_cpp = true;
+
+static void set_initial_path(char *fname) {
+	int i, len = strlen(fname);
+
+	initial_path = fname;
+	initial_pathlen = 0;
+	for (i = 0; i != len; i++)
+		if (initial_path[i] == '/')
+			initial_pathlen++;
+}
 
-/* Detect infinite include recursion. */
-#define MAX_SRCFILE_DEPTH     (100)
-static int srcfile_depth; /* = 0 */
-
+static char *
+shorten_to_initial_path(char *fname) {
+	char *p1, *p2, *prevslash1 = NULL;
+	int slashes = 0;
+
+	for (p1 = fname, p2 = initial_path; *p1 && *p2; p1++, p2++) {
+		if (*p1 != *p2)
+			break;
+		if (*p1 == '/') {
+			prevslash1 = p1;
+			slashes++;
+		}
+	}
+	p1 = prevslash1 + 1;
+	if (prevslash1) {
+		int diff = initial_pathlen - slashes, i, j;
+		int restlen = strlen(fname) - (p1 - fname);
+		char *res;
+
+		res = xmalloc((3 * diff) + restlen + 1);
+		for (i = 0, j = 0; i != diff; i++) {
+			res[j++] = '.';
+			res[j++] = '.';
+			res[j++] = '/';
+		}
+		strcpy(res + j, p1);
+		return res;
+	}
+	return fname;
+}
 
 /**
  * Try to open a file in a given directory.
@@ -157,6 +199,9 @@ void srcfile_push(const char *fname)
 	srcfile->colno = 1;
 
 	current_srcfile = srcfile;
+
+	if (srcfile_depth == 1)
+		set_initial_path(srcfile->name);
 }
 
 bool srcfile_pop(void)
@@ -325,7 +370,7 @@ srcpos_string_short(struct srcpos *pos, bool first_line)
 	int rc;
 
 	if (pos) {
-		fname = pos->file->name;
+		fname = shorten_to_initial_path(pos->file->name);
 		rc = asprintf(&pos_str, "%s:%d", fname,
 			      (first_line) ? pos->first_line: pos->last_line);
 	}
@@ -379,4 +424,9 @@ void srcpos_set_line(char *f, int l)
 {
 	current_srcfile->name = f;
 	current_srcfile->lineno = l;
+
+	if (initial_cpp) {
+		initial_cpp = false;
+		set_initial_path(f);
+	}
 }
-- 
2.7.4
