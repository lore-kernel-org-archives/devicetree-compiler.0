From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2] Add limited read-only support for older (V2 and V3)
 device tree to libfdt.
Date: Fri, 19 Jan 2018 14:01:58 -0800
Message-ID: <355b0bf8-2585-72f9-2e08-a460dd6c0a51@freebsd.org>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
 <20171231022858.10834-1-nwhitehorn@freebsd.org>
 <20180118045903.GL30352@umbus.fritz.box>
 <cfa9f549-b63b-3642-32ab-a2e21898d16e@freebsd.org>
 <20180118232519.GW30352@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180118232519.GW30352-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 01/18/18 15:25, David Gibson wrote:
> On Thu, Jan 18, 2018 at 12:41:28PM -0800, Nathan Whitehorn wrote:
[snip]
>>> Anyway that said, the changes below don't look too bad.  There's a few
>>> nits, but in principle I'd be ok to apply
>> OK, great. I'll plan to submit a revised diff later today or
>> tomorrow.
> Ok, thanks.

Sent separately. I've implemented all your comments besides the last one 
related to fdt_get_property_namelen_(), in large part because I did not 
see this email until after sending the patch. Happy to retool that if 
you like.

>
> [snip]
>>>> +	if (fdt_version(fdt) < 0x10 && nodeoffset != 0) {
>>>> +		/*
>>>> +		 * For old FDT versions, match the naming conventions of V16:
>>>> +		 * give only the leaf name (after all /) except for the
>>>> +		 * root node, where we should still return / rather than ""
>>> What's the rationale for returning "/" rather than "" on the root
>>> node?  a V16 file will return "", typically.
>> Are you sure?
> Pretty sure, yeah..

I was apparently misremembering or misdiagnosed something else. The new 
patch deletes this code (and makes path names without a / an error).
-Nathan

>
>> The immediate motivation was that parts of the FreeBSD kernel
>> were breaking if it was "". Since those parts work fine with V16 trees, I
>> did this. I will double-check what the exact problem is -- it might be on
>> our side somehow.
> [snip]
>>>> @@ -324,12 +364,33 @@ const struct fdt_property *fdt_get_property(const void *fdt,
>>>>    const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>>>>    				const char *name, int namelen, int *lenp)
>>>>    {
>>>> -	const struct fdt_property *prop;
>>>> +	const struct fdt_property *prop = NULL;
>>>> +	int offset = nodeoffset;
>>>> -	prop = fdt_get_property_namelen(fdt, nodeoffset, name, namelen, lenp);
>>> Couldn't you use an fdt_get_property_namelen_() here instead of having
>>> to duplicate most of its logic.
>> You could. Since it is pretty short, adding another function did not seem to
>> be much shorter. Happy to do this if you prefer.
> It's not so much the physical shortness, but the fact that getting the
> property scan logic exactly right does have some edge cases you have
> to be careful of, so I'd rather only have to do it in one place.
>
