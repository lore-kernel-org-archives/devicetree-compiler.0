Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5243FD4
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Aug 2024 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723428078; cv=none; b=BTFOitDtT4LU9vywt3ik7Z18R9g4qEYslPlSdgl+kUJ+SHS7VdgURL6f2HxdBX3lpw2tdU/5zgKguM/Lq6XjwZhrkLwQ0SzooA6LfmsXUyNv6jVElpEfR9wGXIauadusknGsfJMNo2a2U1L4ynX0CFcG7JtPum1Dasb3EJI+wqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723428078; c=relaxed/simple;
	bh=Yck8O8tylPcBT57n6NE3Fo8OvD46bGSmBaGK6E7EAWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcjC88rSd92STJK/2sT+40TxF31SFetrfNvmHWgmcX/OQYp4Q0xCmJyKaJNWUrXrZyvoc1hLOmLYlcmJkid4nlQqGwwC7e7RXCNgpFaCUK8pKm7rZgkRRzjSXEQ7rdnlcOhv/wTIXojDVFKoilMqyShE3zWHEb9CCuRU0WBiaAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=R5A9jQas reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="R5A9jQas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1723428074;
	bh=2ulSCQp15zuaAX4/ixBNf1P6yR1X5egNOriNSPmIvwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R5A9jQas3T0A1+kW3J7gVFOdUsg1yoaS4tt8TikjlO6rHzgOOY+FNPmdDfkDXsh3n
	 cVWLAM2UMsiuFQahQ75vxfhjnKlNisxTVQM2Qir3XO1/jilBZNPbXJE1uHc0pVLLWG
	 67FNFe+3v0zyJLMdh/0XimHfvlmETp0xP1nbUsZV3gV9p58nT5YaugAFQTtbbXFQ3S
	 P2WOb1iUeoSI+Eaa6ukrVn9LkS1IyLbh/u7SpOeEv7pzOJYrQKC34U/Qn5cL6uNTJ4
	 /SBGqftFR1DKe1Yuitnhwzc8lDeTDNBB6wun/lLenmMxmbGTXVDMdRKKHbvIpIbIEo
	 kt5QrPuogqTvg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WhyRZ32x6z4x8n; Mon, 12 Aug 2024 12:01:14 +1000 (AEST)
Date: Mon, 12 Aug 2024 11:50:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Gua Guo <gua.guo@intel.com>
Subject: Re: [PATCH 5/6] setup: Move setting of srcdir down to the bottom
Message-ID: <ZrlqTE_uoCUiY8nP@zatzit.fritz.box>
References: <20240811150248.7537-1-sjg@chromium.org>
 <20240811150248.7537-5-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cukxC1xFA84h23tM"
Content-Disposition: inline
In-Reply-To: <20240811150248.7537-5-sjg@chromium.org>


--cukxC1xFA84h23tM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 09:02:47AM -0600, Simon Glass wrote:
> Put this variable assignment next to the others. Pass it to
> get_top_builddir() instead of relying on the global variable.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied, thanks.

> ---
>=20
>  setup.py | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/setup.py b/setup.py
> index be3cf90..52844ce 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -14,8 +14,6 @@ from setuptools import setup, Extension
>  from setuptools.command.build_py import build_py as _build_py
> =20
> =20
> -srcdir =3D os.path.dirname(__file__)
> -
>  def scan_for_info(srcdir):
>      """Scan for the version and long_description fields
> =20
> @@ -35,9 +33,12 @@ def scan_for_info(srcdir):
>      return version, long_description
> =20
> =20
> -def get_top_builddir():
> +def get_top_builddir(srcdir):
>      """Figure out the top-level directory containing the source code
> =20
> +    Args:
> +        srcdir (str): Source-directory path
> +
>      Returns:
>          str: Directory to build in
>      """
> @@ -55,8 +56,8 @@ class BuildPy(_build_py):
>          return super().run()
> =20
> =20
> +srcdir =3D os.path.dirname(__file__)
>  version, long_description =3D scan_for_info(srcdir)
> -top_builddir =3D get_top_builddir()
> =20
>  libfdt_module =3D Extension(
>      '_libfdt',
> @@ -64,7 +65,7 @@ libfdt_module =3D Extension(
>      define_macros=3D[('PY_SSIZE_T_CLEAN', None)],
>      include_dirs=3D[os.path.join(srcdir, 'libfdt')],
>      libraries=3D['fdt'],
> -    library_dirs=3D[os.path.join(top_builddir, 'libfdt')],
> +    library_dirs=3D[os.path.join(get_top_builddir(srcdir), 'libfdt')],
>      swig_opts=3D['-I' + os.path.join(srcdir, 'libfdt')],
>  )
> =20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--cukxC1xFA84h23tM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAma5aksACgkQzQJF27ox
2GcPkw/7BLUzBdGpq1BMTsFA7TJm1PBSHBtlaWf360UsxOFcRkWbTA3in64NoVlS
vMY+LaClMQ4sSMee07YGEtI/A5vGfmuzWeo9Jlv7i/GITZeQ6ijUNTE62zciase/
X8UvutqpXq1+mRJvDEAho/h1AedE6yr/w+hfVCZulWYizUvQlwTJGqzev3jifXfh
7gncqg1ojsyjQfqmK+fAYfDjon6utBTwOWU1OeKWngYd4+XDpUTKM64zrK6mbcHm
XjxluXBTXDzIcVF4uFrNQKf3bsdTxHmvxePHmGvPbhCWuOt8cRzXi2NEalzguwtd
qX+Kz0pnkjZG9RH9/yjAjydhlOv2Wv3PONLxdEVBm8US5aRDh5VS0oTUpLwgKPF4
ekCP4DK58+zp6AppAyjX3lnywqC1ST4QeOu38C6N03iG+r7xCA0UdmOJljPVtptf
a0Gh65KdyngL4oYxLtaBdGUeqqjQShWMFumLaoTKc0GhHR2qu329QhtuiQTSUv5c
zgpmj9Cucb0WnSbTrGuUtbdVFwOP83uU2R2ML0fNNUIs6RVg3WT3Eqh1g+ctKp4t
VdnlLq4JeG3TGu1zgqRPkQxMJzkM+4BG5MxWF6QJ5kFGtYGrykddytOyXptRGb/f
CNyWeIPQNIi++1KbcsTiJbXMLtqTLmR0ErJ5CDOyHKqltppwADs=
=mTrB
-----END PGP SIGNATURE-----

--cukxC1xFA84h23tM--
