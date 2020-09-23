From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 03/14] libfdt: fdt_grab_space_(): Fix comparison warning
Date: Wed, 23 Sep 2020 21:50:58 +1000
Message-ID: <20200923115058.GI2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-4-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YrQNB5Deg1WGKZi3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600862023;
        bh=u873hBeMEmInTeGn3o4pjxlcxa8n80E049r8iMJ+/eA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=npbYzKA9As1LoOd9Y2/KhH0vX0QsfxIRmdIpdsc39rr+B2OpZm9PfR7q/ab6mG1RM
         LupJSSs7vDIWzx55rBaf+svqVCQvBWWbzTKhYBv/hZuQ7BFpNfJcFdLikQO/hyXubf
         tw/qYeGYipKoy23ddTwgbMuq/scM8HyMenZLDl1E=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-4-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--YrQNB5Deg1WGKZi3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:52PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_grab_space_().
>=20
> All the involved values cannot be negative, so let's switch the types of
> the local variables to unsigned to make the compiler happy.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_sw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 94ce4bb..d10a720 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -93,8 +93,8 @@ static inline uint32_t sw_flags(void *fdt)
> =20
>  static void *fdt_grab_space_(void *fdt, size_t len)
>  {
> -	int offset =3D fdt_size_dt_struct(fdt);
> -	int spaceleft;
> +	unsigned int offset =3D fdt_size_dt_struct(fdt);
> +	unsigned int spaceleft;
> =20
>  	spaceleft =3D fdt_totalsize(fdt) - fdt_off_dt_struct(fdt)
>  		- fdt_size_dt_strings(fdt);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YrQNB5Deg1WGKZi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9rNqIACgkQbDjKyiDZ
s5LxiRAAmkgcXrj64ymna1hxYrZHHfQR6QFMcQTZIAlkvu36ZhrfJ2CCV1HPovM8
rbGPJzovi+sYU1CkTuTq0GVPyWEz5Xw+3PJedeWl4alygdnj55OZywafrEd9Gaco
sDkHwXbYQq7G3EmJBPrWkg+Ge301hQVx9uvbKj/YLTU/PFimdueBnAoXzt373WQ2
ExcxCsJCpelihh2otR99eGxefL2ZBl24SLtk94ciQ2G/HrzEQIwGj9fwHt/Sf4XL
Ch95WcvO+yhS4SoGM7nkzGbUKQ75Lpj/gzwOcbck4M55uqOItEtWxQ5EF6ep2R7d
a2yeP3BiU5jdDmqCFMs3ymabP67i+u2hEQgKgnHVWe3I2LNdavK8tI5lxC9BMlci
vEHk410J8uxGvr3KKTVkhFsL1ppw4qOkiHMiXSWrkOOJFX+5btpONIc8Cgv5lTet
PssNk/S178jO88ix/YeM65hg1N4Cz8g5GaPZcvlnSEQl5Y2VIvLKFN9LEo8OUOwi
oFcE2kAno/xZ0qKaz5B4m/J5Icu1RrW3QAJyQeU60+LctI4knBHbksUVdELaEsbb
UPNHWpahw6lgetlfmCoBiDm/h87hiHGEnSgdj7I2xYkNB+aqqdMX0vd9TKFkVmRf
riZR6dPRaX67lG02zzxEw63RcIAoVwyz4Amo5TwGBOqNpFHnJmI=
=vLkf
-----END PGP SIGNATURE-----

--YrQNB5Deg1WGKZi3--
