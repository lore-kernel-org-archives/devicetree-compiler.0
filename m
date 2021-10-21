From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] checks: Add a sanity check for #.*-cells property
 value
Date: Thu, 21 Oct 2021 15:51:26 +1100
Message-ID: <YXDxzl00i+fr18SJ@yekko>
References: <20211015213527.2237774-1-robh@kernel.org>
 <20211015213527.2237774-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MpJ8GZaINLn1uaz6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1634792622;
        bh=2ktfidCJMPYBiuW9R5cRkfsuRmFreKBziWD/4hQJ4sA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PLJEs1sQi5Qb25uw4JN6GOwuHeHtF4W8nELWwLJOnWj7INEcnrMtTVGtNO4913nYV
         WXUgM27RkttMcPIKVGJYjtRUVxSqQBnd55DNds9ozFKFo0UNnpm7I65OavjZ7Lk411
         Bqux5dWsuwj24P5LWmRnDncSXUosY1fXm46DM+k0=
Content-Disposition: inline
In-Reply-To: <20211015213527.2237774-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--MpJ8GZaINLn1uaz6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 04:35:27PM -0500, Rob Herring wrote:
> While in theory any value of number of cells is allowed for a #.*-cells
> property, for all practical purposes the number of cells is never more th=
an
> a few cells. Add a check that the value is less than 255. This will catch
> cases like this which will currently pass:
>=20
>   #foo-cells =3D "bar";
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Sorry, can you rename the macros as well.  If anything they're *more*
misleading than the function name with this change.

> ---
> v3:
>  - Rename check_is_cell to check_is_provider_cell
> v2:
>  - new patch
> ---
>  checks.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 781ba1129a8e..704e99ebd66c 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -250,8 +250,9 @@ static void check_is_string_list(struct check *c, str=
uct dt_info *dti,
>  #define ERROR_IF_NOT_STRING_LIST(nm, propname) \
>  	ERROR(nm, check_is_string_list, (propname))
> =20
> -static void check_is_cell(struct check *c, struct dt_info *dti,
> -			  struct node *node)
> +/* A check for provider '#.*-cells' properties */
> +static void check_is_provider_cell(struct check *c, struct dt_info *dti,
> +				   struct node *node)
>  {
>  	struct property *prop;
>  	char *propname =3D c->data;
> @@ -260,13 +261,19 @@ static void check_is_cell(struct check *c, struct d=
t_info *dti,
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
> -	WARNING(nm, check_is_cell, (propname))
> +	WARNING(nm, check_is_provider_cell, (propname))
>  #define ERROR_IF_NOT_CELL(nm, propname) \
> -	ERROR(nm, check_is_cell, (propname))
> +	ERROR(nm, check_is_provider_cell, (propname))
> =20
>  /*
>   * Structural check functions

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MpJ8GZaINLn1uaz6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFw8c4ACgkQbDjKyiDZ
s5L6sA//dQbwjzzM9vXKUAztpN71CtL7pTTPkJe1cP65PACk3GCToJSmnO3sk0jV
2J/lmbrDu7Ds5B6fjao5JX6b1UjfKQTJKVo9sj2ecsS9vQdsde3YwPAFoa0HjkjB
iKaUAt+p+nkaT65rtPCnIAmiDZ8sAS/ZnQ7WyZBlQ1YE4xQPcaWdfpuFpPjAtzhs
Rn6XBtIk/kHpYxpWNMhbvNWvLTdCUv/SULQ9oKw4ItcVlu8n9+xaAuNDkpNr73EQ
taWzmt6XWobSGuw6lDQQP6NekS0PDS0GTLcd0Nbrz3XI+m924W5YdxMPlPfQdJfD
74e0V1jv2OkTW+0F3vkIpY7KIqH8Nn2geL7i/eBgtMRMSMTN70e/8iX6V55sLxps
qaVQeyOvlG5oc24npZeh45kpxvQMlZyjQ6gtl08DLhDhXRKErqLTsk12/7EQg3Ul
/sgm5PLMVJle4Imq9+NtkuLDV91zrkjj9VowOFrzrdVpd7neKCAJFFv8K5Q/m5DR
iQYHzaMPa4691DpupI1JblkQDypq5Q5dSOOQrw7NbVF2IEOym0IqqXhiSZElBwP/
8683LuuY+4+Rmzr0jc2esLgZcyGS4ZsdcNgzy5SLdhNg1DzB7p07f45dIBRjv4vx
pUeVV6G7OCGOhI5e4uU8YOfkxDZ3XIcbXeXNrRP041R0ld9y2+8=
=dnrv
-----END PGP SIGNATURE-----

--MpJ8GZaINLn1uaz6--
