From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v7 2/5] Add tests for pylibfdt
Date: Tue, 28 Feb 2017 22:40:32 -0700
Message-ID: <CAPnjgZ0SB4j1QyD7TrnJf=WTt3To0SvUBT5p81vzfnDMxz1aGA@mail.gmail.com>
References: <20170222043340.17008-1-sjg@chromium.org> <20170222043340.17008-3-sjg@chromium.org>
 <20170224025254.GJ17615@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=NtxiFOtHgDT7tqy/AtHgC7pNJRdhiqKMFCxw33C7low=;
        b=VjV3miKKb7s13EwtAvGi9wtxNGectc4dSEi/CRPkFIFT+jvAAyjztOviJZcgt9mZqk
         OgkVL9Wb3/undbl8fPjSN2EcDcQHc0mPGC79fSS1xp2TrQVnZPeaoMHykLeLomCnv+H4
         Tq/IaoFT0xd3H1XSAivhTYjxSD3Y9FTsbJrsS2VlfTdUoVaL0T8w2YBnEJ6rQ/MyK59Q
         G9/m4lSr3dDAAJZ9AtNmrK4qhCZJIh47SsLnPIPwMUJDEhIdypzRfyIOJhH+2F0NvSF1
         ygaaU0rIqNIvFQrYwqhwpYNv6cfJBa8BYxDLyd5l9uHsaPH5YJAVSYc34ATkmNnitmDx
         5VvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=NtxiFOtHgDT7tqy/AtHgC7pNJRdhiqKMFCxw33C7low=;
        b=oT9WEvUBN2jXbA5KNbeuK7FvZmVPUzUjTQoS9IfcDTp66++jtWWWoq/bSzKh9SeQ94
         1J1pudPj+9LQFj1bnOysTXzqAAIsHZLJNWB9bZr70wdwrFKDVA1bcyk6jiLOf24AY0ZY
         EhpFX3xqV9ElXMzpsY15RE9VL9o6aeVro/tek=
In-Reply-To: <20170224025254.GJ17615-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 23 February 2017 at 19:52, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Feb 21, 2017 at 09:33:37PM -0700, Simon Glass wrote:
>> Add a set of tests to cover the functionality in pylibfdt.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>
>> Changes in v7:
>> - Add a test for QUIET_ALL
>>
>> Changes in v6:
>> - Adjust tests to avoid checking a hard-coded offset
>> - Use 0 instead of self.fdt.path_offset('/')
>> - Adjust the totalsize() test to compare against the file size
>> - Adjust test result processing to avoid using awk
>>
>> Changes in v5:
>> - Adjust tests to match new swig bindings
>>
>> Changes in v4:
>> - Drop tests that are no-longer applicable
>> - Add a get for getprop()
>>
>> Changes in v3:
>> - Add some more tests
>>
>> Changes in v2:
>> - Update tests for new pylibfdt
>> - Add a few more tests to increase coverage
>>
>>  tests/pylibfdt_tests.py | 275 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  tests/run_tests.sh      |  16 ++-
>>  2 files changed, 290 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/pylibfdt_tests.py
>>

>> +    def testPathOffset(self):
>> +        """Check that we can find the offset of a node"""
>> +        self.assertEquals(self.fdt.path_offset('/'), 0)
>> +        self.assertTrue(self.fdt.path_offset('/subnode@1') > 0)
>> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOUND)):
>> +            self.fdt.path_offset('/wibble')
>
> Checking the error string by regexp seems a bit indirect.  Wouldn't it
> be better to add new helper that checks explicitly for an FdtException
> with the right fdt error code embedded in it?

I'm not sure how to do a helper simply since there is a context
manager involved. I'll use the normal method of checking the exception
afterwards.

>
>> +        self.assertEquals(self.fdt.path_offset('/wibble', QUIET_NOTFOUND),
>> +                          -libfdt.NOTFOUND)
>> +
>> +    def testPropertyOffset(self):
>> +        """Walk through all the properties in the root node"""
>> +        self.assertEquals(self.fdt.first_property_offset(0), ROOT_PROPS[0])
>> +        for pos in range(len(ROOT_PROPS) - 1):
>> +            self.assertEquals(self.fdt.next_property_offset(ROOT_PROPS[pos]),
>> +                              ROOT_PROPS[pos + 1])
>> +        self.assertEquals(self.fdt.next_property_offset(ROOT_PROPS[-1],
>> +                                                        QUIET_NOTFOUND),
>> +                          -libfdt.NOTFOUND)
>> +
>> +    def testPropertyOffsetExceptions(self):
>> +        """Check that exceptions are raised as expected"""
>> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFFSET)):
>> +            self.fdt.next_property_offset(107)
>> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFFSET)):
>> +            self.fdt.first_property_offset(107, QUIET_NOTFOUND)
>> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFFSET)):
>> +            self.fdt.next_property_offset(107, QUIET_NOTFOUND)
>
> Isn't this a dupe of the previous statement?  This also looks like a
> case where using QUIET_ALL could make it neater.

All three statements are slightly different.

The intent here is to make sure that quietening one error doesn't mask another.

Regards,
Simon
