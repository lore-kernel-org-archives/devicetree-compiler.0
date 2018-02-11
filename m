From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6] libfdt: add helpers to read address and size from reg
Date: Sun, 11 Feb 2018 13:44:50 +1100
Message-ID: <20180211024450.GZ11634@umbus.fritz.box>
References: <20180205233820.5605-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5OPIRG5sBUHnKBkK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1518317094;
        bh=CKNXTSmq7bTaNpoJL34EiYPbW9Pif8n/L4dyOQmI0sI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=psnqsMOR8Qo45W9oO3UV63cJE3VpanURzOQjCbrmV4PkTYKJiwkbU+68pgi4xpP1l
         z0hVfVlsaZTtiEWaF1ecub/VfvlWO0gEFVSmFe1dIPR8sldWHt+qtHT0zLQTszP1pQ
         iOtHW+tLwnpkcHa8dTrioaZe9/Mwr7rsaNh/Yf/g=
Content-Disposition: inline
In-Reply-To: <20180205233820.5605-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, andre.przywara-5wv7dgnIgG8@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--5OPIRG5sBUHnKBkK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 05, 2018 at 05:38:20PM -0600, Andrew F. Davis wrote:
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
> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>

I have a couple of overall concerns about this, which I'll address in
reply to Rob Herring's post, since they're related.

Apart from that, this is looking pretty close.  A few trivial changes
I'd suggest at the superficial level:



> ---
>=20
> Changes from v5:
>  - Convert returned type to uint64_t per Andr=E9 and David's suggestion
>=20
> Changes from v4:
>  - Removed unneeded #defines
>  - Return status in parameter to avoid unsafe conversion to unsigned
>  - Added error code translation for NOTFOUND -> BADNCELLS
>  - Check for cell sizes being larger than the types they go into
>  - Added tests for failure cases
>=20
>  libfdt/fdt_addresses.c | 64 +++++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h        | 33 ++++++++++++++++++++
>  libfdt/version.lds     |  1 +
>  tests/.gitignore       |  1 +
>  tests/Makefile.tests   |  2 +-
>  tests/addr_size.c      | 81 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/addresses.dts    | 20 +++++++++++++
>  tests/run_tests.sh     |  1 +
>  8 files changed, 202 insertions(+), 1 deletion(-)
>  create mode 100644 tests/addr_size.c
>=20
> diff --git a/libfdt/fdt_addresses.c b/libfdt/fdt_addresses.c
> index eff4dbc..f4b2907 100644
> --- a/libfdt/fdt_addresses.c
> +++ b/libfdt/fdt_addresses.c
> @@ -94,3 +94,67 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
> =20
>  	return val;
>  }
> +
> +static int _fdt_read_cells(const fdt32_t *cells, unsigned int n, uint64_=
t *value)

I know it was widely used until recently, but I'm now trying to avoid
leading underscores everywhere in libfdt, since they are supposed to
be reserved for the system libraries.  Please move the _ to the end
instead.

I'd also prefer to see this called fdt_read_int_().  Lots of things
read cells, but the defining feature of this function is that it
interprets those cells as a single integer.

