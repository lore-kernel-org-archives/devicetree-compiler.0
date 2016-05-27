From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 5/9] libfdt: Add iterator over properties
Date: Fri, 27 May 2016 11:13:18 +0200
Message-ID: <1464340402-2249-6-git-send-email-maxime.ripard@free-electrons.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464340402-2249-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Implement a macro based on fdt_first_property_offset and
fdt_next_property_offset that provides a convenience to iterate over all
the properties of a given node.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 include/libfdt.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/libfdt.h b/include/libfdt.h
index 74b1d149c2dd..4e8eb9ede3a4 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -441,6 +441,30 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset);
 int fdt_next_property_offset(const void *fdt, int offset);
 
 /**
+ * fdt_for_each_property - iterate over all properties of a node
+ * @fdt:	FDT blob (const void *)
+ * @node:	node offset (int)
+ * @property:	property offset (int)
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
+#define fdt_for_each_property(fdt, node, property)		\
+	for (property = fdt_first_property_offset(fdt, node);	\
+	     property >= 0;					\
+	     property = fdt_next_property_offset(fdt, property))
+
+/**
  * fdt_get_property_by_offset - retrieve the property at a given offset
  * @fdt: pointer to the device tree blob
  * @offset: offset of the property to retrieve
-- 
2.8.2
