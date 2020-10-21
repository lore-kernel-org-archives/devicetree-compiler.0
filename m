From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 3/3] travis: test meson build
Date: Wed, 21 Oct 2020 14:58:00 +1100
Message-ID: <20201021035800.GE95552@yekko.fritz.box>
References: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
 <20201012073405.1682782-4-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+1TulI7fc0PCHNy3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1603252687;
        bh=TKWoCG4juRVleZqn0spsxcxF8LjuQmEjtNA/6XDpE/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SfleULrXXRG5RRnHiBaP2FfeLSun8X8/j/DzfSHPCJGQZ+RgNanCV4QH6qpB/P/8N
         oqB4LWMBownE3ugMXq+oXl7CZxt3HND3Ifr4M5CDCTiYpn9lajp2lEEnwAqUvS2Ic8
         QPeSQua+ApA1j/s4CN4ulGiABtf582rawQBEHC/8=
Content-Disposition: inline
In-Reply-To: <20201012073405.1682782-4-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--+1TulI7fc0PCHNy3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 11:34:05AM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  .travis.yml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index a5163de..e2d74a4 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -6,6 +6,12 @@ env:
>    # COVERITY_SCAN_TOKEN (dgibson/dtc)
>    - secure: "vlHvXe618//IM9LQaKzqsrUbjs7ng0L9UCST4kJbJnFQDXvVe5JiSmJGd4e=
f7mm0NUv5bMRl2W3xCiu6BYAu/NvU3tMNHoLG+JgCJs0+wLJXbWOwji/NmH7olqgJG+CmpaCMXj=
ARF6+nrTnBYHJL6cYyf4KVoV4B0I/hLUW91+s=3D"
> =20
> +before_install:
> +  - '[ $TRAVIS_CPU_ARCH =3D amd64 ] && sudo add-apt-repository -y "deb h=
ttp://archive.ubuntu.com/ubuntu xenial-backports main universe" || sudo add=
-apt-repository -y "deb http://ports.ubuntu.com xenial-backports main unive=
rse"'
> +  - sudo apt-get -q update
> +  - sudo apt-get -t xenial-backports install -y python3 python3-setuptoo=
ls python3-pip ninja-build
> +  - sudo pip3 install meson
> +
>  matrix:
>    include:
>      - addons:
> @@ -25,12 +31,16 @@ matrix:
>        script:
>          - make
>          - make check && make checkm
> +        - meson build
> +        - ninja -C build test

I'd prefer that the meson builds be done as separate travis subjobs.
That way we can be confident that both the legacy-make and meson
builds work, without subtle requirements on having run the other one
first.

> =20
>      # Check it builds properly without optional packages:
>      #     python, valgrind, libyaml
>      - script:
>          - make
>          - make check
> +        - meson build
> +        - ninja -C build test
> =20
>      - arch: arm64
>        addons:
> @@ -42,6 +52,8 @@ matrix:
>        script:
>          - make
>          - make check checkm
> +        - meson build
> +        - ninja -C build test
> =20
>      - arch: ppc64le
>        addons:
> @@ -52,6 +64,8 @@ matrix:
>        script:
>          - make
>          - make check
> +        - meson build
> +        - ninja -C build test
> =20
>      - arch: s390x
>        addons:
> @@ -63,3 +77,5 @@ matrix:
>        script:
>          - make
>          - make check checkm
> +        - meson build
> +        - ninja -C build test

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+1TulI7fc0PCHNy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+PscUACgkQbDjKyiDZ
s5LqlA/8CWPBgJGe//wnBps9evGz7ZTIB5QlnCPswSNDLLC/u63Pgv1WfYABUZIc
Rbpiin5TTq0wgdhVnjVt/mRDSTUeX/iEoIwXko4YhLZCzIjKQ02EusHHgukOVEXV
g0WVgATapdiyyFPbcODw30OtEAaBBGVsGqDAwd5qRONJvHO570pnmPE3FJbFKZ4M
MR/LEPcCpa9LpvtqNqRuHE6nQHvMDP99O3ztZ9qpXJwOolnyKkVDxlvuLty2Uf8Z
i0fjkj4QPX6SCbksJnhOQLiDK7rNJGi8WCE1xtvXVNFRARy3pSx2aXYqFYol4mDD
LXS2hAsishxtnsJM8l9vgt0y3I0ffbMDOyR7ny3C5BO/hkiaAG4Nfd3vmu/gWzXv
fUMcCFaxXQn3fZsycRmKlDF7auPtyJG3kYZAP0UFqPJ43eqAy43jc5mqMGiraqc3
JXp8TWEw5M2qCOp1kgf1g+dLrRV877jswli/SYQ19LWj+gP6I2ZUGH3+nsRWck/b
VukXorIp0ZbNRsdFXQMU5d6CnVHScgaj2raAW3MNMnOINhzY96ka6jckmltHCqVF
6E64V3yJdkrWY6HHzSzYwLTlH/zR6hFhnFk2vl9N4ferXS/YSG6cC2PD2LDgxzdc
4jptMIFzejsIesPYSjkLw9vQjCiAgwtau9TW8TwMaM/OBWytw6M=
=oaVh
-----END PGP SIGNATURE-----

--+1TulI7fc0PCHNy3--
