From: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Subject: [PATCH] fdtoverlay: Switch from using alloca to malloc
Date: Tue,  2 Jan 2018 21:05:38 -0600
Message-ID: <20180103030538.46326-1-kevans@FreeBSD.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

alloca entails a complicated header situation when using other platforms, where
some split it out in alloca.h while others include it as a standard part of
stdlib.h.

The cons don't seem to outweigh the pros, so switch it to malloc.

Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
---
 fdtoverlay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fdtoverlay.c b/fdtoverlay.c
index 7f124fc..62a942d 100644
--- a/fdtoverlay.c
+++ b/fdtoverlay.c
@@ -26,7 +26,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <alloca.h>
 #include <inttypes.h>
 
 #include <libfdt.h>
@@ -79,7 +78,7 @@ static int do_fdtoverlay(const char *input_filename,
 	ret = 0;
 
 	/* allocate blob pointer array */
-	ovblob = alloca(sizeof(*ovblob) * argc);
+	ovblob = malloc(sizeof(*ovblob) * argc);
 	memset(ovblob, 0, sizeof(*ovblob) * argc);
 
 	/* read and keep track of the overlay blobs */
@@ -121,6 +120,7 @@ out_err:
 			if (ovblob[i])
 				free(ovblob[i]);
 		}
+		free(ovblob);
 	}
 	free(blob);
 
-- 
2.15.1
