From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/3] checks: Validate interrupt-map properties
Date: Mon, 18 May 2020 14:31:53 +1000
Message-ID: <20200518043153.GB7261@umbus.fritz.box>
References: <20200515141827.27957-1-andre.przywara@arm.com>
 <20200515141827.27957-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1589777612;
        bh=GLFqgRWC+OjMbS6hL0hTG2xzust2DlZ4LMlClV9Rq0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dzGaaazWCJmyynWu+7XGlKtaPhi6Z/8/3c3HhmFXsk0WbY4QjoZTYDK8FMMwMx4uh
         BIOPD86kFddLXNQQ5Cw1WW/0kUclIa4qEHmK/ofcvin9aga5Jm3uqGTIeu3JpLnLyG
         Q5b3FCRpIB4WJCHGKJyKv4K7JD/Wp3bZfRxVQS+A=
Content-Disposition: inline
In-Reply-To: <20200515141827.27957-3-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 03:18:26PM +0100, Andre Przywara wrote:
> The interrupt-map in an interrupt nexus is quite a tricky property: Each
> entry contains five fields, the size of four of those depending on some
> *-cells entries from two different nodes. This is even hard to validate
> in a .dts file, especially when the associated interrupt controller is
> described in a separate (included) file.
>=20
> Add checks to validate those entries, by:
> - Checking some basic properties of the interrupt nexus node.
> - Checking that a map entry contains at least enough cells to point to
>   the associated interrupt controller.
> - Checking that the phandle points to an actual interrupt controller.
> - Checking that there are enough entries to describe an interrupt in
>   that interrupt controller's domain.
>=20
> If each iteration passes and we exhaust exactly all the cells in the
> interrupt-map property, the check passes.
> Report errors on the way, and abort the check if that happens.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  checks.c                    | 88 +++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/bad-interrupt-map.dts | 21 +++++++++++
>  tests/run_tests.sh          |  1 +
>  3 files changed, 110 insertions(+)
>  create mode 100644 tests/bad-interrupt-map.dts
>=20
> diff --git a/checks.c b/checks.c
> index a8213c0..d01df01 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1639,6 +1639,92 @@ static void check_interrupts_property(struct check=
 *c,
>  }
>  WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);
> =20
> +static void check_interrupt_map(struct check *c, struct dt_info *dti,
> +				struct node *node)
> +{
> +	struct property *map =3D get_property(node, "interrupt-map");
> +	struct property *prop;
> +	int i, cells, irq_cells;
> +
> +	/* We are only interested in interrupt nexus nodes. */
> +	if (!map)
> +		return;
> +
> +	if (map->val.len % sizeof(cell_t)) {
> +		FAIL_PROP(c, dti, node, map,
> +			  "size (%d) is invalid, expected multiple of %zu",
> +			  map->val.len, sizeof(cell_t));
> +		return;
> +	}
> +	cells =3D map->val.len / sizeof(cell_t);
> +
> +	prop =3D get_property(node, "#interrupt-cells");
> +	if (!prop) {
> +		/* We warn about that already in another test. */

It would probably be neater to make the other test a prerequisite of
this one, then you could just make this an assert().

> +		return;
> +	}
> +	irq_cells =3D propval_cell(prop);

Likewise you should make the test that #interrupt-cells has the
correct format a prereq, or this line could do bad things.

> +
> +	for (i =3D 0; i < cells;) {
> +		int phandle_idx =3D i + node_addr_cells(node) + irq_cells;
> +		cell_t intc_phandle, intc_irq_cells, intc_addr_cells;
> +		struct node *intc =3D NULL;
> +
> +		if (phandle_idx + 1 >=3D cells) {
> +			FAIL_PROP(c, dti, node, map,
> +				"insufficient cells for interrupt-map entry");
> +			return;
> +		}
> +		intc_phandle =3D propval_cell_n(map, phandle_idx);
> +		/* Give up if this is an overlay with external references */
> +		if ((intc_phandle =3D=3D 0 || intc_phandle =3D=3D -1) &&
> +		    dti->dtsflags & DTSF_PLUGIN)
> +			break;
> +		/* Avoid the assert in get_node_by_phandle() */
> +		if (intc_phandle !=3D 0)
> +			intc =3D get_node_by_phandle(dti->dt, intc_phandle);
> +		if (!intc) {
> +			FAIL_PROP(c, dti, node, map,
> +				  "invalid phandle for interrupt-map entry");
> +			return;
> +		}
> +
> +		if (!node_is_interrupt_provider(intc)) {
> +			FAIL_PROP(c,dti, node, map,
> +				  "interrupt-map phandle does not point to interrupt provider");
> +			return;
> +		}
> +
> +		prop =3D get_property(intc, "#address-cells");
> +		if (!prop) {
> +			/*
> +			 * Linux treats non-existing #address-cells in the
> +			 * interrupt parent as 0, and not 2, as the spec
> +			 * suggests. Deal with that here.
> +			 * We have a separate check for an explicit #a-c
> +			 * in an interrupt provider that warns already.
> +			 */
> +			intc_addr_cells =3D 0;
> +		} else
> +			intc_addr_cells =3D propval_cell(prop);
> +
> +		prop =3D get_property(intc, "#interrupt-cells");
> +		if (!prop) {
> +			/* We warn about that already in another test. */
> +			return;
> +		}
> +		intc_irq_cells =3D propval_cell(prop);
> +
> +		if (phandle_idx + intc_addr_cells + intc_irq_cells >=3D cells) {
> +			FAIL_PROP(c, dti, node, map,
> +				"insufficient cells for interrupt-map entry");
> +			return;
> +		}
> +		i =3D phandle_idx + 1 + intc_addr_cells + intc_irq_cells;
> +	}
> +}
> +WARNING(interrupt_map, check_interrupt_map, NULL);

