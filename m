From: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Subject: [PATCH v3 1/2] fdt_overlay: Allocate phandles as needed for nodes referenced in base fdt
Date: Wed,  3 Jan 2018 11:12:33 -0600
Message-ID: <20180103171234.86105-2-kevans@FreeBSD.org>
References: <20180103171234.86105-1-kevans@FreeBSD.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103171234.86105-1-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>

Currently, references cannot be made to nodes in the base that do not already
have phandles, limiting us to nodes that have been referenced in the base fdt.
Lift that restriction by allocating them on an as-needed basis.

Signed-off-by: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
---

Changes in v3:
 - Remove the function added in v2; instead, grab the max phandle from the
overlay when we start applying fixups and keep incrementing that as we need to
assign phandles to nodes. This is more efficient, avoiding full scans of both
blobs every time we need to assign.
 - Use fdt_setprop_u32 instead of manually byteswapping.
 - Use node_off instead of symbol_off to reflect actual value.

Changes in v2:
 - Added a function to grab the next phandle; once we've assigned one phandle
 to a node automatically, we'll need to choose max phandle from the base
 blob instead of the overlay since they've not necessarily been merged yet.

 libfdt/fdt_overlay.c | 64 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 13 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index bd81241..bd6c11b 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -335,10 +335,39 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 						    delta);
 }
 
+/**
+ * overlay_assign_phandle - Assign a phandle to a symbol in the base fdt
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @node_off: Node offset of the symbol to be assigned a phandle
+ * @phandle: The phandle to the assigned
+ *
+ * overlay_assign_phandle() assigns the next phandle available to the requested
+ * node in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when you want to
+ * reference a symbol in the base device tree that doesn't yet have a phandle.
+ *
+ * returns:
+ *      phandle assigned on success
+ *      0 on failure
+ */
+static int overlay_assign_phandle(void *fdt, void *fdto, int node_off,
+				uint32_t phandle)
+{
+	int ret;
+
+	ret = fdt_setprop_u32(fdt, node_off, "phandle", phandle);
+	if (!ret)
+		return phandle;
+	return 0;
+}
+
 /**
  * overlay_fixup_one_phandle - Set an overlay phandle to the base one
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
+ * @max_phandle: Highest phandle assigned, for assigning a new phandle as needed
  * @symbols_off: Node offset of the symbols node in the base device tree
  * @path: Path to a node holding a phandle in the overlay
  * @path_len: number of path characters to consider
@@ -358,8 +387,8 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_one_phandle(void *fdt, void *fdto,
-				     int symbols_off,
+static int overlay_fixup_one_phandle(void *fdt, void *fdto, uint32_t *max_phandle,
+				     int *symbols_off,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
 				     int poffset, const char *label)
@@ -370,10 +399,10 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
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
@@ -383,8 +412,15 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 		return symbol_off;
 
 	phandle = fdt_get_phandle(fdt, symbol_off);
-	if (!phandle)
-		return -FDT_ERR_NOTFOUND;
+	if (!phandle) {
+		(*max_phandle)++;
+		phandle = overlay_assign_phandle(fdt, fdto, symbol_off, *max_phandle);
+		if (phandle == 0)
+			return -FDT_ERR_NOTFOUND;
+
+		/* Re-lookup symbols offset, it's been invalidated */
+		*symbols_off = fdt_path_offset(fdt, "/__symbols__");
+	}
 
 	fixup_off = fdt_path_offset_namelen(fdto, path, path_len);
 	if (fixup_off == -FDT_ERR_NOTFOUND)
@@ -403,6 +439,7 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
  * overlay_fixup_phandle - Set an overlay phandle to the base one
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
+ * @max_phandle: Highest phandle assigned, for assigning a new phandle as needed
  * @symbols_off: Node offset of the symbols node in the base device tree
  * @property: Property offset in the overlay holding the list of fixups
  *
@@ -418,8 +455,8 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
-				 int property)
+static int overlay_fixup_phandle(void *fdt, void *fdto, uint32_t *max_phandle,
+				 int *symbols_off, int property)
 {
 	const char *value;
 	const char *label;
@@ -473,7 +510,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		if ((*endptr != '\0') || (endptr <= (sep + 1)))
 			return -FDT_ERR_BADOVERLAY;
 
-		ret = overlay_fixup_one_phandle(fdt, fdto, symbols_off,
+		ret = overlay_fixup_one_phandle(fdt, fdto, max_phandle, symbols_off,
 						path, path_len, name, name_len,
 						poffset, label);
 		if (ret)
@@ -502,6 +539,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
  */
 static int overlay_fixup_phandles(void *fdt, void *fdto)
 {
+	uint32_t max_phandle;
 	int fixups_off, symbols_off;
 	int property;
 
@@ -516,11 +554,11 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 	symbols_off = fdt_path_offset(fdt, "/__symbols__");
 	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND)))
 		return symbols_off;
-
+	/* In case we need to assign phandles, this is where we left off */
+	max_phandle = fdt_get_max_phandle(fdto);
 	fdt_for_each_property_offset(property, fdto, fixups_off) {
 		int ret;
-
-		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
+		ret = overlay_fixup_phandle(fdt, fdto, &max_phandle, &symbols_off, property);
 		if (ret)
 			return ret;
 	}
-- 
2.15.1
