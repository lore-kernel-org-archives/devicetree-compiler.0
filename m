From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 04/14] libfdt: fdt_add_string_(): Fix comparison warning
Date: Thu, 1 Oct 2020 16:33:50 +0100
Message-ID: <74c57a12-db86-ec9f-5c91-f0419c24de4b@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-5-andre.przywara@arm.com>
 <20200924010145.GJ2298@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200924010145.GJ2298-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 24/09/2020 02:01, David Gibson wrote:
> On Mon, Sep 21, 2020 at 05:52:53PM +0100, Andre Przywara wrote:
>> With -Wsign-compare, compilers warn about a mismatching signedness
>> in a comparison in fdt_add_string_().
>>
>> As struct_top can only be positive, just use an unsigned type for it,
>> and avoid the signedness difference.
>>
>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> 
> I'm not sure this is right.  Well.. I'm also not sure it was right
> before.  Adding some more context to explain why..
> 
>> ---
>>  libfdt/fdt_sw.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
>> index d10a720..d65e9c8 100644
>> --- a/libfdt/fdt_sw.c
>> +++ b/libfdt/fdt_sw.c
>> @@ -249,7 +249,8 @@ static int fdt_add_string_(void *fdt, const char *s)
>>  	char *strtab = (char *)fdt + fdt_totalsize(fdt);
>>  	int strtabsize = fdt_size_dt_strings(fdt);
>>  	int len = strlen(s) + 1;
>> -	int struct_top, offset;
>> +	unsigned int struct_top;
>> +	int offset;
>>  
>>  	offset = -strtabsize - len;
>>  	struct_top = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
>> 	if (fdt_totalsize(fdt) + offset < struct_top)
>> 		return 0; /* no more room :( */
> 
> So strtabsize and len will always be positive (or, if they're not,
> that's another problem), so offset is always negative.  Which means we
> need the signed addition between totalsize and offset for this to be
> correct.
> 
> So I suspect we want to make 'len' and 'offset' unsigned as well,
> reverse the sign on offset and make it a subtraction in the if instead
> of an addition-of-negative.

Ah, yes, much better! To be honest I just did my due diligence on *this*
function before, because all those minus signs confused me quite a lot.
But your approach makes it much clearer what is going on here.

So if I get this correctly, this function really returns the *negative*
offset of the new string, which will end up in the property, for now?
And at the end we translate all negative values into the actual offsets?
And there is initially a gap between the dt_struct part and the string
table, to allow both growing towards each other, without needing to
rewrite everything, every time?
Is this documented somewhere? Shall this approach be described in a
comment at the top of this file?

Thanks!
Andre.


> 
> We might then need to explicitly check for offset < totalsize as well,
> to cover the overflow case.
> 

