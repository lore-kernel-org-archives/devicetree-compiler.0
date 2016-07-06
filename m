From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 07/13] libfdt: Fix separator spelling
Date: Wed, 6 Jul 2016 11:16:41 +1000
Message-ID: <20160706011641.GQ2251@voom.fritz.box>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
 <20160705082646.25044-8-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8RsyD0KswhpoK73Z"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467771659;
	bh=sk0megwy1dHyp1hGqsy/tC99mzSE0W1hgRiGwskIG7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWasHjoC3xE+rmqKI+WyANVscoHLbOx1dBLEeLKisP65RgiPUxocsB8sbxutjI0qk
	 0zUvzLMVxJG9UP799VFkU6dLf4ekoruUFiwPeJC/rBo/5b1zzQNxDE5N4fFUlxKqRk
	 w2JRmC57KxDN6K8nxV2tMzmKFfvFBCXfuM3iopB8=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-8-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--8RsyD0KswhpoK73Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:40AM +0200, Maxime Ripard wrote:
> The function fdt_path_next_seperator had an obvious mispell. Fix it.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Huh.. this entire function appears not to be in upstream libfdt.

> ---
>  lib/libfdt/fdt_ro.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
> index 503150ef1dc5..6b737b211d2e 100644
> --- a/lib/libfdt/fdt_ro.c
> +++ b/lib/libfdt/fdt_ro.c
> @@ -140,12 +140,12 @@ int fdt_subnode_offset(const void *fdt, int parento=
ffset,
>  }
> =20
>  /*
> - * Find the next of path seperator, note we need to search for both '/' =
and ':'
> + * Find the next of path separator, note we need to search for both '/' =
and ':'
>   * and then take the first one so that we do the right thing for e.g.
>   * "foo/bar:option" and "bar:option/otheroption", both of which happen, =
so
>   * first searching for either ':' or '/' does not work.
>   */
> -static const char *fdt_path_next_seperator(const char *path)
> +static const char *fdt_path_next_separator(const char *path)
>  {
>  	const char *sep1 =3D strchr(path, '/');
>  	const char *sep2 =3D strchr(path, ':');
> @@ -168,7 +168,7 @@ int fdt_path_offset(const void *fdt, const char *path)
> =20
>  	/* see if we have an alias */
>  	if (*path !=3D '/') {
> -		const char *q =3D fdt_path_next_seperator(path);
> +		const char *q =3D fdt_path_next_separator(path);
> =20
>  		if (!q)
>  			q =3D end;
> @@ -188,7 +188,7 @@ int fdt_path_offset(const void *fdt, const char *path)
>  			p++;
>  		if (*p =3D=3D '\0' || *p =3D=3D ':')
>  			return offset;
> -		q =3D fdt_path_next_seperator(p);
> +		q =3D fdt_path_next_separator(p);
>  		if (!q)
>  			q =3D end;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8RsyD0KswhpoK73Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXfFv4AAoJEGw4ysog2bOSbjQP/iFsc0Jt2pUoU01ZY+0sxsTn
dQdEsbjO/Ecjlw2SBMNdoaxGJuug6LCuR89Q4BF13SONA47h02tnoZKw8MrDEt5J
3mKNHG3Bzga5VZk/eR/plhosfHlNy0d3G1EeNDkniO3bsEbE/IEDW2jrneZTxzPo
rOe4Bl09wcVNjmsvM6Eqn3lnKV32rrPI7A6doKdxeOHE5T7GGT0HTEo7dV5SNf7u
iTTuaD5wcqyDYtHypgS+S+jDI+B6fn2xq4X4uTPZdmbe3rwnLY3i0b6KV3aQ46TI
yE6nIMbTOEQj5FT87N6IbPXn/jrqI0wnM7pK2+O/Yb/xhb0ALUXurGHDq2A8PzLV
qFqbwJfsd/T5t3Ai+Z1baSa8qMZaBq5M1ECIxrE0FFGip7QR4z7ha/A9ahLQKF4V
2BSuMlLEADEOnMkXxPmKjzuIVIgb24JCCuTFfz5Uj/Q3brPI/DWwpmv0G5Ml63l7
+AKXItBajvR8wnY0vJn8NfLSxuwqbuB40JWZoWa78xnMZSiYqePzM99LCsvkQrab
+kQw2zBFsINdjaZCz1SYp1CUURDXXXiZ/TEGiSeHlw5K6wX24xZ9uHPll4iLDuzf
NDU0oKNSmdb8bWtBLi9b5YWvoPxlMRSiI3dldgyPrXjjUVEC5MMTvqQ+3Yha7H/t
TEh8sWoWv3mPtsdpoxY+
=aRxv
-----END PGP SIGNATURE-----

--8RsyD0KswhpoK73Z--
