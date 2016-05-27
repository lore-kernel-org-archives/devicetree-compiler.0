From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 6/9] libfdt: Add max phandle retrieval function
Date: Fri, 27 May 2016 11:13:19 +0200
Message-ID: <1464340402-2249-7-git-send-email-maxime.ripard@free-electrons.com>
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

Add a function to retrieve the highest phandle in a given device tree.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 include/libfdt.h    | 13 +++++++++++++
 lib/libfdt/fdt_ro.c | 15 +++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/libfdt.h b/include/libfdt.h
index 4e8eb9ede3a4..1e01b2c7ebdf 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -284,6 +284,19 @@ int fdt_move(const void *fdt, void *buf, int bufsize);
 const char *fdt_string(const void *fdt, int stroffset);
 
 /**
+ * fdt_get_max_phandle - retrieves the highest phandle in a tree
+ * @fdt: pointer to the device tree blob
+ *
+ * fdt_get_max_phandle retrieves the highest phandlle in the given
+ * device tree
+ *
+ * returns:
+ *      the highest phandle on success
+ *      0, if an error occured
+ */
+uint32_t fdt_get_max_phandle(const void *fdt);
+
+/**
  * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
  * @fdt: pointer to the device tree blob
  *
diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
index 7b0777b67eb3..9130ce718965 100644
--- a/lib/libfdt/fdt_ro.c
+++ b/lib/libfdt/fdt_ro.c
@@ -47,6 +47,21 @@ static int _fdt_string_eq(const void *fdt, int stroffset,
 	return (strnlen(p, len + 1) == len) && (memcmp(p, s, len) == 0);
 }
 
+uint32_t fdt_get_max_phandle(const void *fdt)
+{
+	uint32_t max_phandle = 0, phandle;
+	int offset;
+
+	for (offset = fdt_next_node(fdt, -1, NULL); offset >= 0;
+	     offset = fdt_next_node(fdt, offset, NULL)) {
+		phandle = fdt_get_phandle(fdt, offset);
+		if (phandle > max_phandle)
+			max_phandle = phandle;
+	}
+
+	return max_phandle;
+}
+
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 {
 	FDT_CHECK_HEADER(fdt);
-- 
2.8.2
