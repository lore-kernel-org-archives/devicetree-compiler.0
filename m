From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base
 fdt
Date: Thu, 4 Jan 2018 12:11:53 -0800
Message-ID: <d2c64ad3-4a0d-ea31-02be-2164b4e46e17@gmail.com>
References: <20180101065945.65451-1-kevans@FreeBSD.org>
 <20180101065945.65451-2-kevans@FreeBSD.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=46mgXqDSC1VOD+kHd5oUKMdbSc4ZeZnwekC6GGCy1Sg=;
        b=tEqmOc3SYAAKR3pecMEQFbeSRL+u0+nbXxB+6tnU4CiSywansFSR1sAxY+5adVSO7q
         BlZmApfS0tcvW4ljSMw1Vhp05HEV3Dg2MYd2yISUk1/SBpyPUDw/iwfytf1G9fHUkx+r
         UWS7ep4oHchUz8rs8LPOXQOefBm5ZQIUvFbOWqx0K48HFVEBIn8CVG5pJgt6MjvVKKIn
         2tG7KQ+mPAtruv6oVYRQuP5TP0mnx8m2LqduJVEMVj0qYFs0tZ8eg97LxOQjNpJK3Zns
         Plgik43GEM3V44UR5G2NGB481qtk1Q/QFFuQBQJsB5DIQj8KxaAjGO590RowcGJyh2gN
         tDoQ==
In-Reply-To: <20180101065945.65451-2-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 12/31/17 22:59, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> Currently, references cannot be made to nodes in the base that do not already
> have phandles, limiting us to nodes that have been referenced in the base fdt.
> Lift that restriction by allocating them on an as-needed basis.

I am very confused.  If I understand correctly, the problem is:

  A base devicetree contains a __symbols__ node, where one of the properties
  in that node has a value which is a path to a node, where that node does
  not have a phandle property.

Is that correct?

> 
> Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
> ---
> 
> Changes since v1:
>  - Added a function to grab the next phandle; once we've assigned one phandle
>  to a node automatically, we'll need to choose max phandle from the base
>  blob instead of the overlay since they've not necessarily been merged yet.
> 
>  libfdt/fdt_overlay.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 74 insertions(+), 9 deletions(-)
> 
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index bd81241..10a57ae 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -335,6 +335,66 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
>  						    delta);
>  }
>  
> +/**
> + * overlay_next_phandle - Grab next phandle to be assigned
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + *
> + * overlay_next_phandle() determines the next phandle to be assigned to the
> + * fdt blob.
> + *
> + * This is part of the device tree overlay application process, when you need to
> + * assign a phandle to a node that doesn't currently have one.
> + *
> + * returns:
> + *      Next phandle to be assigned on success
> + *      Negative error code on failure
> + */
> +static int overlay_next_phandle(void *fdt, void *fdto)
> +{
> +	int base_max, overlay_max;
> +
> +	base_max = fdt_get_max_phandle(fdt);
> +	if (base_max < 0)
> +		return base_max;
> +	overlay_max = fdt_get_max_phandle(fdto);
> +	if (overlay_max < 0)
> +		return overlay_max;
> +	return (base_max > overlay_max ? base_max : overlay_max) + 1;
> +}
> +
> +/**
> + * overlay_assign_phandle - Assign a phandle to a symbol in the base fdt
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + * @symbol_off: Node offset of the symbol to be assigned a phandle
> + *
> + * overlay_assign_phandle() assigns the next phandle available to the requested
> + * node in the base device tree.
> + *
> + * This is part of the device tree overlay application process, when you want to
> + * reference a symbol in the base device tree that doesn't yet have a phandle.
> + *
> + * returns:
> + *      phandle assigned on success
> + *      0 on failure
> + */
> +static int overlay_assign_phandle(void *fdt, void *fdto, int symbol_off)
> +{
> +	int phandle, ret;
> +	fdt32_t phandle_val;
> +
> +	/* Overlay phandles have already been adjusted, grab highest phandle */
> +	phandle = overlay_next_phandle(fdt, fdto);
> +	if (phandle < 0)
> +		return 0;
> +	phandle_val = cpu_to_fdt32(phandle);
> +	ret = fdt_setprop(fdt, symbol_off, "phandle", &phandle_val, sizeof(phandle_val));
> +	if (!ret)
> +		return phandle;
> +	return 0;
> +}
> +
>  /**
>   * overlay_fixup_one_phandle - Set an overlay phandle to the base one
>   * @fdt: Base Device Tree blob
> @@ -359,7 +419,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
>   *      Negative error code on failure
>   */
>  static int overlay_fixup_one_phandle(void *fdt, void *fdto,
> -				     int symbols_off,
> +				     int *symbols_off,
>  				     const char *path, uint32_t path_len,
>  				     const char *name, uint32_t name_len,
>  				     int poffset, const char *label)
> @@ -370,10 +430,10 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
>  	int symbol_off, fixup_off;
>  	int prop_len;
>  
> -	if (symbols_off < 0)
> -		return symbols_off;
> +	if (*symbols_off < 0)
> +		return *symbols_off;
>  
> -	symbol_path = fdt_getprop(fdt, symbols_off, label,
> +	symbol_path = fdt_getprop(fdt, *symbols_off, label,
>  				  &prop_len);
>  	if (!symbol_path)
>  		return prop_len;
> @@ -383,8 +443,14 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
>  		return symbol_off;
>  
>  	phandle = fdt_get_phandle(fdt, symbol_off);
> -	if (!phandle)
> -		return -FDT_ERR_NOTFOUND;
> +	if (!phandle) {
> +		phandle = overlay_assign_phandle(fdt, fdto, symbol_off);
> +		if (phandle == 0)
> +			return -FDT_ERR_NOTFOUND;
> +
> +		/* Re-lookup symbols offset, it's been invalidated */
> +		*symbols_off = fdt_path_offset(fdt, "/__symbols__");
> +	}
>  
>  	fixup_off = fdt_path_offset_namelen(fdto, path, path_len);
>  	if (fixup_off == -FDT_ERR_NOTFOUND)
> @@ -418,7 +484,7 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
> +static int overlay_fixup_phandle(void *fdt, void *fdto, int *symbols_off,
>  				 int property)
>  {
>  	const char *value;
> @@ -519,8 +585,7 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
>  
>  	fdt_for_each_property_offset(property, fdto, fixups_off) {
>  		int ret;
> -
> -		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
> +		ret = overlay_fixup_phandle(fdt, fdto, &symbols_off, property);
>  		if (ret)
>  			return ret;
>  	}
> 
