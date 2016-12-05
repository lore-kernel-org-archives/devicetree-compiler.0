From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/4] Add an initial Python library for libfdt
Date: Sun, 4 Dec 2016 23:23:32 -0700
Message-ID: <CAPnjgZ3NExZtPYHoPc-3S2D1cBizegziiCGgjRGtextvMXYmyw@mail.gmail.com>
References: <1480812490-11926-1-git-send-email-sjg@chromium.org>
 <1480812490-11926-2-git-send-email-sjg@chromium.org> <20161205043522.GE32366@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ry4FpEEbrycrzx3KosERxd+J0e85avg5wuz3YcpVzko=;
        b=eFm1ICz7/jPfi5EQo5GbLhCr0RgVPpHpIQO2BbBzPu3KTpxqlfOUqJaxmoSLQiXZPs
         kik5Rhu/Bipw95D4/WmTrjGANU/iZEsJJqDuVR/8wzLt40FoRPe8L5RwLK6gDxoKp5eM
         UVkkHbu1KVjLewhBv8zWxU6QM/JHtbKl2Ntvt8V/kCOlMiXVlvZBYYl7ftBUwrzCJ7mF
         YKvYMXG8ORl/lalfA3R5RlA4bpMcRzHKu9XP+wLYRm+A2VA/qgRvSBLJfFsN0/SjJrEc
         /Lb6KmzFLp2Nqk99+6DRFc3xjeZLKcmiMoJtcsJ7yEM/4qE2E1AhOFksxv+gBhnHnB+A
         eiLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ry4FpEEbrycrzx3KosERxd+J0e85avg5wuz3YcpVzko=;
        b=fnXrXiPntYQid29rTTjptmbLmmWCE8gPzQv/i5rPKGONU1hBTlQHi55ghcWZs1v8TB
         DPrK/6l8E4B1ddVTa4xXCvuaXjtYm23LYl+vHOp5lcV4a27pKxQpwig01oPtJPuXsPPv
         TgX3tQ/+UTynaJdufOn2xMs2x2Potiy1zR8w4=
In-Reply-To: <20161205043522.GE32366-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 4 December 2016 at 21:35, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sat, Dec 03, 2016 at 05:48:07PM -0700, Simon Glass wrote:
>> Add Python bindings for a bare-bones set of libfdt functions. These allow
>> navigating the tree and reading node names and properties.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
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
>>  pylibfdt/.gitignore        |   3 +
>>  pylibfdt/Makefile.pylibfdt |  18 ++
>>  pylibfdt/libfdt.swig       | 602 +++++++++++++++++++++++++++++++++++++++++++++
>>  pylibfdt/setup.py          |  34 +++
>>  4 files changed, 657 insertions(+)
>>  create mode 100644 pylibfdt/.gitignore
>>  create mode 100644 pylibfdt/Makefile.pylibfdt
>>  create mode 100644 pylibfdt/libfdt.swig
>>  create mode 100644 pylibfdt/setup.py
>>
[..]

>> +# Error codes, corresponding to FDT_ERR_... in libfdt.h
>> +(NOTFOUND,
>> +        EXISTS,
>> +        NOSPACE,
>> +        BADOFFSET,
>> +        BADPATH,
>> +        BADPHANDLE,
>> +        BADSTATE,
>> +        TRUNCATED,
>> +        BADMAGIC,
>> +        BADVERSION,
>> +        BADSTRUCTURE,
>> +        BADLAYOUT,
>> +        INTERNAL,
>> +        BADNCELLS,
>> +        BADVALUE,
>> +        BADOVERLAY) = range(1, 17)
>
> Pity we can't get swig to autogenerate those.

Maybe we can if you want it to change to an enum?

