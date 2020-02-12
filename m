From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 3/8] libfdt: Add support for disabling dtb checks
Date: Wed, 12 Feb 2020 15:38:47 +1100
Message-ID: <20200212043847.GS22584@umbus.fritz.box>
References: <20200211200945.46606-1-sjg@chromium.org>
 <20200211200945.46606-4-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TYoqghpzCwoKvQG2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581483093;
        bh=ineJYR1nEPxFDicbgvfY5JMPa8q4/WrvNYuOzMyopAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a7qyvxmIXaDYlPVB2eoC2L6oYdaz7IZ4/mcCIAMrMBATddMQOenyMV5RmB4vmvX9j
         hOOO7rUfFc1odV5uCqag8FZ2lLeE5C4N8Qm88hcOFyPogNIUgDb/Z9q0q/gt7zpj58
         OTs4D9q+Bi4fxwwRv5rp26XiynttIiL0Ya0NV6/A=
Content-Disposition: inline
In-Reply-To: <20200211200945.46606-4-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--TYoqghpzCwoKvQG2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 01:09:40PM -0700, Simon Glass wrote:
> Support ASSUME_VALID_DTB to disable some sanity checks
>=20
> If we assume that the DTB itself is valid then we can skip some checks and
> save code space. Add various conditions to handle this.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v6:
> - Always call fdt_ro_probe_(), etc. and have that function do the check
> - Change check in fdt_get_property_namelen_() to VALID_DTB
>=20
> Changes in v5:
> - Split out VALID_DTB checks into a separate patch
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/fdt.c    | 53 +++++++++++++++++++++++++++++--------------------
>  libfdt/fdt_ro.c |  3 ++-
>  libfdt/fdt_rw.c |  2 ++
>  libfdt/fdt_sw.c | 19 +++++++++++-------
>  4 files changed, 47 insertions(+), 30 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 3e37a4b..d4daf60 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -19,6 +19,9 @@ int32_t fdt_ro_probe_(const void *fdt)
>  {
>  	uint32_t totalsize =3D fdt_totalsize(fdt);
> =20
> +	if (can_assume(VALID_DTB))
> +		return totalsize;
> +
>  	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
>  		/* Complete tree */
>  		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> @@ -81,38 +84,44 @@ int fdt_check_header(const void *fdt)
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
> @@ -142,7 +151,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
> =20
>  	*nextoffset =3D -FDT_ERR_TRUNCATED;
>  	tagp =3D fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
> -	if (!tagp)
> +	if (!can_assume(VALID_DTB) && !tagp)
>  		return FDT_END; /* premature end */
>  	tag =3D fdt32_to_cpu(*tagp);
>  	offset +=3D FDT_TAGSIZE;
> @@ -154,13 +163,13 @@ uint32_t fdt_next_tag(const void *fdt, int startoff=
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
> index a5c2797..4c26fbe 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -388,7 +388,8 @@ static const struct fdt_property *fdt_get_property_na=
melen_(const void *fdt,
>  	     (offset =3D fdt_next_property_offset(fdt, offset))) {
>  		const struct fdt_property *prop;
> =20
> -		if (!(prop =3D fdt_get_property_by_offset_(fdt, offset, lenp))) {
> +		prop =3D fdt_get_property_by_offset_(fdt, offset, lenp);
> +		if (!can_assume(VALID_DTB) && !prop) {
>  			offset =3D -FDT_ERR_INTERNAL;
>  			break;
>  		}
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 8795947..707c00a 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -24,6 +24,8 @@ static int fdt_blocks_misordered_(const void *fdt,
> =20
>  static int fdt_rw_probe_(void *fdt)
>  {
> +	if (can_assume(VALID_DTB))
> +		return 0;
>  	FDT_RO_PROBE(fdt);
> =20
>  	if (fdt_version(fdt) < 17)
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 76bea22..96365b4 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -12,10 +12,13 @@
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
> +		    (err =3D fdt_sw_probe_memrsv_(fdt)) !=3D 0) \

Nit: with the can_assume() inside fdt_sw_probe_memrsv_(), I don't
think you need it here as well.

Otherwise, LGTM.

>  			return err; \
>  	}
> =20
> @@ -151,7 +155,8 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
>  	headsize =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
>  	tailsize =3D fdt_size_dt_strings(fdt);
> =20
> -	if ((headsize + tailsize) > fdt_totalsize(fdt))
> +	if (!can_assume(VALID_DTB) &&
> +	    headsize + tailsize > fdt_totalsize(fdt))
>  		return -FDT_ERR_INTERNAL;
> =20
>  	if ((headsize + tailsize) > bufsize)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TYoqghpzCwoKvQG2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5DgVcACgkQbDjKyiDZ
s5JbPA//QPyskDp8IfVlug0cvQVpc1Eo3Brjp62eski2X4Th/f8MouC+k83muEth
xmNl9+1+3a6fm+qZypemj5BuMaWHHlPY9xthnHQ3ZUezC0g6wVO/tux8Ld9qZtY2
3dDPewP6aG9HUn3PAoWB7oPACcbDYZYZoacit5EUXBG7B5plIcSC4M6ygf6hOt+T
r9r4XBibkmENSpECMtkLTszkEtVlBeoUpJY7Yd27F+Y95k74WVXQEuwhR90y69Kh
HFoEwiizyfICbLuQ8oMCLMpCS3HXkrXlA+LxDM0vu2wpGW6UBok5mqGaXWmUTMK8
6vIfQzKWv4trVzo2g/Sb7lVPLzip/3LplYtELPvPDcZjNvCpNOjoTY26a6hh148H
H+p6vWNiBOmaNATc20IlxEE9RrUpMk13BnbMArDgzaoI7nGK3d59sgfwhomOu1bT
u73tAsDJQsH8UMjWsKSl/kjmkcGuPrQ+9ROlP7X/oafhTa2KccBYBRo1Q8uFED7M
0781YS3gQEmhmpmVdydkHGYf5IPCM5iJKPqab0BQ0yZLOQf2r4VBis1NfmqQGqgr
EhC7mmg50Y/TxpmDKoenn+UBKV5L2pL8ReNOAff2EuDLMia6+kLdopnSpPU7CeX0
sn3iR+Oo/3I+Aw9EMnCBzaDHhKZ6bFdR+cjbkCAl1I9vX7r9KxU=
=zQa6
-----END PGP SIGNATURE-----

--TYoqghpzCwoKvQG2--
