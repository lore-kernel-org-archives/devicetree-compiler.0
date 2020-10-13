From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 06/11] dtc: Fix signedness comparisons warnings: change
 types
Date: Tue, 13 Oct 2020 15:57:00 +1100
Message-ID: <20201013045700.GP71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-7-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H14uD12u8nekTETJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565781;
        bh=zK3WByF6dJ/FlSkTkmGpcoh9t9zJucmrCh5FqzFQfxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PMqlKiZZpBRJCMSlZ8PD+PrXgezHXU8kqB3kQ575ehR8fcQT9rFIGl6o359JXBwoU
         qQ0fU9sMrNhNW6VwkSsL1NR1TDCy1tvtPYyosGbAz3yJ8sE25s09uUihoKsDrKMHLP
         5b94gVXVaPwFlNtyjsfx5t7g3GwGbPC3LNR02np4=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-7-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--H14uD12u8nekTETJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:43PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> comparisons in various parts of dtc.
>=20
> Many variables are using signed types unnecessarily, as we never use
> negative value in them.
> Change their types to be unsigned, to prevent issues with comparisons.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  data.c     | 4 ++--
>  dtc.h      | 8 ++++----
>  flattree.c | 8 ++++----
>  livetree.c | 2 +-
>  yamltree.c | 6 +++---
>  5 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/data.c b/data.c
> index 0a43b6d..fdb0407 100644
> --- a/data.c
> +++ b/data.c
> @@ -21,10 +21,10 @@ void data_free(struct data d)
>  		free(d.val);
>  }
> =20
> -struct data data_grow_for(struct data d, int xlen)
> +struct data data_grow_for(struct data d, unsigned int xlen)
>  {
>  	struct data nd;
> -	int newsize;
> +	unsigned int newsize;
> =20
>  	if (xlen =3D=3D 0)
>  		return d;
> diff --git a/dtc.h b/dtc.h
> index f2f96ec..511dda1 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -107,13 +107,13 @@ extern const char *markername(enum markertype marke=
rtype);
> =20
>  struct  marker {
>  	enum markertype type;
> -	int offset;
> +	unsigned int offset;
>  	char *ref;
>  	struct marker *next;
>  };
> =20
>  struct data {
> -	int len;
> +	unsigned int len;
>  	char *val;
>  	struct marker *markers;
>  };
> @@ -131,7 +131,7 @@ size_t type_marker_length(struct marker *m);
> =20
>  void data_free(struct data d);
> =20
> -struct data data_grow_for(struct data d, int xlen);
> +struct data data_grow_for(struct data d, unsigned int xlen);
> =20
>  struct data data_copy_mem(const char *mem, int len);
>  struct data data_copy_escape_string(const char *s, int len);
> @@ -255,7 +255,7 @@ void append_to_property(struct node *node,
>  const char *get_unitname(struct node *node);
>  struct property *get_property(struct node *node, const char *propname);
>  cell_t propval_cell(struct property *prop);
> -cell_t propval_cell_n(struct property *prop, int n);
> +cell_t propval_cell_n(struct property *prop, unsigned int n);
>  struct property *get_property_by_label(struct node *tree, const char *la=
bel,
>  				       struct node **node);
>  struct marker *get_marker_label(struct node *tree, const char *label,
> diff --git a/flattree.c b/flattree.c
> index 07f10d2..4659afb 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -149,7 +149,7 @@ static void asm_emit_align(void *e, int a)
>  static void asm_emit_data(void *e, struct data d)
>  {
>  	FILE *f =3D e;
> -	int off =3D 0;
> +	unsigned int off =3D 0;
>  	struct marker *m =3D d.markers;
> =20
>  	for_each_marker_of_type(m, LABEL)
> @@ -219,7 +219,7 @@ static struct emitter asm_emitter =3D {
> =20
>  static int stringtable_insert(struct data *d, const char *str)
>  {
> -	int i;
> +	unsigned int i;
> =20
>  	/* FIXME: do this more efficiently? */
> =20
> @@ -345,7 +345,7 @@ static void make_fdt_header(struct fdt_header *fdt,
>  void dt_to_blob(FILE *f, struct dt_info *dti, int version)
>  {
>  	struct version_info *vi =3D NULL;
> -	int i;
> +	unsigned int i;
>  	struct data blob       =3D empty_data;
>  	struct data reservebuf =3D empty_data;
>  	struct data dtbuf      =3D empty_data;
> @@ -446,7 +446,7 @@ static void dump_stringtable_asm(FILE *f, struct data=
 strbuf)
>  void dt_to_asm(FILE *f, struct dt_info *dti, int version)
>  {
>  	struct version_info *vi =3D NULL;
> -	int i;
> +	unsigned int i;
>  	struct data strbuf =3D empty_data;
>  	struct reserve_info *re;
>  	const char *symprefix =3D "dt";
> diff --git a/livetree.c b/livetree.c
> index aea6095..8393637 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -438,7 +438,7 @@ cell_t propval_cell(struct property *prop)
>  	return fdt32_to_cpu(*((fdt32_t *)prop->val.val));
>  }
> =20
> -cell_t propval_cell_n(struct property *prop, int n)
> +cell_t propval_cell_n(struct property *prop, unsigned int n)
>  {
>  	assert(prop->val.len / sizeof(cell_t) >=3D n);
>  	return fdt32_to_cpu(*((fdt32_t *)prop->val.val + n));
> diff --git a/yamltree.c b/yamltree.c
> index 4e93c12..e63d32f 100644
> --- a/yamltree.c
> +++ b/yamltree.c
> @@ -29,11 +29,11 @@ char *yaml_error_name[] =3D {
>  		    (emitter)->problem, __func__, __LINE__);		\
>  })
> =20
> -static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *mar=
kers, char *data, int len, int width)
> +static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *mar=
kers, char *data, unsigned int len, int width)
>  {
>  	yaml_event_t event;
>  	void *tag;
> -	int off, start_offset =3D markers->offset;
> +	unsigned int off, start_offset =3D markers->offset;
> =20
>  	switch(width) {
>  		case 1: tag =3D "!u8"; break;
> @@ -112,7 +112,7 @@ static void yaml_propval_string(yaml_emitter_t *emitt=
er, char *str, int len)
>  static void yaml_propval(yaml_emitter_t *emitter, struct property *prop)
>  {
>  	yaml_event_t event;
> -	int len =3D prop->val.len;
> +	unsigned int len =3D prop->val.len;
>  	struct marker *m =3D prop->val.markers;
> =20
>  	/* Emit the property name */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--H14uD12u8nekTETJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FM5wACgkQbDjKyiDZ
s5IdWA/+KGKNU2zR8z0QHVAO5oCooIvOFnkIBWYNV64v5vdpXrY5BrVVIxEWKWXv
AqjLbBAQUsMWQquowKbnpnRFbhf0/91yGpCBKWInwEFyRxIVFRhvRoGlLZYhaRNL
ZUvInhWF5Oq2Eedv2RmGLnhIBCoQDlUNsm2/JpzF9Y3eGwzmxmI2X5GZcTVpuCU7
VMkp9nRYBOv8vQtbRmuA1BMQH1TzFWZDLR89RCj2m6gPFD2CSnLNUUxCsBJ4zkds
IpujN+PdbZmAQQN48SYHavkn3FLoClYb0wo2YAJEtcyUaSr7YxrTiPaBsphUQe5X
YTxAshUh127GUQxJtT+7EwR8HObHxfjqLHtM3aOJesh5LvbiWEJBsPcs9w1NVy/W
UEzE16S9r8TQeAZ3p6Z7M9++vz9TcbkeP3lBcm/1edt+SUoFxgzOog28D8rYZNsd
ICPh0YgnIds+v2WnF+gnPxYrazCylSUGZIBVvUOaMKWjxTzU/0ggtDyAmk84dWr5
Z7HjdMS7wdpejDSHc1H4eLDELfbIgHPGRiadZr10JteYLpq3RU0cde9I4eALCrmm
G903W0xsnC+pboKmDoQyNXZ6DKhLpnduNWRrep7wcLDMa0p6UREqUdfpGl7L7x6L
83YdRsAF/KLiKDRG7V1smbXdPbrylJyB5yKqh9tbK8AKJ8E82sU=
=KJY2
-----END PGP SIGNATURE-----

--H14uD12u8nekTETJ--
