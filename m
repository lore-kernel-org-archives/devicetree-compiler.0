From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 4/7] libfdt: Add support for disabling sanity checks
Date: Tue, 11 Feb 2020 12:12:31 +1100
Message-ID: <20200211011231.GI22584@umbus.fritz.box>
References: <20200206054034.162732-1-sjg@chromium.org>
 <20200206054034.162732-5-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tSiBuZsJmMXpnp7T"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581383557;
        bh=JYUK+zIR3YZ8YxGgxO3EBIxytvsAc1LyUikYoBBwB54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UO6lFtwb4N4wxk+cDLDGgEX9UJohaFczbEYQQZVLevY8biNf9fTWWkTDe3++CCTth
         Lthno/tXW4ci1tP878Xb3OT+8iZt2XjZE9+UHlD3aCjETHqPew5+WKZ1rW42X/9vwk
         desJb+N6e+5c68UoFLw0RhJ8W62zF7GYasSdXAXY=
Content-Disposition: inline
In-Reply-To: <20200206054034.162732-5-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--tSiBuZsJmMXpnp7T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 10:40:31PM -0700, Simon Glass wrote:
> Allow enabling ASSUME_VALID_INPUT to disable sanity checks on the device
> tree and the parameters to libfdt. This assumption covers that cases where
> the problem could be with either.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v5:
> - Include just VALID_INPUT checks in this patch
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/fdt.c    | 12 +++++----
>  libfdt/fdt_ro.c | 71 ++++++++++++++++++++++++++++++++-----------------
>  2 files changed, 54 insertions(+), 29 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 03f2b7d..e2c1da0 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -126,10 +126,11 @@ const void *fdt_offset_ptr(const void *fdt, int off=
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
> @@ -185,7 +186,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  		return FDT_END;
>  	}
> =20
> -	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> +	if (!can_assume(VALID_INPUT) &&
> +	    !fdt_offset_ptr(fdt, startoffset, offset - startoffset))
>  		return FDT_END; /* premature end */
> =20
>  	*nextoffset =3D FDT_TAGALIGN(offset);
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index b41083f..07c13c9 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -16,7 +16,7 @@ static int fdt_nodename_eq_(const void *fdt, int offset,
>  	int olen;
>  	const char *p =3D fdt_get_name(fdt, offset, &olen);
> =20
> -	if (!p || olen < len)
> +	if (!p || (!can_assume(VALID_INPUT) && olen < len))

Oof, this one's subtle.  We certainly *can* have olen < len even in
perfectly valid cases.  However, if we're assuming validly \0
terminated strings in the strings block *and* no \0s in s (which you
can with assume(VALID_INPUT)), then the memcmp() will necessarily pick
up that case.

If we also assume memcmp() is the obvious byte-by-byte implementation
then it will stop before accessing beyond the end of the strings block
string.  But... I don't think that's necessarily the case for all C
libraries / runtimes.  So, if this is close to the end of the strings
block, the memcmp() could access beyond the dtb buffer, which is a no
no.

Now, I guess we could have an assume(DUMB_MEMCMP) and/or
assume(READ_ACCESS_SLIGHTLY_BEYOND_THE_DTB_WILL_WORK), but we're
getting really esoteric now.

Is avoiding this one comparison worth it?

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
> @@ -292,8 +304,9 @@ const char *fdt_get_name(const void *fdt, int nodeoff=
set, int *len)
>  	if (!can_assume(VALID_DTB)) {
>  		if ((err =3D fdt_ro_probe_(fdt)) < 0)
>  			goto fail;
> -		if ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> -			goto fail;
> +		if (can_assume(VALID_INPUT) &&

That should be !can_assume, no?

> +		    (err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> +		goto fail;
>  	}
> =20
>  	nameptr =3D nh->name;
> @@ -349,7 +362,8 @@ static const struct fdt_property *fdt_get_property_by=
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
> @@ -391,7 +405,8 @@ static const struct fdt_property *fdt_get_property_na=
melen_(const void *fdt,
>  	     (offset =3D fdt_next_property_offset(fdt, offset))) {
>  		const struct fdt_property *prop;
> =20
> -		if (!(prop =3D fdt_get_property_by_offset_(fdt, offset, lenp))) {
> +		prop =3D fdt_get_property_by_offset_(fdt, offset, lenp);
> +		if (!can_assume(VALID_INPUT) && !prop) {
>  			offset =3D -FDT_ERR_INTERNAL;

So, arguably you could put this one under a weaker assumption flag.
Basicaly FDT_ERR_INTERNAL errors should *never* happen, even with bad
input - they're basically assert()s, except I didn't want to rely on
the runtime things that assert() needs.

>  			break;
>  		}
> @@ -464,14 +479,19 @@ const void *fdt_getprop_by_offset(const void *fdt, =
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
> @@ -601,10 +621,12 @@ int fdt_supernode_atdepth_offset(const void *fdt, i=
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
> @@ -616,7 +638,8 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
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

--tSiBuZsJmMXpnp7T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5B/3wACgkQbDjKyiDZ
s5KljhAAmkTi3Iux6Q/AuePFjYn2/axPYly/KKfJozircCJxS0ybhd1ryfNX8tpS
glEbz3HJ3H9H8GeVek0k8P8453hMRNN4mK1m7cKzJG7qLsnsdPi/bDIdgdTHddoV
+Z/ONxrJtllVyo2qkS6pCXmCGlp2od8A5hPGpqN9nIqyEixifaaXJpr5b/rhWqC5
l4pSsZUnmaknbAeEMg1BC2XaI5M3gHEtm7aFpf80GM1DvC9IbjBufub35e4yKU2+
y0OQXmikQLDi0xzkIN2doiHMeFDYdAwjOE1BhR8mqOjp8YyfIyEyhn3u8uu2dXR8
JVJyE1/iJrgtxaIvYqV8iRFHQCnn9ZGZaODgGOBMseFuK3UQx+JneHntMWDTfnHw
aKTmfX5J0/o2YfIvIQtdmgrNBKUh41HYx1kqHjq3p58AY8YQZdTfFsTlvOFZiS+C
zVFLuP13Wan3Kc3b1kN9jSlLbBMh+sJ5xXLqBCbTPXRIFkQp5J/06tzg2+VYd4Ro
WyWcL+flxkJkDdulQN7FKvHUWO+ax4iFO/YfYs7noHHLuFGZ+fQM/NrMcnwoDOjs
OeesPjJtQLxVKCnEvUw1Mpee3q1rpsnTxtDEJ4+gXPEhMcc9tLJx4k2PL9w31ZEZ
/cko1W1f1hMko7psuDPsophNg+x6O8u2l559wuv6pCbHt02EugU=
=4RJI
-----END PGP SIGNATURE-----

--tSiBuZsJmMXpnp7T--
