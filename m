Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB92913
	for <devicetree-compiler@vger.kernel.org>; Sun, 19 Jan 2025 13:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292758; cv=none; b=HdA8bMim6rYC9l4Q84Py92SJ+C1E3scDwFmx6LiSeKOtZRpZgE2xtd5sMW7dov/TjAOnnGLEpZ1kxk1qVGN4Pd993ccterFrVft6JYHQd/Bf2NHTCmBlGMI5/CBdgUKl/m80+xnvbdawDFS4N1Xz8Eu1WkcHdT7Wcp3w6UtuhbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292758; c=relaxed/simple;
	bh=eo1MRXYACQRqPv1sy17pF2PyY43uwbeuSbghnz5c4mI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C42ERLGYGFzmrKqQNNuK4CwbaSRPRu6eDQFLYmp0JO5UuxA3NgRv1Tp/T5RVmChCHH+yPl2gTSYCJVbIzXug9IUCVoLNQfIOq43qEQK9ZdOeMnzVs3AYlWe0aMQ3i4YAiWYMJPGqzLQTWyscJwzVmesCFdYHh4Pyj4fCH2AdY+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=jBoMCjrT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="jBoMCjrT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2164b1f05caso65931635ad.3
        for <devicetree-compiler@vger.kernel.org>; Sun, 19 Jan 2025 05:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1737292755; x=1737897555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+F6HLVmZE2S8X3fz9QVJW+ol0sAsW7Tq2jronHqiCBo=;
        b=jBoMCjrTwr0d02G0C3t6oivLUnJvtQ42bXNKxV/AnrffA7dnKOq3jEEtleU4OGhaXb
         VqjvbPFWyHzijYvMQ+61C8X1oF6GGPihhwXLVuiGNyRMJo2ROwKRN0WpdyWzn0isBr/N
         p9rzBjWwSfvJMhSM2IKvQTBsMTWXnSyoeeFGrgIkd+AYY1js9sB30m6BDVayMOrPZd76
         NASUG9KiOMHMCvN8zWd3RdY6dwH07pz1rVgV5NPaQzaIeMaHxMQ5DybTp5qPmRcSdy01
         AOw8sWfhmz/EEKkvqwe9wOLZ/vBCrhvXVL4VFUyYWh/ouibxrBxIEE4Mf/K0YkzW+xNU
         cHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292755; x=1737897555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+F6HLVmZE2S8X3fz9QVJW+ol0sAsW7Tq2jronHqiCBo=;
        b=MqiUGzCpOeiCKdw1OM9AdRLD9NSDo9WJCTRmcrQVO80uHaX83Ll2kYh0kUYJrIt6Dd
         JyRyX0R7NKLuxBmYotBC8Hc2pyQJd1tWZxQM7H8vjaO+7khfxLa+103BstNlwDQjAe2C
         EvsvnOEE7X2Q6oCJN9EtX2rcW/lPAODQ2Af6fo0YO0MHIVSP9KqM/7Ektj06Uxi0wUvk
         MPQKquou5K28KsQeFizCOOA1Z6H+kq0fyHWPuCioWvsBUO6sc+WDJiLa9/sS9W3sKaiR
         GuutYY9qhJb/zYzKtTICjpjX+RRoklQcPfT/1FOgyNZVAZBzo3Ht8SCyo1BobUm1+tQj
         eMOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsxKdj787uBHjiVZlFeQHIN/hUY/LcEWB0NRFgyqwzNOXkQi6yxih8qyOOkTPepMc1XT5rcMnGZaOJa0dHcfIuCXjo@vger.kernel.org
X-Gm-Message-State: AOJu0YzAsNjTooTfUYHCWGId7pIxU7humfZORuabuPd4EEqRqsjT4HPI
	qNWZEQY5x3uivj6U0Q9ILIFPKr6J7dnwwK2Te1mZa+/75+Yi9BpsxVSzceAesA==
X-Gm-Gg: ASbGncvLdSsab/dCcV0eLUvKPk6bKYKUaifSmHIkDhC7NiJgXFQN0MgYmqnbfEr3ygs
	Iwy64kdGVpLccAGNKcaNCLHe7UD3FMbREMVlg5zfcviM1eluq1+djxKVhKNUqTJ+Bpj7L3WpTXN
	hKIwlC2hSqyKLBwMqzTgcUZJRS6t5NrF7pZffzqA00s44sXoW/ZIXM7LOjus70YjgUnv5VaELXN
	pVY2a0JB71Js9hQffaflkWoUFOa/uBMw3ST8flkE4qWMwCeYc0BESup+MTkgee6ZofvI7GPEr/x
