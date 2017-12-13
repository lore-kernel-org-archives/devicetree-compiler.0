From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/6] checks: add string list check for *-names
 properties
Date: Wed, 13 Dec 2017 20:28:49 +1100
Message-ID: <20171213092849.GV2226@umbus.fritz.box>
References: <20171212224629.28738-1-robh@kernel.org>
 <20171212224629.28738-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8EXHJdkEfksMlRxO"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513157639;
        bh=NwKxFyVQ7p6saJ9JG3w3zx9r3F3MIJL0Uz8Lt9qLCU8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kv6BSYhU3jB0KRVcZWDupKAtMnUDLD3BR9ilxqGAn69n+S3hEVWvHU6xeqfmKoHGs
         gyEUQJZA7/2ixeH0Q/PeJczxFoJow8Fnd5slpjGp49dWbhHbkKGskISATawi1eHhBN
         ZTRavS3JL1cgCD5jq2g7u7aKgBp+EYhwKbCsIeoU=
Content-Disposition: inline
In-Reply-To: <20171212224629.28738-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--8EXHJdkEfksMlRxO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 04:46:26PM -0600, Rob Herring wrote:
> Add a string list check for common properties ending in "-names" such as
> reg-names or interrupt-names.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
> v2:
> - Ensure "-names" is at end of the prop name.
> - Add tests
>=20
>  checks.c                   | 18 +++++++++++++++++-
>  tests/bad-string-props.dts |  1 +
>  tests/run_tests.sh         |  2 +-
>  3 files changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index cf670ddc4a5c..e4f5cb9fd317 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -620,6 +620,22 @@ WARNING_IF_NOT_STRING(label_is_string, "label");
> =20
>  WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
> =20
> +static void check_names_is_string_list(struct check *c, struct dt_info *=
dti,
> +				       struct node *node)
> +{
> +	struct property *prop;
> +
> +	for_each_property(node, prop) {
> +		const char *s =3D strrchr(prop->name, '-');
> +		if (!s || !streq(s, "-names"))
> +			continue;
> +
> +		c->data =3D prop->name;
> +		check_is_string_list(c, dti, node);
> +	}
> +}
> +WARNING(names_is_string_list, check_names_is_string_list, NULL);
> +
>  static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
>  				  struct node *node)
>  {
> @@ -1271,7 +1287,7 @@ static struct check *check_table[] =3D {
>  	&device_type_is_string, &model_is_string, &status_is_string,
>  	&label_is_string,
> =20
> -	&compatible_is_string_list,
> +	&compatible_is_string_list, &names_is_string_list,
> =20
>  	&property_name_chars_strict,
>  	&node_name_chars_strict,
> diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
> index 9362ee815965..6694704a5fc2 100644
> --- a/tests/bad-string-props.dts
> +++ b/tests/bad-string-props.dts
> @@ -6,6 +6,7 @@
>  	status =3D <0xdeadbeef>;
>  	label =3D <0xdeadbeef>;
> =20
> +	foobar-names =3D "foo", <1>;
> =20
>  	node {
>  		compatible =3D "good", <0xdeadbeef>;
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 910a71cafe16..d36dffbc4ef9 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -546,7 +546,7 @@ dtc_tests () {
>      check_tests bad-name-property.dts name_properties
> =20
>      check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell =
interrupt_cells_is_cell
> -    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string label_is_string compatible_is_string_list
> +    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string label_is_string compatible_is_string_list names_is_stri=
ng_list
>      check_tests bad-reg-ranges.dts reg_format ranges_format
>      check_tests bad-empty-ranges.dts ranges_format
>      check_tests reg-ranges-root.dts reg_format ranges_format

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8EXHJdkEfksMlRxO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlow8tEACgkQbDjKyiDZ
s5J/gBAAkc7KleiSlA7QYAAu2FaQK1yqjMTXMBeSytWtss+bHWdhicE5TnkXSP+E
hN5rr5W1rFUrD6xF67fwfAxt1KfMzUzD91V9nDg1FOVAkyievael/Kzqs+AJMd8G
+hIbIKR0Pg41a83vvumxYqCkMnuDR0P/tUxU8n0xE3t45xfbtl/H3gb7z08/WHLh
GtYNxjGdtQm1tVIMQ6raxWm4kDunI9ejYzyIToYIu//aSlsIoWk+TERK6+KwTnf2
4NA3FXjQPgFlIErFBKQ/BRhNhUVwBh5yTYPn9O/7cQrrqvyfXD5lhHZRPyA8iJpC
MHt0whw5+Fd2LHcDmPhPx4vHzPdQcS4QohVC580n7DfkYAySuIiSZvdXpQofcCJQ
YeaMbNylpraOvu8Su6uk/b4uLbD/GDVPlCz4Q3LtAeXvjjouQxiYEqHgXJpGssGt
cUANhc8IP2tXxnHOrdTIqJ2I2h+x44cOZ7yZ9s0yKY1u7Eg5s4wPWFgeRCVjTtUu
KGSgkgVt8a5A29Q3UYCtBH6t/mLi56EdRWRkICxy4Y7/vlhPMCYNOGMXRSUh48s0
iNQWfSN/IVywBZdr/S4iAEr0Dyy1ddoMrwJn0cy6B4zKNxBnNB5soZCV2mfq7r72
p/MVSNyUbz2j12TGTbdaez+rMOmZwS+lQ4IZiPg/BiALuBTZHOQ=
=tc8m
-----END PGP SIGNATURE-----

--8EXHJdkEfksMlRxO--
