From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/4] pylibfdt: allow build out of tree
Date: Mon, 12 Oct 2020 16:43:19 +1100
Message-ID: <20201012054319.GF4787@yekko.fritz.box>
References: <20201006082712.241224-1-marcandre.lureau@redhat.com>
 <20201006082712.241224-3-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602481764;
        bh=6KtOnfYnK0jKhEsz3QK4N1rgYFMFu0b7asGBRNLchr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OojhxPLPwDBUcLYVjnkBvHpDaXKz61tniT+cZgSxxfoM9OHJDEk8dled/9a1nDM9z
         k87YRhO4RB875aoEg9yBO6/S/6uIjL2n0m9JEm47Dy7SLL0ds+awioQ7GzJjlxqMpH
         v7nhtRuqV5o0+6Dg1VCPfNhsFkK8vLrZCjfxn1Hg=
Content-Disposition: inline
In-Reply-To: <20201006082712.241224-3-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 12:27:10PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
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
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  pylibfdt/Makefile.pylibfdt |  2 +-
>  pylibfdt/setup.py          | 27 +++++++++++++++++++--------
>  2 files changed, 20 insertions(+), 9 deletions(-)
>=20
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> index 0c07224..1b5f236 100644
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

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+D7PYACgkQbDjKyiDZ
s5LTxBAAu8KF2dUmp52wmjdevdLtzb2ng7sjlTzoe2jVK359kbUEv1M3eCm2DgjV
3jBhH3fum0RajXGFRIGXGNUwiBz0Yph0Qs8nr2yduhB5/zGL4lAO1CmgYw+mfyeL
sZZvIpHEmeKZktJ0Xi8AiR4esuMlKjXXFAcyxpCTLP1BxDBNYohHXQV1ebZQAi/D
x9FlWBtVuGXNyYpmgZ8rc6u1qy+gBUj4dZGwm3R7M5lmFvurfe+MxJLDGrpvOuek
5gmtdWtAAvLD47GLMOYB7Bs78cH1hLIxGQLKwtVk54UjwM/Rj1LOm6HUEO9O5NBd
uWJC6+Kxk/MqIkqHi4b10FQrDUhN+L/YRNvwFB9U4ONFQOcVOZApEBxOFLf02OY7
VGQh484H9SiAcXsAsBJDYzsmBI+SYug7A+vvy70bZx4ZaFhN3KxPdEZuqHyzCW8T
U8cdav47KjMVT6sCcKko9T/BMukZhn2isagWR2PN+Nv32gP8pXvU/mYsnCu0Pt5l
JUeSDsC2xaTYXfCq+XjrG9FgGMxMnMoI24o0lUDVC9dAjKgVziLtaJyybOInjfc/
VFDIBXKAIHjoFDE8qLQVfHIX2O9QF07GP81dq5nr/MhKDFs5tUjJFPIHKI2kFHNy
bB+kKQYo07MXtje0Nya07+H/zlqbXQJw8+QPtmuRzUBs5AYwVT4=
=UIzw
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
