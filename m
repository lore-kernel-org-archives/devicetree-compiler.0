From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 4/8] libfdt: Add support for disabling sanity checks
Date: Wed, 12 Feb 2020 15:57:29 +1100
Message-ID: <20200212045729.GU22584@umbus.fritz.box>
References: <20200211200945.46606-1-sjg@chromium.org>
 <20200211200945.46606-5-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nKvJs6ze6az+4fwY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581483488;
        bh=9NNhaSEUsbuPBYF89DGvVYhdV1TJaq4SUrb/qBy/AMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CyOrx+k6VJzxrUt06Qw+Aq75fWsrnJnJMKmI1qlvuyHoOWTAfUjdcLSEWX5RJeRho
         Fu4FNGkX+DI0E76oVoX7hDuyuob97nqEM4ep3esk5zMgBLiCIffFx55RKVD7+RZJyt
         m9tPeOm6QTXl5Yj8MfQNuRfVZ1HViwf7U5yATuP0=
Content-Disposition: inline
In-Reply-To: <20200211200945.46606-5-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--nKvJs6ze6az+4fwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 01:09:41PM -0700, Simon Glass wrote:
> Allow enabling ASSUME_VALID_INPUT to disable sanity checks on the device
> tree and the parameters to libfdt. This assumption covers that cases where
> the problem could be with either.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v6:
> - Don't add VALID_INPUT to fdt_get_property_namelen_()
> - Drop assumption in fdt_nodename_eq_()
>=20
> Changes in v5:
> - Include just VALID_INPUT checks in this patch
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/fdt.c    | 14 ++++++++----
>  libfdt/fdt_ro.c | 61 +++++++++++++++++++++++++++++++++----------------
>  2 files changed, 50 insertions(+), 25 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index d4daf60..f6600ff 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -129,10 +129,11 @@ const void *fdt_offset_ptr(const void *fdt, int off=
set, unsigned int len)
>  {
>  	unsigned absoffset =3D offset + fdt_off_dt_struct(fdt);
> =20
> -	if ((absoffset < offset)
> -	    || ((absoffset + len) < absoffset)
> -	    || (absoffset + len) > fdt_totalsize(fdt))
> -		return NULL;
> +	if (!can_assume(VALID_INPUT))
> +		if ((absoffset < offset)
> +		    || ((absoffset + len) < absoffset)
> +		    || (absoffset + len) > fdt_totalsize(fdt))
> +			return NULL;
> =20
>  	if (fdt_version(fdt) >=3D 0x11)
>  		if (((offset + len) < offset)
> @@ -188,7 +189,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  		return FDT_END;
>  	}
> =20
> -	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> +	if (!can_assume(VALID_INPUT) &&
> +	    !fdt_offset_ptr(fdt, startoffset, offset - startoffset))

If fdt_offset_ptr() has a can_assume() inside, can't some of these
calls to it avoid the can_assume()?

>  		return FDT_END; /* premature end */
> =20
>  	*nextoffset =3D FDT_TAGALIGN(offset);
> @@ -197,6 +199,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
> =20
>  int fdt_check_node_offset_(const void *fdt, int offset)
>  {
> +	if (can_assume(VALID_INPUT))
> +		return offset;
>  	if ((offset < 0) || (offset % FDT_TAGSIZE)
>  	    || (fdt_next_tag(fdt, offset, &offset) !=3D FDT_BEGIN_NODE))
>  		return -FDT_ERR_BADOFFSET;
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 4c26fbe..9c32559 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
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
> +	if (can_assume(VALID_INPUT)) {
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
> +	if (!can_assume(VALID_INPUT)) {
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
> +	if (!can_assume(VALID_INPUT) && !re)
>  		return -FDT_ERR_BADOFFSET;
> =20
>  	*address =3D fdt64_ld(&re->address);
> @@ -346,7 +358,8 @@ static const struct fdt_property *fdt_get_property_by=
_offset_(const void *fdt,
>  	int err;
>  	const struct fdt_property *prop;
> =20
> -	if ((err =3D fdt_check_prop_offset_(fdt, offset)) < 0) {
> +	if (!can_assume(VALID_INPUT) &&
> +	    (err =3D fdt_check_prop_offset_(fdt, offset)) < 0) {
>  		if (lenp)
>  			*lenp =3D err;
>  		return NULL;
> @@ -462,14 +475,19 @@ const void *fdt_getprop_by_offset(const void *fdt, =
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
> +		if (!can_assume(VALID_INPUT)) {
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
> @@ -599,10 +617,12 @@ int fdt_supernode_atdepth_offset(const void *fdt, i=
nt nodeoffset,
>  		}
>  	}
> =20
> -	if ((offset =3D=3D -FDT_ERR_NOTFOUND) || (offset >=3D 0))
> -		return -FDT_ERR_BADOFFSET;
> -	else if (offset =3D=3D -FDT_ERR_BADOFFSET)
> -		return -FDT_ERR_BADSTRUCTURE;
> +	if (!can_assume(VALID_INPUT)) {
> +		if ((offset =3D=3D -FDT_ERR_NOTFOUND) || (offset >=3D 0))
> +			return -FDT_ERR_BADOFFSET;
> +		else if (offset =3D=3D -FDT_ERR_BADOFFSET)
> +			return -FDT_ERR_BADSTRUCTURE;
> +	}
> =20
>  	return offset; /* error from fdt_next_node() */
>  }
> @@ -614,7 +634,8 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
> =20
>  	err =3D fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
>  	if (err)
> -		return (err < 0) ? err : -FDT_ERR_INTERNAL;
> +		return (can_assume(VALID_INPUT) || err < 0) ? err :
> +			-FDT_ERR_INTERNAL;
>  	return nodedepth;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nKvJs6ze6az+4fwY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5DhbkACgkQbDjKyiDZ
s5IlwxAAil2F8SXCVEJbEYC9PfMSiP3W0l+sMxATVQG1O8YmVXGhIFb2nW8/ZKIN
580hkDnUiAMwU4Pr8qWAUnF15v2ssKWp3aZvEUFpfGU9T3NdE9k2TBbpvuD5gSqx
J4XaoSVlDBEwS7YvGa69t+zZ4amhnC6BTi9LMX6Lt2V9RWaI48ECEv2uuwK9cODc
0daOqFHnD577mFPp1Sp/PLAP8dNGhp4sIABpqCbv6iNP5m1cW0MChwDN6ZZRmbub
Lg8hukUPgYZ0GkASEsRuJ4XdeOs4T0Nsq3C89D9Hj7R/GZBA6C+orpXSc3N6Nutg
dAHU4y5DPwQNMct3OdzTMzyMJXhxeaPFHkM3EJujoR9KhTtnRC5Uc1tlAazy7XoR
kb8a7jNTTrrvTPLP1EIjz5NWHF/cVjtwjgqXlfZdXiEpurIvsRcnJCrZpJYXEF7u
ec6SmBXfd9sQ0Cypen0z9Ax1yC/W5A39gpW7vjyUtlHlH5Yh+5WIYzWqaPvEVyaW
gzPxLRuWLgIzGHVctzFOZC/9GEtqdX5ie7lrL3MV5QKXgItJkBkpQUw0Nn03uTzF
03NCe84NmKylUSCnefZKacaiWEX1zaE4fmx5QxzZogIR/ZVs82UW41/v4Zy3Rt3F
PFj2NBmijtKxn2V7Louzf6Uxst8QaWQ8eTangUGa7dIj58DTVuc=
=kN+I
-----END PGP SIGNATURE-----

--nKvJs6ze6az+4fwY--
