From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] overlay: ensure that existing phandles are not overwritten
Date: Wed, 26 Apr 2023 12:02:31 +0200
Message-ID: <20230426100231.484497-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=14580; i=uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org; h=from:subject; bh=NiGV8d47zD31XaHePWQ5IxrIX354IDiS9rKAiGyuj8w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkSPapVOhq3fEhZYQJaIme64kDbRLKRtCppAYHd cAtGMCAQ7mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZEj2qQAKCRCPgPtYfRL+ TrRZB/9NcMVTD4liwgWCOghASHyhOnok0aLlQP/dU9OoWjM4kc456C0KmWnzPurQvrtmXb+v8fE dT5d95zGcAKBNroQxPp/H+/EjMiKRVfbLzo1mTfNsLhfEweNFJC3vF5uyEG6JmR2/QdVH/34I1b ikyAzNnSfIw41UvfbdehOpvEQvIz4F0UZd1sfbYpnKhXl2tB00XXAk65iFsD03N02ElxmPs6utq av5ufB4C/tbABYAQBamsq7Vu6d7qSg9Ydq1VjX3iijN/oKMvJNpWhmx+M5keA0c2DgzEIAHOSel E2RVDcbeqCrTTnrRcob31RN/QEh6TF/yygF+BHpTMJcA55rA
X-Developer-Key: i=uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

A phandle in an overlay is not supposed to overwrite a phandle that
already exists in the base dtb as this breaks references to the respective
node in the base.

Traditionally all phandle values in the overlay were increased by a fixed
offset such that the base and overlay handle values don't overlap. With
this change that still happens to phandles that are new. Already existing
phandles are kept and an array "phandlemap" is used to track how the
overlay's phandles change.

overlay_adjust_local_phandles() which creates the mapping between old and
new phandles in the overlay needs to check the nodes in the base. To be
able to find the base's node, overlay_fixup_phandles() must be run first,
so the order of functions fdt_overlay_apply() had to change.

A test is added that checks that newly added phandles and existing phandles
work as expected.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Hello,

this fixes the bug that I reported in June 2022 (Message-ID:
<20220629205925.v56wxrvib33tgu65-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>).

Best regards
Uwe

 libfdt/fdt_overlay.c              | 190 +++++++++++++++++++++++++-----
 tests/overlay_base_phandle.dts    |  22 ++++
 tests/overlay_overlay_phandle.dts |  24 ++++
 tests/run_tests.sh                |  15 +++
 4 files changed, 220 insertions(+), 31 deletions(-)
 create mode 100644 tests/overlay_base_phandle.dts
 create mode 100644 tests/overlay_overlay_phandle.dts

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 5c0c3981b89d..013a6f018a8b 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -84,6 +84,40 @@ int fdt_overlay_target_offset(const void *fdt, const void *fdto,
 	return ret;
 }
 
