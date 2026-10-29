Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236657;
	b=Jy7wAd3yWnj1OGZ8fjEitUtEkSxMC5iB0azjKjAV9u0KjXNhZ7Q1habEkroiAb/aD7fc
	 BOZPRZSM1NV152GHWwJLxlQi1gCoLF54pvu67iN2WBbAArJj72I531MWQez3eKtkdy9JM
	 3jKsdCiicFoWnyt2mxENXZF9Win2HWPnjv4+GxRMncWgJwRhZDZBCiBY4vRI55RPY1u5Y
	 eO4ORHOubogMyomFIb9XopzcN12xfQRcfmU+LbQj38zjibhhGWbFEKLTQvVzInsSjdiYZ
	 3lNgeOu41gQdMifY3KZ8ZeycnvdxndZ/qXvx8I4ysFoNiDUbErG+F1x06+tdZI3R+jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236657;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=5irHKoZsvv5QCBfN9D/UEw+7IQ8nQs4FizANaCElzNA=;
	b=ZcfrijmzZCUWgMbGk4BNqvEeOxQmcXhYKMUTCrsj4rozTSTEe42gFLH3IYrl3fOVCVRX
	 +AbttlxHbszvuiWd06i9K5AUo4PpTvY7wLjYUlPHIw2dFTRrXKjG1QKdkWYOEDWHT2ABn
	 aGODuPKIiOIUhE3Cgh5I/XQpX7KNJibg2fuXtxEssOfiSNBqT6ikrGu7yLitZ8yln51Kl
	 OebjEbgtBcvXtqNEyEElDz23bIl76IZ0w5Fn0q0X8FHopmxeYVy6t8DtN4SbtjBek0Tbt
	 85MabeqS/D2fsjBu4RBhoKdGMd+o75sjABNBfwsJBOvowNG/p6kofyFn5tQnB63dFJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gM6MDw9X;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC00A606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 01:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC00A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gM6MDw9X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793236654;
	bh=5irHKoZsvv5QCBfN9D/UEw+7IQ8nQs4FizANaCElzNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gM6MDw9Xel4kikXUEXJLb2vUeY2aZKxRZfmspiSRJZLLSEMD+S3yTm2m3GFqM3QIF
	 UUXD2tJE9yMHANs0LZqEA86nH0W4dbQrJF4h4ttMsmCXGkxrYUX1xzefUWGzHjrJVB
	 VWjeDmCAA8fwI3dxAHS4kFOZLMFPr7H7hR5YO8KuP+QtZM4usHwAq4BN8NE4CSZXQU
	 rewSRI3PXyojkGNGOdGv1lA1Vio1N2c1pByBEMXdHU7JIt7zmtiem/UPoiZYycS2HZ
	 ERDd0FHRKjHwrFEPptn/XWTdfOSaezdXotabs1uu/1RMPdccFLfH4aqFiJgrC9yaPd
	 9GNkCY9ZglDKQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jFRDG3PV6z4wDm; Thu, 29 Oct 2026 12:17:34 +1100 (AEDT)
Date: Thu, 29 Oct 2026 12:17:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 2/2] README: Use meson in the Python section
Message-ID: <auKeowlno9ud_XEC@gractus.seuss>
References: <20261028112007.3980089-1-sjg@chromium.org>
 <20261028112007.3980089-2-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wy1UNIxnY7cvURkw"
Content-Disposition: inline
In-Reply-To: <20261028112007.3980089-2-sjg@chromium.org>

