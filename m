From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 12/14] libfdt: fdt_get_string(): Fix sequential write
 comparison warnings
Date: Thu, 1 Oct 2020 16:33:33 +0100
Message-ID: <f525b49e-4c04-8579-1feb-c2aa88c25407@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-13-andre.przywara@arm.com>
 <20200925040903.GX2298@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200925040903.GX2298-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 25/09/2020 05:09, David Gibson wrote:
> On Mon, Sep 21, 2020 at 05:53:01PM +0100, Andre Przywara wrote:
>> With -Wsign-compare, compilers warn about a mismatching signedness in
>> comparisons in fdt_get_string().
>>
>> The two occassions dealing with the sequential write case are a bit
>> tricky, since we deliberately abuse the negative values here.
>>
>> As we have just established that stroffset is negative, we can use
>> casts to appease the compiler.
>>
>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  libfdt/fdt_ro.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
>> index ddb5a2d..059d302 100644
>> --- a/libfdt/fdt_ro.c
>> +++ b/libfdt/fdt_ro.c
>> @@ -68,9 +68,9 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
>>  		}
>>  	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
>>  		if ((stroffset >= 0)
>> -		    || (stroffset < -fdt_size_dt_strings(fdt)))
>> +		    || (stroffset < -(int)fdt_size_dt_strings(fdt)))
> 
> So, I'm pretty sure at this point we've tested that
> fdt_size_dt_strings < INT_MAX.  But to make it more obvious that it's
> safe, I think it would be preferable to case (-stroffset) to unsigned
> rather than casting size_dt_strings to signed.

Ah, indeed, and this makes the whole thing suddenly much more readable.
I took the freedom of adding: "unsigned int sw_stroffset = -stroffset;",
to avoid those ugly casts altogether.

Cheers,
Andre

> 
>>  			goto fail;
>> -		if ((-stroffset) < len)
>> +		if ((unsigned)(-stroffset) < len)
>>  			len = -stroffset;
>>  	} else {
>>  		err = -FDT_ERR_INTERNAL;
> 

