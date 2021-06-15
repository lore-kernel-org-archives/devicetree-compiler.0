From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 7/8] checks: Fix signedness comparisons warnings
Date: Tue, 15 Jun 2021 12:55:32 +1000
Message-ID: <YMgWpPNhRC7WBPRK@yekko>
References: <20210611171040.25524-1-andre.przywara@arm.com>
 <20210611171040.25524-8-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CKpK6MJ2W4VnHlbN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623729378;
        bh=Dk7OXofKOtcuZb4ReO3ehUjkTa6iYSS9lB70Bbg1g7o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gNFEddnN08zgCSrCGlaJrSDHklsFhmbKbWd9P2V8qZaCu80kGLUKLvnDnLnEBuUe2
         hALPk5aJPh1MPPEsQNo2GRoniQHPRQ9jgmC0L9KsYbfGL0Ldh8vDwDk97mc/or0rgf
         bQAmo0LpvjkKwQQdcSVqbxfvQbYsRaaIB0wYu67Y=
Content-Disposition: inline
In-Reply-To: <20210611171040.25524-8-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--CKpK6MJ2W4VnHlbN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 06:10:39PM +0100, Andre Przywara wrote:
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
> index 67647fa..e8bfe4a 100644
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
> @@ -1596,7 +1596,8 @@ static void check_interrupts_property(struct check =
*c,
>  	struct node *root =3D dti->dt;
>  	struct node *irq_node =3D NULL, *parent =3D node;
>  	struct property *irq_prop, *prop =3D NULL;
> -	int irq_cells, phandle;
> +	int irq_cells;
> +	cell_t phandle;

The compiler doesn't complain about it, but irq_cells should logically
be a cell_t as well, might as well fix that at the same time.

> =20
>  	irq_prop =3D get_property(node, "interrupts");
>  	if (!irq_prop)
> @@ -1762,7 +1763,7 @@ WARNING(graph_port, check_graph_port, NULL, &graph_=
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
> @@ -1910,7 +1911,7 @@ static void enable_warning_error(struct check *c, b=
ool warn, bool error)
> =20
>  static void disable_warning_error(struct check *c, bool warn, bool error)
>  {
> -	int i;
> +	unsigned int i;
> =20
>  	/* Lowering level, also lower it for things this is the prereq
>  	 * for */
> @@ -1931,7 +1932,7 @@ static void disable_warning_error(struct check *c, =
bool warn, bool error)
> =20
>  void parse_checks_option(bool warn, bool error, const char *arg)
>  {
> -	int i;
> +	unsigned int i;
>  	const char *name =3D arg;
>  	bool enable =3D true;
> =20
> @@ -1958,7 +1959,7 @@ void parse_checks_option(bool warn, bool error, con=
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

--CKpK6MJ2W4VnHlbN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIFqMACgkQbDjKyiDZ
s5J6TBAA3z+lcLsW7VbzmAUeVbNwezOsVPmpNdM7PrE52uP3WUIU6Gn0rBs8QZ+4
eJy9Pz1IhnSnB9ecAu/DG7RqOwV3Yc7nMmXeHDnICiehF0ErBQzO0ZILOd1n4t+0
GwAwNKKQfCeoIPSPJljaFkjKE+kzQhMYauY1nqnkKJ6PxiENM4Az7kzAPEwm9lt7
cmfW1V0jgk0DhpTW1WurdNEddlD8m9p9RB686Stw+bJWivPDDGisccfrCAA2Hjxv
iGUxCw0MmG5Bw2vuKm0y3hkpaxEgEFZ+HMJqpzu3KCNj6fS6rgRIXw9o4DOQzB/y
xyZGzKskUoq6Rj3KdI7dXL99QDFtUnBBmh8nAzbRiSNwoRUV5Ll52+QxS/+5UgfC
98QW6TULe6yjZqQeqC5Oq8gufNJqGFTgV/hjiQHNahxv7IS9Z3B8HN0m8PkXgQEw
YqNGpWglbB5xCaURMlH+U8gpwEx4wcU0b/6WxbKoU7r/01AJCRqgdnETEcR6q5Hb
KvI6AjD7vBia7ZMNMzdlk1kdKD0n9OKC602u5gHzp5ZCvG4wCBb5eHloLRk4GXSv
HMJibdavaEf3q0QJQNc43H0O9CkOboERZaAImW/79dtnwnxuVFqf5t3i8NhIm1nI
Ac1xxh33bnnSAMNdKTssBzD785ery9/YXOIpwViH7qHyh7bVLMw=
=ArCr
-----END PGP SIGNATURE-----

--CKpK6MJ2W4VnHlbN--
