From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: Work-around SWIG limitations with flexible arrays
Date: Wed, 1 Feb 2023 15:49:50 -0700
Message-ID: <CAPnjgZ31cwHMCr1NgszUmW4p1NKBAnmMPfX9frJVPEZ23RMBCg@mail.gmail.com>
References: <20230201224441.305757-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTwsNsIqYmrhjm3ctxdXj4KdEzKcr4xbc/w1jDeTA+U=;
        b=oAFEuOEk+wosIgCG3SPNW2hbiUNSQUa10r5ywcYV3qxhnXwSjt3c3j26UlB5wF1qld
         UAcSzOjJ7V0TOfOj6joDFX+iRvUZRLAGRatKGdDNBknPTNkj+xlmy6hPcIV1sGamKUoX
         m9BtI9hX6tSCZmlwZS9rWBKWvv+WLwOY0NhDM=
In-Reply-To: <20230201224441.305757-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

On Wed, 1 Feb 2023 at 15:44, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Commit a41509bea3e7 ("libfdt: Replace deprecated 0-length arrays with
> proper flexible arrays") fails to build pylibfdt:
>
> ./pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_node_header_name=
_set=E2=80=99:
> ./pylibfdt/libfdt_wrap.c:4350:18: error: cast specifies array type
>  4350 |     arg1->name =3D (char [])(char *)memcpy(malloc((size)*sizeof(c=
har)), (const char *)(arg2), sizeof(char)*(size));
>       |                  ^
> ./pylibfdt/libfdt_wrap.c:4350:16: error: invalid use of flexible array me=
mber
>  4350 |     arg1->name =3D (char [])(char *)memcpy(malloc((size)*sizeof(c=
har)), (const char *)(arg2), sizeof(char)*(size));
>       |                ^
> ./pylibfdt/libfdt_wrap.c:4352:16: error: invalid use of flexible array me=
mber
>  4352 |     arg1->name =3D 0;
>       |                ^
> ./pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_property_data_se=
t=E2=80=99:
> ./pylibfdt/libfdt_wrap.c:4613:18: error: cast specifies array type
>  4613 |     arg1->data =3D (char [])(char *)memcpy(malloc((size)*sizeof(c=
har)), (const char *)(arg2), sizeof(char)*(size));
>       |                  ^
> ./pylibfdt/libfdt_wrap.c:4613:16: error: invalid use of flexible array me=
mber
>  4613 |     arg1->data =3D (char [])(char *)memcpy(malloc((size)*sizeof(c=
har)), (const char *)(arg2), sizeof(char)*(size));
>       |                ^
> ./pylibfdt/libfdt_wrap.c:4615:16: error: invalid use of flexible array me=
mber
>  4615 |     arg1->data =3D 0;
>       |                ^
>
> Turns out this is known issue with SWIG: https://github.com/swig/swig/iss=
ues/1699
>
> Implement the work-around to ignore the flexible array member.
>
> Fixes: a41509bea3e7 ("libfdt: Replace deprecated 0-length arrays with pro=
per flexible arrays")
> Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  pylibfdt/libfdt.i | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index f9f7e7e66d13..987f7b9c3339 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -1036,6 +1036,9 @@ class NodeAdder():
>
>  %rename(fdt_property) fdt_property_func;
>
> +%immutable fdt_property::data;
> +%immutable fdt_node_header::name;
> +
>  /*
>   * fdt32_t is a big-endian 32-bit value defined to uint32_t in libfdt_en=
v.h
>   * so use the same type here.
> --
> 2.39.0
>

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Just 'make check':
Tested-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
