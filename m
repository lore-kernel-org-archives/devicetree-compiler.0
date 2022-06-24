From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Depend on .a instead of .so when building static
Date: Fri, 24 Jun 2022 12:24:19 +1000
Message-ID: <YrUgU0flkt8HXLMf@yekko>
References: <20220623124444.445049-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0p6qoKTgX2keTUGj"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1656040337;
        bh=Vrmjcx36zVW+g7fl0b6GjJ5eZBgmrGnTMHyLmLd/PlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lYM7TkT+gMGncgiKC5+d8wNYijltY/Cv+PQaiyHdtOzvbiwHmsf4VDxLs06kbsF1X
         d1kpd3Bcb4/Cq3wr/GrKWF+eEeiX2cPGod5sVPgEZOpHGh8aeNMHsWP/I42mK9vV/4
         d9hpAeecT0vsgpwsohUmHYBroDluDMl4tGVX+RII=
Content-Disposition: inline
In-Reply-To: <20220623124444.445049-1-tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--0p6qoKTgX2keTUGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The short description buries the lede a bit - this is adding Makefile
support for a static build, rather than just correcting something
that's already there.

Given that we're uncomfortably mid-transition between makefiles and a
meson build, I don't love adding support for this to the makefiles but
not the meson configuration.

On Thu, Jun 23, 2022 at 03:44:44PM +0300, Tero Tervala wrote:
> Static build needs to be indicated with an environment variable:
> STATIC_BUILD=3D1
>=20
> Checks are skipped on static builds as they contain dynamic
> library tests.

I don't like dropping all the tests for a static build.  I'd much
prefer just to see any specific tests which require dynamic linking to
be skipped.  I can't quickly see any tests which inherently need the
dynamic library apart, possibly, from the pylibfdt tests.

>=20
> Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
> ---
>  Makefile             | 12 +++++++++---
>  tests/Makefile.tests | 11 ++++++++---
>  2 files changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index ee77115..9f550b4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -198,6 +198,12 @@ LIBFDT_lib =3D $(LIBFDT_dir)/$(LIBFDT_LIB)
>  LIBFDT_include =3D $(addprefix $(LIBFDT_dir)/,$(LIBFDT_INCLUDES))
>  LIBFDT_version =3D $(addprefix $(LIBFDT_dir)/,$(LIBFDT_VERSION))
> =20
> +ifeq ($(STATIC_BUILD),1)
> +	LIBFDT_dep =3D $(LIBFDT_archive)
> +else
> +	LIBFDT_dep =3D $(LIBFDT_lib)
> +endif
> +
>  include $(LIBFDT_dir)/Makefile.libfdt
> =20
>  .PHONY: libfdt
> @@ -261,11 +267,11 @@ convert-dtsv0: $(CONVERT_OBJS)
> =20
>  fdtdump:	$(FDTDUMP_OBJS)
> =20
> -fdtget:	$(FDTGET_OBJS) $(LIBFDT_lib)
> +fdtget:	$(FDTGET_OBJS) $(LIBFDT_dep)
> =20
> -fdtput:	$(FDTPUT_OBJS) $(LIBFDT_lib)
> +fdtput:	$(FDTPUT_OBJS) $(LIBFDT_dep)
> =20
> -fdtoverlay: $(FDTOVERLAY_OBJS) $(LIBFDT_lib)
> +fdtoverlay: $(FDTOVERLAY_OBJS) $(LIBFDT_dep)
> =20
>  dist:
>  	git archive --format=3Dtar --prefix=3Ddtc-$(dtc_version)/ HEAD \
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index 2f78952..f13b16d 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -60,17 +60,17 @@ TESTS_CLEANDIRS =3D $(TESTS_CLEANDIRS_L:%=3D$(TESTS_P=
REFIX)%)
>  .PHONY: tests
>  tests:	$(TESTS) $(TESTS_TREES)
> =20
> -$(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_lib)
> +$(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_dep)
> =20
>  # Not necessary on all platforms; allow -ldl to be excluded instead of f=
orcing
>  # other platforms to patch it out.
>  LIBDL =3D -ldl
> -$(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_lib)
> +$(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_dep)
>  	@$(VECHO) LD [libdl] $@
>  	$(LINK.c) -o $@ $^ $(LIBDL)
> =20
>  $(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o \
> -		util.o $(LIBFDT_lib)
> +		util.o $(LIBFDT_dep)
> =20
>  $(TESTS_PREFIX)dumptrees: $(TESTS_PREFIX)trees.o
> =20
> @@ -83,8 +83,13 @@ tests_clean:
>  	rm -f $(TESTS_CLEANFILES)
>  	rm -rf $(TESTS_CLEANDIRS)
> =20
> +ifeq ($(STATIC_BUILD),1)
> +check:
> +	@echo Skipping checks for static build
> +else
>  check:	tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
>  	cd $(TESTS_PREFIX); ./run_tests.sh
> +endif
> =20
>  ifeq ($(NO_VALGRIND),1)
>  checkm:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0p6qoKTgX2keTUGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmK1IEwACgkQgypY4gEw
YSJw+Q/9Epa+2PCqycnM/KBYi7mMwwwu/uPnY94oFFko6Xg2PwZVBJ0gWGw0bVTj
0KjqiScCO5/rTMBS5SCIUFyj7y6Pxizd3CFN/oI1aAwJ6bpQfS2HU6dIAw/+n/fh
J/BiUFrdix1fh/azshTBC3Ka7cWN1p/n1Yz1ujv0wiBbOIVvV+HB3oEcCskvcJMP
ldCORE2yr06KdhRseKeCZhAdui6duVo1mFzY8B7XKUprsHVcua3Wb1F1t0LgXcVG
1sTy/1ZKJCYaVciYB6kwTnA/trvRBLALuRqidNqin4b6YvQJ194Ln4PBS5Olti8t
mXKrJCUzyDpIN9Anh2WjnduCl7Ornr1y+hfX5rY3slqUdteuu7G/tKmftE2GQX8F
UUWRyDTslmo7z5XjkNcFYCVWOCXKKtzhpEiXkdeiUM7NwKCHWOPYvXabqM+8m1H4
7VZQDkF4nejZjWEVtF9uywR1EeJhGh3ONwu9AuIBB3WpvmAD0yJaFfq+lFAtDCSs
2X7lJ7Yr+d0d8plNuQRJloVWOv2m8rPmM/qlo/UEhmkjCXdlPqQ/E79VEGRWk10J
ipXIU5mTh38pUUJsOCQddZ9bnT+k2fIH+8EnK2CSJn5xx0GQQHlsXyDaOn35uTOy
FaxYCgVudEqsHAUrAhiW8Zdi1uPEHU4mGwnFuaen2LoBYTBzxkM=
=AM7w
-----END PGP SIGNATURE-----

--0p6qoKTgX2keTUGj--
