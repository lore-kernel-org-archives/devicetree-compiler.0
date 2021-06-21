From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 4/5] checks: Fix signedness comparisons warnings
Date: Mon, 21 Jun 2021 15:34:18 +1000
Message-ID: <YNAk2va+HeTWwvLt@yekko>
References: <20210618172030.9684-1-andre.przywara@arm.com>
 <20210618172030.9684-5-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8HGeTQ4OgFZ4iGiT"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1624253931;
        bh=QSJxGv+UGsSZn97Ayy0233Jiq2h5270fcAHjutr1p/0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bH7IBeWGzW/CY6y3NGbggAP5wa/QeM4+PvQfgd3L7IVAYJmiNyFHhOq7kAWKUlZvu
         psW0fczYX1A91eY1dWAo5OQkogamL73DTMRl2ryygxgIpIhZkPNReVuckJZWeqWXd6
         VYW9ejShh3GjT4cRc506Hgl3yBz6Rc1tVEaIB3bE=
Content-Disposition: inline
In-Reply-To: <20210618172030.9684-5-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--8HGeTQ4OgFZ4iGiT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 06:20:29PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> comparisons in various parts in checks.c.
>=20
> Fix those by making all affected variables unsigned. This covers return
> values of the (unsigned) size_t type, phandles, variables holding sizes
> in general and loop counters only ever counting positives values.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  checks.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index cb71c73..e2690e9 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -312,7 +312,7 @@ ERROR(duplicate_property_names, check_duplicate_prope=
rty_names, NULL);
>  static void check_node_name_chars(struct check *c, struct dt_info *dti,
>  				  struct node *node)
>  {
> -	int n =3D strspn(node->name, c->data);
> +	size_t n =3D strspn(node->name, c->data);
> =20
>  	if (n < strlen(node->name))
>  		FAIL(c, dti, node, "Bad character '%c' in node name",
> @@ -386,7 +386,7 @@ static void check_property_name_chars(struct check *c=
, struct dt_info *dti,
>  	struct property *prop;
> =20
>  	for_each_property(node, prop) {
> -		int n =3D strspn(prop->name, c->data);
> +		size_t n =3D strspn(prop->name, c->data);
> =20
>  		if (n < strlen(prop->name))
>  			FAIL_PROP(c, dti, node, prop, "Bad character '%c' in property name",
> @@ -403,7 +403,7 @@ static void check_property_name_chars_strict(struct c=
heck *c,
> =20
>  	for_each_property(node, prop) {
>  		const char *name =3D prop->name;
> -		int n =3D strspn(name, c->data);
> +		size_t n =3D strspn(name, c->data);
> =20
>  		if (n =3D=3D strlen(prop->name))
>  			continue;
> @@ -579,7 +579,7 @@ static void check_name_properties(struct check *c, st=
ruct dt_info *dti,
>  	if (!prop)
>  		return; /* No name property, that's fine */
> =20
> -	if ((prop->val.len !=3D node->basenamelen+1)
> +	if ((prop->val.len !=3D node->basenamelen + 1U)
>  	    || (memcmp(prop->val.val, node->name, node->basenamelen) !=3D 0)) {
>  		FAIL(c, dti, node, "\"name\" property is incorrect (\"%s\" instead"
>  		     " of base node name)", prop->val.val);
> @@ -1388,7 +1388,7 @@ static void check_property_phandle_args(struct chec=
k *c,
>  				          const struct provider *provider)
>  {
>  	struct node *root =3D dti->dt;
> -	int cell, cellsize =3D 0;
> +	unsigned int cell, cellsize =3D 0;
> =20
>  	if (!is_multiple_of(prop->val.len, sizeof(cell_t))) {
>  		FAIL_PROP(c, dti, node, prop,
> @@ -1596,7 +1596,7 @@ static void check_interrupts_property(struct check =
*c,
>  	struct node *root =3D dti->dt;
>  	struct node *irq_node =3D NULL, *parent =3D node;
>  	struct property *irq_prop, *prop =3D NULL;
> -	int irq_cells, phandle;
> +	cell_t irq_cells, phandle;
> =20
>  	irq_prop =3D get_property(node, "interrupts");
>  	if (!irq_prop)
> @@ -1762,7 +1762,7 @@ WARNING(graph_port, check_graph_port, NULL, &graph_=
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
> @@ -1910,7 +1910,7 @@ static void enable_warning_error(struct check *c, b=
ool warn, bool error)
> =20
>  static void disable_warning_error(struct check *c, bool warn, bool error)
>  {
> -	int i;
> +	unsigned int i;
> =20
>  	/* Lowering level, also lower it for things this is the prereq
>  	 * for */
> @@ -1931,7 +1931,7 @@ static void disable_warning_error(struct check *c, =
bool warn, bool error)
> =20
>  void parse_checks_option(bool warn, bool error, const char *arg)
>  {
> -	int i;
> +	unsigned int i;
>  	const char *name =3D arg;
>  	bool enable =3D true;
> =20
> @@ -1958,7 +1958,7 @@ void parse_checks_option(bool warn, bool error, con=
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

--8HGeTQ4OgFZ4iGiT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDQJNoACgkQbDjKyiDZ
s5JeNw/+I83TidpEe+aGmwLQHRaY8ZrmjbO0B8ixyGYDTC9DVM8P2hj52ZtUaZS0
5eZpjVR7yK8rCs77ajY/jt6tpBL3owzEevTdlTlWOJsJPZXc/ApmxDDdreVhWL0o
O/WBcO9IRcJaFOmWHW/AO+Bvv5w7zhm2bByf6bGxh6W5/EcbWluMi+q2Jv8lMsft
F7TdyM8oKl3SKe0q9zGu7Jf1vgnk2ureHXRwXw+jfYLF5xE8i+2AQb48maSlxi3D
7IBVgeTo8IIO2CL/GUM4EqZoS0yOcnfoxv8IxQi04u/JzDuu5Jkq2JifmVlulVxw
U1uQW9tIBWlfoMWT9iKigoc/qIOeFvFGqcKF2j5mqATgLeTJnxgisnWxozucuF6L
7yTgbE6j2mPAo+n3spuQs56eJZk7JwfuJHLoofA2jmd/daSxR+fxHSO3trYJ7bKI
txQ5l8TXXg+ykXXU0JPyNfjOTeYY4P2GR3mAoVFUZL9u1O40leRzqKH/sFgjGeOe
V17c1aB0TUDN8S0uW+Jkq55+nOd1TE6D3OF9J1cLBhAi/GC3lhhQKHeYDZWsNk9j
sMXQ7uYyYDwQdOJsD80d11vAi0rwuavN4Kr9ygyuW7y9v2MCnZTXV5i6uq9BCsvK
uYRXEMkj9GD2NxyTNA0ao4F3Z1yq1fuxQ7XIXkASgg12FDTo8ao=
=W4/T
-----END PGP SIGNATURE-----

--8HGeTQ4OgFZ4iGiT--
