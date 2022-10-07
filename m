From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] libfdt: tests: add get_next_tag_invalid_prop_len
Date: Fri, 7 Oct 2022 12:07:44 -0700
Message-ID: <15a9e0bd-bb20-c996-3773-b71bafc0d24b@linaro.org>
References: <20221006223155.3316133-1-tadeusz.struk@linaro.org>
 <Yz+nDsk1vmn8xzBY@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWnjKIGsrwm0RR3JbG+t276cYqqvh/NaCnOZ7FG2A1I=;
        b=G6CT+P//QCJgWPFQygtNauD412X99iyKzIiOPh4a4xMfSXPz4j/TH72YbKtLnuajnX
         qrc6oHHNgYnezgVpkfckyDZmfaP4BaNZLBhFL6w/WS/Yp9PmEiR6qc/b3T7LaavjVkYb
         iXAzl6IGg9oRhw5gO2Te6NBEYmHwNx9zfynauAmkWmvYze9o1ML7TpLOV9J9TpBGtTza
         DtQLeZOLDd2SZlGpjqsldp+p6ciG0MErsmkNniuBzadgLWAPwiGNXBgpbtkfFBcOm3Hv
         iIB0GcY3bi+PZLdX/51kY3djqj7cCgtMczlHurgmACqYvNlbcYxb6AoJ9XHx0JK6GLww
         7Q6Q==
