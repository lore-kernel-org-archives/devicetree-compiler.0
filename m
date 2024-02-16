Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF91E86B
	for <devicetree-compiler@vger.kernel.org>; Fri, 16 Feb 2024 18:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708107590; cv=none; b=pi0icJ6e88sCPOdUOErLxLlm1hGjUQjMPDtm/mj4z86WhNVPXzDZppOq2pzDVYItYxo8ESgD1v7z6+7aQHQXD/p3osJCl7U/zoZ1GpnVpaAWHo+Y0yxC3OUcJjfkCnuNI1EoXra+sVjOi+lQu21VHC2Ln7nvMYri2l89sFgtKzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708107590; c=relaxed/simple;
	bh=O83VMDUBwHSq/of22iVOghNySlWG945IU2C+voWnfRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LiOdfh8yuTDpGCWKQGyaNp3obdGVpOUxiH3hG5qIvjcdgb9Zn1sicZp4tXShPRngVn2+6rUD4JlSU/wzTdA/23V/oznPHnvBkfglCLZHOSPsjxgYt4xre/hqcFTC41P9k0lmWiVmEGmVHtnEhCficOjaQS86pJCg9ZN6LKAm9lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rb2o6-0003qy-01; Fri, 16 Feb 2024 19:19:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rb2o4-0017mJ-Un; Fri, 16 Feb 2024 19:19:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rb2o4-006DBO-2n;
	Fri, 16 Feb 2024 19:19:28 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org,
	entwicklung@pengutronix.de
Subject: [PATCH v2] libfdt: overlay: ensure that existing phandles are not overwritten
Date: Fri, 16 Feb 2024 19:19:20 +0100
Message-ID: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11203; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=O83VMDUBwHSq/of22iVOghNySlWG945IU2C+voWnfRk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlz6cnH1Qk83zE3hT2gXy2NX7w/qN9JjDLxujKy 7Gm+2gjMayJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZc+nJwAKCRCPgPtYfRL+ Tpf1B/0caGORAJ+pu7tz9JCJmyApLc08RAZm5PfDYNPpm5G0pP6LjWLrxW9gX288R/aeHPa9hxZ mf/BJlS6SoC4wDvdQVSgT2iCRY/QG+6bowyaj8L8vqs9pICviorEYCYGRcw0SyhQUdHJqBZm/rf hp/I8gRqtkYul/M33rZnYnhadgcVco4MNLy4GW7IrSqvM2VOXfzTL0oNnxlITWrEiU6okqNS3s+ /BsktreHQdJnaGfQq2ADFO0L4pusQvvHpK4pdltSuOuxxFWA+pS0NALoY7uTD1G+65Ie3YgWWlN qlpD3FmkkGxjF4D6rXvTNoO57ht+rbBa1ptEbmzEiqVD91l1
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

last year I already tried to address the issue of phandle overwriting in
overlays. See
https://lore.kernel.org/all/20230426100231.484497-1-u.kleine-koenig@pengutronix.de

The approach I took back then required allocating a mapping. This isn't
suiteable for libfdt though because it's expected to be embedded in code
that cannot allocate dynamic memory. So here I implement an algorithm
that doesn't allocate memory at the cost of a higher run time because it
iterates over the whole dtbo for each conflict found. But there isn't a
better way to do it without allocating memory.

Best regards
Uwe

 libfdt/fdt_overlay.c              | 230 ++++++++++++++++++++++++++++++
 tests/overlay_base_phandle.dts    |  21 +++
 tests/overlay_overlay_phandle.dts |  30 ++++
 tests/run_tests.sh                |  23 +++
 4 files changed, 304 insertions(+)
 create mode 100644 tests/overlay_base_phandle.dts
 create mode 100644 tests/overlay_overlay_phandle.dts

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 5c0c3981b89d..914acc5b14a6 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -520,6 +520,228 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 	return 0;
 }
 
