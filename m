From: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Subject: [PATCH 1/2] overlays: auto allocate phandles for nodes in base fdt
Date: Sun, 31 Dec 2017 20:14:33 -0600
Message-ID: <20180101021434.7826-2-kevans@FreeBSD.org>
References: <20180101021434.7826-1-kevans@FreeBSD.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180101021434.7826-1-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

Currently, references cannot be made to nodes in the base that do not already
have phandles, limiting us to nodes that have been referenced in the base fdt.
Lift that restriction by allocating them on an as-needed basis.

Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
---
 libfdt/fdt_overlay.c | 57 +++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index bd81241..dcc2672 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -335,6 +335,40 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 						    delta);
 }
 
+/**
+ * overlay_assign_phandle - Assign a phandle to a symbol in the base fdt
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbol_off: Node offset of the symbol to be assigned a phandle
+ *
+ * overlay_assign_phandle() assigns the next phandle available to the requested
+ * node in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want to reference a symbol in the base device tree that doesn't yet have
+ * a phandle.
+ *
+ * returns:
+ *      phandle assigned on success
+ *      0 on failure
+ */
+static int overlay_assign_phandle(void *fdt, void *fdto, int symbol_off)
+{
+	int phandle, ret;
+	fdt32_t phandle_val;
+
+	/* Overlay phandles have already been adjusted */
+	phandle = fdt_get_max_phandle(fdto);
+	if (phandle < 0)
+		return 0;
+	phandle++;
+	phandle_val = cpu_to_fdt32(phandle);
+	ret = fdt_setprop(fdt, symbol_off, "phandle", &phandle_val, sizeof(phandle_val));
+	if (!ret)
+		return phandle;
+	return 0;
+}
+
 /**
  * overlay_fixup_one_phandle - Set an overlay phandle to the base one
  * @fdt: Base Device Tree blob
@@ -359,7 +393,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
  *      Negative error code on failure
  */
 static int overlay_fixup_one_phandle(void *fdt, void *fdto,
-				     int symbols_off,
+				     int *symbols_off,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
 				     int poffset, const char *label)
@@ -370,10 +404,10 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 	int symbol_off, fixup_off;
 	int prop_len;
 
-	if (symbols_off < 0)
-		return symbols_off;
+	if (*symbols_off < 0)
+		return *symbols_off;
 
-	symbol_path = fdt_getprop(fdt, symbols_off, label,
+	symbol_path = fdt_getprop(fdt, *symbols_off, label,
 				  &prop_len);
 	if (!symbol_path)
 		return prop_len;
@@ -383,8 +417,14 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 		return symbol_off;
 
 	phandle = fdt_get_phandle(fdt, symbol_off);
-	if (!phandle)
-		return -FDT_ERR_NOTFOUND;
+	if (!phandle) {
+		phandle = overlay_assign_phandle(fdt, fdto, symbol_off);
+		if (phandle == 0)
+			return -FDT_ERR_NOTFOUND;
+
+		/* Re-lookup symbols offset, it's been invalidated */
+		*symbols_off = fdt_path_offset(fdt, "/__symbols__");
+	}
 
 	fixup_off = fdt_path_offset_namelen(fdto, path, path_len);
 	if (fixup_off == -FDT_ERR_NOTFOUND)
@@ -418,7 +458,7 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
+static int overlay_fixup_phandle(void *fdt, void *fdto, int *symbols_off,
 				 int property)
 {
 	const char *value;
@@ -519,8 +559,7 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 
 	fdt_for_each_property_offset(property, fdto, fixups_off) {
 		int ret;
-
-		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
+		ret = overlay_fixup_phandle(fdt, fdto, &symbols_off, property);
 		if (ret)
 			return ret;
 	}
-- 
2.15.1
