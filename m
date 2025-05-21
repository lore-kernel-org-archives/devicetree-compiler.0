Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4D641C69
	for <devicetree-compiler@vger.kernel.org>; Wed, 21 May 2025 04:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747801453; cv=none; b=cpEJIiKV8hIKJhmjhTxu7DmFYnaGgZ6uTfhK5mXb4w5gNMUle095yBn2eYBavlhGBe9uOQbOz/2qWUYJwHQ9S8Etx4FObbrHTEkHkQXvNUKP6aTuIOVTlRGBObIXjRKdfz6A75iYFFSsvU+ifmhO7odtEzxcQscCvhzAP7z3CIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747801453; c=relaxed/simple;
	bh=kiBoYEN7PBGwARTxRbAAnnvqlvFYyRLLQqCrUqufV0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXIU1WznqfbMZDXcMc6AZyPiOQUNBEmWKB2OfrzrlBTzi5OJmMAlGmTtVcLQ/LCWBUlhFjRJORyaxJxYuaw9dZAW7HdoJiKSIGEUmR39MgJERYu7+biIpr/9kpTOPKNPV/cRCyYc+uv6Lozyy6xd/EK7a3F5MbaDdz/3G9qayC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=fSdxzAti; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="fSdxzAti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1747801448;
	bh=oavrRtyw2CydgvdtbhD6MTYNuCQQ4/8yG3udEn8d6/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSdxzAtijsxrvqDOkWsFyQRLYEP4/xcYbHGv/O7z8OC1zyGaMmVXNPJO0kEvVod3E
	 Zwcqro4rCSGmbgRGnEYoqk3haDcevAYhGgPbjAoqyP4DmeseVfKSmUd9Xd4ckPNVtM
	 nn6eE5DuhUcdTqnz2EGlMncOsXofaa771MxQt6G1O1UMwjaji3p2m8iNCxGCiajorz
	 oE3RCbhAHgKAs/MOJcUgo4OBkdSyAdr0nodIuyRsvlA57nWV1eFe6LSNxmPAjHM0gl
	 lVHsz0QXnj89AhKOzDlkRnvXpIFYKLKS9z5GGz/xyiWYufW1bySAFNVZy4zY05Hbbf
	 TK4Y2FkqZXe6w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4b2JGJ3P54z4x8R; Wed, 21 May 2025 14:24:08 +1000 (AEST)
Date: Wed, 21 May 2025 14:23:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: devicetree-compiler@vger.kernel.org, kernel@quicinc.com,
	kernel@oss.qualcomm.com, Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH v3 1/4] libfdt: overlay_merge: Introduce
 fdt_overlay_merge()
Message-ID: <aC1VQfD3F1v_1rem@zatzit>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <20250519091043.621316-2-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nLfXuQ9SUsi7w5Z9"
Content-Disposition: inline
In-Reply-To: <20250519091043.621316-2-quic_wasimn@quicinc.com>


--nLfXuQ9SUsi7w5Z9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 02:40:40PM +0530, Wasim Nazir wrote:
> From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
>=20
> fdt_overlay_merge() merges two overlay blobs. It is largely expected to be
> used offline on a build machine to combine two or more overlay blobs into=
 one.
>=20
> It is intended to help maintain device-tree overlay code in
> multiple source repositories, but merge their binary forms (overlay blobs)
> into one so that bootloader's task of searching for all relevant overlay =
blobs
> is simplified.
>=20
> Introduce fdt_overlay_merge() which is identical to fdt_overlay_apply().
> Subsequent patches will introduce required changes to merge overlay blobs.
>=20
> Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  libfdt/fdt_overlay.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h      | 18 ++++++++++++++
>  2 files changed, 77 insertions(+)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index e6b9eb643958..8690ed55c8f6 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -1098,3 +1098,62 @@ err:
>=20
>  	return ret;
>  }
> +
> +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)

The parameters should be renamed to reflect the new semantics.

The 'fdto_nospace' parameter seems weird.  Why not just return
-FDT_ERR_NOSPACE from the function?

