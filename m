From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 6/7] libfdt: Add support for disabling version checks
Date: Tue, 11 Feb 2020 14:10:19 +1100
Message-ID: <20200211031019.GK22584@umbus.fritz.box>
References: <20200206054034.162732-1-sjg@chromium.org>
 <20200206054034.162732-7-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3D7yMlnunRPwJqC7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581390636;
        bh=RCWOwY4bXHpFHroeLQo7RB/g7WVwpsP42yxixelmXOo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ADJ1DNIhQ9RyaWRscKeixxUTeaHCAuUs7lwYU7VN2pjjkMHpq19Y5ZyoNziSDF13Q
         GEh3QKYHjXlgyub6Ub/LwvTM4WpSTD3mf7G/K2Ir15DnjHv2A2lHMOnjEbz2Wz/Mlp
         KDIrpJCUodEmYVAWOvZD9LDWsQucQel730Mg1Afg=
Content-Disposition: inline
In-Reply-To: <20200206054034.162732-7-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--3D7yMlnunRPwJqC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 10:40:33PM -0700, Simon Glass wrote:
> Allow enabling FDT_ASSUME_LATEST to disable version checks.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
>=20
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/fdt.c    | 34 +++++++++++++++++++++-------------
>  libfdt/fdt_ro.c | 16 ++++++++--------
>  libfdt/fdt_rw.c |  6 +++---
>  3 files changed, 32 insertions(+), 24 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index e2c1da0..0ac8736 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -21,10 +21,13 @@ int32_t fdt_ro_probe_(const void *fdt)
> =20
>  	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
>  		/* Complete tree */
> -		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> -			return -FDT_ERR_BADVERSION;
> -		if (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION)
> -			return -FDT_ERR_BADVERSION;
> +		if (!can_assume(LATEST)) {
> +			if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> +				return -FDT_ERR_BADVERSION;
> +			if (fdt_last_comp_version(fdt) >
> +					FDT_LAST_SUPPORTED_VERSION)
> +				return -FDT_ERR_BADVERSION;
> +		}
>  	} else if (fdt_magic(fdt) =3D=3D FDT_SW_MAGIC) {
>  		/* Unfinished sequential-write blob */
>  		if (fdt_size_dt_struct(fdt) =3D=3D 0)
> @@ -72,7 +75,8 @@ size_t fdt_header_size_(uint32_t version)
> =20
>  size_t fdt_header_size(const void *fdt)
>  {
> -	return fdt_header_size_(fdt_version(fdt));
> +	return can_assume(LATEST) ? FDT_V17_SIZE :
> +		fdt_header_size_(fdt_version(fdt));
>  }
> =20
>  int fdt_check_header(const void *fdt)
> @@ -81,11 +85,14 @@ int fdt_check_header(const void *fdt)
> =20
>  	if (fdt_magic(fdt) !=3D FDT_MAGIC)
>  		return -FDT_ERR_BADMAGIC;
> -	if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> -	    || (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION))
> -		return -FDT_ERR_BADVERSION;
> -	if (fdt_version(fdt) < fdt_last_comp_version(fdt))
> -		return -FDT_ERR_BADVERSION;
> +	if (!can_assume(LATEST)) {
> +		if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> +		    || (fdt_last_comp_version(fdt) >
> +			FDT_LAST_SUPPORTED_VERSION))
> +			return -FDT_ERR_BADVERSION;
> +		if (fdt_version(fdt) < fdt_last_comp_version(fdt))
> +			return -FDT_ERR_BADVERSION;
> +	}
>  	hdrsize =3D fdt_header_size(fdt);
>  	if (!can_assume(VALID_DTB)) {
> =20
> @@ -101,7 +108,7 @@ int fdt_check_header(const void *fdt)
> =20
>  	if (!can_assume(VALID_DTB)) {
>  		/* Bounds check structure block */
> -		if (fdt_version(fdt) < 17) {
> +		if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
>  			if (!check_off_(hdrsize, fdt_totalsize(fdt),
>  					fdt_off_dt_struct(fdt)))
>  				return -FDT_ERR_TRUNCATED;
> @@ -132,7 +139,7 @@ const void *fdt_offset_ptr(const void *fdt, int offse=
t, unsigned int len)
>  		    || (absoffset + len) > fdt_totalsize(fdt))
>  			return NULL;
> =20
> -	if (fdt_version(fdt) >=3D 0x11)
> +	if (can_assume(LATEST) || fdt_version(fdt) >=3D 0x11)
>  		if (((offset + len) < offset)
>  		    || ((offset + len) > fdt_size_dt_struct(fdt)))
>  			return NULL;
> @@ -172,7 +179,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  		/* skip-name offset, length and value */
>  		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
>  			+ fdt32_to_cpu(*lenp);
> -		if (fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >=3D 8 &&
> +		if (!can_assume(LATEST) &&
> +		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >=3D 8 &&
>  		    ((offset - fdt32_to_cpu(*lenp)) % 8) !=3D 0)
>  			offset +=3D 4;
>  		break;
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 07c13c9..63cb60e 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -60,7 +60,7 @@ const char *fdt_get_string(const void *fdt, int stroffs=
et, int *lenp)
>  	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
>  		if (stroffset < 0)
>  			goto fail;
> -		if (fdt_version(fdt) >=3D 17) {
> +		if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
>  			if (stroffset >=3D fdt_size_dt_strings(fdt))
>  				goto fail;
>  			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
> @@ -311,7 +311,7 @@ const char *fdt_get_name(const void *fdt, int nodeoff=
set, int *len)
> =20
>  	nameptr =3D nh->name;
> =20
> -	if (fdt_version(fdt) < 0x10) {
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
>  		/*
>  		 * For old FDT versions, match the naming conventions of V16:
>  		 * give only the leaf name (after all /). The actual tree
> @@ -384,7 +384,7 @@ const struct fdt_property *fdt_get_property_by_offset=
(const void *fdt,
>  	/* Prior to version 16, properties may need realignment
>  	 * and this API does not work. fdt_getprop_*() will, however. */
> =20
> -	if (fdt_version(fdt) < 0x10) {
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
>  		if (lenp)
>  			*lenp =3D -FDT_ERR_BADVERSION;
>  		return NULL;
> @@ -431,7 +431,7 @@ const struct fdt_property *fdt_get_property_namelen(c=
onst void *fdt,
>  {
>  	/* Prior to version 16, properties may need realignment
>  	 * and this API does not work. fdt_getprop_*() will, however. */
> -	if (fdt_version(fdt) < 0x10) {
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
>  		if (lenp)
>  			*lenp =3D -FDT_ERR_BADVERSION;
>  		return NULL;
> @@ -462,8 +462,8 @@ const void *fdt_getprop_namelen(const void *fdt, int =
nodeoffset,
>  		return NULL;
> =20
>  	/* Handle realignment */
> -	if (fdt_version(fdt) < 0x10 && (poffset + sizeof(*prop)) % 8 &&
> -	    fdt32_ld(&prop->len) >=3D 8)
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
> +	    (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >=3D 8)
>  		return prop->data + 4;
>  	return prop->data;
>  }
> @@ -495,8 +495,8 @@ const void *fdt_getprop_by_offset(const void *fdt, in=
t offset,
>  	}
> =20
>  	/* Handle realignment */
> -	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
> -	    fdt32_ld(&prop->len) >=3D 8)
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
> +	    (offset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >=3D 8)
>  		return prop->data + 4;
>  	return prop->data;
>  }
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 75f70d9..a18e123 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -30,12 +30,12 @@ static int fdt_rw_probe_(void *fdt)
>  		return 0;
>  	FDT_RO_PROBE(fdt);
> =20
> -	if (fdt_version(fdt) < 17)
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
>  		return -FDT_ERR_BADVERSION;
>  	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
>  				   fdt_size_dt_struct(fdt)))
>  		return -FDT_ERR_BADLAYOUT;
> -	if (fdt_version(fdt) > 17)
> +	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
>  		fdt_set_version(fdt, 17);
> =20
>  	return 0;
> @@ -428,7 +428,7 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
>  	mem_rsv_size =3D (fdt_num_mem_rsv(fdt)+1)
>  		* sizeof(struct fdt_reserve_entry);
> =20
> -	if (fdt_version(fdt) >=3D 17) {
> +	if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
>  		struct_size =3D fdt_size_dt_struct(fdt);
>  	} else {
>  		struct_size =3D 0;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3D7yMlnunRPwJqC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5CGxsACgkQbDjKyiDZ
s5IcHhAAqMsiYvX/j4Ehqil8m2F6efJv1w2ZMXnR+5KzBXwqI+GpY1J+JjAkKq7I
awmzQEjiYGHFqqUi+2ephsjsuUrRYEYMM4mszswSleBKuiXWwLmf5n09CjqvrnLI
k3zzThy1uUd3Xr6eYDnZ8+maqghbrzdokyeMXvQwjDJbTRoyf76Ho/EOnaQzf9Qf
Oayq5Zv2sPv7LFA+FGL/L9tWG4ajhycBgHQmbG9xJCHQhRFRM94TQ3MSSQg8w+LJ
xq4FurUjw8JNM3I7wEOeeO3xYf2iz4mfHIGtabt08cBhxA6QDSxT9MR/itEzrhTh
Q0dTW3SfD+PteNyIbJCKxEveKgRKp6QFAiixTcQw3ygNmzaxYCvYZn0z+XLmUMcu
9qIPd8DgU1cB9RwuheZ5D68CKu6XhHFzKC3VADxYfA3KuuMnTm+JpYwtwEPP8I/9
RpZSdwRjBeZBYCdQ3CPMGlah8+nP8DXqbYG4AVQSGfaMalrCtWgoqWx/nYEeSDsx
BEWO9NM+xYr4MhhyM2+atyHNDquk4i9Fuiglf+Pew6hkiKLp/2lUNTIJtE19ax8C
SmATSZYdetxWCpmpltGeMs7fXqDYQJ5pSkxNF078RR5O9QCawX+P2uDpaH8NYM7G
VBzppWN/VF9qe/HTgDhx69LmWD7t89vEBy41+5kqw0RsAmPL00U=
=+mPK
-----END PGP SIGNATURE-----

--3D7yMlnunRPwJqC7--
