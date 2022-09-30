From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] libfdt: prevent integer overflow in fdt_next_tag
Date: Fri, 30 Sep 2022 08:18:30 -0500
Message-ID: <CAL_JsqJ7E6D=jxmHXnh5cR_UyitpYVSPEQASsWu+eDyQ4J-Eig@mail.gmail.com>
References: <20220929235536.618370-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664543922;
        bh=WC2md18A1qyWFP3zc4tE04k+63NII8Mw8eAdacm2lB8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ChVua4ranfcgZnuM9XeARN7s9sKFt8FL1uy2mxNH+DVE0QaWMr6XoA6MXaH6wwVmT
         DlcYnm2ny/WUFJSIh4dCKbuXlSPVSGiy/dpW0cEUIwq1awuKWOocf1ulMYVu2bk2J2
         unRUwChmnANz333msxJ1FvLyLOBXu6Sa2EDjdModRNSiNYXVWWG1pmI/tu2fTwnjzL
         zZc2c0rPJZVH+bN3nUjLdQWxuGpt1G6b8u/7topmyo8gzknEB8558tGgnpMbiSvvO6
         m7nsaQOmjdgENyuSr90/4FV/7OxPSvs93/GEvUnFxoz8zEsP91q9P43KSzgmgAZxKy
         QNhCtqIMkYU6Q==
In-Reply-To: <20220929235536.618370-1-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Sep 29, 2022 at 6:55 PM Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> Since fdt_next_tag() in a public API function all input parameters,
> including the fdt blob should not be trusted. It is possible to forge
> a blob with invalid property length that will cause integer overflow
> during offset calculation. To prevent that validate the property length

comma: ...that, validate...

> read from the blob before doing calculations.
>
> Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  libfdt/fdt.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 90a39e8..c3e112a 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -186,11 +186,17 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>
>         case FDT_PROP:
>                 lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> -               if (!can_assume(VALID_DTB) && !lenp)
> +               if (!can_assume(VALID_DTB) &&
> +                   (!lenp || (INT_MAX <= fdt32_to_cpu(*lenp))))

We now have fdt32_to_cpu(*lenp) 4 times. Stick it in a local var.

>                         return FDT_END; /* premature end */
> +
>                 /* skip-name offset, length and value */
>                 offset += sizeof(struct fdt_property) - FDT_TAGSIZE
>                         + fdt32_to_cpu(*lenp);
> +
> +               if (offset < 0)

Needs a can_assume(VALID_DTB) check.

> +                       return FDT_END; /* premature end */
> +
>                 if (!can_assume(LATEST) &&
>                     fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
>                     ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
> --
> 2.37.3
>
