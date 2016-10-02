From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 5/6] libfdt: Sync fdt_for_each_subnode() with upstream
Date: Sun,  2 Oct 2016 17:59:29 -0600
Message-ID: <1475452771-16230-6-git-send-email-sjg@chromium.org>
References: <1475452771-16230-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bpYCT2Qj/agnqssJruETjtX0pvk2nk/zUfQZlBHIYb8=;
        b=A8sswuU2xDCvYjn8YIVB1XifSW7hghoYTfhcQaIrEv0ww9GDS49oXB792zPuBPIlie
         euWnPNh7BeeS6kTxuql8VYxCwHBGlLbFvWll0Ybm9HtXkTMOXanm1FHEsKuvVmqUKLn1
         4soLXo3+REGH4zL2Th6bV8Apf8nWuHhc3K/Vw1jybF2D60jdnDh9ZaaBhthqo+U9NSP4
         tQc5kxN/1zT0COSfv2uqUF2hRMFaz9mDWvPnylCNBKhmUg2MXIZqhOSI+QWyed6BlzPx
         YUSeOcudVNEO4gFeGFUJFEUHI2PbcIFXPj3eFjpleEjAjYK06k3gJ8mxJ7G4rkO9wVgn
         Z26Q==
In-Reply-To: <1475452771-16230-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrej Rosano <andrej-6l9oX9VzF44FueaiHvvTSg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The signature for this macro has changed. Bring in the upstream version and
adjust U-Boot's usages to suit.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 arch/arm/mach-tegra/xusb-padctl-common.c |  4 ++--
 common/image-fit.c                       |  2 +-
 common/image-sig.c                       |  8 ++++----
 drivers/net/cpsw.c                       |  2 +-
 drivers/net/keystone_net.c               |  4 ++--
 drivers/net/mvpp2.c                      |  2 +-
 drivers/pci/pci_tegra.c                  |  2 +-
 drivers/phy/marvell/comphy_core.c        |  2 +-
 drivers/pinctrl/meson/pinctrl-meson.c    |  2 +-
 drivers/spi/fsl_qspi.c                   |  2 +-
 include/libfdt.h                         | 25 ++++++++++++++-----------
 lib/fdtdec.c                             |  2 +-
 lib/libfdt/fdt_overlay.c                 |  8 ++++----
 13 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/arch/arm/mach-tegra/xusb-padctl-common.c b/arch/arm/mach-tegra/xusb-padctl-common.c