>
>> +class FdtException(Exception):
>> +    """An exception caused by an error such as one of the codes above"""
>> +    def __init__(self, err):
>> +        self.err = err
>> +
>> +    def __str__(self):
>> +        return 'pylibfdt error %d: %s' % (self.err, fdt_strerror(self.err))
>> +
>> +def fdt32_to_cpu(val):
>> +    """Convert a device-tree cell value into a native integer"""
>> +    return struct.unpack("=I", struct.pack(">I", val))[0]
>> +
>> +def data(prop):
>> +    """Extract the data from a property
>> +
>> +    Args:
>> +        prop: Property structure, as returned by get_property_by_offset()
>> +
>> +    Returns:
>> +        The property data as a bytearray
>> +    """
>> +    buf = bytearray(fdt32_to_cpu(prop.len))
>
> prop.len should be a native value, not requiring byteswap.
>
>> +    pylibfdt_copy_data(buf, prop)
>> +    return buf
>
> Urgh.. all this fdt_property() wrangling stuff is really ugly.  Any
> chance we could just exclude it from the wrapper, providing only
> fdt_getprop() interfaces which simply return a Python bytestring
> directly?

I effectively have, by hiding it in here. Client code need never use this.

>
>> +def strerror(fdt_err):
>> +    """Get the string for an error number
>> +
>> +    Args:
>> +        fdt_err: Error number (-ve)
>> +
>> +    Returns:
>> +        String containing the associated error
>> +    """
>> +    return fdt_strerror(fdt_err)
>> +
>> +def check_err(val, quiet=False):
>> +    """Raise an error if the return value is -ve
>> +
>> +    This is used to check for errors returned by libfdt C functions.
>> +
>> +    Args:
>> +        val: Return value from a libfdt function
>> +        quiet: True to ignore the NOTFOUND error, False to raise on all errors
>> +
>> +    Returns:
>> +        val if val >= 0
>> +
>> +    Raises
>> +        FdtException if val is < 0
>> +    """
>> +    if val < 0:
>> +        if not quiet or val != -NOTFOUND:
>> +            raise FdtException(val)
>> +    return val
>> +
>> +def check_err_null(val):
>> +    """Raise an error if the return value is NULL
>> +
>> +    This is used to check for a NULL return value from certain libfdt C
>> +    functions
>> +
>> +    Args:
>> +        val: Return value from a libfdt function
>> +        quiet: True to ignore the NOTFOUND error, False to raise on all errors
>> +
>> +    Returns:
>> +        val if val is not NULL
>> +
>> +    Raises
>> +        FdtException if val is NULL
>> +    """
>> +    # Normally a tuple is returned which contains the data and its length.
>
> Yeah.. since Python strings / bytestrings know their own length, why
> do we need such a tuple?

It's just what swig returns for functions like: const char *func(int *len)

This is internal to the class so should not matter to users.

>
>> +    # If we get just an integer error code, it means the function failed.
>> +    if not isinstance(val, list):
>> +        raise FdtException(val)
>> +    return val
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
>> +    Almost all methods raise a FdtException if an error occurs. The
>> +    following does not:
>> +
>> +        string() - since it has no error checking
>> +
>> +    To avoid this behaviour a 'quiet' version is provided for some functions.
>> +    This behaves as for the normal version except that it will not raise
>> +    an exception in the case of an FDT_ERR_NOTFOUND error: it will simply
>> +    return the -NOTFOUND error code or None.
>> +
>> +    Separate classes are provided for nodes (Node) and properties (Prop).
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
>
> ARGH, no.  The offset argument is an integer, it should be treated as
> a native integer, and the byteswap should absolutely not be here.

Ah yes, oops.

>
>> +    def path(self, path):
>> +        """Get the Node for a given path
>> +
>> +        Args:
>> +            path: Path to the required node, e.g. '/node@3/subnode@1'
>> +
>> +        Returns:
>> +            Node object for this node
>> +
>> +        Raises
>> +            FdtException if the path is not valid
>> +        """
>> +        return Node(self, check_err(fdt_path_offset(self._fdt, path)))
>
> This interface is a mistake - more details on class Node below.

[..]

