From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 2/3] build-sys: add meson build
Date: Wed, 28 Oct 2020 17:03:37 +1100
Message-ID: <20201028060337.GF5604@yekko.fritz.box>
References: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
 <20201012073405.1682782-3-marcandre.lureau@redhat.com>
 <20201021034438.GD95552@yekko.fritz.box>
 <CAMxuvazLYGVnQxQec9t0GNRF5_g8JvPKiX1=tNqqAY4itZ1JYg@mail.gmail.com>
 <20201022041538.GH1821515@yekko.fritz.box>
 <CAMxuvax2Rc3ADTxCBWHb0b6OoGDWRsg3GEe+gH6YPe0M0+pNXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1603865065;
        bh=wYUW4UU/5Ak2z1KOsrsW+2zCP064Xm+ICkGhkQdFCdM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSmqxSI/kbN3zfbJqPu4a45TmaF4oLflfRLbc9Lwef2MxsKTUr52OTits2rbtV6kt
         2JLBbsrjw9vZu9h0XWU08pgqeIfFpXre8X6v/pD9UQ2TrdVvdGvSU0RByle95Q4Dl5
         0ZgCiuTDDXSC7BdaP1YlbXYcBWDK1T8XT2eE1png=
Content-Disposition: inline
In-Reply-To: <CAMxuvax2Rc3ADTxCBWHb0b6OoGDWRsg3GEe+gH6YPe0M0+pNXw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 08:09:39PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Thu, Oct 22, 2020 at 8:17 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Wed, Oct 21, 2020 at 11:05:09AM +0400, Marc-Andr=E9 Lureau wrote:
> > > Hi
> > >
> > > On Wed, Oct 21, 2020 at 7:58 AM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Mon, Oct 12, 2020 at 11:34:04AM +0400, marcandre.lureau@redhat.c=
om wrote:
> > > > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
> > > > > extra test arguments for running the equivalent of checkm/checkv).
> > > > >
> > > > > There is no support EXTRAVERSION/LOCAL_VERSION/CONFIG_LOCALVERSIO=
N,
> > > > > instead the version is simply set with project(), and vcs_tag() is
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
> > > > > system use an uncommon naming pattern. I also included a libfdt.pc
> > > > > pkg-config file, as convenience.
> > > > >
> > > > > Both Linux native build and mingw cross-build pass. CI pass. Test=
s are
> > > > > only run on native build.
> > > > >
> > > > > The current Makefiles are left in-tree, and make/check still work.
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
> > > > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
>=20
> Would it help if configure & make wrap meson for you?

That sounds like it could be a good idea.  Although there is no
"configure" for dtc.