X-Google-Smtp-Source: AGHT+IFKDr/vL4bFdhf3D+BkjJzfmVSNPWKU2sVIN+Rnjp4D6P7GmBtilEaEswP4MpOtRPBKsc0rLg==
X-Received: by 2002:a17:902:ea06:b0:216:45eb:5e4d with SMTP id d9443c01a7336-21c352c7921mr128987445ad.6.1737292755394;
        Sun, 19 Jan 2025 05:19:15 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb772esm44603115ad.80.2025.01.19.05.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 05:19:14 -0800 (PST)
Message-ID: <86a7a08c-d81c-43d4-99fb-d0c4e9777601@beagleboard.org>
Date: Sun, 19 Jan 2025 18:49:01 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libfdt: overlay: Add export-symbols support
To: Herve Codina <herve.codina@bootlin.com>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 devicetree-compiler@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250112-export-symbols-overlay-v1-1-e94526d349ef@beagleboard.org>
 <20250116144054.0ba5805a@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20250116144054.0ba5805a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/01/25 19:10, Herve Codina wrote:
> Hi Ayush,
> 
> Cc Thomas and Lucas (interested in this topic).
> 
> 
> On Sun, 12 Jan 2025 00:58:52 +0530
> Ayush Singh <ayush@beagleboard.org> wrote:
> 
>> The export symbols node adds some additional symbols that can be used
>> in the symbols resolution. The resolver tries to match unresolved
>> symbols first using the export symbols node and, if a match is not
>> found, it tries the normal route and searches the __symbols__ node.
>>
>> Contrary to symbols available in the global __symbols__ node, symbols
>> listed in the export symbols node can be considered as local symbols.
>> Indeed, they can be changed depending on the node the overlay is going
>> to be applied to and are only visible from the current node properties.
>>
>> export-symbols are phandle based as opposed to global __symbols__. This
>> allows for much simpler use with overlays as opposed to __symbols__
>> where paths require resizing of overlays as show in [0].
>>
>> The phandle resolution in overlay is now broken into 2 steps:
>> - fragment target phandles
>> - All other phandles
>>
>> The reason this is required is because to find the export-symbols node
>> in the target node, we first need to resolve the target phandles. Here
>> is an example of overlay that will generate the target __fixup__ after
>> the property fixup, and thus fail without this 2 step resolution.
>>
>> ```
>> /dts-v1/;
>> /plugin/;
>>
>> &connectora {
>>    prop = <&gpio_connector>;
>> };
>>
>> &connectorb {
>>    prop = <&gpio_connector>;
>> };
>> ```
>>
>> Using fdtdump, we get the following:
>>
>> ```
>> **** fdtdump is a low-level debugging tool, not meant for general use.
>> **** If you want to decompile a dtb, you probably want
>> ****     dtc -I dtb -O dts <filename>
>>
>> /dts-v1/;
>> // magic:               0xd00dfeed
>> // totalsize:           0x1b1 (433)
>> // off_dt_struct:       0x38
>> // off_dt_strings:      0x180
>> // off_mem_rsvmap:      0x28
>> // version:             17
>> // last_comp_version:   16
>> // boot_cpuid_phys:     0x0
>> // size_dt_strings:     0x31
>> // size_dt_struct:      0x148
>>
>> / {
>>      fragment@0 {
>>          target = <0xffffffff>;
>>          __overlay__ {
>>              prop = <0xffffffff>;
>>          };
>>      };
>>      fragment@1 {
>>          target = <0xffffffff>;
>>          __overlay__ {
>>              prop = <0xffffffff>;
>>          };
>>      };
>>      __fixups__ {
>>          connectora = "/fragment@0:target:0";
>>          gpio_connector = "/fragment@0/__overlay__:prop:0", "/fragment@1/__overlay__:prop:0";
>>          connectorb = "/fragment@1:target:0";
>>      };
>> };
>> ```
>>
>> [0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>> As discussed in the export-symbols kernel patch series [0] and [1], the
>> following patch series adds support for export-symbols in fdtoverlay.
>>
>> This patch series is mostly a prototype for the functionality. Depending
>> on the direction, next revision of the patch will add tests.
>>
>> [0]: https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
>> [1]: https://lore.kernel.org/r/20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org
>> ---
>>   libfdt/fdt_overlay.c | 245 ++++++++++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 222 insertions(+), 23 deletions(-)
> 
> Thanks a lot for this patch!
> 
> I did a little modification related to unitialized variables leading to
> compilation errors.
> 
> Here is my modification.
> --- 8< ---
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 7cb2230..12745b5 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -411,7 +411,7 @@ static int overlay_fixup_target_phandle(void *fdt, void *fdto, int symbols_off,
>          const char *symbol_path;
>          int prop_len;
>          int symbol_off;
> -       uint32_t phandle;
> +       uint32_t phandle = 0;
>   
>          value = fdt_getprop_by_offset(fdto, property,
>                                        &label, &len);
> @@ -544,7 +544,7 @@ static int overlay_fixup_non_target_phandle(void *fdt, void *fdto,
>          const char *symbol_path;
>          int prop_len;
>          int symbol_off;
> -       uint32_t symbol_phandle;
> +       uint32_t symbol_phandle = 0;
>   
>          value = fdt_getprop_by_offset(fdto, property, &label, &len);
>          if (!value) {
> --- 8< ---
> 
> 
> I tested your code and fdtoverlay failed when the __symbols__ node is not in
> the base devicetree.
> 
> With the export-symbols node, the resolution can be successful without the
> need of the global __symbols__ node.
> 
> The error was just related to a check in overlay_fixup_one_phandle().
> 
> All verification are already done in previous operations. And so, I removed
> the check and the symbols_off parameter (not needed anymore). Here is the
> exact modification I did:
> --- 8< ---
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 12745b5..a9f0465 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -308,7 +308,6 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
>   /**
>    * overlay_fixup_one_phandle - Set an overlay phandle to the base one
>    * @fdto: Device tree overlay blob
> - * @symbols_off: Node offset of the symbols node in the base device tree
>    * @path: Path to a node holding a phandle in the overlay
>    * @path_len: number of path characters to consider
>    * @name: Name of the property holding the phandle reference in the overlay
> @@ -327,7 +326,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
>    *      0 on success
>    *      Negative error code on failure
>    */
> -static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
> +static int overlay_fixup_one_phandle(void *fdto,
>   				     const char *path, uint32_t path_len,
>   				     const char *name, uint32_t name_len,
>   				     int poffset, uint32_t phandle)
> @@ -335,9 +334,6 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
>   	fdt32_t phandle_prop;
>   	int fixup_off;
>   
> -	if (symbols_off < 0)
> -		return symbols_off;
> -
>   	fixup_off = fdt_path_offset_namelen(fdto, path, path_len);
>   	if (fixup_off == -FDT_ERR_NOTFOUND)
>   		return -FDT_ERR_BADOVERLAY;
> @@ -468,7 +464,7 @@ static int overlay_fixup_target_phandle(void *fdt, void *fdto, int symbols_off,
>   		if (path_len == (fixup_len - 1))
>   			return -FDT_ERR_BADOVERLAY;
>   
> -		ret = overlay_fixup_one_phandle(fdto, symbols_off, path,
> +		ret = overlay_fixup_one_phandle(fdto, path,
>   						path_len, "target",
>   						sizeof("target") - 1, 0,
>   						phandle);
> @@ -628,7 +624,7 @@ static int overlay_fixup_non_target_phandle(void *fdt, void *fdto,
>   			target_phandle = symbol_phandle;
>   		}
>   
> -		ret = overlay_fixup_one_phandle(fdto, symbols_off, path,
> +		ret = overlay_fixup_one_phandle(fdto, path,
>   						path_len, name, name_len,
>   						poffset, target_phandle);
>   		if (ret)
> --- 8< ---
> 
> With this modification applied, fdtoverlay worked without any issue using
> the following commands:
>    dtc -I dts -O dtb base.dts > base.dtb
>    dtc -I dts -O dtb overlay.dtso > overlay.dtbo
>    fdtoverlay -i base.dtb -o full.dtb overlay.dtbo
> 
> The resulting full.dtb was correct.
> 
> The file base.dts used for the test was:
> --- 8< ---
> /dts-v1/;
> 
> /{
> 	somewhere {
> 		base_node1: base-node1 {
> 			prop = "base,node1";
> 		};
> 
> 		base-node2 {
> 			prop = "base,node2";
> 			ref-base-node1 = <&base_node1>;
> 		};
> 
> 		base_node3: base-node3 {
> 			prop = "base,node3";
> 		};
> 
> 		export-symbols {
> 			base_node = <&base_node3>;
> 		};
> 	};
> };
> --- 8< ---
> 
> And the overlay.dso:
> --- 8< ---
> /dts-v1/;
> /plugin/;
> 
> / {
> 	fragment@0 {
> 		target-path = "/somewhere";
> 
> 		__overlay__ {
> 			ovl_node1: ovl_node1 {
> 				prop = "ovl,node1";
> 			};
> 
> 			ovl_node2 {
> 				prop = "ovl,node2";
> 				ref-ovl-node1 = <&ovl_node1>;
> 			};
> 
> 			ovl_node3 {
> 				prop = "ovl,node3";
> 				ref-base-node = <&base_node>;
> 			};
> 		};
> 	};
> };
> --- 8< ---
> 
> Hope this will help moving forward on this topic.
> 
> Best regards,
> Hervé

Thanks for the feedback.

I will add the changes in v2 of the patch.

I will also be sending a patch series to devicetree-spec mailing list 
[0] to see if any changes would be needed to make it part of the spec 
rather than linux specific node.

[0]: https://lore.kernel.org/devicetree-spec/

Ayush Singh
