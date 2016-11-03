From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] libfdt: add missing errors to fdt_strerror()
Date: Thu, 3 Nov 2016 10:47:42 -0500
Message-ID: <1478188062-8219-1-git-send-email-b-fair@ti.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Some error values were missing from the table which meant that they could
not be translated by fdt_strerror().

Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
---
 libfdt/fdt_strerror.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
index 4ab3eb7..9677a18 100644
--- a/libfdt/fdt_strerror.c
+++ b/libfdt/fdt_strerror.c
@@ -77,6 +77,9 @@ static struct fdt_errtabent fdt_errtable[] = {
 	FDT_ERRTABENT(FDT_ERR_BADVERSION),
 	FDT_ERRTABENT(FDT_ERR_BADSTRUCTURE),
 	FDT_ERRTABENT(FDT_ERR_BADLAYOUT),
+	FDT_ERRTABENT(FDT_ERR_INTERNAL),
+	FDT_ERRTABENT(FDT_ERR_BADNCELLS),
+	FDT_ERRTABENT(FDT_ERR_BADVALUE),
 	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
 	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
 };
-- 
1.9.1
