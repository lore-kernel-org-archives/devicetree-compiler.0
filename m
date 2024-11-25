Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E238BE8;
	Mon, 25 Nov 2024 01:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732498777; cv=none; b=bLWXrLiiXNJ4gOPG+IoNY9XWg17jnp6ZWSQp/qtOkH7NZ4YZaC0dPs6gzCv0Hwf4q3+8s1t1AwmQH+JR3acdJjfIbVvrc47abfrek+xSbwd6up23sRtWTIscdkM7RuF3sVKga7ORuQD1H5Vv/q6rKnv3VkuW7/X61yxW2mfsv4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732498777; c=relaxed/simple;
	bh=plLh5g0E009ZeeZsYggNtDau5wT70lekcFjq/8KKGME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7i0fcLVUqxZckqocWFD8PbqTJMM/hzyVt4pk69djwGkDPdbS3qThnSfKXZPvAH39KhWKX7yKzrEr7rTGVNEf/55YNEYwkcFJtEOKMg66qn924lrCqJF4OY+gy9+fZT0KRxo2BD4fTZ9t3Jvy8oFogtF0BKkHuOrd8e+B6jOI2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=GjpqeT1A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="GjpqeT1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1732498765;
	bh=h/E8fNY9+4YrWd9ShlbvpvksIm8BK62na9HRO3FhKXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjpqeT1Al4n1XNmpAwmGYd12wv9T+o/CCFzWKF0bpWnCLI7NKoffoQhBU+G2YFBYs
	 us5ax0SEMypDGTFHbBZ/Hwn8rFCZgoN76CdsOMVa7Y03skihWzv9bEB06LR7HJSOzZ
	 PdCIgPvAQyGilYGQBLNeBzkUA0HYsTc6lf8ovNW5JJOYYCV2eZAQ3mcNLAT+H/82oj
	 kzsoq4p0sUCuV2iLJdEbmmAk+UrvS0E8C1YmUf5R+wCRsRGzM5IjMRhgfBfnFly2zL
	 efVMyZiWLsDQGgzuf5jWGdZcW6q1uZz/k2NYBk395TpOwGH16DFwFOt1VaWWvIa1gf
	 AL95IX7hr5P3g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XxSzx36slz4xcr; Mon, 25 Nov 2024 12:39:25 +1100 (AEDT)
Date: Mon, 25 Nov 2024 12:26:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bingwu Zhang <xtex@envs.net>
Cc: devicetree-compiler@vger.kernel.org,
	Bingwu Zhang <xtexchooser@duck.com>, devicetree@vger.kernel.org,
	~xtex/staging@lists.sr.ht
Subject: Re: [PATCH v2] libfdt: Remove fdt parameter from
 overlay_fixup_one_phandle
Message-ID: <Z0PSYSEF74lQQURr@zatzit>
References: <20241123094814.15504-2-xtex@envs.net>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YDjXnWfiiYXBGpYs"
Content-Disposition: inline
In-Reply-To: <20241123094814.15504-2-xtex@envs.net>


--YDjXnWfiiYXBGpYs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 05:48:14PM +0800, Bingwu Zhang wrote:
> From: Bingwu Zhang <xtexchooser@duck.com>
>=20
> When compiling with -Wall -Wextra, the unused fdt parameter becomes a
> warning. With -Werror, it becomes an error and fails the build.
>=20
> As the parameter is not used in the function, let's remove it.
>=20
> Signed-off-by: Bingwu Zhang <xtexchooser@duck.com>

Merged, thanks!

> ---
> Changes from v1:
>  - Remove fdt parameter rather than suppressing the warning directly
> Link: https://lore.kernel.org/devicetree-compiler/20241116101228.164707-5=
-xtex@envs.net/ # v1
> ---
>  libfdt/fdt_overlay.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index f61ca7ed2f0b..e6b9eb643958 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -307,7 +307,6 @@ static int overlay_update_local_references(void *fdto=
, uint32_t delta)
> =20
>  /**
>   * overlay_fixup_one_phandle - Set an overlay phandle to the base one
> - * @fdt: Base Device Tree blob
>   * @fdto: Device tree overlay blob
>   * @symbols_off: Node offset of the symbols node in the base device tree
>   * @path: Path to a node holding a phandle in the overlay
> @@ -328,8 +327,7 @@ static int overlay_update_local_references(void *fdto=
, uint32_t delta)
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_fixup_one_phandle(void *fdt, void *fdto,
> -				     int symbols_off,
> +static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
>  				     const char *path, uint32_t path_len,
>  				     const char *name, uint32_t name_len,
>  				     int poffset, uint32_t phandle)
> @@ -443,7 +441,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdt=
o, int symbols_off,
>  		if ((*endptr !=3D '\0') || (endptr <=3D (sep + 1)))
>  			return -FDT_ERR_BADOVERLAY;
> =20
> -		ret =3D overlay_fixup_one_phandle(fdt, fdto, symbols_off,
> +		ret =3D overlay_fixup_one_phandle(fdto, symbols_off,
>  						path, path_len, name, name_len,
>  						poffset, phandle);
>  		if (ret)
>=20
> base-commit: b3bbee6b1242b4bb84fcb31365b76a3a45be3b6b

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--YDjXnWfiiYXBGpYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdD0mAACgkQzQJF27ox
2GfjQA/8CxWHMiSQpo8v1BNR0tEuSYrs9SkppP+VZbA/Fw0/XMcUxYZQbr2JKPmd
m/5duD6QHg40GEaOclFTSu6rIwnNwYqE4kFDZiI4GegMhC87EltoetGeaKGQMOAU
0G9b1D4CDHIQ1PVEz4wnC4sHcBYaU13JhDPOhNCX+jQyw4O8d/TEhEnuiWFwZ2zX
0fQiPVs48Xe5TPk7ii172n9bFHE88rBv6o67a8unHiLWnpxfB9a+cAYsOLhU2WGP
dArdb07ZVVLlhlLeMt/xUrZRZQM5NRCJz2w1jlggaAWA3deizCXkbQV21DsONfQn
AxPkEb5ggv74mlL7JALOUPKAgw6q2/VhG7eSA8r0984OOefphaJTyft7A+l/c/Nf
4RX+1o6B4rtFdt/ceQJ4vrQnbVly52RIZcUk+uv/OvpJn3gOyT2u8nyvHbtFNwD9
+4r29JlhmaAgp2ISmIsfUugQbT1L5jvoIqer2iqz6MEYv0qjQuMSqyKw2c90jBTg
rMWeE4Lh4kKkYPbV8yWeH7kOQHmUR0LFh+ahPqt4rI7qP826+okIeoC88RUlvG12
Q52v4ZntBuNe9xNgBO7ZjhgeU6DdZmOwofnZ3C8Xkvqpkr8+CEs+LoFtLp+3x4Bz
mhTd62FfntzZpu52cZnc25J7+xuGRVQSQ//i9pEFwX8TNk2QXDU=
=NBCt
-----END PGP SIGNATURE-----

--YDjXnWfiiYXBGpYs--
