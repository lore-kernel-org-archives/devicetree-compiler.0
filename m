From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 4/6] checks: check for #{size,address}-cells without
 child nodes
Date: Wed, 13 Dec 2017 21:06:26 +1100
Message-ID: <20171213100626.GW2226@umbus.fritz.box>
References: <20171212224629.28738-1-robh@kernel.org>
 <20171212224629.28738-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sBvc846/5FzkyDmz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513161574;
        bh=5Lq97z4DBwsIKj/NEWn4cLTwTX8v4ddf9pfVWrvVEaw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fuCGzZtRqvQB5Z6eVjRfvbZf2TDZtjAMUJcquTLgn0iTp1BVnrx0lqg5w9TQYlbDr
         W/rAgAnSv+sECgrdvDsYGVH0+dhVhkH8Jj6J9WhgfWOz6SixwpvDs9NChJVKUpqI9Z
         +KXNVhN4yMf7saMHBHBHFpM7dZy0Q1QHs3o0mr1U=
Content-Disposition: inline
In-Reply-To: <20171212224629.28738-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--sBvc846/5FzkyDmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 04:46:27PM -0600, Rob Herring wrote:
> Add a check for unnecessary "#{size,address}-cells" when there's neither
> a 'ranges' property nor child nodes with a 'reg' property.
>=20
> An exception may be an overlay that adds nodes, but this case would need
> "#{size,address}-cells" in the overlay to properly compile already.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I do worry slightly about the case of a bridge which has some special
subnodes with no reg, plus normal subnodes with reg, but where there
aren't any normal subnodes in the base tree.

Still, that's a fairly corner case, so I've applied the patch.

> ---
> v2:
> - fix commit msg
>=20
>  checks.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index e4f5cb9fd317..e0ec67be1b7a 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -981,6 +981,31 @@ static void check_avoid_default_addr_size(struct che=
ck *c, struct dt_info *dti,
>  WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
>  	&addr_size_cells);
> =20
> +static void check_avoid_unnecessary_addr_size(struct check *c, struct dt=
_info *dti,
> +					      struct node *node)
> +{
> +	struct property *prop;
> +	struct node *child;
> +	bool has_reg =3D false;
> +
> +	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
> +		return;
> +
> +	if (get_property(node, "ranges") || !node->children)
> +		return;
> +
> +	for_each_child(node, child) {
> +		prop =3D get_property(child, "reg");
> +		if (prop)
> +			has_reg =3D true;
> +	}
> +
> +	if (!has_reg)
> +		FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\=
" or child \"reg\" property in %s",
> +		     node->fullpath);
> +}
> +WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, =
NULL, &avoid_default_addr_size);
> +
>  static void check_obsolete_chosen_interrupt_controller(struct check *c,
>  						       struct dt_info *dti,
>  						       struct node *node)
> @@ -1305,6 +1330,7 @@ static struct check *check_table[] =3D {
>  	&simple_bus_reg,
> =20
>  	&avoid_default_addr_size,
> +	&avoid_unnecessary_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> =20
>  	&clocks_property,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sBvc846/5FzkyDmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlow+6AACgkQbDjKyiDZ
s5LTjhAAwH1VbWXxVhRLUsLAUi+TtEngAapsIrRrhSzn77Phg2dmuq3vpAzhmgxH
uKmY+lqhszJNS8Hw5DhyqkYbXkqPldz4upB6oMpA1yl7H3XvGx5oQQebd8exYfHh
B1YMhay5CF+/vrU+BPGyl7akmAAo1RpQgxh0DBda77nxGyA0kAJnLr5xIfoqUC+6
fOMPCoshYY61OLVoIeovVmt3HRKOUtBfR+eUg1rI1pSLNG8+FU1sRvCBK1UKKL7E
RmMR9GJDT1Fq5qHxdHYy3L0gw7OwrmK9Qbqj7Ro9D0zbuDW7qo76h8UzZJMQCntP
58Gs+iDsoUX4HuaRoT5MNHL/RnSakOmKYEN9g5yC8vPAqpk3yfibstkAGo4+X/gM
GaXeYYNArpVHnBCEy6t3PP5Iij7GLu5K20Yw5ek5Dw3jmyynNhM+jolhSdsps6c7
bL+Rn0RoIvJk5Dzw4o54+5FGiCzBcFUFgK8whPJau2K02LCD7vY/4XM+7ZZNHEtU
Cx7xSrGpauoI9V1EGf0ZQWBsuu69sN/xRz/tObAhizhkrvThxXqiDmKWBYYzsRlF
zHr7T7+m8X692Z6Gt41ABI2znfg5WjG+KJPDFVoSwFO7LfIIixQwTBjhl1koe5jn
TrhO9lMEcWRmZCTCkSge3HBhJ59hsLdDGOmMtySI3XEvLRPBZYs=
=cXgb
-----END PGP SIGNATURE-----

--sBvc846/5FzkyDmz--