> +{
> +	uint32_t delta =3D fdt_get_max_phandle(fdt);
> +	int ret;
> +
> +	FDT_RO_PROBE(fdt);
> +	FDT_RO_PROBE(fdto);
> +
> +	*fdto_nospace =3D 0;
> +
> +	ret =3D overlay_adjust_local_phandles(fdto, delta);
> +	if (ret) {
> +		if (ret =3D=3D -FDT_ERR_NOSPACE)
> +			*fdto_nospace =3D 1;
> +		goto err;
> +	}
> +
> +	ret =3D overlay_update_local_references(fdto, delta);
> +	if (ret) {
> +		if (ret =3D=3D -FDT_ERR_NOSPACE)
> +			*fdto_nospace =3D 1;
> +		goto err;
> +	}
> +
> +	ret =3D overlay_fixup_phandles(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D overlay_merge(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D overlay_symbol_update(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
> +	/*
> +	 * The overlay has been damaged, erase its magic.
> +	 */
> +	fdt_set_magic(fdto, ~0);
> +
> +	return 0;
> +
> +err:
> +	/*
> +	 * The overlay might have been damaged, erase its magic.
> +	 */
> +	fdt_set_magic(fdto, ~0);
> +
> +	/*
> +	 * The base device tree might have been damaged, erase its

This comment is no longer accurate in the new context.

> +	 * magic.
> +	 */
> +	if (!*fdto_nospace)
> +		fdt_set_magic(fdt, ~0);
> +
> +	return ret;
> +}
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index b5e72001d115..664b141d5334 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -2313,6 +2313,24 @@ int fdt_overlay_apply(void *fdt, void *fdto);
>  int fdt_overlay_target_offset(const void *fdt, const void *fdto,
>  			      int fragment_offset, char const **pathp);
>=20
> +/**
> + * fdt_overlay_merge - Merge two overlays into one
> + * @fdt: pointer to the first device tree overlay blob
> + * @fdto: pointer to the second device tree overlay blob
> + * @fdto_nospace: indicates if FDT_ERR_NOSPACE error code applies to @fd=
to
> + *
> + * fdt_overlay_merge() will merge second overlay blob into first overlay=
 blob.
> + *
> + * Expect the first device tree to be modified, even if the function
> + * returns an error.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there's not enough space in first device tree blob
> + *	-FDT_ERR_BADVALUE
> + */
> +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace);
> +
>  /**********************************************************************/
>  /* Debugging / informational functions                                */
>  /**********************************************************************/

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--nLfXuQ9SUsi7w5Z9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmgtVUAACgkQzQJF27ox
2GeAbQ//ZkV9xxBubhNEOQbuMMMPhdxxunX/2sEDbLq4MfZhqynbIXXmA4rDhKFh
pPqs9c+rL7RVroVDP3/GU6CIJabKA6flIZMIQkFYMqnWOzyPGkLjc92DpCYhchAQ
3UdRWtLr7PtY41WuJsIsDIgvrP1KXQ6mqPA6hcNdDwGclpCQHme6hqQ7+0PkZ0FH
egjRNm+2EsemgfkFfBnekzA6IsSnCNTe5EUbT2yuLTf2aF6jY6uwKcWUrDCV0J2b
0q/dhVvyGi0jR6WnCzb/1jkq9O03j32gYiZcbwKVw3h9bFHSDZnVZght7IyCDAbw
hcFe9wTaGlXXzkV9/IIx43mxnyo0M/5yZE3ciV6QUMKiExnpMFSl/cAFqPR1FBNB
nrUNfpXzoNuMFQOulRMRc2xKqS+t+q8xlz8Vn9rXvbxSpXSO3q9shCMoZQQMmBxy
KWj5XN1pk+4S7rdVj80faK5KDCF1HGikWu/L6T8h68xVjTPzP8UK3lhXhFfzwPv3
p0D7mp4dlk1JitLZEfREBWGgIvaV5d+Vkj2lWey6drkeZiKwS3Am/Vq1aTTnsq0+
R1VItUAeVHosT6dJFJsIYk4Zo2QWGJKNpjV4bHJkQ2yaC+KD2LhWlgFFA6Wh+cjE
Pv6xTWnq3sUS/j1oORrtzZ00Cj8OEQtefFkQL1vtB5hL3IK5xCw=
=Y8+9
-----END PGP SIGNATURE-----

--nLfXuQ9SUsi7w5Z9--
