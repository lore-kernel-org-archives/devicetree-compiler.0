From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/4] libfdt: overlay: Fix symbols and fixups nodes condition
Date: Thu,  6 Oct 2016 13:39:58 +0200
Message-ID: <20161006113959.30865-4-maxime.ripard@free-electrons.com>
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

Some base device tree might not have any __symbols__ nodes, since they
might not have any phandle at all.

Similarly, if an overlay doesn't use any base device tree phandles, its
__fixups__ node will be empty.

In such cases, we don't want to stop the phandle parsing, but rather just
ignore the error reported about the missing node.

If it's actually an issue for the overlay we're trying to apply on a given
base device tree, it will be caught later on, but we cannot make the
assumption that early in the application process.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/fdt_overlay.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 2f306e4717ec..bb4140412971 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -492,13 +492,12 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 
 	/* We can have overlays without any fixups */
 	fixups_off = fdt_path_offset(fdto, "/__fixups__");
-	if (fixups_off == -FDT_ERR_NOTFOUND)
-		return 0;
-	if (fixups_off < 0)
+	if ((fixups_off < 0 && (fixups_off != -FDT_ERR_NOTFOUND)))
 		return fixups_off;
 
+	/* And base DTs without symbols */
 	symbols_off = fdt_path_offset(fdt, "/__symbols__");
-	if (symbols_off < 0)
+	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND)))
 		return symbols_off;
 
 	fdt_for_each_property_offset(property, fdto, fixups_off) {
-- 
2.9.3
