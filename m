From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/5] checks: Add an interrupt-map check
Date: Thu, 14 Oct 2021 14:44:34 +1100
Message-ID: <YWenovrbpgfxYPHa@yekko>
References: <20211011191245.1009682-1-robh@kernel.org>
 <20211011191245.1009682-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="g6HJXSqTCdVoJ2DZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1634183456;
        bh=XAFrdxQs3C0oqFbS7IpaV3KOrsSDPqRm0cjn25SUxno=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cc4/Pb42zQHhp9lfyA/XXJn3PVmv9jCamXU14/ma0jtelXOLrQw4J2tWC3wUYC4ot
         gE9v+TBhxvJXZcYhHG+pjWZV06D0yvoFDCxE4xgf6G7Iv3o+JwLlqRz+BzHifE/k6r
         11jioc0AwCn1DUntrrOVQ+6c5JEBMvv4TMx4j14Y=
Content-Disposition: inline
In-Reply-To: <20211011191245.1009682-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--g6HJXSqTCdVoJ2DZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 02:12:42PM -0500, Rob Herring wrote:
> Add a check for parsing 'interrupt-map' properties. The check primarily
> tests parsing 'interrupt-map' properties which depends on and the parent
> interrupt controller (or another map) node.
>=20
> Note that this does not require '#address-cells' in the interrupt-map
> parent, but treats missing '#address-cells' as 0 which is how the Linux
> kernel parses it. There's numerous cases that expect this behavior.
>=20
> Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

LGTM, with one exception:

