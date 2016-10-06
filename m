From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/4] libfdt: Add BADPHANDLE error string
Date: Thu,  6 Oct 2016 13:39:56 +0200
Message-ID: <20161006113959.30865-2-maxime.ripard@free-electrons.com>
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

The BADPHANDLE error was missing a string, leading to an <unknown error>
string being returned if you were to call fdt_strerror.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/fdt_strerror.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
index 3cb357f60454..e00fcb19df60 100644
--- a/libfdt/fdt_strerror.c
+++ b/libfdt/fdt_strerror.c
@@ -69,6 +69,7 @@ static struct fdt_errtabent fdt_errtable[] = {
 
 	FDT_ERRTABENT(FDT_ERR_BADOFFSET),
 	FDT_ERRTABENT(FDT_ERR_BADPATH),
+	FDT_ERRTABENT(FDT_ERR_BADPHANDLE),
 	FDT_ERRTABENT(FDT_ERR_BADSTATE),
 
 	FDT_ERRTABENT(FDT_ERR_TRUNCATED),
-- 
2.9.3
