From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 09/12] libfdt: Add fdt_getprop_namelen_w
Date: Sat, 25 Jun 2016 20:53:55 -0600
Message-ID: <CAPnjgZ32sm6PHXYHmqrb59XM1NiNeF5+4V-V35hn=YSmLjNMtQ@mail.gmail.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com> <20160624142757.32735-10-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=q7ibPlxiUVMtZC4tobAq6b4U+AMdRMGEp6v9oxsooc0=;
        b=lTzBOBQkZ6aTmg2uJX6Ou/ClsztRYigIfh8z1QY3TISD2aZdSwTntndZQVcXqLdYxx
         rr5vRm4DHlOk14l/d42UGGFxm/Mt+uQNQ8zzYiMhu8UMWUHRibv6PkM+FozLySUWWY60
         /Of7eMpFvMX1PU02QvJlYd2OSBhKlkeTf7C/V2RT2d3R8wODoVpFYgR/Dw424JujNc7L
         +RoZcdqLagQqPHGqzZ8JBK6A4RiawGWmncM3uH3N/WKBFme2LhlU8uCoZ/ikBWlqDuQd
         Oz0q8OpfHwsAaR93ZkmmunqOJ7zYE62H39ubhfxnL0dJWdm3Adyre0h+aFyDRKm/1qIq
         gJDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=q7ibPlxiUVMtZC4tobAq6b4U+AMdRMGEp6v9oxsooc0=;
        b=c4CPOoA1JkBMhVvss2ENw6SPAR47FEDBAfM6c7wZknPhUnlvnJ6XqioD9lEPoWO+pG
         Lp+TsgmbuvCs9iC5ALjMAOvalntEARr1eLtVhKJ+LRGwJ7VYo6cz5srAPzYqkEPn0/2r
         YlMfMiLCFq7mR0/LAB6Wu7+YHFVrIC5WgBp/8=
In-Reply-To: <20160624142757.32735-10-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Hi Maxime,

On 24 June 2016 at 08:27, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Add a function to retrieve a writeable property only by the first
> characters of its name.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/libfdt.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/libfdt.h b/include/libfdt.h
> index dbe8a0efca87..b8758de3ae54 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -619,6 +619,13 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
>   */
>  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>                                 const char *name, int namelen, int *lenp);
> +static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
> +                                         const char *name, int namelen,
> +                                         int *lenp)
> +{
> +       return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
> +                                                     namelen, lenp);

What are the casts for?

> +}
>
>  /**
>   * fdt_getprop - retrieve the value of a given property
> --
> 2.9.0

Regards,
Simon
