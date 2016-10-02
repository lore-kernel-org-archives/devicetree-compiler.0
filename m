From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/6] libfdt: Bring in upstream stringlist functions
Date: Sun,  2 Oct 2016 17:59:28 -0600
Message-ID: <1475452771-16230-5-git-send-email-sjg@chromium.org>
References: <1475452771-16230-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qqz20RQvXQq6hklFlSmlYyLR9oBafL8h+wlORtqoa84=;
        b=VvuUZbMyLCSOfwX8otjjFAWQTDgqfxbBLQPksgkrTyTLtkoLaOEghmqzfg/bPOlOrP
         foP5xj8hFhS1QeLgQOQVcFqU5Kgik5yPjM1ZNu1cOx9mwnDoHv0XSdzxQXqpIwP8SEor
         JUpcBOeIEZ5RPkHgQb+7Gmx/AT8RhzZXy7+Hj3A5smr3nvxb/XYu5qKlCPz+LE1J9HPP
         dUcffZIw49Hkd7envgRuV9GCzKUE9+RWET7Agwf6vJ74zvG0sU0ZfpB5hyP71iuBNJ+U
         BuKvfiebyxNMz+RwSUSdI8GCXIcTeb/7IPGiITLrTkeVrjRByskTsX+2PcSEL+dnup4W
         NMUQ==
In-Reply-To: <1475452771-16230-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Minkyu Kang <mk7.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mario.six-2c4SBQpdCik@public.gmane.org" <mario.six-2c4SBQpdCik@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, An

These have now landed upstream. The naming is different and in one case the
function signature has changed. Update the code to match.

This applies the following upstream commits by
Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> :

   604e61e fdt: Add functions to retrieve strings
   8702bd1 fdt: Add a function to get the index of a string
   2218387 fdt: Add a function to count strings

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 arch/arm/mach-tegra/xusb-padctl-common.c |  14 ++---
 arch/arm/mach-uniphier/board_late_init.c |   5 +-
 arch/x86/cpu/irq.c                       |   5 +-
 common/image-fit.c                       |  19 +++---
 common/image.c                           |  19 +++---
 drivers/clk/clk-uclass.c                 |   6 +-
 drivers/core/device.c                    |   2 +-
 drivers/gpio/dwapb_gpio.c                |   3 +-
 drivers/i2c/mxc_i2c.c                    |   2 +-
 drivers/mailbox/mailbox-uclass.c         |   6 +-
 drivers/net/sun8i_emac.c                 |   5 +-
 drivers/pinctrl/exynos/pinctrl-exynos.c  |   9 ++-
 drivers/pinctrl/meson/pinctrl-meson.c    |   2 +-
 drivers/pinctrl/pinctrl-generic.c        |  10 +--
 drivers/pinctrl/pinctrl-uclass.c         |   2 +-
 drivers/reset/reset-uclass.c             |   6 +-
 drivers/video/sunxi_display.c            |   2 +-
 include/libfdt.h                         |  86 +++++++++++++++----------
 lib/fdtdec.c                             |   2 +-
 lib/libfdt/fdt_ro.c                      | 104 +++++++++++++++++++------------
 test/overlay/cmd_ut_overlay.c            |   5 +-
 21 files changed, 179 insertions(+), 135 deletions(-)

