From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 05/13] libfdt: Add iterator over properties
Date: Tue,  5 Jul 2016 10:26:38 +0200
Message-ID: <20160705082646.25044-6-maxime.ripard@free-electrons.com>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160705082646.25044-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Implement a macro based on fdt_first_property_offset and
fdt_next_property_offset that provides a convenience to iterate over all
the properties of a given node.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/libfdt.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/libfdt.h b/include/libfdt.h
index 74b1d149c2dd..fbbe58ceb3f1 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -440,6 +440,30 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset);
  */
 int fdt_next_property_offset(const void *fdt, int offset);
 
+/**
+ * fdt_for_each_property - iterate over all properties of a node
+ * @property_offset:	property offset (int)
+ * @fdt:		FDT blob (const void *)
+ * @node:		node offset (int)
+ *
+ * This is actually a wrapper around a for loop and would be used like so:
+ *
+ *	fdt_for_each_property(fdt, node, property) {
+ *		...
+ *		use property
+ *		...
+ *	}
+ *
+ * Note that this is implemented as a macro and property is used as
+ * iterator in the loop. It should therefore be a locally allocated
+ * variable. The node variable on the other hand is never modified, so
+ * it can be constant or even a literal.
+ */
+#define fdt_for_each_property_offset(property, fdt, node)	\
+	for (property = fdt_first_property_offset(fdt, node);	\
+	     property >= 0;					\
+	     property = fdt_next_property_offset(fdt, property))
+
 /**
  * fdt_get_property_by_offset - retrieve the property at a given offset
  * @fdt: pointer to the device tree blob
-- 
2.9.0
