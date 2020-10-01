From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 14/14] libfdt: fdt_strerror(): Fix comparison warning
Date: Thu, 1 Oct 2020 16:34:01 +0100
Message-ID: <3ede218a-e0c8-e86a-b523-cbd07b590048@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-15-andre.przywara@arm.com>
 <20200925041208.GZ2298@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200925041208.GZ2298-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 25/09/2020 05:12, David Gibson wrote:
> On Mon, Sep 21, 2020 at 05:53:03PM +0100, Andre Przywara wrote:
>> With -Wsign-compare, compilers warn about a mismatching signedness
>> in a comparison in fdt_strerror().
>>
>> At this point we are sure that errval is negative, and since
>> FDT_ERRTABSIZE is surely positive, we can do some casting to make the
>> compiler happy.
>>
>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> 
> Since error values are typically conveyed as negative numbers (which
> is kind of the whole reason we have all these signed values in the
> first place), I think it would be slightly nicer to actually fold the
> case to signed into the definition of FDT_ERRTABSIZE.

Right, makes more sense. I changed the comparison to:
	if (-errval < FDT_ERRTABSIZE)
which is more in line with what we actually do below.

Cheers,
Andre

>> ---
>>  libfdt/fdt_strerror.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
>> index 768db66..efce51d 100644
>> --- a/libfdt/fdt_strerror.c
>> +++ b/libfdt/fdt_strerror.c
>> @@ -48,7 +48,7 @@ const char *fdt_strerror(int errval)
>>  		return "<valid offset/length>";
>>  	else if (errval == 0)
>>  		return "<no error>";
>> -	else if (errval > -FDT_ERRTABSIZE) {
>> +	else if (errval > -(int)FDT_ERRTABSIZE) {
>>  		const char *s = fdt_errtable[-errval].str;
>>  
>>  		if (s)
> 

