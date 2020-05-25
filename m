From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove superfluous NUL character from overlay
 symbols
Date: Mon, 25 May 2020 15:15:55 +1000
Message-ID: <20200525051555.GE23110@umbus.fritz.box>
References: <20200523151239.8849-1-marcus@mc.pp.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1590383765;
        bh=BQHNf7KyrUCvlGogWX5QD8JHJ4JaqoYyNkVjcgXSmaE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GkhDImyyeRjwcs4Y+qfvWZ9AeeRx/IOZH+wkLFQOivAbWvANBDMbpSTfqRuK0Fbfg
         iBBME/sOXgGVdNfKbNVBPZ8wMYT7D4ZyGasDvZlMlfRdZjSc6cWGOQfxrNKctQU88n
         M6NN1J9jVocYfAKMWdJdZosAQfgf/YuzTrKsF7gw=
Content-Disposition: inline
In-Reply-To: <20200523151239.8849-1-marcus-S4ne242Fi5M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Marcus Comstedt <marcus-S4ne242Fi5M@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2020 at 05:12:39PM +0200, Marcus Comstedt wrote:
> The symbol path already ends with a NUL character (something which is
> actually checked by the code) and this NUL is included in
> rel_path_len, so there is no need to add a second one.
>=20
> This change fixes incorrect display in the U-Boot command
> "fdt list /__symbols__" after applying an overlay with symbols.
>=20
> Signed-off-by: Marcus Comstedt <marcus-S4ne242Fi5M@public.gmane.org>

This patch causes "make check" failures.

> ---
>  libfdt/fdt_overlay.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index b310e49..16d5aa0 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -757,7 +757,7 @@ static int overlay_symbol_update(void *fdt, void *fdt=
o)
>  			   && (memcmp(s, "/__overlay__", len - 1) =3D=3D 0)) {
>  			/* /<fragment-name>/__overlay__ */
>  			rel_path =3D "";
> -			rel_path_len =3D 0;
> +			rel_path_len =3D 1; /* Include NUL character */
>  		} else {
>  			/* Symbol refers to something that won't end
>  			 * up in the target tree */
> @@ -794,7 +794,7 @@ static int overlay_symbol_update(void *fdt, void *fdt=
o)
>  		}
> =20
>  		ret =3D fdt_setprop_placeholder(fdt, root_sym, name,
> -				len + (len > 1) + rel_path_len + 1, &p);
> +				len + (len > 1) + rel_path_len, &p);
>  		if (ret < 0)
>  			return ret;
> =20
> @@ -820,7 +820,6 @@ static int overlay_symbol_update(void *fdt, void *fdt=
o)
> =20
>  		buf[len] =3D '/';
>  		memcpy(buf + len + 1, rel_path, rel_path_len);
> -		buf[len + 1 + rel_path_len] =3D '\0';
>  	}
> =20
>  	return 0;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7LVIsACgkQbDjKyiDZ
s5IwRQ/+LnThCd6vvsWAsOSwAvU+CJTWZYxZWUzYJbmX+IIblovGsAotGK+crbG6
+aflybe6eqgpHhNe4D5EuSUGq2E611hPkJtwK/20iU7KARWRYTjYDAm+yV3BqGRj
Rdf+aoRcVWU2x2gEYjtAg6r5dicplkkTt0DawZyEHnfN4MxRIf7Uh2PVrgRsHnXV
62Lj2So1lniKrAXjhNdft92/c8h8hfzdI5r2X4XDvCl23plWndYduy8YDDfL79+v
uvozj77ccHwvYVIT/MZOWQU6l85sDe7MyNTbo8bLMLjq5OJBVq4vYcb9NfIsqI0N
Y68kYqDuWZc0QsH3mDcEEU0hrDoyLZ+im17RtwhLWM1H0ced9XxfsCAXmK0vju5N
cbT2RPR0YQTQFcdhvU1itRTSJiz33/fBz/vnyHz0t8CVrp0C+KnFutO5wauynmtJ
Ig1d4yQu5WPcsk6ZKRqzZAdTpiRa5Yjc565I6IIjMV+tW+2lj+ZvQ2d1Qm5u9bDK
cCg8m09En9FMf14M05iA1Zq7N7f812VCaTN8Syqx+PtooKgScivC6Q0XcZfusyFB
V/9y0jLpPq120bjDDFk5zCHE32n+aldxAx/WIpjG/Kzysq+mjUzVAXo2qRSHX77e
GysNbE4g6fbo2un6nYw9GRrRyL8a5iP16srLSD0kz4EGmX7CXqk=
=f/6a
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--
