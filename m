From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] libfdt: prevent integer overflow in fdt_next_tag
Date: Tue, 4 Oct 2022 16:06:10 -0700
Message-ID: <53f2985d-15a8-d266-2fbe-ed557036ad6b@linaro.org>
References: <20220930152004.674591-1-tadeusz.struk@linaro.org>
 <YzvbXZG5lSfDL/6v@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zd/2zlgqmkkHTAh5+W5c38uKpcxjnG0HgLdEEHK6qcw=;
        b=V4nzzgDu6qjQMDqXY7ZX1cBIHdKSIYfdMBa9e5U/EioiuGOI07mAJBDfN5jyCLp80R
         DfeANpfFRJ4Rb4W2Qh9+g/d/p8Y2U9bKzQ/KbfcEWHVsAA/VeQtPlpCar9TmBQTvR4ci
         XpG9d7qmrYvx0ADD7Un0rvRIMyfIui+RNZ8su8dWgy4Ekfv6kCBfNr0cATnDd23h+rNE
         t2dPU92PS2k3fxSiJCKTHneLEw/x5286luJvcJKxHyPxd4hWDwwP7oL4hmvfTEMs/IrK
         szH+c+WSIFlB7YF3ZSAP2QnFXjNmUQZV/LZ+08HfgWz9AM82T5ti33bCzdhZrpNG0r8v
         yHmQ==
Content-Language: en-US
In-Reply-To: <YzvbXZG5lSfDL/6v@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,
On 10/4/22 00:06, David Gibson wrote:
> On Fri, Sep 30, 2022 at 08:20:03AM -0700, Tadeusz Struk wrote:
>> Since fdt_next_tag() in a public API function all input parameters,
>> including the fdt blob should not be trusted. It is possible to forge
>> a blob with invalid property length that will cause integer overflow
>> during offset calculation. To prevent that, validate the property length
>> read from the blob before doing calculations.
> So.. yes, there can be an integer overflow here.  I think the actual
> damage it can cause is strongly mitigated by the fact that we should
> only ever use the result of that overflow via fdt_offset_ptr(), which
> will safely reject a bad offset.
> 
>> Signed-off-by: Tadeusz Struk<tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> v2:
>> * Use len local variable to avoid multiple calls to fdt32_to_cpu(*lenp)
>> * Add can_assume(VALID_DTB) to the new checks
>>   libfdt/fdt.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
>> index 90a39e8..b7c202a 100644
>> --- a/libfdt/fdt.c
>> +++ b/libfdt/fdt.c
>> @@ -162,7 +162,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
>>   uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>>   {
>>   	const fdt32_t *tagp, *lenp;
>> -	uint32_t tag;
>> +	uint32_t tag, len;
>>   	int offset = startoffset;
>>   	const char *p;
>>   
>> @@ -188,12 +188,20 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>>   		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
>>   		if (!can_assume(VALID_DTB) && !lenp)
>>   			return FDT_END; /* premature end */
>> +
>> +		len = fdt32_to_cpu(*lenp);
>> +		if (!can_assume(VALID_DTB) && INT_MAX <= len)
> This check is redundant with the one below, isn't it?
> 
>> +			return FDT_END; /* premature end */
>> +
>>   		/* skip-name offset, length and value */
>> -		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
>> -			+ fdt32_to_cpu(*lenp);
>> +		offset += sizeof(struct fdt_property) - FDT_TAGSIZE + len;
>> +
>> +		if (!can_assume(VALID_DTB) && offset < 0)
>> +			return FDT_END; /* premature end */
> Hmmm.. so, signed integer overflow is actually undefined behaviour in
> C, so checking for offset < 0 after the addition isn't actually a safe
> way to check for overflow.  To safely check for overflow, I believe
> you need to check that the*unsigned*  sum of offset and len is greater
> than or equal to offset (*unsigned*  integer overflow is defined to
> wrap as you'd expect for 2s complement arithmetic).  Actually given
> the constraints we've put on offsets in general, we need to check that
> that unsigned sum is both greater than offset and less than INT_MAX.
  
Thanks for feedback. I will change the logic to only work on unsigned
integers. I will also update the unit tests according to your suggestions.

-- 
Thanks,
Tadeusz

