From: Gurbir Arora <gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 1/6] libfdt: overlay_merge: Introduce fdt_overlay_merge()
Date: Wed,  9 Sep 2020 10:17:57 -0700
Message-ID: <1599671882-310027-2-git-send-email-gurbaror@codeaurora.org>
References: <1599671882-310027-1-git-send-email-gurbaror@codeaurora.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1599671882-310027-1-git-send-email-gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

From: Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

fdt_overlay_merge() merges two overlay blobs. This is largely expected to be
used offline on a build machine to combine two or more overlay blobs into one.

This is intended to help maintain device-tree overlay code in
multiple source repositories, but merge their binary forms (overlay blobs)
into one so that bootloader's task of searching for all relevant overlay blobs
is simplified.

This patch introduces fdt_overlay_merge() which is exactly identical to
fdt_overlay_apply(). Subsequent patches will introduce required changes to merge
overlay blobs.

Signed-off-by: Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 libfdt/fdt_overlay.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h      | 18 ++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index b310e49..65d7a29 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -879,3 +879,56 @@ err:
 
 	return ret;
 }
+
+int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
+{
+	uint32_t delta = fdt_get_max_phandle(fdt);
+	int ret;
+
+	FDT_CHECK_HEADER(fdt);
+	FDT_CHECK_HEADER(fdto);
+
+	*fdto_nospace = 0;
+
+	ret = overlay_adjust_local_phandles(fdto, delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_update_local_references(fdto, delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_fixup_phandles(fdt, fdto);
+	if (ret)
+		goto err;
+
+	ret = overlay_merge(fdt, fdto);
+	if (ret)
+		goto err;
+
+	ret = overlay_symbol_update(fdt, fdto);
+	if (ret)
+		goto err;
+
+	/*
+	 * The overlay has been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	return 0;
+
+err:
+	/*
+	 * The overlay might have been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	/*
+	 * The base device tree might have been damaged, erase its
+	 * magic.
+	 */
+	if (!*fdto_nospace)
+		fdt_set_magic(fdt, ~0);
+
+	return ret;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 544d3ef..950388e 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -2067,6 +2067,24 @@ int fdt_del_node(void *fdt, int nodeoffset);
  */
 int fdt_overlay_apply(void *fdt, void *fdto);
 
+/**
+ * fdt_overlay_merge - Merge two overlays into one
+ * @fdt: pointer to the first device tree overlay blob
+ * @fdto: pointer to the second device tree overlay blob
+ * @fdto_nospace: indicates if FDT_ERR_NOSPACE error code applies to @fdto
+ *
+ * fdt_overlay_merge() will merge second overlay blob into first overlay blob.
+ *
+ * Expect the first device tree to be modified, even if the function
+ * returns an error.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there's not enough space in first device tree blob
+ *	-FDT_ERR_BADVALUE
+ */
+int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace);
+
 /**********************************************************************/
 /* Debugging / informational functions                                */
 /**********************************************************************/
-- 
2.7.4

