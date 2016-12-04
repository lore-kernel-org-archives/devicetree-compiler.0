From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] Add an initial Python library for libfdt
Date: Sat, 3 Dec 2016 17:47:22 -0700
Message-ID: <CAPnjgZ1tcSrj0x0FQJihagk5SsL=HKBUxhc6ph9igU6p_=dDbw@mail.gmail.com>
References: <1480010842-13957-1-git-send-email-sjg@chromium.org>
 <1480010842-13957-2-git-send-email-sjg@chromium.org> <20161124224908.GH23872@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=iVQ8omFOPsLgup87xFBAcn+MKGMWannvamB0bP33+Io=;
        b=pRbis5imZu2GrYgalgepws/hxnciCCQycDDlr+dDby2PPNTG+/wz6plwCQyQSP8/sp
         +azAsm8ZP5Tgf+pgo0kP7AfwsgLQWzqigE7EuCaawdJPmrgPb/r4dFpLbk6NFJfouy18
         /iFO50LACY13aWiZG117jS0aNaxb1cA0FmkVDXjBGusNEGBteTVzB9c9nYQhx0PYr/Vf
         FyCAta1VMBy+5OC2Xvvw0ocx899kOjtB1cKy+G9zqONH0fi6KuDwe+SDY0mM+rOPhacb
         Bk3jzImYNQpCdywcY02+fuldHOsiUYBwFdfiig9eWkoy1d/m/38yI5x8JZo5GrML1ssc
         BvWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=iVQ8omFOPsLgup87xFBAcn+MKGMWannvamB0bP33+Io=;
        b=gADEgt307z/PQ81mDnlDgk+kFhXVEd6rJcLFEnLVnxyrySIGKq95inOFm4IPIn5C8B
         JhlVLulAMZhPFRy2fszKOD4YwqJNpAzo15sf4vG1yqyUWEGHJKHlVcDdL2sQ9zFJcuJE
         l+brFtSQXtvumqARnrzpsKCa2JnMsVWaHK9/E=
In-Reply-To: <20161124224908.GH23872-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 24 November 2016 at 15:49, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Nov 24, 2016 at 11:07:19AM -0700, Simon Glass wrote:
>> Add Python bindings for a bare-bones set of libfdt functions. These allow
>> navigating the tree and reading node names and properties.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>
>> Changes in v2:
>> - Add exceptions when functions return an error
>> - Correct Python naming to following PEP8
>> - Use a class to encapsulate the various methods
>> - Include fdt.h instead of redefining struct fdt_property
>> - Use bytearray to avoid the SWIG warning 454
>> - Add comments
>>
>>  pylibfdt/.gitignore        |   3 +
>>  pylibfdt/Makefile.pylibfdt |  21 +++
>>  pylibfdt/libfdt.swig       | 427 +++++++++++++++++++++++++++++++++++++++++++++
>>  pylibfdt/setup.py          |  34 ++++
>>  4 files changed, 485 insertions(+)
>>  create mode 100644 pylibfdt/.gitignore
>>  create mode 100644 pylibfdt/Makefile.pylibfdt
>>  create mode 100644 pylibfdt/libfdt.swig
>>  create mode 100644 pylibfdt/setup.py
>>

[...]

>> +def data(prop):
>> +    """Extract the data from a property
>> +
>> +    Args:
>> +        prop: Property structure, as returned by get_property_by_offset()
>> +
>> +    Returns:
>> +        The property data as a bytearray
>> +    """
>
> I don't quite see how these property "object"s are being represented
> on the Python side.  This seems a very awkward approach compared to
> grapping a field within the object.

Yes there is a TODO later on about creating classes. I've done that for v3.

