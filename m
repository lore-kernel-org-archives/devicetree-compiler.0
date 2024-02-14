Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC741125BA
	for <devicetree-compiler@vger.kernel.org>; Wed, 14 Feb 2024 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707900522; cv=none; b=W83Zot9n9x2SN7kjOSf6Z1vwRR35PvmhfpcCIk+qxXf8D93DlutMuKuMegsk0P1FTaNUP0XomcFRb0GYCCJCIrhckrdreKvJ8MLuDrSal5D+WYKwPcSJP+n4TvDXhnYZ6k5e29CgcNKj7qHEnXaQr4+LTaBHe6iaz+9T4VgzqKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707900522; c=relaxed/simple;
	bh=9eJQ1yw7BuckZZBAB48QmkJnyj+Cp2rn+6sjVqe7UOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDT3+W6N373ljF05qZ+fcREiyEJgVFG9RC85Y6LENLlXoC4bIR8MN5hqH/VTkK1zh9zroLV3X5GQD2+hAeWjWv2hvYbi2NayTU0gppquLUs7XibojlqR31Cj8EdiOLaeysMXD8gs6nKX3YakYYdo4c7NJQaQ9MxAR0zGgMVME1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=f5ST5dZ+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="f5ST5dZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1707900515;
	bh=U6rPdHGORZyfsoX6iCvwoBPcepQ9jLyQD4g3mSjx54A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5ST5dZ+kfkeY8NvTFBQ1FbcU4TKNIbng6vUBgtW4trZWki7/hZHhVmcHhlcI2eNd
	 nVCgoDVdaCQx9cbp3h+QRJz/hKKVD69r4vDAA7Tga6eSEPkrdBXw21gMRHWMIATa55
	 ZMsXrynVN+voyanrge+ThzLtv0gdGnkLwjnIc0dMHavLYWg+CYCpdP+4JMqrtgMaIN
	 V3Uu7QOXZcBx0uYimppvBywQXfENPaNYp0YX5SuJrgl4UQyM8lKJjdsWnso+TD8TPU
	 ih7VFLruVVGxSVglH8FoB8zYPTkCcGr4PD5xaWhhlVoqaXjPAAF57hUN0N3ex5GIu1
	 ZJlQL6TxkQjKQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TZX0g4K25z4wcr; Wed, 14 Feb 2024 19:48:35 +1100 (AEDT)
Date: Wed, 14 Feb 2024 19:25:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Samuel Tardieu <sam@rfc1149.net>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] Makefile: do not hardcode the `install` program path
Message-ID: <Zcx46Sui5AU-ULl7@zatzit>
References: <20240208191405.1597654-1-sam@rfc1149.net>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uO9faRlJ2TxQPnPe"
Content-Disposition: inline
In-Reply-To: <20240208191405.1597654-1-sam@rfc1149.net>


--uO9faRlJ2TxQPnPe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2024 at 08:14:05PM +0100, Samuel Tardieu wrote:
> On systems that do not use the FHS, such as NixOS, the `install` program =
is not
> located in `/usr/bin/` as its location is dynamic.
>=20
> `dtc` can be easily installed on such systems by using the `install` prog=
ram
> available in the `$PATH` with:
>=20
>     make PREFIX=3D=E2=80=A6 INSTALL=3Dinstall
>=20
> However, this becomes more difficult when `dtc` is being compiled as part=
 of a
> larger toolchain, as the toolchain build scripts will not spontaneously p=
ass
> such an argument on the command line. This happens for example when `dtc`=
 is
> build as a part of the RTEMS build system.
>=20
> By not hardcoding a predefined path for `install`, as is done for other
> executables, `dtc` will allow the one in the `$PATH` to be used.
>=20
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>

Applied, thanks.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 10a56d4..f1f0ab3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -29,7 +29,7 @@ SWIG =3D swig
>  PKG_CONFIG ?=3D pkg-config
>  PYTHON ?=3D python3
> =20
> -INSTALL =3D /usr/bin/install
> +INSTALL =3D install
>  INSTALL_PROGRAM =3D $(INSTALL)
>  INSTALL_LIB =3D $(INSTALL)
>  INSTALL_DATA =3D $(INSTALL) -m 644

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uO9faRlJ2TxQPnPe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmXMeOQACgkQzQJF27ox
2GcWJw/+KdSGewPifFVSIkZcfJyHpCECYB4jJ3tYyp1WoK/Lb/5TrQbXBUyi18W4
UQJRpPu/rih2GHVQ8FkNCzYGsWEDx/yGOnLyy2yJKTavsHwkjsjDAxwLEcpiBTlR
KBqCSVC6cVXAcYSGqR3uQL3dY5EBUfp9JlUI7QT03JuGmrRuGAJOUdQqHKPszllV
oqfgnPTrUdkjMsfupCVkla5QSYVNNthcc3cjrF0CzKD4kbCRqxv2mS1kbZ00pvyB
MRVeazfLOkySiW5MaRhB+F8hb7UQrKp2yk+HRjYYurOnMGdyx6roUgU6jgQuK1Ve
4bnTefCqCYfHvEgdbt7AezGmRk8C8KVfaI8Y8I8XXLJ6U1ED7UzQnaZAxrOC3DFj
47xogSFbkjWlGInRLD2A5Vh08/Q45bIv7c6jGsdWtwQ+f3dE1SsFK2XymFTl0KQ0
6df07YVCHhMbgeFc68TDEiOowlc/eq+IDjIWFCeD1CXzn4a18ahLOudV3Ummjg05
wC2Dsy/YDPD1nopXOc8jJJJ3Qtq9vodNv61zGeSYaLaf0fLb24Hi2MM6IgpIbWhK
ef7MmRLwzWRq/xzIQ98LJBqFtXGOpHli5KyGfxDRtlKZJ6iLDSbYdz/kyBpJ+Rw4
3m0ttrD4Nvs2k38E6TdtKor9j0o9tQinJ5WF0CY/WNG6OZtJLf4=
=zCaf
-----END PGP SIGNATURE-----

--uO9faRlJ2TxQPnPe--
