From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/3] checks: Drop interrupt provider '#address-cells'
 check
Date: Mon, 11 Oct 2021 15:57:29 +1100
Message-ID: <YWPEOTo4hG3Uy9yk@yekko>
References: <20210928212335.2061125-1-robh@kernel.org>
 <20210928212335.2061125-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TMnn2VUQeTLxYa2V"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1633928318;
        bh=s0qjZpPdSJPwbG78EpJUqTP71YJe+i28UBNHfpUha2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NT7Z7ZmA5og926AAjyDwv3cVMCeAKD8SSVS6RSnqQjldirZANzayz3Pdx0Yi2Bn8a
         kcL5FoZWnuLDIDDhDfmWOUHqUdI8ZOJ9UG81uYDoClEbHIC86xv40H7aDfc8F3qi+1
         FQRPqQG7PNAQ1gH7A62R0QxcBeuQ/jxzp5R03Ik4=
Content-Disposition: inline
In-Reply-To: <20210928212335.2061125-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--TMnn2VUQeTLxYa2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 04:23:34PM -0500, Rob Herring wrote:
> '#address-cells' is only needed when parsing 'interrupt-map' properties, =
so
> remove it from the common interrupt-provider test.
>=20
> Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

(in the context of the previous patch)

> ---
>  checks.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index d4e7facd7f37..2efa36377e80 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1581,11 +1581,6 @@ static void check_interrupt_provider(struct check =
*c,
>  	if (!prop)
>  		FAIL(c, dti, node,
>  		     "Missing #interrupt-cells in interrupt provider");
> -
> -	prop =3D get_property(node, "#address-cells");
> -	if (!prop)
> -		FAIL(c, dti, node,
> -		     "Missing #address-cells in interrupt provider");
>  }
>  WARNING(interrupt_provider, check_interrupt_provider, NULL);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TMnn2VUQeTLxYa2V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFjxDkACgkQbDjKyiDZ
s5JYdw/9HVRx5S9WhpRHLYuLrXuifOof6PQLJOcN34BBlCo4yzqzNdMhvOmWhN0m
pRLWw87oXBDAbg/pyxEMdvPdlovbYPSyYUVM56LU9get7kwAmPffEgu1/oGzQyC3
WPaMBkdA7Z6a9jtxHpyCVNeX13kgA7y0yvWjcsSiAqMiSD/ktLCCan8p5Vj2vr3F
FTyhPy/yyKxHuReJtiY0VkHBjUVdhkmMY9njQkBhO/bmH4hfpvRAcBAP8CeMdaTK
ZiCvj+KOD1pESeZgDh0GwIp0Fj5fdie6GMhjcnf+tfxa9mKDeB41JKp5DIZcuETb
PgMhF2Tj5T14OSFPAsaxT2wRVY09cBQyij99bZ9kV34cTR2AjOzj8kZdlJteBFAD
H9RByPKx1+NP/0OFhaSKMq0wmv4+8iPYmWQVVoFLccdoY1L69W8Cm4iLp4QzQFRN
iisZOFDans8pyqHYnlqyM9T0kj7hURcKthET45NiZu0CACn/VO985EgynxHmL7w0
p5z1c6AE8j/RkpLrErU6ot7kJUnpWyQqy3JVhizCtHc9wLsG8VQ3o4J9A0+8F8l1
INbmrT2jYQyBcU1gUbhw1CqmNQHyuxd1HzEqONxEA+KhOf4yulfpLfEnQ0GlK4wa
FtybG/3cPPl6UcZnb3lhUi8524gTX32HFrbQhXgs/IOTKA05KaY=
=uQ2o
-----END PGP SIGNATURE-----

--TMnn2VUQeTLxYa2V--
