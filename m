From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4] libfdt: tests: add get_next_tag_invalid_prop_len
Date: Fri, 7 Oct 2022 15:11:58 +1100
Message-ID: <Yz+nDsk1vmn8xzBY@yekko>
References: <20221006223155.3316133-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hO9ogC2P1PgBwg3F"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1665117891;
        bh=hrOjnbB4oejQaTnhGDdHYyHlciD8hGLFORyiosmnEsQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=klHIk4zLTaSzaNUww/HEFt3s0c16DLONmK4f51UTXyEeoizZdPm19Wb9rMnDcHC8q
         YmQew/OZXXURhPKpd6Ltd0mnj3HEmOqq+ODPYGq4hwWL3iSQ4znPDqn0OvxSYYg0Op
         I0zVevSMgOacOb9XW41T4JPg5vbTa5YfzEdY3Q94=
Content-Disposition: inline
In-Reply-To: <20221006223155.3316133-1-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--hO9ogC2P1PgBwg3F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 03:31:55PM -0700, Tadeusz Struk wrote:
> Add a new test get_next_tag_invalid_prop_len, which covers
> fdt_next_tag(), when it is passed an corrupted blob, with
> invalid property len values.
>=20
> Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Sorry, I was hoping I'd be able to apply this variant, but
unfortunately I realize I've given you some misleading advice in
earlier reviews, so there are still a few nits to squash, details
below.  Thanks for your patience.

