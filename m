From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Default to assuming aligned reads are OK
Date: Mon, 2 Nov 2020 11:56:07 +1100
Message-ID: <20201102005607.GA143651@yekko.fritz.box>
References: <20201030185658.4655-1-trini@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1604279100;
        bh=Kfelu58mpiEYoRxgIpM1qn14hr0X/zSwCT1NuIiRDvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T+3SDsTzIMqmT8IoIecjeDKqZ0W9ytZQDNx2xZ9+QK8Pi7nleSgw3WWX/TP8333Uk
         Px8Vwhv2wTupXrWi7nCvW4T1OBy+V1bLcAb6vqb3agK3q5OhYoWCHfPejxSVWrxVSk
         UfUlDemUfSgX9ZCUZQt2EMFyUzKnOinE7WPHr7ZA=
Content-Disposition: inline
In-Reply-To: <20201030185658.4655-1-trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 02:56:58PM -0400, Tom Rini wrote:
> Start with commit 6dcb8ba4 "libfdt: Add helpers for accessing unaligned
> words" which introduced changes to support unaligned reads for ARM
> platforms and 11738cf01f15 "libfdt: Don't use memcpy to handle unaligned
> reads on ARM" to improve the performance of these helpers, libfdt has
> defaulted to assuming that unaligned memory access could be a fatal
> problem.
>=20
> Upon further discussion on the mailing list, we leave the improved
> unaligned-safe memory load functions available if needed, but go back to
> using fdt{32,64}_to_cpu() for access as generally platforms handle
> unaligned access safely and there is still a sizable performance and
> size impact of using the always-safe helpers in all cases.

I think the basic change is ok, but there's some details I'd like to
see changed.

First, I'd like to see an alignment check added to fdt_probe_ro_().