Content-Language: en-US
In-Reply-To: <Yz+nDsk1vmn8xzBY@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 10/6/22 21:11, David Gibson wrote:
> On Thu, Oct 06, 2022 at 03:31:55PM -0700, Tadeusz Struk wrote:
>> Add a new test get_next_tag_invalid_prop_len, which covers
>> fdt_next_tag(), when it is passed an corrupted blob, with
>> invalid property len values.
>>
>> Signed-off-by: Tadeusz Struk<tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Sorry, I was hoping I'd be able to apply this variant, but
> unfortunately I realize I've given you some misleading advice in
> earlier reviews, so there are still a few nits to squash, details
> below.  Thanks for your patience.
> 
>> ---
>> v4:
>>   * I didn't keep track of the changes in the test code,
>>     but this version should have all the comments addressed.
>> ---
>>   tests/.gitignore                      |  1 +
>>   tests/Makefile.tests                  |  2 +-
>>   tests/get_next_tag_invalid_prop_len.c | 76 +++++++++++++++++++++++++++
>>   tests/meson.build                     |  1 +
>>   tests/run_tests.sh                    |  1 +
>>   5 files changed, 80 insertions(+), 1 deletion(-)
>>   create mode 100644 tests/get_next_tag_invalid_prop_len.c
>>
>> diff --git a/tests/.gitignore b/tests/.gitignore
>> index 03bdde2..3376ed9 100644
>> --- a/tests/.gitignore
>> +++ b/tests/.gitignore
>> @@ -74,3 +74,4 @@ tmp.*
>>   /truncated_memrsv
>>   /utilfdt_test
>>   /value-labels
>> +/get_next_tag_invalid_prop_len
>> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
>> index 2d36c5d..2c5b4c9 100644
>> --- a/tests/Makefile.tests
>> +++ b/tests/Makefile.tests
>> @@ -4,7 +4,7 @@ LIB_TESTS_L = get_mem_rsv \
>>   	get_path supernode_atdepth_offset parent_offset \
>>   	node_offset_by_prop_value node_offset_by_phandle \
>>   	node_check_compatible node_offset_by_compatible \
>> -	get_alias \
>> +	get_alias get_next_tag_invalid_prop_len \
>>   	char_literal \
>>   	sized_cells \
>>   	notfound \
>> diff --git a/tests/get_next_tag_invalid_prop_len.c b/tests/get_next_tag_invalid_prop_len.c
>> new file mode 100644
>> index 0000000..20c51de
>> --- /dev/null
>> +++ b/tests/get_next_tag_invalid_prop_len.c
>> @@ -0,0 +1,76 @@
>> +// SPDX-License-Identifier: LGPL-2.1-or-later
>> +/*
>> + * libfdt - Flat Device Tree manipulation
>> + *	Testcase for fdt_next_tag()
>> + */
>> +#include <stdlib.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <stdint.h>
>> +
>> +#include <libfdt.h>
>> +#include "tests.h"
>> +#include "testdata.h"
>> +
>> +#define FDT_SIZE 65536
>> +#define CHECK_ERR(err) \
>> +({ if (err) \
>> +	FAIL("%s: %d: %s", __FILE__, __LINE__, fdt_strerror(err)); \
>> +})
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +	struct fdt_property *prp;
>> +	void *fdt;
>> +	int nextoff = 0, offset, err;
>> +	uint32_t tag;
>> +
>> +	test_init(argc, argv);
>> +	fdt = malloc(FDT_SIZE);
>> +	if (!fdt)
>> +		FAIL("Can't allocate memory");
>> +	err = fdt_create(fdt, FDT_SIZE);
>> +	CHECK_ERR(err);
>> +	fdt_set_off_dt_strings(fdt, FDT_SIZE);
> My comment about not needing to create the dummy reservemap entry was
> misleading, sorry.  I was just referring to the actual dummy entry you
> created with fdt_add_reservemap_entry.  You should still call
> fdt_finish_reservemap() so that the blob is in the right state to call
> fdt_begin_node().  Directly manipulating with fdt_set_off_dt_strings()
> is unnecesarily fragile since it requires internal knowledge of how
> the sw functions keep track of the state.
> 
>> +	err = fdt_begin_node(fdt, "");
>> +	CHECK_ERR(err);
>> +	err = fdt_property_u32(fdt, "prop-int-32", 0x1234);
>> +	CHECK_ERR(err);
>> +	err = fdt_property_u32(fdt, "prop2-int-32", 0x4321);
>> +	CHECK_ERR(err);
>> +	err = fdt_end_node(fdt);
>> +	CHECK_ERR(err);
> One more minor deficiency here I missed earlier.  You're not calling
> fdt_finish(), so the blob is in sw state.  The read-only libfdt
> functions are designed to work on sw state trees as well as finished
> trees, but there are some internal logic differences to handle this.
> 
> You're probably mostly concerned with the original fdt_next_tag() bug
> for finished trees, so it's probably better to call fdt_finish() so
> that's the case you're testing.  Alternatively, you could test both
> variants.  Since you're corrupting the tree, you'll need to
> reconstruct the test blob for each variant.  You could either make a
> helper function taking a parameter and call it twice, or make the
> whole test binary take a parameter and invoke it twice from
> run_tests.sh.
> 
>> +	offset = fdt_first_property_offset(fdt, 0);
>> +	if (offset <= 0)
>> +		FAIL("FAIL Invalid offset %x, expected value greater than 0\n",
>> +		     offset);
>> +
>> +	/* Normal case */
>> +	tag = fdt_next_tag(fdt, offset, &nextoff);
>> +	if (tag != FDT_PROP )
>> +		FAIL("FAIL Invalid tag %x, expected FDT_PROP\n", tag);
>> +
>> +	/* Get a writable ptr to the first property and corrupt the lenght */
>> +	prp = fdt_get_property_w(fdt, 0, "prop-int-32", NULL);
>> +	if (!prp)
>> +		FAIL("Bad property pointer");
> My comment about using fdt_get_property_w() was also a bit misleading,
> since I wasn't thinking about the fact that you need both the offset
> (for fdt_next_tag()) and the direct pointer to the property struct.
> 
> This code is relying on the offset from fdt_first_property_offset()
> and the pointer from fdt_get_property_w() referring to the same
> location in the blob.  They will be, but it would be better to have
> that be obvious by construction.
> 
> I'd suggest you first get the offset with fdt_first_property_offset(),
> then compute the prp pointer from that with
> fdt_get_property_by_offset().  You'll need a cast to remove the const
> from the latter in order to mangle the tree, of course.  If you wanted
> to add a new fdt_get_property_by_offset_w() wrapper to do that cast,
> that would also be fine (if you do, make it a separate patch please).
> There's no particular rationale to which functions have _w() variants
> and which don't (so far), I just made the _w() variants when I needed
> them for other functions internally.

I have added a new helper and used it to get the pointer at the same
offset. I also addressed your comments above. New version on its way.
There will be 2 new patches, first with the helper, and second with
the updated test (v5), and they supposed to be applied on the v3 1/1
I sent before. Thanks for your feedback.

-- 
Thanks,
Tadeusz

