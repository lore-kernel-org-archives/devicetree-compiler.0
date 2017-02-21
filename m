From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 1/5] Add an initial Python library for libfdt
Date: Tue, 21 Feb 2017 11:07:58 -0700
Message-ID: <CAPnjgZ2hWsfm7PoNReLt7cAk=OiZBzwERFQnb-utF4fWMuUXgw@mail.gmail.com>
References: <20170215035200.29934-1-sjg@chromium.org> <20170215035200.29934-2-sjg@chromium.org>
 <20170215052942.GI12369@umbus.fritz.box> <CAPnjgZ2SK-WRkeZwzjh+gA_zB0GiNFyVyer4zA_k9LUdXRV94Q@mail.gmail.com>
 <20170220033726.GN12644@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=XcTTBccKiCme9rbTvejbKLYLndcbOBE6KT4yN+UOBtE=;
        b=sDA1rkggvViNrl7BFyU6HJEUicsm660lU/7enpt6JNOqnHRJQk08dfNee3zWSSdNvl
         SHfiEUGhK7QlbvKU0xoW9pfovRtq/Y8upbi8A42J3ZyXXvm7p+VQxiEE01Y0YSgwW0dJ
         BMssDhiOqrdpMnF9ipgdbUd8BmcHmfTiPZkrzwyysdM8YX3r1jJft3UoMXLWWsqi7/Ib
         QOztPsuwyyfvazQ6ND2jPuKYNwqFKF3Isat2xI6F4t3+DLxv86RvdfzB++ful4ZZPcnk
         8JoOneu7AYnHZYVh7hGEofwr8Pvb1QnsrwDCSRQgC6q1gGjJ1aOhoL8bte+L/SvPxSGK
         hsgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=XcTTBccKiCme9rbTvejbKLYLndcbOBE6KT4yN+UOBtE=;
        b=TR17fO24g4/0/Zk22XwXrbwMVlVtGL4j9PGtzhKzdqZzrDQat66AuzOmVEtjdTXXW8
         ZnkhofpjmLYZrEPZBsS1WQRjVyDPUDU7wvObRoCAMdOZC+GghakhF1IZGjBhBZ0xktvk
         lDJZuxhiOr+EHiaKdAn81z08vv5jFB1ZiK/lE=
