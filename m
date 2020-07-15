From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/6] dtc: Avoid UB when shifting
Date: Wed, 15 Jul 2020 20:41:38 +1000
Message-ID: <20200715104138.GJ93134@umbus.fritz.box>
References: <20200714154542.18064-1-andrei.ziureaev@arm.com>
 <20200714154542.18064-2-andrei.ziureaev@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zYjDATHXTWnytHRU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1594812363;
        bh=OKVbyjIWacStnTfXc3BkM9srz2VvUwh4k5uP+dnLGwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=heNyOUMgwd6vwzXK/+kXh5GArfSWjsTPXOrQQR+fDJtD5Bq9D/5ED5Sam6DzjgwCV
         tE6/LJbIRew9ZExtKSedBUqVJvE6Eo+ndXCnlRqwbYHGChpp70Xn+6GPID8sB627x0
         8zf57TAprxM+ut5gnexNgWwDzmpJBNvwR3UqBrw0=
Content-Disposition: inline
In-Reply-To: <20200714154542.18064-2-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--zYjDATHXTWnytHRU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 04:45:37PM +0100, Andrei Ziureaev wrote:
> Prevent undefined behavior when shifting by a number that's bigger than
> or equal to the width of the first operand.
>=20
> Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>

This one makes sense independent of the rest.  Applied.

> ---
>  dtc-parser.y | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 40dcf4f..a0316a3 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -476,8 +476,8 @@ integer_rela:
>  	;
> =20
>  integer_shift:
> -	  integer_shift DT_LSHIFT integer_add { $$ =3D $1 << $3; }
> -	| integer_shift DT_RSHIFT integer_add { $$ =3D $1 >> $3; }
> +	  integer_shift DT_LSHIFT integer_add { $$ =3D ($3 < 64) ? ($1 << $3) :=
 0; }
> +	| integer_shift DT_RSHIFT integer_add { $$ =3D ($3 < 64) ? ($1 >> $3) :=
 0; }
>  	| integer_add
>  	;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zYjDATHXTWnytHRU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8O3WIACgkQbDjKyiDZ
s5Kvjw//dkK5U+wKoYSsijdYYe5Jwt2M2GewkM53iwwQeeU55/B9jxbqDt6RPwIR
+2JVYAF6TMgYesIbd1EqEJAakka7zhfG/LYN8f0Dcvm67x3pUz/IT81DEtpB4VkY
eYkKVglSea/mT/KcB+Koc6+/pJeJDzKe5H0FuhZbSmrQmAJDS5IBCkNE/9C8pyDw
/cxIrfxbmjXpGR9SypOGVF0V/CY8/yr8AfoSE0qAPdwETbd7kV7QrOV4myXZEMsf
xvAhAflOGBBHJXLrTLw1QaYLWXDZHM/H0FRAGASK4klyh80RNJIwuoDD0IorVAPN
3ENWSAb2O+/52Eiz9gKLmX7ozMHiXocHH3t5SdMokZDaab00OMvV4NbrcTR3D+Hq
9n8yEyGiX6W4qWH0oLTqQEvcpsZ+mUbe3qpYt4UK0GEIOf/Wczh3h+Zl3MNZy87n
Mdt81UVZqMQ8wev2nmM7nM2SeX5I9FMZcm3sP9TKn91aNGFN8fbhqayw1IRkM6EL
RpuGGyDxy5IamfhyvJ2j/WlwgPLak2U5EmN6tJq3D0MXFOHjdYvpsi+wCpqkMXoJ
SnogBi4REfXMYFGZGv4ynnn9hZzs9IdBYJ/Dh5+MTlSd7x1a7BvX2AL+HdlpuN1b
3wWJOwhLcZ5eNNLmfMDQGtbVTKUE1W6bw3icPSErQOqCP/9oDIY=
=q4X9
-----END PGP SIGNATURE-----

--zYjDATHXTWnytHRU--
