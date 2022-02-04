From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] pylibfdt: fix swig build in install
Date: Fri, 4 Feb 2022 17:44:02 +1100
Message-ID: <YfzLMjOJPZqJUFFW@yekko>
References: <20220203180408.611645-1-robh@kernel.org>
 <20220203180408.611645-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G2UyQVAzHcw1HoC8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1643961947;
        bh=4BlLa0z+4717/Ay47WaoT7nb/D3xxjJupgIqca8zoM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dxPF7hBqpcDmx/ob5v9dc+nkP/uFddNaRUA022VOod6U5rnPSbTOtoOY58VEuXp9u
         WMndv9HN3DNn4iVfmKsPE63GMhyf4UbCMC+VyLAAVHm5tSPNl5FwfnOSUFXVr/lxcs
         qWuSVwTxYaR84O4+J/ioBBNqfzYdqbBWGSYWLMbA=
Content-Disposition: inline
In-Reply-To: <20220203180408.611645-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hector Oron <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Natanael Copa <ncopa-Tvuechaw34bCfDggNXIi3w@public.gmane.org>


--G2UyQVAzHcw1HoC8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 12:04:07PM -0600, Rob Herring wrote:
> A 'pip install' is silently broken unless the tree is dirty and contains
> pylibfdt/libfdt.py. The problem is a known issue[1] with SWIG and
> setuptools where the 'build_py' stage needing module.py runs before
> the 'build_ext' stage which generates it. The work-around is to override
> 'build_py' to run 'build_ext' first.
>=20
> [1] https://stackoverflow.com/questions/50239473/building-a-module-with-s=
etuptools-and-swig
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>  MANIFEST.in | 1 -
>  setup.py    | 8 ++++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/MANIFEST.in b/MANIFEST.in
> index d9fb71b77a65..6e7244d195e6 100644
> --- a/MANIFEST.in
> +++ b/MANIFEST.in
> @@ -6,7 +6,6 @@ include GPL
>  include BSD-2-Clause
>  include setup.py
>  include pylibfdt/libfdt.i
> -include pylibfdt/*.py
>  include libfdt/libfdt.h
>  include libfdt/fdt.h
>  include libfdt/libfdt_env.h
> diff --git a/setup.py b/setup.py
> index 029aa6182221..a8e54a361512 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -11,6 +11,8 @@ Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>  """
> =20
>  from setuptools import setup, Extension
> +from setuptools.command.build_py import build_py as _build_py
> +
>  import os
>  import re
>  import sys
> @@ -40,11 +42,17 @@ libfdt_module =3D Extension(
>      swig_opts=3D['-I' + os.path.join(srcdir, 'libfdt')],
>  )
> =20
> +class build_py(_build_py):
> +    def run(self):
> +        self.run_command("build_ext")
> +        return super().run()
> +
>  setup(
>      name=3D'libfdt',
>      use_scm_version=3D{
>          "root": srcdir,
>      },
> +    cmdclass =3D {'build_py' : build_py},
>      setup_requires =3D ['setuptools_scm'],
>      author=3D'Simon Glass',
>      author_email=3D'sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org',

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--G2UyQVAzHcw1HoC8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmH8yxEACgkQgypY4gEw
YSLyGQ//S2crjW/LjGGofM+nrrf9lplixs2Z2D/E4126jjTok+vIyh6VFxhQ9u9b
iithKYaDVOyecYGdc2I2mRRHmDsH093nqdoC65PvNnXkqEshc/hnyzfiVqmN9luG
lRZYzomCRThM9+HHGWRhw4APDLEWS5Wq99CuaWVr3cdtp8Im1mWnoizD/jWm/zqq
o3okJYeRNfj6fPREN3evmW3/61JgLCFI7q4H36YDHx/2x+aepr/H7kkjmrc6FjuM
QS+horiUtYmo2z402I2MEf5iDxvcBK73P+po5m24LHmujkMSsLOy9GatWojo5scs
Eho+/pLldLbfMuDiNogf1ogYCSNogi27MCvkDQUoxjCa6ec5pwXd5B1uUjmg+5Pm
LCVQxJacTNt4vGDiYKHrBJs2b/o3yeJyJ0kVcHM+F6eSzBmXEMZcWI2yT9D/iY06
xTl212nPVWTTuds5b95LhrhdTJ3tCQIUrBhCBQL4FwUsK1SJrw62VIpMEDXrfBeF
Xqohywtz8NbuFAvAXRO1R5RqR0PAUQivIRPFtl8TV9h/mwv1W80VAPYx2vzwhOgt
PcBEKPSEFfFOVNmIbADr0KyfS0CErZlNa+B91QQdb3/g8S6h0Jxrbq2LtRDoWAG6
+Kt3O1b6NIA3eZMek5O0QAv2muyRVqvDkjpCK1hcc2TWEKpkjHg=
=OlAq
-----END PGP SIGNATURE-----

--G2UyQVAzHcw1HoC8--
