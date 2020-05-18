From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] checks: Add interrupt provider test
Date: Mon, 18 May 2020 14:26:32 +1000
Message-ID: <20200518042632.GA7261@umbus.fritz.box>
References: <20200515141827.27957-1-andre.przywara@arm.com>
 <20200515141827.27957-2-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1589777612;
        bh=4qok31FlNvhS11lxc1J62y+AylHdYqi8ZFcN0yMm/kw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kYWf5tXjgZ1q05jDTV7LQ+ulwS4x+ijR/5oTk7qXRkW8hoDd9Dv/6jFS2c56JduBl
         4vCl9Ung+s/p5Sr85EbuN/X4ikoR2tCCldFD7OHyX1NeQGCP7nn/STpA0u9fGdcDWY
         f91ntbCDTHsP7ik9GFWwfroi/+I2R9pPM39qceuc=
Content-Disposition: inline
In-Reply-To: <20200515141827.27957-2-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 03:18:25PM +0100, Andre Przywara wrote:
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

Applied, thanks.

> ---
>  checks.c                           | 25 ++++++++++++++++++++++++-
>  tests/bad-interrupt-controller.dts |  7 +++++++
>  tests/run_tests.sh                 |  1 +
>  3 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 tests/bad-interrupt-controller.dts
>=20
> diff --git a/checks.c b/checks.c
> index 4b3c486..a8213c0 100644
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
> +
> +	prop =3D get_property(node, "#address-cells");
> +	if (!prop)
> +		FAIL(c, dti, node,
> +		     "Missing #address-cells in interrupt provider");
> +}
> +WARNING(interrupt_provider, check_interrupt_provider, NULL);
> +
>  static void check_interrupts_property(struct check *c,
>  				      struct dt_info *dti,
>  				      struct node *node)
> @@ -1604,7 +1626,7 @@ static void check_interrupts_property(struct check =
*c,
> =20
>  	prop =3D get_property(irq_node, "#interrupt-cells");
>  	if (!prop) {
> -		FAIL(c, dti, irq_node, "Missing #interrupt-cells in interrupt-parent");
> +		/* We warn about that already in another test. */
>  		return;
>  	}
> =20
> @@ -1828,6 +1850,7 @@ static struct check *check_table[] =3D {
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

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7CDnUACgkQbDjKyiDZ
s5KUpxAAoWPICDFRu67/zb8WDHT1vRMOqZHJczXilwYkcecuZSKziZitaax5Xxwg
F9LbNrVMDDsGM+c3G0iq6q+HUvxOVhPeGJ9KKH0E0Qy/rBC+zToq/QaGK8LO3Kpa
E69CKhH25hEXJqIK1kIwrOtJkt4rOBPeIW5DDivxEEzNYBu4Rm4UQfOc4s2XQi9z
AigflN0MO0sDKc6Ved4A+MGKEG7I7e8IgUFQCzlMlLPz/XtzPKXer0B0Ykh5UskF
MlRK2+27WABfOW/FwA7G+L/OfS6gsI/KDm40MYIcdemac+YbhHmG85OQqr49oKOQ
C451CLtWfplINcv07Gsi36nHOReMIvS0rqOzAP7BGcyEX7ju4a3eRmXuD8orv7XN
gPXWDHjVEICYwt5seWc9A8Bv6SMdkIwRSAFDfAGvxBVMvoLbSjTDtPEPABZFrLWz
8LkCDmvcHhJ4WqITnYTOdUhECfBJfPigI+OCAMtXcPUyQe6QoYJlRaCX1mv6ET94
qJX4VvqMW+NMng8iLuvpL81lnf5f/f8vffsDD3gN1rwVhIVUTAnO8e8InvvMyNtW
k6b5WevgSH4qRRvCuMq4oibK2U5J1lUHj434qSGkNCrOLtkn3M6pFoR2JmyLXRGw
qKlgXYSnUGJpSvniNScUFQgUmdrqgbQJkj90XiF40neskztHmVc=
=TkC9
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
