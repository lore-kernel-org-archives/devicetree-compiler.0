From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 11/14] libfdt: overlay: Fix comparison warning
Date: Fri, 25 Sep 2020 14:05:59 +1000
Message-ID: <20200925040559.GW2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-12-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i/VKSWANvDZSIhsB"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601007890;
        bh=ifrEvxE6GFXkYdSKo4y1HFYIrtr+gDd1fXhccrNXfP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BzQDyGXfhJowXuTdUmheXNErW7sLvvthZPCj6ejwwbWlTWyAdjbMOWVeeroTtw9d4
         QJj4eud/QF2rxHPca+PqGOgmd/YXlLi1ucgVlTapYOAIts7SCAUTefq0aUq70xAvi5
         do2yH51Rzyo6LDcCYDtbHoGwPEaprOGvOhJNJwQk=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-12-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--i/VKSWANvDZSIhsB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:53:00PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> a comparison in overlay_update_local_node_references().
>=20
> This happens because the division of a signed int by an unsigned int
> promotes the dividend to unsigned first (ANSI C standard 6.1.3.8).
>=20
> As in this case we basically just divide by 4, we can do the division
> separately earlier, which preserves the original type.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_overlay.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index b310e49..d217e79 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -241,6 +241,7 @@ static int overlay_update_local_node_references(void =
*fdto,
> =20
>  		if (fixup_len % sizeof(uint32_t))
>  			return -FDT_ERR_BADOVERLAY;
> +		fixup_len /=3D sizeof(uint32_t);
> =20
>  		tree_val =3D fdt_getprop(fdto, tree_node, name, &tree_len);
>  		if (!tree_val) {
> @@ -250,7 +251,7 @@ static int overlay_update_local_node_references(void =
*fdto,
>  			return tree_len;
>  		}
> =20
> -		for (i =3D 0; i < (fixup_len / sizeof(uint32_t)); i++) {
> +		for (i =3D 0; i < fixup_len; i++) {
>  			fdt32_t adj_val;
>  			uint32_t poffset;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--i/VKSWANvDZSIhsB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9tbKUACgkQbDjKyiDZ
s5KCrRAA4hUcci0H+NZhiiJr5HJya27DwWVwVkdB6xryvJwk8EK46GVdIikhawLs
aI8y/HuqB7Eyi7p3Zo9c80lOLcaUT0FmmlGT4saOwU6UO3ENuoH/jYJBJG4mwEa4
i7o7tOIp1hMjt4k9F8M2hU7VQ34lWOO1QAq2tmv1u1oiX9Lw8PqkiguBPxWCTHM7
t1d2KVcs+2XFbMbKO9eDevPMWKBOPeUuG7FzS1R5pSlH5WWS953I4mQrx8o5jyie
iY1jLGRzHjz1z2Fg6XmEruGBmcMNE+GMuWjqDuMSgjjGJKyaX+PjKRGef0RI0NhR
yMnrf0VWlS/GNQSNi2Vkadr1OyV70enuRbVcXlE5eV5ezEZKVZDXAalnavnH4Xvw
/jDiGUQhHEe/RxW1DdAI8IKEa5VutqQmmhz1lQzHB0QoWCr+F+AStaoA5u7e2NsX
F/FCdtkVJXVeNB5yCmL6KINX9PgxwvWpsk4w9Rvm9sDf0UAj3ZP1FZfHcOPWE6Nq
pwXs+bd8sfAlEOZp9ws3qn/UK76dlqqxFmRSw2dQPRMcnmQldx7lYthZt6ja7cfV
tmiNTj9rWS6EVaM66rOqNWdOcBPwbOfMS6enAmRgMD0D/xdK6Bq9H9Mtp1X5vduA
VrKk8mQmMue9PysLGQ62im0KN3oaqxXiDDHrWHbj+6J6WF+MtzI=
=Cks0
-----END PGP SIGNATURE-----

--i/VKSWANvDZSIhsB--
