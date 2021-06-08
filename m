From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/5] travis: install meson
Date: Tue, 8 Jun 2021 13:54:36 +1000
Message-ID: <YL7p/CdVrOit6oSP@yekko>
References: <20201207130055.462734-1-marcandre.lureau@redhat.com>
 <20201207130055.462734-5-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6VBN68S7olquC5gV"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623124482;
        bh=Hx4SdXgyXsSRTXpFnKw2O3qlnsJSgnj3LfYXw/Su7pI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fh0JyY3z7VYrgFTuKB6kEmMzh0DOy61uTUmpcUWJTCKpz0lPg7p8hUEvPPgc8k6ps
         8Tur4+/jpKIjx+ZlT0W1qjlXgsHTKqgS+deWBf+Xfy2icT1ETEQsPGd86i3ITS9FNo
         JrCvImLpHvHwAFoGrMJBuyEZsY3Mcwaru8mtfX1w=
Content-Disposition: inline
In-Reply-To: <20201207130055.462734-5-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--6VBN68S7olquC5gV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 05:00:54PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> The next patch is going to switch the build-sys to meson.

I'd prefer to also convert the Travis scripts to directly invoke meson
rather than going through the Makefile.

>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  .travis.yml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index a5163de..aad9f68 100644
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6VBN68S7olquC5gV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC+6fwACgkQbDjKyiDZ
s5LFfg/+NKQd7UKs5blc0y9YyNBdZlBZdXSDj1QrTIHsu/2c+CEVrBYeGSps7v6t
9psbAhYUYcHTE5BcwHVyGBatiM8OOJc8HFStKTDGeQnPglVZQcJLMDbwOruEgbXX
xuJXm6tZ4jj2trT6BBz0F1uDe1/HxKQ6YTnkQsRQS6JZwhjGXaTdFBMcNWJTqKUh
bbnoPdXr+5vuY5FrOoO7Ed92MtBkOfgKcBj53rGLHpOV2tHvWueBd1ZiGN0LbQAf
z78Yv0UYn1EfMIryQ+kWR9gWI+9/c3yhCkDNLt/3WXQCmFxBI7JH63SNJllnjZXc
EPRbj3FrODnnIPh1ABXHKoeQq+XIPrxO2x8mX6Q0jSaamxL5IP5FOajmFqXcAL5A
k9bkfYecgMffLh7EQIR3MlBV4Zh7w28H9W4thUPMEIOMKAiLOVEdjd6kw/W3gNlw
rCLbVUbMrIyQ3ZQz88TUtdlpEByUZFAkLu6Mcd1rjeyqMvGd8J4vKOQJrCix0gPR
Dl+zZl6n4TipbC2y66u6tZB+Po8wYr6FS1sdzZDF2IowtdfskgpIyd9nQEGauY/A
jzxcOya/tzRpsjam4QtQN3vRZ0Jjiv5orrc77Awzb7KGI+WYAOCSTy4Fsy5ZCuAZ
1WsPo1wb6SUcLyMbbOLImLEuXfSK0i4U6D0a+uheyaJl9u4tsnw=
=9hnh
-----END PGP SIGNATURE-----

--6VBN68S7olquC5gV--
