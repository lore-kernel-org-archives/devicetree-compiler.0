From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 06/14] libfdt: fdt_get_string(): Fix comparison warnings
Date: Thu, 24 Sep 2020 11:06:38 +1000
Message-ID: <20200924010638.GL2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-7-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ucfHZChuBC0NsER/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600911797;
        bh=bbbDr0TP0scEjD0OoC3i/VV3jQVwu0zRrBlWFDjgziY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FjMamvZHKSxWzjx3R8z/6iejvqHe2WxfRy12AAxect9RhvNy7MrGATaLtts+UqNfr
         plKPgdA7kQe1d42nrvi5Ao2lM4BdtRGLsyHCyMxT8UoBVSUCmh3seQ4MITtB3Dohdp
         qPhBd6uCZsq2xYwhMIVvffLbVaieScHq1Mm2O7oU=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-7-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--ucfHZChuBC0NsER/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:55PM +0100, Andre Przywara wrote:
> From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> With -Wsign-compare, compilers warn about a mismatching signedness in
> comparisons in fdt_get_string().
>=20
> In the first two cases, we have just established that the signed values
> are not negative, so it's safe to cast the values to an unsigned type.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_ro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 3c8d143..ddb5a2d 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -53,7 +53,7 @@ const char *fdt_get_string(const void *fdt, int stroffs=
et, int *lenp)
> =20
>  	err =3D -FDT_ERR_BADOFFSET;
>  	absoffset =3D stroffset + fdt_off_dt_strings(fdt);
> -	if (absoffset >=3D totalsize)
> +	if (absoffset >=3D (unsigned)totalsize)
>  		goto fail;
>  	len =3D totalsize - absoffset;
> =20
> @@ -61,7 +61,7 @@ const char *fdt_get_string(const void *fdt, int stroffs=
et, int *lenp)
>  		if (stroffset < 0)
>  			goto fail;
>  		if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
> -			if (stroffset >=3D fdt_size_dt_strings(fdt))
> +			if ((unsigned)stroffset >=3D fdt_size_dt_strings(fdt))
>  				goto fail;
>  			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
>  				len =3D fdt_size_dt_strings(fdt) - stroffset;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ucfHZChuBC0NsER/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9r8R4ACgkQbDjKyiDZ
s5J9mRAAzJqvv56AWTl56RnGne4RwkoyjemxFj5OgLMzd9BHXPpToY3HnXho99UF
62lZxXy1PdJewfRyXyNDZZaD1xottxIMgkAhrZzaEba28LS15W3lBp6LByUQhI/B
hkAwaS9PC1WSuaYym7QxWgsOZGjkS6Ck74uv494xHLukbQB4FM9H14gUMA2IQdqO
l8AR8Q+YMYKzeFfgv8bIs8J2hTtnXh5OSyS4sGMXfgK3Hw7MdiKxSTOl8eFTSAS/
2kdfblzrVixjBn5wAqblmTkNAOkD9BNNwkOFGah6HRY6fiBHm9HpK4Q9JmcDVQxy
0Nzr/PjOSJ4Ox6zcIY3Lme0XEsdkulb7QcMAjNsHFaE0sGkn6GjBInRyuv67fcc6
UW6UqXy2TJaLb4KbSgL0jdVmEqz0eYtMtAXCTxIHZ1dQnhSn5qnkto7C6OgxubUO
GVQR08bhkp9nhpaDcZtgh5YN2kjaSgVDJzqCLStuaYXlSpG3CfREQmbTu2/FMs1a
1LdQ0HRohSGfcGmmUzc0wthITwI0HkXPxuIZbao66wlwZZpqpsCzj/kVL0lFeSur
x7xn5rh8wWFhs2BV+2HtmkOyTxzBUDjyKpsVyYtgjsKmuYLe+X2vF5khKscKGN7f
c7y2Zo3NmT1U/f/ZXdWTPxpFgTogCud7N1Eg0k6kaaTJzv52yX0=
=+oND
-----END PGP SIGNATURE-----

--ucfHZChuBC0NsER/--
