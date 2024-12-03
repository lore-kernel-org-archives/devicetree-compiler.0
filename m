Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F370825
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 04:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733201206; cv=none; b=F77foy69+bMHVGVYvvJMLCQc7/WKxCxEZyvwWlS4Vd1YciCV1QK2RpRVyPWg6R7TE/8RA+kOjLsJzG3VmXy861C1FcMM8JJ2o77HJ5Zh1oq93fPERqXJ6V5pJ7HLz7zexGb8nldEDFEkJRqk9VM4GD+CXBkHP9pN4QHwt/7SfbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733201206; c=relaxed/simple;
	bh=cXav+TXFrTR7WOFEd9Jj0IJtxi9irnMSs1EGuTT+uJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGiHmpGRkW0yU3D2TsThad06OVt2dx+DPOCTgUDLsuH4jPrpWZX+v7nIi1NJR0j24S4HU1kf0KF1tVNr2S08zwOI2y2c87XGzVlkGCzJJiG9qIbGN7roVjq0WabpFstrms37qUa5dXNET15sdSkx5/sRtcOhk4pQDCQwu0XB7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=fYRsG4qP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="fYRsG4qP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733201192;
	bh=6Fsg9CsGQlZ/HYC7Dmk6bM4yJDEas2eerQv6cKOrHPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYRsG4qP8rYVgD+sd7dm7dJnQHNC+iZtr8KkX151RxXTOyXQy94+rCpg3LUmofqR5
	 g/de+zOyz8gPCiiOcf/k7yKhWmEYO3vAk1zxyiprBuUXS70V3GEBJjwFhWm6vDRN3g
	 y6sGUnGE5aEn5A9a0fbQrWdLipSTbYpIAJzeUepTiEqtEHfLFApTPF5h9Zkafpq5/t
	 HeFpmT9KYtPvjlcWTujD4bhetMxkpKx2yBze1W9ANYzKboYhnx256Y+Tc+/+RdPk9D
	 bsMYtK3w+xNKdaVQ774btRsb6VRilLnz++CLq1t9GSsxs0hez8PCQ5BW5F4AQL2PST
	 Rwor0qu7oxRfg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2Sm82d1zz4xCy; Tue,  3 Dec 2024 15:46:32 +1100 (AEDT)
Date: Tue, 3 Dec 2024 15:38:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 4/5] tests: Fix overlay tests
Message-ID: <Z06LXBIZfndCnXF7@zatzit>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-4-ac3e121359e9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GqVZbHXJUtZVR4K+"
Content-Disposition: inline
In-Reply-To: <20241116-overlay-path-v1-4-ac3e121359e9@beagleboard.org>


--GqVZbHXJUtZVR4K+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 08:30:22PM +0530, Ayush Singh wrote:
> Fix tests broken by introduction of fdt_overlay_prepare()

You should fix the tests in the same patch that broke them.

But.. more to the point, I don't see any reason to rename
fdt_overlay_apply() to fdt_overlay_prepare().  And indeed doing so
will break the ABI.

>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  tests/overlay.c           | 1 +
>  tests/overlay_bad_fixup.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/overlay.c b/tests/overlay.c
> index 2d27918a336939743c4ef6bd0c9b93d1e9dfc8fb..9d387aba8f85cf1b5a3d39761=
3708b5c82655b68 100644
> --- a/tests/overlay.c
> +++ b/tests/overlay.c
> @@ -203,6 +203,7 @@ int main(int argc, char *argv[])
>  	fdt_overlay =3D open_dt(argv[2]);
> =20
>  	/* Apply the overlay */
> +	CHECK(fdt_overlay_prepare(fdt_base, fdt_overlay));
>  	CHECK(fdt_overlay_apply(fdt_base, fdt_overlay));
> =20
>  	fdt_overlay_change_int_property(fdt_base);
> diff --git a/tests/overlay_bad_fixup.c b/tests/overlay_bad_fixup.c
> index 029bc7982d328b0dd538dd30f066ae414b989232..2f7471a60d926a959ac5dfb66=
ef02712259e1a4d 100644
> --- a/tests/overlay_bad_fixup.c
> +++ b/tests/overlay_bad_fixup.c
> @@ -51,7 +51,7 @@ int main(int argc, char *argv[])
>  	fdt_overlay =3D open_dt(argv[2]);
> =20
>  	/* Apply the overlay */
> -	CHECK(fdt_overlay_apply(fdt_base, fdt_overlay), -FDT_ERR_BADOVERLAY);
> +	CHECK(fdt_overlay_prepare(fdt_base, fdt_overlay), -FDT_ERR_BADOVERLAY);
> =20
>  	PASS();
>  }
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--GqVZbHXJUtZVR4K+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdOi1sACgkQzQJF27ox
2GfrwhAAhAXYfDldlY124baZo/2D6RYNrwSdvArvYTtzTvbTOrIbq9UmsDIOglxW
g0mRj3WoWmT9wWd3lX/aGJ2C5sycnpEWAoU1eVvyhsDzs0lpbhrdyXiqOiTBxriZ
KLgMS3gxEor1/aIB2cg34HqqqDmeSZgwJL1NJ8a1+la6UCqEMWaXxLILmp1xdYs9
A8cJNjCvIbJQp991BULBR+Hc704D634VtWbFiB9ooCiPEMntHF4QbYyrWD2l/LRZ
2Pm3PDnZ/YDflDepeTOM8e5cbHs85HD8+V8O7RQ4m8ww5pELorg0RkMnEUBLEwf4
PgU2Z0TSIQOq/LRpKfKCCaYOLzD8mbMNm7uCVupOJBcb6OFW7lierkf6C7HEyve8
S+zsGa6bpUI5vTz8Igp2T2fmvQNutR7ZfLp3vHzHTgUp9iXt6ti7SAEO5JNyMAfm
hHwThgw6NO3lgXNyb5WWDliy5v9Uc/jQP0GibpLhtA42LpX7ITfmhIzRLaVC9rHM
9SapLPYejwZL2KtzjAzhB3flVpD5O1v8iCMzdOoY4mUDGWt4wenwthHcyE5YqupM
YqLUgOUFtMNID6CN3vJe627c5+zzcHQoiXZZcJrQEwgg+/AxXMVlVryBs61cd5Gy
/2T3wrGJsvSa/PO9n7DWaAmksgbp0gwlsqNKc6XEwV+vuIS2S6A=
=2Arc
-----END PGP SIGNATURE-----

--GqVZbHXJUtZVR4K+--
