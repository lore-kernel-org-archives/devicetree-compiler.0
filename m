From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/6] checks: add a string check for 'label' property
Date: Wed, 13 Dec 2017 20:20:21 +1100
Message-ID: <20171213092021.GT2226@umbus.fritz.box>
References: <20171212224629.28738-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gSSGYPGSs0dvYOj7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513157639;
        bh=v5oySmycqV41I9IgRW6KsWXApfPA8a4w5dY9eZ2UCTQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WDZtriwDnc1d0xZjiYXeFMN+6vlinxw+GI46K+NGEIg+PSMxa6xNcYCz0KReY+7Gu
         NDZRO556FuxhvWxC0F6/5wgUKD8ydHRnx4vDuVqVVfaqBcCT9ZocVYpTeGlkBvVoL9
         qp7gCHtbkxg9qSq/bibfKRwEf7/0UF1dpPdrxTDw=
Content-Disposition: inline
In-Reply-To: <20171212224629.28738-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--gSSGYPGSs0dvYOj7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 04:46:24PM -0600, Rob Herring wrote:
> Add a string property check for 'label' property. 'label' is a human
> readable string typically used to identify connectors or ports on devices.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
> v2:
> - Move chosen node checks to patch 6.
> - Add tests.
>=20
>  checks.c                   | 2 ++
>  tests/bad-string-props.dts | 1 +
>  tests/run_tests.sh         | 2 +-
>  3 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 334c2a4a0527..8d52d78c1dca 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -586,6 +586,7 @@ WARNING_IF_NOT_CELL(interrupt_cells_is_cell, "#interr=
upt-cells");
>  WARNING_IF_NOT_STRING(device_type_is_string, "device_type");
>  WARNING_IF_NOT_STRING(model_is_string, "model");
>  WARNING_IF_NOT_STRING(status_is_string, "status");
> +WARNING_IF_NOT_STRING(label_is_string, "label");
> =20
>  static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
>  				  struct node *node)
> @@ -1236,6 +1237,7 @@ static struct check *check_table[] =3D {
> =20
>  	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
>  	&device_type_is_string, &model_is_string, &status_is_string,
> +	&label_is_string,
> =20
>  	&property_name_chars_strict,
>  	&node_name_chars_strict,
> diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
> index 396f82069cf7..04194da50636 100644
> --- a/tests/bad-string-props.dts
> +++ b/tests/bad-string-props.dts
> @@ -4,4 +4,5 @@
>  	device_type =3D <0xdeadbeef>;
>  	model =3D <0xdeadbeef>;
>  	status =3D <0xdeadbeef>;
> +	label =3D <0xdeadbeef>;
>  };
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 850bc165e757..e7505255043d 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -546,7 +546,7 @@ dtc_tests () {
>      check_tests bad-name-property.dts name_properties
> =20
>      check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell =
interrupt_cells_is_cell
> -    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string
> +    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string label_is_string
>      check_tests bad-reg-ranges.dts reg_format ranges_format
>      check_tests bad-empty-ranges.dts ranges_format
>      check_tests reg-ranges-root.dts reg_format ranges_format

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gSSGYPGSs0dvYOj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlow8NIACgkQbDjKyiDZ
s5JSHw//YZNHvbMKvJLdCMduVsI+TWuFunjCMp1a21Bs+5hrfjw5cL105q1UZu+V
I0iph/eOTx0lj/R68a68tLlVxppDXXpnWQWh061PGFMcO3IfTcldvSLaMb5xR5NX
M386YBc9bSbmmUbpFPUXjlrI+Hp2Y2NsFzcdN4ShZkoRJ7TvFT/LDkiC4siSGBg9
p+q8vKBjWQAA7X8lQCeAodsr+p0GIQHOExCu+KXgIEeuQjQGnAs9brtXxFPMXyYK
HCztJQO3sPLWhF2MA/buWSBVhBlnuovgtvAuRUnCv8KCRGbnECRi0VuydNjxO/dg
iPGZ/rAQc76OgnZbEfkH/2eMFzjvNpeyZM3irFJqznvuI8banpj0eKi1Q2CaQB8c
CWOyhHjyenI8nGE7c6jldtV5FU1rFRhjSjt88kDX+whQnAQCBO/5jFyQFgtA9s7S
sEtM0U7uGUJZFtJzzjMxXiSn/fkjQfu1C7Vtt2Ceqpq8Znn6rqVQbbjloBsxWIgJ
A0NWJbQjQJHPQA2R1zL6scEV+7m3QnMndK+DBSBokIL1cwST+FUdpzTCZCwafF+a
PlQjuj3Kd/YRa519wHHuoKc0E60JV6f0UaP+7uzAV375KqE7BW3idiZ1m6uM6Jk3
1wh+IvKabUDraGPdMB1jsnP9VpkACypDbPiFpoW6Hoi8xXmwzZk=
=lebL
-----END PGP SIGNATURE-----

--gSSGYPGSs0dvYOj7--
