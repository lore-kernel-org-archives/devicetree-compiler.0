From: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 1/2] guess input file format based on file content or file name
Date: Wed,  1 Jul 2015 00:31:27 +0100
Message-ID: <1435707088-12800-2-git-send-email-osp@andrep.de>
References: <1435707088-12800-1-git-send-email-osp@andrep.de>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435707088-12800-1-git-send-email-osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Always needing to specify the input file format can be quite
annoying, especially since a dtb is easily detected by its magic.
Looking at the file name extension sounds useful as a hint, too.

Add heuristic file type guessing of the input file format in case
none has been specified on the command line.
The heuristics are as follows (in that order):
- Any issues with opening the file drop back to the current default
behaviour.
- A directory will be treated as the /proc/device-tree type.
- If the first 4 bytes are the DTB magic, assume "dtb".
- If no other test succeeded so far, use a file name based
guessing method: if the filename ends with .dts or .DTS, device tree
source text is assumed, .dtb or .DTB hint at a device tree blob.

For the majority of practical use cases this gets rid of the tedious
-I specification on the command line and simplifies actual typing of
dtc command lines.
Any explicit specification of the input type by using -I still avoids
any guessing, which resembles the current behaviour.

Signed-off-by: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
---
 dtc.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/dtc.c b/dtc.c
index 8c4add6..53793bf 100644
--- a/dtc.c
+++ b/dtc.c
@@ -18,6 +18,8 @@
  *                                                                   USA
  */
 
+#include <sys/stat.h>
+
 #include "dtc.h"
 #include "srcpos.h"
 
@@ -104,10 +106,55 @@ static const char * const usage_opts_help[] = {
 	NULL,
 };
 
+static const char *guess_type_by_name(const char *fname, const char *fallback)
+{
+	const char *s;
+
+	s = strrchr(fname, '.');
+	if (s == NULL)
+		return fallback;
+	if (!strcasecmp(s, ".dts"))
+		return "dts";
+	if (!strcasecmp(s, ".dtb"))
+		return "dtb";
+	return fallback;
+}
+
+static const char *guess_input_format(const char *fname, const char *fallback)
+{
+	struct stat statbuf;
+	uint32_t magic;
+	FILE *f;
+
+	if (stat(fname, &statbuf) != 0)
+		return fallback;
+
+	if (S_ISDIR(statbuf.st_mode))
+		return "fs";
+
+	if (!S_ISREG(statbuf.st_mode))
+		return fallback;
+
+	f = fopen(fname, "r");
+	if (f == NULL)
+		return fallback;
+	if (fread(&magic, 4, 1, f) != 1) {
+		fclose(f);
+		return fallback;
+	}
+	fclose(f);
+
+	magic = fdt32_to_cpu(magic);
+	if (magic == FDT_MAGIC)
+		return "dtb";
+
+	return guess_type_by_name(fname, fallback);
+}
+
 int main(int argc, char *argv[])
 {
 	struct boot_info *bi;
-	const char *inform = "dts";
+	const char *inform = NULL;
 	const char *outform = "dts";
 	const char *outname = "-";
 	const char *depname = NULL;
@@ -213,6 +260,8 @@ int main(int argc, char *argv[])
 		fprintf(depfile, "%s:", outname);
 	}
 
+	if (inform == NULL)
+		inform = guess_input_format(arg, "dts");
 	if (streq(inform, "dts"))
 		bi = dt_from_source(arg);
 	else if (streq(inform, "fs"))
-- 
1.8.4
