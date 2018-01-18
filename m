From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2] Add limited read-only support for older (V2 and V3)
 device tree to libfdt.
Date: Thu, 18 Jan 2018 12:41:28 -0800
Message-ID: <cfa9f549-b63b-3642-32ab-a2e21898d16e@freebsd.org>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
 <20171231022858.10834-1-nwhitehorn@freebsd.org>
 <20180118045903.GL30352@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180118045903.GL30352-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 01/17/18 20:59, David Gibson wrote:
> On Sat, Dec 30, 2017 at 06:28:58PM -0800, nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org wrote:
>> From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
>>
>> This can be useful in particular in the kernel when booting on systems
>> with FDT-emitting firmware that is out of date.
> Hrm, really, *really* out of date.  V2 and V3 are positively ancient.

Yes, I was *really* disappointed to run into these things in the wild.

>
>> Releases of kexec-tools
>> on ppc64 prior to the end of 2014 are notable examples of such.
> Good grief, that's ridiculous.  They were also using dts-v0 years and
> years after it should have been gotten rid of.

Yes. And Red Hat at least is still shipping such versions of kexec-tools 
today...

 From a fully up-to-date supported RHEL6 system:
nwhitehorn@gordita:~$ kexec -v
kexec-tools 2.0.0 released 19th July 2008
>
> Anyway that said, the changes below don't look too bad.  There's a few
> nits, but in principle I'd be ok to apply

OK, great. I'll plan to submit a revised diff later today or tomorrow.

