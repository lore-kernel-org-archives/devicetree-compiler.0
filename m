From: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: [PATCH] fdtget.c: Fix memory leak
Date: Wed, 13 Jul 2016 00:36:08 +0200
Message-ID: <1468362968-32090-1-git-send-email-jcd@tribudubois.net>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
Cc: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

CID 132823 (#1 of 1): Resource leak (RESOURCE_LEAK)
5. leaked_storage: Variable blob going out of scope leaks the storage it points to.

Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
---
 fdtget.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fdtget.c b/fdtget.c
index 4377419..fb9d0e1 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -266,14 +266,20 @@ static int do_fdtget(struct display_info *disp, const char *filename,
 				continue;
 			} else {
 				report_error(arg[i], node);
+				free(blob);
 				return -1;
 			}
 		}
 		prop = args_per_step == 1 ? NULL : arg[i + 1];
 
-		if (show_data_for_item(blob, disp, node, prop))
+		if (show_data_for_item(blob, disp, node, prop)) {
+			free(blob);
 			return -1;
+		}
 	}
+
+	free(blob);
+
 	return 0;
 }
 
-- 
2.7.4
