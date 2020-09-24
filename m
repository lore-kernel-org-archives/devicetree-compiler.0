From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 10/14] libfdt: libfdt_wip: Fix comparison warning
Date: Thu, 24 Sep 2020 14:49:18 +1000
Message-ID: <20200924044918.GP2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-11-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cmVHo2jXx4bdYlgS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600923032;
        bh=vZ51nqkPFqY7zWkOgipyjABVIZlQBvpYqgt5GwSzCRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=if9EGU6Bes8RY3KYJVEe1NSiYDjQcLDHyDWLJT/z2KlkEejPb33vrdrXkSI0HsOCE
         f2O8KJ2ij+39Wl80EfjQ/KmB+lNMcb5BeD6EMqa7lXowVvxC/jUxhLbjphIB67F5OF
         EQXpL7DDCOD2rXdiDWAJkve1IqAkrG4CSwc9/aMQ=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-11-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--cmVHo2jXx4bdYlgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:59PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_setprop_inplace_namelen_partial().
>=20
> Since fdt_getprop_namelen() can return negative error values, check for
> those first and bail out early.
> Later on we can then safely cast the value to an unsigned type.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  libfdt/fdt_wip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index f64139e..d1b4f1b 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -20,10 +20,10 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, in=
t nodeoffset,
> =20
>  	propval =3D fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
>  					&proplen);
> -	if (!propval)
> +	if (!propval || proplen < 0)
>  		return proplen;

We don't actually need that test - if proplen < 0 with propval
non-NULL, that's a bug in fdt_getprop_namelen_w().

> -	if (proplen < (len + idx))
> +	if ((unsigned)proplen < (len + idx))
>  		return -FDT_ERR_NOSPACE;
> =20
>  	memcpy((char *)propval + idx, val, len);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cmVHo2jXx4bdYlgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9sJU0ACgkQbDjKyiDZ
s5LrzhAAykB3IJLpCNsLr0jpbAioBM6Eqp9Ln/8sg0PSbqbeQNddOPf46oZhdCGL
Xz2DDO5jY7jzf3bU/t2qYzq1KfRzcmtMVxcmKeTQOsAnEHOBj3WUi7usIBW1z1Bj
7BC4A9TCzebn+wQZYwUjerZL6LWwS1XvpL7Sw2e9+BGm8ZmahJeWtFqMDU5WfA+i
FpeChilNYQ3JeesUvOQyfZkLKI3TxPNyYeIg2z0ucl6vtlFXm/W3rhwo2F+UImJ2
LdhDmyrnxbMEFKNsfSNhTlYZoFHY80MzY2B2R2OH6pIz9lgfQCH7/UFJU/D9xNpt
UglrtI8WEGgDZS+2TiZOp/INS3RIc8r552Ux4Dm4bi8IH4jjEb8zOSmgQaqcFM6H
IGikrF35vjE5g2FlqlRIK2WajZCVw5KXMOHkbnHTgwXKzsX+DnNl+OKKkJn5JDo+
W+ZQAHLw4IyaPiIxISsiXMaWhcq/Le2cESgesnpmeBXj34LToUH9T6bGRzVtlFxf
UFq2q4N7MpDKw6V0Nu7CEm9MBP6EZjBN0IG3Rz3EcJ5bARZT8IDjsdYVzLdTO2Og
NtGfPiuYJFuWmFwbKvFpl0rN6Md+6foax1m0UJRQ+ialnLvbO1K5wYvEVnGbT8Gw
R0wVFa1LPf9Qs/pR8w4SyIkOKvkAbzzEVjTpQls62fJOUG4t0ZA=
=ei9C
-----END PGP SIGNATURE-----

--cmVHo2jXx4bdYlgS--
