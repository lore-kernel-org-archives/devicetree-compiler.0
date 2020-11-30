From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] libfdt: Change last_comp_version to fit spec
Date: Mon, 30 Nov 2020 10:22:09 -0700
Message-ID: <CAL_Jsq+CZA8weCYPcJYOdY3-z8fnwibsKhfGwO8nuy+7RH=pvg@mail.gmail.com>
References: <20201124174945.5399-1-jujugoboom@gmail.com> <20201124174945.5399-2-jujugoboom@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606756942;
        bh=pxsh0r5IamBieGJYyrk0BHrWUu6NGkCe/EMhCqbUuIY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZPRszQ3ZjUcq4FfOi1h09viTciO92AXSqWyKUVeu2fhQv5c2RJa6Uz9v5eUDwXQwe
         Ko4AxiACuSngbYatCDXf9W9eUIqeSxIpWs+YmlpJNUSS+idaJlxzUfyRpTCvVBv20b
         XgwFNjH8gkSEJEiWu1a1RIQPVNP1DQneRxsz4D8Y=
In-Reply-To: <20201124174945.5399-2-jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Nov 24, 2020 at 10:50 AM Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>

Needs a commit message. For a single patch, you don't need a cover
letter. The explanation should be here.

Besides matching the spec, what problem are you trying to solve?

> ---
>  libfdt/fdt_sw.c | 2 +-
>  libfdt/libfdt.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 68b543c..4c569ee 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -377,7 +377,7 @@ int fdt_finish(void *fdt)
>         fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
>
>         /* And fix up fields that were keeping intermediate state. */
> -       fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
> +       fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
>         fdt_set_magic(fdt, FDT_MAGIC);
>
>         return 0;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 89adee3..abad93b 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -14,6 +14,7 @@ extern "C" {
>  #endif
>
>  #define FDT_FIRST_SUPPORTED_VERSION    0x02
> +#define FDT_LAST_COMPATIBLE_VERSION 0x10

If the above change is correct (I'm not sure it is offhand), why not
just bump up FDT_FIRST_SUPPORTED_VERSION value?

>  #define FDT_LAST_SUPPORTED_VERSION     0x11
>
>  /* Error codes: informative error codes */
> --
> 2.25.1
>
