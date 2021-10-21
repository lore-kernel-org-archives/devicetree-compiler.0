From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] checks: Add an interrupt-map check
Date: Thu, 21 Oct 2021 15:49:00 +1100
Message-ID: <YXDxPDn7o2A20gSq@yekko>
References: <20211015213527.2237774-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="14JLnhtnHOYd1quE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1634792622;
        bh=vnDaSDfPAteUAkC1T7BOncFo28rfGXf5Nf0dG+Oj89o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BBAk1YYrZqCTcfbgurK6zcHP161okpdoyMEjn+cjPP1ayhjgrIqeGrq5SuUYba8cx
         756eORe7ddbv17tVhJ/4Lpkm70YAwiZoZK/1JO5c9SrF0M3Kb1P+Qh4AcssS/R1sB8
         JJPpnAEX85IQ3LtFo5D2+s1YjQLgxnRRfKaW6nB0=
Content-Disposition: inline
In-Reply-To: <20211015213527.2237774-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--14JLnhtnHOYd1quE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 04:35:26PM -0500, Rob Herring wrote:
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

Applied, thanks.

> ---
> v3:
>  - Exit check on unresolved phandle when an overlay
> v2:
>  - Rework '#interrupt-cells' and '#address-cells' checks to rely on
>    other checks (interrupt_provider and addr_size_cells)
> ---
>  checks.c                           | 85 ++++++++++++++++++++++++++++++
>  tests/bad-interrupt-map-mask.dts   | 20 +++++++
>  tests/bad-interrupt-map-parent.dts | 17 ++++++
>  tests/bad-interrupt-map.dts        | 19 +++++++
>  tests/run_tests.sh                 |  3 ++
>  5 files changed, 144 insertions(+)
>  create mode 100644 tests/bad-interrupt-map-mask.dts
>  create mode 100644 tests/bad-interrupt-map-parent.dts
>  create mode 100644 tests/bad-interrupt-map.dts
>=20
> diff --git a/checks.c b/checks.c
> index b9fcde8a7d41..781ba1129a8e 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1590,6 +1590,90 @@ static void check_interrupt_provider(struct check =
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
> +		cell +=3D cellsize;
> +
> +		phandle =3D propval_cell_n(irq_map_prop, cell);
> +		if (!phandle_is_valid(phandle)) {
> +			/* Give up if this is an overlay with external references */
> +			if (!(dti->dtsflags & DTSF_PLUGIN))
> +				FAIL_PROP(c, dti, node, irq_map_prop,
> +					  "Cell %zu is not a phandle(%d)",
> +					  cell, phandle);
> +			break;
> +		}
> +
> +		provider_node =3D get_node_by_phandle(root, phandle);
> +		if (!provider_node) {
> +			FAIL_PROP(c, dti, node, irq_map_prop,
> +				  "Could not get phandle(%d) node for (cell %zu)",
> +				  phandle, cell);
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
> +		cell +=3D 1 + parent_cellsize;
> +	}
> +}
> +WARNING(interrupt_map, check_interrupt_map, NULL, &phandle_references, &=
addr_size_cells, &interrupt_provider);
> +
>  static void check_interrupts_property(struct check *c,
>  				      struct dt_info *dti,
>  				      struct node *node)
> @@ -1888,6 +1972,7 @@ static struct check *check_table[] =3D {
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

--14JLnhtnHOYd1quE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFw8ToACgkQbDjKyiDZ
s5LP4Q//S1yek921UDnyD4F9EGEKKza1i1ipQ/702KdwS1/uW5LKXUojb1MPY0xz
xt2KKxgIl3UJqj71cImRmoH7uOMbtyBBWIWKFw9xqqLAoy6kg7EGGImHc7M0bKF4
4BMbqGrb5f9icFMM6KfW1TbQLSAK5REUVDhunLeu6mcsRK+d3TmKkm9rJgzTpKwU
n62+OKrvUpc0hER6LzkQletYT3T4SgmgFYYgSTyE4C4gFdVlc1tFaXTlRmHIT3XK
F+WQt6RbQTKnyYNpFcq+JDh/z9UmAGOPjbhCwlJdcQpdijOXarbk/XAhAH2kluDO
WD7cTpCFVUcp7fz+1XP703IdOXXP+JY90ybiZrat3A0+V8PSXK6gMbZKRee0W97b
AZMqr2n5vEoSi52Ig0dYwnocKHcP3kRpfUwCovFgsoMF5PpIXzvQoe1OIcCH0j/w
Gxld5td5uMyzv/pq5JCyx+/WXgX/ec8O73+dM+F9tPGG58cqqLKxWrG+DMVtUC+8
uxONUZMr/M2dUj/jYmPOE3vHid/+vFXJarWRmyqYDDUVtAGhLdLLxb7wpApwoipY
mQQKHXHjOKzD1uxTjVKAZ8TLOt+VzM+J2if27SJVt2G1hPSOstk85RR62JCTHFSU
JgaeFDAYqWj0/gID8ZSQtBcbB1yQeJt2UqQFFC23FX/vkLb1QuE=
=pWjN
-----END PGP SIGNATURE-----

--14JLnhtnHOYd1quE--