index 6867065..dfbc8ef 100644
--- a/arch/arm/mach-tegra/xusb-padctl-common.c
+++ b/arch/arm/mach-tegra/xusb-padctl-common.c
@@ -223,7 +223,7 @@ tegra_xusb_padctl_config_parse_dt(struct tegra_xusb_padctl *padctl,
 
 	config->name = fdt_get_name(fdt, node, NULL);
 
-	fdt_for_each_subnode(fdt, subnode, node) {
+	fdt_for_each_subnode(subnode, fdt, node) {
 		struct tegra_xusb_padctl_group *group;
 		int err;
 
@@ -253,7 +253,7 @@ static int tegra_xusb_padctl_parse_dt(struct tegra_xusb_padctl *padctl,
 		return err;
 	}
 
-	fdt_for_each_subnode(fdt, subnode, node) {
+	fdt_for_each_subnode(subnode, fdt, node) {
 		struct tegra_xusb_padctl_config *config = &padctl->config;
 
 		err = tegra_xusb_padctl_config_parse_dt(padctl, config, fdt,
diff --git a/common/image-fit.c b/common/image-fit.c
index d67678a..77dc011 100644
--- a/common/image-fit.c
+++ b/common/image-fit.c
@@ -1026,7 +1026,7 @@ int fit_image_verify(const void *fit, int image_noffset)
 	}
 
 	/* Process all hash subnodes of the component image node */
-	fdt_for_each_subnode(fit, noffset, image_noffset) {
+	fdt_for_each_subnode(noffset, fit, image_noffset) {
 		const char *name = fit_get_name(fit, noffset, NULL);
 
 		/*
diff --git a/common/image-sig.c b/common/image-sig.c
index eda5e13..28f7a20 100644
--- a/common/image-sig.c
+++ b/common/image-sig.c
@@ -212,7 +212,7 @@ static int fit_image_verify_sig(const void *fit, int image_noffset,
 	int ret;
 
 	/* Process all hash subnodes of the component image node */
-	fdt_for_each_subnode(fit, noffset, image_noffset) {
+	fdt_for_each_subnode(noffset, fit, image_noffset) {
 		const char *name = fit_get_name(fit, noffset, NULL);
 
 		if (!strncmp(name, FIT_SIG_NODENAME,
@@ -260,7 +260,7 @@ int fit_image_verify_required_sigs(const void *fit, int image_noffset,
 		return 0;
 	}
 
-	fdt_for_each_subnode(sig_blob, noffset, sig_node) {
+	fdt_for_each_subnode(noffset, sig_blob, sig_node) {
 		const char *required;
 		int ret;
 
@@ -393,7 +393,7 @@ static int fit_config_verify_sig(const void *fit, int conf_noffset,
 	int ret;
 
 	/* Process all hash subnodes of the component conf node */
-	fdt_for_each_subnode(fit, noffset, conf_noffset) {
+	fdt_for_each_subnode(noffset, fit, conf_noffset) {
 		const char *name = fit_get_name(fit, noffset, NULL);
 
 		if (!strncmp(name, FIT_SIG_NODENAME,
@@ -438,7 +438,7 @@ int fit_config_verify_required_sigs(const void *fit, int conf_noffset,
 		return 0;
 	}
 
-	fdt_for_each_subnode(sig_blob, noffset, sig_node) {
+	fdt_for_each_subnode(noffset, sig_blob, sig_node) {
 		const char *required;
 		int ret;
 
diff --git a/drivers/net/cpsw.c b/drivers/net/cpsw.c
index d17505e..c3018fb 100644
--- a/drivers/net/cpsw.c
+++ b/drivers/net/cpsw.c
@@ -1219,7 +1219,7 @@ static int cpsw_eth_ofdata_to_platdata(struct udevice *dev)
 	active_slave = fdtdec_get_int(fdt, node, "active_slave", 0);
 	priv->data.active_slave = active_slave;
 
-	fdt_for_each_subnode(fdt, subnode, node) {
+	fdt_for_each_subnode(subnode, fdt, node) {
 		int len;
 		const char *name;
 
diff --git a/drivers/net/keystone_net.c b/drivers/net/keystone_net.c
index e41b7d1..f88d83e 100644
--- a/drivers/net/keystone_net.c
+++ b/drivers/net/keystone_net.c
@@ -990,7 +990,7 @@ static int ks2_eth_bind_slaves(struct udevice *dev, int gbe, int *gbe_0)
 	char *slave_name;
 
 	interfaces = fdt_subnode_offset(fdt, gbe, "interfaces");
-	fdt_for_each_subnode(fdt, slave, interfaces) {
+	fdt_for_each_subnode(slave, fdt, interfaces) {
 		int slave_no;
 
 		slave_no = fdtdec_get_int(fdt, slave, "slave-port", -ENOENT);
@@ -1015,7 +1015,7 @@ static int ks2_eth_bind_slaves(struct udevice *dev, int gbe, int *gbe_0)
 	}
 
 	sec_slave = fdt_subnode_offset(fdt, gbe, "secondary-slave-ports");
-	fdt_for_each_subnode(fdt, slave, sec_slave) {
+	fdt_for_each_subnode(slave, fdt, sec_slave) {
 		int slave_no;
 
 		slave_no = fdtdec_get_int(fdt, slave, "slave-port", -ENOENT);
diff --git a/drivers/net/mvpp2.c b/drivers/net/mvpp2.c
index 340b85a..405776a 100644
--- a/drivers/net/mvpp2.c
+++ b/drivers/net/mvpp2.c
@@ -4153,7 +4153,7 @@ static int mvpp2_base_bind(struct udevice *parent)
 		return -ENOENT;
 	}
 
-	fdt_for_each_subnode(blob, subnode, node) {
+	fdt_for_each_subnode(subnode, blob, node) {
 		/* Skip disabled ports */
 		if (!fdtdec_get_is_enabled(blob, subnode))
 			continue;
diff --git a/drivers/pci/pci_tegra.c b/drivers/pci/pci_tegra.c
index ea8adb98..430270e 100644
--- a/drivers/pci/pci_tegra.c
+++ b/drivers/pci/pci_tegra.c
@@ -531,7 +531,7 @@ static int tegra_pcie_parse_dt(const void *fdt, int node, enum tegra_pci_id id,
 	}
 #endif
 
-	fdt_for_each_subnode(fdt, subnode, node) {
+	fdt_for_each_subnode(subnode, fdt, node) {
 		unsigned int index = 0, num_lanes = 0;
 		struct tegra_pcie_port *port;
 
diff --git a/drivers/phy/marvell/comphy_core.c b/drivers/phy/marvell/comphy_core.c
index 344df3b..651397d 100644
--- a/drivers/phy/marvell/comphy_core.c
+++ b/drivers/phy/marvell/comphy_core.c
@@ -152,7 +152,7 @@ static int comphy_probe(struct udevice *dev)
 	}
 
 	lane = 0;
-	fdt_for_each_subnode(blob, subnode, node) {
+	fdt_for_each_subnode(subnode, blob, node) {
 		/* Skip disabled ports */
 		if (!fdtdec_get_is_enabled(blob, subnode))
 			continue;
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 46470ea..30f7cfc 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -154,7 +154,7 @@ int meson_pinctrl_probe(struct udevice *dev)
 		return -EINVAL;
 	}
 
-	fdt_for_each_subnode(gd->fdt_blob, node, dev->of_offset) {
+	fdt_for_each_subnode(node, gd->fdt_blob, dev->of_offset) {
 		if (fdt_getprop(gd->fdt_blob, node, "gpio-controller", &len)) {
 			gpio = node;
 			break;
diff --git a/drivers/spi/fsl_qspi.c b/drivers/spi/fsl_qspi.c
index 2144fca..4a146ba 100644
--- a/drivers/spi/fsl_qspi.c
+++ b/drivers/spi/fsl_qspi.c
@@ -1092,7 +1092,7 @@ static int fsl_qspi_ofdata_to_platdata(struct udevice *bus)
 	}
 
 	/* Count flash numbers */
-	fdt_for_each_subnode(blob, subnode, node)
+	fdt_for_each_subnode(subnode, blob, node)
 		++flash_num;
 
 	if (flash_num == 0) {
diff --git a/include/libfdt.h b/include/libfdt.h
index f3b61c9..398748c 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -176,24 +176,27 @@ int fdt_next_subnode(const void *fdt, int offset);
 /**
  * fdt_for_each_subnode - iterate over all subnodes of a parent
  *
+ * @node:	child node (int, lvalue)
+ * @fdt:	FDT blob (const void *)
+ * @parent:	parent node (int)
+ *
  * This is actually a wrapper around a for loop and would be used like so:
  *
- *	fdt_for_each_subnode(fdt, node, parent) {
- *		...
- *		use node
+ *	fdt_for_each_subnode(node, fdt, parent) {
+ *		Use node
  *		...
  *	}
  *
- * Note that this is implemented as a macro and node is used as iterator in
- * the loop. It should therefore be a locally allocated variable. The parent
- * variable on the other hand is never modified, so it can be constant or
- * even a literal.
+ *	if ((node < 0) && (node != -FDT_ERR_NOT_FOUND)) {
+ *		Error handling
+ *	}
+ *
+ * Note that this is implemented as a macro and @node is used as
+ * iterator in the loop. The parent variable be constant or even a
+ * literal.
  *
- * @fdt:	FDT blob (const void *)
- * @node:	child node (int)
- * @parent:	parent node (int)
  */
-#define fdt_for_each_subnode(fdt, node, parent)		\
+#define fdt_for_each_subnode(node, fdt, parent)		\
 	for (node = fdt_first_subnode(fdt, parent);	\
 	     node >= 0;					\
 	     node = fdt_next_subnode(fdt, node))
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index adc9975..4e619c4 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -836,7 +836,7 @@ int fdtdec_get_child_count(const void *blob, int node)
 	int subnode;
 	int num = 0;
 
-	fdt_for_each_subnode(blob, subnode, node)
+	fdt_for_each_subnode(subnode, blob, node)
 		num++;
 
 	return num;
diff --git a/lib/libfdt/fdt_overlay.c b/lib/libfdt/fdt_overlay.c
index 40b6d27..d35ceac 100644
--- a/lib/libfdt/fdt_overlay.c
+++ b/lib/libfdt/fdt_overlay.c
@@ -146,7 +146,7 @@ static int overlay_adjust_node_phandles(void *fdto, int node,
 	if (!found && !ret)
 		return ret;
 
-	fdt_for_each_subnode(fdto, child, node)
+	fdt_for_each_subnode(child, fdto, node)
 		overlay_adjust_node_phandles(fdto, child, delta);
 
 	return 0;
@@ -248,7 +248,7 @@ static int overlay_update_local_node_references(void *fdto,
 		}
 	}
 
-	fdt_for_each_subnode(fdto, fixup_child, fixup_node) {
+	fdt_for_each_subnode(fixup_child, fdto, fixup_node) {
 		const char *fixup_child_name = fdt_get_name(fdto, fixup_child,
 							    NULL);
 		int tree_child;
@@ -511,7 +511,7 @@ static int overlay_apply_node(void *fdt, int target,
 			return ret;
 	}
 
-	fdt_for_each_subnode(fdto, node, fragment) {
+	fdt_for_each_subnode(node, fdto, fragment) {
 		const char *name = fdt_get_name(fdto, node, NULL);
 		int nnode;
 		int ret;
@@ -550,7 +550,7 @@ static int overlay_merge(void *dt, void *dto)
 {
 	int fragment;
 
-	fdt_for_each_subnode(dto, fragment, 0) {
+	fdt_for_each_subnode(fragment, dto, 0) {
 		int overlay;
 		int target;
 		int ret;
-- 
2.8.0.rc3.226.g39d4020
