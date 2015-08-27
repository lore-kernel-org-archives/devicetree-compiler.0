From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] libfdt: fix comment block of fdt_get_property_namelen()
Date: Thu, 27 Aug 2015 12:12:42 +0900
Message-ID: <1440645162-4211-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

The statement "Identical to fdt_get_property_namelen() ..." does not
make sense for the comment of fdt_get_property_namelen() itself.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
 libfdt/libfdt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 1054512..1bd0242 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -457,8 +457,8 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
  * @namelen: number of characters of name to consider
  * @lenp: pointer to an integer variable (will be overwritten) or NULL
  *
- * Identical to fdt_get_property_namelen(), but only examine the first
- * namelen characters of name for matching the property name.
+ * Identical to fdt_get_property(), but only examine the first namelen
+ * characters of name for matching the property name.
  */
 const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 						    int nodeoffset,
-- 
1.9.1