>> +    def get_property(self, nodeoffset, name):
>> +        """Get a property given a node offset and the property name
>> +
>> +        We cannot use fdt_get_property() here since it does not return the
>> +        offset. We prefer to create Node objects using the offset.
>> +
>> +        Args:
>> +            nodeoffset: Offset of the node
>> +            name: Property name
>> +
>> +        Returns:
>> +            Prop object found
>> +
>> +        Raises:
>> +            FdtException on error such as no such property
>> +        """
>> +        poffset = self.first_property_offset(nodeoffset)
>> +        while True:
>> +            pdata = self.get_property_by_offset_internal(poffset)
>> +            if self.string(pdata.nameoff) == name:
>> +                return Prop(Node(self, nodeoffset), poffset)
>> +            poffset = self.next_property_offset(poffset)
>
> Wait.. what!?  You're searching through the properties in Python?
> Why not just using fdt_get_property() or fdt_getprop()?

Because they do not tell me the offset-(see the comment in the
function description above:

        We cannot use fdt_get_property() here since it does not return the
        offset. We prefer to create Node objects using the offset.

If we want to have a Node object, then we probably want to store the
offset of the node. Another option would be to add a function to
libfdt which gets a property by name, but returns its offset, rather
than a struct?

>
>> +    def get_property_quiet(self, nodeoffset, name):
>> +        """Get a property given a node offset and the property name
>> +
>> +        We cannot use fdt_get_property() here since it does not return the
>> +        offset. We prefer to create Node objects using the offset.
>> +
>> +        Args:
>> +            nodeoffset: Offset of the node
>> +            name: Property name
>> +
>> +        Returns:
>> +            Prop object found or None if there is no such property
>> +
>> +        Raises:
>> +            FdtException on error
>> +        """
>> +        poffset = self.first_property_offset_quiet(nodeoffset)
>> +        while poffset >= 0:
>> +            pdata = self.get_property_by_offset_internal(poffset)
>> +            if self.string(pdata.nameoff) == name:
>> +                return Prop(Node(self, nodeoffset), poffset)
>> +            poffset = self.next_property_offset_quiet(poffset)
>> +        return None
>> +
>> +    def first_subnode(self, nodeoffset):
>> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset))
>> +
>> +    def first_subnode_quiet(self, nodeoffset):
>> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset), True)
>> +
>> +    def next_subnode(self, nodeoffset):
>> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset))
>> +
>> +    def next_subnode_quiet(self, nodeoffset):
>> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset), True)
>> +
>> +    def totalsize(self):
>> +        return check_err(fdt_totalsize(self._fdt))
>> +
>> +    def off_dt_struct(self):
>> +        return check_err(fdt_off_dt_struct(self._fdt))
>> +
>> +    def pack(self):
>> +        return check_err(fdt_pack(self._fdt))
>> +
>> +    def delprop(self, nodeoffset, prop_name):
>> +        return check_err(fdt_delprop(self._fdt, nodeoffset, prop_name))
>> +
>> +
>> +class Node:
>
> This can't work.  The reason that so many libfdt functions are
> insistently called whatever_offset(), rather than just get_whatever()
> is to constantly remind the user that this is a actual byte offset
> into a buffer of data.  It's *not* a friendly stable node-handle, and
> can become invalid when the fdt blob is altered.
>
> Attempting to put a class wrapper around it obscures that vital fact.
> Treat node offsets as offsets everywhere, just encoded as plain old
> python integers.

My intent is to make the interface more pythonic, and I've been trying
out various approaches. For read-only use this interface is nice.
Consider this the high-water mark of this approach.

But I can go back to something in between, where there is no Node or
Prop. But please do check the code example in the cover letter and see
if you are sure.

With this approach we can do things like node.next() which is nice I think.

Of course things can break if you start changing the tree while
keeping objects around. So it isn't a perfect illusion. Hopefully it
returns errors in that case..

[..]

>> +class Prop:
>> +    """A device-tree property
>> +
>> +    This encapsulates a device-tree property and provides various operations
>> +    which can be performed on the property.
>> +
>> +    Generally the standard constructor is used to create a Prop object. But
>> +    in the case where only the property offset is known (and not the Node
>> +    that holds the property), from_offset() can be used.
>> +    """
>
> TBH, I'm not really sold on the value of this class either.  Is there
> really any point dealing with these rather fragile property handles,
> rather than simply returning bytestrings with the values directly?  I
> can't see it.

It provides the ability to iterate, get the name (as well as the
data), delete the property, etc.

