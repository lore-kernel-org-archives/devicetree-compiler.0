From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] overlay: ensure that existing phandles are not
 overwritten
Date: Fri, 28 Apr 2023 20:09:06 +0200
Message-ID: <20230428180906.vb4i7447u4uvuhpn@pengutronix.de>
References: <20230426100231.484497-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="furniemusdfu3ccb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20230426100231.484497-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--furniemusdfu3ccb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 26, 2023 at 12:02:31PM +0200, Uwe Kleine-K=F6nig wrote:
> -static int overlay_adjust_node_phandles(void *fdto, int node,
> -					uint32_t delta)
> +static int overlay_adjust_node_phandles(void *fdto, int nodeo,
> +					uint32_t delta, void *fdtbase, int basenode, uint32_t *phandlemap)
>  {
> -	int child;
> +	int childo;
>  	int ret;
> +	const fdt32_t *phandlebase;
> +	int phandlebaselen;
> =20
> -	ret =3D overlay_phandle_add_offset(fdto, node, "phandle", delta);
> -	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> -		return ret;
> +	/*
> +	 * If the base fdt has a phandle already reuse the value to not break
> +	 * references that already exist in the base fdt.
> +	 */
> +	if (fdtbase) {
> +		phandlebase =3D fdt_getprop(fdtbase, basenode, "phandle", &phandlebase=
len);
> +		if (!phandlebase && phandlebaselen !=3D -FDT_ERR_NOTFOUND)
> +			return phandlebaselen;
> +		if (!phandlebase) {
> +			phandlebase =3D fdt_getprop(fdtbase, basenode, "linux,phandle", &phan=
dlebaselen);
> +			if (!phandlebase && phandlebaselen !=3D -FDT_ERR_NOTFOUND)
> +				return phandlebaselen;
> +		}
> +		if (phandlebase && phandlebaselen !=3D sizeof(*phandlebase))
> +			return -FDT_ERR_BADPHANDLE;
> +	}
> =20
> -	ret =3D overlay_phandle_add_offset(fdto, node, "linux,phandle", delta);
> -	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> -		return ret;
> +	if (fdtbase && phandlebase) {
> +		ret =3D overlay_phandle_set(fdto, nodeo, "phandle", fdt32_to_cpu(*phan=
dlebase), phandlemap);

Compiling that on Ubuntu stable emits a warning here that phandlebase
might be uninitialized (see
https://github.com/ukleinek/dtc/actions/runs/4831386302/jobs/8608771064).

While looking into that, I think the code is correct, but can be
simplified by using fdt_get_phandle() instead of open coding it. I'll
rework the code and test a bit more. So please don't apply this version
of the patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--furniemusdfu3ccb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRMC8EACgkQj4D7WH0S
/k5JAAgAhEifgLN5xNLucD46oqG+MxiUnqW5WU28z9QD3zT4cRAjnJ5fqM4P0BZz
2xwM8HzZaWQDWiqEsqh4XkQCEWHgJBAvR9yCtOXeBeRcp/iy+TmogBg5l1ru4A+w
WG0ITElZPa1ixuvnmiYmOXNJYvQ+++IBkAbUS0f23o5VK1SxXnTEzkbDIAtYTB2i
3pnG3F4pdGhUPy3V7x3DpToWIzAUMaMDioSmKLifWqbBvNncqDj8RIs610FzVeEU
JbOw4//4Tr4QXULjAakjL8K9W7AD7DnHE80ntSJU3iuPj3H+C1Vk+SBL3RH2b72M
YZHmHGV8U+1tdbDDLhNxjJ3Oaegryg==
=zQLl
-----END PGP SIGNATURE-----

--furniemusdfu3ccb--
