From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 1/5] Add an initial Python library for libfdt
Date: Thu, 16 Feb 2017 21:48:22 -0700
Message-ID: <CAPnjgZ2SK-WRkeZwzjh+gA_zB0GiNFyVyer4zA_k9LUdXRV94Q@mail.gmail.com>
References: <20170215035200.29934-1-sjg@chromium.org> <20170215035200.29934-2-sjg@chromium.org>
 <20170215052942.GI12369@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=CR6FeD7+4nKqqE4vcRm/JYd/3yQEv98Ucg8Xq3z6Nt0=;
        b=mM7gLaxbh931awNeOJh1TOlo8cvJpnj4bdsKuv5+8ya9fXpbTWXhLVbfYe9qljn8AK
         Tu0hF2qC48KzN97wAmIb2BGJYOBj/Vk1SLv32Ey7V/1HOzPc0VJ4xbrsGwOuuJZVQw42
         FLVm2sXBAXrGvKFruqzGjt6LFJeGEovZESMqMZCNu86rRKuo52Y4pUqgQk1lq/uFlvTi
         bHAZSJhWh63tPpNhyoTZ6hG1mZRaoYRZKubNgR8Fe5696/LRpT9iaFj+1lNIv2GJs76W
         4wIDr1BXWMFHeLtrOsHzkcn4sSIupZZe19DRXZQ0rWcRhf25vOcgJ05jb70Fk3uaJ3nM
         d/jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=CR6FeD7+4nKqqE4vcRm/JYd/3yQEv98Ucg8Xq3z6Nt0=;
        b=gbWMOpGkIrUG+vsu05BDw0woG4+/ot8Y5duYU/mbvD3XViMQLke3htCYFApoTxJ9RI
         pskgHyQdZtk76yGZCvcYhwVIjRPHK40Bnlo09ckS9eHSBsD/3uU2Z/8uzAVtsyYH492X
         RnNqgPX1molC5fUz7alaQU/ZhE8qDx5iKVQrw=
In-Reply-To: <20170215052942.GI12369-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 14 February 2017 at 22:29, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Feb 14, 2017 at 08:51:56PM -0700, Simon Glass wrote:
>> Add Python bindings for a bare-bones set of libfdt functions. These allow
>> navigating the tree and reading node names and properties.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>
>> Changes in v5:
>> - Use a 'quiet' parameter instead of quiet versions of functions
>> - Add a Property object to hold a property's name and value
>> - Drop the data() and string() functions which are not needed now
>> - Rename pylibfdt_copy_data() tp pylibfdt_copy_value()
>> - Change order of libfdt.h inclusion to avoid #ifdef around libfdt macros
>> - Drop fdt_offset_ptr() and fdt_getprop_namelen() from the swig interface
>> - Use $(SWIG) to call swig from the Makefile
>> - Review function comments
>>
>> Changes in v4:
>> - Make the library less pythonic to avoid a shaky illusion
>> - Drop classes for Node and Prop, along with associated methods
>> - Include libfdt.h instead of repeating it
>> - Add support for fdt_getprop()
>> - Bring in all libfdt functions (but Python support is missing for many)
>> - Add full comments for Python methods
>>
>> Changes in v3:
>> - Make the library more pythonic
>> - Add classes for Node and Prop along with methods
>> - Add an exception class
>> - Use Python to generate exeptions instead of SWIG
>>
>> Changes in v2:
>> - Add exceptions when functions return an error
>> - Correct Python naming to following PEP8
>> - Use a class to encapsulate the various methods
>> - Include fdt.h instead of redefining struct fdt_property
>> - Use bytearray to avoid the SWIG warning 454
>> - Add comments
>>
>>  Makefile                   |   1 +
>>  pylibfdt/.gitignore        |   3 +
>>  pylibfdt/Makefile.pylibfdt |  18 ++
>>  pylibfdt/libfdt.swig       | 465 +++++++++++++++++++++++++++++++++++++++++++++
>>  pylibfdt/setup.py          |  34 ++++
>>  5 files changed, 521 insertions(+)
>>  create mode 100644 pylibfdt/.gitignore
>>  create mode 100644 pylibfdt/Makefile.pylibfdt
>>  create mode 100644 pylibfdt/libfdt.swig
>>  create mode 100644 pylibfdt/setup.py
>>

[..]

>> +def check_err_null(val, quiet=[]):
>> +    """Raise an error if the return value is NULL
>> +
>> +    This is used to check for a NULL return value from certain libfdt C
>> +    functions
>> +
>> +    Args:
>> +        val: Return value from a libfdt function
>> +        quiet: Errors to ignore (empty to raise on all errors)
>> +
>> +    Returns:
>> +        val if val is a list, None if not
>> +
>> +    Raises
>> +        FdtException if val indicates an error was reported and the error
>> +        is not in @quiet.
>> +    """
>> +    # Normally a tuple is returned which contains the data and its length.
>
> Is it a tuple returned..?
>
>> +    # If we get just an integer error code, it means the function failed.
>> +    if not isinstance(val, list):
>
> ..or a list?  Seems like either the comment or the code must be
> incorrect here.

OK.

>
> Come to that, what is it tells swig to map fdt_propery_by_offset() and
> the like to the pair of values?  How does it know how to detect the
> error cases?
>
> From the usage, I take it that in the success case val[0] is a string
> or bytearray containing the relevant chunk of data.  Remind me what
> the second value is?

It's the length, or error number. The final arg to
fdt_get_property_by_offset() is int *len.

[..]


>> +
>> +/* This is used to copy property data into a bytearray */
>> +%mypybuffer_mutable_binary(char *str, size_t size);
>> +void pylibfdt_copy_value(char *str, size_t size,
>> +                     const struct fdt_property *prop);
>
> This still seems convoluted to me.  Maybe I'm misunderstanding
> something about SWIG.  But instead of using pylibfdt_copy_value() as
> an intermediary, couldn't you create a custom typemap that directly
> maps struct fdt_property *prop (as an outbound value) to a Python
> tuple, doing the copy right there.

Possibly, but here I am trying to use a standard typemap to do this
and it would involve changing the error handling.

The other problem is that the output typemap would need access to the
device tree (fdt input parameter) in order to look up the name of the
property.

I suspect a full-custom function could do this, but then it would need
to written separately for each of the functions that returns struct
fdt_property.

Also my enthusiasm for more SWIG wrangling is waning faster than a
schooner at the races...perhaps someone other than myself can plot a
course to a better solution here?

>
> Oh.. also if you do need this function, use 'uint8_t *val' instead
> of 'char *str' to reinforce the fact that this is a bytestring not a
> C-style string we're dealing with.

OK.

[...]

>> +
>> +%apply int *OUTPUT { int *lenp };
>> +
>> +/* typemap used for fdt_getprop() */
>> +%typemap(out) (const void *) {
>> +     if (!$1)
>> +             $result = Py_None;
>> +     else
>> +             /* TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Can we avoid the 'arg4'? */
>> +             $result = Py_BuildValue("s#", $1, *arg4);
>> +}
>
> Since you already have a custom typemap here for getprop(), couldn't
> you drop the now unnecessary length (because Python strings know their
> length) here, instead of doing it from the Python side?

The length is necessary if it is an error number (the last parameter
to fdt_getprop()).

Regards,
Simon
