From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 2/3] build-sys: add meson build
Date: Wed, 21 Oct 2020 14:44:38 +1100
Message-ID: <20201021034438.GD95552@yekko.fritz.box>
References: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
 <20201012073405.1682782-3-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1603252687;
        bh=4XsZkBojLsqMcAigDWaU473nWzlp/xAM1TfmX6W08yI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nP1HgocHpqZXYKu+G5gQT2bKttFX+IJhra10BH3+xpH0jEbKmlHfijN0urqkDabPh
         C1tjCzkjklEc32J4kcKyC8g+DLYrmbCNaiWRrUcY84vqhqiD5awermMCNJl+ZW7t0r
         AGevyGnKLpqc4TZQ3IaVYICx4P7wu6/1gf6PN4nw=
Content-Disposition: inline
In-Reply-To: <20201012073405.1682782-3-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 11:34:04AM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> The meson build system allows projects to "vendor" dtc easily, thanks to
> subproject(). QEMU has recently switched to meson, and adding meson
> support to dtc will help to handle the QEMU submodule.
>=20
> meson rules are arguably simpler to write and maintain than
> the hand-crafted/custom Makefile. meson support various backends, and
> default build options (including coverage, sanitizer, debug/release
> etc, see: https://mesonbuild.com/Builtin-options.html)
>=20
> Compare to the Makefiles, the same build targets should be built and
> installed and the same tests should be run ("meson test" can be provided
> extra test arguments for running the equivalent of checkm/checkv).
>=20
> There is no support EXTRAVERSION/LOCAL_VERSION/CONFIG_LOCALVERSION,
> instead the version is simply set with project(), and vcs_tag() is
> used for git/dirty version reporting (This is most common and is
> hopefully enough. If necessary, configure-time options could be added
> for extra versioning.).
>=20
> libfdt shared library is build following regular naming conventions:
> instead of libfdt.so.1 -> libfdt-1.6.0.so (with current build-sys),
> libfdt.so.1 -> libfdt.so.1.6.0. I am not sure why the current build
> system use an uncommon naming pattern. I also included a libfdt.pc
> pkg-config file, as convenience.
>=20
> Both Linux native build and mingw cross-build pass. CI pass. Tests are
> only run on native build.
>=20
> The current Makefiles are left in-tree, and make/check still work.
> Eventually, the Makefiles could be marked as deprecated, to start a
> transition period and avoid having to maintain 2 build systems in the
> near future.
>=20
> (run_tests.sh could eventually be replaced by the meson test runner,
> which would have several advantages in term of flexibility/features,
> but this is left for another day)
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Can you add some docs on how to actually invoke the meson build.  The
next patch suggests "meson build", but for me that seems to just
configure but not actually build anything:

$ meson build
The Meson build system
Version: 0.55.3
Source dir: /home/dwg/src/dtc
Build dir: /home/dwg/src/dtc/build
Build type: native build
Project name: dtc
Project version: 1.6.0
C compiler for the host machine: ccache cc (gcc 10.2.1 "cc (GCC) 10.2.1 202=
00723 (Red Hat 10.2.1-1)")
C linker for the host machine: cc ld.bfd 2.34-5
Host machine cpu family: x86_64
Host machine cpu: x86_64
Compiler for C supports arguments -Wall: YES=20
Compiler for C supports arguments -Wpointer-arith: YES=20
Compiler for C supports arguments -Wcast-qual: YES=20
Compiler for C supports arguments -Wnested-externs: YES=20
Compiler for C supports arguments -Wstrict-prototypes: YES=20
Compiler for C supports arguments -Wmissing-prototypes: YES=20
Compiler for C supports arguments -Wredundant-decls: YES=20
Compiler for C supports arguments -Wshadow: YES=20
meson.build:18: WARNING: Consider using the built-in warning_level option i=
nstead of using "-Wall".
Found pkg-config: /bin/pkg-config (1.6.3)
Run-time dependency yaml-0.1 found: YES 0.2.2
Run-time dependency valgrind found: NO (tried pkgconfig)
Program python3 found: YES (/usr/bin/python3)
Program swig found: YES
Found git repository at /home/dwg/src/dtc
Compiler for C supports link arguments -Wl,--version-script=3D/home/dwg/src=
/dtc/libfdt/version.lds: YES=20
Program flex found: YES
Program bison found: YES
Check usable header "fnmatch.h" : YES=20
Program setup.py found: YES
Program /home/dwg/src/dtc/pylibfdt/setup.py found: YES (/home/dwg/src/dtc/p=
ylibfdt/setup.py)
Library dl found: YES
Program run_tests.sh found: YES
Build targets in project: 81

Found ninja-1.10.1 at /bin/ninja

Having to run "ninja -C build test" to run the tests is then pretty
horrible.  Especially since it doesn't actually show the test summary
=66rom run_tests.sh unless you delve into the logs.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+PrqUACgkQbDjKyiDZ
s5JlQA//bqOxmko/SJw/MAFdYcWsSFihSetx+e7zKOifIcmzHy0m5efIf7Hv5PDA
RBNhYXe9QDEPo7TqaNMMnGS0CRlRbqydl6p7N80fIKcI/Vn+jhQMl/QB5yEkZIep
YUjBF7e6hu9Yt7prdTLdQMpDMfcm6KtdzVHq9qlENnG9gPhz2+pX2G+CnLGnRqw5
611KFOFTKBqc4hGibrzNiCIEgSe3t9LjN3BZ8WkQo2jYy5rTAEN94UhIDicG0udJ
6uutVW6ytd4wDNQYruw+roMy1jfF6gETex8WXte72jYO9A67l/jtjG6Bget8u/cH
PxE8TMit8c53Avbh1Rwurg+yaWjb/9Hn4Bg7AsmkSVSrSJsopBG9ivZ7MjODbJjk
lwqmIEHjMB0Ch2hgeSSvhI9AxhvvqLQrczH7g33LxKnnIB6EvpWOPb4spSHk1ANm
r1CTGqUL48I6usd08hK4sK7n4AaOoIgovYGBKqQKN1A5ubj17t/Ym3IqBxUerbzB
A7jgMOrxJ+ZmuspPSdkPiXjtnPoteTcrV/+FtuMKKvAZLocA3FlIO0oQTePtJ+yj
xsDKBRwx9KbKg1+wRExlxFiMYU9wUvpCliKV3OU3Thj6GvDFoIb2mPbObzjvVGlt
KOcJAaVx88jz4fpe3fEw8tPUGVp3TJAugdceO73GoQmatBHh034=
=Zyss
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--
