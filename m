From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/4] libfdt: overlay: Report a bad overlay for mismatching local fixups
Date: Thu,  6 Oct 2016 13:39:57 +0200
Message-ID: <20161006113959.30865-3-maxime.ripard@free-electrons.com>
References: <20161006113959.30865-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161006113959.30865-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The __local_fixups__ node as a structure that mimics the structure of the
main overlay part.

This means that if we have a child node somewhere in the local fixups
sub-tree and if that node is not present in the main tree, the overlay is
poorly formatted, and we should report it as such.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/fdt_overlay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 322e7adb41b8..2f306e4717ec 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -272,6 +272,8 @@ static int overlay_update_local_node_references(void *fdto,
 
 		tree_child = fdt_subnode_offset(fdto, tree_node,
 						fixup_child_name);
+		if (ret == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_BADOVERLAY;
 		if (tree_child < 0)
 			return tree_child;
 
-- 
2.9.3
