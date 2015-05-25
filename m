From: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 3/3] allow a second parameter to be the output file name
Date: Tue, 26 May 2015 00:11:23 +0100
Message-ID: <1432595483-26153-4-git-send-email-osp@andrep.de>
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

If there is more than one file name specified on the command line,
assume it is the output file name.
This allows to use a more intuitive cp-style command line syntax,
which (together with the input type guessing) allows something like:
$ dtc input.dts output.dtb
(or the other way round) to cover the most common usage scenarios.

Signed-off-by: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
---
 dtc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/dtc.c b/dtc.c
index ba34a06..714d39e 100644
--- a/dtc.c
+++ b/dtc.c
@@ -159,7 +159,7 @@ int main(int argc, char *argv[])
 	struct boot_info *bi;
 	const char *inform = NULL;
 	const char *outform = NULL;
-	const char *outname = "-";
+	const char *outname = NULL;
 	const char *depname = NULL;
 	bool force = false, sort = false;
 	const char *arg;
@@ -244,9 +244,15 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	if (argc > (optind+1))
+	if (argc > (optind + 2))
 		usage("missing files");
-	else if (argc < (optind+1))
+
+	if (argc > (optind + 1) && outname == NULL)
+		outname = argv[optind + 1];
+	if (outname == NULL)
+		outname = "-";
+
+	if (argc < (optind + 1))
 		arg = "-";
 	else
 		arg = argv[optind];
-- 
1.8.4
