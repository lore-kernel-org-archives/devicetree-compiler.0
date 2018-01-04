From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Makefile.tests: Add LIBDL make(1) variable for
 portability sake
Date: Thu, 4 Jan 2018 15:37:25 +1100
Message-ID: <20180104043725.GB24581@umbus.fritz.box>
References: <20180104043013.97083-1-kevans@FreeBSD.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UXMJB0aDqGdn9A0V"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515040881;
        bh=BANp7O2vEXcd977D5PZU2S0FxUGWK54aNQmKAboG0Zw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SD/gQgYiZPZ0q64fPb13D4a3sA0bDFGxCfJX+QF/FhDlyh2+maL5Q945swFVObYGm
         wKvcIRaCq6VkOi7TeMqQgaPq2KtuivMqIDWx9iuwNjWa0j8t3DJfBKwhzqDBSQ0S4I
         LoJ/zN6nBxeUsLeH0uL2rjzd9qa1kJEolt2aX85o=
Content-Disposition: inline
In-Reply-To: <20180104043013.97083-1-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--UXMJB0aDqGdn9A0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2018 at 10:30:13PM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> Some platforms (many, if not all, of the *BSD projects) do not provide a =
libdl,
> and instead provide the same functionality in libc. Instead of forcing th=
ese
> platforms to patch out the link against libdl, add a LIBDL make(1) variab=
le to
> allow the -ldl argument to be excluded easily via make(1) arguments.
>=20
> Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

Applied, thanks.

> ---
>  tests/Makefile.tests | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index 2258135..262944a 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -54,9 +54,12 @@ tests:	$(TESTS) $(TESTS_TREES)
> =20
>  $(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_archive)
> =20
> +# Not necessary on all platforms; allow -ldl to be excluded instead of f=
orcing
> +# other platforms to patch it out.
> +LIBDL =3D -ldl
>  $(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_archi=
ve)
>  	@$(VECHO) LD [libdl] $@
> -	$(LINK.c) -o $@ $^ -ldl
> +	$(LINK.c) -o $@ $^ $(LIBDL)
> =20
>  $(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o \
>  		util.o $(LIBFDT_archive)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UXMJB0aDqGdn9A0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpNr4MACgkQbDjKyiDZ
s5KKeRAAwa5Xd3EyOKc3C4IN1UvpFtJJQWcoSJM3ls06t6vjFLRHstbShyLa73zR
/g+ioIZkzqWQe+g1WMgo5J5L/4Ghx4mNxfWLGdqxDwgKJm9uBeqOKUZr+eHALC40
MtqwZjbhxh3d67hHJOSJclZJ/MKsGvRqDCJVbhZ+8Yw+JvDUrQUSUdruoftgILiR
Fy96mYsfSMcMeGr6Q1aA+3t5IUfMn+HwmAF8pqdmjdb/h4EhtNg97XXEKfGK+ABh
zlGJViNwH/Dqd9E7/ryBYsuHu0fonDenDtXcHGBuLfbmgZyyPGwtSavCsw/tiYXO
6tl8//JpLaQa5ygqmLtfxycStt6SIL40RQWkqtZURIlIdgpmkbiMNTMchz19CT3q
KRYQIkSIBi5SKKz2GBp9CoSzACkvOBQqFvVVvUaVVsacS44lug8ph8QCwP7VgHTF
dL0jlFgvnxzbyd9c+hFlPcAtX780EbFLJH3X3ltLKelADNMH6YVnv/0+jdO4Wip0
BlmFgnyCLNMxVu68+6cxbwziBPq5zwxG2ob+RrI059+0r9x9NIJYKc86uhQrg0eV
FVbA2lq7eUqmvZCwh9DjIaxrdBYlW18qYDfzO/IGIGkWDPDLFMdMBXWoavnbBORr
IRM30uBl23b/VczIgwOlVahnjXtA29WGkqfP7hiW9MhbFog7gCc=
=XFyh
-----END PGP SIGNATURE-----

--UXMJB0aDqGdn9A0V--
