From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 5/6] libfdt: Add support for disabling version checks
Date: Tue, 28 Jan 2020 19:37:09 +1100
Message-ID: <20200128083709.GK42099@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-6-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mPTHnM80CEnHQ2WJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580200674;
        bh=F9eq7A+DgZ31PcUchbVDpHcWDOBRJ25j6iuo4e7p4JE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g2YlWBQ3MTyDAuYZprZx+o6iDtB3BnFzqJDW6T+bdIKl1egBB96lWOEEES3ZsxJ0U
         toD9sjW7tGHDBb6H+5R9aVye0dddo6V4pLIOOjK5wNFzyhTIn++DBU/lFTEbraASC4
         +hpZxjFZ0NlUm8NE/wVJfqkE+BV+NXnTYRMFJMmw=
Content-Disposition: inline
In-Reply-To: <20191113015422.67210-6-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--mPTHnM80CEnHQ2WJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 06:54:21PM -0700, Simon Glass wrote:
> Allow enabling FDT_ASSUME_LATEST to disable version checks.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

LGTM, one minor comment below.

> ---
>=20
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
> index d89c0e0..78dbe58 100644
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
>  	if (!can_assume(SANE)) {
> =20
> @@ -101,7 +108,7 @@ int fdt_check_header(const void *fdt)
> =20
>  	if (!can_assume(SANE)) {
>  		/* Bounds check structure block */
> -		if (fdt_version(fdt) < 17) {
> +		if (!can_assume(LATEST) && fdt_version(fdt) < 17) {

I wonder if we should make fdt_version() return 17 unconditionally in
the can_assume() case, which might make some of these tests redundant.

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
> index 5615bff..13b63c3 100644
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
> @@ -308,7 +308,7 @@ const char *fdt_get_name(const void *fdt, int nodeoff=
set, int *len)
> =20
>  	nameptr =3D nh->name;
> =20
> -	if (fdt_version(fdt) < 0x10) {
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
>  		/*
>  		 * For old FDT versions, match the naming conventions of V16:
>  		 * give only the leaf name (after all /). The actual tree
> @@ -381,7 +381,7 @@ const struct fdt_property *fdt_get_property_by_offset=
(const void *fdt,
>  	/* Prior to version 16, properties may need realignment
>  	 * and this API does not work. fdt_getprop_*() will, however. */
> =20
> -	if (fdt_version(fdt) < 0x10) {
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
>  		if (lenp)
>  			*lenp =3D -FDT_ERR_BADVERSION;
>  		return NULL;
> @@ -428,7 +428,7 @@ const struct fdt_property *fdt_get_property_namelen(c=
onst void *fdt,
>  {
>  	/* Prior to version 16, properties may need realignment
>  	 * and this API does not work. fdt_getprop_*() will, however. */
> -	if (fdt_version(fdt) < 0x10) {
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
>  		if (lenp)
>  			*lenp =3D -FDT_ERR_BADVERSION;
>  		return NULL;
> @@ -459,8 +459,8 @@ const void *fdt_getprop_namelen(const void *fdt, int =
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
> @@ -492,8 +492,8 @@ const void *fdt_getprop_by_offset(const void *fdt, in=
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
> index fe61e63..4ff7942 100644
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
> @@ -427,7 +427,7 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
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

--mPTHnM80CEnHQ2WJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4v8rUACgkQbDjKyiDZ
s5KmQRAAnk/jvXqDskfQsnuEbAnH1Lp+Wo+cO/YwCEiDDegGZtnjK1ZpUqONw4/W
HeETjPP3iDUTqRKswu04cNKouLd5lgFJHiJRWmR1g3pTv/Z4MIEerYsplXB/SO33
I1TnMJfopykUDRDVqSgoVcOB/TLNM1K8HOJWHAfzf75etDsMvd579VSmLtDcOngk
SGlgQB2nhQ2k0wvyIPVslLufSCTfXZHEohPyIeSM9so/k0dTUCmTz1/Bn0iDQWy3
0fgx7BcAFc5L0F3d2x0EEDaj/ElqLsOTBUWJitDkpcbHxHlRCkeAh2bLyNrIl4z4
PPT8a+ZPcrKcIKFnTbef6X2hKnCCSVfOEVb13vfPB6AoQXICfEPqNlQXPPRqS4RT
9M0bEu+LQVl6t/fBe2mK28Mj/FjzfUabW1LJXwtP/4t89BLbqDDqFlNXC3gQmRUx
76mK7X44CQ1X75T7k94vXjziYFpQq2yr5wtvZIZfy4xIRvEJl5uAl3OtK/vutpok
9R/sfNXDOj8dPJ3YxFCSvKU8RqJY836kAYsGhIgiQD6Eu0TGxBdbrzBVoHRDKkDN
dwal4gqZSHI+6fyLCDAosvTY3U495THaH7W40Z4WAbS1lbRhm6JrqmGDGA8fo/yl
VQLd9EvnzGykDi5IF6L1rQeZChfscqfqMk1urFpf4Tp+zX8vaug=
=34VC
-----END PGP SIGNATURE-----

--mPTHnM80CEnHQ2WJ--
