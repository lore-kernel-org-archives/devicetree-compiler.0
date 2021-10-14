From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 5/5] checks: Add a sanity check for #.*-cells property
 value
Date: Thu, 14 Oct 2021 14:50:50 +1100
Message-ID: <YWepGobgyydk3T2i@yekko>
References: <20211011191245.1009682-1-robh@kernel.org>
 <20211011191245.1009682-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+0VoCcMecl3oTDFx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1634183456;
        bh=Pqd3nBKi974BJPhXeDxahlf9uTy1WgbUFyfn/ZgZhFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FoPwmxCkJIFW2+uXuCrsnEphP3X1DjAH+Qw+Rzl0oXI7nHEursbF8PCE0MPlBLcmx
         E/Wqrozk2kpl0Do0SUXF9wofcvjE9GibvESk2qJi1QKqpX3xyQ03Joivx6DEEzB0cn
         GzFdueXkT9LkIITblGrBDt4ageVr7Eypc6h3Fy3c=
Content-Disposition: inline
In-Reply-To: <20211011191245.1009682-5-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--+0VoCcMecl3oTDFx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 02:12:45PM -0500, Rob Herring wrote:
> While in theory any value of number of cells is allowed for a #.*-cells
> property, for all practical purposes the number of cells is never more th=
an
> a few cells. Add a check that the value is less than 255. This will catch
> cases like this which will currently pass:
>=20
>   #foo-cells =3D "bar";
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Hmm.  So the original idea was that this helper could be used for any
1-cell property, not just for #foo-cells.  In practice we're only
using it for #foo-cells so far.

The change would be ok if we updated the names to make it clearer that
this is specifically for #foo-cells properties, not anything else.

> ---
>  checks.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 903083bfc423..467442250eda 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -260,8 +260,14 @@ static void check_is_cell(struct check *c, struct dt=
_info *dti,
>  	if (!prop)
>  		return; /* Not present, assumed ok */
> =20
> -	if (prop->val.len !=3D sizeof(cell_t))
> +	if (prop->val.len !=3D sizeof(cell_t)) {
>  		FAIL_PROP(c, dti, node, prop, "property is not a single cell");
> +		return;
> +	}
> +
> +	/* Sanity test for reasonable number of cells */
> +	if (propval_cell(prop) > 255)
> +		FAIL_PROP(c, dti, node, prop, "cell size out of range (>255)");
>  }
>  #define WARNING_IF_NOT_CELL(nm, propname) \
>  	WARNING(nm, check_is_cell, (propname))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+0VoCcMecl3oTDFx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFnqRoACgkQbDjKyiDZ
s5J4FQ/9HAvW3n0ByVg2p72aFePq/n4vwOb4dmUhMeqc804wLLnDgyMLA8Mx7ERK
x8uDjxVg8JgnGl+iunh4C8K+gnNKxEPGJGvZb255QsCtKjRApPILylIexXcuAClO
MnJDXj0el1LliTyW6PUFLo3iHXA4kO9sBwbvAUkSk70HxEI8ppk5FWbl/56Oa30Y
NIfoVi6VTHyHnvOphcUPLAShX+Jc8Gpft2kZ1yg3dAI162s4w97H6EIfDvrXzZ3i
UWTuT4jtwqC1LAq945nJvloTHOw2O9pEHykn+j0wXWv9gJAI9EReURR41eaeZIFX
34OA1NgFINedo9MC8x607Ww4MbyRpIw16A6iHMuhIS4UBEtLqNrDgwAOKnF//wr8
sH/YvA/uCTf9ASmIJkcMmg6/uyuV4aOhTJ3+efZNjeL+kIA/3szr5rZU5Pg/fPjN
TokS/tF7FwT+xaAHN+qzgAcO6E4Z1I/7HMsooojRH4C9TOKbjR9uLWqLtyB7L8x/
rQp1jertqs7F4SVAxU+cbsyX370siYSVWydyyB07lCtYNJf9f2z1ksGtybIDlfFt
x3yp45wU13N7quP6e86BS/vzEC+dvs22xvrfbrQlOnXC02uROij3D4ggTWCRa55g
q4a2ikhdAJTJF2+Ljk+d9Vg/lIVNBHQHMyjrZGPgms96x5a03w8=
=cdOq
-----END PGP SIGNATURE-----

--+0VoCcMecl3oTDFx--
