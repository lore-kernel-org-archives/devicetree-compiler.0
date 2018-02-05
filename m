From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5] libfdt: add helpers to read address and size from reg
Date: Mon, 5 Feb 2018 17:11:11 -0600
Message-ID: <18570bdd-ee29-3782-bc2c-5053ef4c5523@ti.com>
References: <20180201230416.6641-1-afd@ti.com>
 <76a08db3-3ee4-6c65-519f-13de2f872484@arm.com>
 <3f1514d9-56c7-fcfc-d874-028fa7047ea6@ti.com>
 <e4fb72d6-5eb2-9c91-22eb-7e6fff937596@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1517872271;
        bh=V1mpc/aR4GnaNq0CdrOLVetwQ734513T3eltF5qEnHI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yCx6paBwuiGmsUgpP6XcF6TnrvzpbzZBaDAICwHuamiMoGxiWDM1RrmEFDOfH3tUr
         teKFyaKvR9F+vpQCrWVy59Imp3r3vgMZrevld8Nl33JLXut9pD66qwNn4a5E27lnQN
         AnkDs3GQwDsLDlY5GdXvbGrdCSfaZnAbD/HCLQ9k=
In-Reply-To: <e4fb72d6-5eb2-9c91-22eb-7e6fff937596-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On 02/05/2018 04:47 PM, Andr=C3=A9 Przywara wrote:
> On 05/02/18 20:10, Andrew F. Davis wrote:
>> On 02/05/2018 11:11 AM, Andre Przywara wrote:
>>> Hi,
>>>
>>> thanks for picking this up!
>>>
>>> On 01/02/18 23:04, Andrew F. Davis (by way of Andre Przywara
>>> <andre-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>) wrote:
>>>> From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
>=20
> ....
>=20
>>>> +
>>>> +int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
>>>> +			 uintptr_t *addrp, size_t *sizep)
>>>
>>> I believe this was mentioned in previous reviews:
>>> I don't think that those types are the right ones to use here.
>>> There is no correlation between the address size used in a DT and the
>>> (current) size of pointers or addressable memory.
>>> So you might end up in 32-bit code reading a DT with 64-bit addresses.
>>> MMIO addresses might be under 4GB underway, or you are running using
>>> LPAE, where physical addresses can be 40 bits long.
>=20
>> This function checks for these mismatches and returns an error. The
>> point of this helper is for the system about to use these pointers, if
>> you want to manipulate them on a different system or use them later then
>> this helper is not correct for you.
>=20
> Imagine you have a TI(!) Keystone SoC, the kernel DT tells me the
> address and size are 64 bit, though the A15 cores will always have
> uintptr_t and size_t at 32 bits. So you can never use this function
> there, even if you would have the MMU using long descriptors, and even
> if you just want to program the GIC to allow non-secure access in a
> small secure firmware shim using libfdt:
>                 compatible =3D "arm,gic-400", "arm,cortex-a15-gic";
> 		reg =3D <0x0 0x02561000 0x0 0x1000>, ....
> That would be perfectly accessible with the MMU off.
> Looking further into the .dtsi actually underlines Rob's point of not
> supporting translation being much less useful (though it would happen to
> work in this case, more or less by chance).
>=20
>>> So I think we should use uint64_t* here, this would also avoid the
>>> checks below.
>>>
>>
>> What will happen if I am on a 32-bit big-endian system, and I only want
>> to read in a 32-bit address, but the DT node is 64-bit? How will I know
>> that it read in 64-bits?
>=20
> if ((base_addr & (uintptr_t)~0) !=3D base_addr)
> 	return -EFBIG;
>=20
>> How will I know where the MSB is?
>=20
> DT is always big endian. libfdt takes care of that.
>=20
>> Do we care about 128-bit?
>=20
> No. I am not aware of such a system, especially not one using DT.
> Keystones are real, though. DTs for ARMv8 systems running in AArch32 are
> real as well.
>=20
>> Etc.. I don't think this can be made generic for all the
>> combinations, and so for simplicity the address pointer and size must
>> match the system. For other more complex uses you will have to implement
>> your own handling.
>=20
> We don't need to be super generic, but at least should care about
> existing systems. I ran into this issue with 32 bit guests on an 64-bit
> hypervisor. The HV tooling generates the same DT and the guest needs to
> deal with that.
>=20
> Please note, I actually like this patch and am not asking for a complete
> rewrite: We just change the pointer types and drop the size check: done.
>=20


