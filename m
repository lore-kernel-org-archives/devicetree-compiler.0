From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] libfdt: add helpers to read address and size from reg
Date: Wed, 30 Nov 2016 13:35:04 -0600
Message-ID: <2f744a7f-5112-c83e-d47a-ce9fef491dde@ti.com>
References: <1478710712-25010-1-git-send-email-b-fair@ti.com>
 <20161125105125.GJ12287@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125105125.GJ12287-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 11/25/2016 04:51 AM, David Gibson wrote:
> On Wed, Nov 09, 2016 at 10:58:32AM -0600, Benjamin Fair wrote:
[...]
>
> I like the concept of a helper to read entries from reg, but there
> some things about the execution of it I think need some more thought.
>

Thanks for the review.

[...]
>> diff --git a/libfdt/fdt_addresses.c b/libfdt/fdt_addresses.c
>> index eff4dbc..92cbed9 100644
>> --- a/libfdt/fdt_addresses.c
>> +++ b/libfdt/fdt_addresses.c
>> @@ -55,6 +55,9 @@
>>
>>  #include "libfdt_internal.h"
>>
>> +#define BYTES_PER_CELL 4
>> +#define BITS_PER_CELL 32
>
> You shouldn't need these.  BYTES_PER_CELL == sizeof(fdt32_t).
>

Of course. Thanks. I'll get rid of them.

>> +
>>  int fdt_address_cells(const void *fdt, int nodeoffset)
>>  {
>>  	const fdt32_t *ac;
>> @@ -94,3 +97,62 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
>>
>>  	return val;
>>  }
>> +
>> +static uint64_t _fdt_read_cells(const fdt32_t *cells, int n)
>
> This is a reasonable helper, but the name is bad.  "read_cells"
> suggests it can read some arbitrary number of cells, but in fact all
> it can do is read a 32-bit int or a 64-bit int.  Plus everything is
> made up of cells, but more specifically what you're doing here is
> interpreting several cells as an integer in the usual encoding.
>

Would "cells_to_integer" be a better name? Or would you recommend 
something else for this?

>> +{
>> +	int i;
>> +	uint64_t res;
>> +
>> +	/* TODO: Support values larger than 2 cells */
>
> I don't really see any way you could support >2 cells without
> completely changing the interface.
>

True. I wanted to have the result be a 128 bit integer, but couldn't 
find a portable way to do so. Is there a better way to go about this? Or 
is it fine to only support at most 2 cells, even though the rest of 
libfdt supports 4?

>> +	if (n > 2)
>> +		return -FDT_ERR_BADNCELLS;
>> +
>> +	res = 0;
>> +	for (i = 0; i < n; i++) {
>> +		res <<= BITS_PER_CELL;
>> +		res |= fdt32_to_cpu(cells[i]);
>> +	}
>> +
>> +	return res;
>> +}
>> +
>> +int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
>> +			 uintptr_t *addr, size_t *size)
>> +{
>> +	int parent;
>> +	int ac, sc, reg_stride;
>> +	int res;
>> +	const fdt32_t *reg;
>> +
>> +	reg = fdt_getprop(fdt, nodeoffset, "reg", &res);
>> +	if (res < 0)
>> +		return res;
>> +
>> +	parent = fdt_parent_offset(fdt, nodeoffset);
>> +	if (parent < 0)
>> +		return res;
>
> So, fdt_parent_offset() is very expensive, I wouldn't recommend it in
> a function that's likely to be called a lot like this.  Instead I'd
> suggest a function which takes the parent offset as a parameter, and
> optionally a wrapper that uses fdt_parent_offset().

Great idea, I'll do this in the next revision once we have a solution 
for the rest of the comments.

>
>> +
>> +	ac = fdt_address_cells(fdt, parent);
>> +	if (ac < 0)
>> +		return ac;
>> +
>> +	sc = fdt_size_cells(fdt, parent);
>> +	if (sc < 0)
>> +		return sc;
>> +
>> +	reg_stride = ac + sc;
>> +	/*
>> +	 * res is the number of bytes read and must be an even multiple of the
>> +	 * sum of ac and sc.
>> +	 */
>> +	if ((res % (reg_stride * BYTES_PER_CELL)) != 0)
>> +		return -FDT_ERR_BADVALUE;
>> +
>> +	if (addr)
>> +		*addr = (uintptr_t) _fdt_read_cells(&reg[reg_stride * idx], ac);
>
> I don't think uintptr_t makes sense here.  The addresses in the device
> tree are in whatever bus they're in, and there are a whole stack of
> reasons that could be unrelated to the pointer size of environment
> libfdt is running in:
>     - The device may be on a subordinate bus whose addresses need
>       to be translated
>     - Even at the top-level, the reg properties represent
>       *physical* addresses, which may not be the same as virtual
>       addresses  in code running on the system
>     - libfdt may be running on a completely different system from the
>       one the device tree in question is aimed at (bootloaders are
>       only one use case for libfdt).
>
>> +	if (size)
>> +		*size = (size_t) _fdt_read_cells(&reg[ac + reg_stride * idx],
>> +						 sc);
>
> Likewise size_t isn't necessarily right here, although I suspect it's
> less likely to break in practice.
>

Hmm... Is it fine to use uint64_t for both of these instead then?

>> +	return 0;
>> +}
>


-- 
Benjamin Fair
