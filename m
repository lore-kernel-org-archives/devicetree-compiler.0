From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dtc: test: make the test output more friendly
Date: Fri, 24 Oct 2014 03:19:17 +0000
Message-ID: <1414120757-17288-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

when run the command 'make check', the format of the output as the follow:

../fdtput label01.dts.fdtput.test.dtb -p /you/are/drunk/sir/winston slurp -ts twice:	PASS
../fdtput label01.dts.fdtput.test.dtb -cp "Lorem ipsum dolor sit amet, cons"...<4119 bytes>PASS
../fdtput label01.dts.fdtput.test.dtb -cp /chosen:	PASS
../fdtput label01.dts.fdtput.test.dtb -cp /chosen/son:	PASS

this patch make the format of the output more firendly to developer, as the follow:

../fdtput label01.dts.fdtput.test.dtb -p /you/are/drunk/sir/winston slurp -ts twice:           [ PASS ]
../fdtput label01.dts.fdtput.test.dtb -cp "Lorem ipsum dolor sit amet, cons"...<4119 bytes>    [ PASS ]
../fdtput label01.dts.fdtput.test.dtb -cp /chosen:                                             [ PASS ]
../fdtput label01.dts.fdtput.test.dtb -cp /chosen/son:                                         [ PASS ]

The test result print ooutput at the right side of the terminal.
The "PASS" word  printed in green color and the "FAILED" word
printed in red color, which are more friendly to
developer.

Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 tests/tests.h     | 27 +++++++++++++++++----------
 tests/tests.sh    | 13 +++++++++++--
 tests/testutils.c | 29 ++++++++++++++++++++++++++++-
 3 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/tests/tests.h b/tests/tests.h
index 56a843c..76954ac 100644
--- a/tests/tests.h
+++ b/tests/tests.h
@@ -40,6 +40,7 @@ void test_init(int argc, char *argv[]);
 
 /* Each test case must define this function */
 void cleanup(void);
+int get_terminal_width_height(const int fd, int *width, int *height);
 
 #define verbose_printf(...) \
 	if (verbose_test) { \
@@ -50,11 +51,14 @@ void cleanup(void);
 #define ERROR(fmt, args...)	fprintf(stderr, ERR fmt, ## args)
 
 
-#define	PASS()						\
-	do {						\
-		cleanup();				\
-		printf("PASS\n");			\
-		exit(RC_PASS);				\
+#define	PASS()							\
+	do {							\
+		int width, height;				\
+		cleanup();					\
+		get_terminal_width_height(0, &width, &height);	\
+		printf("\033[%d;%dH", height, width - 9);	\
+		printf("[\033[0;32;1m PASS \033[0m]\n");	\
+		exit(RC_PASS);					\
 	} while (0)
 
 #define	PASS_INCONCLUSIVE()				\
@@ -72,11 +76,14 @@ void cleanup(void);
 	} while (0)
 
 /* Look out, gcc extension below... */
-#define FAIL(fmt, ...)					\
-	do {						\
-		cleanup();				\
-		printf("FAIL\t" fmt "\n", ##__VA_ARGS__);	\
-		exit(RC_FAIL);				\
+#define FAIL(fmt, ...)						\
+	do {							\
+		int width, height;				\
+		cleanup();					\
+		get_terminal_width_height(0, &width, &height);	\
+		printf("\033[%d;%dH", height, width - 9);	\
+		printf("[\033[0;31;1m FAIL ]\n" fmt "\033[0m\n", ##__VA_ARGS__);	\
+		exit(RC_FAIL);					\
 	} while (0)
 
 #define CONFIG(fmt, ...)				\
diff --git a/tests/tests.sh b/tests/tests.sh
index 818fd09..10182bd 100644
--- a/tests/tests.sh
+++ b/tests/tests.sh
@@ -1,12 +1,21 @@
 # Common functions for shell testcases
 
 PASS () {
-    echo "PASS"
+    cols=`tput cols`
+    lines=`tput lines`
+    ((pos=$cols-10))
+    tput cup   $lines $pos
+    echo -e "[\033[0;32;1m PASS \033[0m]"
     exit 0
 }
 
 FAIL () {
-    echo "FAIL" "$@"
+    cols=`tput cols`
+    lines=`tput lines`
+    ((pos=$cols-10))
+    tput cup   $lines $pos
+    echo -e "[\033[0;31;1m FAIL \033[0m]"
+    echo -e "\033[0;31;1m$@\033[0m"
     exit 2
 }
 
diff --git a/tests/testutils.c b/tests/testutils.c
index 521f4f1..b6de04d 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -29,7 +29,7 @@
 #include <signal.h>
 #include <unistd.h>
 #include <fcntl.h>
-
+#include <sys/ioctl.h>
 #include <libfdt.h>
 
 #include "tests.h"
@@ -41,6 +41,33 @@ void  __attribute__((weak)) cleanup(void)
 {
 }
 
+int get_terminal_width_height(const int fd, int *width, int *height)
+{
+    struct winsize win = { 0, 0, 0, 0 };
+    int ret = ioctl(fd, TIOCGWINSZ, &win);
+
+    if (height) {
+        if (!win.ws_row) {
+            char *s = getenv("LINES");
+            if (s) win.ws_row = atoi(s);
+        }
+        if (win.ws_row <= 1 || win.ws_row >= 30000)
+            win.ws_row = 24;
+        *height = (int) win.ws_row;
+    }
+
+    if (width) {
+        if (!win.ws_col) {
+            char *s = getenv("COLUMNS");
+            if (s) win.ws_col = atoi(s);
+        }
+        if (win.ws_col <= 1 || win.ws_col >= 30000)
+            win.ws_col = 80;
+        *width = (int) win.ws_col;
+    }
+
+    return ret;
+}
 static void sigint_handler(int signum, siginfo_t *si, void *uc)
 {
 	cleanup();
-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
