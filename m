From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 4/8] dtc: Wrap phandle validity check
Date: Tue, 15 Jun 2021 12:46:26 +1000
Message-ID: <YMgUgibUvi40yQt0@yekko>
References: <20210611171040.25524-1-andre.przywara@arm.com>
 <20210611171040.25524-5-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Jgtl/NdqypYEzHZE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623729378;
        bh=AkhKv0hunzbzoRbx4QyMPQL/ajUC3cfIVGSjmDQL2uw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Aa4oiaaFWtT8yP+odrC19OjVGuGtmgHMsa2hgi/SJsvm9ULbaQsWVQ0DUoBSVasyR
         QvO8EQnmBQFUreWVAPemfh4a1zfTBcz9mRD8Jwegb1UV2ABEYEvjWzKHt21vl+Rnqc
         NyYjjit+94yrfXDWExY+HppcCnFg+EBaJdYmBuJI=
Content-Disposition: inline
In-Reply-To: <20210611171040.25524-5-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--Jgtl/NdqypYEzHZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 06:10:36PM +0100, Andre Przywara wrote:
> In several places we check for a returned phandle value to be valid,
> for that it must not be 0 or "-1".
>=20
> Wrap this check in a static inline function in dtc.h, and use ~0U instead
> of -1 on the way, to keep everything in the unsigned realm.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

This is fine, except for naming.  Because this is a dtc internal
function - and it's not even operating on *flat* tree at this point,
the fdt prefix is unhelpeful.  Just call it phandle_is_valid().

> ---
>  checks.c   | 10 +++++-----
>  dtc.h      |  5 +++++
>  livetree.c |  4 ++--
>  3 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index e6c7c3e..67647fa 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -520,7 +520,7 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
> =20
>  	phandle =3D propval_cell(prop);
> =20
> -	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +	if (!fdt_is_valid_phandle(phandle)) {
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
> +		if (!fdt_is_valid_phandle(phandle)) {
>  			/* Give up if this is an overlay with external references */
>  			if (dti->dtsflags & DTSF_PLUGIN)
>  				break;
> @@ -1615,7 +1615,7 @@ static void check_interrupts_property(struct check =
*c,
>  		prop =3D get_property(parent, "interrupt-parent");
>  		if (prop) {
>  			phandle =3D propval_cell(prop);
> -			if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +			if (!fdt_is_valid_phandle(phandle)) {
>  				/* Give up if this is an overlay with
>  				 * external references */
>  				if (dti->dtsflags & DTSF_PLUGIN)
> @@ -1772,7 +1772,7 @@ static struct node *get_remote_endpoint(struct chec=
k *c, struct dt_info *dti,
> =20
>  	phandle =3D propval_cell(prop);
>  	/* Give up if this is an overlay with external references */
> -	if (phandle =3D=3D 0 || phandle =3D=3D -1)
> +	if (!fdt_is_valid_phandle(phandle))
>  		return NULL;
> =20
>  	node =3D get_node_by_phandle(dti->dt, phandle);
> diff --git a/dtc.h b/dtc.h
> index 6296361..3357300 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -51,6 +51,11 @@ extern int annotate;		/* annotate .dts with input sour=
ce location */
> =20
>  typedef uint32_t cell_t;
> =20
> +static inline bool fdt_is_valid_phandle(cell_t phandle)
> +{
> +	return phandle !=3D 0 && phandle !=3D ~0U;
> +}
> +
>  static inline uint16_t dtb_ld16(const void *p)
>  {
>  	const uint8_t *bp =3D (const uint8_t *)p;
> diff --git a/livetree.c b/livetree.c
> index 7eacd02..cf2f63d 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -559,7 +559,7 @@ struct node *get_node_by_phandle(struct node *tree, c=
ell_t phandle)
>  {
>  	struct node *child, *node;
> =20
> -	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +	if (!fdt_is_valid_phandle(phandle)) {
>  		assert(generate_fixups);
>  		return NULL;
>  	}
> @@ -594,7 +594,7 @@ cell_t get_node_phandle(struct node *root, struct nod=
e *node)
>  	static cell_t phandle =3D 1; /* FIXME: ick, static local */
>  	struct data d =3D empty_data;
> =20
> -	if ((node->phandle !=3D 0) && (node->phandle !=3D -1))
> +	if (fdt_is_valid_phandle(node->phandle))
>  		return node->phandle;
> =20
>  	while (get_node_by_phandle(root, phandle))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Jgtl/NdqypYEzHZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIFIIACgkQbDjKyiDZ
s5K9Tw/6A9hOuGAwZYBvoemOIK4YyblEqcc8572LkMP9wFYdzPPec6wusdWJ1vrJ
0pnKHlF+R3AuOKY6KUXGcHbSE/7s8LnUw1REeEkxwcW+zy71c3gDpn/ZqP4F/W1h
2TAIlC4MLe0a1fKiaTv5FSvhIFcDtKfLUqyb4t7YCdjfDdCoX+1Y0kNRr0Wecz2a
LSzRxNLk+I0bQ3yT3Yrli46S9oyTMoA7+rlrTXU0tC1QpnOE3IFghQmECDi5xKhw
Y8AAPR7cmxK/q280H+5OeL4Xze31B27ZKKOgS3Fo5RFVd6m+ftHorxVGPydiVcNO
OtrBpPufoj1Fiqkg1+CkZj1nmQkMN5/YwxETeqwkJJ8OONony4cFQdSOsQ7BP3e3
82foYbfmLcZ1KTW9Habp2nsGoE7lSiFLZ4PMMJ27DjtKQaqwS0UZMPW/D1de9fJL
LQ2uMpl90biDT9n1K1H1SqnnzRBIjrxjWsN8lA60CXLLdvHobnlUwp1PDzOx2Otl
7hKhMGUxLEj5uMQYHJaTkZgrOBq+vv53regsrGFCixgIMaug93x19gfb37BpUPLB
t9dky1HN6eJcRUDMJLuSAieK2zJCbijAUMELnNXk45ReViYSzb9TeDUHBt2d/u36
L0QnAI5B8ojabnX/eBoo3pGeptHC52oQBpqYYlI/JnFby1+y5Uw=
=Dzu2
-----END PGP SIGNATURE-----

--Jgtl/NdqypYEzHZE--
