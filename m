From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 2/3] build-sys: add meson build
Date: Thu, 22 Oct 2020 15:15:38 +1100
Message-ID: <20201022041538.GH1821515@yekko.fritz.box>
References: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
 <20201012073405.1682782-3-marcandre.lureau@redhat.com>
 <20201021034438.GD95552@yekko.fritz.box>
 <CAMxuvazLYGVnQxQec9t0GNRF5_g8JvPKiX1=tNqqAY4itZ1JYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3ecMC0kzqsE2ddMN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1603340253;
        bh=5zPyDsfDqbSKzjesWFTVuJbY+vhWq6x/QxA1MiaRNB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dRqwoXo0wRZjLFjItsXoni6LR3Bc1sEEZE+pFtrQKaBMIB834f9K4LjsyAjGn+P8l
         9JakS7iajQkBbSoupeoM1mGyXLocQlkrGiEOJJo6UwKX09r5DPpRY90Ry4icVYh0gX
         eC0pwwzGahX3VQPgWiuTMAKDvpVscEFqgVaRj2yM=
Content-Disposition: inline
In-Reply-To: <CAMxuvazLYGVnQxQec9t0GNRF5_g8JvPKiX1=tNqqAY4itZ1JYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--3ecMC0kzqsE2ddMN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 11:05:09AM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Wed, Oct 21, 2020 at 7:58 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Mon, Oct 12, 2020 at 11:34:04AM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org w=
rote:
> > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > The meson build system allows projects to "vendor" dtc easily, thanks=
 to
