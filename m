From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 3/7] libfdt: Add support for disabling dtb checks
Date: Mon, 10 Feb 2020 15:02:01 +1100
Message-ID: <20200210040201.GA22584@umbus.fritz.box>
References: <20200206054034.162732-1-sjg@chromium.org>
 <20200206054034.162732-4-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581316308;
        bh=+0VKvglmaMKQ2Za47zfHGW84diQAtkoADhFalUodiFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G3wCcoe8iINjaIzUeZZGlFt8OU8vOZVWVKYr2oQnrYX4fP4K2mfkQkxozEzzOKiUn
         MJlEBgreeENpOu9Ivb4hzMk+Yad5YuW7qP7OsVu9gIqE4kcokgMfT18+xO+lMJZH79
         fC0BtnPDoHOR0gqhQ4loWzdssjzQhTwa2xIxJSDY=
Content-Disposition: inline
In-Reply-To: <20200206054034.162732-4-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 10:40:30PM -0700, Simon Glass wrote:
> Support ASSUME_VALID_DTB to disable some sanity checks
>=20
> If we assume that the DTB itself is valid then we can skip some checks and
> save code space. Add various conditions to handle this.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v5:
> - Split out VALID_DTB checks into a separate patch
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/fdt.c             | 50 ++++++++++++++++++++++------------------
>  libfdt/fdt_ro.c          |  7 ++++--
>  libfdt/fdt_rw.c          |  7 +++++-
>  libfdt/fdt_sw.c          | 30 ++++++++++++++++--------
>  libfdt/libfdt_internal.h |  7 ++++--
>  5 files changed, 64 insertions(+), 37 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 3e37a4b..03f2b7d 100644
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
> +	if (!can_assume(VALID_DTB)) {
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
> +	if (!can_assume(VALID_DTB)) {
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
> @@ -142,7 +148,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
> =20
>  	*nextoffset =3D -FDT_ERR_TRUNCATED;
>  	tagp =3D fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
> -	if (!tagp)
> +	if (!can_assume(VALID_DTB) && !tagp)
>  		return FDT_END; /* premature end */
>  	tag =3D fdt32_to_cpu(*tagp);
>  	offset +=3D FDT_TAGSIZE;
> @@ -154,13 +160,13 @@ uint32_t fdt_next_tag(const void *fdt, int startoff=
set, int *nextoffset)
>  		do {
>  			p =3D fdt_offset_ptr(fdt, offset++, 1);
>  		} while (p && (*p !=3D '\0'));
> -		if (!p)
> +		if (!can_assume(VALID_DTB) && !p)
>  			return FDT_END; /* premature end */
>  		break;
> =20
>  	case FDT_PROP:
>  		lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> -		if (!lenp)
> +		if (!can_assume(VALID_DTB) && !lenp)
>  			return FDT_END; /* premature end */
>  		/* skip-name offset, length and value */
>  		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index a5c2797..b41083f 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -289,9 +289,12 @@ const char *fdt_get_name(const void *fdt, int nodeof=
fset, int *len)
>  	const char *nameptr;
>  	int err;
> =20
> -	if (((err =3D fdt_ro_probe_(fdt)) < 0)
> -	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0))
> +	if (!can_assume(VALID_DTB)) {
> +		if ((err =3D fdt_ro_probe_(fdt)) < 0)

Seems like it might be cleaner to include the can_assume() check into
fdt_ro_probe_().

>  			goto fail;
> +		if ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> +			goto fail;
> +	}
> =20
>  	nameptr =3D nh->name;
> =20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 8795947..7a41a31 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -13,6 +13,8 @@
>  static int fdt_blocks_misordered_(const void *fdt,
>  				  int mem_rsv_size, int struct_size)
>  {
> +	if (can_assume(VALID_DTB))
> +		return false;

Urgh... the spec doesn't actually specify a block order, so I'm not
sure we can put this one under VALID_DTB.


>  	return (fdt_off_mem_rsvmap(fdt) < FDT_ALIGN(sizeof(struct fdt_header), =
8))
>  		|| (fdt_off_dt_struct(fdt) <
>  		    (fdt_off_mem_rsvmap(fdt) + mem_rsv_size))
> @@ -24,6 +26,8 @@ static int fdt_blocks_misordered_(const void *fdt,
> =20
>  static int fdt_rw_probe_(void *fdt)
>  {
> +	if (can_assume(VALID_DTB))
> +		return 0;
>  	FDT_RO_PROBE(fdt);
> =20
>  	if (fdt_version(fdt) < 17)
> @@ -40,7 +44,8 @@ static int fdt_rw_probe_(void *fdt)
>  #define FDT_RW_PROBE(fdt) \
>  	{ \
>  		int err_; \
> -		if ((err_ =3D fdt_rw_probe_(fdt)) !=3D 0) \
> +		if (!can_assume(VALID_DTB) && \
> +		    (err_ =3D fdt_rw_probe_(fdt)) !=3D 0) \


You shouldn't need the test both inside fdt_rw_probe_() and in the
FDT_RW_PROBE() macro, no?

>  			return err_; \
>  	}
> =20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 76bea22..8fca816 100644
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
> +	if (!can_assume(VALID_DTB)) {
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
> +		if (!can_assume(VALID_DTB) && (err =3D fdt_sw_probe_(fdt)) !=3D 0) \

Same question here.

>  			return err; \
>  	}
> =20
> @@ -38,7 +41,7 @@ static int fdt_sw_probe_memrsv_(void *fdt)
>  	if (err)
>  		return err;
> =20
> -	if (fdt_off_dt_strings(fdt) !=3D 0)
> +	if (!can_assume(VALID_DTB) && fdt_off_dt_strings(fdt) !=3D 0)
>  		return -FDT_ERR_BADSTATE;
>  	return 0;
>  }
> @@ -46,7 +49,8 @@ static int fdt_sw_probe_memrsv_(void *fdt)
>  #define FDT_SW_PROBE_MEMRSV(fdt) \
>  	{ \
>  		int err; \
> -		if ((err =3D fdt_sw_probe_memrsv_(fdt)) !=3D 0) \
> +		if (!can_assume(VALID_DTB) && \

And here.

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
> +	if (can_assume(VALID_DTB))
> +		return 0;
> +	err =3D fdt_sw_probe_(fdt);

And here.

>  	if (err)
>  		return err;
> =20
> @@ -72,7 +80,8 @@ static int fdt_sw_probe_struct_(void *fdt)
>  #define FDT_SW_PROBE_STRUCT(fdt) \
>  	{ \
>  		int err; \
> -		if ((err =3D fdt_sw_probe_struct_(fdt)) !=3D 0) \
> +		if (!can_assume(VALID_DTB) && \
> +		    (err =3D fdt_sw_probe_struct_(fdt)) !=3D 0) \

And here.

>  			return err; \
>  	}
> =20
> @@ -151,7 +160,8 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
>  	headsize =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
>  	tailsize =3D fdt_size_dt_strings(fdt);
> =20
> -	if ((headsize + tailsize) > fdt_totalsize(fdt))
> +	if (!can_assume(VALID_DTB) &&
> +	    headsize + tailsize > fdt_totalsize(fdt))
>  		return -FDT_ERR_INTERNAL;
> =20
>  	if ((headsize + tailsize) > bufsize)
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 1e31d10..1aa732b 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -14,8 +14,11 @@ int32_t fdt_ro_probe_(const void *fdt);
>  #define FDT_RO_PROBE(fdt)					\
>  	{							\
>  		int32_t totalsize_;				\
> -		if ((totalsize_ =3D fdt_ro_probe_(fdt)) < 0)	\
> -			return totalsize_;			\
> +		if (!can_assume(VALID_DTB)) {			\
> +			totalsize_ =3D fdt_ro_probe_(fdt);	\
> +			if (totalsize_ < 0)			\
> +				return totalsize_;		\
> +		}						\

And here.

>  	}
> =20
>  int fdt_check_node_offset_(const void *fdt, int offset);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5A1bYACgkQbDjKyiDZ
s5JyqBAAiRzMwHvTvcSyj4HMzcVeINueigB8r6PPqQDKppIVOhihRqdFi/pMLK0B
ydGzFyeezJgel26iZTsPSZYzXAaEQ4+ptplvDxjDTHWFGrV2HN468S7NwPOsT2a0
cUFZjKBys7GfC7n1DY8TKV0QK++BqBbiPtEXTVh2UNj8nen1Yr+jfdPaix7E1Yq6
3h3nBR5oLCL/ztrUhoRn0u6jAQnYPtDvR4wz1cnxqJloyA0WH0XSqGXZxtb0FiG/
EMQNutzSIZ0L76+8DNkkDhroVNNcoce8WGgUTwUtyEXMEB0ZK2YbYs32dbxk5MyK
ckM2/iRDAVwkBObVA9f3+bEgCUE72pgTpEPX6xCPnB9nzcgt/gWbX1J8DNPoM/V8
zq+Smwo9wy1IAxtSP5Ub85ldYDDz3Ut/X/x+4qKGh0xlhKGcNlR0aNLguMRr7qdv
GlKWfd2rrZBwVdWcdYUUPtTnl81T1QijAT08mDXPRAX19CbNeUyF/oGtsHpV2sem
ENtLYh9xiHr6BdoSfWuUT+SkNFm5U5MYiHFqZUcwQRy+eLmZp1dn4vhKwJonTCGR
IH0S3brOQ96CLmtqoYm/KhBcSVRlroZdh15owR7TZnIkSHWePoyuM6llfLk27V+2
n6JZnIhiPUaUu901h2A27+XOJg/66xVNoCcwaINmniyeUJFtOjM=
=PdsX
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
