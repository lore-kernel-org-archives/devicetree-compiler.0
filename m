From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 07/12] libfdt: Add fdt_setprop_inplace_by_index
Date: Mon, 27 Jun 2016 01:45:11 +1000
Message-ID: <20160626154510.GR15625@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-8-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Isdj7O9hWi8F9Bn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1466956117;
	bh=QrIopE3Clwkg8ffbnSzi6NOHCWsdBnMWfavkpQyXMmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgOWzgVI3jGUp3Kvf2gf4Go2BCjEwYjIhS6fliUlWCrylI8sEes1cojaxowe0EkXW
	 y2eqHRvZRNzyJtmHAIayBHuZ9xkBXkb/n6sGSzDaiFp9h99tNmnvl9DOv8fVhaa/F2
	 biwU2vIAab5urqVxzlqknxmE1Dag98gLmSC1qV6Q=
Content-Disposition: inline
In-Reply-To: <20160624142757.32735-8-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--/Isdj7O9hWi8F9Bn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 04:27:52PM +0200, Maxime Ripard wrote:
> Add a function to modify inplace a property starting from a given index.
>=20
> This is especially useful when the property is an array of values, and you
> want to update one of them without changing the DT size.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/libfdt.h     | 34 +++++++++++++++++++++++++++++++---
>  lib/libfdt/fdt_wip.c | 13 ++++++++-----
>  2 files changed, 39 insertions(+), 8 deletions(-)
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index 4643be5adf39..2c8a42bcb667 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -1032,6 +1032,27 @@ int fdt_size_cells(const void *fdt, int nodeoffset=
);
>  /* Write-in-place functions                                           */
>  /**********************************************************************/
> =20
> +/**
> + * fdt_setprop_inplace_namelen_by_index - change a property's value,
> + *                                        but not its size
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @namelen: number of characters of name to consider
> + * @index: index of the property to change in the array
> + * @val: pointer to data to replace the property value with
> + * @len: length of the property value
> + *
> + * Identical to fdt_setprop_inplace(), but modifies the given property
> + * starting from the given index, and using only the first characters
> + * of the name. It is useful when you want to manipulate only one value =
of
> + * an array and you have a string that doesn't end with \0.
> + */
> +int fdt_setprop_inplace_namelen_by_index(void *fdt, int nodeoffset,
> +					 const char *name, int namelen,
> +					 uint32_t index, const void *val,
> +					 int len);

This looks like a good addition to upstream, but I don't like the
name.  I'd suggest fdt_setprop_inplace_namelen_partial() because it
only overwrite part of the existing property value.

> +
>  /**
>   * fdt_setprop_inplace - change a property's value, but not its size
>   * @fdt: pointer to the device tree blob
> @@ -1060,8 +1081,13 @@ int fdt_size_cells(const void *fdt, int nodeoffset=
);
>   *	-FDT_ERR_BADSTRUCTURE,
>   *	-FDT_ERR_TRUNCATED, standard meanings
>   */
> -int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
> -			const void *val, int len);
> +static inline int fdt_setprop_inplace(void *fdt, int nodeoffset,
> +				      const char *name, const void *val,
> +				      int len)
> +{
> +	return fdt_setprop_inplace_namelen_by_index(fdt, nodeoffset, name,
> +						    strlen(name), 0, val, len);

This effectively removes the error if len is not equal to the existing
property length, so that needs to be put back.

> +}
> =20
>  /**
>   * fdt_setprop_inplace_u32 - change the value of a 32-bit integer proper=
ty
> @@ -1095,7 +1121,9 @@ static inline int fdt_setprop_inplace_u32(void *fdt=
, int nodeoffset,
>  					  const char *name, uint32_t val)
>  {
>  	fdt32_t tmp =3D cpu_to_fdt32(val);
> -	return fdt_setprop_inplace(fdt, nodeoffset, name, &tmp, sizeof(tmp));
> +	return fdt_setprop_inplace_namelen_by_index(fdt, nodeoffset,
> +						    name, strlen(name),
> +						    0, &tmp, sizeof(tmp));
>  }
> =20
>  /**
> diff --git a/lib/libfdt/fdt_wip.c b/lib/libfdt/fdt_wip.c
> index 9fe988655fe3..737769fa59e2 100644
> --- a/lib/libfdt/fdt_wip.c
> +++ b/lib/libfdt/fdt_wip.c
> @@ -14,20 +14,23 @@
> =20
>  #include "libfdt_internal.h"
> =20
> -int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
> -			const void *val, int len)
> +int fdt_setprop_inplace_namelen_by_index(void *fdt, int nodeoffset,
> +					 const char *name, int namelen,
> +					 uint32_t index, const void *val,
> +					 int len)
>  {
>  	void *propval;
>  	int proplen;
> =20
> -	propval =3D fdt_getprop_w(fdt, nodeoffset, name, &proplen);
> +	propval =3D fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
> +					&proplen);
>  	if (!propval)
>  		return proplen;
> =20
> -	if (proplen !=3D len)
> +	if (proplen < (len + index))
>  		return -FDT_ERR_NOSPACE;
> =20
> -	memcpy(propval, val, len);
> +	memcpy(propval + index, val, len);
>  	return 0;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/Isdj7O9hWi8F9Bn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb/iGAAoJEGw4ysog2bOSGrsQALpFDe44XwRpooLMaW488mz3
b8w6nmfCbhZi9Jr1wpIfsTYRqnlqEutVsSaDq71MWo+J2dEdT8fr0IoU790M6uB2
UIz6sFZY5XISCIHi/1galPqz8pv0oF3GXlT31qTkoQkRZTe9Cm2Vpw0lckD9vMiG
i1hpaobwV3rOCx9B2yUdN98Ey0VtX+jVkYsgl7+Eb7QuYm4ico6nvgrvMtOTwVn5
3XsoQZAmfdnDflqA/Zb4XoBfzP7zlAZwyESxAtc2MG/JED1cgsfund6RBsRKq0yS
hQm8T2XisS6gx6NqkSfjoaUqOzT5GMkJSoMSKH4pU3lfMVZi0SrT+4xzT2iUQMyY
T7eCOHRI1uEi3+kR7xikfxoiLrPk3QDuQNbVIWSqWatoehj9ExQbB+UqbZj8UGBA
jzRB1IAWG9AUkwEDYWeUvdeGNExlYYEBM5/X9PITG5LOOFc5PrTv986wyAbTFILt
MytPxpkp/Vu4NlRPYdesiXrAWwYykHaKThTHMRTe/j2UUuQFqSUJYnY4yYv9nNT6
HIl1rz9m9TldaE20gDNctmdmBRd09NMUzxSQDPW7yjknb29U1+4v/Wn6u8GZZXHT
hTlUIc3RWZKzLQTZ5g64nOvMeq/kVsKjS7FYjrnyVtQOjqne0OxBPvkEaGChJ74S
BE3tXvfba9TwR5+hC41n
=hyCE
-----END PGP SIGNATURE-----

--/Isdj7O9hWi8F9Bn--
