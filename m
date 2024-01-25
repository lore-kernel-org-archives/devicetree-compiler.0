Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10B95C9A
	for <devicetree-compiler@vger.kernel.org>; Thu, 25 Jan 2024 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706152672; cv=none; b=RWiAeFrcbEMkjFPlVvvjzg2/WMX5ApBwGacH5J/4paqh6z7RlRGKY0zJoCf9rWfHVY/M0TZ/PHCO7GeS/QwC5wPK5EEixZPpaDXnVmgY/GGSqz2utqzh0DdWxjTMvT4cRHo+bmKyTcmDTa8rkzj7j628a/Gn6jkbWQdwU8AF3WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706152672; c=relaxed/simple;
	bh=9hIv1tLEvd65UJxQj3Dn4QsMkeTmcDrbPfnneglTwtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spRuMs2C+n0x43qSAOVdrEuiyI8OUHcOSfwOS2T2UHKGB9L7BP5mx2eBGcsrUJOjpT8L156LXR0ondzG7QdcLuw6jeyLyD0Bh8mucVaBU4XNBWcKSAqsNIMxP2BaxKMMaNwoe/TYtbJgI41kUIfT6Mtz9mscX9vGZVptWq4ZZLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=aWwUQomw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="aWwUQomw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1706152666;
	bh=LYsNg9PKd8jAceFa2hduDhD0eLWE8bYPkX+aKETNSQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWwUQomwneCxxu0BZSr5wXLDzIQjZ/tpOd4ssjEzGfb4F+owb5CTXaVV8n8Uk4vet
	 X8tjchlL8KOI8gXXaAGT9XnmMeIqPWoDYn1PCpEvryWdQCHetG2BOzH3cIMvsG0qXN
	 5/UguaNa2PzbeydVdpD+XCMcCIdstJDN3r4cGr8F2jFWjkKmBBWjVYPXzZq0oSBMYb
	 7mA91m2YVJw+VOhOLorVtNjgn3rAsyw0qSLNk6pC41KLUtTgkNI7k18q8zoU/zNV/m
	 IGnS9lJQP0IrQE04dCwU3zu9Iq8koCGHgYhIWF6MOQj6JNEWReQGtIh8B39f28Uqqh
	 p583XHV6OOk1w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TL5cB74Msz4x2T; Thu, 25 Jan 2024 14:17:46 +1100 (AEDT)
Date: Thu, 25 Jan 2024 13:31:46 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alyssa Ross <hi@alyssa.is>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] tests: use correct pkg-config when cross compiling
Message-ID: <ZbHIEp5s-ZJ-kFG4@zatzit>
References: <20240123130409.181128-2-hi@alyssa.is>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HpC/qLNaf4HdKmG8"
Content-Disposition: inline
In-Reply-To: <20240123130409.181128-2-hi@alyssa.is>


--HpC/qLNaf4HdKmG8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 02:04:10PM +0100, Alyssa Ross wrote:
> By convention, the PKG_CONFIG environment variable is used to tell
> build systems which pkg-config executable should be used.  This is
> often used when cross compiling, where it might be set to something
> like "aarch64-unknown-linux-gnu-pkg-config".
>=20
> Signed-off-by: Alyssa Ross <hi@alyssa.is>

Applied, thanks.

> ---
>  tests/run_tests.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index bb2ec95..3225a12 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -32,7 +32,7 @@ if [ -n "$NO_YAML" ]; then
>          no_yaml=3Dfalse
>      fi
>  else
> -    if pkg-config --atleast-version 0.2.3 yaml-0.1; then
> +    if ${PKG_CONFIG:-pkg-config} --atleast-version 0.2.3 yaml-0.1; then
>          no_yaml=3Dfalse
>      else
>          no_yaml=3Dtrue
>=20
> base-commit: 95c74d71f0904235d44892627322f60a18c9a28c

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HpC/qLNaf4HdKmG8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmWxyBIACgkQzQJF27ox
2GfWPxAAkduqRZDHwzKgWoB8AKsTrlvGr6Tf/KlMuUFk2CdcnnJ4Et3/Vk9I7cvi
F36NA3lb4gjtnQxRySd7hL/fsfM1H8+z/E13JcimPPhVBo5VyrRQ11GQ7R6zENYp
Y1nn1PlcyD0ElaFn41CqgsqAMR1KfC3cHaE9EshfSrOqS6z7zIrD4aisQfbqWGY8
cnDmIU2ToaUJWQDHzvcQTc9hBc2yL0FXMFSUWo79gTbRRyQQmDLYhvqPlp4ABvvB
rWRZVeEmamp6tifjcLeWIPHLGqLzPruzL3HsIGF7T98H4In+kMjbomH+joQoBUkY
3RHVp3BvFhZDgOjjYgRUEj2BaIUUpTGQPHnTUOLAU95vP9y15IsOgwfw6sYLgluD
SXMp8naVU3KuNrUXFXxrZDJj42bAN2/R6TfnKdCCp7pSf+CUW7rwIF2cj0h/vtFD
B/pywVbicdAv0EuynzxQFSaSSQ4kDSupIPv5uYjVsLF1gG1mAgiWPjmm1TzB4jj7
PEjl6r2Yk4t11W3UD0xc5Nuz3EmZpGSKeHSes2ywHRmyFE7O9q2vF7ACig9WY4Dq
jOHppw9C/clb5prNi7kw5CiqGG237tFFHW3aRO86RBG/Lq7xv0bYSqYKGQZF/Kvx
odAH+qu5U0duQNdkSmu9t8GpAXc1hTFM1kjmyDx0KXb4Z4yt1Bg=
=wqIk
-----END PGP SIGNATURE-----

--HpC/qLNaf4HdKmG8--
