From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checks: Update #{size,address}-cells check for 'dma-ranges'
Date: Thu, 12 Jan 2023 13:47:03 -0600
Message-ID: <CAL_JsqKkE_Aytd_7WOV3iM+pipjnwDWR7yt=L+xE8+cyjL8b9w@mail.gmail.com>
References: <20230112125654.13390-1-qun-wei.lin@mediatek.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673552836;
        bh=9qMKfGmeUlLz+0nsFFAUrSExErLs/+7oafgi8Cgd3bI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rM8fKaMv8SBKbffviRZrTIy8dw8lMq4Fxjb3mILubvNlkLZlgEcZDCkD1LlSYYEX9
         nchNrHMOrHd1rqnlld9m3ufu4vxGEq1zT+SNc0TPLBSDFhPOA8giNcSFPNXb8kyKlb
         tx3a8f2f07R3VGKHG9fhVO1hda9aLeRkrmoYZY/26W5+dbZhlXWZSrkY0c5vEeh/91
         5uyvmPIdzjMEOSpmGhOBuA1XD9/TqU6wSLU7dCAkYx0Qu1f4PhHrPncKemK7LDhGAv
         Fw1hrhkFq8NMsO52MkP3dZy3bPfrDaevk5vKqmyDcee9OIw7gTSBeQ4x5HCX48oU4E
         EN/8pRFUaXSjw==
In-Reply-To: <20230112125654.13390-1-qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kuan-ying.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ladon.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org

On Thu, Jan 12, 2023 at 6:59 AM Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> The "dma-ranges" property value is a sequence of
>         child-address  parent-address  child-size
>
> The size of each field is determined by taking the child's
> "#address-cells" value, the parent's "#address-cells" value,
> and the child's "#size-cells" value.
>
> However, in the following example, it gives a false alarm:
> +-----------------------------------+---------------------------------------+
> | ranges.dts                        | dma-ranges.dts                        |
> +-----------------------------------+---------------------------------------+
> | /dts-v1/;                         | /dts-v1/;                             |
> |                                   |                                       |
> | /{                                | /{                                    |
> |   #address-cells = <1>;           |   #address-cells = <1>;               |
> |                                   |                                       |
> |   parent {                        |   parent {                            |
> |     #address-cells = <1>;         |     #address-cells = <1>;             |
> |     #size-cells = <1>;            |     #size-cells = <1>;                |
> |     ranges = <0x0 0xe000 0x1000>; |     dma-ranges = <0x0 0xe000 0x1000>; |
> |     child {                       |     child {                           |
> |       ...                         |       ...                             |
> |     };                            |     };                                |
> |   };                              |   };                                  |
> | };                                | };                                    |
> +-----------------------------------+---------------------------------------+
> | no warning                        | Warning (avoid_unnecessary_addr_size) |
> +-----------------------------------+---------------------------------------+
>
> Same as "ranges", it should not be reported in this check.

Except that dma-ranges only makes sense if there is a ranges property.

Rob
