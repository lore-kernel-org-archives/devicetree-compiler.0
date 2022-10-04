From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/2] libfdt: tests: add get_next_tag_invalid_prop_len
Date: Tue, 4 Oct 2022 18:15:15 +1100
Message-ID: <YzvdgweRbBi+A8G6@yekko>
References: <20220930152004.674591-1-tadeusz.struk@linaro.org>
 <20220930152004.674591-2-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CFJX5xrR0h4kScf6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1664867720;
        bh=BeJBfqp4geOWXyIkliGtRwz4fQdnsgVVa+AZMbI2YEk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l+vg5h5822kmD/AjStpUX/s0+H+J5DUJhx/4S3c5U7BTlen6RqsX2zW4IAXVH1tOh
         98cIg61mRD6neod1PxXE1RS/17OhRSBidKTcFojGNodyshWKwXk3Daq7eVVKmUthiZ
         GstBVO1Ch3RBky/w8ejqfiB9KrVD947Msm9WQu3c=
Content-Disposition: inline
In-Reply-To: <20220930152004.674591-2-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--CFJX5xrR0h4kScf6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 08:20:04AM -0700, Tadeusz Struk wrote:
> Add a new test get_next_tag_invalid_prop_len, which covers
> fdt_next_tag(), when it is passed an corrupted blob, with
> invalid property len values.
>=20
> Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  tests/.gitignore                      |  1 +
>  tests/Makefile.tests                  |  2 +-
>  tests/get_next_tag_invalid_prop_len.c | 65 +++++++++++++++++++++++++++
>  tests/meson.build                     |  1 +
>  tests/run_tests.sh                    |  1 +
>  5 files changed, 69 insertions(+), 1 deletion(-)
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
> index 0000000..c02f6a3
> --- /dev/null
> +++ b/tests/get_next_tag_invalid_prop_len.c
> @@ -0,0 +1,65 @@
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
> +int main(int argc, char *argv[])
> +{
> +	struct fdt_header *hdr;
> +	struct fdt_property *prp;
> +	void *fdt;
> +	int size, nextoff =3D 0;
> +	uint32_t tag;
> +
> +	test_init(argc, argv);
> +	size =3D sizeof(*hdr) + sizeof(*prp) + 256;
> +	fdt =3D calloc(1, size);
> +	if (!fdt)
> +		FAIL("Can't allocate memory");
> +
> +	hdr =3D fdt;
> +	prp =3D (struct fdt_property *)(((char *) fdt) + sizeof(*hdr));
> +	fdt_set_magic(fdt, FDT_MAGIC);
> +	fdt_set_totalsize(fdt, size);
> +	fdt_set_version(fdt, 0x10);
> +	prp->tag =3D cpu_to_fdt32(FDT_PROP);
> +	prp->len =3D cpu_to_fdt32(256);
> +	prp->nameoff =3D 0;

The dtb you're constructing here isn't a valid dtb, even before you
corrupt the property lengths: it doesn't have valid offsets to the
blocks, and you have no BEGIN_NODE tag for the root node.  That means
that in order to test the specific thing you want to test, you're
relying on *very* detailed knowledge of exactly how the code under
test works and what it does and doesn't check, which makes the test
unnecessarily fragile.

I'd really suggest building the initial tree with the fdt_sw functions
- or even more declaratively in trees.S - before corrupting it to test
the actual overflow condition.

> +	tag =3D fdt_next_tag(fdt, sizeof(*hdr), &nextoff);
> +	if (tag !=3D FDT_PROP)
> +		FAIL("Invalid tag %X", tag);
> +
> +	if (nextoff !=3D size)
> +		FAIL("Invalid next_offset");
> +
> +	/* int overflow case */
> +	prp->len =3D cpu_to_fdt32(0xFFFFFFFA);
> +	tag =3D fdt_next_tag(fdt, sizeof(*hdr), &nextoff);
> +	if (tag !=3D FDT_END)
> +		FAIL("Invalid tag, expected premature end");
> +
> +	if (nextoff !=3D -FDT_ERR_BADSTRUCTURE)
> +		FAIL("Invalid nextoff, expected error FDT_ERR_BADSTRUCTURE");
> +
> +	/* negative offset case */

Is there actually any meaningful difference between the "int overflow"
and "negative offset" cases?

> +	prp->len =3D cpu_to_fdt32(0x7FFFFFFA);
> +	tag =3D fdt_next_tag(fdt, sizeof(*hdr), &nextoff);
> +	if (tag !=3D FDT_END)
> +		FAIL("Invalid tag, expected premature end");


> +	if (nextoff !=3D -FDT_ERR_BADSTRUCTURE)
> +		FAIL("Invalid nextoff, expected error FDT_ERR_BADSTRUCTURE");
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
> index 244df8a..397b9cf 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -346,6 +346,7 @@ tree1_tests () {
>      run_test get_prop_offset $TREE
>      run_test get_phandle $TREE
>      run_test get_path $TREE
> +    run_test get_next_tag_invalid_prop_len $TREE #TREE not really needed

This doesn't belong with tree1_tests() since it has nothing to do with
test_tree1.  It should go under the "Specific bug tests" comment
instead.  Also, since you're not using a passed in tree blob, you
should modify the test code not to expect one.

>      run_test supernode_atdepth_offset $TREE
>      run_test parent_offset $TREE
>      run_test node_offset_by_prop_value $TREE

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CFJX5xrR0h4kScf6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM73XwACgkQgypY4gEw
YSL3kw/+KMGlZHCSP3fFyjLWMke3CgiV4cjWPk2UHAKYfUyQF24GIp0Ti4N8wuFh
1QAGbN2G5Y/B6n9sb9dtEjm8ajlCRx9/oanituvTzDkYgZRyPy1bciPP2h4RRKvj
kjaG/LYHEBHGox04BcgktrH13WhgUujgrf4HAhGJSukPAxehzPMsKmFMWTXRezc7
jTJWAWj7Oc8mpfoKVveOGVdPPR+xJJQ+DxGUaXkAII6h0brgXKMwVNt8dtS8gBsk
rYfECfZVRS1UIIdp5ES96VBLKsL+78IlWcoP00QEF0q6wnDhWsOhCTO/ESB8qoSB
YRLayYAdRYj+gd0p+Nwi+mLIEHvUzEMn1VYCcJgSqUMv3eXq3g1Rf9QgQHvUSKN/
JzB1SKalMYKoVwwhdcaqWRzYP6FBPqp7t5QdOOu5j9Ua3xGvrd9q1NArGFbCRxb4
GeBQklWz6Jeh4UrEzIehGFNqh4yFVOqVO6d9w7PM6EhXxONxBWK2HX/SQs5Cxl5z
jN0MS0TDTHUoxfX2LWrLz0Kf5tT64miUZ2qYffH6ebl2cIAKPQg2Ud5LfLQUuGrI
rH3qbbfkyAxsBkTJmbtxwndJq3O2xMMDM3Y+MZFin5F6AUCYdiHyqkjeus9IZAAN
IOujdXai5HPruc+CtaHAOGD4iYtnm3NoVZ/eb5n/BzH0qY0wFwA=
=+rHQ
-----END PGP SIGNATURE-----

--CFJX5xrR0h4kScf6--
