From: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/3] guess output file format
Date: Tue, 26 May 2015 00:11:22 +0100
Message-ID: <1432595483-26153-3-git-send-email-osp@andrep.de>
References: <1432595483-26153-1-git-send-email-osp@andrep.de>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432595483-26153-1-git-send-email-osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If no output file type is specified via the -O parameter, guess the
desired file type by looking at the file name extension.
If that provides no useful hints, assume "dtb" as long as the input
type is "dts". Any other input type will lead to "dts" being used as
the guessed output type.
Any explicit specification of the output type will skip this guessing.

Signed-off-by: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
---
 dtc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/dtc.c b/dtc.c
index cda563d..ba34a06 100644
--- a/dtc.c
+++ b/dtc.c
@@ -158,7 +158,7 @@ int main(int argc, char *argv[])
 {
 	struct boot_info *bi;
 	const char *inform = NULL;
-	const char *outform = "dts";
+	const char *outform = NULL;
 	const char *outname = "-";
 	const char *depname = NULL;
 	bool force = false, sort = false;
@@ -265,6 +265,15 @@ int main(int argc, char *argv[])
 
 	if (inform == NULL)
 		inform = guess_input_format(arg, "dts");
+	if (outform == NULL) {
+		outform = guess_type_by_name(outname, NULL);
+		if (outform == NULL) {
+			if (streq(inform, "dts"))
+				outform = "dtb";
+			else
+				outform = "dts";
+		}
+	}
 	if (streq(inform, "dts"))
 		bi = dt_from_source(arg);
 	else if (streq(inform, "fs"))
-- 
1.8.4
