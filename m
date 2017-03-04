From: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Subject: [PATCH 2/5] libfdt: overlay: Check the value of the right variable
Date: Sat,  4 Mar 2017 14:26:44 +0100
Message-ID: <20170304132647.23286-2-nicolas.iooss_linux@m4x.org>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170304132647.23286-1-nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>

overlay_update_local_node_references() saves the result of
fdt_subnode_offset() into variable tree_child but checks for variable
ret afterwards. As this does not make sense, check tree_child instead of
ret.

This bug has been found by compiling with clang. The compiler reported
the following warning:

    libfdt/fdt_overlay.c:275:7: error: variable 'ret' may be
    uninitialized when used here
          [-Werror,-Wconditional-uninitialized]
                    if (ret == -FDT_ERR_NOTFOUND)
                        ^~~
    libfdt/fdt_overlay.c:210:9: note: initialize the variable 'ret' to
    silence this
          warning
            int ret;
                   ^
                    = 0

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
---
 libfdt/fdt_overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 56cb70ed4445..b2fb5d970ccc 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -272,7 +272,7 @@ static int overlay_update_local_node_references(void *fdto,
 
 		tree_child = fdt_subnode_offset(fdto, tree_node,
 						fixup_child_name);
-		if (ret == -FDT_ERR_NOTFOUND)
+		if (tree_child == -FDT_ERR_NOTFOUND)
 			return -FDT_ERR_BADOVERLAY;
 		if (tree_child < 0)
 			return tree_child;
-- 
2.11.1
