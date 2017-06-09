From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4] libfdt: add helpers to read address and size from reg
Date: Fri, 9 Jun 2017 10:36:25 +1000
Message-ID: <20170609003625.GA26521@umbus.fritz.box>
References: <20170607175048.18125-1-d-gerlach@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1496968639;
        bh=RHmFrCKIz2h/dsZUvcy8gKaGnNb3Zxm69VH0OAcIlas=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hBQMLJvr42mFofC8lm2s9CWqbF4SPhiPmCgwKNkbhjyo4a9+1FVtjNL2RVyUauz7m
         UEZRe4gxGQoYXG+jzi2ASi/zxWTLoWaZfm6bfOt0xrXRGs0fM19W2BQFLE2QMYZzVp
         LvVr8bY+ZJse7Cg31quvErxE8u8cqsqxQ1eQsIBg=
Content-Disposition: inline
In-Reply-To: <20170607175048.18125-1-d-gerlach-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2017 at 12:50:48PM -0500, Dave Gerlach wrote:
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

Good in concept, but some flaws in implementation; see below.

> ---
>=20
> This is a rebase and resend of v2 found here [1] which never received
> any comments. v2 was resent rather than v3 because of this comment [2]
> from David Gibson.

Sorry, I've been really busy and didn't get around to review.

>=20
> [1] https://www.spinics.net/lists/devicetree-compiler/msg00970.html
> [2] https://www.spinics.net/lists/devicetree-compiler/msg01067.html
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

We've generally used sizeof(fdt32_t) rather than having a define for
this.  BITS_PER_CELL can be derived.

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
> +		return -FDT_ERR_BADNELLS;

This isn't safe: -FDT_ERR_BADNCELLS will be come a valid uint64_t
value.  You'll need a return value for just the error and a reference
parameter for the value.

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

I don't think uintptr_t is right.  There's no reason an address space
somewhere in the DT couldn't have bigger addresses than the C
environment where libfdt is running.  uint64_t would be better.  Same
argument for size_t, I think.

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

The error codes from fdt_parent_offset() won't necessarily make sense
returned directly in this context.  e.g. if you pass the root node
here, you'll get a NOTFOUND from parent_offset() which is a bit weird,
since the root node definitely exists.  You probably want some error
translation here.

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

You don't check for errors returned by _fdt_read_cells(), or for ac/sc
bigger than sizeof(uinptr_t)/sizeof(size_t).

> +	return 0;
> +}
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index a248b1b57a97..60da2b97d048 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1098,6 +1098,39 @@ int fdt_address_cells(const void *fdt, int nodeoff=
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
> index 22581359623c..71a5807baf62 100644
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

Would probably be good to have some tests for graceful behaviour in
error cases as well.

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
> index 5df148048758..924db6adfb5a 100755
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

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZOe2HAAoJEGw4ysog2bOS9SgP/RXdHbL1NGSNmO2UR/byGTui
uRUEInKdNo1ULZBzXvlguoOOIRSwPPF4lhx3xp+OG3OJJohjSoEXpuAJRLnSFmFf
3KQo3FHFsX7AkNZ7f8Bm7O/ik1NcxCL2ZLKwH2UnabptZOTjVd3Yp/hneO3hKJH2
RNpboK5nZ6BHH/noMud8nhNFUBHXUIePeSIuMSx6IDTlO3mmgE7xGh5nkmXQO+Lw
N1lvbkuhCiwfoLfhgPlfD+izFFCo/VDGAcFt5PIFkrRw4B3BMzoCOzdE91HUHl7h
ABzmkI55Vj65F7CmS/ttxUIIAiXgPF9LaAIUAhRjwDPdPQNDHSDPTPMHZsOK7ZHf
EJeinrARj7VF3ulE8ua3SmVcVWGzjaeqCOs0C4HoOr1VQjvtqq8rH2k43Nta3uQH
GzwAR8OFiVVLTPmOYcTLD4Z89jHynCX3V+AaNUMSU989G+ipka6q58Pm0ff7a6RK
HgM8mMbBsyokcevnPy6Oz4jRkeEg1xGS7+bhsJMu3BwMcoQrMEj8tlqnxRbC9SGS
T05poFE/p7N7uhLc8UD1QHpNNYzHwxCzzu6XQppfz79/4RzOzeNACHFz0C9zScxs
CdhlZgzAKWlC7cKzy7seJ/Qwvc30TbnPt/S5sjLxG7uEQOcpwOC3jfzJXLroAI/D
FsA8kxS48rrpr+UGVebW
=9y+M
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
