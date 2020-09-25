From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 13/14] libfdt: fdt_node_offset_by_phandle(): Fix
 comparison warning
Date: Fri, 25 Sep 2020 14:09:47 +1000
Message-ID: <20200925040947.GY2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-14-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oWEYV0WmY9Kcrzh0"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601007890;
        bh=S4K0qhwFARdENIx87sf8e0B9STGbscG3UsqrwoFnles=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lsqQ+FWB1LCzpj07z39rldSZhawRFkpWrgXuJQa69dHc9wZhfp1l+IJbNjq77JRsp
         TRctlGJ/yOoZGKuYK3BOA04QgYIFeQMJXZm17jp8cRtQN4oyBdX5dG8l8uDmsFnkSH
         zt8k4bMDJDLNYNuJ0wdJhcpvw1WCGFkWgDe28ygY=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-14-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--oWEYV0WmY9Kcrzh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:53:02PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_node_offset_by_phandle().
>=20
> Uses a better suited bitwise NOT operator to denote the special value of
> -1, which automatically results in an unsigned type.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_ro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 059d302..44ad7ec 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -680,7 +680,7 @@ int fdt_node_offset_by_phandle(const void *fdt, uint3=
2_t phandle)
>  {
>  	int offset;
> =20
> -	if ((phandle =3D=3D 0) || (phandle =3D=3D -1))
> +	if ((phandle =3D=3D 0) || (phandle =3D=3D ~0U))
>  		return -FDT_ERR_BADPHANDLE;
> =20
>  	FDT_RO_PROBE(fdt);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oWEYV0WmY9Kcrzh0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9tbYsACgkQbDjKyiDZ
s5I36xAAxlZ5ju1OhwHPGGHTaOh12DXG+T86Tly5oCjjMY4fCKII5+mtagosOJb9
RYdtsCerKbf1n0ExUCWXFa65aLiTMJy4Zjp+9xgEVyvw3qqrO5QYclVSJ2/gIdjn
RN0wOvxN7VeYNDMGYYwHOvCsgUxgmKBNVJ5AkhcnXE/lQb7Oy5J/fTf17rjFxBOM
ExIRTO026RuYoKbqsjj0NvO+2nsR4aGak3lYtzWDY77nCHzNnuS/Hz09LrfCNySS
cX9xTy0MtzJwnltwHb1Ti1qtqLV/TWol9yBIbdMi7v4hZ/BfvdBTZOIjVOEGdZEC
V00gmgj/bQkisZv+24WV4m/O6VPw0Sr8U6Dhhbb0hmJx7sL80OT4ZgwlY7Vs33TF
3vTT2dndxawAPSTaeus2B6oS3brFPol34fQJUMMsbadCPG6MMFC5N6Ln38AyRepQ
rWqwnqgokSclxT6LzwGr2v53tj92CpgnJJjH0et09AcsUE2jGOX9MeaydyYqgia4
/YqyNujuUjvzAjeEyF89qAC1ON6LtBrCh5a+grXF1mS9vqfidGZSky8PydhCHsnI
Sh3tXqx3oESRGE4Pm0Wuugd4X3D9YIoDqRihEwnpwmXGFZQTG88Z6k1xiUsMBUec
uNSrhpYDQoLXkdzQpiBbV8kM4shwxdTZHxl4wRQ7NQtAsy5guPg=
=KONz
-----END PGP SIGNATURE-----

--oWEYV0WmY9Kcrzh0--
