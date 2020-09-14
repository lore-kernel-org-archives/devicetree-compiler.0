From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/10] RFC: Add meson build system
Date: Mon, 14 Sep 2020 17:38:19 +0400
Message-ID: <CAMxuvazUHKzb+Bqtwmk_i-13VR1x6J1NLBnu-vdXZwfRzq1pLQ@mail.gmail.com>
References: <20191009102025.10179-1-marcandre.lureau@redhat.com>
 <255ce5aa-9e96-8275-43e3-c4d0b56fa260@gmail.com> <CAL_Jsq+nEDXgL+SfwPEOJ-rLLPE6=jjk-hJ2wtuQTdmWY0DWfg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600090712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qDq1xUh44zae9QQufHSsiHBt3J/xEGoHBzrSxMq3t/8=;
        b=LMo0HYoNeoJjl7Tqr8RXSD2ZzlAE5Txw/NP67o35s5ZJSKYV8YVtsdQUAEfucrwMafkSoV
        IOlb12NCXZMaLkeOMyaCiUd3rgHLj848/dI3bxyfQ3cAveRtYQ6NgT7sYCxR9I/Pi+rn6c
        Dl6kY5LCZUTCkiPpcxE7ucR4yEh1VYY=
In-Reply-To: <CAL_Jsq+nEDXgL+SfwPEOJ-rLLPE6=jjk-hJ2wtuQTdmWY0DWfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "Bonzini, Paolo" <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Hi

On Tue, Oct 22, 2019 at 8:26 PM Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Mon, Oct 21, 2019 at 2:07 PM Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> >
> > + Rob
> >
> > and my response inline below.
> >
> > On 10/09/2019 05:20, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > Hi,
> > >
> > > This series adds support for meson build system. The main reason for
> > > this, beside build-sys modernization, is to enable subproject()
> > > support in qemu.
> > >
> > > Maintaining several build systems is a pain, so eventually it would b=
e
> > > nice to deprecate Makefile build-sys, as I can imagine this may take =
a
> >
> > Removing the Makefile method would be problematic for the Linux kernel
> > source tree, where we import dtc from the upstream project and build
> > it as part of the kernel build.
>
> That was my first thought too. However, we do our own kbuild
> makefiles, so we're not affected there. We do copy over Makefile.dtc,
> and probably could use it, but don't currently.

If there is no such plan, now that qemu switched to meson, can we
reconsider the switch of dtc?

Thanks