> > > subproject(). QEMU has recently switched to meson, and adding meson
> > > support to dtc will help to handle the QEMU submodule.
> > >
> > > meson rules are arguably simpler to write and maintain than
> > > the hand-crafted/custom Makefile. meson support various backends, and
> > > default build options (including coverage, sanitizer, debug/release
> > > etc, see: https://mesonbuild.com/Builtin-options.html)
> > >
> > > Compare to the Makefiles, the same build targets should be built and
> > > installed and the same tests should be run ("meson test" can be provi=
ded
> > > extra test arguments for running the equivalent of checkm/checkv).
> > >
> > > There is no support EXTRAVERSION/LOCAL_VERSION/CONFIG_LOCALVERSION,
> > > instead the version is simply set with project(), and vcs_tag() is
> > > used for git/dirty version reporting (This is most common and is
> > > hopefully enough. If necessary, configure-time options could be added
> > > for extra versioning.).
> > >
> > > libfdt shared library is build following regular naming conventions:
> > > instead of libfdt.so.1 -> libfdt-1.6.0.so (with current build-sys),
> > > libfdt.so.1 -> libfdt.so.1.6.0. I am not sure why the current build
> > > system use an uncommon naming pattern. I also included a libfdt.pc
> > > pkg-config file, as convenience.
> > >
> > > Both Linux native build and mingw cross-build pass. CI pass. Tests are
> > > only run on native build.
> > >
> > > The current Makefiles are left in-tree, and make/check still work.
> > > Eventually, the Makefiles could be marked as deprecated, to start a
> > > transition period and avoid having to maintain 2 build systems in the
> > > near future.
> > >
> > > (run_tests.sh could eventually be replaced by the meson test runner,
> > > which would have several advantages in term of flexibility/features,
> > > but this is left for another day)
> > >
> > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > Can you add some docs on how to actually invoke the meson build.  The
> > next patch suggests "meson build", but for me that seems to just
> > configure but not actually build anything:
>=20
> Sure, the way to invoke it is just like a regular meson project.

Well, sure, but meson is not yet widespread enough that we can assume
people know what that is.  The only meson project I'm familiar with is
qemu, and I still invoke it via "make".

> I
> will add some notes to the README.
>=20
> >
> > $ meson build
> > The Meson build system
> > Version: 0.55.3
> > Source dir: /home/dwg/src/dtc
> > Build dir: /home/dwg/src/dtc/build
> > Build type: native build
> > Project name: dtc
> > Project version: 1.6.0
> > C compiler for the host machine: ccache cc (gcc 10.2.1 "cc (GCC) 10.2.1=
 20200723 (Red Hat 10.2.1-1)")
> > C linker for the host machine: cc ld.bfd 2.34-5
> > Host machine cpu family: x86_64
> > Host machine cpu: x86_64
> > Compiler for C supports arguments -Wall: YES
> > Compiler for C supports arguments -Wpointer-arith: YES
> > Compiler for C supports arguments -Wcast-qual: YES
> > Compiler for C supports arguments -Wnested-externs: YES
> > Compiler for C supports arguments -Wstrict-prototypes: YES
> > Compiler for C supports arguments -Wmissing-prototypes: YES
> > Compiler for C supports arguments -Wredundant-decls: YES
> > Compiler for C supports arguments -Wshadow: YES
> > meson.build:18: WARNING: Consider using the built-in warning_level opti=
on instead of using "-Wall".
> > Found pkg-config: /bin/pkg-config (1.6.3)
> > Run-time dependency yaml-0.1 found: YES 0.2.2
> > Run-time dependency valgrind found: NO (tried pkgconfig)
> > Program python3 found: YES (/usr/bin/python3)
> > Program swig found: YES
> > Found git repository at /home/dwg/src/dtc
> > Compiler for C supports link arguments -Wl,--version-script=3D/home/dwg=
/src/dtc/libfdt/version.lds: YES
> > Program flex found: YES
> > Program bison found: YES
> > Check usable header "fnmatch.h" : YES
> > Program setup.py found: YES
> > Program /home/dwg/src/dtc/pylibfdt/setup.py found: YES (/home/dwg/src/d=
tc/pylibfdt/setup.py)
> > Library dl found: YES
> > Program run_tests.sh found: YES
> > Build targets in project: 81
> >
> > Found ninja-1.10.1 at /bin/ninja
> >
> > Having to run "ninja -C build test" to run the tests is then pretty
> > horrible.  Especially since it doesn't actually show the test summary
> > from run_tests.sh unless you delve into the logs.
>=20
> If an error occurred, it would print it on the console.

Ok, that helps substantially.  Still too wordy and non-obvious to
invoke it though.

> But to get a
> summary on success, you have to look at the log: run_tests.sh isn't
> very nice for meson. It would be better if it provided TAP output, or
> even better probably, if the tests would be run by meson.

Well, sure, but when I started the dtc testsuite all the test
frameworks I could find were so intimidating I never would have
started writing actual tests if I'd tried to use them.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3ecMC0kzqsE2ddMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+RB2oACgkQbDjKyiDZ
s5LbMg//ZQjguElLEQfqHdV2A5zQdmwauD3C+arkjxxbs2GSWN4gW/opErteRE/U
IlyZBkygjPlVNwjbqR1pJ2NFpA9k/PuXPpez6mq6VMCZ6CGItj+ziaSAYu3mpKOM
/am6TRant2+175nepYdRKDrG6mtxBKst2pvMyBVGPYsxKGMnEUP0PwYujxiF65Nd
3jZlUubzxcfs36zFpuOgzs+IkEKzJvMBL49BOyplWWsikPmuMJv/YlnK5K/Fcw9k
HVc0957xKIJnMOacFkfoGQ91lH80h1Zvw/7jEN+EXI6SpTaO6hmjA1GoXWyI7CMq
G6jA1wOnRJNInK5LYFZ7ONPB6zSuFwcM4RAW2tFrrFQkJcBk0cnv0zDevQSos4GU
TbnATdai92n0cBDh71O5N+1Cm99ONMZnPYJ4IwdktYlys3KZWiOklRvzIknzG+lz
rZLE0V9+U716Y4QeJ5PeOhmpTmJy6mRkSl1zbvcS8dKZz/IbbFY6umcUSucN+Xqk
zbiwQfzRfDafxXzTtQWJt97WykoEw3M8BFPDm6aybZ4qmochK34jU369tEjhhem5
Gvsu+5P506N75iuy39B+47zs9OgJ8o9zy1cgGTr+rLwic+bGEoyekyZ1b/hGgtVE
M8MbLOzMtRU+Q62/RYJncY7qjaT/D7IJHXsuJbD//rBP6jrpPdU=
=lvVe
-----END PGP SIGNATURE-----

--3ecMC0kzqsE2ddMN--
