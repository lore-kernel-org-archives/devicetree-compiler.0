From: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] libfdt: Add missing functions to shared library
Date: Tue, 17 Mar 2015 16:00:34 +0000
Message-ID: <1426608034-27189-1-git-send-email-julien.grall@linaro.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The commit 4e76ec7 "libfdt: Add fdt_next_subnode() to permit easy
subnode iteration" adds new functions (fdt_{first,next}_subnode) but
forgot to mark them as 'global' in the shared library.

Signed-off-by: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 libfdt/version.lds | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libfdt/version.lds b/libfdt/version.lds
index 80b322b..941208e 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -54,6 +54,8 @@ LIBFDT_1.2 {
 		fdt_get_property_by_offset;
 		fdt_getprop_by_offset;
 		fdt_next_property_offset;
+		fdt_first_subnode;
+		fdt_next_subnode;
 
 	local:
 		*;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
