From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: fix with Python 3.10
Date: Fri, 12 Nov 2021 12:46:09 +1100
Message-ID: <YY3HYfUtMHB2hvZ6@yekko>
References: <20211111160536.2516573-1-ross.burton@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2qxqgciBGc5/a3AI"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636682041;
        bh=ITtw1TSyix5jLMJxDyoSJTlQvKyhP5aVmPnFTelciUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OWO9/AMVED+tnECxWNfRTZ7G9V8BE1TgmTdOT6n6/IcCLEumhI8kfKdvz7URau8pw
         DyBdcDr8R+yfUT88YCxOmel9gnD1gV+UftSCVaAZUQuz1aJ0CUb+25OiyT7oFeUqIB
         NZ8FXFxy/OmisG806W4xpgpNwC0zXTjp6ukUWorA=
Content-Disposition: inline
In-Reply-To: <20211111160536.2516573-1-ross.burton-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ross Burton <ross.burton-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--2qxqgciBGc5/a3AI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 04:05:36PM +0000, Ross Burton wrote:
> Since Python 2.5 the argument parsing functions when parsing expressions
> such as s# (string plus length) expect the length to be an int or a
> ssize_t, depending on whether PY_SSIZE_T_CLEAN is defined or not.
>=20
> Python 3.8 deprecated the use of int, and with Python 3.10 this symbol
> must be defined and ssize_t used[1].
>=20
> Define the magic symbol when building the extension, and cast the ints
> from the libfdt API to ssize_t as appropriate.
>=20
> [1] https://docs.python.org/3.10/whatsnew/3.10.html#id2
>=20
> Signed-off-by: Ross Burton <ross.burton-5wv7dgnIgG8@public.gmane.org>

Applied (with the correct to the setup.py location).  Thanks!

> ---
>  pylibfdt/libfdt.i | 4 ++--
>  pylibfdt/setup.py | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 51ee801..075ef70 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -1044,9 +1044,9 @@ typedef uint32_t fdt32_t;
>  		$result =3D Py_None;
>  	else
>          %#if PY_VERSION_HEX >=3D 0x03000000
> -            $result =3D Py_BuildValue("y#", $1, *arg4);
> +            $result =3D Py_BuildValue("y#", $1, (Py_ssize_t)*arg4);
>          %#else
> -            $result =3D Py_BuildValue("s#", $1, *arg4);
> +            $result =3D Py_BuildValue("s#", $1, (Py_ssize_t)*arg4);
>          %#endif
>  }
> =20
> diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> index ef40f15..81e161a 100755
> --- a/pylibfdt/setup.py
> +++ b/pylibfdt/setup.py
> @@ -42,6 +42,7 @@ def get_version():
>  libfdt_module =3D Extension(
>      '_libfdt',
>      sources=3D[os.path.join(srcdir, 'libfdt.i')],
> +    define_macros=3D[('PY_SSIZE_T_CLEAN', None)],
>      include_dirs=3D[os.path.join(srcdir, '../libfdt')],
>      libraries=3D['fdt'],
>      library_dirs=3D[os.path.join(top_builddir, 'libfdt')],

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2qxqgciBGc5/a3AI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGNx14ACgkQbDjKyiDZ
s5KmKxAAmGZ5t3dykrpyrludoTO9yIja3pYgon7RX4s3/XZFMDc1M2zFrxfYeUGL
o8Pv1Mr+4psSphmUY/ykhlZNgx6hnYrpuVDKlEn6in/PXv9ktoVqj0f65wljrPt0
oK087EfIJw6R99Fu5CxPsgvC7Ga1eZ7QBK8f/CsHdu1A9cKGz0RtsNGohoVhGWIB
p3MzkQaOYwfjPCLefQz505paBjHy+ZDQWQ789WcSnBxrH0E8Nk5Kk8Yw/H/VxHeq
EUCewWMMhT9eRAVoSCq7wjQRFRcVnBEpr5Xaqj6hToKG251pIGnYN0DddoKnj09U
ZdHgvxsB1txj0XX1EDNgAJJSAqCsChCltVR/yFiVaolaL4pg+SvPniJGjRc8/l/m
zAnbElDqq+ufo6aI9zrn0RdkUm/8fZU+3zffwYRmHh7gHYxFSXHsGBCezoHGZfp+
akMkBQ0DpNnQ6VaTckI4BZQmeXBgnx3v+WN9X8dtqT6G2uA0bOOMiyJdqqLrdYxn
RtDoI/SjyWF3bFRGrq0HfanW6So/uliV4zgCHtbW26CAZd62r9YJw538vqFQxFUv
HLenXIMUxN8CeFZBRxEYN0JkRiKTRyA9otFPrgFftz+Aep6mXfKQ1xpV6DkCPax6
+H4xv49Pt046QfrniP7lg/ibyg3709E9c2WyGtk/MlBkoH9NxuI=
=l1nd
-----END PGP SIGNATURE-----

--2qxqgciBGc5/a3AI--
