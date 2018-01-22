From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v3] Add limited read-only support for older (V2 and V3)
 device tree to libfdt.
Date: Mon, 22 Jan 2018 11:16:00 -0800
Message-ID: <eac97e74-9d5a-5945-0e74-1bb25bdd03f3@freebsd.org>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
 <20180119214803.24934-1-nwhitehorn@freebsd.org>
 <20180121094019.GA28199@umbus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180121094019.GA28199@umbus>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 01/21/18 01:40, David Gibson wrote:
> On Fri, Jan 19, 2018 at 09:48:03PM +0000, nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org wrote:
>> From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
>>
>> This can be useful in particular in the kernel when booting on systems
>> with FDT-emitting firmware that is out of date. Releases of kexec-tools
>> on ppc64 prior to the end of 2014 are notable examples of such.
>>
>> Signed-off-by: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
>> ---
>>
>> This version of the patch fixes a number of style issues and removes some
>> unnecessary redundant code noted in review.
> As suggested, please implement the change to use
> fdt_get_property_namelen_() in fdt_getprop_namelen().  Plus I spotted
> one other bug..

The reason for the duplication was that fdt_getprop_namelen() needs to 
know the offset of the property as well as its contents to decide 
whether it needs to realign the property data to 8-byte boundaries. 
That's pretty easily fixed by adding a final argument to 
fdt_get_property_namelen_() to return the offset. Is there a better way 
to get the offset from an fdt_property than that?

> [snip]
>> +	if (fdt_version(fdt) < 0x10) {
>> +		/*
>> +		 * For old FDT versions, match the naming conventions of V16:
>> +		 * give only the leaf name (after all /). The actual tree
>> +		 * contents are loosely checked.
>> +		 */
>> +		const char *leaf;
>> +		leaf = strrchr(nameptr, '/');
>> +		if (leaf == NULL) {
>> +			err = FDT_ERR_BADVALUE;
> The error codes are defined positive, but used negative, so this needs
> to be err = -FDT_ERR_BADVAULE,  Except, actually, I think BADSTRUCTURE
> would be a better option.
>
Whoops! Thanks for catching. I have a revised patch that I will send 
tonight after testing.
-Nathan