--wy1UNIxnY7cvURkw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 05:20:02AM -0600, Simon Glass wrote:
> The Python section of README.md assumes a make build. It installs with
> 'make install', disables the library with NO_PYTHON, and runs its
> examples from the source tree, where make puts the built module. With
> meson the module is in the build directory instead, so the help example
> quietly imports whatever libfdt is installed, and the coverage example
> fails.
>=20
> Use meson to install and to disable the Python library, and run the
> examples from the build directory.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
>  README.md | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/README.md b/README.md
> index ed9039d..fcfc2e5 100644
> --- a/README.md
> +++ b/README.md
> @@ -37,7 +37,8 @@ distributions:
>  $ sudo apt-get install swig python3-dev
>  ```
> =20
> -The library provides an `Fdt` class which you can use like this:
> +The library provides an `Fdt` class which you can use like this, from
> +`build/tests` after running the tests:
> =20
>  ```
>  $ PYTHONPATH=3D../pylibfdt python3
> @@ -59,7 +60,7 @@ You will find tests in `tests/pylibfdt_tests.py` showin=
g how to use each
>  method. Help is available using the Python help command, e.g.:
> =20
>  ```
> -$ cd pylibfdt
> +$ cd build/pylibfdt
>  $ python3 -c "import libfdt; help(libfdt)"
>  ```
> =20
> @@ -67,9 +68,9 @@ If you add new features, please check code coverage:
> =20
>  ```
>  $ sudo apt-get install python3-coverage
> -$ cd tests
> +$ cd build/tests
>  # It's just 'coverage' on most other distributions
> -$ python3-coverage run pylibfdt_tests.py
> +$ python3-coverage run ../../tests/pylibfdt_tests.py
>  $ python3-coverage html
>  # Open 'htmlcov/index.html' in your browser
>  ```
> @@ -91,20 +92,21 @@ host system first. Generally, using `--user` or `--pr=
efix` is not
>  necessary and pip will use the default location for the Python
>  installation which varies if the user is root or not.
> =20
> -You can also install everything via make if you like, but pip is
> +You can also install everything with meson if you like, but pip is
>  recommended.
> =20
>  To install both libfdt and pylibfdt you can use:
> =20
>  ```
> -$ make install [PREFIX=3D/path/to/install_dir]
> +$ meson setup [--prefix=3D/path/to/install_dir] build
> +$ meson install -C build
>  ```
> =20
>  To disable building the python library, even if swig and Python are avai=
lable,
>  use:
> =20
>  ```
> -$ make NO_PYTHON=3D1
> +$ meson setup -Dpython=3Ddisabled build
>  ```
> =20
>  More work remains to support all of libfdt, including access to numeric
> ---
> base-commit: 1d50f3f8fa8bf9429eebb0769dafa5df37381ae1
> branch: readme-meson
>=20
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--wy1UNIxnY7cvURkw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrinqMACgkQzQJF27ox
2GeLZA//RJ4Dtfhh3CVD6SZKQmQRQB6iGBCkyPVtW9jY9HUrXFhbLi8jlkkjyBux
todJuxLh/W6EfksvqVnaN6dbAh3zZWthpEx02ggrmz+DdeK+jdAetTNMmsmlQgMM
8JhnhnD/zBWSouEljxpf41njjr64u3deE2K3Fm3lkteLCzUFJsO7ZeXfo2ffKHSZ
QHijOQDPOufoeaAYD5BjLtXAD6A+a1nJ75Wnj9C1nUatAD0n1cKKbfNdlOC/VzFC
9F+cx0D2moYs0g8pdt7cW6OFfAvk9ls3nF4oJCJi8t+TWp3CqiB0R5Iy3lmZBwv1
HIfif0PwZpBXIdu0q2cb0bcbv5FSYT05u5Kc+lptRgUkkL/6eXdNteo4k9TDBTLt
FPbP0UGh0R7ZQkfLoqu0ihBVFr9ZO36+Yms6R3DLv85crIrKT1DIGvJBTs15mnPp
5XTsAd23WHCQF8q/d2pGKIozERB79ZjTdoqbPguKhY7TpUsESH9zftoGVwpf/UAO
F0fItCDGi/CAHzTVBPX2xu5PyD5liwLR7Wgdku15uAHsbG2ULSqZAl5fsplq1D8t
Tc/pj58DVVp01pJUCwy/wwMrafkIZ4l57bdVN++s9ltnkUHEcEzJKxSvT6X75eJe
r+LMKAPLG73mjxLZX1t48qmyV3atjbnK7ORwTjWUOvckwdrT3oQ=
=nbbu
-----END PGP SIGNATURE-----

--wy1UNIxnY7cvURkw--
