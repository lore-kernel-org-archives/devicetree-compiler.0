From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add FDT alignment check to fdt_check_header()
Date: Thu, 8 Apr 2021 03:35:35 +1200
Message-ID: <CAPnjgZ3fmzymABa4orPYxVQG4SaprSXZa+4AT9=yBYm8B6Md_Q@mail.gmail.com>
References: <20210406190712.2118098-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LznIPbhOddMBnq6vB5OIWKTCk3GW8FKdULgllGE9z3w=;
        b=jP4lJ0i42vmOlcLJQwJzyEHOiHCiWye87rNVqBNUcaOmYzYMSKBDfgalKI01sIFUdS
         P7XMRuS9iTsccopFspUrE8gG42JuKZDElw7L3RF2BLB/wDWHNuxMOO9DtDRtiJMKnpLL
         nbMyxxHUAS6ha4HwFuDbO580pVDMsSeaGmNBs=
In-Reply-To: <20210406190712.2118098-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi Rob,

On Wed, 7 Apr 2021 at 07:07, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Only checking the FDT alignment in fdt_ro_probe_() means that
> fdt_check_header() can pass, but then subsequent API calls fail on
> alignment checks. Let's add an alignment check to fdt_check_header() so
> alignment errors are found up front.
>
> Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> For background, the new alignment check triggered a crash in the
> linux kernel. Yes, we should fix the error handling, but
> fdt_check_header() shouldn't tell us the FDT is valid only to fail
> later on.
>
> Maybe we should move the check instead, but fdt_ro_probe_() and
> fdt_check_header() already have a lot of the same checks.
>
>  libfdt/fdt.c | 4 ++++
>  1 file changed, 4 insertions(+)

At present U-Boot uses a 4-byte alignment, so far as I know, so this
will break things.

Is this because of the need to align the memory-reservation block?

>
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 3e893073da05..9fe7cf4b747d 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -90,6 +90,10 @@ int fdt_check_header(const void *fdt)
>  {
>         size_t hdrsize;
>
> +       /* The device tree must be at an 8-byte aligned address */
> +       if ((uintptr_t)fdt & 7)
> +               return -FDT_ERR_ALIGNMENT;
> +
>         if (fdt_magic(fdt) != FDT_MAGIC)
>                 return -FDT_ERR_BADMAGIC;
>         if (!can_assume(LATEST)) {
> --
> 2.27.0
>

Regards,
Simon
