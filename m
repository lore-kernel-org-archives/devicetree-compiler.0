From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 07/11] dtc: Fix signedness comparisons warnings:
 reservednum
Date: Tue, 13 Oct 2020 15:58:12 +1100
Message-ID: <20201013045812.GQ71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-8-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i/CQJCAqWP/GQJtX"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565785;
        bh=H3JBLR3j74WDe3XPYoS7tf6fVJhCTCbzA99ZLB6Kwa4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J+4jvbH7cx9lKMZLQqR9pavR2oKm9jcNaPmtYDK+Uz82bpGkZkLyTwehKD4nPIIrB
         DEvf5mmzIjyCSIKiEzTKPU5KN477G6RER0m2jMHIz9h6Z+ytBFxwZ5phTs2ZjFkzKR
         Sv2AmjHbun9+oJIn9IJWdXXcKORmc5T8r4f4EyvA=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-8-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--i/CQJCAqWP/GQJtX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:44PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in comparisons in code using the "reservednum" variable.
>=20
> There is obviously little sense in having a negative number of reserved
> memory entries, so let's make this variable and all its users
> unsigned.

If you change this, then you also need to change from strtol() to
strtoul() at the point this assigned.

>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  dtc.c      | 2 +-
>  dtc.h      | 2 +-
>  flattree.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index bdb3f59..eed69d5 100644
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
> diff --git a/dtc.h b/dtc.h
> index 511dda1..bebdb22 100644
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

--i/CQJCAqWP/GQJtX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FM+QACgkQbDjKyiDZ
s5Jz3w/+LJ+IBcgMsTqM/L62tsjNDrHov41YEQTy9UmsFRdnlE/F8yPfVDCk73B3
6nG68V3d/wFWGj/IhtAIDT99A6BG4tPlnpipj05Y4DZpdMQ/3XDLkzWxH/xlLGnq
5Bhs3Z7eO+aTwYxRhftvRUa5XmC65tsogquDEDiuKhJSa5wP4uicxcvxeV1SGK8o
r4dRj6ua4179CBePw07K5uUzEcTejQCiLajWpw+zMII6GG1kapI/eu4drZCqiQ+w
dE0PZZTal/7iPgaYL7gwVmYcxYQM8DH2fd9ygZvPQPbotCgjMuf9nwacFJegfptJ
c4llxZCbRDQul20L2jGG5DtXEgpoo9lA5Y8K2D8JbzpoLVHCgZtSpiCFknSpSl+H
Es+HFc+aSwoLWEGe6rufCW4aR9wkuTFaKbxDlRQacqm8goAYxb0K9srQlLOyEfY6
DvoZV2w7f44LyYT11/mKbrxfY/QCBnTQkkn4gmweADz0EF66iL2zDAuwLaPo/Gy2
Z6yDAtOzzbpQCxpLcM+2+jXdC5sc+K2Ra7e9cCz9LLG1G3ITS/78Ha6ugk7nZmkv
b+iNbzP48b3lb0DAzf3BDGhXRrGHWQwr1dBKnlFnSU5+PrTeUOiNQ1GrhqoP1VeN
s4+AmKzStMeunICmWWf02ACuaOt7amSHjj1JsysAAkKzxnEvl2A=
=GEqD
-----END PGP SIGNATURE-----

--i/CQJCAqWP/GQJtX--
