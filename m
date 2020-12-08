From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/5] Follow-up on meson
Date: Tue, 8 Dec 2020 15:33:28 +1100
Message-ID: <20201208043328.GF2555@yekko.fritz.box>
References: <20201207130055.462734-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lIrNkN/7tmsD/ALM"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1607402773;
        bh=ViwV06qCrr2yOr1FrpZBUbINhZV39Xl4MzDdIBRX8Mo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jnehbIbLy1UHzJ5vzcqFJe7ngqxUAtcciKaez9yIK1PidIMUzlHVFXjpOW7rUUJg4
         PEeQNSSSzTY7ukjfLbUfmj+B4KL5oqQZHRjXr+iYkI1J0dXp1CxhD7Enyq6EQJk40E
         +k7NOsX5coUbEcxSGPkkxgJ3lawiIAf9NN8WmL1k=
Content-Disposition: inline
In-Reply-To: <20201207130055.462734-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--lIrNkN/7tmsD/ALM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 05:00:50PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> Hi,
>=20
> Some v4 patches of the series "Add meson subsystem" were pushed, while v5=
 and v6
> were posted on the list. Here is the remaining changes I have on top of
> upstream. There are a few misc fixes, and the last patch removes the
> Makefile-based system, while keeping the traditional make all/check/insta=
ll/clean
> interface to ease the transition.

I've applied 1..3, 4 & 5 I'll need a bit more time to look over.

>=20
> Marc-Andr=E9 Lureau (5):
>   meson: fix -Wall warning
>   meson: do not assume python is installed, skip tests
>   meson: increase default timeout for tests
>   travis: install meson
>   build-sys: replace makefiles to wrap meson/ninja
>=20
>  .travis.yml                |   6 +
>  Makefile                   | 380 ++-----------------------------------
>  Makefile.convert-dtsv0     |  14 --
>  Makefile.dtc               |  23 ---
>  Makefile.utils             |  31 ---
>  README                     |  24 ++-
>  libfdt/Makefile.libfdt     |  18 --
>  meson.build                |  22 ++-
>  pylibfdt/Makefile.pylibfdt |  30 ---
>  tests/Makefile.tests       | 100 ----------
>  tests/meson.build          |  13 +-
>  tests/run_tests.sh         |  10 +-
>  12 files changed, 71 insertions(+), 600 deletions(-)
>  delete mode 100644 Makefile.convert-dtsv0
>  delete mode 100644 Makefile.dtc
>  delete mode 100644 Makefile.utils
>  delete mode 100644 libfdt/Makefile.libfdt
>  delete mode 100644 pylibfdt/Makefile.pylibfdt
>  delete mode 100644 tests/Makefile.tests
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lIrNkN/7tmsD/ALM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/PAhgACgkQbDjKyiDZ
s5JEuRAAjMMOp1T3IgTRRmOMJQnMrmmdgs+vEouVPbtZ+K3x+1NB7isyZCoax6nx
gfRTMi3QCmpLtS8od6yZBCkfW1WEofI8ZA4wQSntoaGdgUIGoZCVwaACxFtfqrUU
5ljHqPsC+skjNVUWpDIfMyj7XuGNifLXe4Yh/47ZfOdrOrrxZiBilKsVMGxtVko3
6+5h4iPnOsSEopVquFak9gn0IKaln3NH1Ed7xOefTP7ZvFls6nfTmz3+m+h5xWxy
czKmXVEKaEVj7OpkxVv2dy6MMcNY2oM1KIppQC/UmJuOPe0JvnWu4gVAjVvPbWpi
8AE6UUclPs4VjzSnsSc194kkfsDABZJhxXguNTzLc8vI9zRX8OnVAlt5aNUPwAUJ
2Knol3enCZfzMx7n1HpzCTeTOsfF7ABGKHhBKpCGAF8+ZUZBzt8RKQs4QGyJrSoD
g9SZ6yVUw1Aif+Mo40vpu9liggxDQ8MKj2+jIhBpy7wpmHXil68WcMt1McatD5nq
wBU0KpQht4dh8k5n3eoNnbFrHPR7BvgNEhykgwPD/tw3NRehKYQVC4bety9z9kPE
lrU2vp94HDzQIJSd+rz5l7EoOrzINAIKD21rJSZLAkmmvhrrgR+GctI+Ct6N8fae
hpy1XOQLd83z/gZN9qEniWSayFrpsyPF2TBAfgNnS9Ba1+TjF+8=
=fVkX
-----END PGP SIGNATURE-----

--lIrNkN/7tmsD/ALM--
