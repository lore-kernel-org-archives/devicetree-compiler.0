From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 5/8] dtc: Fix signedness comparisons warnings:
 reservednum
Date: Tue, 15 Jun 2021 12:48:56 +1000
Message-ID: <YMgVGEP6Yc+cdsBf@yekko>
References: <20210611171040.25524-1-andre.przywara@arm.com>
 <20210611171040.25524-6-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fB+BwNl1rzuBETj/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623729378;
        bh=1ndU2QD/nIS0kdLyVTk1iDKKYZjVQU2n54EosaeyJgI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fhAyR4IdbbRrH6kTd+Jh5OVg/jbEaCuBmKdzNmVRGK09rUXEZ7Fevn/Zx1pmV1TaB
         TnFI2Ij3Ld8p3/VfLhw3kvXfrvVCrGB6cv5bHDzccyBG7wjdOrgx4xsR0AQpezvyVx
         ouL4+o/QC7OZZUHxoYttxRqgIkL2m5u2eBWiiQnA=
Content-Disposition: inline
In-Reply-To: <20210611171040.25524-6-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--fB+BwNl1rzuBETj/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 06:10:37PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in comparisons in code using the "reservednum" variable.
>=20
> There is obviously little sense in having a negative number of reserved
> memory entries, so let's make this variable and all its users unsigned.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, since it definitely improves things..

> ---
>  dtc.c      | 4 ++--
>  dtc.h      | 2 +-
>  flattree.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index 3962d3f..bc786c5 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -12,7 +12,7 @@
>   * Command line options
>   */
>  int quiet;		/* Level of quietness */
> -int reservenum;		/* Number of memory reservation slots */
> +unsigned int reservenum;/* Number of memory reservation slots */
>  int minsize;		/* Minimum blob size */
>  int padsize;		/* Additional padding to blob */
>  int alignsize;		/* Additional padding to blob accroding to the alignsize=
 */
> @@ -197,7 +197,7 @@ int main(int argc, char *argv[])
>  			depname =3D optarg;
>  			break;
>  		case 'R':
> -			reservenum =3D strtol(optarg, NULL, 0);
> +			reservenum =3D strtoul(optarg, NULL, 0);

,, we really should be checking for parse failures from strtoul,
though :/.

>  			break;
>  		case 'S':
>  			minsize =3D strtol(optarg, NULL, 0);
> diff --git a/dtc.h b/dtc.h
> index 3357300..0ceeeba 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -35,7 +35,7 @@
>   * Command line options
>   */
>  extern int quiet;		/* Level of quietness */
> -extern int reservenum;		/* Number of memory reservation slots */
> +extern unsigned int reservenum;	/* Number of memory reservation slots */
>  extern int minsize;		/* Minimum blob size */
>  extern int padsize;		/* Additional padding to blob */
>  extern int alignsize;		/* Additional padding to blob accroding to the al=
ignsize */
> diff --git a/flattree.c b/flattree.c
> index 4659afb..3d0204f 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -295,7 +295,7 @@ static struct data flatten_reserve_list(struct reserv=
e_info *reservelist,
>  {
>  	struct reserve_info *re;
>  	struct data d =3D empty_data;
> -	int    j;
> +	unsigned int j;
> =20
>  	for (re =3D reservelist; re; re =3D re->next) {
>  		d =3D data_append_re(d, re->address, re->size);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fB+BwNl1rzuBETj/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIFRcACgkQbDjKyiDZ
s5KBVBAAlxW9gb5Y5RyTQ6X5unBT6bl60rljT7yfc/yZ8d6fcmL6Y00MlY0AtHHn
vDlDylwiTOuMShP945elEHBDMtE5FyKBwqnaBqGWf3bhT9teCR4SlX41bPDfUTu3
llVZvddCLaTeRyQ+YdGestortIn09+7NSlgc3Rcl9t8Xqc/xvD9wT5Qwu3JBlegm
6Emnk3n0gtMTiYKWi5gBMnKZ0BpG9FOnChO7VrZpgnTTlYnb/d+W014Ppd3WhiT+
LasBoy0EJBE664VOgJ+SZirRuMwdvmyqUsLPLufNooBKdfZR3j8zFaSljpIs8MD9
xkcCNJLU23lbtHi/xyu+jJLiuKqGHg7CnJsZ46CN+QvasiI345eKWvlrQQ9Ud891
nyjnH/QBeMmQhnOkdOaD22QEF2wMCe3/CQneLmSuhz1B6UKFAcjddTgrlsrWQUFl
T4vWhuSPQNrVc0y0THshCqm0UAJ7U+hxNoHJd3jMgi1i8PxaDrDfb8ifwYU9YgRf
wsJSIqDJQq80x1aOb5LcI96hCZ6EZu9+GwRYCD0OtYeG488vBq1cZqQ4M54Vg9NK
KuT+Rn+YV1k7/St/8YLqVy0YwDJd9a5ILj+2G0QX36Ok+mpf+7H1Ly/fSgXEewRt
0wYt2K830ikfv7zYt87AaQEJEJ/lckcR4cRBrz6rtJJYrSKbY9s=
=1L7W
-----END PGP SIGNATURE-----

--fB+BwNl1rzuBETj/--
