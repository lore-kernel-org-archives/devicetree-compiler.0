From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 00/10] RFC: Add meson build system
Date: Mon, 14 Sep 2020 08:44:18 -0600
Message-ID: <CAL_JsqL-WgyFPHRLvyJoT7A_Lo88nj3sydizD5sjM7VsjLEqCg@mail.gmail.com>
References: <20191009102025.10179-1-marcandre.lureau@redhat.com>
 <255ce5aa-9e96-8275-43e3-c4d0b56fa260@gmail.com> <CAL_Jsq+nEDXgL+SfwPEOJ-rLLPE6=jjk-hJ2wtuQTdmWY0DWfg@mail.gmail.com>
 <CAMxuvazUHKzb+Bqtwmk_i-13VR1x6J1NLBnu-vdXZwfRzq1pLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600094670;
        bh=NntQrU84mhVaZmmuoSoOZdzd+XDeEs+HxziJi5iv4EQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SZnLNws6eFEYtJ+6s0qev7HzNHY1/n4JPFh3nc6PRP+VVjwUHCK0awDZQEYd0iV8R
         3tI3USvxeV/bOTyR/uaDp6ax4P+/R2Y+PR5WPDlt6voHQSrUp4aNVoul2Rg0+f6Tmo
         hphyD22pBxcXo6lAFNgaUWdHnlFL5Y6ZWpY2jJgE=
In-Reply-To: <CAMxuvazUHKzb+Bqtwmk_i-13VR1x6J1NLBnu-vdXZwfRzq1pLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "Bonzini, Paolo" <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

On Mon, Sep 14, 2020 at 7:38 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi
>
> On Tue, Oct 22, 2019 at 8:26 PM Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > On Mon, Oct 21, 2019 at 2:07 PM Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> > >
> > > + Rob
> > >
> > > and my response inline below.
> > >
> > > On 10/09/2019 05:20, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > >
> > > > Hi,
> > > >
> > > > This series adds support for meson build system. The main reason fo=
r
> > > > this, beside build-sys modernization, is to enable subproject()
> > > > support in qemu.
> > > >
> > > > Maintaining several build systems is a pain, so eventually it would=
 be
> > > > nice to deprecate Makefile build-sys, as I can imagine this may tak=
e a
> > >
> > > Removing the Makefile method would be problematic for the Linux kerne=
l
> > > source tree, where we import dtc from the upstream project and build
> > > it as part of the kernel build.
> >
> > That was my first thought too. However, we do our own kbuild
> > makefiles, so we're not affected there. We do copy over Makefile.dtc,
> > and probably could use it, but don't currently.
>
> If there is no such plan, now that qemu switched to meson, can we
> reconsider the switch of dtc?

What's to reconsider? The conclusion here is no issue for the kernel.
Update this year old patchset and resubmit.

Rob