>=20
> Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  fdtget.c        |  2 +-
>  libfdt/fdt_ro.c | 20 ++++++++++----------
>  libfdt/libfdt.h |  2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/fdtget.c b/fdtget.c
> index 777582e2d45f..7cee28718cbc 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -62,7 +62,7 @@ static int show_cell_list(struct display_info *disp, co=
nst char *data, int len,
>  	for (i =3D 0; i < len; i +=3D size, p +=3D size) {
>  		if (i)
>  			printf(" ");
> -		value =3D size =3D=3D 4 ? fdt32_ld((const fdt32_t *)p) :
> +		value =3D size =3D=3D 4 ? fdt32_to_cpu(*(const fdt32_t *)p) :

Second, getting rid of these ugly open-coded constructions was an
additional reason I went to using fdt32_ld() everywhere.  So I'd like
to see both an assume-aligned and an unaligned-safe helper, rather
than open-coding the load-and-byteswap everywhere.

>  			size =3D=3D 2 ? (*p << 8) | p[1] : *p;
>  		printf(fmt, value);
>  	}
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 91cc6fefe374..5bc27ac97317 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -181,8 +181,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t =
*address, uint64_t *size)
>  	if (!can_assume(VALID_INPUT) && !re)
>  		return -FDT_ERR_BADOFFSET;
> =20
> -	*address =3D fdt64_ld(&re->address);
> -	*size =3D fdt64_ld(&re->size);
> +	*address =3D fdt64_to_cpu(re->address);
> +	*size =3D fdt64_to_cpu(re->size);
>  	return 0;
>  }
> =20
> @@ -192,7 +192,7 @@ int fdt_num_mem_rsv(const void *fdt)
>  	const struct fdt_reserve_entry *re;
> =20
>  	for (i =3D 0; (re =3D fdt_mem_rsv(fdt, i)) !=3D NULL; i++) {
> -		if (fdt64_ld(&re->size) =3D=3D 0)
> +		if (fdt64_to_cpu(re->size) =3D=3D 0)
>  			return i;
>  	}
>  	return -FDT_ERR_TRUNCATED;
> @@ -370,7 +370,7 @@ static const struct fdt_property *fdt_get_property_by=
_offset_(const void *fdt,
>  	prop =3D fdt_offset_ptr_(fdt, offset);
> =20
>  	if (lenp)
> -		*lenp =3D fdt32_ld(&prop->len);
> +		*lenp =3D fdt32_to_cpu(prop->len);
> =20
>  	return prop;
>  }
> @@ -408,7 +408,7 @@ static const struct fdt_property *fdt_get_property_na=
melen_(const void *fdt,
>  			offset =3D -FDT_ERR_INTERNAL;
>  			break;
>  		}
> -		if (fdt_string_eq_(fdt, fdt32_ld(&prop->nameoff),
> +		if (fdt_string_eq_(fdt, fdt32_to_cpu(prop->nameoff),
>  				   name, namelen)) {
>  			if (poffset)
>  				*poffset =3D offset;
> @@ -461,7 +461,7 @@ const void *fdt_getprop_namelen(const void *fdt, int =
nodeoffset,
> =20
>  	/* Handle realignment */
>  	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
> -	    (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >=3D 8)
> +	    (poffset + sizeof(*prop)) % 8 && fdt32_to_cpu(prop->len) >=3D 8)
>  		return prop->data + 4;
>  	return prop->data;
>  }
> @@ -479,7 +479,7 @@ const void *fdt_getprop_by_offset(const void *fdt, in=
t offset,
>  		int namelen;
> =20
>  		if (!can_assume(VALID_INPUT)) {
> -			name =3D fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
> +			name =3D fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff),
>  					      &namelen);
>  			if (!name) {
>  				if (lenp)
> @@ -488,13 +488,13 @@ const void *fdt_getprop_by_offset(const void *fdt, =
int offset,
>  			}
>  			*namep =3D name;
>  		} else {
> -			*namep =3D fdt_string(fdt, fdt32_ld(&prop->nameoff));
> +			*namep =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
>  		}
>  	}
> =20
>  	/* Handle realignment */
>  	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
> -	    (offset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >=3D 8)
> +	    (offset + sizeof(*prop)) % 8 && fdt32_to_cpu(prop->len) >=3D 8)
>  		return prop->data + 4;
>  	return prop->data;
>  }
> @@ -519,7 +519,7 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoff=
set)
>  			return 0;
>  	}
> =20
> -	return fdt32_ld(php);
> +	return fdt32_to_cpu(*php);
>  }
> =20
>  const char *fdt_get_alias_namelen(const void *fdt,
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 544d3efff584..5004300e7ddc 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -236,7 +236,7 @@ int fdt_next_subnode(const void *fdt, int offset);
>  /* General functions                                                  */
>  /**********************************************************************/
>  #define fdt_get_header(fdt, field) \
> -	(fdt32_ld(&((const struct fdt_header *)(fdt))->field))
> +	(fdt32_to_cpu(((const struct fdt_header *)(fdt))->field))
>  #define fdt_magic(fdt)			(fdt_get_header(fdt, magic))
>  #define fdt_totalsize(fdt)		(fdt_get_header(fdt, totalsize))
>  #define fdt_off_dt_struct(fdt)		(fdt_get_header(fdt, off_dt_struct))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+fWSUACgkQbDjKyiDZ
s5IBcA/8DGJSgwGKjKDN6OiaAp6IlWKnGxAgptX6wYb4I2PaZ4AzK7hk3XvMEKvg
drq4uPwDo2beqji8ouQJz5Zk9uvNqfSXHHFoZWLJE7Vx8uWYrMoJ+NjcJImD+KcI
t6MifhXcV4SkIsdal9GROm/2RxYQa+wZHh/VPqWh7VHE2FqaJLsh+Q4PFsLbLvVr
2ZRN0sOUlwqeAlVGgPBXO3HlchpvQhc0DyhbGNAOJ52F/qg72XHmyfWltyRbRm/Y
ZFE3do16+Qr8oM0wFz0swAnVRhTbRG+bznJ/cXLIAa8TvFvFvRuqs9tKmFIwz9TL
pGfH9+G5NjxkvJagcaTMoya5XjrBapnNCGY2nlC+0Svdi+22an7jKf3qvrEtt9zB
/LSoysPBYpGD9bsOe61Bc/n03m1M5yp8qzPtEBh1hmvxBiC3ivJDHID2ILVB9vBj
INK3wzr7rdtB6uPAbmLE+8M671uH8IOZurh6HoVQVQ8eJfIVSupah4bAOMD0eRr2
zl9UU438VHGZM19LLl3DEF7IfbDl9cr1dNi22U4f/CgjsuxKyktr7SUdQcJKHQCU
tjZdQls4yWQyQvHHIvI5OeWNqQaeitKxc+zYIU+Fr9P0CMN02TpLFGfbeBqFqEI+
CDMqIWyUbuZsP+NR2+CAsO/W8OybfqjvjmazHeIlU5gvjUSlIwM=
=W0nV
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
