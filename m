From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: change default phandles to ePAPR style instead of
 both
Date: Thu, 13 Jul 2017 10:22:27 +1000
Message-ID: <20170713002227.GO4083@umbus.fritz.box>
References: <20170712222030.22258-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sGwo475CiIwWEjLI"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1499906574;
        bh=fd3jLWNR9gFG179bk9vhyCTRlwDMpqZeGLU4D4myUME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fT9oMvmrTke9ZjiklG8kwt0RT6JwnGeKAFjw99d7YUAvADCgbuOz5QsVXdv6rF+kx
         80z3BEuMrD1/cXMIpyQO5rdMfFzKj1FkGuFa/32HVjikoKssNBOPz0INNG9tlCnC2/
         GVmPBhfGF82n5wuGa/0ew1fvvtJthauNO/7YijJw=
Content-Disposition: inline
In-Reply-To: <20170712222030.22258-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--sGwo475CiIwWEjLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2017 at 05:20:30PM -0500, Rob Herring wrote:
> Currently, both legacy (linux,phandle) and ePAPR (phandle) properties
> are inserted into dtbs by default. The newer ePAPR style has been
> supported in dtc and Linux kernel for 7 years. That should be a long
> enough transition period. We can save a little space by not putting both
> into the dtb.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Seems reasonable, applied.

> ---
>  dtc.c              | 2 +-
>  tests/run_tests.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index f5eed9d72c02..5ed873c72ad1 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -31,7 +31,7 @@ int reservenum;		/* Number of memory reservation slots =
*/
>  int minsize;		/* Minimum blob size */
>  int padsize;		/* Additional padding to blob */
>  int alignsize;		/* Additional padding to blob accroding to the alignsize=
 */
> -int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or phandle pro=
perties */
> +int phandle_format =3D PHANDLE_EPAPR;	/* Use linux,phandle or phandle pr=
operties */
>  int generate_symbols;	/* enable symbols & fixup support */
>  int generate_fixups;		/* suppress generation of fixups on symbol support=
 */
>  int auto_label_aliases;		/* auto generate labels -> aliases */
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 5df148048758..ccd301738726 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -420,7 +420,7 @@ dtc_tests () {
>      run_dtc_test -I dts -O dtb -o dtc_path-references.test.dtb path-refe=
rences.dts
>      run_test path-references dtc_path-references.test.dtb
> =20
> -    run_test phandle_format dtc_references.test.dtb both
> +    run_test phandle_format dtc_references.test.dtb epapr
>      for f in legacy epapr both; do
>  	run_dtc_test -I dts -O dtb -H $f -o dtc_references.test.$f.dtb referenc=
es.dts
>  	run_test phandle_format dtc_references.test.$f.dtb $f

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sGwo475CiIwWEjLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZZr1BAAoJEGw4ysog2bOSwesP/Awu+kL2gmCdXe5Hm87XIh7j
+waTcgXrq7GyjknWGJ4F3dMcGTndC/pt9Vx/LAF9v+3dy49G2nenKha/3PydYzNE
HH4OM87kXvqqh5YqLPIxIWXcwn2tMqs5+C6VXgYoWGRXMwoLI+5nNoes0J/CyIif
obWC6HMy8VQziBPIMtes8IlhE3tQGU/7e7ekfgZTBeIWHhqEdZtBO2gEBmUO/ij9
xHkeDEEtnNzj3DoLVIvXf+R1O8/h06FEBedqNcJpvhUTU8/dnmGUSaMwYx9IiPbV
/UqhWnfPJ6mePCv5CyoPMEiO6jYNhzo8gmtVcNk+7+srHhlUqlwLZ8FALbRTk699
2BrLjLR0dI6EVewSxd5+JhlY3rB46lLwsKrvSB9gusd1WBioYmNWrK+LsQHUl3Mu
xbEgtDFKMMTHS7lu3A8QEdY66axu0m7+BoeGuHMCp0bn8o9GVBQMivjAMkvC9nbm
YyS47msyhHDMCRDCG0NcyUjZRA1kjz+ocjvmZEuLrxKe6ZsEVOE5T7uA1ocW4I3I
OqYRwUKk6n2OzOMVpYwANQlqS4k7uC8WOxxXZhgDRet3JcCD8ndKa6qEOdcIjLHF
MfurRnZEgC4Kw8pzaoC2x3R0NZcOikPpg24FWgTznSkFIZS0U9rsCoPqdM8mt1Ht
pZzHgTUHlCadqrjzCIjk
=qNdo
-----END PGP SIGNATURE-----

--sGwo475CiIwWEjLI--
