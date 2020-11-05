From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] libfdt: Internally perform potentially unaligned loads
Date: Thu, 5 Nov 2020 10:27:17 -0600
Message-ID: <CAL_JsqKokvvjyUxe-skEvsRGisP+gm79VbbXFQuksitgkYHUcQ@mail.gmail.com>
References: <20201104222943.27508-1-trini@konsulko.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604593649;
        bh=OXHiIGXTBz9Ap3aMwLzBkOWfvFFApceWeOWdgv6uu+Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IBnK8rN7PhM+lNbeX63r6ecQQy+V4oj40tzBu56Jkcpl2kzqauFargt9Mn+VlReLa
         alRuTd/v4QKJPXFtE+lEEtbHa4B3J1n0Paab704AKYWrd3ch03LWT+PBTkLQIE62U3
         +Tp/QrAA/Z+6wgIXBGR6gf/Aqx0nq0mSG2sc1FwY=
In-Reply-To: <20201104222943.27508-1-trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Wed, Nov 4, 2020 at 4:29 PM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>
> Commits 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words"
> introduced changes to support unaligned reads for ARM platforms and
> 11738cf01f15 "libfdt: Don't use memcpy to handle unaligned reads on ARM"
> improved the performance of these helpers.
>
> On further discussion, while there are potential cases where we could be
> used on platforms that do not fixup unaligned reads for us, making this
> choice the default is very expensive in terms of binary size and access
> time.  To address this, introduce and use new _fdt{32,64}_ld functions
> that call fdt{32,64}_to_cpu() as was done prior to the above mentioned
> commits.  Leave the existing load functions as unaligned-safe and
> include comments in both cases.
>
> Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  fdtget.c        |  2 +-
>  libfdt/fdt_ro.c | 20 ++++++++++----------
>  libfdt/libfdt.h | 23 +++++++++++++++++++----
>  3 files changed, 30 insertions(+), 15 deletions(-)
>
> diff --git a/fdtget.c b/fdtget.c
> index 777582e2d45f..0f643eb20a2e 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -62,7 +62,7 @@ static int show_cell_list(struct display_info *disp, const char *data, int len,
>         for (i = 0; i < len; i += size, p += size) {
>                 if (i)
>                         printf(" ");
> -               value = size == 4 ? fdt32_ld((const fdt32_t *)p) :
> +               value = size == 4 ? _fdt32_ld((const fdt32_t *)p) :
>                         size == 2 ? (*p << 8) | p[1] : *p;
>                 printf(fmt, value);
>         }
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 91cc6fefe374..414b417362a8 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -181,8 +181,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
>         if (!can_assume(VALID_INPUT) && !re)
>                 return -FDT_ERR_BADOFFSET;
>
> -       *address = fdt64_ld(&re->address);
> -       *size = fdt64_ld(&re->size);
> +       *address = _fdt64_ld(&re->address);
> +       *size = _fdt64_ld(&re->size);
>         return 0;
>  }
>
> @@ -192,7 +192,7 @@ int fdt_num_mem_rsv(const void *fdt)
>         const struct fdt_reserve_entry *re;
>
>         for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
> -               if (fdt64_ld(&re->size) == 0)
> +               if (_fdt64_ld(&re->size) == 0)
>                         return i;
>         }
>         return -FDT_ERR_TRUNCATED;
> @@ -370,7 +370,7 @@ static const struct fdt_property *fdt_get_property_by_offset_(const void *fdt,
>         prop = fdt_offset_ptr_(fdt, offset);
>
>         if (lenp)
> -               *lenp = fdt32_ld(&prop->len);
> +               *lenp = _fdt32_ld(&prop->len);
>
>         return prop;
>  }
> @@ -408,7 +408,7 @@ static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
>                         offset = -FDT_ERR_INTERNAL;
>                         break;
>                 }
> -               if (fdt_string_eq_(fdt, fdt32_ld(&prop->nameoff),
> +               if (fdt_string_eq_(fdt, _fdt32_ld(&prop->nameoff),
>                                    name, namelen)) {
>                         if (poffset)
>                                 *poffset = offset;
> @@ -461,7 +461,7 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>
>         /* Handle realignment */
>         if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
> -           (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
> +           (poffset + sizeof(*prop)) % 8 && _fdt32_ld(&prop->len) >= 8)
>                 return prop->data + 4;
>         return prop->data;
>  }
> @@ -479,7 +479,7 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
>                 int namelen;
>
>                 if (!can_assume(VALID_INPUT)) {
> -                       name = fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
> +                       name = fdt_get_string(fdt, _fdt32_ld(&prop->nameoff),
>                                               &namelen);
>                         if (!name) {
>                                 if (lenp)
> @@ -488,13 +488,13 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
>                         }
>                         *namep = name;
>                 } else {
> -                       *namep = fdt_string(fdt, fdt32_ld(&prop->nameoff));
> +                       *namep = fdt_string(fdt, _fdt32_ld(&prop->nameoff));
>                 }
>         }
>
>         /* Handle realignment */
>         if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
> -           (offset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
> +           (offset + sizeof(*prop)) % 8 && _fdt32_ld(&prop->len) >= 8)
>                 return prop->data + 4;
>         return prop->data;
>  }
> @@ -519,7 +519,7 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
>                         return 0;
>         }
>
> -       return fdt32_ld(php);
> +       return _fdt32_ld(php);
>  }
>
>  const char *fdt_get_alias_namelen(const void *fdt,
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index b600c8d6dd41..d5f11d6df48c 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -126,12 +126,27 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
>  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
>
>  /*
> - * Alignment helpers:
> - *     These helpers access words from a device tree blob.  They're
> - *     built to work even with unaligned pointers on platforms (ike
> - *     ARM) that don't like unaligned loads and stores
> + * Internal helpers to access words from a device tree blob.  Assume that we
> + * are on a platform where unaligned memory reads will be handled in a graceful
> + * manner and that we do not need to ensure our reads are aligned.  If this is
> + * not the case there are _unaligned versions of these functions that follow
> + * and can be used.
>   */
> +static inline uint32_t _fdt32_ld(const fdt32_t *p)

As internal helpers, they should go in libfdt_internal.h.

With that,

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