After that NULL you can list prerequisite checks for this one.  I
think you want &interrupt_provider, &address_cells_is_cell,
&size_cells_is_cell and &interrupt_cells_is_cell.

>  static const struct bus_type graph_port_bus =3D {
>  	.name =3D "graph-port",
>  };
> @@ -1814,6 +1900,8 @@ static struct check *check_table[] =3D {
>  	&pci_device_reg,
>  	&pci_device_bus_num,
> =20
> +	&interrupt_map,
> +
>  	&simple_bus_bridge,
>  	&simple_bus_reg,
> =20
> diff --git a/tests/bad-interrupt-map.dts b/tests/bad-interrupt-map.dts
> new file mode 100644
> index 0000000..cf9618f
> --- /dev/null
> +++ b/tests/bad-interrupt-map.dts
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +
> +/ {
> +	intc: interrupt-controller {
> +		interrupt-controller;
> +		#address-cells =3D <2>;
> +		#interrupt-cells =3D <3>;
> +	};
> +
> +	nexus-node {
> +		#address-cells =3D <1>;
> +		#interrupt-cells =3D <1>;
> +/*
> + * The cells after the phandle are the address in the interrupt controll=
er's
> + * domain. This here encodes 0 cells , but the actual number is 2 above.
> + */
> +		interrupt-map =3D <0 0 &intc 1 42 4>,
> +				<0 1 &intc 1 43 4>,
> +				<0 2 &intc 1 44 4>;
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 294585b..7c149d9 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -715,6 +715,7 @@ dtc_tests () {
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" deprecated_gpio_property -- =
-Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/bad-gpio.dts"
>      check_tests "$SRCDIR/bad-interrupt-cells.dts" interrupts_property
>      check_tests "$SRCDIR/bad-interrupt-controller.dts" interrupt_provider
> +    check_tests "$SRCDIR/bad-interrupt-map.dts" interrupt_map
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

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7CD7kACgkQbDjKyiDZ
s5IJeRAAxQ8wiIpRu372DfPXJ8d4vGQXxkZHkfbWzOheBPJFZecog4YiI5Z20gGc
B+8yMDA50GpFSx0uwWb7La928FQNJ+uNk6rDSqjU2QAWeMcpEexu+XB3sEg3F9F6
ferCWmPnviaZFzM2u6CLkWdw5J1d0JpCLMdC0VWWNISpSfd0oBOaUf8diUYC5zVY
gt2l0NctX46ZKgtUR6l1k0gcgVES6v4I+epsKn1eyZBFKs5WHBc8WlV4SA2eyf5S
kQvyUvoSnuWJIEfQfN7Km6gjD2vEw7t7zDxORxtHhfd7qDELUZQRsMG1pLRH3nCf
hlcpEoKLoNf2Olrp0WwCwihL7ga80Pluu8W/+5h3XOv6k6FM6vRG7einnXKAHDOq
s7az0i8deV9F/GUIBMidyRPncnjUkfPhbdbExDsdmcZjhnBAGoiE1JLqD/oH5yd3
MdXjh9/O6vyl+MMYfYpOwfdrUsxevz6ndFgY3ie6S4ooJMCQnkmMVj+O7mZmDM+X
lf7WxB1ROJi2hVajyWqDRlKtSg2l8cQdSnQWkplDAs5i79x94XpFVjZA4HMhShH+
8W3ooajo5jRdP3RMTIqkTkcUi82p3CLhaLLJ0cdCmNqHZ0fQkeEY/cIre5eYPbFe
3VLtbGL7EIaz0G17lcU4/GpDF6/Inh6N42kiq6D4K6Km9rBmjcY=
=ttci
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
