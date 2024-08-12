Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5648F47
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Aug 2024 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723428079; cv=none; b=N3Iq/hiHf/jiNbgeawshpvTNwl7w/0USDxMUhMC9KRH5uqyRWU2N+xgU+bXn+3nXC99s4K942qgkR3r78uykYvXaDbwS+FgagU1zU2TUeykMkfnII+QsgyFImihtA1vWptqRkXaaPDJTdKt2/kGcb84rDYK0qWpN62YiIos/k1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723428079; c=relaxed/simple;
	bh=23Ao0BqKQK7/3ISNy3I0puolvR08hTJmThkLH+OK9rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L97vpsMad2XMm+FmOXUBO2W9+vQqJzfELMI0A/0MV3y0YkVsrd8fiSElzVbdECX5UYRdXga4unHLJZ0FbNKBnVByCkYwTmaXGpe9e8ejkq/x0f6COcz8L7zU4hd+2OzbG2XrjQeVsuiKbNUJRX/Ah9pyPYQFf6z0iTVgt+V0RPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=T4twfYiu reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="T4twfYiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1723428074;
	bh=Ulzqm6MaluMyTyVZ5yB6BzO9Dlh94FE16wznDc7qpPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4twfYiuGX+ULl7opyxH/j3py0OfYPuw0hUk8OrtGOBegETi4b9sgpEtvBxMwZs9y
	 jtKecCF+j+sqXow+gg8grohazekgc23edgFaAHpXMrQv/qlFJaqJFcm9xtyl6IN+/z
	 bGQh4sITjBYZ43pJKhhYaqsoN1/JBM3qxRhIml0Ee5RJ7Jr3W5VMQrsB4MC9q+JCA6
	 2pVQA6YTYJ5FoRqsIQhtYdmIitI0MfEL4sYr2VIWQC8C4xxVWZbU7Lisprtzjm6qp/
	 4oZC0uLahaqXln+jLb1f0oHCsXWNCS1qE3HQHma+o/PSCMLw7KhLREnGEOO7LUMtud
	 I4xWtbs2zqN3w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WhyRZ36KRz4x8p; Mon, 12 Aug 2024 12:01:14 +1000 (AEST)
Date: Mon, 12 Aug 2024 11:51:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Gua Guo <gua.guo@intel.com>
Subject: Re: [PATCH 6/6] setup: Add dependencies for Windows
Message-ID: <ZrlqiYL4p6K14S6e@zatzit.fritz.box>
References: <20240811150248.7537-1-sjg@chromium.org>
 <20240811150248.7537-6-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v8fzTgIQT/WK9V43"
Content-Disposition: inline
In-Reply-To: <20240811150248.7537-6-sjg@chromium.org>


--v8fzTgIQT/WK9V43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 09:02:48AM -0600, Simon Glass wrote:
> From: Gua Guo <gua.guo@intel.com>
>=20
> Windows apparently builds pylibfdt if swig is declared as a dependency
> in the setup file. Otherwise it must be installed manually and Windows
> does not sport a package manager, so this is hard for users.
>=20
> This change seems to have no ill effects on Linux, at least.
>=20
> So add a new setup_requires line.
>=20
> Signed-off-by: Gua Guo <gua.guo@intel.com>
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied.

We do have windows build in our github actions.  It would be great if
a test for building pylibfdt properly there were added.

> ---
> This was picked up from:
>=20
> https://github.com/devicetree-org/pylibfdt/pull/2
>=20
>  setup.py | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/setup.py b/setup.py
> index 52844ce..6efdae6 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -76,6 +76,7 @@ setup(
>      cmdclass =3D {'build_py' : BuildPy},
>      author=3D'Simon Glass',
>      author_email=3D'sjg@chromium.org',
> +    setup_requires =3D ['swig'],
>      description=3D'Python binding for libfdt',
>      ext_modules=3D[libfdt_module],
>      package_dir=3D{'': os.path.join(srcdir, 'pylibfdt')},

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--v8fzTgIQT/WK9V43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAma5aogACgkQzQJF27ox
2GeDRA//aSu2n47QuHXSfk7E3CX5gW90dP1JftbEQ08fZH+iu6It/0zdRTN3B0/p
7GXgsQoNuTX3xb05VtNlX62UBdMPY+FbskGd9PWdEOnL6S1xQF7fj2s6iyEG1uVG
RYLstKmYG/04N+b759aCmexU+mffIJh6RUnR63ItKOV11oSjTUvYk94NbYKDagLp
cGzf1eLmcnUJQBUxbqRjZKPE35IeT8sPHysh9GMIxfYUk7VLlYUFknRDKFuPA6kw
43S0RISCKeHugYhNkbT+Xsh9KKopKaqa92luve8Ojt8G76mq1c3Lei1gxx3VVro6
DlLk5p9SEq92Xjlj24HmoweROAOLONXiZ6GrLpdiHe9B/AnYAUkJ0Tywu+VufqxF
sjBVpT27Crl7sVZ3W5naSfe3jniJ8GY2H7jddZYnDgcK6k49+Do2GcIvsw+hhJFb
6zHUzv9MpIOOhdtbHbzQOt1bhdV+hgAuoVo+L9okdpoEs9xh5ecrDrUx+VKN9HJ+
WwlqWGapyQ62gQnr378OCrPfsjlJWgJ+1ruVN/8Sp11iIcLN4MXVk35FuSR8LiOc
coPtrw5HA+d/L4sNsaVPrgSkAkOIZ9w5/Q8l4PVi1AfZivZqMF1PAfiQLTv93ODf
FIGFgGsnhHxCpOmEciqRnPXmiXzvtIgiFCGMWSG2jl8m5L2Tj8M=
=0Yv3
-----END PGP SIGNATURE-----

--v8fzTgIQT/WK9V43--
