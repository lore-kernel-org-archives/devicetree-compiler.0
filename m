From: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: [PATCH] fdtput.c: Fix memory leak.
Date: Wed, 13 Jul 2016 00:36:21 +0200
Message-ID: <1468362981-32142-1-git-send-email-jcd@tribudubois.net>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
Cc: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

CID 132821 (#1 of 1): Resource leak (RESOURCE_LEAK)
12. leaked_storage: Variable value going out of scope leaks the storage it points to.

Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
---
 fdtput.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fdtput.c b/fdtput.c
index 9b15c53..db65e96 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -328,7 +328,7 @@ static int delete_node(char *blob, const char *node_name)
 static int do_fdtput(struct display_info *disp, const char *filename,
 		    char **arg, int arg_count)
 {
-	char *value;
+	char *value = NULL;
 	char *blob;
 	char *node;
 	int len, ret = 0;
@@ -374,6 +374,11 @@ static int do_fdtput(struct display_info *disp, const char *filename,
 	}
 
 	free(blob);
+
+	if (value) {
+		free(value);
+	}
+
 	return ret;
 }
 
-- 
2.7.4