> Should we then drop the Makefile-based build system?
>=20
> >
> > > I
> > > will add some notes to the README.
> > >
> > > >
> > > > $ meson build
> > > > The Meson build system
> > > > Version: 0.55.3
> > > > Source dir: /home/dwg/src/dtc
> > > > Build dir: /home/dwg/src/dtc/build
> > > > Build type: native build
> > > > Project name: dtc
> > > > Project version: 1.6.0
> > > > C compiler for the host machine: ccache cc (gcc 10.2.1 "cc (GCC) 10=
=2E2.1 20200723 (Red Hat 10.2.1-1)")
> > > > C linker for the host machine: cc ld.bfd 2.34-5
> > > > Host machine cpu family: x86_64
> > > > Host machine cpu: x86_64
> > > > Compiler for C supports arguments -Wall: YES
> > > > Compiler for C supports arguments -Wpointer-arith: YES
> > > > Compiler for C supports arguments -Wcast-qual: YES
> > > > Compiler for C supports arguments -Wnested-externs: YES
> > > > Compiler for C supports arguments -Wstrict-prototypes: YES
> > > > Compiler for C supports arguments -Wmissing-prototypes: YES
> > > > Compiler for C supports arguments -Wredundant-decls: YES
> > > > Compiler for C supports arguments -Wshadow: YES
> > > > meson.build:18: WARNING: Consider using the built-in warning_level =
option instead of using "-Wall".
> > > > Found pkg-config: /bin/pkg-config (1.6.3)
> > > > Run-time dependency yaml-0.1 found: YES 0.2.2
> > > > Run-time dependency valgrind found: NO (tried pkgconfig)
> > > > Program python3 found: YES (/usr/bin/python3)
> > > > Program swig found: YES
> > > > Found git repository at /home/dwg/src/dtc
> > > > Compiler for C supports link arguments -Wl,--version-script=3D/home=
/dwg/src/dtc/libfdt/version.lds: YES
> > > > Program flex found: YES
> > > > Program bison found: YES
> > > > Check usable header "fnmatch.h" : YES
> > > > Program setup.py found: YES
> > > > Program /home/dwg/src/dtc/pylibfdt/setup.py found: YES (/home/dwg/s=
rc/dtc/pylibfdt/setup.py)
> > > > Library dl found: YES
> > > > Program run_tests.sh found: YES
> > > > Build targets in project: 81
> > > >
> > > > Found ninja-1.10.1 at /bin/ninja
> > > >
> > > > Having to run "ninja -C build test" to run the tests is then pretty
> > > > horrible.  Especially since it doesn't actually show the test summa=
ry
> > > > from run_tests.sh unless you delve into the logs.
> > >
> > > If an error occurred, it would print it on the console.
> >
> > Ok, that helps substantially.  Still too wordy and non-obvious to
> > invoke it though.
>=20
> We could "make check" run the script in a more verbose way if we
> decide to wrap meson build there.

I guess.  It concerns me if there's no more succinct "meson native"
way of invoking the tests.

> > > But to get a
> > > summary on success, you have to look at the log: run_tests.sh isn't
> > > very nice for meson. It would be better if it provided TAP output, or
> > > even better probably, if the tests would be run by meson.
> >
> > Well, sure, but when I started the dtc testsuite all the test
> > frameworks I could find were so intimidating I never would have
> > started writing actual tests if I'd tried to use them.
>=20
> fwiw, I used BATS (https://github.com/sstephenson/bats) in some other
> project that was using shell to test executables. I can investigate
> that too for a future series if you don't mind relying on bash & git
> submodules ;).

Patches considered, but I absolutely do not have time to tackle
porting the dtc testsuite to a different framework myself.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+ZCbcACgkQbDjKyiDZ
s5IqfA/7BYmK3erC73Y5V/kO1J3bNXo8UjSFc8MgIsgYMSAnz3uoWCsbH4ud7kyg
E/jfSIrrwpqaOvCf/CEnULoGnyA8u6oupufn60FKWajqXFpVG1qmvxT1dX6PzzkX
dqMW6slDfTuzVqpPvg6wZANgOn7+vpGgYt0MxTCcPfegtkpy3LmMS5IavkzbdjJx
befT4nN5cnlSQpdqD4VuZ/dHL8nEfpioaaKNvyWMkWYhf4s9RRwR0Mcyswr/1bnh
m5JB7Zvoly3JxMXkHfDJXehZHj78LXupv5qIXTzsACNityNX+2/cQfURCB+LGyJ9
mVk06Gn+LVZy8tA1O7bsJza8SA1/Trb/nIOt6kgaEMLSnGO47FNWXggulhRCehY+
fA5Mw+h91gRi7mY5w3ZsDP9soFyImELM+N6O80aGo8FX7Fpgat2Ziir2bonLLhvd
CF9AuZlFiKreBfEFn7RYoi2z3Jfz4t+ugWUc9LpKKVwr9TH9/t7DhoM5d9MmdypO
31E5EowN4fbZ7ZbOxPW/531YCGlMQFAN8NjQLXLhvwHAAnqWoRzfJuji5aDKUwL9
zzRkrJLY4DvH+sKIpv4Sw6D23F5taj/TIjewX8M2qmCHI1wn58za40BhzVizqLgt
dB+sbqMHbvbRfIfim2aVb9DW9id3x14lAlVSPHCqH2+dU3vaIJU=
=LdvP
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--
