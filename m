From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] setup.py: fix out of tree build
Date: Tue, 4 Jan 2022 10:49:50 +1100
Message-ID: <YdOLnmtDD6KEBOdY@yekko>
References: <20220103073855.1468799-1-marcandre.lureau@redhat.com>
 <20220103073855.1468799-3-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="g26pEV17jfDvtmwq"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1641263288;
        bh=xxhrWgqrTtluWl65vHg0bzb0w7/PwfGsTp3Ym1Eginc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hO399vW3rkgkDTv9ZrGooB8BwfwpmHs+S97rCXWWxRpljzqJIiNQfxophwXLeueK0
         AZIm5EwkBAEpXZfq/Qh7QJWY1QdUebAS7zOaaWCC7N9VNwc6J6OaA5YdGj6O3bUfgh
         kExAk6oez+5yizBkeXs1lZ5rkfYUBSR9jzwrhbHM=
Content-Disposition: inline
In-Reply-To: <20220103073855.1468799-3-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org


--g26pEV17jfDvtmwq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 03, 2022 at 11:38:55AM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> Fixes: commit 1cc41b1c9 ("pylibfdt: Add packaging metadata")
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  setup.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/setup.py b/setup.py
> index 00444e64337b..029aa6182221 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -17,7 +17,7 @@ import sys
> =20
>  srcdir =3D os.path.dirname(__file__)
> =20
> -with open("README", "r") as fh:
> +with open(os.path.join(srcdir, "README"), "r") as fh:
>      long_description =3D fh.read()
> =20
>  def get_top_builddir():

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--g26pEV17jfDvtmwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHTi54ACgkQbDjKyiDZ
s5LS9w/+K+I/KOaQm5GZ7MXgiPNS30EpV36iK/HXi7vv6aXGjMGP4YgqqLRWwjN/
nOBjCat88qfWTjk0s0SdLINY52QUcm8jonC+T44fnfAREdp0va4sNBRuP2AuCxb7
lFXJsQ7JfSg5/pLsPzoteZSU2YNuHurMdyUNETKJZ2O8Luys7P4Bj3nB3h8QJqnn
m49voXqsgnxVX38ZYZUo+ZjkHObj+mx0cLI4tU6mkLp1egz8P6xLNQo7+UjVnFOt
aNDh2TXzO8qi9t3HwCMJG2crUiabLVOi0auohy8dQcUXYBMVC3j45t5vZSML+PPS
uprLJZgCX5J97FYCOQixMDEYC6DbMZeWk5h0XLMXGOjXt5qw7cB0kTECdsxU3G18
zcfH5ckt0bNPB2haaaFnIQdbi5F4eY17fOCbHineZV1jEOuXWiDDDTF077zuF8ys
v8WJRitZEBdVb99SuHubnhC2RfD7ZJyB+O02Y6sh8X/rOhlK/3LCtY9IrIHWixqH
7RM/JPrUWb/Epzr2avOIJHUyjt4IvDHuYYkXA/K7Qv9LO42mgWI16a1nReVPl/sk
pyGK/KoijB847LfixuY/MxKiMWMtHYaLURJk0DcGWSjDPvC/69HkABbQ0VKlmDyR
5IGfmuzBcJSKlcLPJf7x4F9B9ubGnFJXQ8+b5xUswNUsL+cJjb8=
=MFFN
-----END PGP SIGNATURE-----

--g26pEV17jfDvtmwq--
