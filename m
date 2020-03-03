From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: Add 'dma-ranges' check
Date: Wed, 4 Mar 2020 10:30:26 +1100
Message-ID: <20200303233026.GG35885@umbus.fritz.box>
References: <20200303193931.1653-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HKEL+t8MFpg/ASTE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1583280013;
        bh=4kcDDk1JJX6uJkBbB3zEDkf/CqhM2jTWvbUUmxgXYco=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OHUIioLrQFc0I2ZJq3jqvDnAgFedNBS272TQZ97BRe1z/wlbdPEnHbaAgNWdEm4D3
         JjQVpSUpYPOTe3jWpNzk9n422Kz0V1orjr4IpwNwZ6oDHdy/Mh46DVb0qPt9l32E1b
         vkESE1WEg17z5aZBdLhVpFoLlTOZy5/CDiJioG7Y=
Content-Disposition: inline
In-Reply-To: <20200303193931.1653-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--HKEL+t8MFpg/ASTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 01:39:31PM -0600, Rob Herring wrote:
> Generalize the existing 'ranges' check to also work for 'dma-ranges'
> which has the same parsing requirements.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

LGTM, Applied.

> ---
>  checks.c                 | 23 +++++++++++++----------
>  tests/bad-dma-ranges.dts | 12 ++++++++++++
>  tests/run_tests.sh       |  1 +
>  3 files changed, 26 insertions(+), 10 deletions(-)
>  create mode 100644 tests/bad-dma-ranges.dts
>=20
> diff --git a/checks.c b/checks.c
> index 756f0fa9203f..8acbc05961f7 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -765,13 +765,15 @@ static void check_ranges_format(struct check *c, st=
ruct dt_info *dti,
>  {
>  	struct property *prop;
>  	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
> +	const char *ranges =3D c->data;
> =20
> -	prop =3D get_property(node, "ranges");
> +	prop =3D get_property(node, ranges);
>  	if (!prop)
>  		return;
> =20
>  	if (!node->parent) {
> -		FAIL_PROP(c, dti, node, prop, "Root node has a \"ranges\" property");
> +		FAIL_PROP(c, dti, node, prop, "Root node has a \"%s\" property",
> +			  ranges);
>  		return;
>  	}
> =20
> @@ -783,23 +785,24 @@ static void check_ranges_format(struct check *c, st=
ruct dt_info *dti,
> =20
>  	if (prop->val.len =3D=3D 0) {
>  		if (p_addr_cells !=3D c_addr_cells)
> -			FAIL_PROP(c, dti, node, prop, "empty \"ranges\" property but its "
> +			FAIL_PROP(c, dti, node, prop, "empty \"%s\" property but its "
>  				  "#address-cells (%d) differs from %s (%d)",
> -				  c_addr_cells, node->parent->fullpath,
> +				  ranges, c_addr_cells, node->parent->fullpath,
>  				  p_addr_cells);
>  		if (p_size_cells !=3D c_size_cells)
> -			FAIL_PROP(c, dti, node, prop, "empty \"ranges\" property but its "
> +			FAIL_PROP(c, dti, node, prop, "empty \"%s\" property but its "
>  				  "#size-cells (%d) differs from %s (%d)",
> -				  c_size_cells, node->parent->fullpath,
> +				  ranges, c_size_cells, node->parent->fullpath,
>  				  p_size_cells);
>  	} else if ((prop->val.len % entrylen) !=3D 0) {
> -		FAIL_PROP(c, dti, node, prop, "\"ranges\" property has invalid length =
(%d bytes) "
> +		FAIL_PROP(c, dti, node, prop, "\"%s\" property has invalid length (%d =
bytes) "
>  			  "(parent #address-cells =3D=3D %d, child #address-cells =3D=3D %d, "
> -			  "#size-cells =3D=3D %d)", prop->val.len,
> +			  "#size-cells =3D=3D %d)", ranges, prop->val.len,
>  			  p_addr_cells, c_addr_cells, c_size_cells);
>  	}
>  }
> -WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
> +WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
> +WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size=
_cells);
> =20
>  static const struct bus_type pci_bus =3D {
>  	.name =3D "PCI",
> @@ -1780,7 +1783,7 @@ static struct check *check_table[] =3D {
>  	&property_name_chars_strict,
>  	&node_name_chars_strict,
> =20
> -	&addr_size_cells, &reg_format, &ranges_format,
> +	&addr_size_cells, &reg_format, &ranges_format, &dma_ranges_format,
> =20
>  	&unit_address_vs_reg,
>  	&unit_address_format,
> diff --git a/tests/bad-dma-ranges.dts b/tests/bad-dma-ranges.dts
> new file mode 100644
> index 000000000000..fbe7ab82cb91
> --- /dev/null
> +++ b/tests/bad-dma-ranges.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +	node {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +		dma-ranges =3D <0 0 0 0 0>;
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index e37ae5934b46..ac0ffc2e3f93 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -664,6 +664,7 @@ dtc_tests () {
>      check_tests "$SRCDIR/bad-reg-ranges.dts" reg_format ranges_format
>      check_tests "$SRCDIR/bad-empty-ranges.dts" ranges_format
>      check_tests "$SRCDIR/reg-ranges-root.dts" reg_format ranges_format
> +    check_tests "$SRCDIR/bad-dma-ranges.dts" dma_ranges_format
>      check_tests "$SRCDIR/default-addr-size.dts" avoid_default_addr_size
>      check_tests "$SRCDIR/obsolete-chosen-interrupt-controller.dts" obsol=
ete_chosen_interrupt_controller
>      check_tests "$SRCDIR/reg-without-unit-addr.dts" unit_address_vs_reg

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HKEL+t8MFpg/ASTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5e6I8ACgkQbDjKyiDZ
s5L3vQ/8CGXXQbp70Pc2FVv/yymRed1AsxaN5HzXwQLQGoKWCYLqPz4LRO7z6q4d
cfOJe4tgIkKsUjt0+Euk0+Mv/AEMYuyu8jZjb54isgoZPLCLndlNaQkT/72C1Wzt
DEnlELfL8yw2U+O3bWFq7gbPBzyM5FZnx/a8t0kXKwYqiMkjeBxH6j7PM8otFh/q
b3wmcaZwp4Wt1b7KSUcRCj35YXFnoppKbibG5gD+A0tbiUAO2rEF50LiTOWZd1HT
SoO6vY0Q4SdpYvhkO3VSOeFDkF3LqdrHVm8wSOCitPLtRkSDMHSqD6K9O7gEBZay
coluDkNyDDXg6eFhXzIeSg5SOnn8tawAn6zC/1LiBa9k8U7Kk2Qas1nhWocIqHnR
+e/8dhkXfZMCQ54LouAp9n4Czjbk1iU6TLRPgKv990mFKmDoH/vdZUnRDyN0HLL6
/w33DwXhCQUKivmnpt6vikGP8qk+BTNY8OSpYi4U3t+3NAYPKXmghUFs1aNZtNlE
E/T+TY5py65uGLvtnMfS+DyJrWxfI6bGJ839fPUZNuVXo86vZPG8QkV0HS78atNI
6jYbV/YOKhqxi2rrkzxqwT5tVlLmPSrimmhNp7AJqOVg707feBKmt38gyAhnwu/R
Dqa+kkhSGf+XJmi6ABE7Yp00CyaNMqvCaO7A317KVLVgmYU0Vig=
=0Bx0
-----END PGP SIGNATURE-----

--HKEL+t8MFpg/ASTE--
