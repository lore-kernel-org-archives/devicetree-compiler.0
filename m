From: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3] Implement the -a option to pad dtb aligned
Date: Fri,  1 Jul 2016 10:29:33 +0800
Message-ID: <1467340173-25153-1-git-send-email-timwang@asrmicro.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=XMZmypzs269RAhuvha
	bfdR+uJywcWd2gMnjw1R8/eQU=; b=LlxsTmnseHUMsQ+i6S1Ky7mRwk2/8X0LDA
	pacoqDKoBb9M0KARssLjmqfdlVEAjBHNFzy4ZgHF9nSZETmb0h3xh4fG7VEhzZ0n
	xLpRFocIVDmbETFFh1GdwXQz9KfsStHpMDbX2pOAyw8+XUt+Ei2kTBEM9TCeghiN
	gZIScln4Y=
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
 dtc.c      |  9 ++++++++-
 dtc.h      |  1 +
 flattree.c | 19 ++++++++++++++++++-
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/dtc.c b/dtc.c
index 5fa23c4..1749d26 100644
--- a/dtc.c
+++ b/dtc.c
@@ -30,6 +30,7 @@ int quiet;		/* Level of quietness */
 int reservenum;		/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
+int align_size;		/* Additional padding to blob accroding to the align size */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
 
 static void fill_fullpaths(struct node *tree, const char *prefix)
@@ -53,7 +54,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 #define FDT_VERSION(version)	_FDT_VERSION(version)
 #define _FDT_VERSION(version)	#version
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:hv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -64,6 +65,7 @@ static struct option const usage_long_opts[] = {
 	{"reserve",           a_argument, NULL, 'R'},
 	{"space",             a_argument, NULL, 'S'},
 	{"pad",               a_argument, NULL, 'p'},
+	{"align",             a_argument, NULL, 'a'},
 	{"boot-cpu",          a_argument, NULL, 'b'},
 	{"force",            no_argument, NULL, 'f'},
 	{"include",           a_argument, NULL, 'i'},
@@ -91,6 +93,7 @@ static const char * const usage_opts_help[] = {
 	"\n\tMake space for <number> reserve map entries (for dtb and asm output)",
 	"\n\tMake the blob at least <bytes> long (extra space)",
 	"\n\tAdd padding to the blob of <bytes> long (extra space)",
+	"\n\tMake the blob align to the <bytes> (extra space)",
 	"\n\tSet the physical boot cpu",
 	"\n\tTry to produce output even if the input tree has errors",
 	"\n\tAdd a path to search for include files",
@@ -169,6 +172,7 @@ int main(int argc, char *argv[])
 	reservenum = 0;
 	minsize    = 0;
 	padsize    = 0;
+	align_size = 0;
 
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
@@ -196,6 +200,9 @@ int main(int argc, char *argv[])
 		case 'p':
 			padsize = strtol(optarg, NULL, 0);
 			break;
+		case 'a':
+			align_size = strtol(optarg, NULL, 0);
+			break;
 		case 'f':
 			force = true;
 			break;
diff --git a/dtc.h b/dtc.h
index 56212c8..b406d21 100644
--- a/dtc.h
+++ b/dtc.h
@@ -53,6 +53,7 @@ extern int quiet;		/* Level of quietness */
 extern int reservenum;		/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
+extern int align_size;		/* Additional padding to blob accroding to the align size */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
 
 #define PHANDLE_LEGACY	0x1
diff --git a/flattree.c b/flattree.c
index ec14954..e964d2c 100644
--- a/flattree.c
+++ b/flattree.c
@@ -398,10 +398,12 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	 */
 	if (minsize > 0) {
 		padlen = minsize - fdt32_to_cpu(fdt.totalsize);
-		if ((padlen < 0) && (quiet < 1))
+		if ((padlen < 0) && (quiet < 1)) {
 			fprintf(stderr,
 				"Warning: blob size %d >= minimum size %d\n",
 				fdt32_to_cpu(fdt.totalsize), minsize);
+			padlen = 0;
+		}
 	}
 
 	if (padsize > 0)
@@ -413,6 +415,13 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 		fdt.totalsize = cpu_to_fdt32(tsize);
 	}
 
+	if (align_size > 0) {
+		int tsize = fdt32_to_cpu(fdt.totalsize);
+		padlen += ALIGN(tsize, align_size) - tsize;
+		tsize = ALIGN(tsize, align_size);
+		fdt.totalsize = cpu_to_fdt32(tsize);
+	}
+
 	/*
 	 * Assemble the blob: start with the header, add with alignment
 	 * the reserve buffer, add the reserve map terminating zeroes,
@@ -478,6 +487,14 @@ void dt_to_asm(FILE *f, struct boot_info *bi, int version)
 	fprintf(f, "/* autogenerated by dtc, do not edit */\n\n");
 
 	emit_label(f, symprefix, "blob_start");
+	if (align_size > 0) {
+		i = 1;
+		while(align_size > 2) {
+			align_size /= 2;
+			i++;
+		};
+		asm_emit_align(f, i);
+	}
 	emit_label(f, symprefix, "header");
 	fprintf(f, "\t/* magic */\n");
 	asm_emit_cell(f, FDT_MAGIC);
-- 
1.9.1

