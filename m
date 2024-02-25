Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D018EA8
	for <devicetree-compiler@vger.kernel.org>; Sun, 25 Feb 2024 17:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708883682; cv=none; b=tB+HWBcCyQnf3UlS+zsw5bJ33ptSQyP1HEc/GJBBntB+7d8TNeZA4Dbh6EEGhrFq9PTzYQ/uxxbNdWf8gSDExm+dL5H5qOQ+aFIAy65WaMjWR25q8uSVtNDgolo4cod7p70UyqCGmz03KgVb/MKcfPsQMiaps3bW3eNFP5mhNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708883682; c=relaxed/simple;
	bh=KYyFDst4oNk3UBr6l/kkjo7HbrJTMp2DvQtBgEahGyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ebzJ9ew5IwS6XBmx/HtmaIYphODWAvy6FUvh6849Km64DCmLH/Pxs23QT3qWVWfFN1vSJCMe9kR1cP1C+4vgMUE4V8KpLS7S+ubOG+Nlyo0t+oqpmF7cyD51alHrKXUEv3QGABxw0P3DlZdAtigmnX1O4Z/etgK2GLVwM7EfdYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1reIhs-0006sC-RT; Sun, 25 Feb 2024 18:54:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1reIhr-002qGJ-Ga; Sun, 25 Feb 2024 18:54:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1reIhr-00BLiO-1N;
	Sun, 25 Feb 2024 18:54:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org,
	entwicklung@pengutronix.de
Subject: [PATCH v3] libfdt: overlay: ensure that existing phandles are not overwritten
Date: Sun, 25 Feb 2024 18:54:23 +0100
Message-ID: <20240225175422.156393-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=12293; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KYyFDst4oNk3UBr6l/kkjo7HbrJTMp2DvQtBgEahGyE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl237OvvLYy0N3mqS2IWVyWJWMkXkE928T4n4iU wqc/gwE5tqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdt+zgAKCRCPgPtYfRL+ Trx5B/wNuKeAdPmdsGu4iNaPWvo/P/2MGmAvtdziBAoqWMDo+1w0c/4UKTO2sXH/xlKqtL4KXLc 7uR3Llv3unJWVGCpLIeUSyqXCzcTrL4h3WZB8+3HOlmElSFNnMiZIrb826lxnGsNA3vE2+EVu8k 3OAqqEQH1Z365d75H+QGu4wi64RxVWjFGxyCnTznu+q8xS6K0kWeYrlj7qsCCltaghHAJ2d/iSs mOkUaElNn29/WskrYlnBFBhm0stEO8frnEpbM4sAuc1SR0bsy8BAjXsyS8ocX41PRcWTQZyhqaE /PCLE9iYjWzrD7+AxEItTnpNpmhOcBVU2qxj/r9Gm1fj75s1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-compiler@vger.kernel.org

A phandle in an overlay is not supposed to overwrite a phandle that
already exists in the base dtb as this breaks references to the
respective node in the base.

So add another iteration over the fdto that checks for such overwrites
and fixes the fdto phandle's value to match the fdt's.

A test is added that checks that newly added phandles and existing
phandles work as expected.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

here comes the next iteration of the patch that fixes overlay
application to not overwrite existing phandles.

It is rebased to current main branch. The changes since v2 are:

 - Add documentation
 - Apply the simplification from 24f60011fd43 ("libfdt: Simplify
   adjustment of values for local fixups") in the functions added here.
 - Rename functions using shorter and better names
 - Changed the test device trees to yield a hole in the phandle space
 - Checked each phandle value not being overwritten separately

Note I didn't switch the order of overlay_prevent_phandle_overwrite() and
overlay_fixup_phandles() because the overlay's phandles must be resolved
before I can do the recursion needed in
overlay_prevent_phandle_overwrite().

Best regards
Uwe

 libfdt/fdt_overlay.c              | 251 ++++++++++++++++++++++++++++++
 tests/overlay_base_phandle.dts    |  21 +++
 tests/overlay_overlay_phandle.dts |  34 ++++
 tests/run_tests.sh                |  28 ++++
 4 files changed, 334 insertions(+)
 create mode 100644 tests/overlay_base_phandle.dts
 create mode 100644 tests/overlay_overlay_phandle.dts

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 7ec839ae7118..f500f2d07030 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -498,6 +498,249 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 	return 0;
 }
 
