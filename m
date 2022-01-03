From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] Revert "libfdt: Add static lib to meson build"
Date: Mon, 3 Jan 2022 14:04:11 +0400
Message-ID: <CAMxuvazDvsbMekArEngSECHrE0EzzLccZtPVUj44SZ0s-=NwqA@mail.gmail.com>
References: <20220103073855.1468799-1-marcandre.lureau@redhat.com>
 <20220103073855.1468799-2-marcandre.lureau@redhat.com> <CAPnjgZ2+SdumGaCp7TTvJ-WtC4=VdH6mbvAL+q6Hx3oRoCtjEw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641204264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5S1Ov6h8xyVg6pr/RloSk6S63eT8npHLL6iozfStoZ8=;
        b=EIYmfQZtimD2fPL39oshlwAlfWHMcRyz5fHkI5ZEIPtxuTM3qSlrw2vmx9bAjE0InAEoCZ
        QthFNkYZjX2HMYa4O4r0H/ToGk9/J05Ymp7hjXgGyJQAtnFBXLhuOYkoCY3FIyCRQwe1sV
        Qb1+tbPJWi55AqikOXk7q15XhRPRIQE=
In-Reply-To: <CAPnjgZ2+SdumGaCp7TTvJ-WtC4=VdH6mbvAL+q6Hx3oRoCtjEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Hi Simon

On Mon, Jan 3, 2022 at 1:59 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi Marc-Andr=C3=A9,
>
> On Mon, 3 Jan 2022 at 00:39, <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > You can build the static library by running meson configure
> > -Ddefault_library=3Dboth or static.
> >
> > This reverts commit 5216f3f1bbb70aef463b6cd78dbbb0f4c4c71606.
>
> What is the reason for the revert?

Did you miss the comment above?

There is no need to have a static_library() to build a static library.
library() handles both kinds, you just have to specify with the
-Ddefault_library option what you want.

> Regards,
> Simon
>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  libfdt/meson.build | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/libfdt/meson.build b/libfdt/meson.build
> > index 71f29b61e870..0307ffb8d7b9 100644
> > --- a/libfdt/meson.build
> > +++ b/libfdt/meson.build
> > @@ -24,11 +24,6 @@ libfdt =3D library(
> >    install: true,
> >  )
> >
> > -libfdt_a =3D static_library(
> > -  'fdt', sources,
> > -  install: true,
> > -)
> > -
> >  libfdt_inc =3D include_directories('.')
> >
> >  libfdt_dep =3D declare_dependency(
> > --
> > 2.34.1.8.g35151cf07204
> >
>

