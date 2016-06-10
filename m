From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/9] scripts: Makefile.lib: Sanitize DTB names
Date: Fri, 10 Jun 2016 16:59:09 +0300
Message-ID: <93DEBD46-371D-49F8-801A-A6856562EADA@konsulko.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com> <1464340402-2249-3-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:mime-version:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Bqqu8ZoJ8u3Rntp/iVvjg34b16r+YYEhnBPNcYI19JU=;
        b=lvwJzkD9qC4YGA+DaaEc7RD8jYvV9fWy8beMKC0+DIahE/kUVIzqUVHoYktAOy6zSn
         /caVmRRTmnFZeiUjq2dWOW9HOUJKaK3AvDCXQC9d2zH5/ClKdCtTcNqEwzExiPKWiJJH
         0PSOKfLwjkmSu+ftwRTj+z0n36cRBjPIf4U2g=
In-Reply-To: <1464340402-2249-3-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


> On May 27, 2016, at 12:13 , Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> Having dashes as a separator in the DTB name is a quite common practice.
> 
> However, the current code to generate objects from DTBs assumes the
> separator is an underscore, leading to a compilation error when building a
> device tree with dashes.
> 
> Replace all the dashes in the DTB name to generate the symbols name, which
> should solve this issue.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> scripts/Makefile.lib | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index ad1d9b5d7dd2..df1b5a7b4150 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -275,11 +275,11 @@ cmd_dt_S_dtb=						\
> (							\
> 	echo '.section .dtb.init.rodata,"a"';		\
> 	echo '.balign 16';				\
> -	echo '.global __dtb_$(*F)_begin';		\
> -	echo '__dtb_$(*F)_begin:';			\
> +	echo '.global __dtb_$(subst -,_,$(*F))_begin';	\
> +	echo '__dtb_$(subst -,_,$(*F))_begin:';		\
> 	echo '.incbin "$<" ';				\
> -	echo '__dtb_$(*F)_end:';			\
> -	echo '.global __dtb_$(*F)_end';			\
> +	echo '__dtb_$(subst -,_,$(*F))_end:';		\
> +	echo '.global __dtb_$(subst -,_,$(*F))_end';	\
> 	echo '.balign 16';				\
> ) > $@
> 
> -- 
> 2.8.2
> 

Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
