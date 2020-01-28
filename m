From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 3/6] libfdt: Add support for disabling sanity checks
Date: Tue, 28 Jan 2020 19:33:27 +1100
Message-ID: <20200128083327.GI42099@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-4-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hAW+M2+FUO+onfmf"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580200674;
        bh=qJMTFi3z8LlqXrEIBstjZv5iHXbqxna5mYGOPeR0+Wo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=loZinLCDsPMuviEszYK0g2CTXka/sQqovP359wfbctDas2tcQRsqPLKw0IJe0mf0E
         E5/cXBspyVPc6pHgTEL8fTtNZmC4OKNKt294hFfEDb0kK/EcjiSgteLcNBTaLQku30
         oppRWfcsltNfW1zGuaGVhCxvbr4Y8wp28sNcFH/g=
Content-Disposition: inline
In-Reply-To: <20191113015422.67210-4-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--hAW+M2+FUO+onfmf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 06:54:19PM -0700, Simon Glass wrote:
> Allow enabling FDT_ASSUME_SANE to disable sanity checks.

LGTM, with the exception of the possible splitting of assuming sane
dtb contents from assuming sane parameters mentioned earlier.

>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/fdt.c             | 62 +++++++++++++++++++---------------
>  libfdt/fdt_ro.c          | 73 ++++++++++++++++++++++++++--------------
>  libfdt/fdt_rw.c          |  6 +++-
>  libfdt/fdt_sw.c          | 29 ++++++++++------
>  libfdt/libfdt_internal.h |  9 +++--
>  5 files changed, 113 insertions(+), 66 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 3e37a4b..d89c0e0 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -81,38 +81,44 @@ int fdt_check_header(const void *fdt)
> =20
>  	if (fdt_magic(fdt) !=3D FDT_MAGIC)
>  		return -FDT_ERR_BADMAGIC;
> -	hdrsize =3D fdt_header_size(fdt);
>  	if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
>  	    || (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION))
>  		return -FDT_ERR_BADVERSION;
>  	if (fdt_version(fdt) < fdt_last_comp_version(fdt))
>  		return -FDT_ERR_BADVERSION;
> +	hdrsize =3D fdt_header_size(fdt);
> +	if (!can_assume(SANE)) {
> =20
> -	if ((fdt_totalsize(fdt) < hdrsize)
> -	    || (fdt_totalsize(fdt) > INT_MAX))
> -		return -FDT_ERR_TRUNCATED;
> -
> -	/* Bounds check memrsv block */
> -	if (!check_off_(hdrsize, fdt_totalsize(fdt), fdt_off_mem_rsvmap(fdt)))
> -		return -FDT_ERR_TRUNCATED;
> +		if ((fdt_totalsize(fdt) < hdrsize)
> +		    || (fdt_totalsize(fdt) > INT_MAX))
> +			return -FDT_ERR_TRUNCATED;
> =20
> -	/* Bounds check structure block */
> -	if (fdt_version(fdt) < 17) {
> +		/* Bounds check memrsv block */
>  		if (!check_off_(hdrsize, fdt_totalsize(fdt),
> -				fdt_off_dt_struct(fdt)))
> +				fdt_off_mem_rsvmap(fdt)))
>  			return -FDT_ERR_TRUNCATED;
> -	} else {
> +	}
> +
> +	if (!can_assume(SANE)) {
> +		/* Bounds check structure block */
> +		if (fdt_version(fdt) < 17) {
> +			if (!check_off_(hdrsize, fdt_totalsize(fdt),
> +					fdt_off_dt_struct(fdt)))
> +				return -FDT_ERR_TRUNCATED;
> +		} else {
> +			if (!check_block_(hdrsize, fdt_totalsize(fdt),
> +					  fdt_off_dt_struct(fdt),
> +					  fdt_size_dt_struct(fdt)))
> +				return -FDT_ERR_TRUNCATED;
> +		}
> +
> +		/* Bounds check strings block */
>  		if (!check_block_(hdrsize, fdt_totalsize(fdt),
> -				  fdt_off_dt_struct(fdt),
> -				  fdt_size_dt_struct(fdt)))
> +				  fdt_off_dt_strings(fdt),
> +				  fdt_size_dt_strings(fdt)))
>  			return -FDT_ERR_TRUNCATED;
>  	}
> =20
> -	/* Bounds check strings block */
> -	if (!check_block_(hdrsize, fdt_totalsize(fdt),
> -			  fdt_off_dt_strings(fdt), fdt_size_dt_strings(fdt)))
> -		return -FDT_ERR_TRUNCATED;
> -
>  	return 0;
>  }
> =20
> @@ -120,10 +126,11 @@ const void *fdt_offset_ptr(const void *fdt, int off=
set, unsigned int len)
>  {
>  	unsigned absoffset =3D offset + fdt_off_dt_struct(fdt);
> =20
> -	if ((absoffset < offset)
> -	    || ((absoffset + len) < absoffset)
> -	    || (absoffset + len) > fdt_totalsize(fdt))
> -		return NULL;
> +	if (!can_assume(SANE))
> +		if ((absoffset < offset)
> +		    || ((absoffset + len) < absoffset)
> +		    || (absoffset + len) > fdt_totalsize(fdt))
> +			return NULL;
> =20
>  	if (fdt_version(fdt) >=3D 0x11)
>  		if (((offset + len) < offset)
> @@ -142,7 +149,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
> =20
>  	*nextoffset =3D -FDT_ERR_TRUNCATED;
>  	tagp =3D fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
> -	if (!tagp)
> +	if (!can_assume(SANE) && !tagp)
>  		return FDT_END; /* premature end */
>  	tag =3D fdt32_to_cpu(*tagp);
>  	offset +=3D FDT_TAGSIZE;
> @@ -154,13 +161,13 @@ uint32_t fdt_next_tag(const void *fdt, int startoff=
set, int *nextoffset)
>  		do {
>  			p =3D fdt_offset_ptr(fdt, offset++, 1);
>  		} while (p && (*p !=3D '\0'));
> -		if (!p)
> +		if (!can_assume(SANE) && !p)
>  			return FDT_END; /* premature end */
>  		break;
> =20
>  	case FDT_PROP:
>  		lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> -		if (!lenp)
> +		if (!can_assume(SANE) && !lenp)
>  			return FDT_END; /* premature end */
>  		/* skip-name offset, length and value */
>  		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
> @@ -179,7 +186,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  		return FDT_END;
>  	}
> =20
> -	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> +	if (!can_assume(SANE) &&
> +	    !fdt_offset_ptr(fdt, startoffset, offset - startoffset))
>  		return FDT_END; /* premature end */
> =20
>  	*nextoffset =3D FDT_TAGALIGN(offset);
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index a5c2797..5615bff 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -16,7 +16,7 @@ static int fdt_nodename_eq_(const void *fdt, int offset,
>  	int olen;
>  	const char *p =3D fdt_get_name(fdt, offset, &olen);
> =20
> -	if (!p || olen < len)
> +	if (!p || (!can_assume(SANE) && olen < len))
>  		/* short match */
>  		return 0;
> =20
> @@ -33,17 +33,26 @@ static int fdt_nodename_eq_(const void *fdt, int offs=
et,
> =20
>  const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
>  {
> -	int32_t totalsize =3D fdt_ro_probe_(fdt);
> -	uint32_t absoffset =3D stroffset + fdt_off_dt_strings(fdt);
> +	int32_t totalsize;
> +	uint32_t absoffset;
>  	size_t len;
>  	int err;
>  	const char *s, *n;
> =20
> +	if (can_assume(SANE)) {
> +		s =3D (const char *)fdt + fdt_off_dt_strings(fdt) + stroffset;
> +
> +		if (lenp)
> +			*lenp =3D strlen(s);
> +		return s;
> +	}
> +	totalsize =3D fdt_ro_probe_(fdt);
>  	err =3D totalsize;
>  	if (totalsize < 0)
>  		goto fail;
> =20
>  	err =3D -FDT_ERR_BADOFFSET;
> +	absoffset =3D stroffset + fdt_off_dt_strings(fdt);
>  	if (absoffset >=3D totalsize)
>  		goto fail;
>  	len =3D totalsize - absoffset;
> @@ -151,10 +160,13 @@ static const struct fdt_reserve_entry *fdt_mem_rsv(=
const void *fdt, int n)
>  	int offset =3D n * sizeof(struct fdt_reserve_entry);
>  	int absoffset =3D fdt_off_mem_rsvmap(fdt) + offset;
> =20
> -	if (absoffset < fdt_off_mem_rsvmap(fdt))
> -		return NULL;
> -	if (absoffset > fdt_totalsize(fdt) - sizeof(struct fdt_reserve_entry))
> -		return NULL;
> +	if (!can_assume(SANE)) {
> +		if (absoffset < fdt_off_mem_rsvmap(fdt))
> +			return NULL;
> +		if (absoffset > fdt_totalsize(fdt) -
> +		    sizeof(struct fdt_reserve_entry))
> +			return NULL;
> +	}
>  	return fdt_mem_rsv_(fdt, n);
>  }
> =20
> @@ -164,7 +176,7 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t =
*address, uint64_t *size)
> =20
>  	FDT_RO_PROBE(fdt);
>  	re =3D fdt_mem_rsv(fdt, n);
> -	if (!re)
> +	if (!can_assume(SANE) && !re)
>  		return -FDT_ERR_BADOFFSET;
> =20
>  	*address =3D fdt64_ld(&re->address);
> @@ -289,9 +301,10 @@ const char *fdt_get_name(const void *fdt, int nodeof=
fset, int *len)
>  	const char *nameptr;
>  	int err;
> =20
> -	if (((err =3D fdt_ro_probe_(fdt)) < 0)
> -	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0))
> -			goto fail;
> +	if (!can_assume(SANE) &&
> +	    (((err =3D fdt_ro_probe_(fdt)) < 0)
> +	     || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
> +		goto fail;
> =20
>  	nameptr =3D nh->name;
> =20
> @@ -346,7 +359,8 @@ static const struct fdt_property *fdt_get_property_by=
_offset_(const void *fdt,
>  	int err;
>  	const struct fdt_property *prop;
> =20
> -	if ((err =3D fdt_check_prop_offset_(fdt, offset)) < 0) {
> +	if (!can_assume(SANE) &&
> +	    (err =3D fdt_check_prop_offset_(fdt, offset)) < 0) {
>  		if (lenp)
>  			*lenp =3D err;
>  		return NULL;
> @@ -388,7 +402,8 @@ static const struct fdt_property *fdt_get_property_na=
melen_(const void *fdt,
>  	     (offset =3D fdt_next_property_offset(fdt, offset))) {
>  		const struct fdt_property *prop;
> =20
> -		if (!(prop =3D fdt_get_property_by_offset_(fdt, offset, lenp))) {
> +		prop =3D fdt_get_property_by_offset_(fdt, offset, lenp);
> +		if (!can_assume(SANE) && !prop) {
>  			offset =3D -FDT_ERR_INTERNAL;
>  			break;
>  		}
> @@ -461,14 +476,19 @@ const void *fdt_getprop_by_offset(const void *fdt, =
int offset,
>  	if (namep) {
>  		const char *name;
>  		int namelen;
> -		name =3D fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
> -				      &namelen);
> -		if (!name) {
> -			if (lenp)
> -				*lenp =3D namelen;
> -			return NULL;
> +
> +		if (!can_assume(SANE)) {
> +			name =3D fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
> +					      &namelen);
> +			if (!name) {
> +				if (lenp)
> +					*lenp =3D namelen;
> +				return NULL;
> +			}
> +			*namep =3D name;
> +		} else {
> +			*namep =3D fdt_string(fdt, fdt32_ld(&prop->nameoff));
>  		}
> -		*namep =3D name;
>  	}
> =20
>  	/* Handle realignment */
> @@ -598,10 +618,12 @@ int fdt_supernode_atdepth_offset(const void *fdt, i=
nt nodeoffset,
>  		}
>  	}
> =20
> -	if ((offset =3D=3D -FDT_ERR_NOTFOUND) || (offset >=3D 0))
> -		return -FDT_ERR_BADOFFSET;
> -	else if (offset =3D=3D -FDT_ERR_BADOFFSET)
> -		return -FDT_ERR_BADSTRUCTURE;
> +	if (!can_assume(SANE)) {
> +		if ((offset =3D=3D -FDT_ERR_NOTFOUND) || (offset >=3D 0))
> +			return -FDT_ERR_BADOFFSET;
> +		else if (offset =3D=3D -FDT_ERR_BADOFFSET)
> +			return -FDT_ERR_BADSTRUCTURE;
> +	}
> =20
>  	return offset; /* error from fdt_next_node() */
>  }
> @@ -613,7 +635,8 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
> =20
>  	err =3D fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
>  	if (err)
> -		return (err < 0) ? err : -FDT_ERR_INTERNAL;
> +		return (can_assume(SANE) || err < 0) ? err :
> +			-FDT_ERR_INTERNAL;
>  	return nodedepth;
>  }
> =20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 8795947..1dd9cf0 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -13,6 +13,8 @@
>  static int fdt_blocks_misordered_(const void *fdt,
>  				  int mem_rsv_size, int struct_size)
>  {
> +	if (can_assume(SANE))
> +		return false;
>  	return (fdt_off_mem_rsvmap(fdt) < FDT_ALIGN(sizeof(struct fdt_header), =
8))
>  		|| (fdt_off_dt_struct(fdt) <
>  		    (fdt_off_mem_rsvmap(fdt) + mem_rsv_size))
> @@ -24,6 +26,8 @@ static int fdt_blocks_misordered_(const void *fdt,
> =20
>  static int fdt_rw_probe_(void *fdt)
>  {
> +	if (can_assume(SANE))
> +		return 0;
>  	FDT_RO_PROBE(fdt);
> =20
>  	if (fdt_version(fdt) < 17)
> @@ -40,7 +44,7 @@ static int fdt_rw_probe_(void *fdt)
>  #define FDT_RW_PROBE(fdt) \
>  	{ \
>  		int err_; \
> -		if ((err_ =3D fdt_rw_probe_(fdt)) !=3D 0) \
> +		if (!can_assume(SANE) && (err_ =3D fdt_rw_probe_(fdt)) !=3D 0) \
>  			return err_; \
>  	}
> =20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 76bea22..cd0032a 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -12,17 +12,20 @@
> =20
>  static int fdt_sw_probe_(void *fdt)
>  {
> -	if (fdt_magic(fdt) =3D=3D FDT_MAGIC)
> -		return -FDT_ERR_BADSTATE;
> -	else if (fdt_magic(fdt) !=3D FDT_SW_MAGIC)
> -		return -FDT_ERR_BADMAGIC;
> +	if (!can_assume(SANE)) {
> +		if (fdt_magic(fdt) =3D=3D FDT_MAGIC)
> +			return -FDT_ERR_BADSTATE;
> +		else if (fdt_magic(fdt) !=3D FDT_SW_MAGIC)
> +			return -FDT_ERR_BADMAGIC;
> +	}
> +
>  	return 0;
>  }
> =20
>  #define FDT_SW_PROBE(fdt) \
>  	{ \
>  		int err; \
> -		if ((err =3D fdt_sw_probe_(fdt)) !=3D 0) \
> +		if (!can_assume(SANE) && (err =3D fdt_sw_probe_(fdt)) !=3D 0) \
>  			return err; \
>  	}
> =20
> @@ -38,7 +41,7 @@ static int fdt_sw_probe_memrsv_(void *fdt)
>  	if (err)
>  		return err;
> =20
> -	if (fdt_off_dt_strings(fdt) !=3D 0)
> +	if (!can_assume(SANE) && fdt_off_dt_strings(fdt) !=3D 0)
>  		return -FDT_ERR_BADSTATE;
>  	return 0;
>  }
> @@ -46,7 +49,8 @@ static int fdt_sw_probe_memrsv_(void *fdt)
>  #define FDT_SW_PROBE_MEMRSV(fdt) \
>  	{ \
>  		int err; \
> -		if ((err =3D fdt_sw_probe_memrsv_(fdt)) !=3D 0) \
> +		if (!can_assume(SANE) && \
> +		    (err =3D fdt_sw_probe_memrsv_(fdt)) !=3D 0) \
>  			return err; \
>  	}
> =20
> @@ -60,7 +64,11 @@ static int fdt_sw_probe_memrsv_(void *fdt)
>   */
>  static int fdt_sw_probe_struct_(void *fdt)
>  {
> -	int err =3D fdt_sw_probe_(fdt);
> +	int err;
> +
> +	if (can_assume(SANE))
> +		return 0;
> +	err =3D fdt_sw_probe_(fdt);
>  	if (err)
>  		return err;
> =20
> @@ -72,7 +80,8 @@ static int fdt_sw_probe_struct_(void *fdt)
>  #define FDT_SW_PROBE_STRUCT(fdt) \
>  	{ \
>  		int err; \
> -		if ((err =3D fdt_sw_probe_struct_(fdt)) !=3D 0) \
> +		if (!can_assume(SANE) && \
> +		    (err =3D fdt_sw_probe_struct_(fdt)) !=3D 0) \
>  			return err; \
>  	}
> =20
> @@ -151,7 +160,7 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
>  	headsize =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
>  	tailsize =3D fdt_size_dt_strings(fdt);
> =20
> -	if ((headsize + tailsize) > fdt_totalsize(fdt))
> +	if (!can_assume(SANE) && (headsize + tailsize) > fdt_totalsize(fdt))
>  		return -FDT_ERR_INTERNAL;
> =20
>  	if ((headsize + tailsize) > bufsize)
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 198480c..4612fd0 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -13,9 +13,12 @@
>  int32_t fdt_ro_probe_(const void *fdt);
>  #define FDT_RO_PROBE(fdt)					\
>  	{							\
> -		int32_t totalsize_;				\
> -		if ((totalsize_ =3D fdt_ro_probe_(fdt)) < 0)	\
> -			return totalsize_;			\
> +		int32_t totalsize_;					\
> +		if (!can_assume(SANE)) {				\
> +			totalsize_ =3D fdt_ro_probe_(fdt);	\
> +			if (totalsize_ < 0)			\
> +				return totalsize_;		\
> +		}						\
>  	}
> =20
>  int fdt_check_node_offset_(const void *fdt, int offset);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hAW+M2+FUO+onfmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4v8dYACgkQbDjKyiDZ
s5LHAw//TmIX4jI/rcThok8gRTsOnVSkoEqJ7oNUchYtqGCDa8Tz6y15dL2hl9tQ
IFBdKge//WOa8p5Tb58sDQRVqaZzLlwFWXo90ggotVtyFTIkFO4+b46Zi/VqpCcp
oT6o0rZgcj/xFZU5hknlEQAYdF2NPnBz45P26T8YkQ4YnWSKnobOjmparpHmQFPJ
YE7BWOIVduMZsTlcV0h81ZvZ+l18f95oHFyjbEoCsn54vvTqPZNoaIWoRabyABYp
j6Vl7wgybMrokhdqlLNr83ShXfruZDbbIdAJ8ue8A6kQUv3qugpuWS96NJbclRTe
3i00w5EKgbLO4ULl0OKDkPFx1Ww2ral56Mo87t08bI3tQkvDPsF5i1A0VzXG4qWn
/5nqvJWKB0EO0xQOeyDUstwNGj17/3rDOD4RJ3lS/Uz9noAoZ0PRXi5lFpBSruWe
knH4UiAJK/fPu75gD2rpk8Y+Y9haeAa92aPmf35uJuw3FDUM2ff84UTqBWuZfy2R
kV5IEn/Rnn6UYthyGnnBQS7FOhzBgKeBugquT6fK6FUOoFpiyrgD3ZlYjJ/WXrQ8
Fanrhufr79bT1St6N6mmerDrmosblV/pvMYb0/5A6OsBgWY9/xtk1DmHM/rNNyuV
uRCAHLd4QaYY+cqeja3VefMhxsS7Ol9HBUEFFCmyeHL4kLtiwhE=
=rLEa
-----END PGP SIGNATURE-----

--hAW+M2+FUO+onfmf--
