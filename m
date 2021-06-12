From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] libfdt: Check for invalid memreserve block
Date: Sat, 12 Jun 2021 12:25:29 +1000
Message-ID: <YMQbGbZVxdB/5xDo@yekko>
References: <20210611115823.31583-1-andre.przywara@arm.com>
 <20210611115823.31583-2-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PD6uOZ14+eI+eCI9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623470335;
        bh=fvrxdT5yOvUE/2Z8fvkHQkjuzSJ05F9meMLsx/G3vV8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LrwEV8RD9JLtq+l69ZTNV15ZNlF6K/qcElHHoblqT1blk8n936oQhYNPn+T/DvVD5
         INX365AtQouLzaemQdwU8nqDQGOxZRvWBRIxVducZ+Uk9B3khDy/8mJetr1+yIU1lY
         wrv73edkQ/sur2+CE9RZgInpald7agkDrtl0/xqE=
Content-Disposition: inline
In-Reply-To: <20210611115823.31583-2-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--PD6uOZ14+eI+eCI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 12:58:20PM +0100, Andre Przywara wrote:
> fdt_num_mem_rsv() can return a negative error value, when the memreserve
> block is not properly terminated or is exceeding its advertised size,
> This can happen on malformed DTBs, and FDT_RO_PROBE() does not cover this.
>=20
> Check the return value of fdt_num_mem_rsv() first for an error
> condition, and also check if the total size of the memreserve block
> would provoke a signed integer overflow.
>=20
> This fixes issues with malformed DT blobs, where we would end up with
> negative offsets into buffers.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  libfdt/fdt_rw.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 3621d36..a0f03d0 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -427,8 +427,13 @@ int fdt_open_into(const void *fdt, void *buf, int bu=
fsize)
> =20
>  	FDT_RO_PROBE(fdt);
> =20
> -	mem_rsv_size =3D (fdt_num_mem_rsv(fdt)+1)
> -		* sizeof(struct fdt_reserve_entry);
> +	mem_rsv_size =3D fdt_num_mem_rsv(fdt);
> +	if (mem_rsv_size < 0)

You want a can_assume(VALID_DTB) on this test as well.  The people
doing fdt on miniscule first stage roms really hate every extra
instruction.

> +		return mem_rsv_size;
> +
> +	mem_rsv_size =3D (mem_rsv_size + 1) * sizeof(struct fdt_reserve_entry);
> +	if (!can_assume(VALID_DTB) && mem_rsv_size < 0)
> +		return -FDT_ERR_NOSPACE;

This second test is not necessary.  fdt_num_mem_rsv() implicitly
checks for a minimally sane mem reserve block, which implies its size
lies within totalsize, which in turn is <=3D INT_MAX.

If it were necessary, I don't think it's quite safe, because signed
overflow is UB, IIUC.

>  	if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
>  		struct_size =3D fdt_size_dt_struct(fdt);
> @@ -490,8 +495,14 @@ int fdt_pack(void *fdt)
> =20
>  	FDT_RW_PROBE(fdt);
> =20
> -	mem_rsv_size =3D (fdt_num_mem_rsv(fdt)+1)
> -		* sizeof(struct fdt_reserve_entry);
> +	mem_rsv_size =3D fdt_num_mem_rsv(fdt);
> +	if (mem_rsv_size < 0)
> +		return mem_rsv_size;
> +
> +	mem_rsv_size =3D (mem_rsv_size + 1) * sizeof(struct fdt_reserve_entry);
> +	if (!can_assume(VALID_DTB) && mem_rsv_size < 0)
> +		return -FDT_ERR_NOSPACE;

Same comments here.

>  	fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
>  			fdt_size_dt_strings(fdt));
>  	fdt_set_totalsize(fdt, fdt_data_size_(fdt));

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PD6uOZ14+eI+eCI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDEGxYACgkQbDjKyiDZ
s5Ijbg//Y+p2CTnMtV5iM9DSMybe2JhqfpVPmucKoS/AucjGtbmUmvhj3afddQvD
SY4BCljn/DfPb/omDwWZMJsHuNp0Vfo39a74NyWxyK12oLEcAU0YlBN2ilv/NZK0
PJxmwmfOZ28NzaDo3CRNOmjoaeGq4/viHWnFXgvIoKn91shO8uXYJsYUhmPrgQym
Zd7yUyO7/Xg0ocSLUtlIgQRHd66hF/yCkFO9SvPYcgIwofhmtUH9SDjgt1KrLvei
UvV5gtnlKYiGd8MWKgOC1YN6KcgeCF3iNkyMwh0dJ+ASzViVaP7HNL/caL7+HVG5
+i4EuO6VvRkCUNBGcDlAZoJ6qQBObNpqu1jDoqDpTtZcPbsbU0Q0SAU166N78LK8
MuphLqXoa1F0pAMHeIbetzVoXEiL7jYMiCdr/JmlfEOEOQMwN9R7p6cqlAI+bUcs
dQ+kzdkP6eO8W8Wxs56Ma8lwudgKMPYbrwCKytiuRGb6a+jg+cG/aBiW8yIN7t/U
uKLrqMlWXAvtY9Sk8JwAz8wZpiWeW1a7IAubINSLy5qzrPzu6TBsVCC1K8KdKY75
dM9vark5/ZUdfZ4P1U2vIXWhHTkssaY8hxtTYvdBG1k76cHJT98liCbgruaNp164
Ao6bmUnfNautOr03SPV7RThCXkWaPEG+c0a8HeDYPtuB8VUUPFM=
=F+yz
-----END PGP SIGNATURE-----

--PD6uOZ14+eI+eCI9--
