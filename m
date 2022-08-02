From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdt_get_phandle: Return invalid phandles as 0
Date: Tue, 2 Aug 2022 16:47:19 +1000
Message-ID: <YujId/uczDRrdJ9v@yekko>
References: <20220801123134.1499236-1-ptosi@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gKI/hM/NBagLvlBn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1659438481;
        bh=qij40XYCRm2zmBI1qFDHWGHsMCHW7qKH9ggcLmXsZGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ovkfNzSKHQBlmk7ducAwXBdJ+WC7Xoyb8Z8KmtykmLWZxGCXezYi7gCt6hQ6gIQQy
         43GxyFDaVXLXwZNmIj1ryKb7LHk0K/abzw9lMNS77Ym81NLY8NX1n5REAzesBN2O7S
         rXE+1pqfFVG50oRlt/5kjcpGlRUHy31gJB/jurPs=
Content-Disposition: inline
In-Reply-To: <20220801123134.1499236-1-ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--gKI/hM/NBagLvlBn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 01, 2022 at 01:31:34PM +0100, Pierre-Cl=E9ment Tosi wrote:
> If a tree contains an invalid <u32> value as its <phandle> property,
> mask it with '0' (invalid value) instead of returning it from
> fdt_get_phandle().
>=20
> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Hm.. I don't really see the point of this.  Because FDT_MAX_PHANDLE is
0xfffffffe (-2), the only effect this has is to change 0xffffffff (-1)
into 0 when returned.  Both are, indeed, invalid phandles, but they're
sometimes used to mean slightly different things in incomplete trees,
so it seems more useful to return these separately

> ---
>  libfdt/fdt_ro.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 9f6c551..7d1da6d 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -507,6 +507,7 @@ const void *fdt_getprop(const void *fdt, int nodeoffs=
et,
> =20
>  uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
>  {
> +	uint32_t phandle;
>  	const fdt32_t *php;
>  	int len;
> =20
> @@ -519,7 +520,11 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeof=
fset)
>  			return 0;
>  	}
> =20
> -	return fdt32_ld_(php);
> +	phandle =3D fdt32_ld_(php);
> +	if (phandle > (uint32_t)FDT_MAX_PHANDLE)
> +		phandle =3D 0;
> +
> +	return phandle;
>  }
> =20
>  const char *fdt_get_alias_namelen(const void *fdt,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gKI/hM/NBagLvlBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLoyG8ACgkQgypY4gEw
YSLCkhAArVp3hKjP0B01JA1yjWieWjaO0vy75RI4QiapabcT2g0HEO7Jju32YhUd
w5APIA9Y6x64Omj6MDlKkGFd+qHC8djwvNgTXmnuUI7tUG0TrKEmnEnR25HvfLQY
3aBdyoK5HwCqOqsOv+pof6LJOvtkGJpurf7hSp1pwKtJ/OsIXcCyeR49hqB7+lrc
krHJCiag2kmyJhVuwtsp2L3rj1ciBtaUArJUJBtXHOhFrB92d74muPQr9UM55RsC
bb+Mv4DmxSuYXGDWBWe0yyOMJl+ZNGM7P/d4XCiArm5DHhL1SvvUkV6nWP4EvMyE
sIe4NkOz80Bn3QGpkTj8RiIZF+D0DjBfo2rSPvynLPl5j8+xbTw7KUUm7uPFYFFU
6r4a2DTcZVd5nutcdJsYmDlD6K+myLfoYspJdK+QDeHVdzeiQy7cRjJKbq2+IZO0
NZTDfHaQMklWmxa5TVsxhqRGlBoFKzSAcAAPKuB/RqVw7QdQd8b7gvsXx6lB3UW7
ZsyCHtcIIQlFM/g+/LFOZK0oeWbdJOrgvqUiq2dN5EKnuGv2Ot6fU84IaVwt4GOK
WnDxsseBPA/W27SFbUuLfqaK+e9R9Sc5wEKZhF+kpoFNFCTSP4dOtSeZF9O5mtBn
drUndQ2enrUpqlUU/WlUj6RTGL3Ihzh89ifDiuhBTNgmJnCslIc=
=1I3h
-----END PGP SIGNATURE-----

--gKI/hM/NBagLvlBn--