diff --git a/arch/arm/mach-tegra/xusb-padctl-common.c b/arch/arm/mach-tegra/xusb-padctl-common.c
index 18ad7bf..6867065 100644
--- a/arch/arm/mach-tegra/xusb-padctl-common.c
+++ b/arch/arm/mach-tegra/xusb-padctl-common.c
@@ -78,11 +78,11 @@ tegra_xusb_padctl_group_parse_dt(struct tegra_xusb_padctl *padctl,
 				 const void *fdt, int node)
 {
 	unsigned int i;
-	int len, err;
+	int len;
 
 	group->name = fdt_get_name(fdt, node, &len);
 
-	len = fdt_count_strings(fdt, node, "nvidia,lanes");
+	len =  fdt_stringlist_count(fdt, node, "nvidia,lanes");
 	if (len < 0) {
 		error("failed to parse \"nvidia,lanes\" property");
 		return -EINVAL;
@@ -91,9 +91,9 @@ tegra_xusb_padctl_group_parse_dt(struct tegra_xusb_padctl *padctl,
 	group->num_pins = len;
 
 	for (i = 0; i < group->num_pins; i++) {
-		err = fdt_get_string_index(fdt, node, "nvidia,lanes", i,
-					   &group->pins[i]);
-		if (err < 0) {
+		group->pins[i] = fdt_stringlist_get(fdt, node, "nvidia,lanes",
+						    i, NULL);
+		if (!group->pins[i]) {
 			error("failed to read string from \"nvidia,lanes\" property");
 			return -EINVAL;
 		}
@@ -101,8 +101,8 @@ tegra_xusb_padctl_group_parse_dt(struct tegra_xusb_padctl *padctl,
 
 	group->num_pins = len;
 
-	err = fdt_get_string(fdt, node, "nvidia,function", &group->func);
-	if (err < 0) {
+	group->func = fdt_stringlist_get(fdt, node, "nvidia,function", 0, NULL);
+	if (!group->func) {
 		error("failed to parse \"nvidia,func\" property");
 		return -EINVAL;
 	}
diff --git a/arch/arm/mach-uniphier/board_late_init.c b/arch/arm/mach-uniphier/board_late_init.c
index a454126..f23295f 100644
--- a/arch/arm/mach-uniphier/board_late_init.c
+++ b/arch/arm/mach-uniphier/board_late_init.c
@@ -37,13 +37,12 @@ static int uniphier_set_fdt_file(void)
 	const char *compat;
 	char dtb_name[256];
 	int buf_len = 256;
-	int ret;
 
 	if (getenv("fdt_file"))
 		return 0;	/* do nothing if it is already set */
 
-	ret = fdt_get_string(gd->fdt_blob, 0, "compatible", &compat);
-	if (ret)
+	compat = fdt_stringlist_get(gd->fdt_blob, 0, "compatible", 0, NULL);
+	if (!compat)
 		return -EINVAL;
 
 	if (strncmp(compat, VENDOR_PREFIX, strlen(VENDOR_PREFIX)))
diff --git a/arch/x86/cpu/irq.c b/arch/x86/cpu/irq.c
index df3cd0a..9364410 100644
--- a/arch/x86/cpu/irq.c
+++ b/arch/x86/cpu/irq.c
@@ -103,11 +103,12 @@ static int create_pirq_routing_table(struct udevice *dev)
 	/* extract the bdf from fdt_pci_addr */
 	priv->bdf = dm_pci_get_bdf(dev->parent);
 
-	ret = fdt_find_string(blob, node, "intel,pirq-config", "pci");
+	ret = fdt_stringlist_search(blob, node, "intel,pirq-config", "pci");
 	if (!ret) {
 		priv->config = PIRQ_VIA_PCI;
 	} else {
-		ret = fdt_find_string(blob, node, "intel,pirq-config", "ibase");
+		ret = fdt_stringlist_search(blob, node, "intel,pirq-config",
+					    "ibase");
 		if (!ret)
 			priv->config = PIRQ_VIA_IBASE;
 		else
diff --git a/common/image-fit.c b/common/image-fit.c
index 1b0234a..d67678a 100644
--- a/common/image-fit.c
+++ b/common/image-fit.c
@@ -1457,7 +1457,7 @@ int fit_conf_get_prop_node(const void *fit, int noffset,
 void fit_conf_print(const void *fit, int noffset, const char *p)
 {
 	char *desc;
-	char *uname;
+	const char *uname;
 	int ret;
 	int loadables_index;
 
@@ -1469,7 +1469,7 @@ void fit_conf_print(const void *fit, int noffset, const char *p)
 	else
 		printf("%s\n", desc);
 
-	uname = (char *)fdt_getprop(fit, noffset, FIT_KERNEL_PROP, NULL);
+	uname = fdt_getprop(fit, noffset, FIT_KERNEL_PROP, NULL);
 	printf("%s  Kernel:       ", p);
 	if (uname == NULL)
 		printf("unavailable\n");
@@ -1477,26 +1477,23 @@ void fit_conf_print(const void *fit, int noffset, const char *p)
 		printf("%s\n", uname);
 
 	/* Optional properties */
-	uname = (char *)fdt_getprop(fit, noffset, FIT_RAMDISK_PROP, NULL);
+	uname = fdt_getprop(fit, noffset, FIT_RAMDISK_PROP, NULL);
 	if (uname)
 		printf("%s  Init Ramdisk: %s\n", p, uname);
 
-	uname = (char *)fdt_getprop(fit, noffset, FIT_FDT_PROP, NULL);
+	uname = fdt_getprop(fit, noffset, FIT_FDT_PROP, NULL);
 	if (uname)
 		printf("%s  FDT:          %s\n", p, uname);
 
-	uname = (char *)fdt_getprop(fit, noffset, FIT_FPGA_PROP, NULL);
+	uname = fdt_getprop(fit, noffset, FIT_FPGA_PROP, NULL);
 	if (uname)
 		printf("%s  FPGA:         %s\n", p, uname);
 
 	/* Print out all of the specified loadables */
 	for (loadables_index = 0;
-	     fdt_get_string_index(fit, noffset,
-			FIT_LOADABLE_PROP,
-			loadables_index,
-			(const char **)&uname) == 0;
-	     loadables_index++)
-	{
+	     uname = fdt_stringlist_get(fit, noffset, FIT_LOADABLE_PROP,
+					loadables_index, NULL), uname;
+	     loadables_index++) {
 		if (loadables_index == 0) {
 			printf("%s  Loadables:    ", p);
 		} else {
diff --git a/common/image.c b/common/image.c
index a5d19ab..6d90781 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1304,7 +1304,7 @@ int boot_get_fpga(int argc, char * const argv[], bootm_headers_t *images,
 	void *buf;
 	int conf_noffset;
 	int fit_img_result;
-	char *uname, *name;
+	const char *uname, *name;
 	int err;
 	int devnum = 0; /* TODO support multi fpga platforms */
 	const fpga_desc * const desc = fpga_get_desc(devnum);
@@ -1331,9 +1331,9 @@ int boot_get_fpga(int argc, char * const argv[], bootm_headers_t *images,
 	case IMAGE_FORMAT_FIT:
 		conf_noffset = fit_conf_get_node(buf, images->fit_uname_cfg);
 
-		err = fdt_get_string_index(buf, conf_noffset, FIT_FPGA_PROP, 0,
-					   (const char **)&uname);
-		if (err < 0) {
+		uname = fdt_stringlist_get(buf, conf_noffset, FIT_FPGA_PROP, 0,
+					   NULL);
+		if (!uname) {
 			debug("## FPGA image is not specified\n");
 			return 0;
 		}
@@ -1403,7 +1403,7 @@ int boot_get_loadable(int argc, char * const argv[], bootm_headers_t *images,
 	int loadables_index;
 	int conf_noffset;
 	int fit_img_result;
-	char *uname;
+	const char *uname;
 
 	/* Check to see if the images struct has a FIT configuration */
 	if (!genimg_has_config(images)) {
@@ -1427,15 +1427,14 @@ int boot_get_loadable(int argc, char * const argv[], bootm_headers_t *images,
 		conf_noffset = fit_conf_get_node(buf, images->fit_uname_cfg);
 
 		for (loadables_index = 0;
-		     fdt_get_string_index(buf, conf_noffset,
-				FIT_LOADABLE_PROP,
-				loadables_index,
-				(const char **)&uname) == 0;
+		     uname = fdt_stringlist_get(buf, conf_noffset,
+					FIT_LOADABLE_PROP, loadables_index,
+					NULL), uname;
 		     loadables_index++)
 		{
 			fit_img_result = fit_image_load(images,
 				tmp_img_addr,
-				(const char **)&uname,
+				&uname,
 				&(images->fit_uname_cfg), arch,
 				IH_TYPE_LOADABLE,
 				BOOTSTAGE_ID_FIT_LOADABLE_START,
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 4d78e3f..c42fff6 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -101,10 +101,10 @@ int clk_get_by_name(struct udevice *dev, const char *name, struct clk *clk)
 
 	debug("%s(dev=%p, name=%s, clk=%p)\n", __func__, dev, name, clk);
 
-	index = fdt_find_string(gd->fdt_blob, dev->of_offset, "clock-names",
-				name);
+	index = fdt_stringlist_search(gd->fdt_blob, dev->of_offset,
+				      "clock-names", name);
 	if (index < 0) {
-		debug("fdt_find_string() failed: %d\n", index);
+		debug("fdt_stringlist_search() failed: %d\n", index);
 		return index;
 	}
 
diff --git a/drivers/core/device.c b/drivers/core/device.c
index b737f1c..1935b8d 100644
--- a/drivers/core/device.c
+++ b/drivers/core/device.c
@@ -698,7 +698,7 @@ fdt_addr_t dev_get_addr_name(struct udevice *dev, const char *name)
 #if CONFIG_IS_ENABLED(OF_CONTROL)
 	int index;
 
-	index = fdt_find_string(gd->fdt_blob, dev->of_offset, "reg-names",
+	index = fdt_stringlist_search(gd->fdt_blob, dev->of_offset, "reg-names",
 				name);
 	if (index < 0)
 		return index;
diff --git a/drivers/gpio/dwapb_gpio.c b/drivers/gpio/dwapb_gpio.c
index 72cec48..471e18a 100644
--- a/drivers/gpio/dwapb_gpio.c
+++ b/drivers/gpio/dwapb_gpio.c
@@ -132,7 +132,8 @@ static int gpio_dwapb_bind(struct udevice *dev)
 		plat->base = base;
 		plat->bank = bank;
 		plat->pins = fdtdec_get_int(blob, node, "snps,nr-gpios", 0);
-		ret = fdt_get_string(blob, node, "bank-name", &plat->name);
+		plat->name = fdt_stringlist_get(blob, node, "bank-name", 0,
+						NULL);
 		if (ret)
 			goto err;
 
diff --git a/drivers/i2c/mxc_i2c.c b/drivers/i2c/mxc_i2c.c
index a26f44e..6247d33 100644
--- a/drivers/i2c/mxc_i2c.c
+++ b/drivers/i2c/mxc_i2c.c
@@ -773,7 +773,7 @@ static int mxc_i2c_probe(struct udevice *bus)
 	 * See Documentation/devicetree/bindings/i2c/i2c-imx.txt
 	 * Use gpio to force bus idle when necessary.
 	 */
-	ret = fdt_find_string(fdt, node, "pinctrl-names", "gpio");
+	ret = fdt_stringlist_search(fdt, node, "pinctrl-names", "gpio");
 	if (ret < 0) {
 		dev_info(dev, "i2c bus %d at %lu, no gpio pinctrl state.\n", bus->seq, i2c_bus->base);
 	} else {
diff --git a/drivers/mailbox/mailbox-uclass.c b/drivers/mailbox/mailbox-uclass.c
index 40f851d..a7fcde5 100644
--- a/drivers/mailbox/mailbox-uclass.c
+++ b/drivers/mailbox/mailbox-uclass.c
@@ -85,10 +85,10 @@ int mbox_get_by_name(struct udevice *dev, const char *name,
 
 	debug("%s(dev=%p, name=%s, chan=%p)\n", __func__, dev, name, chan);
 
-	index = fdt_find_string(gd->fdt_blob, dev->of_offset, "mbox-names",
-				name);
+	index = fdt_stringlist_search(gd->fdt_blob, dev->of_offset,
+				      "mbox-names", name);
 	if (index < 0) {
-		debug("fdt_find_string() failed: %d\n", index);
+		debug("fdt_stringlist_search() failed: %d\n", index);
 		return index;
 	}
 
diff --git a/drivers/net/sun8i_emac.c b/drivers/net/sun8i_emac.c
index 4c149e1..91570a2 100644
--- a/drivers/net/sun8i_emac.c
+++ b/drivers/net/sun8i_emac.c
@@ -456,8 +456,9 @@ static int parse_phy_pins(struct udevice *dev)
 	for (i = 0; ; i++) {
 		int pin;
 
-		if (fdt_get_string_index(gd->fdt_blob, offset,
-					 "allwinner,pins", i, &pin_name))
+		pin_name = fdt_stringlist_get(gd->fdt_blob, offset,
+					 "allwinner,pins", i, NULL);
+		if (!pin_name)
 			break;
 		if (pin_name[0] != 'P')
 			continue;
diff --git a/drivers/pinctrl/exynos/pinctrl-exynos.c b/drivers/pinctrl/exynos/pinctrl-exynos.c
index a28405f..c9c13e6 100644
--- a/drivers/pinctrl/exynos/pinctrl-exynos.c
+++ b/drivers/pinctrl/exynos/pinctrl-exynos.c
@@ -71,7 +71,7 @@ int exynos_pinctrl_set_state(struct udevice *dev, struct udevice *config)
 {
 	const void *fdt = gd->fdt_blob;
 	int node = config->of_offset;
-	unsigned int count, idx, pin_num, ret;
+	unsigned int count, idx, pin_num;
 	unsigned int pinfunc, pinpud, pindrv;
 	unsigned long reg, value;
 	const char *name;
@@ -80,7 +80,7 @@ int exynos_pinctrl_set_state(struct udevice *dev, struct udevice *config)
 	 * refer to the following document for the pinctrl bindings
 	 * linux/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
 	 */
-	count = fdt_count_strings(fdt, node, "samsung,pins");
+	count =  fdt_stringlist_count(fdt, node, "samsung,pins");
 	if (count <= 0)
 		return -EINVAL;
 
@@ -89,9 +89,8 @@ int exynos_pinctrl_set_state(struct udevice *dev, struct udevice *config)
 	pindrv = fdtdec_get_int(fdt, node, "samsung,pin-drv", -1);
 
 	for (idx = 0; idx < count; idx++) {
-		ret = fdt_get_string_index(fdt, node, "samsung,pins",
-						idx, &name);
-		if (ret < 0)
+		name = fdt_stringlist_get(fdt, node, "samsung,pins", idx, NULL);
+		if (!name)
 			continue;
 		reg = pin_to_bank_base(dev, name, &pin_num);
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index d21a3dd..46470ea 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -122,7 +122,7 @@ static fdt_addr_t parse_address(int offset, const char *name, int na, int ns)
 	int index, len = 0;
 	const fdt32_t *reg;
 
-	index = fdt_find_string(gd->fdt_blob, offset, "reg-names", name);
+	index = fdt_stringlist_search(gd->fdt_blob, offset, "reg-names", name);
 	if (index < 0)
 		return FDT_ADDR_T_NONE;
 
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index baff40f..482db29 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -306,11 +306,11 @@ static int pinctrl_generic_set_state_subnode(struct udevice *dev,
 	const char *name;
 	int strings_count, selector, i, ret;
 
-	strings_count = fdt_count_strings(fdt, node, subnode_target_type);
+	strings_count =  fdt_stringlist_count(fdt, node, subnode_target_type);
 	if (strings_count < 0) {
 		subnode_target_type = "groups";
 		is_group = true;
-		strings_count = fdt_count_strings(fdt, node,
+		strings_count =  fdt_stringlist_count(fdt, node,
 						  subnode_target_type);
 		if (strings_count < 0) {
 			/* skip this node; may contain config child nodes */
@@ -319,9 +319,9 @@ static int pinctrl_generic_set_state_subnode(struct udevice *dev,
 	}
 
 	for (i = 0; i < strings_count; i++) {
-		ret = fdt_get_string_index(fdt, node, subnode_target_type,
-					   i, &name);
-		if (ret < 0)
+		name = fdt_stringlist_get(fdt, node, subnode_target_type, i,
+					  NULL);
+		if (!name)
 			return -EINVAL;
 
 		if (is_group)
diff --git a/drivers/pinctrl/pinctrl-uclass.c b/drivers/pinctrl/pinctrl-uclass.c
index 7397de2..02ab9b4 100644
--- a/drivers/pinctrl/pinctrl-uclass.c
+++ b/drivers/pinctrl/pinctrl-uclass.c
@@ -72,7 +72,7 @@ static int pinctrl_select_state_full(struct udevice *dev, const char *statename)
 	struct udevice *config;
 	int state, size, i, ret;
 
-	state = fdt_find_string(fdt, node, "pinctrl-names", statename);
+	state = fdt_stringlist_search(fdt, node, "pinctrl-names", statename);
 	if (state < 0) {
 		char *end;
 		/*
diff --git a/drivers/reset/reset-uclass.c b/drivers/reset/reset-uclass.c
index edaecfb..d3744ef 100644
--- a/drivers/reset/reset-uclass.c
+++ b/drivers/reset/reset-uclass.c
@@ -88,10 +88,10 @@ int reset_get_by_name(struct udevice *dev, const char *name,
 	debug("%s(dev=%p, name=%s, reset_ctl=%p)\n", __func__, dev, name,
 	      reset_ctl);
 
-	index = fdt_find_string(gd->fdt_blob, dev->of_offset, "reset-names",
-				name);
+	index = fdt_stringlist_search(gd->fdt_blob, dev->of_offset,
+				      "reset-names", name);
 	if (index < 0) {
-		debug("fdt_find_string() failed: %d\n", index);
+		debug("fdt_stringlist_search() failed: %d\n", index);
 		return index;
 	}
 
diff --git a/drivers/video/sunxi_display.c b/drivers/video/sunxi_display.c
index 50b16a9..6cba1b9 100644
--- a/drivers/video/sunxi_display.c
+++ b/drivers/video/sunxi_display.c
@@ -1562,7 +1562,7 @@ int sunxi_simplefb_setup(void *blob)
 	offset = fdt_node_offset_by_compatible(blob, -1,
 					       "allwinner,simple-framebuffer");
 	while (offset >= 0) {
-		ret = fdt_find_string(blob, offset, "allwinner,pipeline",
+		ret = fdt_stringlist_search(blob, offset, "allwinner,pipeline",
 				      pipeline);
 		if (ret == 0)
 			break;
diff --git a/include/libfdt.h b/include/libfdt.h
index 3b1c788..f3b61c9 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -121,12 +121,17 @@
 	/* FDT_ERR_BADNCELLS: Device tree has a #address-cells, #size-cells
 	 * or similar property with a bad format or value */
 
-#define FDT_ERR_TOODEEP		15
+#define FDT_ERR_BADVALUE	15
+	/* FDT_ERR_BADVALUE: Device tree has a property with an unexpected
+	 * value. For example: a property expected to contain a string list
+	 * is not NUL-terminated within the length of its value. */
+
+#define FDT_ERR_TOODEEP		16
 	/* FDT_ERR_TOODEEP: The depth of a node has exceeded the internal
 	 * libfdt limit. This can happen if you have more than
 	 * FDT_MAX_DEPTH nested nodes. */
 
-#define FDT_ERR_MAX		15
+#define FDT_ERR_MAX		16
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
@@ -957,51 +962,66 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
 int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
 
 /**
- * fdt_count_strings - count the number of strings in a string list
+ * fdt_stringlist_count - count the number of strings in a string list
  * @fdt: pointer to the device tree blob
- * @node: offset of the node
+ * @nodeoffset: offset of a tree node
  * @property: name of the property containing the string list
- * @return: the number of strings in the given property
+ * @return:
+ *   the number of strings in the given property
+ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *   -FDT_ERR_NOTFOUND if the property does not exist
  */
-int fdt_count_strings(const void *fdt, int node, const char *property);
+int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property);
 
 /**
- * fdt_find_string - find a string in a string list and return its index
+ * fdt_stringlist_search - find a string in a string list and return its index
  * @fdt: pointer to the device tree blob
- * @node: offset of the node
+ * @nodeoffset: offset of a tree node
  * @property: name of the property containing the string list
  * @string: string to look up in the string list
- * @return: the index of the string or negative on error
+ *
+ * Note that it is possible for this function to succeed on property values
+ * that are not NUL-terminated. That's because the function will stop after
+ * finding the first occurrence of @string. This can for example happen with
+ * small-valued cell properties, such as #address-cells, when searching for
+ * the empty string.
+ *
+ * @return:
+ *   the index of the string in the list of strings
+ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *   -FDT_ERR_NOTFOUND if the property does not exist or does not contain
+ *                     the given string
  */
-int fdt_find_string(const void *fdt, int node, const char *property,
-		    const char *string);
+int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
+			  const char *string);
 
 /**
- * fdt_get_string_index() - obtain the string at a given index in a string list
+ * fdt_stringlist_get() - obtain the string at a given index in a string list
  * @fdt: pointer to the device tree blob
- * @node: offset of the node
+ * @nodeoffset: offset of a tree node
  * @property: name of the property containing the string list
  * @index: index of the string to return
- * @output: return location for the string
- * @return: 0 if the string was found or a negative error code otherwise
- */
-int fdt_get_string_index(const void *fdt, int node, const char *property,
-			 int index, const char **output);
-
-/**
- * fdt_get_string() - obtain the first string in a string list
- * @fdt: pointer to the device tree blob
- * @node: offset of the node
- * @property: name of the property containing the string list
- * @output: return location for the string
- * @return: 0 if the string was found or a negative error code otherwise
- *
- * This is a shortcut for:
- *
- *	fdt_get_string_index(fdt, node, property, 0, output).
- */
-int fdt_get_string(const void *fdt, int node, const char *property,
-		   const char **output);
+ * @lenp: return location for the string length or an error code on failure
+ *
+ * Note that this will successfully extract strings from properties with
+ * non-NUL-terminated values. For example on small-valued cell properties
+ * this function will return the empty string.
+ *
+ * If non-NULL, the length of the string (on success) or a negative error-code
+ * (on failure) will be stored in the integer pointer to by lenp.
+ *
+ * @return:
+ *   A pointer to the string at the given index in the string list or NULL on
+ *   failure. On success the length of the string will be stored in the memory
+ *   location pointed to by the lenp parameter, if non-NULL. On failure one of
+ *   the following negative error codes will be returned in the lenp parameter
+ *   (if non-NULL):
+ *     -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *     -FDT_ERR_NOTFOUND if the property does not exist
+ */
+const char *fdt_stringlist_get(const void *fdt, int nodeoffset,
+			       const char *property, int index,
+			       int *lenp);
 
 /**********************************************************************/
 /* Read-only functions (addressing related)                           */
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 4defb90..adc9975 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -1014,7 +1014,7 @@ int fdt_get_named_resource(const void *fdt, int node, const char *property,
 {
 	int index;
 
-	index = fdt_find_string(fdt, node, prop_names, name);
+	index = fdt_stringlist_search(fdt, node, prop_names, name);
 	if (index < 0)
 		return index;
 
diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
index 005f267..e38aaa4 100644
--- a/lib/libfdt/fdt_ro.c
+++ b/lib/libfdt/fdt_ro.c
@@ -538,80 +538,104 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str)
 	return 0;
 }
 
-int fdt_count_strings(const void *fdt, int node, const char *property)
+int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property)
 {
-	int length, i, count = 0;
-	const char *list;
+	const char *list, *end;
+	int length, count = 0;
 
-	list = fdt_getprop(fdt, node, property, &length);
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
 	if (!list)
-		return length;
+		return -length;
+
+	end = list + length;
+
+	while (list < end) {
+		length = strnlen(list, end - list) + 1;
 
-	for (i = 0; i < length; i++) {
-		int len = strlen(list);
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end)
+			return -FDT_ERR_BADVALUE;
 
-		list += len + 1;
-		i += len;
+		list += length;
 		count++;
 	}
 
 	return count;
 }
 
-int fdt_find_string(const void *fdt, int node, const char *property,
-		    const char *string)
+int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
+			  const char *string)
 {
+	int length, len, idx = 0;
 	const char *list, *end;
-	int len, index = 0;
 
-	list = fdt_getprop(fdt, node, property, &len);
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
 	if (!list)
-		return len;
+		return -length;
 
-	end = list + len;
-	len = strlen(string);
+	len = strlen(string) + 1;
+	end = list + length;
 
 	while (list < end) {
-		int l = strlen(list);
+		length = strnlen(list, end - list) + 1;
+
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end)
+			return -FDT_ERR_BADVALUE;
 
-		if (l == len && memcmp(list, string, len) == 0)
-			return index;
+		if (length == len && memcmp(list, string, length) == 0)
+			return idx;
 
-		list += l + 1;
-		index++;
+		list += length;
+		idx++;
 	}
 
 	return -FDT_ERR_NOTFOUND;
 }
 
-int fdt_get_string_index(const void *fdt, int node, const char *property,
-			 int index, const char **output)
+const char *fdt_stringlist_get(const void *fdt, int nodeoffset,
+			       const char *property, int idx,
+			       int *lenp)
 {
-	const char *list;
-	int length, i;
+	const char *list, *end;
+	int length;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
+	if (!list) {
+		if (lenp)
+			*lenp = length;
 
-	list = fdt_getprop(fdt, node, property, &length);
+		return NULL;
+	}
 
-	for (i = 0; i < length; i++) {
-		int len = strlen(list);
+	end = list + length;
 
-		if (index == 0) {
-			*output = list;
-			return 0;
+	while (list < end) {
+		length = strnlen(list, end - list) + 1;
+
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end) {
+			if (lenp)
+				*lenp = -FDT_ERR_BADVALUE;
+
+			return NULL;
+		}
+
+		if (idx == 0) {
+			if (lenp)
+				*lenp = length - 1;
+
+			return list;
 		}
 
-		list += len + 1;
-		i += len;
-		index--;
+		list += length;
+		idx--;
 	}
 
-	return -FDT_ERR_NOTFOUND;
-}
+	if (lenp)
+		*lenp = -FDT_ERR_NOTFOUND;
 
-int fdt_get_string(const void *fdt, int node, const char *property,
-		   const char **output)
-{
-	return fdt_get_string_index(fdt, node, property, 0, output);
+	return NULL;
 }
 
 int fdt_node_check_compatible(const void *fdt, int nodeoffset,
diff --git a/test/overlay/cmd_ut_overlay.c b/test/overlay/cmd_ut_overlay.c
index 87dc932..cbef720 100644
--- a/test/overlay/cmd_ut_overlay.c
+++ b/test/overlay/cmd_ut_overlay.c
@@ -52,12 +52,15 @@ static int fdt_getprop_str(void *fdt, const char *path, const char *name,
 			   const char **out)
 {
 	int node_off;
+	int len;
 
 	node_off = fdt_path_offset(fdt, path);
 	if (node_off < 0)
 		return node_off;
 
-	return fdt_get_string(fdt, node_off, name, out);
+	*out = fdt_stringlist_get(fdt, node_off, name, 0, &len);
+
+	return len < 0 ? len : 0;
 }
 
 static int fdt_overlay_change_int_property(struct unit_test_state *uts)
-- 
2.8.0.rc3.226.g39d4020
