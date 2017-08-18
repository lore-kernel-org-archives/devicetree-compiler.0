From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] checks: add interrupts property check
Date: Fri, 18 Aug 2017 14:43:03 +1000
Message-ID: <20170818044303.GR5509@umbus.fritz.box>
References: <20170814214807.338-1-robh@kernel.org>
 <20170814214807.338-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3wfpuDtTLg8/Vq6g"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503031388;
        bh=yzKP2wdrqfeis4O91vaIbsSFy36KPg4/3aECevVgnSQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nt8amgCjEdjhdZB/7ONJmW2nxvRivJo7VGp/6lamEQV8qdqZ//kmRhqtI+pI2r9O5
         TkVxaYyd+6tez1YLiKLAGXXhOMSdFFs1TTM8oshSRcLEsyL+5R4pHs1KRH9aydUFgM
         SQcuJ3NZBYOPEQcSbzwM/gP/okq+ldNkdjrtrP6E=
Content-Disposition: inline
In-Reply-To: <20170814214807.338-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--3wfpuDtTLg8/Vq6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2017 at 04:48:07PM -0500, Rob Herring wrote:
> Add a check for nodes with interrupts property that they have a valid
> parent, the parent has #interrupt-cells property, and the size is a
> valid multiple of #interrupt-cells.
>=20
> This may not handle every possible case and doesn't deal with
> translation thru interrupt-map properties, but should be enough for
> modern dts files.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index c0450e118043..0d452bf8e674 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1070,6 +1070,63 @@ static void check_gpio_cells_property(struct check=
 *c,
>  }
>  WARNING(gpio_cells_property, check_gpio_cells_property, NULL);
> =20
> +static void check_interrupts_property(struct check *c,
> +				      struct dt_info *dti,
> +				      struct node *node)
> +{
> +	struct node *root =3D dti->dt;
> +	struct node *irq_node =3D NULL, *parent =3D node;
> +	struct property *irq_prop, *prop =3D NULL;
> +	int irq_cells, phandle;
> +
> +	irq_prop =3D get_property(node, "interrupts");
> +	if (!irq_prop)
> +		return;
> +
> +	while (parent && !prop) {
> +		if (parent !=3D node) {

So, it's kind of academic, but is it actually disallowed for an
interrupt-controller node to itself have interrupts which are
implicityly routed to itself?

> +			prop =3D get_property(parent, "interrupt-controller");
> +			if (prop) {
> +				irq_node =3D parent;
> +				break;
> +			}
> +		}
> +
> +		prop =3D get_property(parent, "interrupt-parent");
> +		if (prop) {
> +			phandle =3D propval_cell(prop);
> +			irq_node =3D get_node_by_phandle(root, phandle);
> +			if (!irq_node) {
> +				FAIL(c, dti, "Bad interrupt-parent phandle for %s",
> +				     node->fullpath);
> +				return;
> +			}
> +			break;
> +		}

As noted you also need a check for interrupt-map.

> +
> +		parent =3D parent->parent;
> +	}
> +
> +	if (!irq_node) {
> +		FAIL(c, dti, "Missing interrupt-parent for %s", node->fullpath);
> +		return;
> +	}
> +
> +	prop =3D get_property(irq_node, "#interrupt-cells");
> +	if (!prop) {
> +		FAIL(c, dti, "Missing #interrupt-cells in interrupt-parent %s",
> +		     irq_node->fullpath);
> +		return;
> +	}
> +
> +	irq_cells =3D propval_cell(prop);

So this is unsafe if #interrupt-cells is misformatted in the interrupt
controller.  There's already a test for that (using
WARNING_IF_NOT_CELL), so you just need to make this check dependent on
that one.

> +	if (irq_prop->val.len % (irq_cells * sizeof(cell_t))) {
> +		FAIL(c, dti, "interrupts size is (%d), expected multiple of %d in %s",
> +		     irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)), node->fullp=
ath);
> +	}
> +}
> +WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);
> +
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -1103,6 +1160,7 @@ static struct check *check_table[] =3D {
> =20
>  	&provider_cells_property,
>  	&gpio_cells_property,
> +	&interrupts_property,
> =20
>  	&always_fail,
>  };

With both these patches testcases to make sure the checks actually
trip on a bad example would be good.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3wfpuDtTLg8/Vq6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmWcFcACgkQbDjKyiDZ
s5KF7w/+JR/f4QPrpAD/WEnA4iCgSld3PcSoM653Q/bojYs57J8/Ngil8VYsLcjF
HtGikeI+1KJWs3FjipIWkEkojJtDBnMl39yUZgL6icwmKSqVEe1y+9vUQP8LSC0L
sBoPXefO9Vmu1hjyVJSwuOd0HZGlY45tniU/wddyJwNYaHGWqp31rhd/CYE9pivn
8mQmRGDnGpf1un4WlKU4HEUfNuhbjrwzqoJ6JebigoMPRFCUvvJxtgLrzf8wKIUx
hJCzGjgB/kS1VGraudiYNyldMzTs8l7my08qNKns3so3msG0hVVVWwyfOPL8E3v3
bCcAHWbCkOUma0Eid6wBVoviMEMSVJrKZHidzxiFCUEWgoayL1B5zIv784PXwAqk
upjnHgkXkevcHO6Bqsj41CjMvy0G9InfzKVJk6RLKysKXrhpBtcr8qqcbEwlV9/h
sTCELrRJi1XpvNTE+Q9vmGHRsat3sqEFSNsORKORjOA28Olj5ODFev0I89Ysuunc
zaAJQowyWTGWnQ2d5si7J5gQ5inRmS7TPzMwrBSpwceUk70+U10khGf6coub+Gqb
BVALbz8zQalvPpqHdspKtX47ODpmdlLzFgzyOIcUvIv3RSMcP3DJjkdN7rsbpYkk
ELqmsoPwkwiVK3rq1O8SvVE8BhUIZqcmxxyCaDp+q3sEmaViaO0=
=2Dq5
-----END PGP SIGNATURE-----

--3wfpuDtTLg8/Vq6g--
