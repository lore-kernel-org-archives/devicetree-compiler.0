From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] Allow static building with make
Date: Wed, 27 Jul 2022 16:48:27 +1000
Message-ID: <YuDfu0Zvy/MM0EQo@yekko>
References: <20220629163531.932281-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3B8V5ZYwBIDy/V61"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1658904669;
        bh=MVbobk3FObYdlmVqaFkIhve94Eig7/HVP9rVKgRRigA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V8+v4gh72RPLiiW+YguggRa55apn894GFh8b2jbegyoxS7C+D799oPGQpXe4zrWAU
         FOno4SMNZRh6k6Pia6J5Y8zUwrHLMXeoux99aQVDCZxFb03q+jJbUgjiFD0cd8wMll
         /BJjInvbGqp4g/f39iSA99JNLqQjOo+KuyYX4txU=
Content-Disposition: inline
In-Reply-To: <20220629163531.932281-1-tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--3B8V5ZYwBIDy/V61
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 07:35:31PM +0300, Tero Tervala wrote:
> Set STATIC_BUILD=3D1 environment variable to enable static building
> when using makefiles.
>=20
> Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  Makefile             | 13 ++++++++++---
>  tests/Makefile.tests | 12 +++++++-----
>  tests/run_tests.sh   | 10 +++++++---
>  3 files changed, 24 insertions(+), 11 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index ee77115..9f1223f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -198,6 +198,13 @@ LIBFDT_lib =3D $(LIBFDT_dir)/$(LIBFDT_LIB)
>  LIBFDT_include =3D $(addprefix $(LIBFDT_dir)/,$(LIBFDT_INCLUDES))
>  LIBFDT_version =3D $(addprefix $(LIBFDT_dir)/,$(LIBFDT_VERSION))
> =20
> +ifeq ($(STATIC_BUILD),1)
> +	CFLAGS +=3D -static
> +	LIBFDT_dep =3D $(LIBFDT_archive)
> +else
> +	LIBFDT_dep =3D $(LIBFDT_lib)
> +endif
> +
>  include $(LIBFDT_dir)/Makefile.libfdt
> =20
>  .PHONY: libfdt
> @@ -261,11 +268,11 @@ convert-dtsv0: $(CONVERT_OBJS)
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
> index 2f78952..2d36c5d 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -37,8 +37,10 @@ LIBTREE_TESTS_L =3D truncated_property truncated_strin=
g truncated_memrsv \
> =20
>  LIBTREE_TESTS =3D $(LIBTREE_TESTS_L:%=3D$(TESTS_PREFIX)%)
> =20
> -DL_LIB_TESTS_L =3D asm_tree_dump value-labels
> -DL_LIB_TESTS =3D $(DL_LIB_TESTS_L:%=3D$(TESTS_PREFIX)%)
> +ifneq ($(STATIC_BUILD),1)
> +	DL_LIB_TESTS_L =3D asm_tree_dump value-labels
> +	DL_LIB_TESTS =3D $(DL_LIB_TESTS_L:%=3D$(TESTS_PREFIX)%)
> +endif
> =20
>  TESTS =3D $(LIB_TESTS) $(LIBTREE_TESTS) $(DL_LIB_TESTS)
> =20
> @@ -60,17 +62,17 @@ TESTS_CLEANDIRS =3D $(TESTS_CLEANDIRS_L:%=3D$(TESTS_P=
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
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 1b16eb8..0cabd13 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -607,11 +607,15 @@ dtc_tests () {
>  	run_dtc_test -I dts -O asm -o oasm_$tree.test.s "$SRCDIR/$tree"
>  	asm_to_so_test oasm_$tree
>  	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree"
> -	run_test asm_tree_dump ./oasm_$tree.test.so oasm_$tree.test.dtb
> -	run_wrap_test cmp oasm_$tree.test.dtb $tree.test.dtb
> +	if [ -x ./asm_tree_dump ]; then
> +	    run_test asm_tree_dump ./oasm_$tree.test.so oasm_$tree.test.dtb
> +	    run_wrap_test cmp oasm_$tree.test.dtb $tree.test.dtb
> +	fi
>      done
> =20
> -    run_test value-labels ./oasm_value-labels.dts.test.so
> +    if [ -x ./value-labels ]; then
> +	run_test value-labels ./oasm_value-labels.dts.test.so
> +    fi
> =20
>      # Check -Odts mode preserve all dtb information
>      for tree in test_tree1.dtb dtc_tree1.test.dtb dtc_escapes.test.dtb \

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3B8V5ZYwBIDy/V61
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLg358ACgkQgypY4gEw
YSK4dA//adzt/Rs8GKoUceHc3c+SGj+IfwjHUuBriaLc+TlVo7DSk0ug7aHj67wK
cnzXh2O2rjWYaCa9iKhdGifkL9hX1DG4Xtf6/0VSVBApieBmGKvZyKunqtm+S8v+
T11Is6r4B0+qk5qikwUKpBUJPSkj+Gryx2xf2feamdAp/u3AqarLlku1INKCgB5Q
m0qriIc271N6MwCISAt6ZJ/ULP/792d/QeqKPqIrclciqHY4JV8NfMsftuC5kyaz
OAAuXnUsV1awNHGROHkbOSKNfHkFoG8fFySkUNjNowqgYWsjieMcJkJENH8wYskr
u+GCKSfHXqBfIEno90wHyJJ9L3vkKj7KNLDOJcNBMmZKTlynWyYfTxOzcZd6MUlI
Kzzm0C+A60KMhw8yr0yqU20uo3KhlCE7+RUBhzZWvT6wl0ExOQh43xDhcvB1G+PQ
JuDLUB+TGagLcpiAyfZSEiFP1ZtmSuxyT3FUtcmSl7lekCAmB+cT9q21yLbpC3vX
XUrKGQKAiyEAYdKZAvfoxI7Sapx7e9GC6Acw7W5w15viHEF9q+ys/VaSNImG50NE
ezOtBnJp/3Q8vnwALDgTXHW5cw9U4hR0K1xFTWlxrSWDXJSvGqnBCMy7cmlEUnsu
yP7iL3E4Gcpj5LG4ulALRbRmgwEhsI+X5BuK067t86r5jdbOqVA=
=8KFv
-----END PGP SIGNATURE-----

--3B8V5ZYwBIDy/V61--
