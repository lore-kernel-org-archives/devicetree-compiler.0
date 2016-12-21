From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fdtdump.c: provide colored output
Date: Wed, 21 Dec 2016 22:54:31 +0100
Message-ID: <20161221215431.16862-1-xypron.glpk@gmx.de>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

A new command line option is added
  -c, --color <arg> Colorize, argument can be auto, never or always
which defaults to auto.

For colored output in pipes use 'always', e.g.
  fdtdump -c always file.dtb | less -R

If you don't like colors use
alias fdtdump="fdtdump -c none"

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 Makefile  |  2 +-
 fdtdump.c | 37 +++++++++++++++++++++++++++++++++----
 util.c    | 12 +++++++-----
 util.h    |  8 ++++++++
 4 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 32dcfcf..ee543b9 100644
--- a/Makefile
+++ b/Makefile
@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
 CPPFLAGS = -I libfdt -I .
 WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
+CFLAGS = -g -Os -fPIC -Werror $(WARNINGS) -lncurses
 
 BISON = bison
 LEX = flex
diff --git a/fdtdump.c b/fdtdump.c
index 717fef5..59194cd 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -2,6 +2,9 @@
  * fdtdump.c - Contributed by Pantelis Antoniou <pantelis.antoniou AT gmail.com>
  */
 
+#include <unistd.h>
+#include <curses.h>
+#include <term.h>
 #include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
@@ -63,7 +66,7 @@ static void dump_blob(void *blob, bool debug)
 	depth = 0;
 	shift = 4;
 
-	printf("/dts-v1/;\n");
+	printf("%s/dts-v1/;\n", COLNONE);
 	printf("// magic:\t\t0x%x\n", fdt32_to_cpu(bph->magic));
 	printf("// totalsize:\t\t0x%x (%d)\n", totalsize, totalsize);
 	printf("// off_dt_struct:\t0x%x\n", off_dt);
@@ -104,10 +107,11 @@ static void dump_blob(void *blob, bool debug)
 			s = p;
 			p = PALIGN(p + strlen(s) + 1, 4);
 
+			printf("%s", COLNODE);
 			if (*s == '\0')
 				s = "/";
 
-			printf("%*s%s {\n", depth * shift, "", s);
+			printf("%*s%s%s {\n", depth * shift, "", s, COLNONE);
 
 			depth++;
 			continue;
@@ -139,7 +143,7 @@ static void dump_blob(void *blob, bool debug)
 
 		dumpf("%04zx: string: %s\n", (uintptr_t)s - blob_off, s);
 		dumpf("%04zx: value\n", (uintptr_t)t - blob_off);
-		printf("%*s%s", depth * shift, "", s);
+		printf("%*s%s%s%s", depth * shift, "", COLPROP, s, COLNONE);
 		utilfdt_print_data(t, sz);
 		printf(";\n");
 	}
@@ -147,18 +151,33 @@ static void dump_blob(void *blob, bool debug)
 
 /* Usage related data. */
 static const char usage_synopsis[] = "fdtdump [options] <file>";
-static const char usage_short_opts[] = "ds" USAGE_COMMON_SHORT_OPTS;
+static const char usage_short_opts[] = "c:ds" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
+	{"color",            a_argument, NULL, 'c'},
 	{"debug",            no_argument, NULL, 'd'},
 	{"scan",             no_argument, NULL, 's'},
 	USAGE_COMMON_LONG_OPTS
 };
 static const char * const usage_opts_help[] = {
+	"Colorize, argument can be auto, never or always",
 	"Dump debug information while decoding the file",
 	"Scan for an embedded fdt in file",
 	USAGE_COMMON_OPTS_HELP
 };
 
+static void check_colored(void) {
+	int ret;
+
+	colored = 0;
+	if (isatty(STDOUT_FILENO) != 1)
+		return;
+	if (setupterm(NULL, STDOUT_FILENO, &ret) != OK || ret != 1)
+		return;
+	if (2 > tigetnum("colors"))
+		return;
+	colored = 1;
+}
+
 int main(int argc, char *argv[])
 {
 	int opt;
@@ -168,10 +187,20 @@ int main(int argc, char *argv[])
 	bool scan = false;
 	off_t len;
 
+	check_colored();
+
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
 		case_USAGE_COMMON_FLAGS
 
+		case 'c':
+			if (!strcmp("none", optarg))
+				colored = 0;
+			else if (!strcmp("always", optarg))
+				colored = 1;
+			else if (strcmp("auto", optarg))
+				usage("invalid argument for colored");
+			break;
 		case 'd':
 			debug = true;
 			break;
diff --git a/util.c b/util.c
index 3550f86..29fd6ad 100644
--- a/util.c
+++ b/util.c
@@ -36,6 +36,8 @@
 #include "util.h"
 #include "version_gen.h"
 
+int colored = 0;
+
 char *xstrdup(const char *s)
 {
 	int len = strlen(s) + 1;
@@ -389,7 +391,7 @@ void utilfdt_print_data(const char *data, int len)
 
 		s = data;
 		do {
-			printf("\"%s\"", s);
+			printf("\"%s%s%s\"", COLSTRG, s, COLNONE);
 			s += strlen(s) + 1;
 			if (s < data + len)
 				printf(", ");
@@ -398,17 +400,17 @@ void utilfdt_print_data(const char *data, int len)
 	} else if ((len % 4) == 0) {
 		const uint32_t *cell = (const uint32_t *)data;
 
-		printf(" = <");
+		printf(" = <%s", COLNUMB);
 		for (i = 0, len /= 4; i < len; i++)
 			printf("0x%08x%s", fdt32_to_cpu(cell[i]),
 			       i < (len - 1) ? " " : "");
-		printf(">");
+		printf("%s>", COLNONE);
 	} else {
 		const unsigned char *p = (const unsigned char *)data;
-		printf(" = [");
+		printf(" = [%s", COLBYTE);
 		for (i = 0; i < len; i++)
 			printf("%02x%s", *p++, i < len - 1 ? " " : "");
-		printf("]");
+		printf("%s]", COLNONE);
 	}
 }
 
diff --git a/util.h b/util.h
index f5c4f1b..b814872 100644
--- a/util.h
+++ b/util.h
@@ -25,6 +25,14 @@
  *                                                                   USA
  */
 
+extern int colored;
+#define COLNODE (colored ? "\x1b[35m" : "") /* magenta */
+#define COLPROP (colored ? "\x1b[32m" : "") /* green */
+#define COLSTRG (colored ? "\x1b[33m" : "") /* yellow */
+#define COLNUMB (colored ? "\x1b[34m" : "") /* blue */
+#define COLBYTE (colored ? "\x1b[36m" : "") /* cyan */
+#define COLNONE (colored ? "\x1b[0m" : "")  /* default */
+
 #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
 static inline void __attribute__((noreturn)) die(const char *str, ...)
-- 
2.11.0
