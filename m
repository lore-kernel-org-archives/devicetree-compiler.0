From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 09/14] libfdt: fdt_resize(): Fix comparison warning
Date: Thu, 24 Sep 2020 14:43:13 +1000
Message-ID: <20200924044313.GO2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-10-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="da9oBGf5DLtF9ehv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600923032;
        bh=NyE9FM0sIfYBF8e8BsN0dqt4rGZ+XO7QGrsfLFfyRYk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DHiir/sTMpcl1pAF7QI4EGnzG+/brg8uloNQwR/Q5H9B7NAhN1Zv0hC8e1+wyAp13
         qIX332wFX8atqwu9HEsBDzzgYaD9nErFjgBk/KTt/5Bi64e+nf7FOzUZj6l5vVN1EG
         GAcYkBGhije5gbRMv1v3hswcfn5JP/im9OaW0+Tc=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-10-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--da9oBGf5DLtF9ehv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:58PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_resize().
>=20
> A negative buffer size will surely do us no good, so let's rule this
> case out first.
> In the actual comparison we then know that a cast to an unsigned type is
> safe.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_sw.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 8a76adf..4c62922 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -152,6 +152,9 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
> =20
>  	FDT_SW_PROBE(fdt);
> =20
> +	if (bufsize < 0)
> +		return -FDT_ERR_NOSPACE;
> +
>  	headsize =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
>  	tailsize =3D fdt_size_dt_strings(fdt);
> =20
> @@ -159,7 +162,7 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
>  	    headsize + tailsize > fdt_totalsize(fdt))
>  		return -FDT_ERR_INTERNAL;
> =20
> -	if ((headsize + tailsize) > bufsize)
> +	if ((headsize + tailsize) > (unsigned)bufsize)
>  		return -FDT_ERR_NOSPACE;
> =20
>  	oldtail =3D (char *)fdt + fdt_totalsize(fdt) - tailsize;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--da9oBGf5DLtF9ehv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9sI+EACgkQbDjKyiDZ
s5LIXw/+KPwxD01w5kk51RKUbHcE9tGz+rb+Rfd0Pxa135ZhOjkjbIWO77AvMlbF
w1G0q10C7Y0R8TkByVA033lv0xWT8YckgpvNYYUbNfrAKYMk7WevN6KF6h5wsaIT
qINwINxol5mSoczHxc12bzfkEEkV+pucroxUoXA+ZECb2HZls8pwDcEhDQ+E/RrU
eu1zPRe3P68pT8ECC4PqzId87UWwgNXvQwc/XffzK02LwRgjcXd/wdS7zP5guxGa
VMHzcTLvjSKCkptZAkzkrnpky2oCLFF+WIWh+e08qMY+iX+bf7UpI6r0uSwSka7h
qdHbDOiSUCYD65BEsYuuAwAj+tuB3VxWIx1eHR6Lvpbr3pw4ViZChbBul77w0SkP
4W9ncXhjJXiD0/x3+XjP5c5OLcfXI4wl1IL/Mfmye7OAPyWBSE7Xo4CUuuZjpo4F
ij9mTeOq/1tiqdUlYkA5DH4Qrx3swpGA6TRTC3Nrr4PwGM0q6ZgwAmUf+huiUxWM
HbCDfa5QyGFAi3g4it8VpthShBunM1/u6WVM9KiuMT70XZZNLQ4bHkoXIREkafZP
jPu+n3FcybqaOAg9qhY77F3cOmMgDX0xXW5QkZn1m/jkXJ2W+/Rb+KVjfA2w5cjW
hjPW6z2WpUiHpYwTnB5M9hOVswQcEqCYrFHsLZ4ZV8Eix8ug/Oo=
=mbLD
-----END PGP SIGNATURE-----

--da9oBGf5DLtF9ehv--
