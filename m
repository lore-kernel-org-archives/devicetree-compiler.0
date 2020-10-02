From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] checks: Relax SPI slave checks
Date: Fri, 2 Oct 2020 13:34:40 +1000
Message-ID: <20201002033440.GL1844@yekko.fritz.box>
References: <20200928201942.3242124-1-robh@kernel.org>
 <20200928201942.3242124-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lR6P3/j+HGelbRkf"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601615083;
        bh=fWKvVc6Zo8qo/LPAqho+Q38gWfFu+bFDUoRcmn05I+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jE9e+dSWUgZFNhhZmr+iGEQxOpfuJPJuT8y9bscLWulqRfbQZ2EMQ8y4byiprqc+7
         OHftnKAhmTyYd1oE7ybQ4lQu+M8J4kUfXzPFHq182pIMrvo4Sdx1Mgq+7xH9xIYT95
         gsTWewHkxMRHnSeSpyova9b5jNXHq4RwF0FlGAqE=
Content-Disposition: inline
In-Reply-To: <20200928201942.3242124-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


--lR6P3/j+HGelbRkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 03:19:42PM -0500, Rob Herring wrote:
> SPI slaves only have a single child node and therefore don't need
> '#address-cells' nor '#size-cells', so let's skip the check for those when
> 'spi-slave' is present.

I really don't like this idea.  Yes, you can work out what's going on
unambiguously because there's only one child, but that requires at
least some familiarity with SPI.  I think general consistency trumps
minimality here, and we should encourage SPI nodes to have the correct
-cells properties, even if they're not strictly essential.

>=20
> Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 17cb6890d45a..c923295c6e40 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1102,13 +1102,12 @@ static void check_spi_bus_bridge(struct check *c,=
 struct dt_info *dti, struct no
>  	if (node->bus !=3D &spi_bus || !node->children)
>  		return;
> =20
> -	if (get_property(node, "spi-slave"))
> -		spi_addr_cells =3D 0;
> -	if (node_addr_cells(node) !=3D spi_addr_cells)
> -		FAIL(c, dti, node, "incorrect #address-cells for SPI bus");
> -	if (node_size_cells(node) !=3D 0)
> -		FAIL(c, dti, node, "incorrect #size-cells for SPI bus");
> -
> +	if (!get_property(node, "spi-slave")) {
> +		if (node_addr_cells(node) !=3D spi_addr_cells)
> +			FAIL(c, dti, node, "incorrect #address-cells for SPI bus");
> +		if (node_size_cells(node) !=3D 0)
> +			FAIL(c, dti, node, "incorrect #size-cells for SPI bus");
> +	}
>  }
>  WARNING(spi_bus_bridge, check_spi_bus_bridge, NULL, &addr_size_cells);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lR6P3/j+HGelbRkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92n9AACgkQbDjKyiDZ
s5JKKQ/+N4K4bSZgQgdYLQkgoqCeUyJiALoAwgC5hFiT9emJ4dE0wXCv9pDWl5GV
fFie6LDoqnzsD4tdM1c3a6T0L442/7OExBu2v7Sj8GoxeM75PFkGlNL+ss8uFuY4
iGY7HqwDLuDK+it2JIDAMVkwNJDMDvATPMvGYuY+b8WdIGa936+MzVkaurg4beMp
WaPHGoHK++disAVNQtElk+B/HZxnuNMy41MMWh/mHdwN4nuGV8Eeb14fDr2zqEsg
M/Ici1uB196UE3gxey1mgM04CsHtwWk9fJn21A1ulzkGKbj1J9JSjCiAeMlunwoL
U7vDnWyn6suarnfGUMLc7rhlelH+mvPVxCmPR+t1KIZcsLpxSG/Tu89MPpHcFjcy
7seHu9iMAnl2GAqxDLe6FdX1Qib7c5n8iaaqRclwrREZySxbRYdcj6P3HGoq68K+
8+GYrh0pn+DAEpUk2ISlZKvzoZ0nKnokSntuMCQjMh99bR6R/NMzWxBzJK5bD9ri
RsuZVqq2iIrYYAU31PFimAzmCOYvyYWXUHqytWkyWWp8L59rM3k7JTrnRTH+lQQn
HvGIraPK1YMg61/pCfCPxbATfYbOIk5ARU2yOYFHlW35oZkKaI+20NI2od0finVx
367LfjsP5X2He8yhw5ACYtEIwY/HVDM5/qD4+w4W7gvriLT0F3U=
=EQAF
-----END PGP SIGNATURE-----

--lR6P3/j+HGelbRkf--
