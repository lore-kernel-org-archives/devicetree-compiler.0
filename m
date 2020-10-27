From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 2/3] build-sys: add meson build
Date: Wed, 28 Oct 2020 00:31:46 +0400
Message-ID: <CAMxuvay7Nu7ShtoeZpqjqpzosBg7Oe52HD9xma4DiDUOF_-gvg@mail.gmail.com>
References: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
 <20201012073405.1682782-3-marcandre.lureau@redhat.com> <20201021034438.GD95552@yekko.fritz.box>
 <CAMxuvazLYGVnQxQec9t0GNRF5_g8JvPKiX1=tNqqAY4itZ1JYg@mail.gmail.com>
 <20201022041538.GH1821515@yekko.fritz.box> <CAMxuvax2Rc3ADTxCBWHb0b6OoGDWRsg3GEe+gH6YPe0M0+pNXw@mail.gmail.com>
 <CAL_Jsq+bOxx=2rahno6yqbV_T7_DpzGjKsqmu9=iWcum-PjBKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603830721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7b8mwqLWpzD6TXo9QS08oZketBox+kh8ho+C6TDg+hI=;
        b=PRcezjbh1PqjKwLNdqd4GglcVmPlfX3Jga9Zi+yWoMIwGiw6brBI072p/9PNx8x2RZukle
        CgAV0cMDDr4XvPba2e7vaOxUzzW4BG2hzSdkwv5BL46hVmRG7k3+Fyi01EmXZs7HNWnt1p
        Cetz9MM7elzE24Km7hzypO+GbDL/88Q=
In-Reply-To: <CAL_Jsq+bOxx=2rahno6yqbV_T7_DpzGjKsqmu9=iWcum-PjBKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi

On Wed, Oct 28, 2020 at 12:17 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Tue, Oct 27, 2020 at 11:13 AM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > Hi
> >
> > On Thu, Oct 22, 2020 at 8:17 AM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Wed, Oct 21, 2020 at 11:05:09AM +0400, Marc-Andr=C3=A9 Lureau wrot=
e:
> > > > Hi
> > > >
> > > > On Wed, Oct 21, 2020 at 7:58 AM David Gibson
> > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > >
> > > > > On Mon, Oct 12, 2020 at 11:34:04AM +0400, marcandre.lureau@redhat=
.com wrote:
> > > > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > > >
> > > > > > The meson build system allows projects to "vendor" dtc easily, =
thanks to
> > > > > > subproject(). QEMU has recently switched to meson, and adding m=
eson
> > > > > > support to dtc will help to handle the QEMU submodule.
> > > > > >
> > > > > > meson rules are arguably simpler to write and maintain than
> > > > > > the hand-crafted/custom Makefile. meson support various backend=
s, and
> > > > > > default build options (including coverage, sanitizer, debug/rel=
ease
> > > > > > etc, see: https://mesonbuild.com/Builtin-options.html)
> > > > > >
> > > > > > Compare to the Makefiles, the same build targets should be buil=
t and
> > > > > > installed and the same tests should be run ("meson test" can be=
 provided
> > > > > > extra test arguments for running the equivalent of checkm/check=
v).
> > > > > >
> > > > > > There is no support EXTRAVERSION/LOCAL_VERSION/CONFIG_LOCALVERS=
ION,
> > > > > > instead the version is simply set with project(), and vcs_tag()=
 is
> > > > > > used for git/dirty version reporting (This is most common and i=
s
> > > > > > hopefully enough. If necessary, configure-time options could be=
 added
> > > > > > for extra versioning.).
> > > > > >
> > > > > > libfdt shared library is build following regular naming convent=
ions:
> > > > > > instead of libfdt.so.1 -> libfdt-1.6.0.so (with current build-s=
ys),
> > > > > > libfdt.so.1 -> libfdt.so.1.6.0. I am not sure why the current b=
uild
> > > > > > system use an uncommon naming pattern. I also included a libfdt=
.pc
> > > > > > pkg-config file, as convenience.
> > > > > >
> > > > > > Both Linux native build and mingw cross-build pass. CI pass. Te=
sts are
> > > > > > only run on native build.
> > > > > >
> > > > > > The current Makefiles are left in-tree, and make/check still wo=
rk.
> > > > > > Eventually, the Makefiles could be marked as deprecated, to sta=
rt a
> > > > > > transition period and avoid having to maintain 2 build systems =
in the
> > > > > > near future.
> > > > > >
> > > > > > (run_tests.sh could eventually be replaced by the meson test ru=
nner,
> > > > > > which would have several advantages in term of flexibility/feat=
ures,
> > > > > > but this is left for another day)
> > > > > >
> > > > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.=
com>
> > > > >
> > > > > Can you add some docs on how to actually invoke the meson build. =
 The
> > > > > next patch suggests "meson build", but for me that seems to just
> > > > > configure but not actually build anything:
> > > >
> > > > Sure, the way to invoke it is just like a regular meson project.
> > >
> > > Well, sure, but meson is not yet widespread enough that we can assume
> > > people know what that is.  The only meson project I'm familiar with i=
s
> > > qemu, and I still invoke it via "make".
>
> I've used meson in a couple of projects and it's still not quite in my
> muscle memory. In any case, pretty much every project documents how to
> build and install.
>
> > Would it help if configure & make wrap meson for you?
>
> I'd say only if that means dropping the bulk of the Makefiles.
>
> > Should we then drop the Makefile-based build system?
>
> What do most projects do? Distro packagers just deal with the change
> when updating versions, or projects carry both until the main distros
> have updated to meson builds?

It depends, as meson is still a fairly recent build system. Early
adopters had some transition period where both Makefile/autotools and
meson were maintained side by side to ease that transition (iirc, mesa
or glib), especially for older distro. But recently, a lot of projects
have done a full switch (libvirt & qemu for example), even though they
target quite ancient distro (up to 2y old-stable/LTS for example).
They manage to do that in some cases by shipping meson as a submodule
(or relying on pip at build-time in some distros perhaps).

I don't remember checking which version is required by the meson.build
proposed here. I can do that, if it helps. Then we can compare with
what's available out of the box from various distros via
https://repology.org/project/meson/versions.

We can make it easier for the packager by wraping meson in configure &
make shim, as done by various projects. But tbh, I don't think it
helps the packager, as he still need to be aware that meson is
required. And nowadays, there are various macros or declarative ways
to package meson projects in various distros.

