Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5CD61FE9
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Aug 2024 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723428079; cv=none; b=Tf8SFgZ8ImKJjbUTRCFdYWmEu8/1u7TGlh4efeqJrmc2cHAX1ZVJWmDYE7rO8nv/Rg5Bcn4jvlS1R0IIJmudiF4k8NSB03xvyj4F/jCi9JC0j1ZwzBjc1OCB6RkAtfbocZY2GLVb7vBD51DbDRyvZeY48+BNZlDd3kQkT7we5uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723428079; c=relaxed/simple;
	bh=aImVPsgqTKr0eRsBHm5WuYEyvyUwW6runBxrd2Hvsq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfbV1pmVhSh5Wg25b7Gf5SIb+C0k5orbSQOr7tMXsTVGnWDouIIuH0O+nbp5V1+B9Y+Vb8FhBtYY06kINEyIAvK7qKibX73w5twQgq/HVLpQQRc19rFgh/M5DUFOk2bthcjeDVXOXa1BMlWPUpafbCtx3NbaIcDGCKvnTGNFefs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=flrOdwlW reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="flrOdwlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1723428074;
	bh=rh23f4ysP1nc6reR3xT0YnfG1/n+2graLJ6v3aQQI+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=flrOdwlWzhpOg7VeUdh07CgZTO59M9JcfdcxQwBaUwK49/xJrfer2s380MNiTeuXr
	 9ewZThLbuLmQzoGa8KrNlJvFuCZBF6S5SG3RIi+X1/8GsVOzKbR2FsofPu2kEHrIGl
	 Bp0RtYDU/SJ+LOv4GjrNV0uj6Q6HmbSLIhY5l9fuQzRlcjNVGjFIUld3W/FmaGK39p
	 zf9gw4sKp2jFEepZIrVWx73/tjCrPjp/vD53r+2YMAgRlSEYA4Cb1mUdQZoT6QPsOA
	 uPNsjFN/4881ix2WEuPTpxkKb91rpET6TmPwR4Dix2ct5Pl7dwTl8oqGn0VeXGapE5
	 LOI0Ew3yQfnBQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WhyRZ2tsmz4x8M; Mon, 12 Aug 2024 12:01:14 +1000 (AEST)
Date: Mon, 12 Aug 2024 11:40:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Gua Guo <gua.guo@intel.com>
Subject: Re: [PATCH 2/6] Tidy up some pylint warnings
Message-ID: <ZrloCpjnTfJvFA68@zatzit.fritz.box>
References: <20240811150248.7537-1-sjg@chromium.org>
 <20240811150248.7537-2-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8K0qET1yyat4O4sd"
Content-Disposition: inline
In-Reply-To: <20240811150248.7537-2-sjg@chromium.org>


--8K0qET1yyat4O4sd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 09:02:44AM -0600, Simon Glass wrote:
> Resolve all the pylint warnings currently in setup.py
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied, thanks.

> ---
>=20
>  setup.py | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>=20
> diff --git a/setup.py b/setup.py
> index 749bf1b..4e880e4 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -7,28 +7,32 @@ Copyright (C) 2017 Google, Inc.
>  Written by Simon Glass <sjg@chromium.org>
>  """
> =20
> +import os
> +import sys
> +
>  from setuptools import setup, Extension
>  from setuptools.command.build_py import build_py as _build_py
> =20
> -import os
> -import re
> -import sys
> =20
>  srcdir =3D os.path.dirname(__file__)
> =20
> -with open(os.path.join(srcdir, "README.md"), "r") as fh:
> +with open(os.path.join(srcdir, "README.md"), "r", encoding=3D'utf-8') as=
 fh:
>      long_description =3D fh.read()
> =20
> -with open(os.path.join(srcdir, "VERSION.txt"), "r") as fh:
> +with open(os.path.join(srcdir, "VERSION.txt"), "r", encoding=3D'utf-8') =
as fh:
>      version =3D fh.readline().strip()
> =20
>  def get_top_builddir():
> +    """Figure out the top-level directory containing the source code
> +
> +    Returns:
> +        str: Directory to build in
> +    """
>      if '--top-builddir' in sys.argv:
>          index =3D sys.argv.index('--top-builddir')
>          sys.argv.pop(index)
>          return sys.argv.pop(index)
> -    else:
> -        return srcdir
> +    return srcdir
> =20
>  top_builddir =3D get_top_builddir()
> =20
> @@ -42,15 +46,18 @@ libfdt_module =3D Extension(
>      swig_opts=3D['-I' + os.path.join(srcdir, 'libfdt')],
>  )
> =20
> -class build_py(_build_py):
> +
> +class BuildPy(_build_py):
> +    """Small class to run the build_ext command"""
>      def run(self):
>          self.run_command("build_ext")
>          return super().run()
> =20
> +
>  setup(
>      name=3D'libfdt',
>      version=3Dversion,
> -    cmdclass =3D {'build_py' : build_py},
> +    cmdclass =3D {'build_py' : BuildPy},
>      author=3D'Simon Glass',
>      author_email=3D'sjg@chromium.org',
>      description=3D'Python binding for libfdt',

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--8K0qET1yyat4O4sd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAma5aAkACgkQzQJF27ox
2GcrCw/8C8XxCp/TuSIgSDuBgF1AUJahMoBQZF2XCT1FZtoAcZT2RMgWYz535ILA
0P/BT3yu4AuOhiOBuoRiOB7juaC1inRGuaTaZHyAuOmQPa0Jk9ePnEF53+VVAW+S
XXUza5WPu9J2EXJBpjN6o2pAP9rb2FllRE1CWeXER2XoD/qjBUoTTCVGWBqqdPLc
MQ/QgaSsatHHFgNQwJBiZXja8IZCj13TEsyCuVVOsd3lHnteZaORWewKxExEKqu/
Uhh1JctY1IGaRxc1fVsbj/Jhd4SntqumyCqWoagKKyxYa/KSFrpuAbrRiT0bqQ/g
BdTT9DfymNKu8pNOdsCSYdhE5JpXRtS9/Pj8EaNndKmwBz0bJqLozCMcQ/P7T1/N
Itt7YP5+5kuxBXtnWWtb9LUBzCwSskfXtbrfaTww/WEODJGsL8XxL9H59RSknd6k
no71GcuHU0pilkke4JVTtnPzkoqQ1wA5QGP+eJUW+nmuPW01NJJIpS76TdfE60Vs
H21kP48BZk767601mGOEAATqhz3Mb4AlaWOdEhKzoetkRlT7Ccn/DVXO2E8BDnvw
wzw1HCytF0KdG6BYj3yz1S7ja+lKTcYKI7uanOVJ5xg1jtUrSPN6zWESwTOrQiiX
3xR5dPl2YIq+FoJmyFdqXw/ook7zh3qCbiz+4KVCJ6ZQyJl/x2A=
=MRAv
-----END PGP SIGNATURE-----

--8K0qET1yyat4O4sd--
