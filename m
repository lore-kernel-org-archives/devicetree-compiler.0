From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: Update #{size,address}-cells check for
 'dma-ranges'
Date: Thu, 2 Feb 2023 17:48:00 +1100
Message-ID: <Y9tcoPMTrXuw+PIY@yekko>
References: <20230112125654.13390-1-qun-wei.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iGamjNnHWQZEnvid"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1675320630;
        bh=2uKZkVf3kFQJqP8p6Cm02IdCYEdxvafICiSiGhxr68Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oW79xcjvT/YwYgFa0Ee9A2ItcLDretmFp/JpbUlWkYDfgIY84wKk8HTCMNFXtT6AW
         gpkjN8Xa0fMKZVqRK7vHKIUaHqhwfp1f4YTnajk/d18WzQGwvtwAGjQcLgjI6DB+Q+
         Gbmtryh8opmYri6ewrDhew6tOUjsApVj5Gl9xVA8=
Content-Disposition: inline
In-Reply-To: <20230112125654.13390-1-qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kuan-ying.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ladon.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org


--iGamjNnHWQZEnvid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 08:56:54PM +0800, Qun-Wei Lin wrote:
> The "dma-ranges" property value is a sequence of
> 	child-address  parent-address  child-size
>=20
> The size of each field is determined by taking the child's
> "#address-cells" value, the parent's "#address-cells" value,
> and the child's "#size-cells" value.
>=20
> However, in the following example, it gives a false alarm:
> +-----------------------------------+------------------------------------=
---+
> | ranges.dts                        | dma-ranges.dts                     =
   |
> +-----------------------------------+------------------------------------=
---+
> | /dts-v1/;                         | /dts-v1/;                          =
   |
> |                                   |                                    =
   |
> | /{                                | /{                                 =
   |
> |   #address-cells =3D <1>;           |   #address-cells =3D <1>;        =
       |
> |                                   |                                    =
   |
> |   parent {                        |   parent {                         =
   |
> |     #address-cells =3D <1>;         |     #address-cells =3D <1>;      =
       |
> |     #size-cells =3D <1>;            |     #size-cells =3D <1>;         =
       |
> |     ranges =3D <0x0 0xe000 0x1000>; |     dma-ranges =3D <0x0 0xe000 0x=
1000>; |
> |     child {                       |     child {                        =
   |
> |       ...                         |       ...                          =
   |
> |     };                            |     };                             =
   |
> |   };                              |   };                               =
   |
> | };                                | };                                 =
   |
> +-----------------------------------+------------------------------------=
---+
> | no warning                        | Warning (avoid_unnecessary_addr_siz=
e) |
> +-----------------------------------+------------------------------------=
---+
>=20
> Same as "ranges", it should not be reported in this check.
>=20
> Signed-off-by: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Applied, thanks.  An additional testcase to verify this behaviour
would be appreciated.

> ---
>  checks.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index afa8f23..607e0f2 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1232,7 +1232,7 @@ static void check_avoid_unnecessary_addr_size(struc=
t check *c, struct dt_info *d
>  	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
>  		return;
> =20
> -	if (get_property(node, "ranges") || !node->children)
> +	if (get_property(node, "ranges") || get_property(node, "dma-ranges") ||=
 !node->children)
>  		return;
> =20
>  	for_each_child(node, child) {
> @@ -1242,7 +1242,7 @@ static void check_avoid_unnecessary_addr_size(struc=
t check *c, struct dt_info *d
>  	}
> =20
>  	if (!has_reg)
> -		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"r=
anges\" or child \"reg\" property");
> +		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"r=
anges\", \"dma-ranges\" or child \"reg\" property");
>  }
>  WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, =
NULL, &avoid_default_addr_size);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iGamjNnHWQZEnvid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmPbXIcACgkQgypY4gEw
YSLW5g//a0PMrLuOyXbpW6tsA8XGTIXhud560DMIixVxdxBS8nlrRNvKtQk9gi4T
/DE9f/K3ofSDU7ST6JdkNmDWFkYm6SoZMWFoAcIZ3idYQp31Mz/h3XkbEf2F25XP
ZmkXRSm4ZMJUVE0GDAzVbVn78/p8erzdruP1TKDUmNZUv9UiIQa8HNQh0fWdSxSh
aTEylSIAcydUuCBIZByStpkEcG0x7UmMkEigDprif0B35Sa6mAc82esiBKfG1RqS
oMjAGa4ZJkPt2m1bsz1g4w092Ohf4HZSyzPvem+mAOVnUrhsZA7k+jNQUPoWBzN6
Mo4A7do4ljq8XNJ7JrEE6r2uK1H+7QQsfSSB3hPWLp9VPIaF4eEe6zuWBSwYAa9T
voUaDWLpa5E+PPPO4YtWSzZSiDZMlu5OeRPxwSCXj5+N1Om6HddwHCSRtor+001O
g/sK3FuDRq0fuk0S3QBCY4G6Tplv8gtszVgLR6kP9yV2kknnWCNUvqNgTayhyjZd
0eTWwteYPu8VELAiILxrnY5bnt4ONXkOsLzkLHuTPXYeTdK2x+tCDCsC5N3SxCiR
F+sMOHeHrFHHBy5twTZO6xgv7en/zdeaZYssbRpPNFY5Z/4Ce/W5zxIZHxTedNDR
Y9iYMHvo6r89tCspT3jhQ4fuCjM7YIOBc1ztY0cPPLqAl73obls=
=XK3B
-----END PGP SIGNATURE-----

--iGamjNnHWQZEnvid--
