From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] libfdt: add helpers to read address and size from reg
Date: Fri, 10 Feb 2017 14:28:04 +1100
Message-ID: <20170210032804.GJ27610@umbus.fritz.box>
References: <20170207165806.29683-1-d-gerlach@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R8CP7fzfAHpwDIZp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486697880;
        bh=TPq8NZx2mfiIQnvRlQglNO9Ru8g7QJtOUejCXd/E4Lg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rd2rupv6qsaYWV0RtdjbpWyhAA0+k5P7QDeIfBahgqlO1rYLoLsVqqU7Js37Mq1Sd
         9YNRzEdqeSb0zp1Wfi2y9dkUNCNbH6tavOGZukcklVFt2zSlzo8H76BW0m675T2Ri9
         hDsErvwc7EwSbmAwwrtNMM1ECt0P5CCzApYN7oP4=
Content-Disposition: inline
In-Reply-To: <20170207165806.29683-1-d-gerlach-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--R8CP7fzfAHpwDIZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 10:58:06AM -0600, Dave Gerlach wrote:
> From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
>=20
> This patch extends the capability of libfdt to parse the contents of devi=
ce
> trees in a similar manner to fdt_address_cells and fdt_size_cells.
>=20
> It adds a helper function which reads the address and size of a device fr=
om
> the reg property and performs basic sanity checks.
>=20
> It does not perform translation to a physical address using the ranges
> properties of parents, but this enhancement may be added as a separate
> function in the future.
>=20
> Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>
> ---
> v2->v3: Added a note to fdt_simple_addr_size comment that it is expensive
> 		due to call to fdt_parent_offset.

This changelog doesn't seem to be accurate.  Since v2 the
fdt_read_integer() and the variants which _don't_ rely on
fdt_parent_offset() seems to have been removed entirely, which doesn't
seem like a good idea.

I'm going to send review comments on v2 instead, because of that.

