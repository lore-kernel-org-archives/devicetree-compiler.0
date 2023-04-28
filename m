From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] manual: Fix and improve documentation about -@
Date: Fri, 28 Apr 2023 17:02:25 +1000
Message-ID: <ZEtvgUOaOg3jMHeR@yekko>
References: <20230424152802.96250-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WobnGgrbXzAawCzp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682665444;
        bh=PcwmkR9DHyskbH2HB+bOUrt5qR6Mmb73/zVZ2LBeA+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YUMot60UkAhjF2HmxZ0rFLpwNrnF1ZyFz0eIclfNuCqruZpQxoJqAP0kffdGexsKg
         UAXLrR8J4WOcH3ikDaREKkdWR9LYBL7e1ZfFiNnv4RbxSEFu0IvXUtVB/BlvkaZdz+
         7yUtJzohWgR6ZcK3BM2T5sLm65aORsUGbOEC7sZk=
Content-Disposition: inline
In-Reply-To: <20230424152802.96250-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--WobnGgrbXzAawCzp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 05:28:02PM +0200, Uwe Kleine-K=F6nig wrote:
> Device trees with a /plugin/ tag ("overlays") generate a __fixups__ node
> when needed and independent of -q being given or not. The same is true for
> __local__fixups__. So don't mention these two nodes in the paragraph about
> -@.
>=20
> To not shorten the description too much, describe the semantic of the
> properties contained in the generated __symbols__ node.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Applied, thanks.

> ---
>  Documentation/manual.txt | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 2087a4d3e754..15a7837d3cef 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -122,12 +122,10 @@ Options:
>  	Relevant for dtb and asm output only.
> =20
>      -@
> -	Generates a __symbols__ node at the root node of the resulting blob
> -	for any node labels used, and for any local references using phandles
> -	it also generates a __local_fixups__ node that tracks them.
> +	Generates a __symbols__ node at the root node. This node contains a
> +	property for each label. The property's name is the label name and the
> +	value is the path of the labeled node.
> =20
> -	When using the /plugin/ tag all unresolved label references to
> -	be tracked in the __fixups__ node, making dynamic resolution possible.
> =20
>      -A
>  	Generate automatically aliases for all node labels. This is similar to

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WobnGgrbXzAawCzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRLb3sACgkQzQJF27ox
2GflWRAAowJJoEMRR9ZpXbGx7Edix6AoSNZrP30w/Vz6k1Ivy+XWniZApdfbOV7H
+r5FDp+K5YLB35yBd67pxpcmKAM35UBof3wdBnoj6Z75Igl/8hC48J+mj+cCRAIl
YByo24VE8O/WRUCRaDY+iVJWlJqIMgI5PwHtsut8AnaN8J35ybWF45qvbJLSBacb
ZhZ79IIxp8WUKyjRe6M9N1vNZDax5L84hMSIgAzedNerGO7385gvPeoSD/jrPKs0
Y9rh3OcYyLNFnfQLynDKmZGxXco3VIIby8+954QQkbjSaqq04/TR5yOojEqMHlBr
zdXslkroYR31zPchEJpqq+AjeRk5qryxYf5bg8lyjBCcvy54VJc5xnbSCNIC/muj
FQZzR/X9htNWdEMSPPI6+y8lRK+Xi4haVsl0uf/pjdtPJw2nqgqXcqxncRLGNZeT
YPK855qVXzHOTxuCwK20/7G1vvqM4LqGl2FogDv16LzuZaU5IfsEMnYsAJ5rt3Vn
3C2X8yU8zMpDwaBCOzGzfTCy8bNu5mIplQdUGvDOHnr6PS/f79mD9gMXzGJbUvfB
pfeZRwE6HY6cXMyzxrIyYkYuIwedP48rGZp7vh6Yd4+6dZs9S8Lgp4Eoy1NCZWNc
zoKpkERdjhPzPNNmv3HorFC07OQ09qYJjjQp6b4zw7FMRmawctU=
=Bhfr
-----END PGP SIGNATURE-----

--WobnGgrbXzAawCzp--
