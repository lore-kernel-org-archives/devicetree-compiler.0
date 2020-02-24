From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 7/8] libfdt: Add support for disabling ordering
 check/fixup
Date: Mon, 24 Feb 2020 16:58:45 +1100
Message-ID: <20200224055845.GK1751@umbus.fritz.box>
References: <20200220214557.176528-1-sjg@chromium.org>
 <20200220214557.176528-8-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x0KprKst+ZOYEj2z"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1582526632;
        bh=eE0hFOx3kbKpGHC/8qPT8BSWJpe0Hq2vUjkzrMLZ7Wc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UJP1W8lWDG4rSnADi/EBqf205HSJRXD1YJCGt58Mba9TcYszDvaskt7aT4PG34Zjj
         O91rZjnm4SgxyUe84+eEvqbnhl3fcUxcpBa3jS8pbjE8/NiUeFr6SVMNcE4TxrmcYY
         3w94LcxJWsFgRAh2prUFaSVTl8KBPLlVauCj962M=
Content-Disposition: inline
In-Reply-To: <20200220214557.176528-8-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--x0KprKst+ZOYEj2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 02:45:56PM -0700, Simon Glass wrote:
> Add a way to remove this check and the reordering code, which is
> unnecessary if the dtb is known to be correctly ordered.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Uh.. patch is fine, but I don't recall reviewing this.  Suggested-by
might be accurate.

> ---
>=20
> Changes in v7:
> - Use ASSUME_LIBFDT_ORDER for the ordering flag
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
> index fe13671..1385425 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -435,7 +435,8 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
>  			return struct_size;
>  	}
> =20
> -	if (!fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
> +	if (can_assume(LIBFDT_ORDER) |
> +	    !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
>  		/* no further work necessary */
>  		err =3D fdt_move(fdt, buf, bufsize);
>  		if (err)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--x0KprKst+ZOYEj2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5TZhUACgkQbDjKyiDZ
s5LROg//dxMHSJbH+G9p68fxzAvhBSDRoYTOqP5B/GXGFqVKhlzkpUuqe3bW2FqW
VvrnERQBDc8jAb6JlixeLDZ1/h9eJvrWfJECpcpkxI0fQAI96+FHPUwU8CKFXQh1
xZ0XoPaxPfACavZTcgD+hhYvvzKsPcMbcM53v93QK3Ao9vhvdPUH8c4t0WdC/JNg
DRL2XNTFMG0azVy0ft+NBDtCDGEK85saaGCOz8qVan1si4ZCk16GDT7kbRlxQKf/
Csi1KELtMfkbhyCN22V/xfD+bs5dmIVSYZ+Q2WrWb1HTruDRPNCTTQGXkbPUXbM8
2pjh4wNxRnqIhWP74SDkYHa3c7DHt7aUuum7vFfCeU7j3ScFCSmThSQkZLtAt+at
3dEw9JHC2H8oBWf0+JPaVqQNs+PiN7QRHeP/LFerfuJu4ZRW5jDcpcdfNmUJSykr
7MtjypWamfzSAnKwjZjzSaYtM+kiK4CYr8+wqaAyBTD1WVPZ1JLSQb6gnnf+c8JS
ima3421LzQd/ZlZpLxazgrMt3RFj5FyuPLpi16Ru+OXa0VrtSEURDaUGF+KlwXgg
/22j/ZXMnv7hz4ieE+ADmPVYBnWKRBJ9hqM9HFqvfTJyb0aR7M78IDb0gUWdhjWQ
VBXdaW5h6xwDW1849rx7G/Lh/6e2oirL6iynvl3524xhuIYQLsI=
=J5qE
-----END PGP SIGNATURE-----

--x0KprKst+ZOYEj2z--
