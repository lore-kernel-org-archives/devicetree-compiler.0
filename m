From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 2/2] libfdt: tests: add get_next_tag_invalid_prop_len
Date: Wed, 12 Oct 2022 10:51:38 +1100
Message-ID: <Y0YBilqnDQvv6caS@yekko>
References: <20221011182611.116011-1-tadeusz.struk@linaro.org>
 <20221011182611.116011-2-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3VeLVIlCwK0Mzsuu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1665534887;
        bh=tKtK1bWjzZeKd1zcVTSOOYgdcTnsRT54RjuyNoSJ27c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DIOV9rmFuAVank5jRbVIUlj9Yn2/Y3n1ao3Y85riTbt8d+GAsx0hG2CGPxz7YaVym
         tU9rRF4eAm7e6e0wjeQekRMNWapWSNhaL/xNeqxjsACN6vDkRcvRWeXwl/8Km1lO2X
         j+wXPHmgndc9VOR3SR6YW4DcNSIbosbqz0kuY+7g=
Content-Disposition: inline
In-Reply-To: <20221011182611.116011-2-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--3VeLVIlCwK0Mzsuu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 11:26:11AM -0700, Tadeusz Struk wrote:
> Add a new test get_next_tag_invalid_prop_len, which covers
> fdt_next_tag(), when it is passed an corrupted blob, with
> invalid property len values. The test runs twice, on a blob
> in sw and finished state.
>=20
> Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Merged, thanks.

> ---
> v6:
>  * Remove RET_FAIL and call FAIL directly.
>  * Fix typos
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
>  tests/get_next_tag_invalid_prop_len.c | 100 ++++++++++++++++++++++++++
>  tests/meson.build                     |   1 +
>  tests/run_tests.sh                    |   1 +
>  5 files changed, 104 insertions(+), 1 deletion(-)
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
> index 0000000..25d57c3
> --- /dev/null
> +++ b/tests/get_next_tag_invalid_prop_len.c
> @@ -0,0 +1,100 @@
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
> +static void fdt_next_tag_test(bool fdt_finished)
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
> +		/* Call fdt_finish to set the correct fdt state. */
> +		err =3D fdt_finish(fdt);
> +		CHECK_ERR(err);
> +	}
> +
> +	offset =3D fdt_first_property_offset(fdt, 0);
> +	if (offset <=3D 0)
> +		FAIL("Invalid offset %x, expected value greater than 0, finished=3D%d\=
n",
> +		     offset, fdt_finished);
> +
> +	/* Normal case */
> +	tag =3D fdt_next_tag(fdt, offset, &nextoff);
> +	if (tag !=3D FDT_PROP)
> +		FAIL("Invalid tag %x, expected FDT_PROP, finished=3D%d\n",
> +		     tag, fdt_finished);
> +	if (nextoff <=3D 0)
> +		FAIL("Invalid nextoff %d, expected value greater than 0, finished=3D%d=
",
> +		     nextoff, fdt_finished);
> +
> +	/* Get a writable ptr to the first property and corrupt the length */
> +	prp =3D fdt_get_property_by_offset_w(fdt, offset, NULL);
> +	if (!prp)
> +		FAIL("Bad property pointer, finished=3D%d", fdt_finished);
> +
> +	/* int overflow case */
> +	prp->len =3D cpu_to_fdt32(0xFFFFFFFA);
> +	tag =3D fdt_next_tag(fdt, offset, &nextoff);
> +	if (tag !=3D FDT_END)
> +		FAIL("Invalid tag %x, expected premature FDT_END, finished=3D%d",
> +		     tag, fdt_finished);
> +	if (nextoff !=3D -FDT_ERR_BADSTRUCTURE)
> +		FAIL("Invalid nextoff, expected error -FDT_ERR_BADSTRUCTURE, finished=
=3D%d",
> +		     fdt_finished);
> +
> +	/* negative offset case */
> +	prp->len =3D cpu_to_fdt32(0x7FFFFFFA);
> +	tag =3D fdt_next_tag(fdt, offset, &nextoff);
> +	if (tag !=3D FDT_END)
> +		FAIL("Invalid tag %x, expected premature FDT_END, finished=3D%d",
> +		     tag, fdt_finished);
> +	if (nextoff !=3D -FDT_ERR_BADSTRUCTURE)
> +		FAIL("Invalid nextoff, expected -FDT_ERR_BADSTRUCTURE, finished=3D%d",
> +		     fdt_finished);
> +
> +	free(fdt);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	test_init(argc, argv);
> +
> +	fdt_next_tag_test(false);
> +	fdt_next_tag_test(true);
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

--3VeLVIlCwK0Mzsuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmNGAYQACgkQgypY4gEw
YSKrYQ/+NGSQwtM/TQpnf8e2e8+AXvMZUX/bB3R07HeLrQH//vcl2QEUjw1ljUma
oAJjFbIQIugAQlqNedyicS1Neq86zeiMOpJkCRir5JQs58wQF8K6MlQ7vMoTLzD0
XXdTO1x30QgwMp6QKmt9gOOj87di3juIiSJlVb9QBngu4TrKvh9eWejF3GV2Qi4/
CDE8TswP+2Nrjq20NDzBEoI6PYYgZvGKFx/wc3bXJKcqhCq3OHwhxLcCapkCQGWn
olHOnR/YcqEb+4sL89+QxfdLX3ZN5LGln79NDsDwee+bn4tAaiSapi7BU5HqZp/3
LiWzDV1QgD1v28Jr3fPBz8ueVPlaTD7z7aXD1K5/wQviyG/RM3LdenKY17OY/jt2
a0rde93tTo/rj8V2nf90SNt4uIdhp/Pi/2zn7J1ay3SwJBsQFQ4yvNHAjHx6G6xx
4dKadM1dODaW/hAUxBiCTTXUfikq4/8PORW3gFZP3Lq1beSgY3fHRfoQEf0Vmkg7
cVLK/cu6FxXUWZ6IPtChYz8vTywFdm3GODiwoZc1lTg0p5K2N9oWGA/n9GUqqk+Z
29g0Lp9r37horoYgFJlLIozQJovg52dw65oIv7Wd60gB1ssoZfRo8BRwf5wiWpqE
Tk1jQwpIDHrj1WzR/MVDmmEvOc9uZUysTW1KfksLFTQgxXKRGIM=
=a4q1
-----END PGP SIGNATURE-----

--3VeLVIlCwK0Mzsuu--
