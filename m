From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 10/11] checks: Fix signedness comparisons warnings
Date: Tue, 13 Oct 2020 16:02:42 +1100
Message-ID: <20201013050242.GT71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-11-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BfbbJsf3thGkpLcA"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565786;
        bh=pcy1NkuCpVM+wUuhqbEC/Ob9Y+CWBpk9BG9+Ux29x+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k4diXN5lpJYRCtueDuXnxZ/pBDKyNrtCibU/koIQUb96jnzDOxYGXtwQuxEdZaVZL
         vaCuiXyHmOgPcIB2FeZziLFGHc0UEUG7+oIc1bB1Nezl7csRzNtN34uUqZibRvtoMj
         xV/XIJcSufJoaxBTV/J3f5x7uqW5uo5q/mD8hDXk=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-11-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--BfbbJsf3thGkpLcA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:47PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> comparisons in various parts in checks.c.
>=20
> Fix those by making all affected variables unsigned. This covers return
> values of the (unsigned) size_t type, phandles, variables holding sizes
> in general and loop counters only ever counting positives values.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  checks.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 7cb9011..e2c70d0 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -303,7 +303,7 @@ ERROR(duplicate_property_names, check_duplicate_prope=
rty_names, NULL);
>  static void check_node_name_chars(struct check *c, struct dt_info *dti,
>  				  struct node *node)
>  {
> -	int n =3D strspn(node->name, c->data);
> +	unsigned int n =3D strspn(node->name, c->data);

Better to make it an actual size_t, I think

>  	if (n < strlen(node->name))
>  		FAIL(c, dti, node, "Bad character '%c' in node name",
> @@ -363,7 +363,7 @@ static void check_property_name_chars(struct check *c=
, struct dt_info *dti,
>  	struct property *prop;
> =20
>  	for_each_property(node, prop) {
> -		int n =3D strspn(prop->name, c->data);
> +		unsigned int n =3D strspn(prop->name, c->data);
> =20
>  		if (n < strlen(prop->name))
>  			FAIL_PROP(c, dti, node, prop, "Bad character '%c' in property name",
> @@ -380,7 +380,7 @@ static void check_property_name_chars_strict(struct c=
heck *c,
> =20
>  	for_each_property(node, prop) {
>  		const char *name =3D prop->name;
> -		int n =3D strspn(name, c->data);
> +		unsigned int n =3D strspn(name, c->data);
> =20
>  		if (n =3D=3D strlen(prop->name))
>  			continue;
> @@ -556,7 +556,7 @@ static void check_name_properties(struct check *c, st=
ruct dt_info *dti,
>  	if (!prop)
>  		return; /* No name property, that's fine */
> =20
> -	if ((prop->val.len !=3D node->basenamelen+1)
> +	if ((prop->val.len !=3D node->basenamelen + 1U)
>  	    || (memcmp(prop->val.val, node->name, node->basenamelen) !=3D 0)) {
>  		FAIL(c, dti, node, "\"name\" property is incorrect (\"%s\" instead"
>  		     " of base node name)", prop->val.val);
> @@ -1367,7 +1367,7 @@ static void check_property_phandle_args(struct chec=
k *c,
>  				          const struct provider *provider)
>  {
>  	struct node *root =3D dti->dt;
> -	int cell, cellsize =3D 0;
> +	unsigned int cell, cellsize =3D 0;
> =20
>  	if (prop->val.len % sizeof(cell_t)) {
>  		FAIL_PROP(c, dti, node, prop,
> @@ -1584,7 +1584,8 @@ static void check_interrupts_property(struct check =
*c,
>  	struct node *root =3D dti->dt;
>  	struct node *irq_node =3D NULL, *parent =3D node;
>  	struct property *irq_prop, *prop =3D NULL;
> -	int irq_cells, phandle;
> +	int irq_cells;
> +	cell_t phandle;
> =20
>  	irq_prop =3D get_property(node, "interrupts");
>  	if (!irq_prop)
> @@ -1750,7 +1751,7 @@ WARNING(graph_port, check_graph_port, NULL, &graph_=
nodes);
>  static struct node *get_remote_endpoint(struct check *c, struct dt_info =
*dti,
>  					struct node *endpoint)
>  {
> -	int phandle;
> +	cell_t phandle;
>  	struct node *node;
>  	struct property *prop;
> =20
> @@ -1882,7 +1883,7 @@ static void enable_warning_error(struct check *c, b=
ool warn, bool error)
> =20
>  static void disable_warning_error(struct check *c, bool warn, bool error)
>  {
> -	int i;
> +	unsigned int i;
> =20
>  	/* Lowering level, also lower it for things this is the prereq
>  	 * for */
> @@ -1903,7 +1904,7 @@ static void disable_warning_error(struct check *c, =
bool warn, bool error)
> =20
>  void parse_checks_option(bool warn, bool error, const char *arg)
>  {
> -	int i;
> +	unsigned int i;
>  	const char *name =3D arg;
>  	bool enable =3D true;
> =20
> @@ -1930,7 +1931,7 @@ void parse_checks_option(bool warn, bool error, con=
st char *arg)
> =20
>  void process_checks(bool force, struct dt_info *dti)
>  {
> -	int i;
> +	unsigned int i;
>  	int error =3D 0;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(check_table); i++) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BfbbJsf3thGkpLcA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FNPIACgkQbDjKyiDZ
s5LqEBAArt+YXgcRbrdwSlw3ViCfBTMpE8FXY23gl3MarwluBQnAP7CHOjsZLrrX
GCQD0/pqjiisjkvAO5DhNPPpsAkOpkf58cPPcgUeO4qqTtyYFdMigcmsL12JGSjg
Olvekt6V4JgUPlFambxhhcMikvHqHF3eqz0zY0RAzS0gL00giWSS5+1GXRyxJ6md
KpliWP6sM0P0FufKiaF0rEgj8VOzVCsHn3j4Lw8anIM6LNDtjJKGZIdOzAM7P+JR
ncETAzkqpIVurWndaL/hWMw5c0Tan4DHVnQiaSZE5WWS/JEYiQEr4Q44cU4aN0v2
3E9yhG2mJvSpoTOFSu7n4w7FkGlewma+RnH+N72NyEYs2Q6rIAr0I/Llx8gRiPld
UWGnB2KOd2BXOkVzehm44XJasQ/wW20088dwuHFfwLfuVcpiHTSMQomJT9bFYTxI
iX4a2IPzmmaLgkrGQNHm4w4gJ0+WY/CxtdTLSe13++HkTRrc+7x20DgJPjCdc8PD
b3S2LkOrWvSbiX3W/s4HJ5ShI+4WjXcDTVq+mifDZeTg99dnVqyF1n1a671sAUTP
GS9UO8k1Bh5c8S/e9G5rPwQSfkMdoXiRo/24A442cxj59Ltkh9izC6j1InckMo2S
q/TJfn9mG9PCLpMZgSzmyWGE0uGzm1VEywVM9NNu1wYkrn9Na1E=
=HWUF
-----END PGP SIGNATURE-----

--BfbbJsf3thGkpLcA--