>=20
>  libfdt/fdt_addresses.c | 62 ++++++++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h        | 33 ++++++++++++++++++++++
>  libfdt/version.lds     |  1 +
>  tests/.gitignore       |  1 +
>  tests/Makefile.tests   |  2 +-
>  tests/addr_size.c      | 74 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/addresses.dts    | 11 ++++++++
>  tests/run_tests.sh     |  1 +
>  8 files changed, 184 insertions(+), 1 deletion(-)
>  create mode 100644 tests/addr_size.c
>=20
> diff --git a/libfdt/fdt_addresses.c b/libfdt/fdt_addresses.c
> index eff4dbcc729d..92cbed95f8ba 100644
> --- a/libfdt/fdt_addresses.c
> +++ b/libfdt/fdt_addresses.c
> @@ -55,6 +55,9 @@
> =20
>  #include "libfdt_internal.h"
> =20
> +#define BYTES_PER_CELL 4
> +#define BITS_PER_CELL 32
> +
>  int fdt_address_cells(const void *fdt, int nodeoffset)
>  {
>  	const fdt32_t *ac;
> @@ -94,3 +97,62 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
> =20
>  	return val;
>  }
> +
> +static uint64_t _fdt_read_cells(const fdt32_t *cells, int n)
> +{
> +	int i;
> +	uint64_t res;
> +
> +	/* TODO: Support values larger than 2 cells */
> +	if (n > 2)
> +		return -FDT_ERR_BADNCELLS;
> +
> +	res =3D 0;
> +	for (i =3D 0; i < n; i++) {
> +		res <<=3D BITS_PER_CELL;
> +		res |=3D fdt32_to_cpu(cells[i]);
> +	}
> +
> +	return res;
> +}
> +
> +int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
> +			 uintptr_t *addr, size_t *size)
> +{
> +	int parent;
> +	int ac, sc, reg_stride;
> +	int res;
> +	const fdt32_t *reg;
> +
> +	reg =3D fdt_getprop(fdt, nodeoffset, "reg", &res);
> +	if (res < 0)
> +		return res;
> +
> +	parent =3D fdt_parent_offset(fdt, nodeoffset);
> +	if (parent < 0)
> +		return res;
> +
> +	ac =3D fdt_address_cells(fdt, parent);
> +	if (ac < 0)
> +		return ac;
> +
> +	sc =3D fdt_size_cells(fdt, parent);
> +	if (sc < 0)
> +		return sc;
> +
> +	reg_stride =3D ac + sc;
> +	/*
> +	 * res is the number of bytes read and must be an even multiple of the
> +	 * sum of ac and sc.
> +	 */
> +	if ((res % (reg_stride * BYTES_PER_CELL)) !=3D 0)
> +		return -FDT_ERR_BADVALUE;
> +
> +	if (addr)
> +		*addr =3D (uintptr_t) _fdt_read_cells(&reg[reg_stride * idx], ac);
> +	if (size)
> +		*size =3D (size_t) _fdt_read_cells(&reg[ac + reg_stride * idx],
> +						 sc);
> +
> +	return 0;
> +}
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c69e9188996f..3788482eea5f 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1085,6 +1085,39 @@ int fdt_address_cells(const void *fdt, int nodeoff=
set);
>   */
>  int fdt_size_cells(const void *fdt, int nodeoffset);
> =20
> +/**
> + *
> + * fdt_simple_addr_size - read address and/or size from the reg property=
 of a
> + *                        device node.
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node to find the address and/or size from
> + * @idx: which address/size pair to read
> + * @addrp: pointer to where address will be stored (will be overwritten)=
 or NULL
> + * @sizep: pointer to where size will be stored (will be overwritten) or=
 NULL
> + *
> + * When the node has a valid reg property, returns the address and/or si=
ze
> + * values stored there. It does not perform any type of translation base=
d on
> + * the parent bus(es).
> + *
> + * NOTE: This function is expensive, as it must scan the device tree
> + * structure from the start to nodeoffset, *twice*, with fdt_parent_offs=
et.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_BADVALUE, if there is an unexpected number of entries in the
> + *		reg property
> + *	-FDT_ERR_NOTFOUND, if the node does not have a reg property
> + *	-FDT_ERR_BADNCELLS, if the number of address or size cells is invalid
> + *		or greater than 2 (which is the maximum currently supported)
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_BADSTRUCTURE,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_TRUNCATED, standard meanings
> + */
> +
> +int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
> +			 uintptr_t *addrp, size_t *sizep);
> =20
>  /**********************************************************************/
>  /* Write-in-place functions                                           */
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index cff0358f2314..075ffab44ef3 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -59,6 +59,7 @@ LIBFDT_1.2 {
>  		fdt_next_subnode;
>  		fdt_address_cells;
>  		fdt_size_cells;
> +		fdt_simple_addr_size;
>  		fdt_stringlist_contains;
>  		fdt_resize;
>  		fdt_overlay_apply;
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 9e209d5cbe6b..acb9335e16c8 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -43,6 +43,7 @@ tmp.*
>  /path_offset
>  /path_offset_aliases
>  /phandle_format
> +/addr_size
>  /property_iterate
>  /propname_escapes
>  /references
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index 3d7a4f82f067..75fe5c1d6b16 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -8,7 +8,7 @@ LIB_TESTS_L =3D get_mem_rsv \
>  	char_literal \
>  	sized_cells \
>  	notfound \
> -	addr_size_cells \
> +	addr_size_cells addr_size \
>  	stringlist \
>  	setprop_inplace nop_property nop_node \
>  	sw_tree1 \
> diff --git a/tests/addr_size.c b/tests/addr_size.c
> new file mode 100644
> index 000000000000..8463efc416c4
> --- /dev/null
> +++ b/tests/addr_size.c
> @@ -0,0 +1,74 @@
> +/*
> + * libfdt - Flat Device Tree manipulation
> + *	Testcase for address and size handling
> + * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * Based on addr_size_cells.c by David Gibson, <david-xT8FGy+AXnRB3Ne2BGzF6ryscVyMRj84@public.gmane.org=
=2Eau>
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms of the GNU Lesser General Public License as published=
 by
> + * the Free Software Foundation; either version 2.1 of the License, or (=
at
> + * your option) any later version.
> + *
> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any kind,
> + * whether express or implied; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
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
> +static void check_node(const void *fdt, const char *path, int idx,
> +		       uintptr_t addr, size_t size)
> +{
> +	int offset, res;
> +	uintptr_t xaddr;
> +	uintptr_t xsize;
> +
> +	offset =3D fdt_path_offset(fdt, path);
> +	if (offset < 0)
> +		FAIL("Couldn't find path %s", path);
> +
> +	res =3D fdt_simple_addr_size(fdt, offset, idx, &xaddr, &xsize);
> +	if (res < 0)
> +		FAIL("fdt_simple_addr_size gave error: %s", fdt_strerror(res));
> +
> +	if (xaddr !=3D addr)
> +		FAIL("Physical address for %s is %p instead of %p\n",
> +		     path, (void *) xaddr, (void *) addr);
> +
> +	if (xsize !=3D size)
> +		FAIL("Size for %s is %zx instead of %zx\n",
> +		     path, xsize, size);
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
> +	check_node(fdt, "/identity-bus@0/id-device@400", 0,
> +		   0x400, 0x100);
> +	check_node(fdt, "/simple-bus@1000000/sb-device@8000000800", 0,
> +		   0x8000000800, 0x200);
> +	check_node(fdt, "/identity-bus@0/id-device@400", 1,
> +		   0x400000000, 0x100000030);
> +	check_node(fdt, "/simple-bus@1000000/sb-device@8000000800", 1,
> +		   0x70000000, 0x700);
> +	check_node(fdt, "/simple-bus@1000000/sb-device@8000000800", 2,
> +		   0x1050000000, 0x20);
> +	PASS();
> +}
> diff --git a/tests/addresses.dts b/tests/addresses.dts
> index a2faaf59fd7a..32c43795d67d 100644
> --- a/tests/addresses.dts
> +++ b/tests/addresses.dts
> @@ -6,10 +6,21 @@
>  	#size-cells =3D <2>;
> =20
>  	identity-bus@0 {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		id-device@400 {
> +			reg =3D <0x0 0x00000400 0x0 0x00000100>,
> +			      <0x4 0x00000000 0x1 0x00000030>;
> +		};
>  	};
> =20
>  	simple-bus@1000000 {
>  		#address-cells =3D <2>;
>  		#size-cells =3D <1>;
> +		sb-device@8000000800 {
> +			reg =3D <0x80 0x00000800 0x200>,
> +			      <0x00 0x70000000 0x700>,
> +			      <0x10 0x50000000 0x020>;
> +		};
>  	};
>  };
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index ed489dbdd269..55b5dc816f71 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -285,6 +285,7 @@ libfdt_tests () {
> =20
>      run_dtc_test -I dts -O dtb -o addresses.test.dtb addresses.dts
>      run_test addr_size_cells addresses.test.dtb
> +    run_test addr_size addresses.test.dtb
> =20
>      run_dtc_test -I dts -O dtb -o stringlist.test.dtb stringlist.dts
>      run_test stringlist stringlist.test.dtb

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--R8CP7fzfAHpwDIZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnTNEAAoJEGw4ysog2bOSyBYP/iCaN6PFTkPZ0bxRIF6ot5mz
kdDdS91Kfuq3cTHCrevDeIa0f8uwDOXVavhcSxNXxihiSdmuEOk+kmUgtGiy/jnc
DnCpffvzEyf5IUvxSECGhi/b9gfOvgg+JSW+n4fDOWjKuVQ/g/4xibvBJpL41Kqa
8FAvPGx3Rp/tYftUiscPbNFENFOGCVGCZ5I+mMZ5qqfiNxTJgODkh3GxxBjTzz4a
8oe14m1ATMlyExcBqOKfXvqvTwn/fwLe6XtcnrxP2zLEI9YUIupheGbiKydxRl7h
bt9Jwkh74TVyilzxc/51txJPePtwJZfVkrOTXIn0A50WMdSrH7vBPNt891JTsBNj
p8spmNbcnh6I0AD89HaQQCXr10ZALqgEUhJ7lwj3Ekj2UjXPT2+ECjuiO2YVbVKM
5FIY0D6DoD3ONCxC6s+KBRp6aJ+rDbvQlDdb6JLMtdzsZGHEEuSSTzIj9zNIMzD/
grIQCmOuVGtrtCAwaBNRUI1F6ZIsOVvxTlLMNVPzsQIR4+dpXZ/Y5A3gSTekGDp2
qcL+7xBJ4iGMNqdTlQqdNzeCxmktWOPLQCyhprH/r05Yf6VNZeH0hYKtluxOyMyB
1ZiYIC8KS31y6hvwIznQk2Nv1SOJQlPqoGhx78tTSzTOa5Ox0CGPHjyCUFHS0EZW
z1ceX8XQg9ul7y6oAzel
=HYam
-----END PGP SIGNATURE-----

--R8CP7fzfAHpwDIZp--
