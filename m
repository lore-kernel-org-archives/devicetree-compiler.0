From: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Drop -FDT_ERR_TOODEEP
Date: Mon, 10 Jul 2017 13:11:52 +0100
Message-ID: <CALeDE9NpG08fvWMoa97DJUFXvwH9yYukhPMxuJfBJ41Mr-bD2Q@mail.gmail.com>
References: <20170710033017.161092-1-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=4w93LeVm16SREeY8pvXgzcXYtZgFKv3L26lcSNJ9FNM=;
        b=CHkw3H7eSW0WHo+1lSSWHR8DMpsnBVUjwJLQ6L3k8JnpMTRIx0MrDzxHdXyFvIyVGn
         zdw91BxEmbhD+gmJU8xgrBr0L/UcHGm7vS9SUVxULslQr+iOwHmbMBTphHIa1m7sOpbd
         nuTJ1BgPncHxH5wfxt58AYJq39gZbfRJm+QOTvhF++bSawCW94zn8m1pVBOD0hT6NBgf
         XOqNS5ndSkKMt0X8VUrcQp26SXm65cmU6d0gqcQd3yLShllQ/P2WcixSkO7AWq3KZt8m
         AefLmkMsAiunFNwFUUdbX0OnGnC4rau8V0QuZxebP0lkoD+ekOL3wKG/a+GQKyBz4Q3C
         P1Eg==
In-Reply-To: <20170710033017.161092-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Jul 10, 2017 at 4:30 AM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This error code has not been upstreamed and is not really needed since it
> is unlikely to be triggered. Drop it to maintain compatability with
> upstream.
>
> Reported-by: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>
>  lib/libfdt/fdt_region.c | 2 +-
>  lib/libfdt/libfdt.h     | 7 +------
>  2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/lib/libfdt/fdt_region.c b/lib/libfdt/fdt_region.c
> index 8b8a547555..63099f1d96 100644
> --- a/lib/libfdt/fdt_region.c
> +++ b/lib/libfdt/fdt_region.c
> @@ -397,7 +397,7 @@ int fdt_next_region(const void *fdt,
>                         last_node = offset;
>                         p.depth++;
>                         if (p.depth == FDT_MAX_DEPTH)
> -                               return -FDT_ERR_TOODEEP;
> +                               return -FDT_ERR_BADSTRUCTURE;
>                         name = fdt_get_name(fdt, offset, &len);
>                         if (p.end - path + 2 + len >= path_len)
>                                 return -FDT_ERR_NOSPACE;
> diff --git a/lib/libfdt/libfdt.h b/lib/libfdt/libfdt.h
> index 2f7ebf8e06..f3f9cad184 100644
> --- a/lib/libfdt/libfdt.h
> +++ b/lib/libfdt/libfdt.h
> @@ -93,12 +93,7 @@
>         /* FDT_ERR_NOPHANDLES: The device tree doesn't have any
>          * phandle available anymore without causing an overflow */
>
> -#define FDT_ERR_TOODEEP        18
> -       /* FDT_ERR_TOODEEP: The depth of a node has exceeded the internal
> -        * libfdt limit. This can happen if you have more than
> -        * FDT_MAX_DEPTH nested nodes. */
> -
> -#define FDT_ERR_MAX            18
> +#define FDT_ERR_MAX            17
>
>  /**********************************************************************/
>  /* Low-level functions (you probably don't need these)                */
> --
> 2.13.2.725.g09c95d1e9-goog
>
