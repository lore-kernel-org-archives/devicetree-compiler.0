From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] fdt: Add a function to count strings
Date: Wed, 15 Jul 2015 23:41:30 +1000
Message-ID: <20150715134130.GA1567@voom.fritz.box>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
 <1436958839-14793-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436958839-14793-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2015 at 01:13:57PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Given a device tree node and a property name, the fdt_count_strings()
> function counts the number of strings found in the property value.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  libfdt/fdt_ro.c      | 20 ++++++++++++++++
>  libfdt/libfdt.h      |  9 ++++++++
>  tests/.gitignore     |  1 +
>  tests/Makefile.tests |  1 +
>  tests/run_tests.sh   |  3 +++
>  tests/strings.c      | 64 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/strings.dts    | 10 ++++++++
>  7 files changed, 108 insertions(+)
>  create mode 100644 tests/strings.c
>  create mode 100644 tests/strings.dts
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index a65e4b5b72b6..874975a0d8ad 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -538,6 +538,26 @@ int fdt_stringlist_contains(const char *strlist, int=
 listlen, const char *str)
>  	return 0;
>  }
> =20
> +int fdt_count_strings(const void *fdt, int nodeoffset, const char *prope=
rty)
> +{
> +	int length, i, count =3D 0;
> +	const char *list;
> +
> +	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
> +	if (!list)
> +		return -length;
> +
> +	for (i =3D 0; i < length; i++) {
> +		int len =3D strlen(list);

I like the concept of these patches, but this implementation is unsafe
if the given property does not, in fact, contain a list of \0
terminated strings.

> +		list +=3D len + 1;
> +		i +=3D len;
> +		count++;
> +	}
> +
> +	return count;
> +}
> +
>  int fdt_node_check_compatible(const void *fdt, int nodeoffset,
>  			      const char *compatible)
>  {
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 1054512814bc..93deec13655b 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -868,6 +868,15 @@ int fdt_node_offset_by_compatible(const void *fdt, i=
nt startoffset,
>   */
>  int fdt_stringlist_contains(const char *strlist, int listlen, const char=
 *str);
> =20
> +/**
> + * fdt_count_strings - count the number of strings in a string list
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of a tree node
> + * @property: name of the property containing the string list
> + * @return: the number of strings in the given property
> + */
> +int fdt_count_strings(const void *fdt, int nodeoffset, const char *prope=
rty);
> +
>  /**********************************************************************/
>  /* Read-only functions (addressing related)                           */
>  /**********************************************************************/
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 5656555f9cbc..09a1d3b84f6f 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -49,6 +49,7 @@ tmp.*
>  /setprop_inplace
>  /sized_cells
>  /string_escapes
> +/strings
>  /subnode_iterate
>  /subnode_offset
>  /supernode_atdepth_offset
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index 9adedecdff3d..415e4d670f2c 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -9,6 +9,7 @@ LIB_TESTS_L =3D get_mem_rsv \
>  	sized_cells \
>  	notfound \
>  	addr_size_cells \
> +	strings \
>  	setprop_inplace nop_property nop_node \
>  	sw_tree1 \
>  	move_and_save mangle-layout nopulate \
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 5268293434af..92ee96340c29 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -198,6 +198,9 @@ libfdt_tests () {
>      run_dtc_test -I dts -O dtb -o addresses.test.dtb addresses.dts
>      run_test addr_size_cells addresses.test.dtb
> =20
> +    run_dtc_test -I dts -O dtb -o strings.test.dtb strings.dts
> +    run_test strings strings.test.dtb
> +
>      # Sequential write tests
>      run_test sw_tree1
>      tree1_tests sw_tree1.test.dtb
> diff --git a/tests/strings.c b/tests/strings.c
> new file mode 100644
> index 000000000000..642057d1c8d9
> --- /dev/null
> +++ b/tests/strings.c
> @@ -0,0 +1,64 @@
> +/*
> + * libfdt - Flat Device Tree manipulation
> + *	Testcase for string handling
> + * Copyright (C) 2015 NVIDIA Corporation
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public License
> + * as published by the Free Software Foundation; either version 2.1 of
> + * the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 =
USA
> + */
> +
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdint.h>
> +
> +#include <libfdt.h>
> +
> +#include "tests.h"
> +#include "testdata.h"
> +
> +static void check_string_count(const void *fdt, const char *path,
> +			       const char *property, int count)
> +{
> +	int offset, err;
> +
> +	offset =3D fdt_path_offset(fdt, path);
> +	if (offset < 0)
> +		FAIL("Couldn't find path %s", path);
> +
> +	err =3D fdt_count_strings(fdt, offset, property);
> +	if (err < 0)
> +		FAIL("Failed to count strings: %d\n", err);
> +
> +	if (err !=3D count)
> +		FAIL("String count for %s is %d instead of %d\n",
> +		     path, err, count);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	void *fdt;
> +
> +	if (argc !=3D 2)
> +		CONFIG("Usage: %s <dtb file>\n", argv[0]);
> +
> +	test_init(argc, argv);
> +	fdt =3D load_blob(argv[1]);
> +
> +	check_string_count(fdt, "/", "compatible", 1);
> +	check_string_count(fdt, "/device", "compatible", 2);
> +	check_string_count(fdt, "/device", "big-endian", 0);
> +
> +	PASS();
> +}
> diff --git a/tests/strings.dts b/tests/strings.dts
> new file mode 100644
> index 000000000000..04c2c202ec77
> --- /dev/null
> +++ b/tests/strings.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +
> +/ {
> +	compatible =3D "foo";
> +
> +	device {
> +		compatible =3D "bar", "baz";
> +		big-endian;
> +	};
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVpmMKAAoJEGw4ysog2bOSXRcQANsvfTvme+yudh+GdBSu2xTQ
0NVJa9fVmD2+iDVWifXDqpj4jlN0lndLJ+kraKARYwgNm1F2WO0VD3rJ7azn7+2a
KKE/5RIdAWzC282QMqs8QC2rbqSADrBUEfTgj5kc3Kce1XGe1Dt0QCXQb/a7ZVz9
zTuyq9ffFetXYAXsIEloxyiFD2w9C8mdGo/BTNC3WN3I4PGIF4Thx58tBgt0fBXh
iOcc35fCtmU0xFefPGL7FNfze9yGiZVM1sHdpw50PL3hRoQxQuGGlN1FKCPu9qZY
BWOPSMSQ5i7ZWr273JvoS9OOGxJyL4OyhGPVT54mXT/ING/sPOhvCShc69JQH/FP
K+ClEmB0XCrFSU9sdMxq5dMkGdjrcVQG238Tq1uLC3cw4pnIfDf2xbNczCQ3vkED
dgLPDVkVB4tJFnrNj9XZCe6pJysKRq+5NUjzZ4nUHxOVdIspwyIpkMx9WGanR/jT
xcLlzBfvGtIf6hvkvUz1KLUsUVlbcU0uur4lWGtdZ54588VWyvsHAdXZlUtrf5zP
Luv8wc/lf3PixwFN3f2hoW3roWIT6sHDVV/siD1RVdnMzbnos0F2QqhjDdBLnZOa
eeBo6lG1HqScW1+Tso82FTBKSjFn0My6shI464rFux/FgcNNO0OFvl4VB3wqzbij
+lf9o4+vGZbtKcc2N/+L
=s6KK
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
