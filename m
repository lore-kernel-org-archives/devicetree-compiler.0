From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/6] libfdt: fdt_add_string_(): Fix comparison warning
Date: Fri, 2 Oct 2020 10:27:33 +1000
Message-ID: <20201002002733.GB1844@yekko.fritz.box>
References: <20201001164630.4980-1-andre.przywara@arm.com>
 <20201001164630.4980-2-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601602062;
        bh=wtS83lnVm1bYZl+irbf+iTKBM/uUalRe8jFNZTJnIHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kG01ydXc1Ld1lMUs9S8E+H0MRhnr1fqRII4v/35msK9gV/kl5GMTzDV7WDmxOfgqt
         5ha1wHuyLQi01StGdNmYKWPVUSiL3YczZr/HCMFL8OPV9SbYPDnKF0XR2VdbldS+xM
         3MacCOKI6DZ0uKwJApW6OjXzHdxEwsiWQ+T9PN8o=
Content-Disposition: inline
In-Reply-To: <20201001164630.4980-2-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:46:25PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_add_string_().
>=20
> Make all variables unsigned, and express the negative offset trick via
> subtractions in the code.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied.  I think there are some followup improvements we could make
here, though.

> ---
>  libfdt/fdt_sw.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 8de18fd..354f466 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -250,18 +250,18 @@ int fdt_end_node(void *fdt)
>  static int fdt_add_string_(void *fdt, const char *s)
>  {
>  	char *strtab =3D (char *)fdt + fdt_totalsize(fdt);
> -	int strtabsize =3D fdt_size_dt_strings(fdt);
> -	int len =3D strlen(s) + 1;
> -	int struct_top, offset;
> +	unsigned int strtabsize =3D fdt_size_dt_strings(fdt);
> +	unsigned int len =3D strlen(s) + 1;

In both the old and new versions, there's an implicit cast from size_t
here, which I think could theoretically overflow (with a colossal
string, 32-bit ints and 64-bit pointers/size_t).  So we probably
should actually check that this is <=3D INT_MAX.

> +	unsigned int struct_top, offset;
> =20
> -	offset =3D -strtabsize - len;
> +	offset =3D strtabsize + len;
>  	struct_top =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
> -	if (fdt_totalsize(fdt) + offset < struct_top)
> +	if (fdt_totalsize(fdt) - offset < struct_top)

Likewise we should check that totalisize - offset doesn't overflow
(underflow?).

>  		return 0; /* no more room :( */
> =20
> -	memcpy(strtab + offset, s, len);
> +	memcpy(strtab - offset, s, len);
>  	fdt_set_size_dt_strings(fdt, strtabsize + len);
> -	return offset;
> +	return -offset;
>  }
> =20
>  /* Must only be used to roll back in case of error */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92c/MACgkQbDjKyiDZ
s5JTWQ/8CVtcgWjsEDoroEmlhYRy3GcFEMKMCECqcf3P14zaCG+PQ0b1skS25ZLG
z7IqbkLOpn/tJ5qVkaS0dE9TOxjW0VxPsbntFEnINu/wKzvmhAf2sMjevCjHWrP/
4DG3+hs2+K6I5BLplAV0PEVPQ3bUS1nr3Q3gMQpyV2y2kuUpAWyKBwR1cGaVG5N9
Gv7UB5I86Wl42gcpGewxg8AyJIf4K6/GHG2VUkus3qbiSiypUo54OMCDRzHzw9M7
aWFHM+m3TyY6Qf7wiQhHXBUyVpqU9G5DmxIXGaRQVND/YcB/fLIWfqjbH9+hGpJv
bh8lBhQVPaZ0BuR8vpz4h6ah13y40LouJfdPrNY24Ahpu538AbjezJGX6UcxcWny
rleYxqY3l9As1HYzEnMZAWGh/KlyeVdGYygYFACHC10Ee+y8oK/qEzRJ3KJbWEfY
eHhIDeZRhMM5kj/fXsf9V9dEHGCN37OALDKoz8p3seQ0ptrtJGsJJfhlfQbrRcFi
fiAe2Us3BNimm3Xe+rzDjutHd6EYD05xAa3+odS90ky6bJxOXjiSJ3itRiZvkCv5
1dMeoF0Gs0tQ0GE152hPxboyzkbcMUNrXtiUdz8tiFcyBOswhyWhJqQXIKfqjguH
XR7U04w2379Ur2T1mkMMQ7hW8RTIo9FJLCRK5daPC3ZemU2QbhM=
=IfG0
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
