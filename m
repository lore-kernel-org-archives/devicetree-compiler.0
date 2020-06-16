From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Correct condition for reordering blocks
Date: Tue, 16 Jun 2020 13:13:01 +1000
Message-ID: <20200616031301.GJ5861@umbus.fritz.box>
References: <20200615160033.87328-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W13SgbpmD6bhZUTM"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1592280751;
        bh=MLqbqEO1EQtskjP+TbxK0NpeO3W7aFHL3omYV9ADdQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QJ1KCwdmyUdayNIxkbag6wtMXQB72RSy9MsfKP+cGnMSnzkyAFgQ3QWxRRd54I7D6
         K8zEJ+gqZurJ73tQgSu1gRm2bkl8rJLUS1nQ650LHmMaLNyzc0PxY40mRO3HJYTre3
         TMttBlbMxdAAmy3uS87q7x1QvLZBdicymwOFAesY=
Content-Disposition: inline
In-Reply-To: <20200615160033.87328-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>


--W13SgbpmD6bhZUTM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 10:00:33AM -0600, Simon Glass wrote:
> This condition uses bitwise OR but should be logical OR. Fix it.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reported-by: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Applied, thanks.

> ---
>=20
>  libfdt/fdt_rw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 524b520..93e4a2b 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -436,7 +436,7 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
>  			return struct_size;
>  	}
> =20
> -	if (can_assume(LIBFDT_ORDER) |
> +	if (can_assume(LIBFDT_ORDER) ||
>  	    !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
>  		/* no further work necessary */
>  		err =3D fdt_move(fdt, buf, bufsize);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--W13SgbpmD6bhZUTM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7oOL0ACgkQbDjKyiDZ
s5JzHBAAoGiDPA9Q7nAqPpoyMvi7fnIaRTbKjCUaUzn2H0kmXAyxVvOMnhRpoDkJ
yg1xaDcwEasWp1GdHCy7UZzxkPdj8Vte9ceXzNRC6aXzEkfQzeU5rJ0zCAeqKyLl
TZstEnmO+fRiCitgxME46aYQS+IoHwg8Co8h5GeJ6pU5A4IlxcKcZIgHVI4m6ASW
Wmf0F5RDMbdP6mMrz8/KP5ngfpMF0Paou5SxTbnFfy8QeIP5DoLBaHDhJk/9IU2r
Xuq/RLjJNvwWYB/lkN7X1w79sou6j0IghzxwzDinzUJx5IVWnSeQ/t3fH9IkWE9Q
LVLfB20aBejrvLLYNjas4wX3ExzyDTyt/LFwWWG+P635RcB95F1jp2C1a19yZwUw
Jdhh4FI7MVORGy87Aw2Csn4+B7LtidsK59vK5LbPNc3B94vrpdf1YyA7wq5CpyaI
vOpEzK3o3MgkIg5VBrI3dWmZyhK3N7un8ApmD9rnjLqQGKiYuztWR4o/mPhxWBYr
S992EUMneOT3aEWUldB4sYGgsGV8LQ7Ck5VplMj/tInPCBZ8Uo2DZn+W4c8bUQLV
/88QdDhW3wF7ESggflkajOrQQk3/habMKq+VO6RJ+zvWxPpUmR3bq7XnhD5y7oRW
jkzKHqddswOiXML3Z+znSuzWIGOIK3P0xsW/6B3whYJFThqXpYg=
=MX9a
-----END PGP SIGNATURE-----

--W13SgbpmD6bhZUTM--
