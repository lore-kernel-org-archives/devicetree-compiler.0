From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 06/13] libfdt: Add max phandle retrieval function
Date: Tue,  5 Jul 2016 10:26:39 +0200
Message-ID: <20160705082646.25044-7-maxime.ripard@free-electrons.com>
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

Add a function to retrieve the highest phandle in a given device tree.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Reviewed-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/libfdt.h    | 13 +++++++++++++
 lib/libfdt/fdt_ro.c | 26 ++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/libfdt.h b/include/libfdt.h
index fbbe58ceb3f1..4643be5adf39 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -283,6 +283,19 @@ int fdt_move(const void *fdt, void *buf, int bufsize);
  */
 const char *fdt_string(const void *fdt, int stroffset);
 
+/**
+ * fdt_get_max_phandle - retrieves the highest phandle in a tree
+ * @fdt: pointer to the device tree blob
+ *
+ * fdt_get_max_phandle retrieves the highest phandle in the given
+ * device tree
+ *
+ * returns:
+ *      the highest phandle on success
+ *      0, if an error occurred
+ */
+uint32_t fdt_get_max_phandle(const void *fdt);
+
 /**
  * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
  * @fdt: pointer to the device tree blob
diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
index 12214c2dc2b5..503150ef1dc5 100644
--- a/lib/libfdt/fdt_ro.c
+++ b/lib/libfdt/fdt_ro.c
@@ -47,6 +47,32 @@ static int _fdt_string_eq(const void *fdt, int stroffset,
 	return (strnlen(p, len + 1) == len) && (memcmp(p, s, len) == 0);
 }
 
+uint32_t fdt_get_max_phandle(const void *fdt)
+{
+	uint32_t max_phandle = 0;
+	int offset;
+
+	for (offset = fdt_next_node(fdt, -1, NULL);;
+	     offset = fdt_next_node(fdt, offset, NULL)) {
+		uint32_t phandle;
+
+		if (offset == -FDT_ERR_NOTFOUND)
+			return max_phandle;
+
+		if (offset < 0)
+			return 0;
+
+		phandle = fdt_get_phandle(fdt, offset);
+		if (phandle == (uint32_t)-1)
+			return 0;
+
+		if (phandle > max_phandle)
+			max_phandle = phandle;
+	}
+
+	return 0;
+}
+
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 {
 	FDT_CHECK_HEADER(fdt);
-- 
2.9.0
