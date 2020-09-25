From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 14/14] libfdt: fdt_strerror(): Fix comparison warning
Date: Fri, 25 Sep 2020 14:12:08 +1000
Message-ID: <20200925041208.GZ2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-15-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rYRijwbmzeJBcrGE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601007890;
        bh=wtwpggR/3hqZ2FNUKbJIPnCI1g/ojc1Sn0MaVHIk81E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C+Ur2uL8Zeqjd/CRKp+YiI5MGPumSO5Q07kSV0ZYOn2L1HoPITuQd5/U512x4PHhY
         dJA5Wt+AH4BsV3AOiNWmk7VEx+YZD3FzQrMX8T1jHv4cPT4yZOVeqD0Z9g8Zq7ol95
         bEYfh05jS9j+Bk0oqwULQvG8+5JML7xwjJ3zGnj0=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-15-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--rYRijwbmzeJBcrGE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:53:03PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_strerror().
>=20
> At this point we are sure that errval is negative, and since
> FDT_ERRTABSIZE is surely positive, we can do some casting to make the
> compiler happy.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Since error values are typically conveyed as negative numbers (which
is kind of the whole reason we have all these signed values in the
first place), I think it would be slightly nicer to actually fold the
case to signed into the definition of FDT_ERRTABSIZE.

> ---
>  libfdt/fdt_strerror.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
> index 768db66..efce51d 100644
> --- a/libfdt/fdt_strerror.c
> +++ b/libfdt/fdt_strerror.c
> @@ -48,7 +48,7 @@ const char *fdt_strerror(int errval)
>  		return "<valid offset/length>";
>  	else if (errval =3D=3D 0)
>  		return "<no error>";
> -	else if (errval > -FDT_ERRTABSIZE) {
> +	else if (errval > -(int)FDT_ERRTABSIZE) {
>  		const char *s =3D fdt_errtable[-errval].str;
> =20
>  		if (s)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rYRijwbmzeJBcrGE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9tbhgACgkQbDjKyiDZ
s5IScA/+LRxyuX8tkL2ApU67XSpVVMtO2ROWbxzcAB43RVNG/vItSWZxBD1nm5Vz
pyDCDXgmdaZIsas01onxf9jN9iWfIWdAJoDgbsNWsnGCCzJJ8yPpCndAGIYwDGJA
coidkoWpcg9SMnhhYC4A2qLsKT95vR5KmqfYLdXOKRU4H7BH3QXZutYK0/J7xVHT
5li+54o2KbsXgeSR6JEcFscBQPbE79BcKDpJ7yyQxHw5Toic7cJpnSmBXG1LOeF2
ruIJe1ELEg79xBg3UrjDoQZaeKZB5C4mQyHjeFXcqdxnF77tz4UwcSB/LIFyIP0h
M2oFiSmg1yLKtjsxzHFNztvluPA7H5cpMQKJrhDDJYruAMkggaO5edlp6gjDSM1I
XcsSC98dNKOxrQcj7bHpRu7sevCOKfqhJMwJJFzDCkAs/26Jr37+Xfk3NojT0NXv
peAhpXSeaPcyTGWrU9H8fGmbrKTOur/r3oFZFkJd1MukaBY9SHE1nL+AuKLOJIcI
OfTV1gjHWnZfhrUfuCc0TQx/WQ9B7dCTRCUTt2Tq8CMh9mR4pFzQb44+RxDaxmLc
8AxDipRi+FBCDtp/hJ/89J+s1FJy/R/MsfFN63aIfdpVLpbK2+MTfvK0qzg4wtZH
vHsmKx2zDQgn4ZtxEz0y/8mzqDuES2UWDMc980Y/Q6ceGPIPw50=
=EUxU
-----END PGP SIGNATURE-----

--rYRijwbmzeJBcrGE--