Fair enough, I think we just had different use-case intentions in mind
but I can adapt the returned values outside of this helper for my
specific use.

I'll post a v2 with the changes here shortly.

Thanks,
Andrew


> Or if a range-aware version isn't too far away, we use that.
>=20
> Cheers,
> Andre.
>=20
>>>
>>>> +{
>>>> +	int parent;
>>>> +	int ac, sc, reg_stride;
>>>> +	int res;
>>>> +	const fdt32_t *reg;
>>>> +
>>>> +	reg =3D fdt_getprop(fdt, nodeoffset, "reg", &res);
>>>> +	if (res < 0)
>>>> +		return res;
>>>> +
>>>> +	parent =3D fdt_parent_offset(fdt, nodeoffset);
>>>> +	if (parent =3D=3D -FDT_ERR_NOTFOUND) /* an node without a parent does
>>>> +					  * not have _any_ number of cells */
>>>> +		return -FDT_ERR_BADNCELLS;
>>>> +	if (parent < 0)
>>>> +		return parent;
>>>> +
>>>> +	ac =3D fdt_address_cells(fdt, parent);
>>>> +	if (ac < 0)
>>>> +		return ac;
>>>> +	if (ac * sizeof(fdt32_t) > sizeof(*addrp))
>>>> +		return -FDT_ERR_BADNCELLS;
>>>> +
>>>> +	sc =3D fdt_size_cells(fdt, parent);
>>>> +	if (sc < 0)
>>>> +		return sc;
>>>> +	if (sc * sizeof(fdt32_t) > sizeof(*sizep))
>>>> +		return -FDT_ERR_BADNCELLS;
>>>> +
>>>> +	reg_stride =3D ac + sc;
>>>> +
>>>> +	/* res is the number of bytes read and must be an even multiple of t=
he
>>>> +	 * sum of address cells and size cells */
>>>> +	if ((res % (reg_stride * sizeof(*reg))) !=3D 0)
>>>> +		return -FDT_ERR_BADVALUE;
>>>> +
>>>> +	if (addrp) {
>>>> +		*addrp =3D (uintptr_t) _fdt_read_cells(&reg[reg_stride * idx], ac, =
&res);
>>>> +		if (res < 0)
>>>> +			return res;
>>>> +	}
>>>> +	if (sizep) {
>>>> +		*sizep =3D (size_t) _fdt_read_cells(&reg[ac + reg_stride * idx], sc=
, &res);
>>>> +		if (res < 0)
>>>> +			return res;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
>>>> index c8c00fa..73f2fea 100644
>>>> --- a/libfdt/libfdt.h
>>>> +++ b/libfdt/libfdt.h
>>>> @@ -1101,6 +1101,39 @@ int fdt_address_cells(const void *fdt, int node=
offset);
>>>>   */
>>>>  int fdt_size_cells(const void *fdt, int nodeoffset);
>>>> =20
>>>> +/**
>>>> + *
>>>> + * fdt_simple_addr_size - read address and/or size from the reg prope=
rty of a
>>>> + *                        device node.
>>>> + * @fdt: pointer to the device tree blob
>>>> + * @nodeoffset: offset of the node to find the address and/or size fr=
om
>>>> + * @idx: which address/size pair to read
>>>> + * @addrp: pointer to where address will be stored (will be overwritt=
en) or NULL
>>>> + * @sizep: pointer to where size will be stored (will be overwritten)=
 or NULL
>>>> + *
>>>> + * When the node has a valid reg property, returns the address and/or=
 size
>>>> + * values stored there. It does not perform any type of translation b=
ased on
>>>> + * the parent bus(es).
>>>> + *
>>>> + * NOTE: This function is expensive, as it must scan the device tree
>>>> + * structure from the start to nodeoffset, *twice*, with fdt_parent_o=
ffset.
>>>> + *
>>>> + * returns:
>>>> + *	0, on success
>>>> + *	-FDT_ERR_BADVALUE, if there is an unexpected number of entries in =
the
>>>> + *		reg property
>>>> + *	-FDT_ERR_NOTFOUND, if the node does not have a reg property
>>>> + *	-FDT_ERR_BADNCELLS, if the number of address or size cells is inva=
lid
>>>> + *		or greater than 2 (which is the maximum currently supported)
>>>> + *	-FDT_ERR_BADMAGIC,
>>>> + *	-FDT_ERR_BADSTATE,
>>>> + *	-FDT_ERR_BADSTRUCTURE,
>>>> + *	-FDT_ERR_BADVERSION,
>>>> + *	-FDT_ERR_TRUNCATED, standard meanings
>>>> + */
>>>> +
>>>> +int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
>>>> +			 uintptr_t *addrp, size_t *sizep);
>>>> =20
>>>>  /********************************************************************=
**/
>>>>  /* Write-in-place functions                                          =
 */
>>>> diff --git a/libfdt/version.lds b/libfdt/version.lds
>>>> index 18fb69f..1f19341 100644
>>>> --- a/libfdt/version.lds
>>>> +++ b/libfdt/version.lds
>>>> @@ -59,6 +59,7 @@ LIBFDT_1.2 {
>>>>  		fdt_next_subnode;
>>>>  		fdt_address_cells;
>>>>  		fdt_size_cells;
>>>> +		fdt_simple_addr_size;
>>>>  		fdt_stringlist_contains;
>>>>  		fdt_stringlist_count;
>>>>  		fdt_stringlist_search;
>>>> diff --git a/tests/.gitignore b/tests/.gitignore
>>>> index 9e209d5..acb9335 100644
>>>> --- a/tests/.gitignore
>>>> +++ b/tests/.gitignore
>>>> @@ -43,6 +43,7 @@ tmp.*
>>>>  /path_offset
>>>>  /path_offset_aliases
>>>>  /phandle_format
>>>> +/addr_size
>>>>  /property_iterate
>>>>  /propname_escapes
>>>>  /references
>>>> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
>>>> index 262944a..1e326ea 100644
>>>> --- a/tests/Makefile.tests
>>>> +++ b/tests/Makefile.tests
>>>> @@ -8,7 +8,7 @@ LIB_TESTS_L =3D get_mem_rsv \
>>>>  	char_literal \
>>>>  	sized_cells \
>>>>  	notfound \
>>>> -	addr_size_cells \
>>>> +	addr_size_cells addr_size \
>>>>  	stringlist \
>>>>  	setprop_inplace nop_property nop_node \
>>>>  	sw_tree1 \
>>>> diff --git a/tests/addr_size.c b/tests/addr_size.c
>>>> new file mode 100644
>>>> index 0000000..10275f4
>>>> --- /dev/null
>>>> +++ b/tests/addr_size.c
>>>> @@ -0,0 +1,93 @@
>>>> +/*
>>>> + * libfdt - Flat Device Tree manipulation
>>>> + *	Testcase for address and size handling
>>>> + * Copyright (C) 2016-2018 Texas Instruments Incorporated - http://ww=
w.ti.com/
>>>> + *
>>>> + * Based on addr_size_cells.c by David Gibson, <david-xT8FGy+AXnRB3Ne=
2BGzF6laj5H9X9Tb+@public.gmane.org>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modi=
fy it
>>>> + * under the terms of the GNU Lesser General Public License as publis=
hed by
>>>> + * the Free Software Foundation; either version 2.1 of the License, o=
r (at
>>>> + * your option) any later version.
>>>> + *
>>>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any ki=
nd,
>>>> + * whether express or implied; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>>> + * Lesser General Public License for more details.
>>>> + */
>>>> +
>>>> +#include <stdlib.h>
>>>> +#include <stdio.h>
>>>> +#include <string.h>
>>>> +#include <stdint.h>
>>>> +
>>>> +#include <libfdt.h>
>>>> +
>>>> +#include "tests.h"
>>>> +#include "testdata.h"
>>>> +
>>>> +static void check_node(const void *fdt, const char *path, int err,
>>>> +		       int idx, uintptr_t addr, size_t size)
>>>> +{
>>>> +	int offset, res;
>>>> +	uintptr_t xaddr;
>>>> +	size_t xsize;
>>>> +
>>>> +	offset =3D fdt_path_offset(fdt, path);
>>>> +	if (offset < 0)
>>>> +		FAIL("Couldn't find path %s", path);
>>>> +
>>>> +	res =3D fdt_simple_addr_size(fdt, offset, idx, &xaddr, &xsize);
>>>> +	if (res !=3D err)
>>>> +		FAIL("fdt_simple_addr_size returned %s instead of %s",
>>>> +		     fdt_strerror(res), fdt_strerror(err));
>>>> +	if (res < 0)
>>>> +		return;
>>>> +
>>>> +	if (xaddr !=3D addr)
>>>> +		FAIL("Physical address for %s is %p instead of %p\n",
>>>> +		     path, (void *) xaddr, (void *) addr);
>>>> +
>>>> +	if (xsize !=3D size)
>>>> +		FAIL("Size for %s is %zx instead of %zx\n",
>>>> +		     path, xsize, size);
>>>> +}
>>>> +
>>>> +int main(int argc, char *argv[])
>>>> +{
>>>> +	void *fdt;
>>>> +
>>>> +	if (argc !=3D 2)
>>>> +		CONFIG("Usage: %s <dtb file>\n", argv[0]);
>>>> +
>>>> +	test_init(argc, argv);
>>>> +	fdt =3D load_blob(argv[1]);
>>>> +
>>>> +	if (sizeof(uintptr_t) =3D=3D 4 && sizeof(size_t) =3D=3D 4) {
>>>> +		/* 32-bit address , 32-bit size */
>>>> +		check_node(fdt, "/identity-bus@0/id-device@400",
>>>> +			   -FDT_ERR_BADNCELLS, 0, 0x0, 0x0);
>>>> +		check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
>>>> +			   -FDT_ERR_BADNCELLS, 0, 0x0, 0x0);
>>>> +	}
>>>> +	else if (sizeof(uintptr_t) =3D=3D 8 && sizeof(size_t) =3D=3D 8) {
>>>> +		/* 64-bit uintptr_t , 64-bit size_t */
>>>> +		check_node(fdt, "/identity-bus@0/id-device@400",
>>>> +			   0, 0,0x400, 0x100);
>>>> +		check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
>>>> +			   0, 0, 0x8000000800, 0x200);
>>>> +		check_node(fdt, "/identity-bus@0/id-device@400",
>>>> +			   0, 1, 0x400000000, 0x100000030);
>>>> +		check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
>>>> +			   0, 1, 0x70000000, 0x700);
>>>> +		check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
>>>> +			   0, 2, 0x1050000000, 0x20);
>>>> +	}
>>>> +
>>>> +	check_node(fdt, "/identity-bus@0",
>>>> +		   -FDT_ERR_NOTFOUND, 0, 0x0, 0x0);
>>>> +	check_node(fdt, "/narrow-bus@2000000/sb-device@80000000",
>>>> +		   0, 0, 0x00000800, 0x200);
>>>> +
>>>> +	PASS();
>>>> +}
>>>> diff --git a/tests/addresses.dts b/tests/addresses.dts
>>>> index a2faaf5..747c291 100644
>>>> --- a/tests/addresses.dts
>>>> +++ b/tests/addresses.dts
>>>> @@ -6,10 +6,30 @@
>>>>  	#size-cells =3D <2>;
>>>> =20
>>>>  	identity-bus@0 {
>>>> +		#address-cells =3D <2>;
>>>> +		#size-cells =3D <2>;
>>>> +		id-device@400 {
>>>> +			reg =3D <0x0 0x00000400 0x0 0x00000100>,
>>>> +			      <0x4 0x00000000 0x1 0x00000030>;
>>>> +		};
>>>>  	};
>>>> =20
>>>>  	simple-bus@1000000 {
>>>>  		#address-cells =3D <2>;
>>>>  		#size-cells =3D <1>;
>>>> +		sb-device@8000000800 {
>>>> +			reg =3D <0x80 0x00000800 0x200>,
>>>> +			      <0x00 0x70000000 0x700>,
>>>> +			      <0x10 0x50000000 0x020>;
>>>> +		};
>>>> +	};
>>>> +
>>>> +	narrow-bus@2000000 {
>>>> +		#address-cells =3D <1>;
>>>> +		#size-cells =3D <1>;
>>>> +		sb-device@80000000 {
>>>> +			reg =3D <0x00000800 0x200>,
>>>> +			      <0x50000000 0x020>;
>>>> +		};
>>>>  	};
>>>>  };
>>>> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
>>>> index 0d30edf..c195d0d 100755
>>>> --- a/tests/run_tests.sh
>>>> +++ b/tests/run_tests.sh
>>>> @@ -311,6 +311,7 @@ libfdt_tests () {
>>>> =20
>>>>      run_dtc_test -I dts -O dtb -o addresses.test.dtb addresses.dts
>>>>      run_test addr_size_cells addresses.test.dtb
>>>> +    run_test addr_size addresses.test.dtb
>>>> =20
>>>>      run_dtc_test -I dts -O dtb -o stringlist.test.dtb stringlist.dts
>>>>      run_test stringlist stringlist.test.dtb
>>>>
>=20
