From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 3/5] dtc: Wrap phandle validity check
Date: Mon, 21 Jun 2021 15:28:50 +1000
Message-ID: <YNAjkgx9WmBoiCiX@yekko>
References: <20210618172030.9684-1-andre.przywara@arm.com>
 <20210618172030.9684-4-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GlabnFwlPwsv+Rcd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1624253931;
        bh=RCy0+TEt3j9sDN7wKQVwYVk2hrM+hfpNYwiUKvTn6uY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ISlUppTWZPr6Q7felFPhZHfNw5ONz9biTI19ploIMDO8LjN1lp3jRaYboyw5te3wQ
         Uy2iAUNVCrA982114qk6rsRu+JsykV4mvqzruhV04lEwMtdGKtZxOTqKfh/4QRXDZj
         kI+SvvCe2WrAxfRZYmBcRknsE09qjFfUkusNseIs=
Content-Disposition: inline
In-Reply-To: <20210618172030.9684-4-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--GlabnFwlPwsv+Rcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 06:20:28PM +0100, Andre Przywara wrote:
> In several places we check for a returned phandle value to be valid,
> for that it must not be 0 or "-1".
>=20
> Wrap this check in a static inline function in dtc.h, and use ~0U instead
> of -1 on the way, to keep everything in the unsigned realm.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  checks.c   | 10 +++++-----
>  dtc.h      |  5 +++++
>  livetree.c |  4 ++--
>  3 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index e6c7c3e..cb71c73 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -520,7 +520,7 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
> =20
>  	phandle =3D propval_cell(prop);
> =20
> -	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +	if (!phandle_is_valid(phandle)) {
>  		FAIL_PROP(c, dti, node, prop, "bad value (0x%x) in %s property",
>  		     phandle, prop->name);
>  		return 0;
> @@ -1400,14 +1400,14 @@ static void check_property_phandle_args(struct ch=
eck *c,
>  	for (cell =3D 0; cell < prop->val.len / sizeof(cell_t); cell +=3D cells=
ize + 1) {
>  		struct node *provider_node;
>  		struct property *cellprop;
> -		int phandle;
> +		cell_t phandle;
> =20
>  		phandle =3D propval_cell_n(prop, cell);
>  		/*
>  		 * Some bindings use a cell value 0 or -1 to skip over optional
>  		 * entries when each index position has a specific definition.
>  		 */
> -		if (phandle =3D=3D 0 || phandle =3D=3D -1) {
> +		if (!phandle_is_valid(phandle)) {
>  			/* Give up if this is an overlay with external references */
>  			if (dti->dtsflags & DTSF_PLUGIN)
>  				break;
> @@ -1615,7 +1615,7 @@ static void check_interrupts_property(struct check =
*c,
>  		prop =3D get_property(parent, "interrupt-parent");
>  		if (prop) {
>  			phandle =3D propval_cell(prop);
> -			if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +			if (!phandle_is_valid(phandle)) {
>  				/* Give up if this is an overlay with
>  				 * external references */
>  				if (dti->dtsflags & DTSF_PLUGIN)
> @@ -1772,7 +1772,7 @@ static struct node *get_remote_endpoint(struct chec=
k *c, struct dt_info *dti,
> =20
>  	phandle =3D propval_cell(prop);
>  	/* Give up if this is an overlay with external references */
> -	if (phandle =3D=3D 0 || phandle =3D=3D -1)
> +	if (!phandle_is_valid(phandle))
>  		return NULL;
> =20
>  	node =3D get_node_by_phandle(dti->dt, phandle);
> diff --git a/dtc.h b/dtc.h
> index 47664f2..cf2c6ac 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -51,6 +51,11 @@ extern int annotate;		/* annotate .dts with input sour=
ce location */
> =20
>  typedef uint32_t cell_t;
> =20
> +static inline bool phandle_is_valid(cell_t phandle)
> +{
> +	return phandle !=3D 0 && phandle !=3D ~0U;
> +}
> +
>  static inline uint16_t dtb_ld16(const void *p)
>  {
>  	const uint8_t *bp =3D (const uint8_t *)p;
> diff --git a/livetree.c b/livetree.c
> index dfbae65..cc61237 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -559,7 +559,7 @@ struct node *get_node_by_phandle(struct node *tree, c=
ell_t phandle)
>  {
>  	struct node *child, *node;
> =20
> -	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +	if (!phandle_is_valid(phandle)) {
>  		assert(generate_fixups);
>  		return NULL;
>  	}
> @@ -594,7 +594,7 @@ cell_t get_node_phandle(struct node *root, struct nod=
e *node)
>  	static cell_t phandle =3D 1; /* FIXME: ick, static local */
>  	struct data d =3D empty_data;
> =20
> -	if ((node->phandle !=3D 0) && (node->phandle !=3D -1))
> +	if (phandle_is_valid(node->phandle))
>  		return node->phandle;
> =20
>  	while (get_node_by_phandle(root, phandle))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GlabnFwlPwsv+Rcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDQI5IACgkQbDjKyiDZ
s5LwaBAAut7wX1+GkULJeQAwXkFIspvLs1HSfB2hO67SuWLby7gpGN3t2TS+pojk
fzTncVdX0JNAXkKuLfBdK0kgfWJOlf6XkAu1e1ikVA6tzlfBfXMYEgvqd0xtYWXG
ScURxh9Qi/B089CZLNWuxysX/y8vNqQX1tKzBD3JcVfoTGfr1CrW0ejAfsBwvcpv
+xJATfytdydjP6tb80hZYKg01ATChNLSUkBG0cxHGAXfcZpvQwoZszrirfOnAuU0
OdFSr0Rrotsh8DJBC+QE7ZlTDrA2ZAWzOFiWUjWaHiN99TI3qb0Iw86ByWdJ9O/F
lCm8XeOVZYKB3dXXMzKAaIRs0atxXgJRjP4J2rUb5f+6pSKh0MTjd/oZg13u9rDC
9s2ZN14bYVsTjmlI9HuwIuOA3KmEpOGRt+M4htHU7xr2M/v+nA+08vF4hFYFFJWv
U6cC1w1sRZ7PAB6S8M5y/WN6YppPofT9bMQ3i9CxO38jjmVoFnCMeXSxOsyqvPwA
xltsoI2eN/XYxxsGbOudbJu4LKmwpRzzxziWAwO62oNTJ4Qs5/wZtjvfAp32mI2o
xFR4cKoycUh3fK/veNSObyOxjm1/wlD4gZtKhcAHIrqAIuRhqtIoL2EGDSNjxf5C
4Z+glOOpbaYgtCskIOLiwEkoaGZEtQ7cr9m1ktgF64DRbiAQq2k=
=Wrg/
-----END PGP SIGNATURE-----

--GlabnFwlPwsv+Rcd--
