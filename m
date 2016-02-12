From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] libfdt: simplify fdt_node_check_compatible()
Date: Fri, 12 Feb 2016 14:45:12 +0900
Message-ID: <1455255912-26241-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Because fdt_stringlist_contains() returns 1 or 0,
fdt_node_check_compatible() can just return the inverted value.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 libfdt/fdt_ro.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index e5b3136..50cce86 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -647,10 +647,8 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 	prop = fdt_getprop(fdt, nodeoffset, "compatible", &len);
 	if (!prop)
 		return len;
-	if (fdt_stringlist_contains(prop, len, compatible))
-		return 0;
-	else
-		return 1;
+
+	return !fdt_stringlist_contains(prop, len, compatible);
 }
 
 int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
-- 
1.9.1
