Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC59F61FCE
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Aug 2024 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723428079; cv=none; b=L3Oz8cOK6vurI+lxL8VOrlxmULSp3ZCSABO06qKqa82oG7f5dyHqLBXz0v9OYqf+hfWOSHs3m9Ej1Etu/LyIYLKX0Y/IyWdeyOkBDnLez537+s+A4I4DZaMkdblKWMZJMNuj2ze53coKMNzmpOuEknUYvtGRJUSSnGUAjcWsSvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723428079; c=relaxed/simple;
	bh=pYwBP/tfja2jbsv06pv+LT5CgriASwuoCSec+nSaBEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1p8t+saQsxThEDiHxa1y/ylSY5VDRVPKuxTHo7aQHRlNI9uk7k5J8OYZWw31n/NtOrh3U03mFSntE6yEUnq5HPRyfTx7g03lzmxafeYIOC7+tN0FtPBm/9EOjdEVcrLow6pyK9kE6mI30RdzKVfcAEnvJuI4n3YKEFaaa2G54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=WlzINDrx reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="WlzINDrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1723428074;
	bh=H0/CjrK6tj7FVABRTuB3HEgoz7rwpFrutfvVEbQwVc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlzINDrxxf2DzGOif4DXMllaqfkeRYek7UXElWTTPnRhhVoAeiiiqWHD5Hl4tOdzU
	 MlLbrhW9dX8UBdI7GvkB8YsBuSnGkQ9g+SWYewfz4IoQA4POSIzVMLWo/LA0VS9zHZ
	 yLcZWVngygjdX2am4YZqhdmhRZnWQQFQUc/JEi6GwuLzWALkLP1S8PiM5tvdcuqdUy
	 t/hqtGLg8ThIj02gDGXsP46L0SR+uO3L0o8uEVPSYMa87OkAgDpKSaOhJOJt44I3Ii
	 dPOKvGiyfHNaSjc2ZWD6Wq0UWcV1Z1RT3I7kz6HxI+81MVXH30GKP1/83Vanp0BP7b
	 5N2zK4PX2abPw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WhyRZ2pHbz4x8Q; Mon, 12 Aug 2024 12:01:14 +1000 (AEST)
Date: Mon, 12 Aug 2024 11:39:01 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Gua Guo <gua.guo@intel.com>
Subject: Re: [PATCH 1/6] Require Python 3
Message-ID: <ZrlntUe7IIEp1P4B@zatzit.fritz.box>
References: <20240811150248.7537-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nT64aLbt87MCEXov"
Content-Disposition: inline
In-Reply-To: <20240811150248.7537-1-sjg@chromium.org>


--nT64aLbt87MCEXov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 09:02:43AM -0600, Simon Glass wrote:
> We don't need to support Python 2 anymore, so drop the comment and add
> the minimum required version. Use version 3.8 since I am not sure that
> it works on older versions and 3.7 has reached end-of-life.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied, thanks.

> ---
>=20
>  setup.py | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/setup.py b/setup.py
> index 293bb6b..749bf1b 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -1,9 +1,6 @@
>  #!/usr/bin/env python3
>  # SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> =20
> -# While Python 3 is the default, it's also possible to invoke
> -# this setup.py script with Python 2.
> -
>  """
>  setup.py file for SWIG libfdt
>  Copyright (C) 2017 Google, Inc.
> @@ -60,6 +57,7 @@ setup(
>      ext_modules=3D[libfdt_module],
>      package_dir=3D{'': os.path.join(srcdir, 'pylibfdt')},
>      py_modules=3D['libfdt'],
> +    python_requires=3D">=3D3.8",
> =20
>      long_description=3Dlong_description,
>      long_description_content_type=3D"text/plain",

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--nT64aLbt87MCEXov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAma5Z7QACgkQzQJF27ox
2Gei6w//e+B3JucEJfR1ByuULXX040cppHzlvK2sWtlCHqS5HyQW9ll2stj6x8il
KtZQ697eWolk1/b5c5fxh3mXaPgjvzkiX9noQf9/PMQk4KP/gLHF4z3d5w0J2f+S
PBw13WKygJr8bxePUNpBCgYPYuBsxq5mr4+2/Gs06xp6072oYpM42W2zJ4h8H8Pl
OptOTyDykDJ0JM0ezJuE89v7R82hK/0N7zJCFKhSJO4dnaS5vechPF0q29lqs8ny
aPAmZj2vf47S4Yc+KHkR6TIEjC8/wfYCM7L8W/zEW8D/Lo46ywIoFUXGk5uDHWpC
DetugeANRcfD8eCrnDFq08isdDBFIOrtrlZhw4Y2niMi4rjHutcQ7RWaiba20vPp
NtgL+pBtvAA3WrJ/kBsqb9RZN1ucbL3UQDkO5rxBqTxoQF5cpDf8BEfZPmg96t5j
abn0iUdKvrVJGcm7zfAeQzpmsYeglnUd9xFTcOnZrrKMHglENYOSR6YDAU7DGr1U
k5ccXxztMLS50kKVNZTiz6j8WJiLd5RGS+ur3ihN4vfI+UEVU3uv9qQJ/6pXYKez
PCtaZH0rPfAWPB3epCbDcQ1W+hd6jXGqhbGHhpKZYso5qJozkB15w9ruRfG/n2si
4WDnZV4zVM+6rRbP/paGdinY4QybJ+hfC9U5c0Tt1LnWCGQ4luo=
=GijE
-----END PGP SIGNATURE-----

--nT64aLbt87MCEXov--
