From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] checks: Add an interrupt-map check
Date: Mon, 11 Oct 2021 15:56:51 +1100
Message-ID: <YWPEEyJn1o0ikYEL@yekko>
References: <20210928212335.2061125-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wEZ+23EXjSsTQpVl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1633928318;
        bh=s+tpMKu0pjqic2vpmfKp4qJwJPVOeMEfaqYMUZGvFVo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q7o7hC3t2h0OlCwN3oAqF88uf+3iOeT+PFEYbKwsRQ732S2jnPsisiGIbuFuN7Y0A
         70PTVtYoXhEMDcInWlrKB/of3mDM5264kuXG73ZRqTa/BFGzNjhZn8SXBZcYIn9OrM
         nPUogzIo8VD9m/+PUupkOHDth9d8MylBIP6KMkeE=
Content-Disposition: inline
In-Reply-To: <20210928212335.2061125-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--wEZ+23EXjSsTQpVl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 04:23:33PM -0500, Rob Herring wrote:
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
> ---
>  checks.c                           | 88 ++++++++++++++++++++++++++++++
>  tests/bad-interrupt-map-mask.dts   | 20 +++++++
>  tests/bad-interrupt-map-parent.dts | 17 ++++++
>  tests/bad-interrupt-map.dts        | 19 +++++++
>  tests/run_tests.sh                 |  3 +
>  5 files changed, 147 insertions(+)
>  create mode 100644 tests/bad-interrupt-map-mask.dts
>  create mode 100644 tests/bad-interrupt-map-parent.dts
>  create mode 100644 tests/bad-interrupt-map.dts
>=20
> diff --git a/checks.c b/checks.c
> index fb3fc9cda4b1..d4e7facd7f37 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1589,6 +1589,93 @@ static void check_interrupt_provider(struct check =
*c,
>  }
>  WARNING(interrupt_provider, check_interrupt_provider, NULL);
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
> +	prop =3D get_property(node, "#interrupt-cells");
> +	if (!prop)
> +		/* Already checked in check_interrupt_provider */

If you add check_interrupt_provider as a dependency, then you can omit
this check.  Of course, check_interrupt_provider itself should
probably have a dependency on the check that ensures than
len(#interrupt-cells) =3D=3D 4.

> +		return;
> +	cellsize =3D propval_cell(prop);
> +
> +	prop =3D get_property(node, "#address-cells");
> +	if (!prop) {
> +		FAIL(c, dti, node,
> +		     "Missing '#address-cells' in interrupt-map provider");
> +		return;
> +	}
> +	cellsize +=3D propval_cell(prop);
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
> +WARNING(interrupt_map, check_interrupt_map, NULL, &phandle_references);
> +
>  static void check_interrupts_property(struct check *c,
>  				      struct dt_info *dti,
>  				      struct node *node)
> @@ -1887,6 +1974,7 @@ static struct check *check_table[] =3D {
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

If you just want to verify the check on the bad parent, shouldn't you
have an interrupt-map-mask here?

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

Likewise here, since missing interrupt-map-mask doesn't seem to be the
fault you're checking for.

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

--wEZ+23EXjSsTQpVl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFjxBEACgkQbDjKyiDZ
s5L4uQ/9EbkfstOdhB38RJ/hGuqbTlXEfvBA8RE/4ODg0RSdYuV1lVyU45jD9scz
L3pDHxPyu29pNby2W1/jeuRKmAGhZxRKpUUgaPbe47w9msnx7uwfPM6pdwSniVGv
3TjN36wgfIa50zdk4pKS0J64/Xt/DmnccwpHUuM5wnbYA3RLnJlXFpmh547Fcv2i
HVwG9EGcN6fhmx4pk6kiezLlWuRKmYu5KUrbJV+Er7/Vk+pLVOpFFADqtBos3hvu
jpDiHZd8U448ZiRExXDa8h/sc4+UdBRTzov6Us/Hxm27MMzz8owrbjXoJ26b52Dk
X0R1LR5i8FgtahSKHWdV+Ph/0Xa/zZPzktbodn+80v6hfDxP9AQpuXv8TCmRb/4+
+yjUAa0qcOlcxXDXxc040fgvNbKNdukC0QyiiskzS2jD6/Q+PtN1xOqfp51ZzjHW
oAgwvX+1PkO0YqBbYFCoOGXIcYaZPfAAkuEtsYRw5Ipq5jdCL6fUz1xQ0Yp9x0dA
33dpC38nOlt8AOILkBtHSwXpYilvQY1tV+hIo2+4u9ZBHyY8LQxCmbs/A3I9XmRN
DzD69dwZSeaxcVusbiCwwA8Wh/8yxUZdo40DzIlHX25CFb7UnyRoAoGj+ZMx/IVc
P8EH3Uk8GlJmkL5Au/X2mIuEpxPhqNWG/0ioprkeuTPsVjmS6/U=
=v3dv
-----END PGP SIGNATURE-----

--wEZ+23EXjSsTQpVl--
