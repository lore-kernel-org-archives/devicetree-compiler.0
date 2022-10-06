From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] libfdt: tests: add get_next_tag_invalid_prop_len
Date: Thu, 6 Oct 2022 09:36:03 -0700
Message-ID: <fdcd9ab8-8207-97fe-03f6-ca9c582f83f2@linaro.org>
References: <20221005232931.3016047-1-tadeusz.struk@linaro.org>
 <20221005232931.3016047-2-tadeusz.struk@linaro.org> <Yz6MbgDg9gOmC6k9@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VwKeuABOD02TA6qUHl8hG9nLJiiPuDwE6pV+hsX3j8=;
        b=y/xPupEvCrH6eKYOJyAJIDJGi/zFBscnp/BgM9hjKZnnzdR3DReZbZeDU16EEmFdtU
         hzWm4sYvz2J1bPou6Awioz3FTBoc5S9836jeOFL3LXfUii+pUpfmT4uI0RsjJSuKc17U
         7HJT1azXBhfb3qFrA5M26zdhnZpq4VpFHVmDMmGGSGCM8TJ0c7oCY5AAn4xgFVfyKQQq
         9IA9ZEki1FNfBwpL9BdLkYlyqGxkT0sAkrcmZBBVaw+A7uIpu2hQNk4x+vmm4NSIve36
         frP5cMcRbMlpCxWU5FA5JsDKBEQnHVi+qMnfXyrkGAHf45Yis3FGxP5iwRNpjXLx6yxc
         y7vA==
Content-Language: en-US
In-Reply-To: <Yz6MbgDg9gOmC6k9@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 10/6/22 01:06, David Gibson wrote:
> On Wed, Oct 05, 2022 at 04:29:31PM -0700, Tadeusz Struk wrote:
>> Add a new test get_next_tag_invalid_prop_len, which covers
>> fdt_next_tag(), when it is passed an corrupted blob, with
>> invalid property len values.
>>
>> Signed-off-by: Tadeusz Struk<tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Looks good overall, but a bunch of minor things to polish.

Thanks for reviewing this. I will only follow with the new
version if 2/2. Please take the v3 1/2 as it is.

> 
>> +#define FDT_SIZE 65536
>> +#define CHECK_ERR(err) \
>> +({ if (err) { \
>> +	free(fdt); \
> You don't need the free() here, you're about to quit the test program
> anyway.

Right. I will take that out.

> 
>> +	FAIL("%s: %d: %s", __FILE__, __LINE__, fdt_strerror(err)); \
>> +	} \
>> +})
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +	struct fdt_property *prp;
>> +	void *fdt;
>> +	int nextoff = 0, offset, err;
>> +	uint32_t tag, val;
>> +
>> +	test_init(argc, argv);
>> +	fdt = calloc(1, FDT_SIZE);
> No need to use cleared memory, the fdt_sw functions will work just
> fine with an uninitialized buffer.

Ok

> 
>> +	if (!fdt)
>> +		FAIL("Can't allocate memory");
>> +	err = fdt_create(fdt, FDT_SIZE);
>> +	CHECK_ERR(err);
>> +	err = fdt_add_reservemap_entry(fdt, 0xdeadbeefUL, 0x10000UL);> No need to insert a dummy reservemap entry here.

Ok, removed

> 
>> +	CHECK_ERR(err);
>> +	err = fdt_finish_reservemap(fdt);
>> +	CHECK_ERR(err);
>> +	err = fdt_begin_node(fdt, "");
>> +	CHECK_ERR(err);
>> +	err = fdt_begin_node(fdt, "subnode1");
>> +	CHECK_ERR(err);
> No particular need for this subnode either, you can test what you want
> with properties on the root node.

Removed the extra subnode.

> 
>> +	err = fdt_property_u32(fdt, "prop-int-32", 0x1234);
>> +	CHECK_ERR(err);
>> +	err = fdt_property_u32(fdt, "prop2-int-32", 0x4321);
>> +	CHECK_ERR(err);
>> +	err = fdt_end_node(fdt);
>> +	CHECK_ERR(err);
>> +	err = fdt_end_node(fdt);
>> +	CHECK_ERR(err);
>> +	offset = -1;
>> +	val = cpu_to_fdt32(0x1234);
>> +	offset = fdt_node_offset_by_prop_value(fdt, offset,  "prop-int-32",
>> +					       &val, sizeof(val));
> fdt_node_offset_by_prop_value() is a very roundabout way to find the
> node you need - you know the path (and if you get rid of the
> unnecessary subnode, it'll just be the root node at offset 0).

I removed that as well.

> 
>> +	do {
>> +		tag = fdt_next_tag(fdt, offset, &nextoff);
>> +		offset = nextoff;
>> +	} while (tag != FDT_PROP);
>> +
>> +	/* Calculate len to property */
>> +	prp = (struct fdt_property *)(((char*)fdt) + fdt_off_dt_struct(fdt) + offset);
> You could replace the loop as well as this nasty pointer arithmetic
> with an fdt_get_property_w() call.

The fdt_get_property_w() was what I was looking for, thanks, but even using it
I'm getting a different pointer within the fdt to what I'm getting when I
calculate the offset myself. I the tag value that it is pointing to is the
FDT_BEGIN_NODE. Do I need to do anything else after with the pointer returned
from fdt_get_property_w()?

> 
>> +	/* int overflow case */
> Probably worth testing the fdt_next_tag() behaviour on the unmangled
> tree before testing the corrupted cases.  If the test ever breaks,
> that sort of thing makes it easier to figure out if the breakage is in
> the library, or the testcase.
  
Will do.

-- 
Thanks,
Tadeusz

