From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 07/12] libfdt: Add fdt_setprop_inplace_by_index
Date: Fri, 24 Jun 2016 16:27:52 +0200
Message-ID: <20160624142757.32735-8-maxime.ripard@free-electrons.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160624142757.32735-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Add a function to modify inplace a property starting from a given index.

This is especially useful when the property is an array of values, and you
want to update one of them without changing the DT size.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 include/libfdt.h     | 34 +++++++++++++++++++++++++++++++---
 lib/libfdt/fdt_wip.c | 13 ++++++++-----
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/include/libfdt.h b/include/libfdt.h
index 4643be5adf39..2c8a42bcb667 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -1032,6 +1032,27 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
 /* Write-in-place functions                                           */
 /**********************************************************************/
 
+/**
+ * fdt_setprop_inplace_namelen_by_index - change a property's value,
+ *                                        but not its size
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @namelen: number of characters of name to consider
+ * @index: index of the property to change in the array
+ * @val: pointer to data to replace the property value with
+ * @len: length of the property value
+ *
+ * Identical to fdt_setprop_inplace(), but modifies the given property
+ * starting from the given index, and using only the first characters
+ * of the name. It is useful when you want to manipulate only one value of
+ * an array and you have a string that doesn't end with \0.
+ */
+int fdt_setprop_inplace_namelen_by_index(void *fdt, int nodeoffset,
+					 const char *name, int namelen,
+					 uint32_t index, const void *val,
+					 int len);
+
 /**
  * fdt_setprop_inplace - change a property's value, but not its size
  * @fdt: pointer to the device tree blob
@@ -1060,8 +1081,13 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
  *	-FDT_ERR_BADSTRUCTURE,
  *	-FDT_ERR_TRUNCATED, standard meanings
  */
-int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
-			const void *val, int len);
+static inline int fdt_setprop_inplace(void *fdt, int nodeoffset,
+				      const char *name, const void *val,
+				      int len)
+{
+	return fdt_setprop_inplace_namelen_by_index(fdt, nodeoffset, name,
+						    strlen(name), 0, val, len);
+}
 
 /**
  * fdt_setprop_inplace_u32 - change the value of a 32-bit integer property
@@ -1095,7 +1121,9 @@ static inline int fdt_setprop_inplace_u32(void *fdt, int nodeoffset,
 					  const char *name, uint32_t val)
 {
 	fdt32_t tmp = cpu_to_fdt32(val);
-	return fdt_setprop_inplace(fdt, nodeoffset, name, &tmp, sizeof(tmp));
+	return fdt_setprop_inplace_namelen_by_index(fdt, nodeoffset,
+						    name, strlen(name),
+						    0, &tmp, sizeof(tmp));
 }
 
 /**
diff --git a/lib/libfdt/fdt_wip.c b/lib/libfdt/fdt_wip.c
index 9fe988655fe3..737769fa59e2 100644
--- a/lib/libfdt/fdt_wip.c
+++ b/lib/libfdt/fdt_wip.c
@@ -14,20 +14,23 @@
 
 #include "libfdt_internal.h"
 
-int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
-			const void *val, int len)
+int fdt_setprop_inplace_namelen_by_index(void *fdt, int nodeoffset,
+					 const char *name, int namelen,
+					 uint32_t index, const void *val,
+					 int len)
 {
 	void *propval;
 	int proplen;
 
-	propval = fdt_getprop_w(fdt, nodeoffset, name, &proplen);
+	propval = fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
+					&proplen);
 	if (!propval)
 		return proplen;
 
-	if (proplen != len)
+	if (proplen < (len + index))
 		return -FDT_ERR_NOSPACE;
 
-	memcpy(propval, val, len);
+	memcpy(propval + index, val, len);
 	return 0;
 }
 
-- 
2.9.0
