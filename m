Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1050368
	for <devicetree-compiler@vger.kernel.org>; Thu, 25 Jan 2024 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706152671; cv=none; b=YMyW55qaTYpgfKdQxRRd6KoU0QnfmEs9bbTCoy3g3WoIGsShmUMAQgyu8vVZcLo2vAQaqjNemN0TUN9QDpgAS6g0GyVcKTrSR6wyiZL6vLr951yoLNmvli9QtkOYP0o4qdocDNmkAn4CloTwRbTY1gLEJn1958rf2d81eJH1wLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706152671; c=relaxed/simple;
	bh=cbxifnCpk4fAYytZ1JlXJZgTn3mwE2sRqV/lgOda1pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HshlNr/fcfe6P3jXofNZC5ZJH9zCkQmwpcv6Gym3KGfA3PcJ8eV01L63+zkLOxMDwtBfDOOqOCZvRcYC8V+VF+qW8fX/0v/WL4J4sX8MulSSzoBkXUGbl+05OW6Q/7GMGR2DoR4DhWE+w9f2G+iN2CSWSgSXOHJR5EwU3NXwZxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=pBx/W90G; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="pBx/W90G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1706152667;
	bh=ga2gm+wxHXHmX2JW5EQek+4Q0u2qKfFPZ0DRrsIOfw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBx/W90Goc64w2dI63KlG4XJ/9mrj/n0ShqLBVo4rHg7WsXgn7fmu2P0ctvOb0Hho
	 mmDJHGDPWzl3+XdHcFfUAA8DGPMNIL4ksSzGhPOaPSEnyygbx01mo4kExNLevEOyDY
	 z2O30xWSJ0CPOo7vo908EdzdCOn20Tby/ARIo2gr7SYeR0hBfvYpv37lN+dDMQfO3Z
	 AWT0zjnTkrjG2s1h8aAqUs3iOVIEA4Ij5TzkO98KTLMfiHiujPbKEl0JRm2a3GdZ1G
	 QFTSTwY4QyoMRxjGSsoBuprh25cxgaHHEvpKVLC9cvArFg4sItCBzuhg1dknQVG3aW
	 BOVBvGO4sanDQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TL5cC03lbz4wcJ; Thu, 25 Jan 2024 14:17:47 +1100 (AEDT)
Date: Thu, 25 Jan 2024 13:31:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alyssa Ross <hi@alyssa.is>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fix duplicate meson target
Message-ID: <ZbHIHpMkZIpG_mKn@zatzit>
References: <20240123130742.185409-1-hi@alyssa.is>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T58olceM1vVAJqiC"
Content-Disposition: inline
In-Reply-To: <20240123130742.185409-1-hi@alyssa.is>


--T58olceM1vVAJqiC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 02:07:42PM +0100, Alyssa Ross wrote:
> If default_library is set to static, the libfdt target (which just
> uses library()) is already static, so we should just use that.
>=20
> This fixes this Meson error:
>=20
> 	libfdt/meson.build:37:11: ERROR: Tried to create target "fdt", but a tar=
get of that name already exists.
>=20
> Signed-off-by: Alyssa Ross <hi@alyssa.is>

Applied, thanks.

> ---
>  libfdt/meson.build | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/libfdt/meson.build b/libfdt/meson.build
> index 2ea1448..9d07c5f 100644
> --- a/libfdt/meson.build
> +++ b/libfdt/meson.build
> @@ -34,19 +34,21 @@ libfdt =3D library(
>    install: true,
>  )
> =20
> -libfdt_a =3D static_library(
> -  'fdt', sources,
> -  install: true,
> -)
> +link_with =3D libfdt
> +
> +if get_option('default_library') !=3D 'static'
> +  libfdt_a =3D static_library(
> +    'fdt', sources,
> +    install: true,
> +  )
> +
> +  if static_build
> +    link_with =3D libfdt_a
> +  endif
> +endif
> =20
>  libfdt_inc =3D include_directories('.')
> =20
> -if static_build
> -  link_with =3D libfdt_a
> -else
> -  link_with =3D libfdt
> -endif
> -
>  libfdt_dep =3D declare_dependency(
>    include_directories: libfdt_inc,
>    link_with: link_with,
>=20
> base-commit: 95c74d71f0904235d44892627322f60a18c9a28c

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--T58olceM1vVAJqiC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmWxyB4ACgkQzQJF27ox
2Gf+FQ/+PSnReP3ghngNmvWfwWsU8HSXnw0+bysvbpD3V91DBFkfnfvJMoZ5I9c3
9wh4naOVbwvv17CCiu18T8vVw91S9AGEr4P4zaISjszpEzlmAHWRQCsePQfYGSEm
SQVpKO6ZHYWWJgyazLVnUVQl9kFi1dO8bmlQpbrcKiPWhrYRp3xpiiQm42KNwEya
ec1y11moV0XHjeF8sDVAo1Rp81vqrkkbiUNQl0WKg3Xj2QdDTavpTsXAugPDgxlG
z4bGoXkHQwGoI1pLm1YxkVeaR3S+HKERBPfcUzkE7mOpgH/O8aKa6s7bi0pMGKme
ZA+po8czp6dKM35+tBP+20RoEtomj0/WgnGyPb+64TBaUe8ow5yLaeup63VJHr1U
318vYHNNzyGMIpITOFkzy6YEXnYytfWfMc/yPjxsytDcAPG7jeqrQSUrkcsGMok4
LPPHhPIPXXCpdzNCMFZJXMy2d+04R/vJdnpGAt4BLFY4B4x/Ral6HHLdiR70ed42
a2ZEbrNfx/ywLiy9zLiESZR+JXNHcUtI1plx8srcSvkl6S1wYAFBNonMs6hKidbt
p+y8S4/LGAYlpuyovRO9pUAZhhtuYry0s6eeL6oEnBAYvMn+pN6yYUclBCdnVsuY
14U+MBCY0A/62A+Orwu77RcbAkFnnw2wgYi6OUfJyYJ4rgjfXMM=
=4PWx
-----END PGP SIGNATURE-----

--T58olceM1vVAJqiC--
