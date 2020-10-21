From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 1/3] pylibfdt: allow build out of tree
Date: Wed, 21 Oct 2020 14:35:49 +1100
Message-ID: <20201021033549.GC95552@yekko.fritz.box>
References: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
 <20201012073405.1682782-2-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6Vw0j8UKbyX0bfpA"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1603252687;
        bh=oaNytyb9PuIkhEgar9VS69pFKzh9osXIaHHAfJFI4nY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=osh7wrDdMXkoHeTwCtqgoK6LCNVm99jXJa7P5CBhcsdbYGm+CEyCTVCy4yH/2yccs
         3DRRxbmMjp1liJo6BN+EHzek+MlAvFUnGIGrWGl+F3idzeR7B7XgvwEFKGwticsApz
         RAyTCNhUxJGLFeAInOJtxSAvETUHLDe2xtdc8q0g=
Content-Disposition: inline
In-Reply-To: <20201012073405.1682782-2-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--6Vw0j8UKbyX0bfpA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 11:34:03AM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> With meson, we have to support out-of-tree build.
>=20
> Introduce a --top-builddir option, which will default to the current
> directory to lookup generated filed such as version_gen.h and output
> directories.
>=20
> Other source paths are derived from the location of the setup.py script
> in the source tree.
>=20
> --build-lib is changed to be relative to the current directory, instead
> of relative to setup.py. This has less surprising results!
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  pylibfdt/Makefile.pylibfdt |  4 ++--
>  pylibfdt/setup.py          | 27 +++++++++++++++++++--------
>  2 files changed, 21 insertions(+), 10 deletions(-)
>=20
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> index 6866a0b..1b5f236 100644
> --- a/pylibfdt/Makefile.pylibfdt
> +++ b/pylibfdt/Makefile.pylibfdt
> @@ -10,7 +10,7 @@ PYLIBFDT_CLEANDIRS_L =3D build __pycache__
>  PYLIBFDT_CLEANDIRS =3D $(PYLIBFDT_CLEANDIRS_L:%=3D$(PYLIBFDT_dir)/%)
> =20
>  SETUP =3D $(PYLIBFDT_dir)/setup.py
> -SETUPFLAGS =3D
> +SETUPFLAGS =3D --top-builddir .
> =20
>  ifndef V
>  SETUPFLAGS +=3D --quiet
> @@ -18,7 +18,7 @@ endif
> =20
>  $(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP) $(VERSION_FILE)
>  	@$(VECHO) PYMOD $@
> -	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D../$(PYLIBFDT_=
dir)
> +	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D$(PYLIBFDT_dir)
> =20
>  install_pylibfdt: $(PYMODULE)
>  	@$(VECHO) INSTALL-PYLIB
> diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> index 53f2bef..ef40f15 100755
> --- a/pylibfdt/setup.py
> +++ b/pylibfdt/setup.py
> @@ -19,23 +19,33 @@ import sys
>  VERSION_PATTERN =3D '^#define DTC_VERSION "DTC ([^"]*)"$'
> =20
> =20
> +def get_top_builddir():
> +    if '--top-builddir' in sys.argv:
> +        index =3D sys.argv.index('--top-builddir')
> +        sys.argv.pop(index)
> +        return sys.argv.pop(index)
> +    else:
> +        return os.getcwd()
> +
> +
> +srcdir =3D os.path.dirname(os.path.abspath(sys.argv[0]))
> +top_builddir =3D get_top_builddir()
> +
> +
>  def get_version():
> -    version_file =3D "../version_gen.h"
> +    version_file =3D os.path.join(top_builddir, 'version_gen.h')
>      f =3D open(version_file, 'rt')
>      m =3D re.match(VERSION_PATTERN, f.readline())
>      return m.group(1)
> =20
> =20
> -setupdir =3D os.path.dirname(os.path.abspath(sys.argv[0]))
> -os.chdir(setupdir)
> -
>  libfdt_module =3D Extension(
>      '_libfdt',
> -    sources=3D['libfdt.i'],
> -    include_dirs=3D['../libfdt'],
> +    sources=3D[os.path.join(srcdir, 'libfdt.i')],
> +    include_dirs=3D[os.path.join(srcdir, '../libfdt')],
>      libraries=3D['fdt'],
> -    library_dirs=3D['../libfdt'],
> -    swig_opts=3D['-I../libfdt'],
> +    library_dirs=3D[os.path.join(top_builddir, 'libfdt')],
> +    swig_opts=3D['-I' + os.path.join(srcdir, '../libfdt')],
>  )
> =20
>  setup(
> @@ -44,5 +54,6 @@ setup(
>      author=3D'Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
>      description=3D'Python binding for libfdt',
>      ext_modules=3D[libfdt_module],
> +    package_dir=3D{'': srcdir},
>      py_modules=3D['libfdt'],
>  )

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6Vw0j8UKbyX0bfpA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+PrJMACgkQbDjKyiDZ
s5LzTxAA5Gfgikz5Lv4HRmAktx3b+rFCc7cSvab3X+QGHQuxJercM+w8hMM8Npb+
2C4L6W04QVRLkL2mfVgUpY46jHG99Z4YJjvRLS/Z200eMxTUFnPWCbEHduMUghuM
e9ghujbBR+n4JbQGLi0THaL2/paJts2WUxjAIkotIdhO1gu4svQkkKL1aO4MWowX
UW/6tdTm/piH4VS7+q+JIeyW/K+ShbDMpPhnlzbZET70kPXu0EfNB9ZiiToA87sy
xWlgMyQeBiaUxtenlPQ1/CsScTvI6cieWtW6xXTi/iloWAzO7lmFM7IT6P5u8AVO
hQ4Xq2bfKDrFZLc10j5HUCh4RrgPpzwEJYCQegBouiBx5KebSk6HDtzfwt/3mOR+
/U5OJxeJ8e+6owL3xIWXwZtj38RzxJCbPq9VCZKlvDuoXHM5Tpy82fO0Sg5xs7oK
dZKCJFYhkbyXK8cKSTUBYuVQviEvgX6ivxS1Qg+hesBdBYq+7+1tF5PXRDfxmHnA
4UIu+Z3wyl37XBcIW7dv3AAWeXUkDka1zZJFnIrszOgy+3rK/5YJZCaQZPazmD6p
j80HQ9lxx1LPu0exAFk2YDUubw5clfr8WW6TIM69rah9GcuNqCT48rYkUUq9n30w
45s81e1b/SgW1kJc+1W24OD1Xr3K22dXfFD4m14jgc1E38K8iZo=
=2Hqs
-----END PGP SIGNATURE-----

--6Vw0j8UKbyX0bfpA--
