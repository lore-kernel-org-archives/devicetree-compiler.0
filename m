From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 02/11] convert-dtsv0: Fix signedness comparisons warning
Date: Tue, 13 Oct 2020 15:48:49 +1100
Message-ID: <20201013044849.GL71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZrCu0B0FMx3UnjE2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565778;
        bh=53nLNgL6M18ppuktdGI3+pK9QLNHpNXBmtyiWtu8BGs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=glh4clB9Eazd7BCCeivdvABxZCbNGDQs5N+5E6DtcLTV0gXMrYAUELwOLMVMuV2f5
         0hOd9926mby67IGT/0IWTAmh4+DYZb63IaO+7jYXwyiykQc7DTtSAFfwLP6+CsB96X
         1yZ7KqJZCmqQjnLZeCF5CopodNvzdJp8IzLHHvUc=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-3-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--ZrCu0B0FMx3UnjE2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:39PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> comparisons in the generated lexer code.
>=20
> In this case we walk over an array, and never use negative indicies, so
> we can change the loop counter variable to be unsigned.
>=20
> This fixes "make convert-dtsv0", when compiled with -Wsign-compare.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  convert-dtsv0-lexer.l | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/convert-dtsv0-lexer.l b/convert-dtsv0-lexer.l
> index f52e8a1..7a66f57 100644
> --- a/convert-dtsv0-lexer.l
> +++ b/convert-dtsv0-lexer.l
> @@ -94,7 +94,7 @@ static const struct {
>  <INITIAL>[0-9a-fA-F]+	{
>  			unsigned long long val;
>  			int obase =3D 16, width =3D 0;
> -			int i;
> +			unsigned int i;
> =20
>  			val =3D strtoull(yytext, NULL, cbase);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZrCu0B0FMx3UnjE2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FMbEACgkQbDjKyiDZ
s5JjrA//bOnvS+d+giVXgK5I/Y3UGsp/LN9oHd9fLYquvMxbeDyPWskyTsvR5Oow
1gFjq5UYRJkc+2xFNqIvYRoToWXtW8lSqs1QlGAQWMeVfhvgnAZ3axwnbNaxWMBa
JWJcWwyKhLzzA9z9eEO3FJ/qUglqeweCOrVczNUi6d9Bk2vHYU/zsCEVnkibWKvO
fs2urnxUeTHlBx1z+EiZ6W8cbW+qFlGqnYZvO1swH9FXW2XBAtWV5cbh/aVrkXhQ
FR9oVaGN0ImHfIv0b23JxMxGoSOUv+x57fZN4DdiT0C3LUi75q+ZNQerbQS3LHQw
ONbggm3qzSvax4i0hxK8Mynw2QJAwkarym99Z5MRB/w08eeqxq/x6dats4XQPeER
evBsV2va5dyIK+624FEkLuuWCmIhrHcelC0EzYb0VhLwsYYd9iNmWQ1FZ5MSPtQ1
bJ2Ze5Fg3EkaqFemFzquNqPc+1Gsvd3fhAu6medti6GP6ZrLXSSzwNuSaP8URb6d
aaNszuXFh0xFEEvBga5GZU55vILSaXeuHCze7FMezrpLANs4VNfDZTBr9UXzcHOf
6XqiOQuPt0TpUJQWZ7TzP5znvAM8+RA2bq4hPURr1jbY+JfBjyA9HEZmxjgm5aqc
UJjEBtMNA+RXAkyqA/v8vG8VxNO4m7Jskcg3aOEdnWDsG673ulY=
=2+nw
-----END PGP SIGNATURE-----

--ZrCu0B0FMx3UnjE2--