> ---
> v2:
>  - Rework '#interrupt-cells' and '#address-cells' checks to rely on
>    other checks (interrupt_provider and addr_size_cells)
> ---
>  checks.c                           | 82 ++++++++++++++++++++++++++++++
>  tests/bad-interrupt-map-mask.dts   | 20 ++++++++
>  tests/bad-interrupt-map-parent.dts | 17 +++++++
>  tests/bad-interrupt-map.dts        | 19 +++++++
>  tests/run_tests.sh                 |  3 ++
>  5 files changed, 141 insertions(+)
>  create mode 100644 tests/bad-interrupt-map-mask.dts
>  create mode 100644 tests/bad-interrupt-map-parent.dts
>  create mode 100644 tests/bad-interrupt-map.dts
>=20
> diff --git a/checks.c b/checks.c
> index 8153793a3e7d..a72ae4cc0be9 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1589,6 +1589,87 @@ static void check_interrupt_provider(struct check =
*c,
>  }
>  WARNING(interrupt_provider, check_interrupt_provider, NULL, &interrupts_=
extended_is_cell);
> =20
> +static void check_interrupt_map(struct check *c,
> +				struct dt_info *dti,
> +				struct node *node)
> +{
> +	struct node *root =3D dti->dt;
> +	struct property *prop, *irq_map_prop;
> +	size_t cellsize, cell, map_cells;
> +
> +	irq_map_prop =3D get_property(node, "interrupt-map");
> +	if (!irq_map_prop)
> +		return;
> +
> +	if (node->addr_cells < 0) {
> +		FAIL(c, dti, node,
> +		     "Missing '#address-cells' in interrupt-map provider");
> +		return;
> +	}
> +	cellsize =3D node_addr_cells(node);
> +	cellsize +=3D propval_cell(get_property(node, "#interrupt-cells"));
> +
> +	prop =3D get_property(node, "interrupt-map-mask");
> +	if (prop && (prop->val.len !=3D (cellsize * sizeof(cell_t))))
> +		FAIL_PROP(c, dti, node, prop,
> +			  "property size (%d) is invalid, expected %zu",
> +			  prop->val.len, cellsize * sizeof(cell_t));
> +
> +	if (!is_multiple_of(irq_map_prop->val.len, sizeof(cell_t))) {
> +		FAIL_PROP(c, dti, node, irq_map_prop,
> +			  "property size (%d) is invalid, expected multiple of %zu",
> +			  irq_map_prop->val.len, sizeof(cell_t));
> +		return;
> +	}
> +
> +	map_cells =3D irq_map_prop->val.len / sizeof(cell_t);
> +	for (cell =3D 0; cell < map_cells; ) {
> +		struct node *provider_node;
> +		struct property *cellprop;
> +		int phandle;
> +		size_t parent_cellsize;
> +
> +		if ((cell + cellsize) >=3D map_cells) {
> +			FAIL_PROP(c, dti, node, irq_map_prop,
> +				  "property size (%d) too small, expected > %zu",
> +				  irq_map_prop->val.len, (cell + cellsize) * sizeof(cell_t));
> +			break;
> +		}
> +
> +		phandle =3D propval_cell_n(irq_map_prop, cell + cellsize);
> +
> +		if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +			FAIL_PROP(c, dti, node, irq_map_prop,
> +				  "Cell %zu is not a phandle(%d)",
> +				  cell + cellsize, phandle);

AFAICT this will incorrectly fail when run on a dtsi which has an
unresolved reference in an interrupt-map.

> +			break;
> +		}
> +		provider_node =3D get_node_by_phandle(root, phandle);
> +		if (!provider_node) {
> +			FAIL_PROP(c, dti, node, irq_map_prop,
> +				  "Could not get phandle node for (cell %zu)",
> +				  cell);
> +			break;
> +		}
> +
> +		cellprop =3D get_property(provider_node, "#interrupt-cells");
> +		if (cellprop) {
> +			parent_cellsize =3D propval_cell(cellprop);
> +		} else {
> +			FAIL(c, dti, node, "Missing property '#interrupt-cells' in node %s or=
 bad phandle (referred from interrupt-map[%zu])",
> +			     provider_node->fullpath, cell);
> +			break;
> +		}
> +
> +		cellprop =3D get_property(provider_node, "#address-cells");
> +		if (cellprop)
> +			parent_cellsize +=3D propval_cell(cellprop);
> +
> +		cell +=3D cellsize + 1 + parent_cellsize;
> +	}
> +}
> +WARNING(interrupt_map, check_interrupt_map, NULL, &phandle_references, &=
addr_size_cells, &interrupt_provider);
> +
>  static void check_interrupts_property(struct check *c,
>  				      struct dt_info *dti,
>  				      struct node *node)
> @@ -1887,6 +1968,7 @@ static struct check *check_table[] =3D {
>  	&gpios_property,
>  	&interrupts_property,
>  	&interrupt_provider,
> +	&interrupt_map,
> =20
>  	&alias_paths,
> =20
> diff --git a/tests/bad-interrupt-map-mask.dts b/tests/bad-interrupt-map-m=
ask.dts
> new file mode 100644
> index 000000000000..10eaffd62310
> --- /dev/null
> +++ b/tests/bad-interrupt-map-mask.dts
> @@ -0,0 +1,20 @@
> +/dts-v1/;
> +
> +/ {
> +	interrupt-parent =3D <&intc>;
> +	intc: interrupt-controller {
> +		#interrupt-cells =3D <3>;
> +		interrupt-controller;
> +	};
> +
> +	node {
> +		#address-cells =3D <0>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-map =3D <1 &intc 1 2 3>;
> +		interrupt-map-mask =3D <0 0>;
> +
> +		child {
> +			interrupts =3D <1>;
> +		};
> +	};
> +};
> diff --git a/tests/bad-interrupt-map-parent.dts b/tests/bad-interrupt-map=
-parent.dts
> new file mode 100644
> index 000000000000..fe88ce2fe76f
> --- /dev/null
> +++ b/tests/bad-interrupt-map-parent.dts
> @@ -0,0 +1,17 @@
> +/dts-v1/;
> +
> +/ {
> +	interrupt-parent =3D <&intc>;
> +	intc: interrupt-controller {
> +	};
> +
> +	node {
> +		#address-cells =3D <0>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-map =3D <1 &intc 1 2 3>;
> +
> +		child {
> +			interrupts =3D <1>;
> +		};
> +	};
> +};
> diff --git a/tests/bad-interrupt-map.dts b/tests/bad-interrupt-map.dts
> new file mode 100644
> index 000000000000..6df8f93ae00c
> --- /dev/null
> +++ b/tests/bad-interrupt-map.dts
> @@ -0,0 +1,19 @@
> +/dts-v1/;
> +
> +/ {
> +	interrupt-parent =3D <&intc>;
> +	intc: interrupt-controller {
> +		#interrupt-cells =3D <3>;
> +		interrupt-controller;
> +	};
> +
> +	node {
> +		/* Missing #address-cells =3D <0>; */
> +		#interrupt-cells =3D <1>;
> +		interrupt-map =3D <1 &intc 1 2 3>;
> +
> +		child {
> +			interrupts =3D <1>;
> +		};
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 0e270feb3e47..d100d5aaa21f 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -717,6 +717,9 @@ dtc_tests () {
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" -n deprecated_gpio_property =
-- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/good-gpio.dts"
>      check_tests "$SRCDIR/bad-interrupt-cells.dts" interrupts_property
>      check_tests "$SRCDIR/bad-interrupt-controller.dts" interrupt_provider
> +    check_tests "$SRCDIR/bad-interrupt-map.dts" interrupt_map
> +    check_tests "$SRCDIR/bad-interrupt-map-parent.dts" interrupt_map
> +    check_tests "$SRCDIR/bad-interrupt-map-mask.dts" interrupt_map
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

--g6HJXSqTCdVoJ2DZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFnp6IACgkQbDjKyiDZ
s5JS9xAAyUiKh594H5dT8bmLHwXflSssj4cBqlu7HULl6RvxQ97kp7Wzc4iZEKjk
bN/VWTi0AihpQ8tFANRsutf1gPkT2taYg3nB1o2ONo6cKbLGTcBv39sI6n+C7MSb
MJPAWMa4jYK8xfLWziTJcO/v7orBAcWIK/pFqbbCMnurwVZ5BEhH/9Rm8pwfk2sa
P2ayYtaQRXCQgruPT0EDkY4P4ndXPJ8tdVs1Td8+pCtM4hwNiqpYdHgteOb+zg82
S5QSO/2pyv9wGQygaj71xynFdtcpCpBuVdMNJ/emOSEqeh5On2cQMUfP5e9xddEH
Yvq6N/msvGnCmaGjNFjwUVXWuZHC9P5dFuc1/VUB2jlFeNQ+Ipzu2NkfluJb6Eu1
HwipehBPJ+dKq6h+Kxz/fvrmtKFiprSHJK0COKS9qckHmweyAUsfz6/F46ujNK3t
VAQzqdIJjXZvZsbGno8LfA4HaqEOl+fs5s8Jrxy0hdvtFIP3WXCpXKj+S30v/ysv
Oz1Fmhb8shQu5/qYjgodmvsYoEjYZMehrrv/VX+SwQvo0u1bDdBtkj1tfwEXzaY6
YGG8c/FhFq5vw+uo3qC/dCdxmw55DvjL3/NKUQZG8Hrvl84XZM/pKs2KoN1QYOi5
Eay3OXFDruGjSAwj+ckvxG6LRtE77pKcUBKjLYUyQRNhtF4h874=
=KnP1
-----END PGP SIGNATURE-----

--g6HJXSqTCdVoJ2DZ--
