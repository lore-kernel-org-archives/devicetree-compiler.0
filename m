Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577986DCE1
	for <devicetree-compiler@vger.kernel.org>; Thu, 16 Jan 2025 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737034862; cv=none; b=JFMppu/+16WWpILUE8ucUlM5CX923GNdG5PnCCj+CLHK3z4D/ZSK1UmvIldkGYtR2TV2yMQfYxMmoC8X6sybSePlzKaCBKXEu/PMoJEpM0YCNiM2u300Lxi+xN96DoIpqeeGrxaZC6KUCxdbqZydNNMeGDduToVeEfCpnfZ8Q/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737034862; c=relaxed/simple;
	bh=hZw54qbSnwpe31siDRwBD4D8g9Ria29HpSsWGuJRFBc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IRZsTG6Oo5AKmnzHRuqFeZbv9g2gEdTLKSMvo22Sc3Hti9CQJFkbruLfGxgiyQGa+UfQSTzb7HU2x1tgIBWW2thpbO1NEK2Mr8chGlezpaK78iZ9FJ+WKu5tDjLJzujOEFrdoBviYEaF1RL7HTz8zFL1ZCoLTjDXr/mfQW2GFoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dbGzpnpg; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dbGzpnpg"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7151CFF806;
	Thu, 16 Jan 2025 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737034858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DK2uzswYp8bztHCeWeNWNnTWd5eIVK5UlmUbXv7kC6o=;
	b=dbGzpnpg6Wl/0baoV9PY6go6bQ7eF+0ypwvGKqSn6J9sJ5zwOXXBX299OG06cGsie4oIJs
	u5mxPjgkdR0/7jGsEIqXmswfy+R/JQdUKfijJ2oACBX/di9NrkKTh9/AIsp7eEhj7bEoW2
	u9uwcv3vF7S6FKVhO8SWs2iA4okhwMVm6Foq34opAHesHu8WSJK4tw967RDps+Gae3Z6fM
	nEPbGEIzCwssCW85hmzRhuVyyBvh4FE5WA+FZxiA76mTCVpoy7cfBzz9G1f4tUATU/N+VO
	/1hkLoFZR9PJHvJ6O2RWuv7VtvDj/sJGh40qWR4WCdTgo5iLKD661yyX3QjAPw==
Date: Thu, 16 Jan 2025 14:40:54 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, Andrew Davis
 <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Robert Nelson
 <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, David Gibson
 <david@gibson.dropbear.id.au>, devicetree-compiler@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] libfdt: overlay: Add export-symbols support
Message-ID: <20250116144054.0ba5805a@bootlin.com>
In-Reply-To: <20250112-export-symbols-overlay-v1-1-e94526d349ef@beagleboard.org>
References: <20250112-export-symbols-overlay-v1-1-e94526d349ef@beagleboard.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Ayush,

Cc Thomas and Lucas (interested in this topic).


