From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 6/6] checks: add a chosen node check
Date: Wed, 13 Dec 2017 21:39:27 +1100
Message-ID: <20171213103927.GX2226@umbus.fritz.box>
References: <20171212224629.28738-1-robh@kernel.org>
 <20171212224629.28738-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H7DA0n3a+SnB4bJ2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513161574;
        bh=0pTU9jZVs4DmkueGXH/kcfAxNvK6Jd9xYpjrQLRqP30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WvjU80yH/lwValSUbxydOfOrK/aMwwd4DNe+XUKZriR6TniDSchAtaeq/mbkfK9cy
         4UYjJ5gF1H50c0SqRp0FZywax5bZqr8VRRvz3wrl5xYKkXtn4S7a2LJigwUe2U7gqz
         FOSdilpC/7g1WT9UUTQZ45J/EcIAtQvwYGUjKi2M=
Content-Disposition: inline
In-Reply-To: <20171212224629.28738-6-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--H7DA0n3a+SnB4bJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 04:46:29PM -0600, Rob Herring wrote:
> Add a check for /chosen node. This checks that chosen is located at the
> root level and that bootargs and stdout-path properties are strings.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I'd prefer to see the pieces of this as individual checks.  See
check_obsolete_interrupt_controller() for a similar existing example.

> ---
> v2:
> - New patch making an explicit chosen node test.
>=20
>  checks.c                         | 32 ++++++++++++++++++++++++++++++++
>  tests/bad-chosen-bootargs.dts    |  7 +++++++
>  tests/bad-chosen-location.dts    |  8 ++++++++
>  tests/bad-chosen-stdout-path.dts |  9 +++++++++
>  tests/run_tests.sh               |  3 +++
>  5 files changed, 59 insertions(+)
>  create mode 100644 tests/bad-chosen-bootargs.dts
>  create mode 100644 tests/bad-chosen-location.dts
>  create mode 100644 tests/bad-chosen-stdout-path.dts
>=20
> diff --git a/checks.c b/checks.c
> index 66e5fd6405a5..234e97ffb905 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -636,6 +636,37 @@ static void check_names_is_string_list(struct check =
*c, struct dt_info *dti,
>  }
>  WARNING(names_is_string_list, check_names_is_string_list, NULL);
> =20
> +static void check_chosen_node(struct check *c, struct dt_info *dti,
> +				    struct node *node)
> +{
> +	struct property *prop;
> +
> +	if (!streq(node->name, "chosen"))
> +		return;
> +
> +	if (node->parent->parent) {
> +		FAIL(c, dti, "chosen node must be at root node (%s)",
> +		     node->parent->name);
> +	}
> +
> +	prop =3D get_property(node, "bootargs");
> +	if (prop) {
> +		c->data =3D prop->name;
> +		check_is_string(c, dti, node);
> +	}
> +
> +	prop =3D get_property(node, "linux,stdout-path");
> +	if (prop)
> +		FAIL(c, dti, "Use 'stdout-path' instead of 'linux,stdout-path'");
> +
> +	prop =3D get_property(node, "stdout-path");
> +	if (prop) {
> +		c->data =3D prop->name;
> +		check_is_string(c, dti, node);
> +	}
> +}
> +WARNING(chosen_node, check_chosen_node, NULL);
> +
>  static void check_alias_paths(struct check *c, struct dt_info *dti,
>  				    struct node *node)
>  {
> @@ -1377,6 +1408,7 @@ static struct check *check_table[] =3D {
>  	&interrupts_property,
> =20
>  	&alias_paths,
> +	&chosen_node,
> =20
>  	&always_fail,
>  };
> diff --git a/tests/bad-chosen-bootargs.dts b/tests/bad-chosen-bootargs.dts
> new file mode 100644
> index 000000000000..fb72a820b340
> --- /dev/null
> +++ b/tests/bad-chosen-bootargs.dts
> @@ -0,0 +1,7 @@
> +/dts-v1/;
> +
> +/ {
> +	chosen {
> +		bootargs =3D <0xdeadbeef>;
> +	};
> +};
> diff --git a/tests/bad-chosen-location.dts b/tests/bad-chosen-location.dts
> new file mode 100644
> index 000000000000..0f6de5ed7ed3
> --- /dev/null
> +++ b/tests/bad-chosen-location.dts
> @@ -0,0 +1,8 @@
> +/dts-v1/;
> +
> +/ {
> +	node2 {
> +		chosen {
> +		};
> +	};
> +};
> diff --git a/tests/bad-chosen-stdout-path.dts b/tests/bad-chosen-stdout-p=
ath.dts
> new file mode 100644
> index 000000000000..a022e68e96ec
> --- /dev/null
> +++ b/tests/bad-chosen-stdout-path.dts
> @@ -0,0 +1,9 @@
> +/dts-v1/;
> +
> +/ {
> +	chosen {
> +		linux,stdout-path =3D "foo";
> +		stdout-path =3D <1>;
> +	};
> +
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index d36dffbc4ef9..8b45b81b2e61 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -547,6 +547,9 @@ dtc_tests () {
> =20
>      check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell =
interrupt_cells_is_cell
>      check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string label_is_string compatible_is_string_list names_is_stri=
ng_list
> +    check_tests bad-chosen-location.dts chosen_node
> +    check_tests bad-chosen-bootargs.dts chosen_node
> +    check_tests bad-chosen-stdout-path.dts chosen_node
>      check_tests bad-reg-ranges.dts reg_format ranges_format
>      check_tests bad-empty-ranges.dts ranges_format
>      check_tests reg-ranges-root.dts reg_format ranges_format

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--H7DA0n3a+SnB4bJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloxA1wACgkQbDjKyiDZ
s5IGdRAAw2lq/Z28hq9Hnsmv83I6eh6HRJDAdLPeiEGbZ7kJjR1Jw5mF5mS6DT0J
9n+mOrrfRSJmy8Z8vSRaVJCCX+vp6lXftK853Wq4Ly0cB6SNXgzmoyRBwx7lml11
c3Mhe6kZZPWXOPLIC1YTJTHehwDn6EyB3uuO5y0SfXLS5pHBWbpZXk6vVwbp9pR1
9mcggCF2Yhf/L5JJyRiMncqpV/j+HeESTVYCFGl4YcQ3rfIIV53++knn7ZOa/C7s
UgcRoaV6x8XBh5GeCttOm9wx7udz7c/sluRNvRUFoHHJ7DoW5nHryBD51oLvdBMS
5O2vH9wxz3YaNtrJyiFeFd1vGUhd1rod3vgUtyDfcEKjcCWX9VZAE5aNODIXbXCE
RQUh6z2S/2l4ei82LhGmPYObn2eqW4DjTrT7SfUMViM5L3TkZsdMGPjS060L4R1S
5QajoIy/bQ5BrgGkoi4ZwI0NIMYoX8PxNebSS8HhoaMfsXM77qKYry3g1R+wCrT5
PnhWT4pV/VUGvSOH9wvf3pgOYggk8H6ZphOswYNwg5eoDTYDEO2BPmCYSTn+Ei7w
8mzs7ySn1vHCizwhyRjv+WSnNkSUOVHFWIYWvXnNphJCN4uBbpg9WSN6EDAk7w25
hXP7dkdZo6FThSY8muKoQxAlqRJlmH02xudBrEasxp729XZjS4w=
=EBOL
-----END PGP SIGNATURE-----

--H7DA0n3a+SnB4bJ2--
