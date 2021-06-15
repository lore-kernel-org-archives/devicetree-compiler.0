From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/4] libfdt: Protect buffer size checks against integer
 overflow
Date: Tue, 15 Jun 2021 10:42:43 +1000
Message-ID: <YMf3gyDwNeNQpdTm@yekko>
References: <20210611115823.31583-1-andre.przywara@arm.com>
 <20210611115823.31583-5-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SgLiJPyc3L2W4MIh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623718410;
        bh=rCgeqotVeUyJlTfEG5CZ6kzpqTNYTWVhMg+ruYaN3oo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YtNh+QYm+YNeIMTE6jQHlSr092Njwj1Dig2s5VLOTTd1Tyrz6WRcBGh/433u6/5mO
         73Gjlg4BvjA7FKOS/3UNS6OnKQTbow1QeXuGDBxdEHdnd6wzwCjeqsFuO+Qb6NiTJe
         cyAvIc5jcNYmnOc/TpoceO1Pr6jSWZbszzGklEO0=
Content-Disposition: inline
In-Reply-To: <20210611115823.31583-5-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--SgLiJPyc3L2W4MIh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 12:58:23PM +0100, Andre Przywara wrote:
> In fdt_open_into() and fdt_packblocks_(), and in most other libfdt
> functions for that matter, we use signed values for blob offsets and
> sizes. When adding several signed values together, we should check for
> integer overflows, as several valid sizes in inself can easily exceed
> INT_MAX when summed up.
>=20
> This is particularly important here, as we use the sum to check against
> the maximum buffer size, or use them directly as buffer offsets.
> Any negative values would not end up well.
>=20
> Check for negative values after adding each size value separately. When
> VALID_DTB is defined, the compiler should optimise this to the former
> joint addition, so it should not increase the code size in this case.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  libfdt/fdt_rw.c | 42 +++++++++++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 13 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 062edcc..24aff27 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -393,16 +393,20 @@ int fdt_del_node(void *fdt, int nodeoffset)
>  				  endoffset - nodeoffset, 0);
>  }
> =20
> -static void fdt_packblocks_(const char *old, char *new,
> -			    int mem_rsv_size,
> -			    int struct_size,
> -			    int strings_size)
> +static int fdt_packblocks_(const char *old, char *new,
> +			   int mem_rsv_size,
> +			   int struct_size,
> +			   int strings_size)
>  {
>  	int mem_rsv_off, struct_off, strings_off;
> =20
>  	mem_rsv_off =3D FDT_ALIGN(sizeof(struct fdt_header), 8);
>  	struct_off =3D mem_rsv_off + mem_rsv_size;
> +	if (!can_assume(VALID_DTB) && struct_off < 0)
> +		return -FDT_ERR_NOSPACE;
>  	strings_off =3D struct_off + struct_size;
> +	if (!can_assume(VALID_DTB) && strings_off < 0)
> +		return -FDT_ERR_NOSPACE;

Hmm... I feel like it would be simpler to call fdt_check_header()
before this, which does equivalent (or stronger) checks.

Also, again signed overflow is UB, so this check isn't quite right.

>  	memmove(new + mem_rsv_off, old + fdt_off_mem_rsvmap(old), mem_rsv_size);
>  	fdt_set_off_mem_rsvmap(new, mem_rsv_off);
> @@ -414,6 +418,8 @@ static void fdt_packblocks_(const char *old, char *ne=
w,
>  	memmove(new + strings_off, old + fdt_off_dt_strings(old), strings_size);
>  	fdt_set_off_dt_strings(new, strings_off);
>  	fdt_set_size_dt_strings(new, fdt_size_dt_strings(old));
> +
> +	return 0;
>  }
> =20
>  int fdt_open_into(const void *fdt, void *buf, int bufsize)
> @@ -461,10 +467,16 @@ int fdt_open_into(const void *fdt, void *buf, int b=
ufsize)
>  		return 0;
>  	}
> =20
> -	/* Need to reorder */
> -	newsize =3D FDT_ALIGN(sizeof(struct fdt_header), 8) + mem_rsv_size
> -		+ struct_size + fdt_size_dt_strings(fdt);
> -
> +	/* Need to reorder. Protect against integer overflows. */
> +	newsize =3D mem_rsv_size + struct_size;
> +	if (!can_assume(VALID_DTB) && newsize < 0)
> +		return -FDT_ERR_NOSPACE;
> +	newsize +=3D fdt_size_dt_strings(fdt);
> +	if (!can_assume(VALID_DTB) && newsize < 0)
> +		return -FDT_ERR_NOSPACE;
> +	newsize +=3D FDT_ALIGN(sizeof(struct fdt_header), 8);
> +	if (!can_assume(VALID_DTB) && newsize < 0)
> +		return -FDT_ERR_NOSPACE;
>  	if (bufsize < newsize)
>  		return -FDT_ERR_NOSPACE;
> =20
> @@ -478,8 +490,10 @@ int fdt_open_into(const void *fdt, void *buf, int bu=
fsize)
>  			return -FDT_ERR_NOSPACE;
>  	}
> =20
> -	fdt_packblocks_(fdt, tmp, mem_rsv_size, struct_size,
> -			fdt_size_dt_strings(fdt));
> +	err =3D fdt_packblocks_(fdt, tmp, mem_rsv_size, struct_size,
> +			      fdt_size_dt_strings(fdt));
> +	if (err)
> +		return err;
>  	memmove(buf, tmp, newsize);
> =20
>  	fdt_set_magic(buf, FDT_MAGIC);
> @@ -493,7 +507,7 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
> =20
>  int fdt_pack(void *fdt)
>  {
> -	int mem_rsv_size;
> +	int mem_rsv_size, err;
> =20
>  	FDT_RW_PROBE(fdt);
> =20
> @@ -505,8 +519,10 @@ int fdt_pack(void *fdt)
>  	if (!can_assume(VALID_DTB) && mem_rsv_size < 0)
>  		return -FDT_ERR_NOSPACE;
> =20
> -	fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
> -			fdt_size_dt_strings(fdt));
> +	err =3D fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
> +			      fdt_size_dt_strings(fdt));
> +	if (err)
> +		return err;
>  	fdt_set_totalsize(fdt, fdt_data_size_(fdt));
> =20
>  	return 0;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SgLiJPyc3L2W4MIh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDH94EACgkQbDjKyiDZ
s5IbFxAA5qkKOaPT4TLz6mwKVwdbk+nAKrFdj4iqedQ5buG2jV0FV2iueC0AGW0o
HGSP1lludBSBoLN9XdKNQJu5aFzj+2hzwJBN3VBn8zAiXtQtTaYveAT37G5PQpuO
QD6TSkFb8n2YyBTuTHYjT4SNG6bOU+MZXD+DYDpn/jp4Y3qDBQhHtcQlhK05/+ZB
PFhA0e9leluzA80l5ieDlIO04v8IlRYe3I7IIkQxxJoIwnMYZg/j3vWS1dyqnqT9
QMOtmorpS6kqzA6gghzDlyX6GHBR3G5vXZ7D7ToFtnEYelAaqnKCY3w/ov8JK9KO
l2aXxcPAMtGLKn7C2BPSrNU5BjCjNv+OZx1db55Ma02bGXQPtzIRA0o4JeWCVwRJ
35j3XA0K6qikC66EDkupPlxvjV9H4zStJZbEdyWzzw3u9uWpsQTGCHkIdoNDNKGV
b7O8PTaPETfkgMA9Qpk9OFKiuFraP5wkZAwFEwCyREL71iL8Av/6E5EGcjbAptUT
tC5IhsxyvNV43JRgOz2O5OMihKT51YSQGfNxHnmGZDFmmLn/DY9vA/tbGK7SK5U3
8VC51zzdiJ9/S/ZoaLT8Z1zh8bXUho/qcoP43YscF7ZZo0zhWFOn66p1IOFb+gs0
zd5pNdl7wgRbUxR7f2S90yy3qAeh7AjzHTA6pfLwb7HJQVh37YI=
=eFNo
-----END PGP SIGNATURE-----

--SgLiJPyc3L2W4MIh--
