From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix Python crash on getprop deallocation
Date: Sat, 25 Dec 2021 17:29:58 +1100
Message-ID: <Yca6ZoKpCjLsFFfo@yekko>
References: <20211224102811.70695-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GHrjYgosxtoxlmhf"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1640413860;
        bh=+yU5qsn5NTWxdqMQHixwXXCfrlFozVEMEXZkx5D2Iks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OVjHQNAJGMC9Hh0RAgmTECr4HKojqGfnIhF+aoLs1BGx/isB0j9xE0DK1lIh0Tn69
         ieEJn3Uywlh17RZHn7gMxPPUSsXh4vX4uHL0bleYDlH4jmzsqbOZEn+2SHG4+u8/ZA
         /7LH/SM/9mqjk5kVVpRv/9tho5Evii24nh4lt3z8=
Content-Disposition: inline
In-Reply-To: <20211224102811.70695-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--GHrjYgosxtoxlmhf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 24, 2021 at 11:28:12AM +0100, Luca Weiss wrote:
> Fatal Python error: none_dealloc: deallocating None
> Python runtime state: finalizing (tstate=3D0x000055c9bac70920)
>=20
> Current thread 0x00007fbe34e47740 (most recent call first):
>   <no Python frame>
> Aborted (core dumped)
>=20
> This is caused by a missing Py_INCREF on the returned Py_None, as
> demonstrated e.g. in https://github.com/mythosil/swig-python-incref or
> described at https://edcjones.tripod.com/refcount.html ("Remember to
> INCREF Py_None!")
>=20
> A PoC for triggering this crash is uploaded to
> https://github.com/z3ntu/pylibfdt-crash .
> With this patch applied to pylibfdt the crash does not happen.

Any chance you could rework your testcase into the libfdt testsuite
(make check)?

> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> ---
> Unrelated but I've noticed that in this file the indentation is quite
> mixed between spaces and tabs. This patch tries to keep to the style in
> the lines around.
>=20
>  pylibfdt/libfdt.i | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 075ef70..9ccc57b 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -1040,14 +1040,16 @@ typedef uint32_t fdt32_t;
> =20
>  /* typemap used for fdt_getprop() */
>  %typemap(out) (const void *) {
> -	if (!$1)
> +	if (!$1) {
>  		$result =3D Py_None;
> -	else
> +		Py_INCREF($result);
> +	} else {
>          %#if PY_VERSION_HEX >=3D 0x03000000
>              $result =3D Py_BuildValue("y#", $1, (Py_ssize_t)*arg4);
>          %#else
>              $result =3D Py_BuildValue("s#", $1, (Py_ssize_t)*arg4);
>          %#endif
> +    }
>  }
> =20
>  /* typemap used for fdt_setprop() */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GHrjYgosxtoxlmhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHGumYACgkQbDjKyiDZ
s5J1Zw/+O6eZDDDD/XHbsDrvGJ5JZNgop02p+U5lSxvYGeTbWWKplxuA9pEITvgs
18WmeLGx0BiBsQ/BoNGG7j1WsRBaUQ+Zk3nkMg+Ju2xQlcav2RH5bdAexExpEa2A
KYJBwbYnbw1YXNeyacwUc8P73yvzxFnCFANN85LQHjKmDoPn5px3NCgSDNUaBNzP
pIHBipuL7dsyzlnkaUej8leEpmhULIX/oR9wJP2W0YdsJ+vE9jR3rvYzb33ZRM/m
uq2BN+ajlUVNOWJziBeRBtsMud0uhm4chjlFMPAcnwA5IKE7P1HYMTMsTIy40ncv
9WWG0/nr7vgryDtYSyEbSsATB2rxlzDOSQUsOFzVjepL6tzVE2vIr5G5ZUIPvzu7
vBPuAaWVOhJ/Skmcx2EUWt7nYfdXYqNiOUxPSzK6R5OkX/V+EzCiEMTsXYm2wTKr
THnDTktZw8ib6gLDiLh0jWT/n2DZEIEBw6++cdNpaW2wa7bD6fM2xx6z0ngFvJkV
n8bdjk9JG9aLkX8SJEIVsLRymAP87QpKeQnQIyDEMuFScOKZxKX+mZHjFZ/cu4mK
+ca5mGDLQY3p/SybGLqg7Vda4PXQ9qyDjjdYOe5CIvXDb1uTVPpk9laxmijAM4d+
NjLuzdkgCwrAU7qqdQPe64BjbdG5AzM6Hv9AtBkki7gT1jSlVQE=
=HtHE
-----END PGP SIGNATURE-----

--GHrjYgosxtoxlmhf--
