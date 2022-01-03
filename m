From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] Revert "libfdt: Add static lib to meson build"
Date: Mon, 3 Jan 2022 02:59:13 -0700
Message-ID: <CAPnjgZ2+SdumGaCp7TTvJ-WtC4=VdH6mbvAL+q6Hx3oRoCtjEw@mail.gmail.com>
References: <20220103073855.1468799-1-marcandre.lureau@redhat.com> <20220103073855.1468799-2-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9FUr02wcIOnQW+fd/iac0BICi+lm93e29gznqOyFgSc=;
        b=f0mQCp3fprX9421UOqG+hB6w02yk6fI9ERMM+1Lpzl+v+RsStSKvAmSM4pyD0uaVbZ
         FHYO+OfXIRS1IvqV8SO1B8q+nkOkY3Xn1jPuQ/GoIrOZFG7+tZJxWE4njwZtDOy2HL8m
         Fzy04Vnf/If7u+dS9BvCzFKVi227W6Th17zv8=
In-Reply-To: <20220103073855.1468799-2-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Hi Marc-Andr=C3=A9,

On Mon, 3 Jan 2022 at 00:39, <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> You can build the static library by running meson configure
> -Ddefault_library=3Dboth or static.
>
> This reverts commit 5216f3f1bbb70aef463b6cd78dbbb0f4c4c71606.

What is the reason for the revert?

Regards,
Simon

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  libfdt/meson.build | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/libfdt/meson.build b/libfdt/meson.build
> index 71f29b61e870..0307ffb8d7b9 100644
> --- a/libfdt/meson.build
> +++ b/libfdt/meson.build
> @@ -24,11 +24,6 @@ libfdt =3D library(
>    install: true,
>  )
>
> -libfdt_a =3D static_library(
> -  'fdt', sources,
> -  install: true,
> -)
> -
>  libfdt_inc =3D include_directories('.')
>
>  libfdt_dep =3D declare_dependency(
> --
> 2.34.1.8.g35151cf07204
>