+/**
+ * overlay_adjust_local_conflicting_phandle: Changes a phandle value
+ * @fdto: Device tree overlay
+ * @node: The node the phandle is set for
+ * @fdt_phandle: The new value for the phandle
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_adjust_local_conflicting_phandle(void *fdto, int node,
+						    uint32_t fdt_phandle)
+{
+	const fdt32_t *php;
+	int len, ret;
+
+	php = fdt_getprop(fdto, node, "phandle", &len);
+	if (php && len == sizeof(*php)) {
+		ret = fdt_setprop_inplace_u32(fdto, node, "phandle", fdt_phandle);
+		if (ret)
+			return ret;
+	}
+
+	php = fdt_getprop(fdto, node, "linux,phandle", &len);
+	if (php && len == sizeof(*php)) {
+		ret = fdt_setprop_inplace_u32(fdto, node, "linux,phandle", fdt_phandle);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_update_node_conflicting_references - Recursively replace phandle values
+ * @fdto: Device tree overlay blob
+ * @tree_node: Node to recurse into
+ * @fixup_node: Node offset of the matching local fixups node
+ * @fdt_phandle: Value to replace phandles with
+ * @fdto_phandle: Value to be replaced
+ *
+ * Replaces all phandles with value @fdto_phandle by @fdt_phandle.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_node_conflicting_references(void *fdto, int tree_node,
+						      int fixup_node,
+						      uint32_t fdt_phandle,
+						      uint32_t fdto_phandle)
+{
+	int fixup_prop;
+	int fixup_child;
+	int ret;
+
+	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
+		const fdt32_t *fixup_val;
+		const char *name;
+		char *tree_val;
+		int fixup_len;
+		int tree_len;
+		int i;
+
+		fixup_val = fdt_getprop_by_offset(fdto, fixup_prop,
+						  &name, &fixup_len);
+		if (!fixup_val)
+			return fixup_len;
+
+		if (fixup_len % sizeof(uint32_t))
+			return -FDT_ERR_BADOVERLAY;
+		fixup_len /= sizeof(uint32_t);
+
+		tree_val = fdt_getprop_w(fdto, tree_node, name, &tree_len);
+		if (!tree_val) {
+			if (tree_len == -FDT_ERR_NOTFOUND)
+				return -FDT_ERR_BADOVERLAY;
+
+			return tree_len;
+		}
+
+		for (i = 0; i < fixup_len; i++) {
+			fdt32_t *refp;
+			uint32_t valp;
+
+			refp = (fdt32_t *)(tree_val + fdt32_ld_(fixup_val + i));
+			valp = fdt32_ld(refp);
+
+			if (valp == fdto_phandle)
+				fdt32_st(refp, fdt_phandle);
+		}
+	}
+
+	fdt_for_each_subnode(fixup_child, fdto, fixup_node) {
+		const char *fixup_child_name = fdt_get_name(fdto, fixup_child, NULL);
+		int tree_child;
+
+		tree_child = fdt_subnode_offset(fdto, tree_node, fixup_child_name);
+
+		if (tree_child == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_BADOVERLAY;
+		if (tree_child < 0)
+			return tree_child;
+
+		ret = overlay_update_node_conflicting_references(fdto, tree_child,
+								 fixup_child,
+								 fdt_phandle,
+								 fdto_phandle);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_update_local_conflicting_references - Recursively replace phandle values
+ * @fdto: Device tree overlay blob
+ * @fdt_phandle: Value to replace phandles with
+ * @fdto_phandle: Value to be replaced
+ *
+ * Replaces all phandles with value @fdto_phandle by @fdt_phandle.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_local_conflicting_references(void *fdto,
+						       uint32_t fdt_phandle,
+						       uint32_t fdto_phandle)
+{
+	int fixups;
+
+	fixups = fdt_path_offset(fdto, "/__local_fixups__");
+	if (fixups == -FDT_ERR_NOTFOUND)
+		return 0;
+	if (fixups < 0)
+		return fixups;
+
+	return overlay_update_node_conflicting_references(fdto, 0, fixups,
+							  fdt_phandle,
+							  fdto_phandle);
+}
+
+/**
+ * overlay_prevent_phandle_overwrite_node - Helper function for overlay_prevent_phandle_overwrite
+ * @fdt: Base Device tree blob
+ * @fdtnode: Node in fdt that is checked for an overwrite
+ * @fdto: Device tree overlay blob
+ * @fdtonode: Node in fdto matching @fdtnode
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
+						  void *fdto, int fdtonode)
+{
+	uint32_t fdt_phandle, fdto_phandle;
+	int fdtochild;
+
+	fdt_phandle = fdt_get_phandle(fdt, fdtnode);
+	fdto_phandle = fdt_get_phandle(fdto, fdtonode);
+
+	if (fdt_phandle && fdto_phandle) {
+		int ret;
+
+		ret = overlay_adjust_local_conflicting_phandle(fdto, fdtonode,
+							       fdt_phandle);
+		if (ret)
+			return ret;
+
+		ret = overlay_update_local_conflicting_references(fdto,
+								  fdt_phandle,
+								  fdto_phandle);
+		if (ret)
+			return ret;
+	}
+
+	fdt_for_each_subnode(fdtochild, fdto, fdtonode) {
+		const char *name = fdt_get_name(fdto, fdtochild, NULL);
+		int fdtchild;
+		int ret;
+
+		fdtchild = fdt_subnode_offset(fdt, fdtnode, name);
+		if (fdtchild == -FDT_ERR_NOTFOUND)
+			/*
+			 * no further overwrites possible here as this node is
+			 * new
+			 */
+			continue;
+
+		ret = overlay_prevent_phandle_overwrite_node(fdt, fdtchild,
+							     fdto, fdtochild);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_prevent_phandle_overwrite - Fixes overlay phandles to not overwrite base phandles
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * Checks recursively if applying fdto overwrites phandle values in the base
+ * dtb. When such a phandle is found, the fdto is changed to use the fdt's
+ * phandle value to not break references in the base.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
+{
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
+		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
+		if (target < 0)
+			return target;
+
+		ret = overlay_prevent_phandle_overwrite_node(fdt, target,
+							     fdto, overlay);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * overlay_apply_node - Merges a node into the base device tree
  * @fdt: Base Device Tree blob
@@ -802,18 +1045,26 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
+	/* Increase all phandles in the fdto by delta */
 	ret = overlay_adjust_local_phandles(fdto, delta);
 	if (ret)
 		goto err;
 
+	/* Adapt the phandle values in fdto to the above increase */
 	ret = overlay_update_local_references(fdto, delta);
 	if (ret)
 		goto err;
 
+	/* Update fdto's phandles using symbols from fdt */
 	ret = overlay_fixup_phandles(fdt, fdto);
 	if (ret)
 		goto err;
 
+	/* Don't overwrite phandles in fdt */
+	ret = overlay_prevent_phandle_overwrite(fdt, fdto);
+	if (ret)
+		goto err;
+
 	ret = overlay_merge(fdt, fdto);
 	if (ret)
 		goto err;
diff --git a/tests/overlay_base_phandle.dts b/tests/overlay_base_phandle.dts
new file mode 100644
index 000000000000..20639a7f4026
--- /dev/null
+++ b/tests/overlay_base_phandle.dts
@@ -0,0 +1,21 @@
+/*
+ * Copyright (c) 2024 Uwe Kleine-König
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	node_a: a {
+		value = <17>;
+	};
+
+	node_b: b {
+		a = <&node_a>;
+	};
+
+	node_d: d {
+		b = <&node_b>;
+	};
+};
diff --git a/tests/overlay_overlay_phandle.dts b/tests/overlay_overlay_phandle.dts
new file mode 100644
index 000000000000..a0fa668faa5c
--- /dev/null
+++ b/tests/overlay_overlay_phandle.dts
@@ -0,0 +1,34 @@
+/*
+ * Copyright (c) 2024 Uwe Kleine-König
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	/*
+	 * /b already has a label "node_b" in the base dts, also b is already
+	 * referenced in the base, so both the base's b and this b have a
+	 * phandle value.
+	 */
+	node_b2: b {
+		value = <42>;
+		d = <&node_d>;
+	};
+
+	node_c: c {
+		value = <23>;
+		b = <&node_b2>;
+	};
+
+	d {
+		a = <&node_a>;
+		c = <&node_c>;
+	};
+};
+
+&node_a {
+	value = <32>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 3225a12bbb06..f13cdb216d2b 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1040,6 +1040,34 @@ fdtoverlay_tests() {
     run_dtc_test -@ -I dts -O dtb -o $stacked_addlabeldtb $stacked_addlabel
 
     run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addlabeldtb} ${stacked_bardtb} ${stacked_bazdtb}
+
+    # verify that phandles are not overwritten
+    run_dtc_test -@ -I dts -O dtb -o overlay_base_phandle.test.dtb "$SRCDIR/overlay_base_phandle.dts"
+    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb "$SRCDIR/overlay_overlay_phandle.dts"
+    run_wrap_test $FDTOVERLAY -i overlay_base_phandle.test.dtb -o overlay_base_phandleO.test.dtb overlay_overlay_phandle.test.dtb
+
+    pa=$($DTGET overlay_base_phandleO.test.dtb /a phandle)
+    pb=$($DTGET overlay_base_phandleO.test.dtb /b phandle)
+    pc=$($DTGET overlay_base_phandleO.test.dtb /c phandle)
+    pd=$($DTGET overlay_base_phandleO.test.dtb /d phandle)
+    ba=$($DTGET overlay_base_phandleO.test.dtb /b a)
+    bd=$($DTGET overlay_base_phandleO.test.dtb /b d)
+    cb=$($DTGET overlay_base_phandleO.test.dtb /c b)
+    da=$($DTGET overlay_base_phandleO.test.dtb /d a)
+    db=$($DTGET overlay_base_phandleO.test.dtb /d b)
+    dc=$($DTGET overlay_base_phandleO.test.dtb /d c)
+
+    shorten_echo "check phandle to noda a wasn't overwritten:	"
+    run_wrap_test test "$ba-$da" = "$pa-$pa"
+
+    shorten_echo "check phandle to noda b wasn't overwritten:	"
+    run_wrap_test test "$cb-$db" = "$pb-$pb"
+
+    shorten_echo "check phandle to noda c wasn't overwritten:	"
+    run_wrap_test test "$dc" = "$pc"
+
+    shorten_echo "check phandle to noda d wasn't overwritten:	"
+    run_wrap_test test "$bd" = "$pd"
 }
 
 pylibfdt_tests () {

base-commit: 24f60011fd43683d8e3916435c4c726e9baac9c9
-- 
2.43.0