On Sun, 12 Jan 2025 00:58:52 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> The export symbols node adds some additional symbols that can be used
> in the symbols resolution. The resolver tries to match unresolved
> symbols first using the export symbols node and, if a match is not
> found, it tries the normal route and searches the __symbols__ node.
> 
> Contrary to symbols available in the global __symbols__ node, symbols
> listed in the export symbols node can be considered as local symbols.
> Indeed, they can be changed depending on the node the overlay is going
> to be applied to and are only visible from the current node properties.
> 
> export-symbols are phandle based as opposed to global __symbols__. This
> allows for much simpler use with overlays as opposed to __symbols__
> where paths require resizing of overlays as show in [0].
> 
> The phandle resolution in overlay is now broken into 2 steps:
> - fragment target phandles
> - All other phandles
> 
> The reason this is required is because to find the export-symbols node
> in the target node, we first need to resolve the target phandles. Here
> is an example of overlay that will generate the target __fixup__ after
> the property fixup, and thus fail without this 2 step resolution.
> 
> ```
> /dts-v1/;
> /plugin/;
> 
> &connectora {
>   prop = <&gpio_connector>;
> };
> 
> &connectorb {
>   prop = <&gpio_connector>;
> };
> ```
> 
> Using fdtdump, we get the following:
> 
> ```
> **** fdtdump is a low-level debugging tool, not meant for general use.
> **** If you want to decompile a dtb, you probably want
> ****     dtc -I dtb -O dts <filename>
> 
> /dts-v1/;
> // magic:               0xd00dfeed
> // totalsize:           0x1b1 (433)
> // off_dt_struct:       0x38
> // off_dt_strings:      0x180
> // off_mem_rsvmap:      0x28
> // version:             17
> // last_comp_version:   16
> // boot_cpuid_phys:     0x0
> // size_dt_strings:     0x31
> // size_dt_struct:      0x148
> 
> / {
>     fragment@0 {
>         target = <0xffffffff>;
>         __overlay__ {
>             prop = <0xffffffff>;
>         };
>     };
>     fragment@1 {
>         target = <0xffffffff>;
>         __overlay__ {
>             prop = <0xffffffff>;
>         };
>     };
>     __fixups__ {
>         connectora = "/fragment@0:target:0";
>         gpio_connector = "/fragment@0/__overlay__:prop:0", "/fragment@1/__overlay__:prop:0";
>         connectorb = "/fragment@1:target:0";
>     };
> };
> ```
> 
> [0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
> As discussed in the export-symbols kernel patch series [0] and [1], the
> following patch series adds support for export-symbols in fdtoverlay.
> 
> This patch series is mostly a prototype for the functionality. Depending
> on the direction, next revision of the patch will add tests.
> 
> [0]: https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
> [1]: https://lore.kernel.org/r/20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org
> ---
>  libfdt/fdt_overlay.c | 245 ++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 222 insertions(+), 23 deletions(-)

Thanks a lot for this patch!

I did a little modification related to unitialized variables leading to
compilation errors.

Here is my modification.
--- 8< ---
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 7cb2230..12745b5 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -411,7 +411,7 @@ static int overlay_fixup_target_phandle(void *fdt, void *fdto, int symbols_off,
        const char *symbol_path;
        int prop_len;
        int symbol_off;
-       uint32_t phandle;
+       uint32_t phandle = 0;
 
        value = fdt_getprop_by_offset(fdto, property,
                                      &label, &len);
@@ -544,7 +544,7 @@ static int overlay_fixup_non_target_phandle(void *fdt, void *fdto,
        const char *symbol_path;
        int prop_len;
        int symbol_off;
-       uint32_t symbol_phandle;
+       uint32_t symbol_phandle = 0;
 
        value = fdt_getprop_by_offset(fdto, property, &label, &len);
        if (!value) {
--- 8< ---


I tested your code and fdtoverlay failed when the __symbols__ node is not in
the base devicetree.

With the export-symbols node, the resolution can be successful without the
need of the global __symbols__ node.

The error was just related to a check in overlay_fixup_one_phandle().

All verification are already done in previous operations. And so, I removed
the check and the symbols_off parameter (not needed anymore). Here is the
exact modification I did:
--- 8< ---
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 12745b5..a9f0465 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -308,7 +308,6 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 /**
  * overlay_fixup_one_phandle - Set an overlay phandle to the base one
  * @fdto: Device tree overlay blob
- * @symbols_off: Node offset of the symbols node in the base device tree
  * @path: Path to a node holding a phandle in the overlay
  * @path_len: number of path characters to consider
  * @name: Name of the property holding the phandle reference in the overlay
@@ -327,7 +326,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
+static int overlay_fixup_one_phandle(void *fdto,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
 				     int poffset, uint32_t phandle)
@@ -335,9 +334,6 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 	fdt32_t phandle_prop;
 	int fixup_off;
 
-	if (symbols_off < 0)
-		return symbols_off;
-
 	fixup_off = fdt_path_offset_namelen(fdto, path, path_len);
 	if (fixup_off == -FDT_ERR_NOTFOUND)
 		return -FDT_ERR_BADOVERLAY;
@@ -468,7 +464,7 @@ static int overlay_fixup_target_phandle(void *fdt, void *fdto, int symbols_off,
 		if (path_len == (fixup_len - 1))
 			return -FDT_ERR_BADOVERLAY;
 
-		ret = overlay_fixup_one_phandle(fdto, symbols_off, path,
+		ret = overlay_fixup_one_phandle(fdto, path,
 						path_len, "target",
 						sizeof("target") - 1, 0,
 						phandle);
@@ -628,7 +624,7 @@ static int overlay_fixup_non_target_phandle(void *fdt, void *fdto,
 			target_phandle = symbol_phandle;
 		}
 
-		ret = overlay_fixup_one_phandle(fdto, symbols_off, path,
+		ret = overlay_fixup_one_phandle(fdto, path,
 						path_len, name, name_len,
 						poffset, target_phandle);
 		if (ret)
--- 8< ---

With this modification applied, fdtoverlay worked without any issue using
the following commands:
  dtc -I dts -O dtb base.dts > base.dtb
  dtc -I dts -O dtb overlay.dtso > overlay.dtbo
  fdtoverlay -i base.dtb -o full.dtb overlay.dtbo

The resulting full.dtb was correct.

The file base.dts used for the test was:
--- 8< ---
/dts-v1/;

/{
	somewhere {
		base_node1: base-node1 {
			prop = "base,node1";
		};

		base-node2 {
			prop = "base,node2";
			ref-base-node1 = <&base_node1>;
		};

		base_node3: base-node3 {
			prop = "base,node3";
		};

		export-symbols {
			base_node = <&base_node3>;
		};
	};
};
--- 8< ---

And the overlay.dso:
--- 8< ---
/dts-v1/;
/plugin/;

/ {
	fragment@0 {
		target-path = "/somewhere";

		__overlay__ {
			ovl_node1: ovl_node1 {
				prop = "ovl,node1";
			};

			ovl_node2 {
				prop = "ovl,node2";
				ref-ovl-node1 = <&ovl_node1>;
			};

			ovl_node3 {
				prop = "ovl,node3";
				ref-base-node = <&base_node>;
			};
		};
	};
};
--- 8< ---

Hope this will help moving forward on this topic.

Best regards,
Hervé
