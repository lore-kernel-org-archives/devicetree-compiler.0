From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/7] pylibfdt: Enable installation of Python module
Date: Mon, 3 Apr 2017 14:43:18 -0400
Message-ID: <20170403184318.GZ24205@vapier>
References: <20170326190623.27518-1-sjg@chromium.org>
 <20170326190623.27518-6-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aSkGYfF7HpsxURxE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170326190623.27518-6-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--aSkGYfF7HpsxURxE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 26 Mar 2017 13:06, Simon Glass wrote:
> --- a/README
> +++ b/README
> @@ -50,6 +50,13 @@ If you add new features, please check code coverage:
>      # Open 'htmlcov/index.html' in your browser
> =20
> =20
> +To install the library use:
> +
> +    make install_pylibfdt SETUP_PREFIX=3D/path/to/install_dir

seems like you should just tell people to run `./setup.py` like normal ?
then you don't have to invent all this project-specific wrappers.
-mike

--aSkGYfF7HpsxURxE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAljil8YACgkQQWM7n+g3
9YEgOhAA1IKVTjssOoWjxlHm2vXZ7+e63dgbu01OxHp6V0+8g9BwvdEEMucLEKw5
fFh5ycf+M6D85Yp4dj72OLtBTUayAvEYxpaQTSJfnrH+wj3BUcYkGboaxH40FYvA
4vIrpzGjPPZuqmXNhu0USiW+QoGa3orxBdBbPYlXUsdCUFlWgb8zY+fmStmWSqsP
8Atzp/cUQRCNUlPqKeL09+31CZt4XPWQVsynDRkSsXvIgIKhmBRJBLoxEcdyARX9
yLA87M4krEnG1/LGcuRc0CH3YVWaToFdyH38onaEWVmZTp0iTTOBVem2zRVUyC1v
FdjF/028gv5GXLKrTnBybtztktq0LU7LeyKqFWt6A35x+W3PoFWNu/WGSixbNcCn
eiZUMZhJXOdAdupO48hDfh7goXOQ/98U2A0CIxTQ9/8hAqgvV/EXyvYP1qD1dONj
z8Te8FjLoERkDYs76UuT7f12dAEX4f1pQvrjfQg6PKSkgRLQ4rJf8zSwxhgHUgMP
foLeUORtoFRJE9+5Ht01EVXUgBaFO1DsNkHgJH90VRwI4ARNwoFHwsBEyJNdRoBe
KOf+CmDrM0HXoiYJ/yOKF6eHGoa4jpjMWsbI2Y5v44ptQUOOyj0l5bhjgZ+V6bvG
81MPHWxG+jpXKDihKRvNQGQhAnXZ/W3OekfYx4Q2LUJAV/1DUVQ=
=v3kU
-----END PGP SIGNATURE-----

--aSkGYfF7HpsxURxE--