> ---
> v4:
>  * I didn't keep track of the changes in the test code,
>    but this version should have all the comments addressed.
> ---
>  tests/.gitignore                      |  1 +
>  tests/Makefile.tests                  |  2 +-
>  tests/get_next_tag_invalid_prop_len.c | 76 +++++++++++++++++++++++++++
>  tests/meson.build                     |  1 +
>  tests/run_tests.sh                    |  1 +
>  5 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 tests/get_next_tag_invalid_prop_len.c
>=20
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 03bdde2..3376ed9 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -74,3 +74,4 @@ tmp.*
>  /truncated_memrsv
>  /utilfdt_test
>  /value-labels
> +/get_next_tag_invalid_prop_len
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index 2d36c5d..2c5b4c9 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -4,7 +4,7 @@ LIB_TESTS_L =3D get_mem_rsv \
>  	get_path supernode_atdepth_offset parent_offset \
>  	node_offset_by_prop_value node_offset_by_phandle \
>  	node_check_compatible node_offset_by_compatible \
> -	get_alias \
> +	get_alias get_next_tag_invalid_prop_len \
>  	char_literal \
>  	sized_cells \
>  	notfound \
> diff --git a/tests/get_next_tag_invalid_prop_len.c b/tests/get_next_tag_i=
nvalid_prop_len.c
> new file mode 100644
> index 0000000..20c51de
> --- /dev/null
> +++ b/tests/get_next_tag_invalid_prop_len.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: LGPL-2.1-or-later
> +/*
> + * libfdt - Flat Device Tree manipulation
> + *	Testcase for fdt_next_tag()
> + */
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdint.h>
> +
> +#include <libfdt.h>
> +#include "tests.h"
> +#include "testdata.h"
> +
> +#define FDT_SIZE 65536
> +#define CHECK_ERR(err) \
> +({ if (err) \
> +	FAIL("%s: %d: %s", __FILE__, __LINE__, fdt_strerror(err)); \
> +})
> +
> +int main(int argc, char *argv[])
> +{
> +	struct fdt_property *prp;
> +	void *fdt;
> +	int nextoff =3D 0, offset, err;
> +	uint32_t tag;
> +
> +	test_init(argc, argv);
> +	fdt =3D malloc(FDT_SIZE);
> +	if (!fdt)
> +		FAIL("Can't allocate memory");
> +	err =3D fdt_create(fdt, FDT_SIZE);
> +	CHECK_ERR(err);
> +	fdt_set_off_dt_strings(fdt, FDT_SIZE);

My comment about not needing to create the dummy reservemap entry was
misleading, sorry.  I was just referring to the actual dummy entry you
created with fdt_add_reservemap_entry.  You should still call
fdt_finish_reservemap() so that the blob is in the right state to call
fdt_begin_node().  Directly manipulating with fdt_set_off_dt_strings()
is unnecesarily fragile since it requires internal knowledge of how
the sw functions keep track of the state.

> +	err =3D fdt_begin_node(fdt, "");
> +	CHECK_ERR(err);
> +	err =3D fdt_property_u32(fdt, "prop-int-32", 0x1234);
> +	CHECK_ERR(err);
> +	err =3D fdt_property_u32(fdt, "prop2-int-32", 0x4321);
> +	CHECK_ERR(err);
> +	err =3D fdt_end_node(fdt);
> +	CHECK_ERR(err);

One more minor deficiency here I missed earlier.  You're not calling
fdt_finish(), so the blob is in sw state.  The read-only libfdt
functions are designed to work on sw state trees as well as finished
trees, but there are some internal logic differences to handle this.

You're probably mostly concerned with the original fdt_next_tag() bug
for finished trees, so it's probably better to call fdt_finish() so
that's the case you're testing.  Alternatively, you could test both
variants.  Since you're corrupting the tree, you'll need to
reconstruct the test blob for each variant.  You could either make a
helper function taking a parameter and call it twice, or make the
whole test binary take a parameter and invoke it twice from
run_tests.sh.

> +	offset =3D fdt_first_property_offset(fdt, 0);
> +	if (offset <=3D 0)
> +		FAIL("FAIL Invalid offset %x, expected value greater than 0\n",
> +		     offset);
> +
> +	/* Normal case */
> +	tag =3D fdt_next_tag(fdt, offset, &nextoff);
> +	if (tag !=3D FDT_PROP )
> +		FAIL("FAIL Invalid tag %x, expected FDT_PROP\n", tag);
> +
> +	/* Get a writable ptr to the first property and corrupt the lenght */
> +	prp =3D fdt_get_property_w(fdt, 0, "prop-int-32", NULL);
> +	if (!prp)
> +		FAIL("Bad property pointer");

My comment about using fdt_get_property_w() was also a bit misleading,
since I wasn't thinking about the fact that you need both the offset
(for fdt_next_tag()) and the direct pointer to the property struct.

This code is relying on the offset from fdt_first_property_offset()
and the pointer from fdt_get_property_w() referring to the same
location in the blob.  They will be, but it would be better to have
that be obvious by construction.

I'd suggest you first get the offset with fdt_first_property_offset(),
then compute the prp pointer from that with
fdt_get_property_by_offset().  You'll need a cast to remove the const
=66rom the latter in order to mangle the tree, of course.  If you wanted
to add a new fdt_get_property_by_offset_w() wrapper to do that cast,
that would also be fine (if you do, make it a separate patch please).
There's no particular rationale to which functions have _w() variants
and which don't (so far), I just made the _w() variants when I needed
them for other functions internally.

> +
> +	/* int overflow case */
> +	prp->len =3D cpu_to_fdt32(0xFFFFFFFA);
> +	tag =3D fdt_next_tag(fdt, offset, &nextoff);
> +	if (tag !=3D FDT_END)
> +		FAIL("Invalid tag %x, expected premature FDT_END", tag);
> +	if (nextoff !=3D -FDT_ERR_BADSTRUCTURE)
> +		FAIL("Invalid nextoff, expected error -FDT_ERR_BADSTRUCTURE");
> +
> +	/* negative offset case */
> +	prp->len =3D cpu_to_fdt32(0x7FFFFFFA);
> +	tag =3D fdt_next_tag(fdt, offset, &nextoff);
> +	if (tag !=3D FDT_END)
> +		FAIL("Invalid tag, expected premature FDT_END");
> +	if (nextoff !=3D -FDT_ERR_BADSTRUCTURE)
> +		FAIL("Invalid nextoff, expected error -FDT_ERR_BADSTRUCTURE");
> +
> +	free(fdt);
> +	PASS();
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 4ac154a..29a42dd 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -47,6 +47,7 @@ tests =3D [
>    'get_path',
>    'get_phandle',
>    'get_prop_offset',
> +  'get_next_tag_invalid_prop_len',
>    'getprop',
>    'incbin',
>    'integer-expressions',
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 244df8a..46678cb 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -513,6 +513,7 @@ libfdt_tests () {
>      run_dtc_test -I fs -O dts -o fs.test_tree1.test.dts $FSBASE/test_tre=
e1
>      run_dtc_test -I fs -O dtb -o fs.test_tree1.test.dtb $FSBASE/test_tre=
e1
>      run_test dtbs_equal_unordered -m fs.test_tree1.test.dtb test_tree1.d=
tb
> +    run_test get_next_tag_invalid_prop_len
> =20
>      ## https://github.com/dgibson/dtc/issues/64
>      check_tests "$SRCDIR/phandle-args-overflow.dts" clocks_property

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hO9ogC2P1PgBwg3F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM/pvQACgkQgypY4gEw
YSL3nxAAn1MEILHuAaDAJ9fWRmsl/f6RGiZMZHzYmiHaVFrgMHuKfn4rwrr7BS8f
wZXK/leHoKw7KERoeCbewG6fKOtifU+C0u3QxZ6URfwY2TRJMWMoKPxuVtS37LM9
EaJ5H0ucF4VtVcEM1IUYpFx0PSzkfCEhpY5+erCkXviI1jBT4jwweVgTcIoMsa4D
Cw8CGbfdTu1hAkk0dTo588CZ7Jee3mECHCRPKh90ecXGQzKEHVm8i7/G9W1ewBWl
65mUdk26JqN0mowQzmbS3N9VXX6nDvoXapjqDTaDSLk4INqDar4ZknhbOw1jlt6u
Bm6UB2x/gebiWAnDC1y58RX9hNfOJ1A2Z+pLIBNsYDNOoJcoHbqLoV/wdm5/Y3Qo
XW8IXqrR9FgVueHmAq2G9qdgzYLmveaq0iNsMilcoaLsawB0RMvuI3wLBc1O+jrq
ysCFt0/osziOTG172gPX6Nj0So79OdXGIbVtw1yzjJt5Kf7TVztYArbaFN+TXtsv
w0ry6DIILGZzwKgoG5bR3l1pIXQT7i5dIbVCPlKTCIp/naKoWHSPSyiDlwPSxJD1
wsgajmCmNGaEdo6ZqwMsw3gdGAAb3rKSCq0T5UlDNUvM1xa45MtUXQsen95dsVfd
rLNzPYUwsKyN+J4+6dP4nf3mwXwMLgKaUyqAlKhRanVF8qAJoW0=
=UHHF
-----END PGP SIGNATURE-----

--hO9ogC2P1PgBwg3F--
