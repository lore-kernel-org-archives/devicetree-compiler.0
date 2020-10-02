From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 5/6] libfdt: fdt_get_string(): Fix sequential write
 comparison warnings
Date: Fri, 2 Oct 2020 10:33:13 +1000
Message-ID: <20201002003313.GF1844@yekko.fritz.box>
References: <20201001164630.4980-1-andre.przywara@arm.com>
 <20201001164630.4980-6-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iBwuxWUsK/REspAd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601602062;
        bh=abWmy5eMG4TyNtOdQCMp+3crxagxkKxS4YfNwd4B3iw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RNj44Uy6NFm00rfIPbtCSkEk8T1y3DHjY5kEtWLgpU6fdc8aCsjWYF0QyJxVMaN6q
         c9TXZftd8P1vZ+jIEsQGQERQ0RRG25sXPFJ8ULpAHsXEUqssLflFU7bTi7XGsx9sv4
         cC/xDeU2ZbRF/POSUa8O29ezsnNPJcW41aifsRgY=
Content-Disposition: inline
In-Reply-To: <20201001164630.4980-6-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--iBwuxWUsK/REspAd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:46:29PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> comparisons in fdt_get_string().
>=20
> Introduce a new usigned variable, which holds the actual (negated)
> stroffset value, so we avoid negating all the other variables and have
> proper types everywhere.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_ro.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index e192184..91cc6fe 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -67,11 +67,13 @@ const char *fdt_get_string(const void *fdt, int strof=
fset, int *lenp)
>  				len =3D fdt_size_dt_strings(fdt) - stroffset;
>  		}
>  	} else if (fdt_magic(fdt) =3D=3D FDT_SW_MAGIC) {
> -		if ((stroffset >=3D 0)
> -		    || (stroffset < -fdt_size_dt_strings(fdt)))
> +		unsigned int sw_stroffset =3D -stroffset;
> +
> +		if ((stroffset >=3D 0) ||
> +		    (sw_stroffset > fdt_size_dt_strings(fdt)))
>  			goto fail;
> -		if ((-stroffset) < len)
> -			len =3D -stroffset;
> +		if (sw_stroffset < len)
> +			len =3D sw_stroffset;
>  	} else {
>  		err =3D -FDT_ERR_INTERNAL;
>  		goto fail;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iBwuxWUsK/REspAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92dUkACgkQbDjKyiDZ
s5KF1A//XbjhfFtgxBiQqhls0O+8Mns3BEfK1N4FgB5XPs4Jkh6bEsMGQ+6boinH
npyZHU1KlsijFPaVpkHL3pfVZ5h8o0fXiwS4zcmEoFW+P3jaT7+nj1IoUOl7qsDK
yjDqwVITLWpQeXSVvxyJmbwKCaPO0ixf0CsxlPh25Hf39OhuJ47Bb/pNZDjNdnsE
Os1XbiMmSkXTZxD/hMWKNiuXHC0XG6LBtnA8L9Agtg6MiLTitS/ck7Y0XclTYBPo
2NVTe694gSkZ1goPF+h9EkaPZQ16r+4cEzJnVER+OYwM0prQElrVQoaGcSHvfClz
o6KzS17aQ0XkDAoQElcnbTsu6wFGKmwIKz2gJZc3/xan9wY1NYoyPeV8Jqkn0/uv
a+sK/jZrDuXD+T/H11Y9dXd/iAd41Jhx0arSvb2dAEwyEasHnXzFnsF1A7PHQaUc
qaQi3hVCi+hHqfrCJ4ZrVBEGDkzBA7AueF3OSEbsGN9wGVEXEZpiGZ+6peWhpoeu
Fgl/Ggz5Hw1JMPHnUR1093k/lfU+ODidFzMYaxJnUFLV6l/wjc8FRY9JGu3zfrkY
m5uhj8VDVHKIQkzcJ8Nn0TCFW2Sivvz0IGJ3MJqBfFTUL5ZLL3c4rLaVCyRaKWQl
72f+uABS26g9NYhiXfkCFveUnvyYG/85bEVcostIPC6ykho5zaM=
=pyi+
-----END PGP SIGNATURE-----

--iBwuxWUsK/REspAd--
