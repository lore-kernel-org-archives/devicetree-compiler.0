From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 7/8] libfdt: Add support for disabling ordering
 check/fixup
Date: Wed, 12 Feb 2020 15:57:59 +1100
Message-ID: <20200212045759.GV22584@umbus.fritz.box>
References: <20200211200945.46606-1-sjg@chromium.org>
 <20200211200945.46606-8-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4nn+A2p41ba1mxGd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581483488;
        bh=2DkDU8rck519bNGAd/WRX7zLGo89PM3OBXzIVebDG4w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E+BNIuL0rZ+/jbAaoSHsZ+AXLeW42oBeeAco4OjjEinrTT2+4fk88xbYFQU491UG8
         jz6oOYK5YCjMQ3y+TR8PTnRg0dG9/T3yVYrHUt1Nslpnn9yFUluPGG8F50RRN48mn9
         mb2iN6wap++KZh03k2icVLb2YNbdMAg5pR0Q2+Tc=
Content-Disposition: inline
In-Reply-To: <20200211200945.46606-8-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--4nn+A2p41ba1mxGd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 01:09:44PM -0700, Simon Glass wrote:
> Add a way to remove this check and the reordering code, which is
> unnecessary if the dtb is known to be correctly ordered.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

=2E. except for not liking the name.

> ---
>=20
> Changes in v6:
> - Add a new patch to disable the ordering check and fixup
>=20
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/fdt_rw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index fe13671..0d9d1b2 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -435,7 +435,8 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
>  			return struct_size;
>  	}
> =20
> -	if (!fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
> +	if (can_assume(CORRECT_ORDER) |
> +	    !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
>  		/* no further work necessary */
>  		err =3D fdt_move(fdt, buf, bufsize);
>  		if (err)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4nn+A2p41ba1mxGd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5DhdcACgkQbDjKyiDZ
s5LEIBAAlPnYOTyn5piYWCPvR0Is+H4a/ch+xLU83NbvV4+2I0UJbbD4Zhu4vgyw
CSUiH6Ms3zY/fRRD97Zl5TvkzzDLoUtOhAaPkpKQvMcFethZWa3Ds+uTniaNNbLH
b4aSx+AZOJa+Svq+9VbPncqdZtrNCwfYtaEHaNGvR6qEsPfvFoZW2UQMgG7z5Igw
KESvJhZyeA9UG4/D19Kv+VOHfusITffQGcEsBV0m2mQAumPbbjEPEq0i5GhgbdMb
vd0GQyFgRft2FjFnZeS5psx7rex0FN0Zg82W7Gie7UWoxyVwXM0D8TfBpB8pXu2x
6KPNk70/W9s1mQ8LlHeMHb8U6NOroZpSGEfVhfPOLymiJ4YlljdBP8anqoWWLqda
a7MS45f/+WNYP2zporH+OfxJEy7MiNgN6wK+ZTjw7ORHcMdKGlVXhUXoNvsDNpjw
vCrrJoitbBWUYry33Y4g4244ljPDNiYGENWJ0h1AM4ed6GtItLZbKvCKRcXa3s9O
IuwWFBWSiKEmbPpo3GhO92afwOmFP19RMHNqquZp4XxWYGYah4mRPauCTczHF63p
UNOUz+qu+v9KK3Dxcs6R5y/Fh52ROlYYXJc2ZQTK7a8TGESp6WofBXvQW8MIiVZV
4dGjlLInX+3FIuciQcNjXfZ1LeyT4DJGhGBzC01LSdNoNER3lk8=
=+tPQ
-----END PGP SIGNATURE-----

--4nn+A2p41ba1mxGd--
