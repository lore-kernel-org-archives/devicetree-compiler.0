From: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6] Implement the -a option to pad dtb aligned
Date: Mon, 18 Jul 2016 15:56:53 +0800
Message-ID: <1468828613-14345-1-git-send-email-timwang@asrmicro.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=8ZWg34HP+KPkzUNBez
	vKv3g4Y+NYwGVcY2sKB2lQSG8=; b=TYTzA1vDi3NMMqz0iq5YXdEs+ghwSmDBnN
	36URZ7CxHUfO3N2TJjZ4ifwYWVuXKQik5DnU0mNICjYmwYt/cPIcQH7yA7Sc00aw
	gTPQDN2Wnj31YJFaSCeZBTmA2HhF3SSDEOkGY1lmHFbJlWWsljCQ7NK+7FeQPzwm
	txLgd016o=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: wtt_usst-9Onoh4P/yGk@public.gmane.org, timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org

There is one condition that need cat the dtb files
into one dtb.img which can support several boards
use same SoC platform.

And the original dtb file size is not aligned to any base.
This may cause "Synchronous Abort" when load from a unligned
address on some SoC machine, such as ARM.

So this patch implement the -a <aligned number> option to
pad zero at the end of dtb files and make the dtb size aligned
to <aligned number>.

Then, the aligned dtbs can cat together and load without "Synchronous
Abort".

Signed-off-by: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
---
 dtc.c              | 17 ++++++++++++++++-
 dtc.h              |  1 +
 flattree.c         | 17 +++++++++++++----
 tests/run_tests.sh | 28 ++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/dtc.c b/dtc.c
index 5fa23c4..9dcf640 100644
--- a/dtc.c
+++ b/dtc.c
@@ -30,8 +30,14 @@ int quiet;		/* Level of quietness */
 int reservenum;		/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
+int alignsize;		/* Additional padding to blob accroding to the alignsize */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
 
+static int is_power_of_2(int x)
+{
+	return (x > 0) && ((x & (x - 1)) == 0);
+}
+
 static void fill_fullpaths(struct node *tree, const char *prefix)
 {
 	struct node *child;
@@ -53,7 +59,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 #define FDT_VERSION(version)	_FDT_VERSION(version)
 #define _FDT_VERSION(version)	#version
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:hv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -64,6 +70,7 @@ static struct option const usage_long_opts[] = {
 	{"reserve",           a_argument, NULL, 'R'},
 	{"space",             a_argument, NULL, 'S'},
 	{"pad",               a_argument, NULL, 'p'},
+	{"align",             a_argument, NULL, 'a'},
 	{"boot-cpu",          a_argument, NULL, 'b'},
 	{"force",            no_argument, NULL, 'f'},
 	{"include",           a_argument, NULL, 'i'},
@@ -91,6 +98,7 @@ static const char * const usage_opts_help[] = {
 	"\n\tMake space for <number> reserve map entries (for dtb and asm output)",
 	"\n\tMake the blob at least <bytes> long (extra space)",
 	"\n\tAdd padding to the blob of <bytes> long (extra space)",
+	"\n\tMake the blob align to the <bytes> (extra space)",
 	"\n\tSet the physical boot cpu",
 	"\n\tTry to produce output even if the input tree has errors",
 	"\n\tAdd a path to search for include files",
@@ -169,6 +177,7 @@ int main(int argc, char *argv[])
 	reservenum = 0;
 	minsize    = 0;
 	padsize    = 0;
+	alignsize  = 0;
 
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
@@ -196,6 +205,12 @@ int main(int argc, char *argv[])
 		case 'p':
 			padsize = strtol(optarg, NULL, 0);
 			break;
+		case 'a':
+			alignsize = strtol(optarg, NULL, 0);
+			if (!is_power_of_2(alignsize))
+				die("Invalid argument \"%d\" to -a option\n",
+				    optarg);
+			break;
 		case 'f':
 			force = true;
 			break;
diff --git a/dtc.h b/dtc.h
index 56212c8..32009bc 100644
--- a/dtc.h
+++ b/dtc.h
@@ -53,6 +53,7 @@ extern int quiet;		/* Level of quietness */
 extern int reservenum;		/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
+extern int alignsize;		/* Additional padding to blob accroding to the alignsize */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
 
 #define PHANDLE_LEGACY	0x1
diff --git a/flattree.c b/flattree.c
index 089b976..a9d9520 100644
--- a/flattree.c
+++ b/flattree.c
@@ -398,15 +398,22 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	 */
 	if (minsize > 0) {
 		padlen = minsize - fdt32_to_cpu(fdt.totalsize);
-		if ((padlen < 0) && (quiet < 1))
-			fprintf(stderr,
-				"Warning: blob size %d >= minimum size %d\n",
-				fdt32_to_cpu(fdt.totalsize), minsize);
+		if (padlen < 0) {
+			padlen = 0;
+			if (quiet < 1)
+				fprintf(stderr,
+					"Warning: blob size %d >= minimum size %d\n",
+					fdt32_to_cpu(fdt.totalsize), minsize);
+		}
 	}
 
 	if (padsize > 0)
 		padlen = padsize;
 
+	if (alignsize > 0)
+		padlen = ALIGN(fdt32_to_cpu(fdt.totalsize) + padlen, alignsize)
+			- fdt32_to_cpu(fdt.totalsize);
+
 	if (padlen > 0) {
 		int tsize = fdt32_to_cpu(fdt.totalsize);
 		tsize += padlen;
@@ -572,6 +579,8 @@ void dt_to_asm(FILE *f, struct boot_info *bi, int version)
 	if (padsize > 0) {
 		fprintf(f, "\t.space\t%d, 0\n", padsize);
 	}
+	if (alignsize > 0)
+		asm_emit_align(f, alignsize);
 	emit_label(f, symprefix, "blob_abs_end");
 
 	data_free(strbuf);
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 7eb9b3d..cb1fdad 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -62,6 +62,11 @@ run_test () {
     base_run_test $VALGRIND $VGSUPP "./$@"
 }
 
+run_local_test () {
+    printf "$*:	"
+    base_run_test "$@"
+}
+
 run_sh_test () {
     printf "$*:	"
     base_run_test sh "$@"
@@ -110,6 +115,20 @@ run_wrap_error_test () {
     base_run_test wrap_error "$@"
 }
 
+# $1: dtb file
+# $2: align base
+align_test () {
+    local size=`stat -c %s $1`
+    local mod=$(($size%$2))
+    (
+	if [ $mod -eq 0 ] ;then
+	    PASS
+	else
+	    FAIL
+	fi
+    )
+}
+
 run_dtc_test () {
     printf "dtc $*:	"
     base_run_test wrap_test $VALGRIND $DTC "$@"
@@ -500,6 +519,15 @@ dtc_tests () {
 	-o search_paths_b.dtb search_paths_b.dts
     run_dtc_test -I dts -O dtb -o search_paths_subdir.dtb \
 	search_dir_b/search_paths_subdir.dts
+
+    # Check -a option
+    local alignbase=64
+    # -p -a
+    run_dtc_test -O dtb -p 1000 -a $alignbase -o align0.dtb subnode_iterate.dts
+    run_local_test align_test align0.dtb alignbase
+    # -S -a
+    run_dtc_test -O dtb -S 1999 -a $alignbase -o align1.dtb subnode_iterate.dts
+    run_local_test align_test align1.dtb alignbase
 }
 
 cmp_tests () {
-- 
1.9.1

