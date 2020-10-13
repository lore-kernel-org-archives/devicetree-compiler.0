From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 05/11] dtc: Wrap phandle validity check
Date: Tue, 13 Oct 2020 15:55:47 +1100
Message-ID: <20201013045547.GO71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-6-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IpgPcFyQO6wM49Um"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565779;
        bh=lKDast1oJUdM172cGLC1AP2zpE1PT051354RASPtpY4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MiN+QZDtwF8XZ52HvjxaZcrtTNTeV1xweTnyPhcR9ee2YE2vMk0zZ9QEcPdP3/aQA
         2HVcs1pyFVHCgzwcsW5pTtZ1wOvhUvVVwRVmv7/xh+13H7qP/iMSUjtR8/hK+FgJnL
         0hmu4Qr9HzMVoEhMdBnWGlwhmexJR/lyCvYoQdt0=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-6-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--IpgPcFyQO6wM49Um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:42PM +0100, Andre Przywara wrote:
> In several places we check for a returned phandle value to be valid,
> for that it must not be 0 or "-1".
>=20
> Wrap this check in a macro in dtc.h, and use ~0U instead of -1 on the
> way, to keep everything in the unsigned realm.

We can probably make this a bit safer still, if we made it a typed
inline, instead of a macro.

>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  checks.c   | 10 +++++-----
>  dtc.h      |  2 ++
>  livetree.c |  4 ++--
>  3 files changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 17cb689..7cb9011 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -497,7 +497,7 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
> =20
>  	phandle =3D propval_cell(prop);
> =20
> -	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +	if (!FDT_VALID_PHANDLE(phandle)) {
>  		FAIL_PROP(c, dti, node, prop, "bad value (0x%x) in %s property",
>  		     phandle, prop->name);
>  		return 0;
> @@ -1379,14 +1379,14 @@ static void check_property_phandle_args(struct ch=
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
> +		if (!FDT_VALID_PHANDLE(phandle)) {
>  			/* Give up if this is an overlay with external references */
>  			if (dti->dtsflags & DTSF_PLUGIN)
>  				break;
> @@ -1603,7 +1603,7 @@ static void check_interrupts_property(struct check =
*c,
>  		prop =3D get_property(parent, "interrupt-parent");
>  		if (prop) {
>  			phandle =3D propval_cell(prop);
> -			if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +			if (!FDT_VALID_PHANDLE(phandle)) {
>  				/* Give up if this is an overlay with
>  				 * external references */
>  				if (dti->dtsflags & DTSF_PLUGIN)
> @@ -1760,7 +1760,7 @@ static struct node *get_remote_endpoint(struct chec=
k *c, struct dt_info *dti,
> =20
>  	phandle =3D propval_cell(prop);
>  	/* Give up if this is an overlay with external references */
> -	if (phandle =3D=3D 0 || phandle =3D=3D -1)
> +	if (!FDT_VALID_PHANDLE(phandle))
>  		return NULL;
> =20
>  	node =3D get_node_by_phandle(dti->dt, phandle);
> diff --git a/dtc.h b/dtc.h
> index a08f415..f2f96ec 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -49,6 +49,8 @@ extern int annotate;		/* annotate .dts with input sourc=
e location */
>  #define PHANDLE_EPAPR	0x2
>  #define PHANDLE_BOTH	0x3
> =20
> +#define FDT_VALID_PHANDLE(x)	((x) !=3D 0 && (x) !=3D ~0U)
> +
>  typedef uint32_t cell_t;
> =20
>  static inline uint16_t dtb_ld16(const void *p)
> diff --git a/livetree.c b/livetree.c
> index 032df58..aea6095 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -559,7 +559,7 @@ struct node *get_node_by_phandle(struct node *tree, c=
ell_t phandle)
>  {
>  	struct node *child, *node;
> =20
> -	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> +	if (!FDT_VALID_PHANDLE(phandle)) {
>  		assert(generate_fixups);
>  		return NULL;
>  	}
> @@ -594,7 +594,7 @@ cell_t get_node_phandle(struct node *root, struct nod=
e *node)
>  	static cell_t phandle =3D 1; /* FIXME: ick, static local */
>  	struct data d =3D empty_data;
> =20
> -	if ((node->phandle !=3D 0) && (node->phandle !=3D -1))
> +	if (FDT_VALID_PHANDLE(node->phandle))
>  		return node->phandle;
> =20
>  	while (get_node_by_phandle(root, phandle))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IpgPcFyQO6wM49Um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FM1MACgkQbDjKyiDZ
s5IQpBAAq146+3rf1IdbXvy22FOm6rdDy8357X56ooJI3M0OMV5PGyn7u6FtjhU6
5N1wfoNzic0InEyuenSaRvUtfplbVZ2cgWPZSekknNe9z8CG5j1BLaaP5E/zV5QF
7KCL/gADU7vL9R92SD/miff3O5oUV+OBNxeyGSkGXRz3+rUTn+fz0rpAYUrMg+C1
iNFIC3zwa71p6mxuHNwbfCBrJmB4e2HlOtom02PkTpGRXOOCnUwLFp1ClZyvPZLd
nFQ0ruVTYcJWYKyRbEmr2CJezrDy4TDAfG26RNqd9O1X1Kg7ubjos5jIvQWUKpB4
e1ikyDS5hWFGCn5Kx2+ziQ5ZjI73Z4MPsiyc07bDqhi5C042H6xmfgJ5bkUg6MZz
Yizy+7ascBXWRjXmiS6IwKOO3vCabtPGnagHbcgvIkN9FzsrWgLi1Ktsw4OWGPKT
zly2Ukv4/bGYCzznTuk0xuByx7tPXuZYYDa6XXsCfCZ4H/u7v1ZmMblKafy3eNw3
U1O21qDzfxQHe54jTn1U8pB2m6OYhEKe5TC/wIbPqX5Er1LeS+xYrQHTbqVT4d6C
cdeHC0DN/D8Uj5eNfpe2gmubsl6jl8rAWLJaNFZlV7ylmgkjIgbQvz5bPGh81ubJ
CzZPiGS1RgBJbY2ro0cHnzh+HfM4oDW1MfLiKar1LhwI2khraI4=
=zQvO
-----END PGP SIGNATURE-----

--IpgPcFyQO6wM49Um--
