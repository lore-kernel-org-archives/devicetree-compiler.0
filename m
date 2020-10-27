From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/3] build-sys: add meson build
Date: Tue, 27 Oct 2020 15:08:47 -0500
Message-ID: <CAL_Jsq+bOxx=2rahno6yqbV_T7_DpzGjKsqmu9=iWcum-PjBKg@mail.gmail.com>
References: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
 <20201012073405.1682782-3-marcandre.lureau@redhat.com> <20201021034438.GD95552@yekko.fritz.box>
 <CAMxuvazLYGVnQxQec9t0GNRF5_g8JvPKiX1=tNqqAY4itZ1JYg@mail.gmail.com>
 <20201022041538.GH1821515@yekko.fritz.box> <CAMxuvax2Rc3ADTxCBWHb0b6OoGDWRsg3GEe+gH6YPe0M0+pNXw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603829339;
        bh=rOHnwECuflA+UxL7OmMG2kmJjHORNuXiwtyvxsGhZR4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GT5mwW12CM5J7reBvrrKoqj8uKUy06eHanRnUINf1zCUDPYCfN/IKQgLKlDd05j6m
         16//yWeBrcME65a81B+YYeXVT44TvOvEtf06NQhQsUlpKFaeDXG6hwCddxcGPdpSfC
         gjiFRqUCWOZt6HWH9YTi24SAuyeZKujackwRFP2g=
In-Reply-To: <CAMxuvax2Rc3ADTxCBWHb0b6OoGDWRsg3GEe+gH6YPe0M0+pNXw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Oct 27, 2020 at 11:13 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi
>
> On Thu, Oct 22, 2020 at 8:17 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Wed, Oct 21, 2020 at 11:05:09AM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > > Hi
> > >
> > > On Wed, Oct 21, 2020 at 7:58 AM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Mon, Oct 12, 2020 at 11:34:04AM +0400, marcandre.lureau@redhat.c=
om wrote:
> > > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > >
> > > > > The meson build system allows projects to "vendor" dtc easily, th=
anks to
> > > > > subproject(). QEMU has recently switched to meson, and adding mes=
on
> > > > > support to dtc will help to handle the QEMU submodule.
> > > > >
> > > > > meson rules are arguably simpler to write and maintain than
> > > > > the hand-crafted/custom Makefile. meson support various backends,=
 and
> > > > > default build options (including coverage, sanitizer, debug/relea=
se
> > > > > etc, see: https://mesonbuild.com/Builtin-options.html)
> > > > >
> > > > > Compare to the Makefiles, the same build targets should be built =
and
> > > > > installed and the same tests should be run ("meson test" can be p=
rovided
> > > > > extra test arguments for running the equivalent of checkm/checkv)=
.
> > > > >
> > > > > There is no support EXTRAVERSION/LOCAL_VERSION/CONFIG_LOCALVERSIO=
N,
> > > > > instead the version is simply set with project(), and vcs_tag() i=
s
> > > > > used for git/dirty version reporting (This is most common and is
> > > > > hopefully enough. If necessary, configure-time options could be a=
dded
> > > > > for extra versioning.).
> > > > >
> > > > > libfdt shared library is build following regular naming conventio=
ns:
> > > > > instead of libfdt.so.1 -> libfdt-1.6.0.so (with current build-sys=
),
> > > > > libfdt.so.1 -> libfdt.so.1.6.0. I am not sure why the current bui=
ld
> > > > > system use an uncommon naming pattern. I also included a libfdt.p=
c
> > > > > pkg-config file, as convenience.
> > > > >
> > > > > Both Linux native build and mingw cross-build pass. CI pass. Test=
s are
> > > > > only run on native build.
> > > > >
> > > > > The current Makefiles are left in-tree, and make/check still work=
.
> > > > > Eventually, the Makefiles could be marked as deprecated, to start=
 a
> > > > > transition period and avoid having to maintain 2 build systems in=
 the
> > > > > near future.
> > > > >
> > > > > (run_tests.sh could eventually be replaced by the meson test runn=
er,
> > > > > which would have several advantages in term of flexibility/featur=
es,
> > > > > but this is left for another day)
> > > > >
> > > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aJhl2p70BpVqQ@public.gmane.org=
m>
> > > >
> > > > Can you add some docs on how to actually invoke the meson build.  T=
he
> > > > next patch suggests "meson build", but for me that seems to just
> > > > configure but not actually build anything:
> > >
> > > Sure, the way to invoke it is just like a regular meson project.
> >
> > Well, sure, but meson is not yet widespread enough that we can assume
> > people know what that is.  The only meson project I'm familiar with is
> > qemu, and I still invoke it via "make".

I've used meson in a couple of projects and it's still not quite in my
muscle memory. In any case, pretty much every project documents how to
build and install.

> Would it help if configure & make wrap meson for you?

I'd say only if that means dropping the bulk of the Makefiles.

> Should we then drop the Makefile-based build system?

What do most projects do? Distro packagers just deal with the change
when updating versions, or projects carry both until the main distros
have updated to meson builds?

Rob