+/**
+ * overlay_phandle_set - Set a phandle to a specific value
+ * @fdt: Base device tree blob
+ * @node: Device tree overlay blob
+ * @name: Name of the property to modify (phandle or linux,phandle)
+ * @phandleval: value to set the phandle to
+ *
+ * overlay_phandle_set() set a node's phandle to a given
+ * value.
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
+static int overlay_phandle_set(void *fdt, int node,
+			       const char *name, uint32_t phandleval, uint32_t *phandlemap)
+{
+	int len;
+	const fdt32_t *phandle;
+	uint32_t prevval;
+
+	phandle = fdt_getprop(fdt, node, name, &len);
+	if (!phandle)
+		return len;
+
+	if (len != sizeof(*phandle))
+		return -FDT_ERR_BADPHANDLE;
+
+	prevval = fdt32_to_cpu(*phandle);
+	phandlemap[prevval - 1] = phandleval;
+
+	return fdt_setprop_inplace_u32(fdt, node, name, phandleval);
+}
+
 /**
  * overlay_phandle_add_offset - Increases a phandle by an offset
  * @fdt: Base device tree blob
@@ -99,7 +133,7 @@ int fdt_overlay_target_offset(const void *fdt, const void *fdto,
  *      Negative error code on error
  */
 static int overlay_phandle_add_offset(void *fdt, int node,
-				      const char *name, uint32_t delta)
+				      const char *name, uint32_t delta, uint32_t *phandlemap)
 {
 	const fdt32_t *val;
 	uint32_t adj_val;
@@ -116,6 +150,7 @@ static int overlay_phandle_add_offset(void *fdt, int node,
 	if ((adj_val + delta) < adj_val)
 		return -FDT_ERR_NOPHANDLES;
 
+	phandlemap[adj_val - 1] = adj_val + delta;
 	adj_val += delta;
 	if (adj_val == (uint32_t)-1)
 		return -FDT_ERR_NOPHANDLES;
@@ -129,7 +164,7 @@ static int overlay_phandle_add_offset(void *fdt, int node,
  * @node: Offset of the node we want to adjust
  * @delta: Offset to shift the phandles of
  *
- * overlay_adjust_node_phandles() adds a constant to all the phandles
+ * overlay_adjust_node_phandles() adds a constant to all new phandles
  * of a given node. This is mainly use as part of the overlay
  * application process, when we want to update all the overlay
  * phandles to not conflict with the overlays of the base device tree.
@@ -138,22 +173,65 @@ static int overlay_phandle_add_offset(void *fdt, int node,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_adjust_node_phandles(void *fdto, int node,
-					uint32_t delta)
+static int overlay_adjust_node_phandles(void *fdto, int nodeo,
+					uint32_t delta, void *fdtbase, int basenode, uint32_t *phandlemap)
 {
-	int child;
+	int childo;
 	int ret;
+	const fdt32_t *phandlebase;
+	int phandlebaselen;
 
-	ret = overlay_phandle_add_offset(fdto, node, "phandle", delta);
-	if (ret && ret != -FDT_ERR_NOTFOUND)
-		return ret;
+	/*
+	 * If the base fdt has a phandle already reuse the value to not break
+	 * references that already exist in the base fdt.
+	 */
+	if (fdtbase) {
+		phandlebase = fdt_getprop(fdtbase, basenode, "phandle", &phandlebaselen);
+		if (!phandlebase && phandlebaselen != -FDT_ERR_NOTFOUND)
+			return phandlebaselen;
+		if (!phandlebase) {
+			phandlebase = fdt_getprop(fdtbase, basenode, "linux,phandle", &phandlebaselen);
+			if (!phandlebase && phandlebaselen != -FDT_ERR_NOTFOUND)
+				return phandlebaselen;
+		}
+		if (phandlebase && phandlebaselen != sizeof(*phandlebase))
+			return -FDT_ERR_BADPHANDLE;
+	}
 
-	ret = overlay_phandle_add_offset(fdto, node, "linux,phandle", delta);
-	if (ret && ret != -FDT_ERR_NOTFOUND)
-		return ret;
+	if (fdtbase && phandlebase) {
+		ret = overlay_phandle_set(fdto, nodeo, "phandle", fdt32_to_cpu(*phandlebase), phandlemap);
+		if (ret && ret != -FDT_ERR_NOTFOUND)
+			return ret;
+
+		ret = overlay_phandle_set(fdto, nodeo, "linux,phandle", fdt32_to_cpu(*phandlebase), phandlemap);
+		if (ret && ret != -FDT_ERR_NOTFOUND)
+			return ret;
+	} else {
+		ret = overlay_phandle_add_offset(fdto, nodeo, "phandle", delta, phandlemap);
+		if (ret && ret != -FDT_ERR_NOTFOUND)
+			return ret;
+
+		ret = overlay_phandle_add_offset(fdto, nodeo, "linux,phandle", delta, phandlemap);
+		if (ret && ret != -FDT_ERR_NOTFOUND)
+			return ret;
+	}
+
+	fdt_for_each_subnode(childo, fdto, nodeo) {
+		int basechild = -FDT_ERR_NOTFOUND;
 
-	fdt_for_each_subnode(child, fdto, node) {
-		ret = overlay_adjust_node_phandles(fdto, child, delta);
+		if (fdtbase) {
+			int childnamelen;
+			const char *childname = fdt_get_name(fdto, childo, &childnamelen);
+
+			if (!childname)
+				return childnamelen;
+
+			basechild = fdt_subnode_offset(fdtbase, basenode, childname);
+			if (basechild < 0 && basechild != -FDT_ERR_NOTFOUND)
+				return basechild;
+		}
+
+		ret = overlay_adjust_node_phandles(fdto, childo, delta, basechild >= 0 ? fdtbase : NULL, basechild, phandlemap);
 		if (ret)
 			return ret;
 	}
@@ -170,17 +248,38 @@ static int overlay_adjust_node_phandles(void *fdto, int node,
  * phandles of an overlay. This is mainly use as part of the overlay
  * application process, when we want to update all the overlay
  * phandles to not conflict with the overlays of the base device tree.
+ * phandles that already exist in *fdtbase are not adapted to not overwrite
+ * existing phandles.
  *
  * returns:
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
+static int overlay_adjust_local_phandles(void *fdto, uint32_t delta, void *fdtbase, uint32_t *phandlemap)
 {
-	/*
-	 * Start adjusting the phandles from the overlay root
-	 */
-	return overlay_adjust_node_phandles(fdto, 0, delta);
+	int fragment;
+
+	fdt_for_each_subnode(fragment, fdto, 0) {
+		int overlay;
+		int target;
+		int ret;
+
+		overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+		if (overlay == -FDT_ERR_NOTFOUND)
+			continue;
+
+		if (overlay < 0)
+			return overlay;
+
+		target = fdt_overlay_target_offset(fdtbase, fdto, fragment, NULL);
+		if (target < 0)
+			return target;
+
+		ret = overlay_adjust_node_phandles(fdto, overlay, delta, fdtbase, target, phandlemap);
+		if (ret)
+			return ret;
+	}
+	return 0;
 }
 
 /**
@@ -205,7 +304,7 @@ static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
 static int overlay_update_local_node_references(void *fdto,
 						int tree_node,
 						int fixup_node,
-						uint32_t delta)
+						uint32_t *phandlemap)
 {
 	int fixup_prop;
 	int fixup_child;
@@ -250,7 +349,7 @@ static int overlay_update_local_node_references(void *fdto,
 			 */
 			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));
 
-			adj_val = cpu_to_fdt32(fdt32_to_cpu(adj_val) + delta);
+			adj_val = cpu_to_fdt32(phandlemap[fdt32_to_cpu(adj_val) - 1]);
 
 			ret = fdt_setprop_inplace_namelen_partial(fdto,
 								  tree_node,
@@ -282,7 +381,7 @@ static int overlay_update_local_node_references(void *fdto,
 		ret = overlay_update_local_node_references(fdto,
 							   tree_child,
 							   fixup_child,
-							   delta);
+							   phandlemap);
 		if (ret)
 			return ret;
 	}
@@ -293,13 +392,12 @@ static int overlay_update_local_node_references(void *fdto,
 /**
  * overlay_update_local_references - Adjust the overlay references
  * @fdto: Device tree overlay blob
- * @delta: Offset to shift the phandles of
+ * @phandlemap: mapping of old values of the phandles to the new
  *
- * overlay_update_local_references() update all the phandles pointing
- * to a node within the device tree overlay by adding a constant
- * delta to not conflict with the base overlay.
+ * overlay_update_local_references() updates all the phandles pointing
+ * to a node within the device tree overlay according to phandlemap.
  *
- * This is mainly used as part of a device tree application process,
+ * This is used as part of a device tree overlay application process,
  * where you want the device tree overlays phandles to not conflict
  * with the ones from the base device tree before merging them.
  *
@@ -307,7 +405,7 @@ static int overlay_update_local_node_references(void *fdto,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_update_local_references(void *fdto, uint32_t delta)
+static int overlay_update_local_references(void *fdto, uint32_t *phandlemap)
 {
 	int fixups;
 
@@ -324,7 +422,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 	 * Update our local references from the root of the tree
 	 */
 	return overlay_update_local_node_references(fdto, 0, fixups,
-						    delta);
+						    phandlemap);
 }
 
 /**
@@ -816,23 +914,49 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 {
 	uint32_t delta;
 	int ret;
+	uint32_t *phandlemap = NULL;
 
 	FDT_RO_PROBE(fdt);
 	FDT_RO_PROBE(fdto);
 
+	ret = fdt_find_max_phandle(fdto, &delta);
+	if (ret)
+		goto err;
+
+	phandlemap = calloc(delta, sizeof(*phandlemap));
+	if (!phandlemap) {
+		ret = -FDT_ERR_NOSPACE;
+		goto err;
+	}
+
 	ret = fdt_find_max_phandle(fdt, &delta);
 	if (ret)
 		goto err;
 
-	ret = overlay_adjust_local_phandles(fdto, delta);
+	/*
+	 * Resolve the overlay's phandles that point into the base (in the
+	 * __fixups__ node) to the respective handles in the base.
+	 */
+	ret = overlay_fixup_phandles(fdt, fdto);
 	if (ret)
 		goto err;
 
-	ret = overlay_update_local_references(fdto, delta);
+	/*
+	 * Shift the phandles used in fdto by delta. phandles that already
+	 * exist in fdt are not overwritten. phandlemap is updated to maintain
+	 * how the fdto's phandles change. Note this requires finding the
+	 * fragment targets in fdt and so this must be done after
+	 * overlay_fixup_phandles().
+	 */
+	ret = overlay_adjust_local_phandles(fdto, delta, fdt, phandlemap);
 	if (ret)
 		goto err;
 
-	ret = overlay_fixup_phandles(fdt, fdto);
+	/*
+	 * Fixup the phandles in the overlay listed in __local_fixups__
+	 * according to phandlemap.
+	 */
+	ret = overlay_update_local_references(fdto, phandlemap);
 	if (ret)
 		goto err;
 
@@ -844,6 +968,8 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
+	free(phandlemap);
+
 	/*
 	 * The overlay has been damaged, erase its magic.
 	 */
@@ -852,6 +978,8 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	return 0;
 
 err:
+	free(phandlemap);
+
 	/*
 	 * The overlay might have been damaged, erase its magic.
 	 */
diff --git a/tests/overlay_base_phandle.dts b/tests/overlay_base_phandle.dts
new file mode 100644
index 000000000000..fa22383ef0bf
--- /dev/null
+++ b/tests/overlay_base_phandle.dts
@@ -0,0 +1,22 @@
+/*
+ * Copyright (c) 2023 Uwe Kleine-König
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	node_a: a {
+		value = <17>;
+		c = <&node_c>;
+	};
+
+	node_b: b {
+		a = <&node_a>;
+	};
+
+	node_c: c {
+		b = <&node_b>;
+	};
+};
diff --git a/tests/overlay_overlay_phandle.dts b/tests/overlay_overlay_phandle.dts
new file mode 100644
index 000000000000..0d14382a4305
--- /dev/null
+++ b/tests/overlay_overlay_phandle.dts
@@ -0,0 +1,24 @@
+/*
+ * Copyright (c) 2023 Uwe Kleine-König
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	/* /a already has a label "node_a" in the base dts */
+	node_a2: a {
+		value = <42>;
+		c = <&node_c>;
+	};
+
+	c {
+		a = <&node_a2>;
+	};
+};
+
+&node_b {
+	value = <32>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f899d8cbfe69..6936d2c32f29 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1028,6 +1028,21 @@ fdtoverlay_tests() {
     run_dtc_test -@ -I dts -O dtb -o $stacked_addlabeldtb $stacked_addlabel
 
     run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addlabeldtb} ${stacked_bardtb} ${stacked_bazdtb}
+
+    # verify that labels are not overwritten
+    run_dtc_test -@ -I dts -O dtb -o overlay_base_phandle.test.dtb "$SRCDIR/overlay_base_phandle.dts"
+    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb "$SRCDIR/overlay_overlay_phandle.dts"
+    run_wrap_test $FDTOVERLAY -i overlay_base_phandle.test.dtb -o overlay_base_phandleO.test.dtb overlay_overlay_phandle.test.dtb
+
+    pa=$($DTGET overlay_base_phandleO.test.dtb /a phandle)
+    ba=$($DTGET overlay_base_phandleO.test.dtb /b a)
+    ca=$($DTGET overlay_base_phandleO.test.dtb /c a)
+    shorten_echo "check phandle wasn't overwritten:	"
+    if test "$ba$ca" = "$pa$pa"; then
+	    PASS
+    else
+	    FAIL
+    fi
 }
 
 pylibfdt_tests () {

base-commit: 2cdf93a6d402a161edf16de6011bd5ad76382e92
prerequisite-patch-id: 4a44703d92572161ef33dc002e7991093b04046c
-- 
2.39.2

