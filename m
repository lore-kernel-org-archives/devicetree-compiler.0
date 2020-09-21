From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/4] pylibfdt: allow build out of tree
Date: Mon, 21 Sep 2020 16:27:51 +1000
Message-ID: <20200921062751.GB17169@yekko.fritz.box>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-2-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600669759;
        bh=4bMlSAjp2njKrtKUnrKlNA4DsmzJmef9/Ycqy9kE4+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MXBxfUpQwYuzj8atctG0xN/5iytcVgxrewwtm5J9FFnf8QqdxN5C5xrqqO4STKKoO
         vD6G6NzXFki1KkHLdLnarctH4KNqgChHRHBkcOImFxukM99dpB6AMT/DYQ6XCFEdWI
         TSJ3hu4t/EyMa18y10FmST8uk210Eq9wu3qdquck=
Content-Disposition: inline
In-Reply-To: <20200915192705.1716282-2-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 11:27:02PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> With meson, we have to support out-of-tree build. Fix path lookup.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  pylibfdt/Makefile.pylibfdt |  2 +-
>  pylibfdt/setup.py          | 25 +++++++++++++++++--------
>  2 files changed, 18 insertions(+), 9 deletions(-)
>=20
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> index 6866a0b..32ae1c5 100644
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
> index 53f2bef..f8ec924 100755
> --- a/pylibfdt/setup.py
> +++ b/pylibfdt/setup.py
> @@ -19,23 +19,31 @@ import sys
>  VERSION_PATTERN =3D '^#define DTC_VERSION "DTC ([^"]*)"$'
> =20
> =20
> +def get_top_builddir():
> +    assert '--top-builddir' in sys.argv

I see you've added the option to the Makefile, but if this were
invoked manually, I'm not sure that you want to just die if the
--top-builddir option isn't included.

Even if you do, I think you want a more meaningful error than an
assertion failure.

> +    index =3D sys.argv.index('--top-builddir')
> +    sys.argv.pop(index)
> +    return sys.argv.pop(index)
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
> @@ -44,5 +52,6 @@ setup(
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

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9oR+cACgkQbDjKyiDZ
s5KPJA//e5uqYmwMmgFWNGHDQwTEeWKc0vxC47vnkwwFWWliABL3BqS4s4mu2mB1
lNQ3vp/tcu+GHUpm9/MCgWDZOswAzNOm1iNmj4RIbmrlU7r0VyRB2BtvdyEmN1TW
YrqKVKKpcuAseS7/sQxOCQiQ0ociw5aYkI6nk97DyR8p9QB3Xhd+fCO6ToVzVUMq
a2a4plCJoVdAIK6IEj4MxfYpEBjmUFOqZIUUbIkkN13cw2ikKdV0DDggm4wgvidC
GsZ4ExodXRI26FFNynEyjm46/Rec9ugOb1hCT0FL+CsjPeHyYbzm6PUH7i28Tnf+
VK/Obsx7nWylZk1iOn7hgX5lBkcXNKoxi5g7laB1v9l+Up8aVFtc52lT75o8s7qJ
p644w4c9l5MqbJAgWXcn6DrnGJRIxi2mTJVrOBvOOwatAb9GJ9+tN120Jcg5g5go
JZr5td0LSuv8wWFKmLaE6r8TE0TBje4Co2ZbHKboAVtA5KpjkgBz02gmlo4xgpgt
AZ/Qaov2erDPjnvQQJBKqSVQIwCasBzvrEu6olZOBoN2qoMXCuhoCUHob8iMHw6Q
W9blW7RCHUhU/x+bFFMoEPfG/qDa+PNhZgrLCpCFZi9SSqHIHMUlDQoYKzKQCoze
BP8zelxGRovYxOej9xCHWpHbq7p9Fpl616QE/m1xCHKHIH47UI4=
=0Pp4
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