> +{
> +	int i;
> +
> +	if (n > 2)
> +		return -FDT_ERR_BADNCELLS;
> +
> +	*value =3D 0;
> +	for (i =3D 0; i < n; i++) {
> +		*value <<=3D (sizeof(*cells) * 8);
> +		*value |=3D fdt32_to_cpu(cells[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
> +			 uint64_t *addrp, uint64_t *sizep)


I'd prefer fdt_simple_read_reg().  There are various places where
addresses and sizes appear, the crucial point is that this function is
reading a 'reg' entry (under the assumption that both address and size
can be treated as simple integers of <=3D64 bits).

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
> +	if (parent =3D=3D -FDT_ERR_NOTFOUND) /* an node without a parent does
> +					  * not have _any_ number of cells */
> +		return -FDT_ERR_BADNCELLS;
> +	if (parent < 0)
> +		return parent;
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
> +
> +	/* res is the number of bytes read and must be an even multiple of the
> +	 * sum of address cells and size cells */
> +	if ((res % (reg_stride * sizeof(*reg))) !=3D 0)
> +		return -FDT_ERR_BADVALUE;
> +
> +	if (addrp) {
> +		res =3D _fdt_read_cells(&reg[reg_stride * idx], ac, addrp);
> +		if (res < 0)
> +			return res;
> +	}
> +	if (sizep) {
> +		res =3D _fdt_read_cells(&reg[ac + reg_stride * idx], sc, sizep);
> +		if (res < 0)
> +			return res;
> +	}
> +
> +	return 0;
> +}
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c8c00fa..e2c6bba 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1101,6 +1101,39 @@ int fdt_address_cells(const void *fdt, int nodeoff=
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
> +			 uint64_t *addrp, uint64_t *sizep);
> =20
>  /**********************************************************************/
>  /* Write-in-place functions                                           */
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index 18fb69f..1f19341 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -59,6 +59,7 @@ LIBFDT_1.2 {
>  		fdt_next_subnode;
>  		fdt_address_cells;
>  		fdt_size_cells;
> +		fdt_simple_addr_size;
>  		fdt_stringlist_contains;
>  		fdt_stringlist_count;
>  		fdt_stringlist_search;
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 9e209d5..acb9335 100644
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
> index 262944a..1e326ea 100644
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
> index 0000000..1d5c6a0
> --- /dev/null
> +++ b/tests/addr_size.c
> @@ -0,0 +1,81 @@
> +/*
> + * libfdt - Flat Device Tree manipulation
> + *	Testcase for address and size handling
> + * Copyright (C) 2016-2018 Texas Instruments Incorporated - http://www.t=
i.com/
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
> +static void check_node(const void *fdt, const char *path, int err,
> +		       int idx, uint64_t addr, uint64_t size)
> +{
> +	int offset, res;
> +	uint64_t xaddr, xsize;
> +
> +	offset =3D fdt_path_offset(fdt, path);
> +	if (offset < 0)
> +		FAIL("Couldn't find path %s", path);
> +
> +	res =3D fdt_simple_addr_size(fdt, offset, idx, &xaddr, &xsize);
> +	if (res !=3D err)
> +		FAIL("fdt_simple_addr_size returned %s instead of %s",
> +		     fdt_strerror(res), fdt_strerror(err));
> +	if (res < 0)
> +		return;
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
> +	check_node(fdt, "/identity-bus@0/id-device@400",
> +		   0, 0, 0x400, 0x100);
> +	check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
> +		   0, 0, 0x8000000800, 0x200);
> +	check_node(fdt, "/identity-bus@0/id-device@400",
> +		   0, 1, 0x400000000, 0x100000030);
> +	check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
> +		   0, 1, 0x70000000, 0x700);
> +	check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
> +		   0, 2, 0x1050000000, 0x20);
> +	check_node(fdt, "/identity-bus@0",
> +		   -FDT_ERR_NOTFOUND, 0, 0x0, 0x0);
> +	check_node(fdt, "/narrow-bus@2000000/sb-device@80000000",
> +		   0, 0, 0x00000800, 0x200);
> +
> +	PASS();
> +}
> diff --git a/tests/addresses.dts b/tests/addresses.dts
> index a2faaf5..747c291 100644
> --- a/tests/addresses.dts
> +++ b/tests/addresses.dts
> @@ -6,10 +6,30 @@
>  	#size-cells =3D <2>;
> =20
>  	identity-bus@0 {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;

I'm guessing the idea is that this bus is identity mapped into the
master address space, but that's not what your DT says.  The node has
no 'ranges' property, which implies that the bus lies in an
independent address space from the master space, with no mapping
between them.

To encode that you really have an identity mapping, the bus bridge
should have an empty 'ranges' property.


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
> +	};
> +
> +	narrow-bus@2000000 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		sb-device@80000000 {
> +			reg =3D <0x00000800 0x200>,
> +			      <0x50000000 0x020>;
> +		};
>  	};
>  };
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 0d30edf..c195d0d 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -311,6 +311,7 @@ libfdt_tests () {
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

--5OPIRG5sBUHnKBkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlp/rh8ACgkQbDjKyiDZ
s5IhhBAA2MaaGoNLtRTtsrP+66eUWsxxcK3bQrdWv0L3uBgUyDpLELYru1AvicFC
1lhdXyw8/0kM2HV6yKoCvxjlz7nAmbNNvUSgNyqnJ8XrXD0pcXhg2vXfTvhaVgLQ
J5v0cK0+nZvCbxEbyNQH00fTCp2aeNQ1Mh9um8q3i3aiT4uSdiASKQM1InsY090q
M/ftJOQphZxCyexzDHxMLDUSwWdsHliZodk8SI2hiNOhmexFqNJvKOFVfXARs+b9
cOQ4KYwSj58cgQXR3PmC+mcPVcPaIlOFv1dmIslCU+qaPHmYo5veRQt62Ci/fMX8
XQZeaPlI5GG9tIcKPqY6tMnB3B2xa5DsccTI/yAd1FRY5Tbd8i/sl42uqD7aYgbi
bSOC5ETzp07iTNVJnBV8FneWDQDhuBGIbqk5wj+xBWDG/j0Ne8UFHtfDlMKIsfys
5xVmqR73mFOKpcG7B510n0atZsaHJpRReXXcM1q/r64smyXKme6v2Gm4X2TR1w7r
c/1FctZGosFrSUlFAp1UNSXGgYABW0Gzc3yd1seZRSOCtYdz28Uw+5jYarCNoUyu
OrFpFLsSPFMaZ+rJaAxqym445cg7ZWi/BAd85d4CqKyxDsk1LCheEDlkukpg+4aT
RnTScJcToM3vj1KB6vJ2dHhxZxENtXg28MkwJyYUwYrZv+deoNI=
=22l9
-----END PGP SIGNATURE-----

--5OPIRG5sBUHnKBkK--
