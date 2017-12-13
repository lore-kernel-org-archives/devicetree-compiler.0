From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/6] checks: add string list check
Date: Wed, 13 Dec 2017 20:24:43 +1100
Message-ID: <20171213092443.GU2226@umbus.fritz.box>
References: <20171212224629.28738-1-robh@kernel.org>
 <20171212224629.28738-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vBRosIkLXbYTRpGW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513157639;
        bh=nbVznWUOOD+D450O9eTh/v40ZDUm7eSGJR953fF5sPY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TFOI3Us7zEw9OxctixpFOyIAR8MOf2tp1Jd4cC9Q78bFkADdbtQCEaSQvn3LZcEp1
         svRmaQcve8gPKj17Bv8PP2yTnORblNCS1tZ+Fco4Vh0lqyOCCvyGFMCbsiWaRub4Br
         UIUZ+KlAixKmUvaLX60CcWSqFWR9hrgYLpEcOq/c=
Content-Disposition: inline
In-Reply-To: <20171212224629.28738-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--vBRosIkLXbYTRpGW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 04:46:25PM -0600, Rob Herring wrote:
> Add a check for string list properties with compatible being the first
> check.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
> v2:
> - Add tests
>=20
>  checks.c                   | 34 ++++++++++++++++++++++++++++++++++
>  tests/bad-string-props.dts |  5 +++++
>  tests/run_tests.sh         |  2 +-
>  3 files changed, 40 insertions(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 8d52d78c1dca..cf670ddc4a5c 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -179,6 +179,36 @@ static void check_is_string(struct check *c, struct =
dt_info *dti,
>  #define ERROR_IF_NOT_STRING(nm, propname) \
>  	ERROR(nm, check_is_string, (propname))
> =20
> +static void check_is_string_list(struct check *c, struct dt_info *dti,
> +				 struct node *node)
> +{
> +	int rem, l;
> +	struct property *prop;
> +	char *propname =3D c->data;
> +	char *str;
> +
> +	prop =3D get_property(node, propname);
> +	if (!prop)
> +		return; /* Not present, assumed ok */
> +
> +	str =3D prop->val.val;
> +	rem =3D prop->val.len;
> +	while (rem > 0) {
> +		l =3D strnlen(str, rem);
> +		if (l =3D=3D rem) {
> +			FAIL(c, dti, "\"%s\" property in %s is not a string list",
> +			     propname, node->fullpath);
> +			break;
> +		}
> +		rem -=3D l + 1;
> +		str +=3D l + 1;
> +	}
> +}
> +#define WARNING_IF_NOT_STRING_LIST(nm, propname) \
> +	WARNING(nm, check_is_string_list, (propname))
> +#define ERROR_IF_NOT_STRING_LIST(nm, propname) \
> +	ERROR(nm, check_is_string_list, (propname))
> +
>  static void check_is_cell(struct check *c, struct dt_info *dti,
>  			  struct node *node)
>  {
> @@ -588,6 +618,8 @@ WARNING_IF_NOT_STRING(model_is_string, "model");
>  WARNING_IF_NOT_STRING(status_is_string, "status");
>  WARNING_IF_NOT_STRING(label_is_string, "label");
> =20
> +WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
> +
>  static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
>  				  struct node *node)
>  {
> @@ -1239,6 +1271,8 @@ static struct check *check_table[] =3D {
>  	&device_type_is_string, &model_is_string, &status_is_string,
>  	&label_is_string,
> =20
> +	&compatible_is_string_list,
> +
>  	&property_name_chars_strict,
>  	&node_name_chars_strict,
> =20
> diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
> index 04194da50636..9362ee815965 100644
> --- a/tests/bad-string-props.dts
> +++ b/tests/bad-string-props.dts
> @@ -5,4 +5,9 @@
>  	model =3D <0xdeadbeef>;
>  	status =3D <0xdeadbeef>;
>  	label =3D <0xdeadbeef>;
> +
> +
> +	node {
> +		compatible =3D "good", <0xdeadbeef>;
> +	};
>  };
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index e7505255043d..910a71cafe16 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -546,7 +546,7 @@ dtc_tests () {
>      check_tests bad-name-property.dts name_properties
> =20
>      check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell =
interrupt_cells_is_cell
> -    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string label_is_string
> +    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string label_is_string compatible_is_string_list
>      check_tests bad-reg-ranges.dts reg_format ranges_format
>      check_tests bad-empty-ranges.dts ranges_format
>      check_tests reg-ranges-root.dts reg_format ranges_format

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vBRosIkLXbYTRpGW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlow8dsACgkQbDjKyiDZ
s5LNYhAAj9yjP5I9ne1lHfZ5Ev3BiKfCBzRwYEbP4EMdPZNt3rfwYWixScuHqKph
yMRdgPnPw5G+OsUyHrjo9E3YWkOpmF7tEA7202TccUn3derUC7fp5ules692Mp+l
u9sDQwTGveGtI9lPMS5xVXC/JROfWX4y3i7Omb3K82gInzSf0ydik5Ra0+kWunHM
z/fpDnoMjKQjpjzbfSpKXE0KYgwp8BuV+NoorwRAD+UUpbMyhfBgeywM17q8YQkf
q93bhxCaSQQnrYRchfbg6vMcq0p5SM3EF5LDJ1nDImXXYaV0xKlMoJFCNqh+yLRr
KDRS0xq9NxKVvrucYpta0aBwveO7Eg5tjzJm3s3IXZQys9JsN+esWUtF4V0NggAA
SSsNogDvwtHW5dN/H1CDbtKuvwnGrmyRJbeEKnJqwZfD2zzOQ9/RhtwCsOesNo+N
kxchPhG2yiICxNpTVTShHF1YBtb2jAFPSulwf7LPv1xVZf99tJagXPhJlDfBa7nI
zxumfPQ6iCQ8RKkQz+IRh3UYIremBhmgVbTOZXfDRhEkEd3zIiK6RGOFu0sc6d26
f90ibYQZ11ZcJ5JOUOk9aoo/rZYf9mOzE5I1x572vtmstY8c1QPPcdU2DGPQZLkE
Tgp9LecRQq9nYxM0v4vPLkVvDnBu7MCDpjnSOWoji00s9iAxHhE=
=wVFA
-----END PGP SIGNATURE-----

--vBRosIkLXbYTRpGW--