>
>> +    def __init__(self, node, offset, fdt=None):
>> +        self._node = node
>> +        self._offset = offset
>> +        self._fdt = node._fdt if node else fdt
>> +
>> +    @classmethod
>> +    def from_offset(cls, fdt, prop_offset):
>> +        prop = cls(None, prop_offset, fdt)
>> +        prop._get_name_data()
>> +        return prop
>> +
>> +    def next(self):
>> +        return Prop(self._node, check_err(fdt_next_property_offset(
>> +                self._fdt._fdt, self._offset)))
>> +
>> +    def next_quiet(self):
>> +        val = check_err(fdt_next_property_offset(self._fdt._fdt, self._offset),
>> +                        True)
>> +        if val < 0:
>> +            return None
>> +        return Prop(self._node, val)
>> +
>> +    def _get_name_data(self):
>> +        pdata = fdt_get_property_by_offset(self._fdt._fdt, self._offset)
>> +        if not isinstance(pdata, list):
>> +            raise FdtException(pdata)
>> +        return self._fdt.string(pdata[0].nameoff), data(pdata[0])
>> +
>> +    def name(self):
>> +        return self._get_name_data()[0]
>> +
>> +    def data(self):
>> +        return self._get_name_data()[1]
>> +
>> +    def delete(self):
>> +        if not self._node:
>> +            raise RuntimeError("Can't delete property offset %d of unknown node"
>> +                               % self._offset)
>> +        self._fdt.delprop(self._node._offset, self.name())
>> +%}

[..]

>> +
>> +/*
>> + * From here are the function definitions from libfdt.h, along with their
>> + * exception-handling code.
>> + */
>
> Uh.. why do you need to duplicate these rather than including libfdt.h?

Hopefully I can do that, even with fdt_totalsize(). Will check.

>
>> +int fdt_path_offset(const void *fdt, const char *path);
>> +
>> +int fdt_first_property_offset(const void *fdt, int nodeoffset);
>> +
>> +int fdt_next_property_offset(const void *fdt, int offset);
>> +
>> +const char *fdt_get_name(const void *fdt, int nodeoffset, int *OUTPUT);
>> +
>> +/* no exception handling, since this function has no error checking */
>> +const char *fdt_string(const void *fdt, int stroffset);
>> +
>> +const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
>> +                                                      int offset, int *OUTPUT);
>> +
>> +/* no exception handling, this this function always returns a valid string */
>> +const char *fdt_strerror(int errval);
>> +
>> +int fdt_first_subnode(const void *fdt, int offset);
>> +
>> +int fdt_next_subnode(const void *fdt, int offset);
>> +
>> +int fdt_delprop(void *fdt, int nodeoffset, const char *name);
>> +
>> +int fdt_pack(void *fdt);
>> +
>> +int fdt_totalsize(const void *fdt);
>> +
>> +int fdt_off_dt_struct(const void *fdt);
>> diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
>> new file mode 100644
>> index 0000000..8f8618e
>> --- /dev/null
>> +++ b/pylibfdt/setup.py
>> @@ -0,0 +1,34 @@
>> +#!/usr/bin/env python
>> +
>> +"""
>> +setup.py file for SWIG libfdt
>> +"""
>> +
>> +from distutils.core import setup, Extension
>> +import os
>> +import sys
>> +
>> +progname = sys.argv[0]
>> +cflags = sys.argv[1]
>> +files = sys.argv[2:]
>> +
>> +if cflags:
>> +    cflags = [flag for flag in cflags.split(' ') if flag]
>> +else:
>> +    cflags = None
>> +
>> +libfdt_module = Extension(
>> +    '_libfdt',
>> +    sources = files,
>> +    extra_compile_args =  cflags
>> +)
>> +
>> +sys.argv = [progname, '--quiet', 'build_ext', '--inplace']
>> +
>> +setup (name = 'libfdt',
>> +       version = '0.1',
>> +       author      = "SWIG Docs",
>
> Um.. that doesn't seem quite right.

Nope, will fix.

>
>> +       description = """Simple swig libfdt from docs""",
>> +       ext_modules = [libfdt_module],
>> +       py_modules = ["libfdt"],
>> +       )
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson

Regards,
Simon
