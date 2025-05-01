Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E31DA53
	for <devicetree-compiler@vger.kernel.org>; Thu,  1 May 2025 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102840; cv=none; b=B7f0lhfvP9iKA5cUgkkPo6ns3dkIsvGbjc9PAqcRXVWjB86vC6Uvh0BXAsM2oMavFbU/DnkvqTtzwkGd1g/Bm9S9ui8Jt9ohbSVJum+QcE9YZe6EHFdHOHRt1pxUWqey2+71Kj8aCrP2IRhMzVHVw5LGpIlyV59YIrjDVMB14SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102840; c=relaxed/simple;
	bh=UbFuYtrZr+CszF5AHJRI2+ny9xJTk9fdYqUkgXDOxTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oETHhv5watqdVvq2qkVnWtsVUG3cZEX58kin3oj/3RsJOz8rt0mDybPqSskUDCpNCQaT6uaKw3BZVEvTRwbUcIFWFkUkbd3VepHJU2OnYb8Xb27LwXHq0af0B7daUOdQidbS8Hs+eP/xPrDukPcXiEtEKnbq/BvNub9ZKRWj2BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Z/cLkmZB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Z/cLkmZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1746102834;
	bh=FfWRZmugsvuRfR2xPjt2l0Ck8mkGpFsX3GGQPjfoi2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/cLkmZB7FaW3tayorxbQqAUytqM1pVzW1YioOiN8VNJZ3/BlEDXhO0HK24v3eeG8
	 +NbuhJhhssGi+fvTeTohXsU97sn+Ecv04xSihC8vzhsp00dL01L8aurUNwtOgI9j6c
	 O4hPha89IDWcpE3D98aTpQ+aoD71LlV8wpzQkNnZELiUxhleSKVjIMif0Ytz5srNfY
	 ZqdTI+vL8khQ5mEO6G+gyMxLWwA5iOhXS6uSOQs2tevwjU+VQblS/19AsKVRIwuJYF
	 wb7hr552xKp8zyDrEmQXsw7YxsNP4lUnGtYLp3Ub7g3khNId8f35xApYf2Ax6hucsB
	 /3ICASkXhrLyw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZpD4f4jrCz4x0s; Thu,  1 May 2025 22:33:54 +1000 (AEST)
Date: Thu, 1 May 2025 19:33:45 +0700
From: David Gibson <david@gibson.dropbear.id.au>
To: Eli Schwartz <eschwartz93@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v3 0/2] port python bindings to native Meson
Message-ID: <aBNqKYKOiT7WYYFp@zatzit>
References: <aBI_wad4TnNRCTWA@zatzit>
 <20250430152601.43554-1-eschwartz@gentoo.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NJaEW6DVES+9gDGR"
Content-Disposition: inline
In-Reply-To: <20250430152601.43554-1-eschwartz@gentoo.org>


--NJaEW6DVES+9gDGR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 11:25:24AM -0400, Eli Schwartz wrote:
> Eli Schwartz (2):
>   Makefile: deprecate in favor of Meson
>   meson: port python bindings to build natively via meson and
>     meson-python

Merged, thanks.

>=20
>  MANIFEST.in                | 12 -----
>  Makefile                   | 53 ++-------------------
>  libfdt/meson.build         | 32 +++++++------
>  meson.build                |  3 +-
>  meson_options.txt          |  2 +
>  pylibfdt/Makefile.pylibfdt | 30 ------------
>  pylibfdt/meson.build       | 28 +++++++----
>  pyproject.toml             | 33 +++++++++++++
>  setup.py                   | 97 --------------------------------------
>  9 files changed, 77 insertions(+), 213 deletions(-)
>  delete mode 100644 MANIFEST.in
>  delete mode 100644 pylibfdt/Makefile.pylibfdt
>  create mode 100644 pyproject.toml
>  delete mode 100755 setup.py
>=20
> Range-diff against v2:
> 1:  142d7e4 ! 1:  e5220b1 Makefile: deprecate in favor of Meson
>     @@ Commit message
>          true, we deprecate the latter and warn when you use it.
>     =20
>          GNU Make can emit a $(warning) on every Makefile run, which is a=
 bit
>     -    noisly but means we don't need to have every target depend on a =
PHONY
>     +    noisy but means we don't need to have every target depend on a P=
HONY
>          target (preventing built targets from being seen as up to date).
>     =20
>       ## Makefile ##
>     @@ Makefile
>       # Device Tree Compiler
>       #
>      =20
>     -+$(warning WARNING: Building dtc using the Makefile is deprecated, i=
n favor of using the Meson build system instead.)
>     ++$(warning WARNING: Building dtc using make is deprecated, in favour=
 of using Meson (https://mesonbuild.com))
>      +$(warning )
>     -+$(warning https://mesonbuild.com)
>     -+$(warning )
>     -+$(warning Use `meson setup builddir/ && ninja -C builddir/` to buil=
d, or `meson configure` to see build options.)
>     ++$(warning Use `meson setup builddir/ && meson compile -C builddir/`=
 to build, `meson test -C builddir/` to test, or `meson configure` to see b=
uild options.)
>      +
>       #
>       # Version information will be constructed in this order:
> 2:  5d0590f ! 2:  3490690 meson: port python bindings to build natively v=
ia meson and meson-python
>     @@ pyproject.toml (new)
>      +    'License :: OSI Approved :: GNU General Public License v2 or la=
ter (GPLv2+)',
>      +    'Operating System :: OS Independent',
>      +]
>     -+description =3D 'Pthon binding for libfdt'
>     ++description =3D 'Python binding for libfdt'
>      +readme =3D 'README.md'
>      +requires-python =3D '>=3D3.8'
>      +dynamic =3D ['version']

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--NJaEW6DVES+9gDGR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmgTah0ACgkQzQJF27ox
2Gduiw/7BMXrWZaTecnl3BtGG9mTRSudfAqJKvm6gJyFfVJvb3Z6qmg5MTxGKzk1
FvyBQe0es799EO3HM8YdW4EOxZNMSW5xA9Fq1S/hwhRrQWCw/qV2JkGdFbxJDWuJ
EMTUSGlHSU+X6GDszC9ypruhlV2WcBgo2U/p75Gkp8JaAWTm+d/W89PM3SaYOb6T
ORCf6eXg3asy5zl4IbIM/9+HO65u2GPjm2UfAgtcEjvrg6p5ieQREb6DO01FARB2
6iW6JXn3YMWSqhzySr/7AikhUqlEhNjZrKioB8zi9CZKIwlnFyEHGb0LFVWrbwcw
/q7GWYgz8rayd0Ok+eV6nEuBWbjqSrQrOTcv+b+3O1s89bCWzEZz2mAdaG7OLPIF
02I2KQaL7mjSgRfwW7LZBuWRh4ZTpXXBAWxCl8ljYsnwxVW/YlbKYM9VRucfwqA9
TLeJx9BMVRCYkONSLl0HT/eCuyKgRLGWoAlHobC2pEIRHxEKzbrnAlbRDz5qIqfB
PfaeaFSPi9P23h+FEPs4rMTAXVFU6M0R/j6HJeK5uDfkaKYapJI30iyGr66CNwzv
qfbVeADlM7atjRTGbkGtdVn+qQzEVMKVl+CxlU4ug/Q71P2Ug/yn1emiUVC5l8g4
ZP089TUqAiMUUvLT0WEMrRLRwSEdbIdiBRSZ1jsL3Ln/ww/oMyQ=
=l1uH
-----END PGP SIGNATURE-----

--NJaEW6DVES+9gDGR--