>
>> +    buf = bytearray(fdt32_to_cpu(prop.len))
>> +    pylibfdt_copy_data(buf, prop)
>> +    return buf
>> +
>> +
>> +class Fdt:
>> +    """Device tree class, supporting all operations
>> +
>> +    The Fdt object is created is created from a device tree binary file,
>> +    e.g. with something like:
>> +
>> +       fdt = Fdt(open("filename.dtb").read())
>> +
>> +    Operations can then be performed using the methods in this class. Each
>> +    method xxx(args...) corresponds to a libfdt function fdt_xxx(fdt, args...).
>> +
>> +    Almost all methods raise a RuntimeException if an error occurs. The
>> +    following do not:
>> +
>> +        string() - since it has no error checking
>> +        strerror() - since it always returns a valid string
>> +
>> +    To avoid this behaviour a 'quiet' version is provided for some functions.
>> +    This behaves as for the normal version except that it will not raise
>> +    an exception in the case of an FDT_ERR_NOTFOUND error: it will simply
>> +    return the -NOTFOUND error code.
>> +    """
>> +    def __init__(self, data):
>> +        self._fdt = bytearray(data)
>> +
>> +    def string(self, offset):
>> +        """Get a string given its offset
>> +
>> +        Args:
>> +            offset: FDT offset in big-endian format
>> +
>> +        Returns:
>> +            string value at that offset
>> +        """
>> +        return fdt_string(self._fdt, fdt32_to_cpu(offset))
>> +
>> +    def data(self, prop):
>> +        """Special member function to return the data from a property"""
>> +        return data(prop)
>
> This shouldn't be a method, since it doesn't use the context of the
> 'self' parameter at all.

OK, adjusted.

>
>> +
>> +    def path_offset(self, path):
>> +        return fdt_path_offset(self._fdt, path)
>> +
>> +    def first_property_offset(self, nodeoffset):
>> +        return fdt_first_property_offset(self._fdt, nodeoffset)
>> +
>> +    def first_property_offset_quiet(self, nodeoffset):
>> +        return fdt_first_property_offset_quiet(self._fdt, nodeoffset)
>> +
>> +    def next_property_offset(self, prop_offset):
>> +        return fdt_next_property_offset(self._fdt, prop_offset)
>> +
>> +    def next_property_offset_quiet(self, prop_offset):
>> +        return fdt_next_property_offset_quiet(self._fdt, prop_offset)
>> +
>> +    def get_name(self, nodeoffset):
>> +        return fdt_get_name(self._fdt, nodeoffset)
>> +
>> +    def get_property_by_offset(self, prop_offset):
>> +        """Obtains a property that can be examined
>> +
>> +        Args:
>> +            prop_offset: Offset of property (e.g. from first_property_offset())
>> +
>> +        Returns:
>> +            Property object with members:
>> +                tag: Big-endian device tree tag value
>> +                len: Big-endian property length
>> +                nameoff: Big-endian string offset for use with string()
>> +
>> +            Use data() on the return value to obtain the property value.
>> +
>> +        Raises:
>> +            RuntimeException on error (e.g. invalid prop_offset or device
>> +            tree format)
>> +        """
>> +        return fdt_get_property_by_offset(self._fdt, prop_offset)[0]
>> +
>> +    def strerror(self, fdt_err):
>> +        return fdt_strerror(fdt_err)
>
> Likewise this should not be a method.

Done

[...]

>> +/**
>> + * pylibfdt_record_error() - Records an exception with SWIG
>> + *
>> + * This causes an exception to be raised when we return back to Python.
>> + *
>> + * @err: Negative FDT error code value to use (-FDT_ERR_...)
>> + *
>> + * TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Can we define a LibfdtException class to return
>> + * instead of RuntimeError?
>
> We certainly should, but I think you're making life too difficult for
> yourself.  It's pretty standard practice in Swig to have a "raw"
> interface which is the thinnest possible wrapper around the C code,
> then a more Pythonic higher level wrapper, written in Python.  I think
> the "raw" interface should just return error codes - just like the C.
> The Pythonic wrapper can catch that and throw a LibFdtError (or
> whatever) without having to dick around with swig's exception magic.

Yes that seems easier, thanks - I've updated it.

>
>
> TBH.. I'm actually wondering if swig is being more trouble than it's
> worth here.  Given the pretty simple datatypes that libfdt deals with,
> would it be as simple or simpler to just load libfdt.so using the
> ctypes module and write a Pythonic wrapper to do the various
> conversions between ctypes.c_char_p and string/bytes buffers.

Unless we hit a big problem I'd rather use swig since it is the
standard method and is more likely to be compatible with different
pythons, build environments. Also people are used to it.

[...]

Regards,
Simon