+static int overlay_adjust_node_conflicting_phandle(void *fdto, int node,
+						   uint32_t fdt_phandle,
+						   uint32_t fdto_phandle)
+{
+	const fdt32_t *php;
+	int len, ret;
+	int child;
+
+	php = fdt_getprop(fdto, node, "phandle", &len);
+	if (php && len == sizeof(*php) && fdt32_to_cpu(*php) == fdto_phandle) {
+		ret = fdt_setprop_inplace_u32(fdto, node, "phandle", fdt_phandle);
+		if (ret)
+			return ret;
+	}
+
+	php = fdt_getprop(fdto, node, "linux,phandle", &len);
+	if (php && len == sizeof(*php) && fdt32_to_cpu(*php) == fdto_phandle) {
+		ret = fdt_setprop_inplace_u32(fdto, node, "linux,phandle", fdt_phandle);
+		if (ret)
+			return ret;
+	}
+
+	fdt_for_each_subnode(child, fdto, node) {
+		ret = overlay_adjust_node_conflicting_phandle(fdto, child,
+							      fdt_phandle, fdto_phandle);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int overlay_adjust_local_conflicting_phandle(void *fdto,
+						    uint32_t fdt_phandle,
+						    uint32_t fdto_phandle)
+{
+	return overlay_adjust_node_conflicting_phandle(fdto, 0, fdt_phandle,
+						       fdto_phandle);
+}
+
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
+
+		const fdt32_t *fixup_val;
+                const char *tree_val;
+                const char *name;
+                int fixup_len;
+                int tree_len;
+                int i;
+
+                fixup_val = fdt_getprop_by_offset(fdto, fixup_prop,
+                                                  &name, &fixup_len);
+                if (!fixup_val)
+                        return fixup_len;
+
+                if (fixup_len % sizeof(uint32_t))
+                        return -FDT_ERR_BADOVERLAY;
+                fixup_len /= sizeof(uint32_t);
+
+                tree_val = fdt_getprop(fdto, tree_node, name, &tree_len);
+                if (!tree_val) {
+                        if (tree_len == -FDT_ERR_NOTFOUND)
+                                return -FDT_ERR_BADOVERLAY;
+
+                        return tree_len;
+                }
+
+		for (i = 0; i < fixup_len; i++) {
+			fdt32_t adj_val;
+			uint32_t poffset;
+
+			poffset = fdt32_to_cpu(fixup_val[i]);
+
+			/*
+			 * phandles to fixup can be unaligned.
+			 *
+			 * Use a memcpy for the architectures that do
+			 * not support unaligned accesses.
+			 */
+			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));
+
+			if (fdt32_to_cpu(adj_val) == fdto_phandle) {
+
+				adj_val = cpu_to_fdt32(fdt_phandle);
+
+				ret = fdt_setprop_inplace_namelen_partial(fdto,
+									  tree_node,
+									  name,
+									  strlen(name),
+									  poffset,
+									  &adj_val,
+									  sizeof(adj_val));
+				if (ret == -FDT_ERR_NOSPACE)
+					return -FDT_ERR_BADOVERLAY;
+
+				if (ret)
+					return ret;
+			}
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
+                                                      fixup_child,
+                                                      fdt_phandle,
+                                                      fdto_phandle);
+	}
+
+	return 0;
+}
+
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
+		ret = overlay_adjust_local_conflicting_phandle(fdto,
+							       fdt_phandle,
+							       fdto_phandle);
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
@@ -824,18 +1046,26 @@ int fdt_overlay_apply(void *fdt, void *fdto)
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
index 000000000000..36f013c772a2
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
+	node_c: c {
+		b = <&node_b>;
+	};
+};
diff --git a/tests/overlay_overlay_phandle.dts b/tests/overlay_overlay_phandle.dts
new file mode 100644
index 000000000000..218e5266b992
--- /dev/null
+++ b/tests/overlay_overlay_phandle.dts
@@ -0,0 +1,30 @@
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
+	/* /a already has a label "node_a" in the base dts */
+	node_b2: b {
+		value = <42>;
+		c = <&node_c>;
+	};
+
+	c {
+		a = <&node_a>;
+		d = <&node_d>;
+	};
+
+	node_d: d {
+		value = <23>;
+		b = <&node_b2>;
+	};
+};
+
+&node_a {
+	value = <32>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 3225a12bbb06..256472b623a3 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1040,6 +1040,28 @@ fdtoverlay_tests() {
     run_dtc_test -@ -I dts -O dtb -o $stacked_addlabeldtb $stacked_addlabel
 
     run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addlabeldtb} ${stacked_bardtb} ${stacked_bazdtb}
+
+    # verify that labels are not overwritten
+    run_dtc_test -@ -I dts -O dtb -o overlay_base_phandle.test.dtb "$SRCDIR/overlay_base_phandle.dts"
+    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb "$SRCDIR/overlay_overlay_phandle.dts"
+    run_wrap_test $FDTOVERLAY -i overlay_base_phandle.test.dtb -o overlay_base_phandleO.test.dtb overlay_overlay_phandle.test.dtb
+
+    pa=$($DTGET overlay_base_phandleO.test.dtb /a phandle)
+    pb=$($DTGET overlay_base_phandleO.test.dtb /b phandle)
+    pc=$($DTGET overlay_base_phandleO.test.dtb /c phandle)
+    pd=$($DTGET overlay_base_phandleO.test.dtb /d phandle)
+    ba=$($DTGET overlay_base_phandleO.test.dtb /b a)
+    bc=$($DTGET overlay_base_phandleO.test.dtb /b c)
+    ca=$($DTGET overlay_base_phandleO.test.dtb /c a)
+    cb=$($DTGET overlay_base_phandleO.test.dtb /c b)
+    cd=$($DTGET overlay_base_phandleO.test.dtb /c d)
+    db=$($DTGET overlay_base_phandleO.test.dtb /d b)
+    shorten_echo "check phandle wasn't overwritten:	"
+    if test "$ba-$bc-$ca-$cb-$cd-$db" = "$pa-$pc-$pa-$pb-$pd-$pb"; then
+	    PASS
+    else
+	    FAIL
+    fi
 }
 
 pylibfdt_tests () {
-- 
2.43.0

