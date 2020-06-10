From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/3] checks: Add interrupt provider test
Date: Wed, 10 Jun 2020 15:10:57 +1000
Message-ID: <20200610051057.GM494336@umbus.fritz.box>
References: <20200602110419.22488-1-andre.przywara@arm.com>
 <20200602110419.22488-2-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DXTueXWT3Da08pik"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1591765928;
        bh=n0/gsquFE2Sfofok9b3q449ebo1AXy3i41/pFS4Ub6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G0taL5DtTleg+1Te+kS8j+ucBvH0Dr13qOBGJIR6lmPZ/hPQzaCWXBTXh04lXtfYw
         F/an8ueAs1RomAY7U9KIGd6KyrqoCw6jaGnHT+7/C2WBQozjyIG3K5gCVA3b9ER2qa
         ZRFihsnFGLzI1BOOe2CW2ZlqQeLBfjxy2nZFcsvk=
Content-Disposition: inline
In-Reply-To: <20200602110419.22488-2-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--DXTueXWT3Da08pik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 12:04:17PM +0100, Andre Przywara wrote:
> An interrupt provider (an actual interrupt-controller node or an
> interrupt nexus) should have both #address-cells and #interrupt-cells
> properties explicitly defined.
>=20
> Add an extra test for this. We check for the #interrupt-cells property
> already, but this does not cover every controller so far, only those that
> get referenced by an interrupts property in some node. Also we miss
> interrupt nexus nodes.
>=20
> A missing #address-cells property is less critical, but creates
> ambiguities when used in interrupt-map properties, so warn about this as
> well now.
> This removes the now redundant warning in the existing interrupts test.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  checks.c                           | 32 ++++++++++++++++++++++++++------
>  tests/bad-interrupt-controller.dts |  7 +++++++
>  tests/run_tests.sh                 |  1 +
>  3 files changed, 34 insertions(+), 6 deletions(-)
>  create mode 100644 tests/bad-interrupt-controller.dts
>=20
> diff --git a/checks.c b/checks.c
> index 4b3c486..23faca5 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1547,6 +1547,28 @@ static bool node_is_interrupt_provider(struct node=
 *node)
> =20
>  	return false;
>  }
> +
> +static void check_interrupt_provider(struct check *c,
> +				     struct dt_info *dti,
> +				     struct node *node)
> +{
> +	struct property *prop;
> +
> +	if (!node_is_interrupt_provider(node))
> +		return;
> +
> +	prop =3D get_property(node, "#interrupt-cells");
> +	if (!prop)
> +		FAIL(c, dti, node,
> +		     "Missing #interrupt-cells in interrupt provider");

I like splitting the check for #interrupt-cells into a separate check
=66rom the 'interrupts' property check.


> +	prop =3D get_property(node, "#address-cells");
> +	if (!prop)
> +		FAIL(c, dti, node,
> +		     "Missing #address-cells in interrupt provider");

However, I'm a bit less sold on checking #address-cells here.
Although #address-cells is necessary for interrupt-maps, there are a
lot of cases with just a single, simple interrupt controller that's
not a bus root so it's not obvious why it would need to have an
#address-cells property at all.

So, I think you do want to check #address-cells only where you
actually do need it (the interrupt provider is the target of an
interrupt-map).


> +}
> +WARNING(interrupt_provider, check_interrupt_provider, NULL);
> +
>  static void check_interrupts_property(struct check *c,
>  				      struct dt_info *dti,
>  				      struct node *node)
> @@ -1602,12 +1624,8 @@ static void check_interrupts_property(struct check=
 *c,
>  		return;
>  	}
> =20
> +	/* Validity already verified by another test. */
>  	prop =3D get_property(irq_node, "#interrupt-cells");
> -	if (!prop) {
> -		FAIL(c, dti, irq_node, "Missing #interrupt-cells in interrupt-parent");
> -		return;
> -	}
> -
>  	irq_cells =3D propval_cell(prop);
>  	if (irq_prop->val.len % (irq_cells * sizeof(cell_t))) {
>  		FAIL_PROP(c, dti, node, prop,
> @@ -1615,7 +1633,8 @@ static void check_interrupts_property(struct check =
*c,
>  			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
>  	}
>  }
> -WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);
> +WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces,
> +	&interrupt_cells_is_cell, &interrupt_provider);
> =20
>  static const struct bus_type graph_port_bus =3D {
>  	.name =3D "graph-port",
> @@ -1828,6 +1847,7 @@ static struct check *check_table[] =3D {
>  	&deprecated_gpio_property,
>  	&gpios_property,
>  	&interrupts_property,
> +	&interrupt_provider,
> =20
>  	&alias_paths,
> =20
> diff --git a/tests/bad-interrupt-controller.dts b/tests/bad-interrupt-con=
troller.dts
> new file mode 100644
> index 0000000..62fa118
> --- /dev/null
> +++ b/tests/bad-interrupt-controller.dts
> @@ -0,0 +1,7 @@
> +/dts-v1/;
> +
> +/ {
> +	intc: interrupt-controller {
> +		interrupt-controller;
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index eccb85d..294585b 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -714,6 +714,7 @@ dtc_tests () {
>      check_tests "$SRCDIR/bad-graph.dts" graph_endpoint
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" deprecated_gpio_property -- =
-Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/bad-gpio.dts"
>      check_tests "$SRCDIR/bad-interrupt-cells.dts" interrupts_property
> +    check_tests "$SRCDIR/bad-interrupt-controller.dts" interrupt_provider
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" node_name_chars -- -I dtb -O=
 dtb bad_node_char.dtb
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" node_name_format -- -I dtb -=
O dtb bad_node_format.dtb
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" property_name_chars -- -I dt=
b -O dtb bad_prop_char.dtb

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DXTueXWT3Da08pik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7ga2EACgkQbDjKyiDZ
s5K0Uw/+JCT2PqhSPpDeyBXdfh7UJHQAq9JlD7fgbnCsCcjcLzD+RAmBD4cZvUiH
7L0TiwrYu/z+hq/R8D1FeE9AtyBCDb8D+H9XTnPxcs6SxvYlzlQYWDYhqfp7cDP2
GMdBDDya0/JOcRNE4OXap2FMqE6NuEKla2G+eUJzRKAtvm4G1KA53hnhuGVVP1oa
FxAdvYiP01WzHM1rrwMTfSA8F83vYrGNq0Uz4XE71mC1dEnayg/gaT6EOmLbMaZc
4Ed3N+6dzsNOS+TGCeMKrEdVRGEjKurLbACl2eGzKNyteHYtkprqhWEgtjhbFRX5
n0pEfsnNYajf9tCUpjlZq+Go3y6QhKZ6aOfD5Km+eGosq1UZRuql2D7S2Yb5L5g0
1OPE3lkfg/z8sdfwmbtr7yGuzKeBVjdZXHbAVVA9Rw1Kcd+Sblt8KnqggIz1HKVM
8x2FlMfqCi9DdDpgaHonnXObJreBIkgOvzXIuju7idTjG3mrlBcf3WYRL932YwpH
wMfwIGoYIOiK70EJcXOIpKTQE8tqyUnx1J0n2ktsoDcbzGTTuD4/r7yYNjSL8NcR
5i0SIjBiAwhoi2hkvzZPZMq4SNkoxfH/hT4aYpbLMhtnfy8VO0SpOSnNkQ7zt1mX
kV/G2kK7KFo9kRUt4Q4TCU78EIm1rBrR8dApkQH3mff9VSGwXw0=
=OJnd
-----END PGP SIGNATURE-----

--DXTueXWT3Da08pik--
