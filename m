From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 2/2] libfdt: tests: add get_next_tag_invalid_prop_len
Date: Tue, 11 Oct 2022 13:06:46 +1100
Message-ID: <Y0TPtnyx/FlfUlBV@yekko>
References: <20221007191116.161426-1-tadeusz.struk@linaro.org>
 <20221007191116.161426-2-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MMoFPUYb+VylT20C"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1665454199;
        bh=IBL1aNTqyHXmPPQWHZ2NPUX1M6yITYJxYmDAITgIcug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nuXnQnOItqcm5/8rFhsbBWPMmGWHUjZ6bmg6xWkE9RYv9liHJD2+3B1+ygp9C0/Vr
         Fo5I+Av6Tl+B7xoqMOIoFrU/6Oq3qzvi/MKBmYrqLqRIQJXXumB6cBnlUR/NGP+p50
         cgDyupNmt2Pgm8EXkAq2K2/CLK0eINTHW+EdO+cw=
Content-Disposition: inline
In-Reply-To: <20221007191116.161426-2-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--MMoFPUYb+VylT20C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 12:11:16PM -0700, Tadeusz Struk wrote:
> Add a new test get_next_tag_invalid_prop_len, which covers
> fdt_next_tag(), when it is passed an corrupted blob, with
> invalid property len values. The test runs twice, on a blob
> in sw and finished state.
>=20
> Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> v5:
>  * Add back fdt_finish_reservemap() instead of directly calling
>    fdt_set_off_dt_strings()
>  * Call the test twice, on the blob in sw, and finished state
>  * Use the new fdt_get_property_by_offset_w() helper to get the
>    pointer to the property at a given address.
> v4:
>  * I didn't keep track of the changes in the test code,
>    but this version should have all the comments addressed.
> ---
>  tests/.gitignore                      |   1 +
>  tests/Makefile.tests                  |   2 +-
>  tests/get_next_tag_invalid_prop_len.c | 106 ++++++++++++++++++++++++++
>  tests/meson.build                     |   1 +
>  tests/run_tests.sh                    |   1 +
>  5 files changed, 110 insertions(+), 1 deletion(-)
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
> index 0000000..dc42412
> --- /dev/null
> +++ b/tests/get_next_tag_invalid_prop_len.c
> @@ -0,0 +1,106 @@
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
> +#define RET_FAIL(fmt, ...) \
> +({ \
> +	printf("FAIL\t"fmt "\n", ##__VA_ARGS__); \
> +	return -1; \
> +})

I don't really see the point of RET_FAIL(), why not just call FAIL()
directly?  I guess you want to make it clear which variant the failure
is coming from, but I'd suggest adding that to the individual FAIL
messages instead (which could be as simple as adding "finished=3D%d" to
each one.

> +#define CHECK_ERR(err) \
> +({ if (err) \
> +	FAIL("%s: %d: %s", __FILE__, __LINE__, fdt_strerror(err)); \
> +})
> +
> +static int fdt_next_tag_test(bool fdt_finished)
> +{
> +	struct fdt_property *prp;
> +	void *fdt;
> +	int nextoff =3D 0, offset, err;
> +	uint32_t tag;
> +
> +	fdt =3D malloc(FDT_SIZE);
> +	if (!fdt)
> +		FAIL("Can't allocate memory");
> +	err =3D fdt_create(fdt, FDT_SIZE);
> +	CHECK_ERR(err);
> +	err =3D fdt_finish_reservemap(fdt);
> +	CHECK_ERR(err);
> +	/* Create a root node and add two properties */
> +	err =3D fdt_begin_node(fdt, "");
> +	CHECK_ERR(err);
> +	err =3D fdt_property_u32(fdt, "prop-int-32", 0x1234);
> +	CHECK_ERR(err);
> +	err =3D fdt_property_u32(fdt, "prop2-int-32", 0x4321);
> +	CHECK_ERR(err);
> +	err =3D fdt_end_node(fdt);
> +	CHECK_ERR(err);
> +	if (fdt_finished) {
> +		/* Call ftd_finish to set the correct ftd state. */

It's "fdt" not "ftd" (same mistake in a number of places).

> +		err =3D fdt_finish(fdt);
> +		CHECK_ERR(err);
> +	}
> +
> +	offset =3D fdt_first_property_offset(fdt, 0);
> +	if (offset <=3D 0)
> +		RET_FAIL("Invalid offset %x, expected value greater than 0\n", offset);
> +
> +	/* Normal case */
> +	tag =3D fdt_next_tag(fdt, offset, &nextoff);
> +	if (tag !=3D FDT_PROP)
> +		RET_FAIL("Invalid tag %x, expected FDT_PROP\n", tag);
> +	if (nextoff <=3D 0)
> +		RET_FAIL("Invalid nextoff %d, expected value greater than 0", nextoff);
> +
> +	/* Get a writable ptr to the first property and corrupt the lenght */

s/lenght/length/

> +	prp =3D fdt_get_property_by_offset_w(fdt, offset, NULL);
> +	if (!prp)
> +		RET_FAIL("Bad property pointer");
> +
> +	/* int overflow case */
> +	prp->len =3D cpu_to_fdt32(0xFFFFFFFA);
> +	tag =3D fdt_next_tag(fdt, offset, &nextoff);
> +	if (tag !=3D FDT_END)
> +		RET_FAIL("Invalid tag %x, expected premature FDT_END", tag);
> +	if (nextoff !=3D -FDT_ERR_BADSTRUCTURE)
> +		RET_FAIL("Invalid nextoff, expected error -FDT_ERR_BADSTRUCTURE");
> +
> +	/* negative offset case */
> +	prp->len =3D cpu_to_fdt32(0x7FFFFFFA);
> +	tag =3D fdt_next_tag(fdt, offset, &nextoff);
> +	if (tag !=3D FDT_END)
> +		RET_FAIL("Invalid tag %x, expected premature FDT_END", tag);
> +	if (nextoff !=3D -FDT_ERR_BADSTRUCTURE)
> +		RET_FAIL("Invalid nextoff, expected error -FDT_ERR_BADSTRUCTURE");
> +
> +	free(fdt);
> +	return 0;
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	int res;
> +
> +	test_init(argc, argv);
> +
> +	res =3D fdt_next_tag_test(false);
> +	if (res)
> +		FAIL("Failed test ftd in sw state");
> +
> +	res =3D fdt_next_tag_test(true);
> +	if (res)
> +		FAIL("Failed test ftd in finished state");
> +
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

--MMoFPUYb+VylT20C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmNEz7AACgkQgypY4gEw
YSIFyQ//dWDQTgQGTNa4ps6D/7K1oG7Dp6cdpF6dFPVbEwB3AN+NgjDeoXEXhlyZ
ouRfN1fqvxnFT7220iFNa2j4OCevS7UykfdaSxVUhcfC8jAUkBR16i8EjzKMg9Uc
jGiPSp/CSM71G3gR+sfawyhRuYRFyB7/nF2dlL2vYgl/eie+QL/oQFEs1JZP8nyO
zHnn6dv/tjgh4u3NlNVqX+DgAYkwTvx4E9djb34BTWsGnq5luoaNM4+BLC1zueBA
h0PlRMGHFnzCWVAF7eJAT/I/Zq/kjlpVWTEmIt0QLW5M2HMj9EMnlLqlJm7nlKs+
5Qyb3RNzcZX1AWbEmCCFjNk7ZIKRv3miS+9XRFi1UnI7hh4PVXT05uQ7mpeem5H4
eg+Pbe1+C4oz6KueOE1CPdkFr3DAYI5vqJvnO0TAlhgX6iyym+RryPnzF33aFyd5
mjrDULdcw0HyzXuVjOWIu5WQ/EMpKBoZ5QxDJiwg+lFSVr5/oot+0tgV8AjJ6bCL
NeycHAKAJsDIL5p1RyZsxGfJh17dCqCYknphnwDMBmlfa+SRW1TexVvWouNI7yuU
N3r5PjeE7zZJnYKUfHvrYTIhb6NnR9v3qLZ5EsegFeUmzmR0G8St3PElToh6GoBg
jvx9BBRP4EarcyFtfXcGNxzZs/R3b+2swVLHrcLXT148q115+vU=
=+73B
-----END PGP SIGNATURE-----

--MMoFPUYb+VylT20C--
