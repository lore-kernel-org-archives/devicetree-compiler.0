From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] libfdt: add fdt_get_property_by_offset_w helper
Date: Wed, 12 Oct 2022 10:50:35 +1100
Message-ID: <Y0YBS2ZHi+0CkC74@yekko>
References: <20221011182611.116011-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6vrp95zySBfgfFHe"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1665534887;
        bh=5qiFPb0ZdgPUUBtoM7q18YW94Av2FjJ2bOKKiFXn1IA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mbzEC7d4qAhnuCupEHAMJZ3YYV4Y1ZkKC+q4ADiklGuTlFqWyWKEoCc/mA4Yz0qOi
         UUiAHF9RHraiS9q01S5OLA+4DcEcA/UihQ2mKUfFNg2CEZv0SStQWSoelI0cCTGvm8
         GV2Yw16GIO055yKq11eWiuxYL+CmE/OrA2jkAh0c=
Content-Disposition: inline
In-Reply-To: <20221011182611.116011-1-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--6vrp95zySBfgfFHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 11:26:10AM -0700, Tadeusz Struk wrote:
> Add a new fdt_get_property_by_offset_w helper function.
> It is a wrapper on fdt_get_property_by_offset that returns
> a writable pointer to a property at a given offset.
>=20
> Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
> v2: Remove const from the first param (fdt).
> ---
>  libfdt/libfdt.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index a7f432c..d0a2ed2 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -660,6 +660,13 @@ int fdt_next_property_offset(const void *fdt, int of=
fset);
>  const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
>  						      int offset,
>  						      int *lenp);
> +static inline struct fdt_property *fdt_get_property_by_offset_w(void *fd=
t,
> +								int offset,
> +								int *lenp)
> +{
> +	return (struct fdt_property *)(uintptr_t)
> +		fdt_get_property_by_offset(fdt, offset, lenp);
> +}
> =20
>  /**
>   * fdt_get_property_namelen - find a property based on substring

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6vrp95zySBfgfFHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmNGAS8ACgkQgypY4gEw
YSKcSRAA0yuMxsM7haWae3xgz8NWNGLjIGFrT2VwKMH+bVvbAU/fGWm3YVKIVWIf
novaqjTKnbiCGcMKsZA5TGVAs50sSb8thzrydwLX051NXFvadFDRWASXWD6hZvgY
u9Wl4FUc/s5JS3tyVwb+/rBL+kZrv1bHbxsJvwAGYE9AhT2/AGDOi2A2bJ9pIIoH
vKCVmK/zgfbjW0NSUXm6+YHIaI7yGzmreMj6iJKvih4xBKR2n08r4uoR53h4SjlJ
AocwbrR7T9DcOxGTcUC0+d/zWE9cfmqyoR+BaaNQoSZ+3nZQbXJOBiN7UUP2RVFJ
f9aDv8Qx3sYRZp99C+O+BtwvSCd4jcajjIAjGWwVJi6CiXuF+x4aA6hFUrRY4A38
wrWrCmN873WiuSzaGoZuJiOce/F47+V3lm80zBdyLMOHJL+GDjjCNyAz0Y8NTLlR
5WnqCiO2iKhhqIIezumlDJu2hhypUou+dwo6Kyh/tlI3BusE5m4Rv8a+Y5oVtO4s
rx26sPHtjBZmSxg22xoJG2B4V9oViMEymfuv+tekdt5Fk4+nLYCZTLDxHMj/xXVc
Lede+nY/xS9UYNTP4Oi0LS7Lx33LPtfzfTtxBlPHTBnlSOoaGgNM1Xozal5VAzjl
fU3ODstYKGuYtopL3I35JGklWyiKGcGV45W0EftXLU2hKn8xflo=
=iJ5/
-----END PGP SIGNATURE-----

--6vrp95zySBfgfFHe--