In-Reply-To: <20170220033726.GN12644-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 19 February 2017 at 20:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Feb 16, 2017 at 09:48:22PM -0700, Simon Glass wrote:
>> Hi David,
>>
>> On 14 February 2017 at 22:29, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Tue, Feb 14, 2017 at 08:51:56PM -0700, Simon Glass wrote:
>> >> Add Python bindings for a bare-bones set of libfdt functions. These allow
>> >> navigating the tree and reading node names and properties.
>> >>
>> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> >> ---
>> >>
>> >> Changes in v5:
>> >> - Use a 'quiet' parameter instead of quiet versions of functions
>> >> - Add a Property object to hold a property's name and value
>> >> - Drop the data() and string() functions which are not needed now
>> >> - Rename pylibfdt_copy_data() tp pylibfdt_copy_value()
>> >> - Change order of libfdt.h inclusion to avoid #ifdef around libfdt macros
>> >> - Drop fdt_offset_ptr() and fdt_getprop_namelen() from the swig interface
>> >> - Use $(SWIG) to call swig from the Makefile
>> >> - Review function comments
>> >>
>> >> Changes in v4:
>> >> - Make the library less pythonic to avoid a shaky illusion
>> >> - Drop classes for Node and Prop, along with associated methods
>> >> - Include libfdt.h instead of repeating it
>> >> - Add support for fdt_getprop()
>> >> - Bring in all libfdt functions (but Python support is missing for many)
>> >> - Add full comments for Python methods
>> >>
>> >> Changes in v3:
>> >> - Make the library more pythonic
>> >> - Add classes for Node and Prop along with methods
>> >> - Add an exception class
>> >> - Use Python to generate exeptions instead of SWIG
>> >>
>> >> Changes in v2:
>> >> - Add exceptions when functions return an error
>> >> - Correct Python naming to following PEP8
>> >> - Use a class to encapsulate the various methods
>> >> - Include fdt.h instead of redefining struct fdt_property
>> >> - Use bytearray to avoid the SWIG warning 454
>> >> - Add comments
>> >>
>> >>  Makefile                   |   1 +
>> >>  pylibfdt/.gitignore        |   3 +
>> >>  pylibfdt/Makefile.pylibfdt |  18 ++
>> >>  pylibfdt/libfdt.swig       | 465 +++++++++++++++++++++++++++++++++++++++++++++
>> >>  pylibfdt/setup.py          |  34 ++++
>> >>  5 files changed, 521 insertions(+)
>> >>  create mode 100644 pylibfdt/.gitignore
>> >>  create mode 100644 pylibfdt/Makefile.pylibfdt
>> >>  create mode 100644 pylibfdt/libfdt.swig
>> >>  create mode 100644 pylibfdt/setup.py
>> >>
>>
>> [..]
>>
>> >> +def check_err_null(val, quiet=[]):
>> >> +    """Raise an error if the return value is NULL
>> >> +
>> >> +    This is used to check for a NULL return value from certain libfdt C
>> >> +    functions
>> >> +
>> >> +    Args:
>> >> +        val: Return value from a libfdt function
>> >> +        quiet: Errors to ignore (empty to raise on all errors)
>> >> +
>> >> +    Returns:
>> >> +        val if val is a list, None if not
>> >> +
>> >> +    Raises
>> >> +        FdtException if val indicates an error was reported and the error
>> >> +        is not in @quiet.
>> >> +    """
>> >> +    # Normally a tuple is returned which contains the data and its length.
>> >
>> > Is it a tuple returned..?
>> >
>> >> +    # If we get just an integer error code, it means the function failed.
>> >> +    if not isinstance(val, list):
>> >
>> > ..or a list?  Seems like either the comment or the code must be
>> > incorrect here.
>>
>> OK.
>>
>> >
>> > Come to that, what is it tells swig to map fdt_propery_by_offset() and
>> > the like to the pair of values?  How does it know how to detect the
>> > error cases?
>> >
>> > From the usage, I take it that in the success case val[0] is a string
>> > or bytearray containing the relevant chunk of data.  Remind me what
>> > the second value is?
>>
>> It's the length, or error number. The final arg to
>> fdt_get_property_by_offset() is int *len.
>
> Ok.  Why is it sometimes a tuple and sometimes a bare error value
> then?  I would have expect it to always return a 2-tuple, the first
> being the return value (maybe NULL/None) and the second being the
> len/err value returned by reference.
>
> I guess that's a swig question rather than  question for you, though.

Well it's just the way that it seems to work. I think it makes some
sense in that we don't want to return a NULL pointer into Python. But
I agree it is a bit odd and it took me a while to get used to it.

Here is the generated code. I'm not sure what SWIG_IsTmpObj() does exactly...

  result = (struct fdt_property *)fdt_get_property_by_offset((void
const *)arg1,arg2,arg3);
  resultobj = SWIG_NewPointerObj(SWIG_as_voidptr(result),
SWIGTYPE_p_fdt_property, 0 |  0 );
  if (SWIG_IsTmpObj(res3)) {
    resultobj = SWIG_Python_AppendOutput(resultobj, SWIG_From_int((*arg3)));
  } else {
    int new_flags = SWIG_IsNewObj(res3) ? (SWIG_POINTER_OWN |  0 ) :  0 ;
    resultobj = SWIG_Python_AppendOutput(resultobj,
SWIG_NewPointerObj((void*)(arg3), SWIGTYPE_p_int, new_flags));
  }

Regards,
Simon
