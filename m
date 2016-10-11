From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/3] fdt: strerr: Remove spurious BADOVERLAY
Date: Tue, 11 Oct 2016 10:10:31 +0200
Message-ID: <20161011081033.28604-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

There's one FDT_ERR_BADOVERLAY too many in the fdt error table.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/fdt_strerror.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
index e00fcb19df60..4ab3eb70b2bd 100644
--- a/libfdt/fdt_strerror.c
+++ b/libfdt/fdt_strerror.c
@@ -78,7 +78,6 @@ static struct fdt_errtabent fdt_errtable[] = {
 	FDT_ERRTABENT(FDT_ERR_BADSTRUCTURE),
 	FDT_ERRTABENT(FDT_ERR_BADLAYOUT),
 	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
-	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
 	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
 };
 #define FDT_ERRTABSIZE	(sizeof(fdt_errtable) / sizeof(fdt_errtable[0]))
-- 
2.9.3
