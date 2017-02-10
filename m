From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/5] Adjust libfdt.h to work with swig
Date: Fri, 10 Feb 2017 11:39:26 -0700
Message-ID: <CAPnjgZ28LYoJ7N_8sNhV_FXXQg0eDZMDOFrsJZxNVx9mXSQk5g@mail.gmail.com>
References: <20170205201323.15411-1-sjg@chromium.org> <20170205201323.15411-5-sjg@chromium.org>
 <20170210050132.GF25381@umbus>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=1FGcKUN1Snial9Djrfc0iejUw3RWVSpnZB0Zkb6i+U4=;
        b=BE4l1hmzR0f5tMZrTPHwhwxMdrYyiL6lwCG3rWe5/ugYT9TRxaEH7pjqufQBSWlACj
         Wkbfte9yF/DBfZN/nnn99kHVINIbOh2UlDTK78AlyBb4/ovOHN/nshcuXMPiDI9eGbLc
         JM3Q1C0hfgZSxx3FNfXIeUvcwCP7VZi9VUAiOi6pSR+rwnIu+ZnUvpV2oqA0eb1b/RXs
         Jzq+84opvu842OnPajMOjbVUkYPQ7q9L4csSKkb/qKaeIWyzXZEGCIPtI3Os/HkF66hb
         ORY9ZJjrVB7/stlEGMV7+3pfnIZ6Mnec3W6TwS1eaOrTw3muxocBnm0m40irOrIiC+9G
         lQkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=1FGcKUN1Snial9Djrfc0iejUw3RWVSpnZB0Zkb6i+U4=;
        b=kv63usB+kb7fP4Jg2RMfz4x97jW+Mk6C6mr7ROMVx7ah/0E00GOzl/wjV2EgL/GR90
         NvepC7HwUwhsfcMuWhoeVUE65HnQLO5lKIMDj5PsMX8XTCkadUx38a+Jih3Ku8RmiJkK
         YlyZWZnZ3kgDrOtHBZMejKUnxLlaMAhEbV87A=
In-Reply-To: <20170210050132.GF25381@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 9 February 2017 at 22:01, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sun, Feb 05, 2017 at 01:13:22PM -0700, Simon Glass wrote:
>> There are a few places where libfdt.h cannot be used as is with swig:
>>
>> - macros like fdt_totalsize() have to be defined as C declarations
>> - fdt_offset_ptr() and fdt_getprop_namelen() need special treatment due to
>>     a TODO in the wrapper for fdt_getprop()
>
> fdt_offset_ptr() is a very low-level function which should be rarely
> needed outside libfdt internals, even in C.  I think it makes sense to
> exclude it from the Python interface.

Sounds good.

>
> fdt_getprop_namelen() is primarily to make certain things easier in C
> where copying and slicing up strings can be quite painful.  Since
> that's trivial in Python, I don't think there's any need to expose the
> namelen() functions in Python.

Yes that's a good point, will drop it.

>
>>
>> The second one can hopefully be resolved by someone with more knowledge of
>> SWIG than me.
>>
>> Add #ifdefs to work around this problem.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>
>> Changes in v4:
>> - Add new patch to adjust libfdt.h to work with swig
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>  libfdt/libfdt.h | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
>> index c69e918..2e78754 100644
>> --- a/libfdt/libfdt.h
>> +++ b/libfdt/libfdt.h
>> @@ -143,7 +143,9 @@
>>  /* Low-level functions (you probably don't need these)                */
>>  /**********************************************************************/
>>
>> +#ifndef SWIG /* Use a special rule in libfdt.swig instead */
>>  const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int checklen);
>> +#endif
>>  static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
>>  {
>>       return (void *)(uintptr_t)fdt_offset_ptr(fdt, offset, checklen);
>> @@ -210,7 +212,7 @@ int fdt_next_subnode(const void *fdt, int offset);
>>  /**********************************************************************/
>>  /* General functions                                                  */
>>  /**********************************************************************/
>> -
>> +#ifndef SWIG /* Repeated in libfdt.swig (we cannot use macros) */
>
> You need to duplicate them in libfdt.swig, certainly, but why do you
> need to explicitly cut them out here?  Isn't swig smart enough to know
> it can't do anything with these?

Because the #define stuffs up my declarations. But it's easy to put
the declarations first to avoid that problem, so I'll do that.

[..]

Regards,
Simon
