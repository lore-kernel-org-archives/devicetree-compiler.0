From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/3] libfdt: Add fdt_overlay_apply to the exported symbols
Date: Tue, 11 Oct 2016 10:10:32 +0200
Message-ID: <20161011081033.28604-2-maxime.ripard@free-electrons.com>
References: <20161011081033.28604-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161011081033.28604-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

fdt_overlay_apply was not usable in the shared library. Export it to allow
its use.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/version.lds | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libfdt/version.lds b/libfdt/version.lds
index 1f4e1eab2557..cff0358f2314 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -61,6 +61,7 @@ LIBFDT_1.2 {
 		fdt_size_cells;
 		fdt_stringlist_contains;
 		fdt_resize;
+		fdt_overlay_apply;
 
 	local:
 		*;
-- 
2.9.3
