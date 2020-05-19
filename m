From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: Add interrupt provider test
Date: Tue, 19 May 2020 16:52:09 +1000
Message-ID: <20200519065209.GA63349@umbus.fritz.box>
References: <20200518173112.24932-1-andre.przywara@arm.com>
 <20200518173112.24932-2-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1589871164;
        bh=89ffC12/PrqGtx5vqBRZcbiof3EmKepGcPQHSRmOdG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nuNLoXHGRTuq4hNz5lEWC5qOCCM6df4sxSHy4tGBumy6NbbCO13r7XZI94utOo7oO
         lOdh/fn0vL6KxkheJREJgXu8X70wNBucHzM/BuevN1FCgE1fTJ5FK26H8U328GJpR6
         bNJU/OmkuVpa/npkxTUcypv0Rg/38y9+pFxipboo=
Content-Disposition: inline
In-Reply-To: <20200518173112.24932-2-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 06:31:10PM +0100, Andre Przywara wrote:
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

Rather than exiting early here, you should make the other test a
prerequisite for this one.  Then you can assume it's already passed by
the time you get here.

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

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7DghYACgkQbDjKyiDZ
s5J2GxAAgD2gGiMisa5C1l+QUHAYW21qJsY586vAnD8Nr4QoKhgYTxsEAPlYMosD
R0JVoLg2OJ/DOBLKjbxzDfLS0YTpLR114Aa53Kmw69MaNtKift0GKz3VGSzJWW4x
WR0HQ2ZScZuASP1aJ424x5IUsXmhGeVRFtO7lOzK9PiNnsiI2azXgdZDdylvS8bt
xJVeNhyrzF8f/svwIlvcBshsU8kxrRMOT2wBCBUopv3nMItd396rYNDaxCyb3ZaS
7ph4n4gTMd5YOG/xIjm0fzd7diE9TGgCzwGYuWY1+jIK+jx3fhDQXpUfS13UXp1I
QTAi3/R6HaLaQuUcvbT+9Oc3xFxhWIfkUPAN/ZBVL87gOdMkO1lG1vOCanCUPrLk
1rxLQdmLqDtY7Syo8LMc0zbQHV9qz6rfGCVgXUldqdO0X8k9Um+1V1Uu7eIQKKQs
Dfbi+Tod0gpy8n3lYzoW9iv3KuJkYkxIrRFKwAXXNuwOK1j04bu4SzFkxJ3eeg01
Nt+FrALeDj8eUkS2o5v47npS7R8H3IJyp3hM90vXzwnyimEm5mpeifjGo3xdeycq
UUWU+pAk+VVC9OKuR9V/VUHRE/AvAmdPScQ6jjMtqyFQUIrJE7GRm7t/L9B84ntA
wJgBOi55T7bZUa6rcJrBS4AucFPnOcMhkp8MBCjOvr+et26xJ4k=
=C6Lk
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
