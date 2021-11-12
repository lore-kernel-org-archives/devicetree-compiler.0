From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/6] More pylibfdt updates
Date: Fri, 12 Nov 2021 17:10:49 +1100
Message-ID: <YY4FabtkB6eis8QM@yekko>
References: <20211112041633.741598-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GbeneqWzPVwXYhn7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636771448;
        bh=+Vjh0XIrxp920bijc4hkBnO6fR3/g7oWdpp9JSPaMnE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bbct6tYvyd1FUvVHlMIDsjTnoBEODl0HuqvP2KqaaVu4EMrpQr82rVmWxZ/p3hqcC
         pkWa82c+pwNBrErQivtzym7Kd7fd4zj3vifoCBZBjamEPEuqBp/jwbthkjjuw4YHAP
         qbtM7WGoNd+LYOjiVi48ucKqg/hYWpC63YLlluy8=
Content-Disposition: inline
In-Reply-To: <20211112041633.741598-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--GbeneqWzPVwXYhn7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 10:16:27PM -0600, Rob Herring wrote:
> Another batch of pylibfdt updates. This series updates the README for=20
> installing, adds metadata for packaging, and reworks the tests to be=20
> able to run standalone using python test programs (pytest and tox).
>=20
> A test package is uploaded here:
> https://test.pypi.org/project/libfdt/


1..2 applied.  I have some questions about 3.

>=20
> Rob
>=20
> Rob Herring (6):
>   README: Update pylibfdt install instructions
>   pylibfdt: Add packaging metadata
>   pylibfdt_tests: Don't depend on built dtbs
>   tests: rename pylibfdt_tests.py to test_pylibfdt.py
>   pylibfdt: Include tests and test data in packaging
>   pylibfdt: Add tox support
>=20
>  MANIFEST.in                                   |  7 ++++++
>  README                                        | 24 ++++++++++++-------
>  setup.py                                      | 17 +++++++++++++
>  tests/run_tests.sh                            |  3 +--
>  tests/{pylibfdt_tests.py =3D> test_pylibfdt.py} | 22 ++++++++++-------
>  tox.ini                                       |  6 +++++
>  6 files changed, 60 insertions(+), 19 deletions(-)
>  rename tests/{pylibfdt_tests.py =3D> test_pylibfdt.py} (97%)
>  create mode 100644 tox.ini
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GbeneqWzPVwXYhn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGOBWYACgkQbDjKyiDZ
s5IOIhAAsGgxnOMd+r4LoulFOsc8vl32k1tVsRZR7qtZztFGLoHNxraS9IWWn4aq
L5gN29eNhfaONt7GW5HfutskXtP1+e7rA9WHkBAAg9w9/TuVJ06FTY1s15kTE7Z5
c+ujtmAUhvG6PJkysezEw8EH4/nQKFAIe9nYN8v2TEkTzIBLBha9Yab++2qHweLp
uyxxIHjjFe0SmTDQJoXEmrjB3MtQk1qtzVoAgohsm8ruGhBmdT9VRbd7gsxlzm3K
4ECvZGWwXWqg/actlpYLDlYAV3QPrOUGK/Yzn5RUiQpusGm3xcq9OyNMavR2X19M
1KkUS+3LuqKQMjB0z0gtWZTT+Dh/ID04VgzFsnfq2QhxfP9kBi3PgusM2hOBhZzS
gvKYpinVkBS6R8X80QzDTf3IYfR4UhH4gmY71Iper80jD4hOX63aSQFLe6QTrNEE
YGqpxBGqCxBGuozd6hd3zOv2Q8brz7Z16jrTbuKHGGpjTSAM/fIlreJGo57j9b1J
9nw4HFB0iX08cHprlSSmE8oZVJqd/khnlFyKJxG3UTL891aq7J+CinyQfeNv2J0G
fzl1pgWmZzUtEqILADeZe6pI9F+gILqIs4cOocms0A4OXWy8klSuEdYhITdD4mwX
WPuu6LOXUUExizrJj9Ta0giTVTmlf8gAGM5P2F9XH7yBIhjtxkA=
=EaVh
-----END PGP SIGNATURE-----

--GbeneqWzPVwXYhn7--
