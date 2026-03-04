Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE8A55;
	Thu,  5 Mar 2026 00:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772669053; cv=none; b=anBk6IKuxHaafgPHY943OV3wJtUp7dkg8bl7Sl5FcQ1Nl8QOnr/3id9QwX8bgMrVCU7bS+8WHmQPjvqKo5+X8WxMYHQr59ihnM7B+TUPN/twZPv+oU49WskQU/pBDbbMqeaTrQOl6u0VJ4yJjVqq2GEJr8arFPn8S9u0brYgbPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772669053; c=relaxed/simple;
	bh=/503LLqVy3WTDbGK0D7STcgdReP+YqV/W/6roS384Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiRsctpqxPo5gFiYYSP+2q8cW0DRQW/dIjnso23wfX7ZyL9FS7QVEns8MNb3eLiyrImaWkcgDeaiUCj7TKVMz9No7Z27m7fR13xhhttzruFlNynoH5B0gmzweTiiObHrq88reTEOmIq3j5G5ma6wypQ2SVy2YGcRKR16DixafGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=YJp7+LSY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="YJp7+LSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1772669048;
	bh=ja4+3AO8i+hm8FtkICeQprQ92Y+QbD0jQKRtBLGDDQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJp7+LSYNB5eY2T1FXpbqS0AuFqrb0znTW5REabu1ftylbwfSKb8iEU7Wn5y/cQ/m
	 iFlEEdQMGrUwK82tYqE94WI5ePvU1EJW/dPrIgTJuA1O7zLw4UcG2xBGFarxxwtbtH
	 sLLyM4IRRWhEugWXIMehrR6HvsBMwBrUcFYylpeUghSpY3lpMIjIUNeMKynlb428x0
	 ms+SPgCtsNEW47PFwgLGEKuLpZ9hwLxCE4h8wvLNtnOyYysDT09qsApHluFMzoP7R/
	 1c/6TcBRAaQX2/Cqux7XUF7QFMp68X2AxHLkRpMrRHdy0b8bjZOiMGMMp8x5qBtGdu
	 hT1htSxWb5H6g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fR8sN0RJJz4wBD; Thu, 05 Mar 2026 11:04:08 +1100 (AEDT)
Date: Wed, 4 Mar 2026 21:08:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 07/15] libfdt: fdt_check_full: Handle FDT_NOP when
 FDT_END is expected
Message-ID: <aagEsn0RMGVRFRRO@zatzit>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-8-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pAL3Zc8TOJ2/WxD/"
Content-Disposition: inline
In-Reply-To: <20260210173349.636766-8-herve.codina@bootlin.com>


--pAL3Zc8TOJ2/WxD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 06:33:35PM +0100, Herve Codina wrote:
> fdt_check_full() makes the assumption that a FDT_END tag is present
> immediately after the FDT_END_NODE tag related to the root node.
>=20
> This assumption is not correct. Indeed, FDT_NOP tags can be present
> between this FDT_END_NODE tag and the FDT_END tag.
>=20
> Handle those possible FDT_NOP tags.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Merged, thanks.

> ---
>  libfdt/fdt_check.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index a21ebbc..cca0523 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -43,7 +43,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  			return nextoffset;
> =20
>  		/* If we see two root nodes, something is wrong */
> -		if (expect_end && tag !=3D FDT_END)
> +		if (expect_end && tag !=3D FDT_END && tag !=3D FDT_NOP)
>  			return -FDT_ERR_BADSTRUCTURE;
> =20
>  		switch (tag) {
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--pAL3Zc8TOJ2/WxD/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmoBK0ACgkQzQJF27ox
2GdFtQ//U5GPbKxzxDk24NbMmRtkOgDqjXNrMkzCqsBmfhYsj5QrjCf1orhp+amh
pZV0oz+JNKtTohd5CHb9p443WJWpXB1xSFXtAMBCWgI3ncxSwtyeaeBsA1hpx1SL
1oKw9rHWTDkJL8FiuS6F/dBOAT8VH86a/0k4hUlhxjsB3tjWrjo6W4v6Li/eA/vs
XtKY7ZkOE7G/BDe5DxDuugbXwuu5ZbNTdDLxFlcCCVWG0Ll+RL9TwBNkuAHRkZy6
PCe/1h0YooDOFHFdl3bY6W5dBf4sNspkcUYPMQ5DcWy56J0KEdwrlWCeKGYdPnfb
HH/xFeDcwXybcbt5Vt4b+qOG5/lgX1/+XnX8L3M4wpvlhc/NQJ4wpwA2yisA0xjC
dN9+Yew1yrHjCj7sQvcE+WELYGzuoay3tnUowOc9yIKINQEN3iC0H3AhmRI4jEJD
EzGjPQO59C3zwhmvfUA5PgEujppUd8PrliHQKlpRM+/oQ8HbrdTLVX8qb5fJxGdt
AodFrhU8b0FkgHsfAB+BKozAcG3O6U3lcdqqkor6e0ideGnMTeFSTIv7ZMcWtOyu
QNnYprKmus+McRz+f2SObD1DWFszRtt7+c6EmPdMFKSWz7t16MmH66tt/ulC/UQd
z3k7N4SHlw8ZSlynJXVwbKaRZvRC5g6Cmj3g0Czca+fKouTTCoE=
=86bb
-----END PGP SIGNATURE-----

--pAL3Zc8TOJ2/WxD/--