>> Signed-off-by: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
>> ---
>>
>> This fixes some minor bugs in the original version of the patch with name
>> matching and properties that were exactly 8 bytes long. Tested and running
>> (though uncommitted for now, to prevent divergence from upstream) in the
>> FreeBSD kernel.
>>
>>   fdtget.c        |  4 +--
>>   libfdt/fdt.c    |  8 ++++--
>>   libfdt/fdt_ro.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++--------
>>   libfdt/libfdt.h |  5 +++-
>>   4 files changed, 87 insertions(+), 17 deletions(-)
>>
>> diff --git a/fdtget.c b/fdtget.c
>> index 6cc5242..34d8194 100644
>> --- a/fdtget.c
>> +++ b/fdtget.c
>> @@ -140,7 +140,6 @@ static int show_data(struct display_info *disp, const char *data, int len)
>>    */
>>   static int list_properties(const void *blob, int node)
>>   {
>> -	const struct fdt_property *data;
>>   	const char *name;
>>   	int prop;
>>   
>> @@ -149,8 +148,7 @@ static int list_properties(const void *blob, int node)
>>   		/* Stop silently when there are no more properties */
>>   		if (prop < 0)
>>   			return prop == -FDT_ERR_NOTFOUND ? 0 : prop;
>> -		data = fdt_get_property_by_offset(blob, prop, NULL);
>> -		name = fdt_string(blob, fdt32_to_cpu(data->nameoff));
>> +		fdt_getprop_by_offset(blob, prop, &name, NULL);
>>   		if (name)
>>   			puts(name);
>>   		prop = fdt_next_property_offset(blob, prop);
>> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
>> index fd13236..b1cc253 100644
>> --- a/libfdt/fdt.c
>> +++ b/libfdt/fdt.c
>> @@ -84,8 +84,9 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
>>   		return NULL;
>>   
>>   	if (fdt_version(fdt) >= 0x11)
>> -		if (((offset + len) < offset)
>> -		    || ((offset + len) > fdt_size_dt_struct(fdt)))
>> +		if (((offset + len) < offset) ||
>> +		    (fdt_version(fdt) >= 0x10 &&
> This doesn't make sense - you're already guarded by an fdt_version > 0x11
> above.

That is true. I have no idea why I wrote that and will remove it.

>
>> +		     (offset + len) > fdt_size_dt_struct(fdt)))
>>   			return NULL;
>>   
>>   	return fdt_offset_ptr_(fdt, offset);
>> @@ -123,6 +124,9 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>>   		/* skip-name offset, length and value */
>>   		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
>>   			+ fdt32_to_cpu(*lenp);
>> +		if (fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
>> +		    ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
>> +			offset += 4;
>>   		break;
>>   
>>   	case FDT_END:
>> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
>> index ce17814..d011bd3 100644
>> --- a/libfdt/fdt_ro.c
>> +++ b/libfdt/fdt_ro.c
>> @@ -58,9 +58,10 @@
>>   static int fdt_nodename_eq_(const void *fdt, int offset,
>>   			    const char *s, int len)
>>   {
>> -	const char *p = fdt_offset_ptr(fdt, offset + FDT_TAGSIZE, len+1);
>> +	int olen;
>> +	const char *p = fdt_get_name(fdt, offset, &olen);
>>   
>> -	if (!p)
>> +	if (!p || olen < len)
>>   		/* short match */
>>   		return 0;
>>   
>> @@ -233,16 +234,31 @@ int fdt_path_offset(const void *fdt, const char *path)
>>   const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
>>   {
>>   	const struct fdt_node_header *nh = fdt_offset_ptr_(fdt, nodeoffset);
>> +	const char *nameptr;
>>   	int err;
>>   
>>   	if (((err = fdt_check_header(fdt)) != 0)
>>   	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0))
>>   			goto fail;
>>   
>> +	nameptr = nh->name;
>> +
>> +	if (fdt_version(fdt) < 0x10 && nodeoffset != 0) {
>> +		/*
>> +		 * For old FDT versions, match the naming conventions of V16:
>> +		 * give only the leaf name (after all /) except for the
>> +		 * root node, where we should still return / rather than ""
> What's the rationale for returning "/" rather than "" on the root
> node?  a V16 file will return "", typically.

Are you sure? The immediate motivation was that parts of the FreeBSD 
kernel were breaking if it was "". Since those parts work fine with V16 
trees, I did this. I will double-check what the exact problem is -- it 
might be on our side somehow.

>> +		 */
>> +		const char *leaf;
>> +		leaf = strrchr(nameptr, '/');
>> +		if (leaf != NULL)
>> +			nameptr = leaf+1;
> If leaf is NULL (no '/') I think that indicates a badly formed V3 or
> less tree, the full path should already have at least one /.

Good point. I will make this an error condition.

>
>> +	}
>> +
>>   	if (len)
>> -		*len = strlen(nh->name);
>> +		*len = strlen(nameptr);
>>   
>> -	return nh->name;
>> +	return nameptr;
>>   
>>    fail:
>>   	if (len)
>> @@ -268,9 +284,9 @@ int fdt_next_property_offset(const void *fdt, int offset)
>>   	return nextprop_(fdt, offset);
>>   }
>>   
>> -const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
>> -						      int offset,
>> -						      int *lenp)
>> +static const struct fdt_property *_fdt_get_property_by_offset(const void *fdt,
>> +						              int offset,
>> +						              int *lenp)
> I've been trying to get rid of symbols starting with _ since they're
> technically reserved for the system and can cause problems in some
> compilation environments.  Go to alternative is ending with a _ instead.

This patch was originally written against an older libfdt with preceding 
_ -- I seem to have forgotten to move this. Will fix.

>>   {
>>   	int err;
>>   	const struct fdt_property *prop;
>> @@ -289,11 +305,35 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
>>   	return prop;
>>   }
>>   
>> +const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
>> +						      int offset,
>> +						      int *lenp)
>> +{
>> +	/* Prior to version 16, properties may need realignment
>> +	 * and this API does not work. fdt_getprop_*() will, however. */
>> +
>> +	if (fdt_version(fdt) < 0x10) {
>> +		if (lenp)
>> +			*lenp = -FDT_ERR_BADVERSION;
>> +		return NULL;
>> +	}
>> +
>> +	return _fdt_get_property_by_offset(fdt, offset, lenp);
>> +}
>> +
>>   const struct fdt_property *fdt_get_property_namelen(const void *fdt,
>>   						    int offset,
>>   						    const char *name,
>>   						    int namelen, int *lenp)
>>   {
>> +	/* Prior to version 16, properties may need realignment
>> +	 * and this API does not work. fdt_getprop_*() will, however. */
>> +	if (fdt_version(fdt) < 0x10) {
>> +		if (lenp)
>> +			*lenp = -FDT_ERR_BADVERSION;
>> +		return NULL;
>> +	}
>> +
>>   	for (offset = fdt_first_property_offset(fdt, offset);
>>   	     (offset >= 0);
>>   	     (offset = fdt_next_property_offset(fdt, offset))) {
>> @@ -324,12 +364,33 @@ const struct fdt_property *fdt_get_property(const void *fdt,
>>   const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>>   				const char *name, int namelen, int *lenp)
>>   {
>> -	const struct fdt_property *prop;
>> +	const struct fdt_property *prop = NULL;
>> +	int offset = nodeoffset;
>>   
>> -	prop = fdt_get_property_namelen(fdt, nodeoffset, name, namelen, lenp);
> Couldn't you use an fdt_get_property_namelen_() here instead of having
> to duplicate most of its logic.

You could. Since it is pretty short, adding another function did not 
seem to be much shorter. Happy to do this if you prefer.
-Nathan

>> -	if (!prop)
>> +	for (offset = fdt_first_property_offset(fdt, offset);
>> +	     (offset >= 0);
>> +	     (offset = fdt_next_property_offset(fdt, offset))) {
>
>
>> +		if (!(prop = _fdt_get_property_by_offset(fdt, offset, lenp))) {
>> +			if (lenp)
>> +				*lenp = -FDT_ERR_INTERNAL;
>> +			return NULL;
>> +		}
>> +
>> +		if (fdt_string_eq_(fdt, fdt32_to_cpu(prop->nameoff),
>> +				   name, namelen))
>> +			break;
>> +	}
>> +
>> +	if (lenp && offset < 0)
>> +		*lenp = offset;
>> +
>> +	if (!prop || offset < 0)
>>   		return NULL;
>>   
>> +	/* Handle realignment */
>> +	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
>> +	    fdt32_to_cpu(prop->len) >= 8)
>> +		return prop->data + 4;
>>   	return prop->data;
>>   }
>>   
>> @@ -338,11 +399,15 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
>>   {
>>   	const struct fdt_property *prop;
>>   
>> -	prop = fdt_get_property_by_offset(fdt, offset, lenp);
>> +	prop = _fdt_get_property_by_offset(fdt, offset, lenp);
>>   	if (!prop)
>>   		return NULL;
>>   	if (namep)
>>   		*namep = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
>> +
>> +	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
>> +	    fdt32_to_cpu(prop->len) >= 8)
>> +		return prop->data + 4;
>>   	return prop->data;
>>   }
>>   
>> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
>> index baa882c..7ac3e8a 100644
>> --- a/libfdt/libfdt.h
>> +++ b/libfdt/libfdt.h
>> @@ -54,7 +54,7 @@
>>   #include <libfdt_env.h>
>>   #include <fdt.h>
>>   
>> -#define FDT_FIRST_SUPPORTED_VERSION	0x10
>> +#define FDT_FIRST_SUPPORTED_VERSION	0x02
>>   #define FDT_LAST_SUPPORTED_VERSION	0x11
>>   
>>   /* Error codes: informative error codes */
>> @@ -526,6 +526,9 @@ int fdt_next_property_offset(const void *fdt, int offset);
>>    * fdt_property structure within the device tree blob at the given
>>    * offset.  If lenp is non-NULL, the length of the property value is
>>    * also returned, in the integer pointed to by lenp.
>> + *
>> + * Note that this code only works on device tree versions >= 16. fdt_getprop()
>> + * works on all versions.
>>    *
>>    * returns:
>>    *	pointer to the structure representing the property
