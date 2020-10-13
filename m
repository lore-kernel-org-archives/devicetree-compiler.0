From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 04/11] fdtget: Fix signedness comparisons warnings
Date: Tue, 13 Oct 2020 15:54:07 +1100
Message-ID: <20201013045407.GN71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-5-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A2x6GFCQWVc4i5ud"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565779;
        bh=K3FCcdGcg2db0ERz7MgmtqvXsMrOowPJG89gkDCe/jQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kNLr6BYYjTUDiVOw/iikMh+6dFm3AvVEWVq64mLD3KoPInSFrlRH55og3p6YM3Q2x
         fURebisgkHxg8Ixy+LCuX+Ftx2bIBTT26Gtr3gnMmFO6RPb5AoMzGD17XOcdqv/4Rg
         chia+utA7oCYRTlR4dU9zOx0E5tMZREwJCDj59rc=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-5-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--A2x6GFCQWVc4i5ud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:41PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> the different legs of the conditional operator, in fdtget.c.
>=20
> In the questionable expression, we are constructing a 16-bit value out of
> two unsigned 8-bit values, however are relying on the compiler's
> automatic expansion of the uint8_t to a larger type, to survive the left
> shift. This larger type happens to be an "int", so this part of the
> expression becomes signed.
>=20
> Fix this by explicitly blow up the uint8_t to a larger *unsigned* type,
> before doing the left shift. That keeps all parts of the conditional
> operator "unsigned", and prevents the original warning.
>=20
> This fixes "make fdtget", when compiled with -Wsign-compare.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  fdtget.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fdtget.c b/fdtget.c
> index 777582e..c5685d9 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -62,8 +62,8 @@ static int show_cell_list(struct display_info *disp, co=
nst char *data, int len,
>  	for (i =3D 0; i < len; i +=3D size, p +=3D size) {
>  		if (i)
>  			printf(" ");
> -		value =3D size =3D=3D 4 ? fdt32_ld((const fdt32_t *)p) :
> -			size =3D=3D 2 ? (*p << 8) | p[1] : *p;
> +		value =3D (size =3D=3D 4) ? fdt32_ld((const fdt32_t *)p) :
> +			((size =3D=3D 2) ? ((unsigned)(*p) << 8) | p[1] : *p);

Oof, yeah, that's a complicated expression.  I wonder if we should add
an fdt16_ld() to simplify this.

>  		printf(fmt, value);
>  	}
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--A2x6GFCQWVc4i5ud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FMu8ACgkQbDjKyiDZ
s5ILug//X7v797OCUFchDt7Vxk8YmoYEYdI6a/omHa+83IFgKC41gO5ERdTrGcyS
wYBEFD7ooWkVtfx+V68JneiTQP/PrXTvjfa93wc18aueDGVV2EIuTD48HCDisBiS
Hpr7/HMM4VmuzrfGTQ/ePx3KrTzMRgnmDk+uNx91UC9w8XVk9u8SgMqR+e7+ur02
3ricygB9cwD2c9AKke3E8x8k42hKMF+tV/7Fe+sIy6vVDbK9lExll9RZiOyAU9bC
tUs7oleOvovkKolje8ujIAfagE6lL/f/a1W4QFAVS2oFFTm/TMv+PfrySMP6THUF
Z/TgeJ0o6C+olfxMCZFWu2bAodwzTWrA3U/OL4xqjkAMl61s4fDjFl/iGXXXJ8H8
WYxO47ESrin7baPpoE4F//7Igr895mude0nAKUcn9/VJImU7Pm1yRwrx9/nfRlEV
sdAXvFygNg800ENkffmRPgAwKPdS2yn1RJna+fSswO3PWhrJU0wIJ/0fptk6wnZe
ryWNgoN2OP2dQwSbYJeubk6ce1hPDphc8C4RYUJ7ZxfDwgM2/NDHuh6F1RQfi5HM
s+hjU86kq0Qqjhp/oOzaf3oG+gi3sjTKTN8QCgeL+pQxIlBphQ7Z4fDvDHOrAMm9
eZXCPWO+w1ZKFMXinJWzdAk6S+Sjxs3Kv0Ol1ZL3tnNQs4RPCYc=
=9Uub
-----END PGP SIGNATURE-----

--A2x6GFCQWVc4i5ud--
