From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/5] fdtget: Fix signedness comparisons warnings
Date: Mon, 21 Jun 2021 15:27:51 +1000
Message-ID: <YNAjV/BQI9mNYKxT@yekko>
References: <20210618172030.9684-1-andre.przywara@arm.com>
 <20210618172030.9684-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n5613o6CXK6gm/9H"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1624253931;
        bh=Jty+2In3/oWCLZMmPvrX86dlq3FfSIMS9oGTeVHmztA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O9HpB5dhXr2Pl8UoyAJ4uuLWMpIKAqEQSb4k/y8KIW1gpscVntInroaK2FHsVwWxA
         uCriWN7uBQHufqTBBpoW5y8bWn1tI8GbdW4tvgfunL/6G6EtH0CvufE9ETFbUssa2D
         ylzolHZU1DPQ+bQfycK3lqDJMK651UGTfWkVSxvg=
Content-Disposition: inline
In-Reply-To: <20210618172030.9684-3-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--n5613o6CXK6gm/9H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 06:20:27PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> the different legs of the conditional operator, in fdtget.c.
>=20
> In the questionable expression, we are constructing a 16-bit value out of
> two unsigned 8-bit values, however are relying on the compiler's
> automatic expansion of the uint8_t to a larger type, to survive the left
> shift. This larger type happens to be an "int", so this part of the
> expression becomes signed.
>=20
> Fix this by explicitly blowing up the uint8_t to a larger *unsigned* type,
> before doing the left shift. And while we are at it, convert the hardly
> readable conditional operator usage into a sane switch/case expression.
>=20
> This fixes "make fdtget", when compiled with -Wsign-compare.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  fdtget.c        | 10 ++++++++--
>  libfdt/libfdt.h |  7 +++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/fdtget.c b/fdtget.c
> index 777582e..54fc6a0 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -62,8 +62,14 @@ static int show_cell_list(struct display_info *disp, c=
onst char *data, int len,
>  	for (i =3D 0; i < len; i +=3D size, p +=3D size) {
>  		if (i)
>  			printf(" ");
> -		value =3D size =3D=3D 4 ? fdt32_ld((const fdt32_t *)p) :
> -			size =3D=3D 2 ? (*p << 8) | p[1] : *p;
> +		switch (size) {
> +		case 4: value =3D fdt32_ld((const fdt32_t *)p); break;
> +		case 2: value =3D fdt16_ld((const fdt16_t *)p); break;
> +		case 1:
> +		default:
> +			value =3D *p;
> +			break;
> +		}
>  		printf(fmt, value);
>  	}
> =20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 73467f7..7f117e8 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -131,6 +131,13 @@ uint32_t fdt_next_tag(const void *fdt, int offset, i=
nt *nextoffset);
>   * to work even with unaligned pointers on platforms (such as ARMv5) tha=
t don't
>   * like unaligned loads and stores.
>   */
> +static inline uint16_t fdt16_ld(const fdt16_t *p)
> +{
> +	const uint8_t *bp =3D (const uint8_t *)p;
> +
> +	return ((uint16_t)bp[0] << 8) | bp[1];
> +}
> +
>  static inline uint32_t fdt32_ld(const fdt32_t *p)
>  {
>  	const uint8_t *bp =3D (const uint8_t *)p;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--n5613o6CXK6gm/9H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDQI1YACgkQbDjKyiDZ
s5LpRhAAn0S+FNONxOrOYE9+x1zxpB3hutDLshLKEhtYOGokjrU+hWWaaHI+toIz
nmDLczpT4iBTgYNlhyDBSnQkEXF8IHznBG9M3lC8bMXUs2dZLV9V8xXRFUn/TCf2
+lA+6qk4kd1s1v/LONvBBCzoD8YAdsqpxz+y4hRtRJaGmyyfX3qPSfh3yNCTvgqa
3+yEKF7ZOaPRy889SzjsofZtqOnrWejKxV9ECecrWCrDafTtT83p95wmcwK+4g6N
G1UDcGmfG9XHxlDBEYAKoHdA9fwdgIKmZast9hKnEP0U664J+BAbYRkRyx8pkErv
2q3ujmNLb200q364wgTv4H0HGQ8YxGe+OCxhRVmRyJem/QqHFIKj7XFMzynVoxiu
5pksG3mrjA1Uw6yC1gFYpr3HZTezyMBjjhSN9xX8f1bldcOXy8uNw0X4OOJ3OPLd
5twOCaqjb9jw5sigBHei8v/t60sd9I54BOsxSqLqX2hpKuT+xiFh2e/MOg00YlXo
ZsfiZOlHOSXj8n48qV3ZElC7U+QLUqvK3X0HrOLczcqxyYj/hCDCBym3LjrIlppY
UIeRVre2XGnDiQYsOfdJvd9oW/Ibm45YflTkMOl+j5WnX5TUiVY7eZYu6R3ns098
E9FtBsY3oDBXrjX6C0z1e9xGZfZ3yNvB9huzaLmq2ukYhneN6sc=
=Fo3M
-----END PGP SIGNATURE-----

--n5613o6CXK6gm/9H--
