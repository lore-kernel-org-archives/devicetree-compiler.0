From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 1/5] Add an initial Python library for libfdt
Date: Fri, 10 Feb 2017 11:39:21 -0700
Message-ID: <CAPnjgZ31rZqoYTg4m=3yAFuT2UuL9i4qc4+w-G34Aq75sdfrfA@mail.gmail.com>
References: <20170205201323.15411-1-sjg@chromium.org> <20170205201323.15411-2-sjg@chromium.org>
 <20170210043709.GB25381@umbus>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=2Hzu7yIilF0m5f+oBlvrFO43ExsWIAPbEsZ5D5fR/Q0=;
        b=TS7CJAPkBBi1aBmGbqxTTE2MRhYfjiYl4/12YwQejcJJvUVXr25LjlGBXoMU7Z1K5i
         JaRrBvIbG7xbj6tdYiZvmdUsWOnxK8/EF4rf5UuT3i184boI01LE7mM8Jr1OmB1a4ec0
         EyeROmdxY3dt73Q1NGyb+vLS+Nvf4k/iF3AiDZImGaIs+OqcC76CpHKQC6mSq1iLcWcr
         R1XHjh19NMmJa/X2Yl6FzzPL4fQNxTCYLEOcYFPC1OQkGCMVKrMNpvyPLpIGgyXVUYGM
         eviJxpSh5SLsUsqN1zzcPlEeLZJQkg7zOWDrEoEgHxdGL/DoARha6z7bQqj0WKvI44Ju
         NfOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=2Hzu7yIilF0m5f+oBlvrFO43ExsWIAPbEsZ5D5fR/Q0=;
        b=AqysSp/RY+zkU1IvK4VF2248S/oZdIpZeg/Nt2mICNdodWlcUbpSLaa/gJJxdn0W3Y
         gAq4AY4ogM4Qm8J85GCqgXqTQnlNNXC82rhI3/hZFd/IwlRORdcaSfuu9Kk79gg1AqRD
         a6/SKgYA63WcDEHEiJuGR/akrNlYSnKrkayFE=
In-Reply-To: <20170210043709.GB25381@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 9 February 2017 at 21:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sun, Feb 05, 2017 at 01:13:19PM -0700, Simon Glass wrote:
>> Add Python bindings for a bare-bones set of libfdt functions. These allow
>> navigating the tree and reading node names and properties.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
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
>>  pylibfdt/.gitignore        |   3 +
>>  pylibfdt/Makefile.pylibfdt |  18 ++
>>  pylibfdt/libfdt.swig       | 565 +++++++++++++++++++++++++++++++++++++++++++++
>>  pylibfdt/setup.py          |  34 +++
>>  4 files changed, 620 insertions(+)
>>  create mode 100644 pylibfdt/.gitignore
>>  create mode 100644 pylibfdt/Makefile.pylibfdt
>>  create mode 100644 pylibfdt/libfdt.swig
>>  create mode 100644 pylibfdt/setup.py
>>
[..]

>> +def data(prop):
>> +    """Extract the data from a property
>> +
>> +    This is an internal function only.
>> +
>> +    Args:
>> +        prop: Property structure, as returned by get_property_by_offset()
>> +
>> +    Returns:
>> +        The property data as a bytearray
>> +    """
>> +    buf = bytearray(fdt32_to_cpu(prop.len))
>> +    pylibfdt_copy_data(buf, prop)
>> +    return buf
>
> AFAICT this data() function (and the C functions it uses) aren't
> actually used any more.  I think you can remove them.

It is used in tests, and needs to be used to process the return value
from fdt_get_property_by_offset(). You ask later what we need from
that function other than the property contents. We need the property
name.

So we could create a Prop class (again) with the name and data in it,
and have get_property_by_offset return it. Of course this means that
scanning the tree requires allocating space for the property contents
all over again, when you use it or not, but this is Python.

>
>> +
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
>> +        FdtException if val < 0
>> +    """
>> +    if val < 0:
>> +        if not quiet or val != -NOTFOUND:
>
> I don't really like hardcoding the specialness of NOTFOUND here -
> depending on the call, there could be different error codes which are
> relatively harmless.
>
> Instead of a quiet boolean, you could pass in a set (list, sequence,
> whatever) of error codes to be considered quiet.

OK I can do that, except that later you suggest that the whole idea is
wrong. See below.

>
>> +            raise FdtException(val)
>> +    return val
>> +
>> +def check_err_null(val, quiet=False):
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
>> +        val if val is a list, None if not
>> +
>> +    Raises
>> +        FdtException if quiet is False and val indicates an error was
>> +           reported. If quiet if True then an FdtException is raised only if
>> +           the error is something other than -NOTFOUND.
>> +    """
>> +    # Normally a tuple is returned which contains the data and its length.
>> +    # If we get just an integer error code, it means the function failed.
>> +    if not isinstance(val, list):
>> +        if not quiet or val != -NOTFOUND:
>> +            raise FdtException(val)
>> +        return None,
>> +    return val
>> +
>> +class Fdt:
>> +    """Device tree class, supporting all operations
>> +
>> +    The Fdt object is created is created from a device tree binary file,
>> +    e.g. with something like:
>> +
>> +       fdt = Fdt(open("filename.dtb").read())
>
> I noticed when playing with this that doing Fdt("filename.dtb") will
> appear to succeed, but then (of course) fail with BADMAGIC as soon as
> you do anything.  Might be an idea to at least do a magic number check
> in the constructor.

OK I'll add that.

>
>> +
>> +    Operations can then be performed using the methods in this class. Each
>> +    method xxx(args...) corresponds to a libfdt function fdt_xxx(fdt, args...).
>> +
>> +    Almost all methods raise an FdtException if an error occurs. The
>> +    following does not:
>> +
>> +        string() - since it has no error checking
>> +
>> +    To avoid this behaviour a 'quiet' version is provided for some functions.
>> +    This behaves as for the normal version except that it will not raise
>> +    an exception in the case of an FDT_ERR_NOTFOUND error: it will simply
>> +    return the -NOTFOUND error code or None.
>> +    """
>> +    def __init__(self, data):
>> +        self._fdt = bytearray(data)
>> +
>> +    def string(self, offset):
>> +        """Get a string given its offset
>> +
>> +        This is an internal function.
>> +
>> +        Args:
>> +            offset: FDT offset in big-endian format
>> +
>> +        Returns:
>> +            string value at that offset
>> +        """
>> +        return fdt_string(self._fdt, fdt32_to_cpu(offset))
>> +
>> +    def path_offset(self, path):
>> +        """Get the offset for a given path
>> +
>> +        Args:
>> +            path: Path to the required node, e.g. '/node@3/subnode@1'
>> +
>> +        Returns:
>> +            Node offset
>> +
>> +        Raises
>> +            FdtException if the path is not valid
>> +        """
>> +        return check_err(fdt_path_offset(self._fdt, path))
>> +
>> +    def path_offset_quiet(self, path):
>> +        """Get the offset for a given path
>> +
>> +        Args:
>> +            path: Path to the required node, e.g. '/node@3/subnode@1'
>> +
>> +        Returns:
>> +            Node offset, or -NOTFOUND if the path is not value
>> +
>> +        Raises
>> +            FdtException if any error occurs other than NOTFOUND
>> +        """
>> +        return check_err(fdt_path_offset(self._fdt, path), True)
>
> Ugh.  I don't much like the idea of making quiet versions of a bunch
> of entry points.  I think we need to pick one:
>     a) Just return error codes (not very Pythonic, but you can't have
>        everything)
>     b) Always raise exceptions, and the user has to try: except: to
>        quiet then (creating different error classes for the different
>        codes could make this easier).

I don't like it either, but on the other hand, you did ask for exceptions.

I'm happy to go back to a) if that suits you.

Re b) this is really ugly IMO. Exceptions shouldn't be used in normal
program flow - e.g. they can appear in logs and cause confusion. Also
the syntax is not great.

The reason for the 'quiet' function is that it handles 99% of the
cases where you get an error return from a libfdt function. Also it
means that you don't have to check return values most of the time, but
still catch 'bad' things like out of space, bad offset, etc. without
blundering onwards.

As I say I don't like having 'quiet' versions of the functions. There
is one other option I can think of, which is to add an additional
argument to each function like this:

   def path_offset(self, path, quiet=False):

Then you can add 'quiet=True' to avoid the exception. Then you use the
same function name, and most of the time you get exceptions when there
are problems, but it's easy to avoid when you know there is a chance
an error will be returned.

If we go that way, then you are probably going to ask what is so
special about -NOTFOUND.

So we could make quiet a list (or perhaps Set) of exceptions, like this:

def path_offset(self, path, quiet=None)   # or perhaps quiet=[]

and have callers do:

fdt.path_offset("/", quiet=[NOTFOUND])

and I suppose we could define a constant for [NOTFOUND] also.

That might be better all round?

>
>> +    def first_property_offset(self, nodeoffset):
>> +        """Get the offset of the first property in a node offset
>> +
>> +        Args:
>> +            nodeoffset: Offset to the node to check
>> +
>> +        Returns:
>> +            Offset of the first property
>> +
>> +        Raises
>> +            FdtException if the associated node has no properties, or some
>> +                other error occurred
>> +        """
>> +        return check_err(fdt_first_property_offset(self._fdt, nodeoffset))
>> +
>> +    def first_property_offset_quiet(self, nodeoffset):
>> +        """Get the offset of the first property in a node offset
>> +
>> +        Args:
>> +            nodeoffset: Offset to the node to check
>> +
>> +        Returns:
>> +            Offset of the first property, or -NOTFOUND if the node has no
>> +                properties
>> +
>> +        Raises
>> +            FdtException if any other error occurs
>> +        """
>> +        return check_err(fdt_first_property_offset(self._fdt, nodeoffset), True)
>> +
>> +    def next_property_offset(self, prop_offset):
>> +        """Get the next property in a node
>> +
>> +        Args:
>> +            prop_offset: Offset of the previous property
>> +
>> +        Returns:
>> +            Offset of the next property
>> +
>> +        Raises:
>> +            FdtException if the associated node has no more properties, or
>> +                some other error occurred
>> +        """
>> +        return check_err(fdt_next_property_offset(self._fdt, prop_offset))
>> +
>> +    def next_property_offset_quiet(self, prop_offset):
>> +        """Get the next property in a node
>> +
>> +        Args:
>> +            prop_offset: Offset of the previous property
>> +
>> +        Returns:
>> +            Offset ot the next property, or -NOTFOUND if there are no more
>> +            properties
>> +
>> +        Raises:
>> +            FdtException if any other error occurs
>> +        """
>> +        return check_err(fdt_next_property_offset(self._fdt, prop_offset), True)
>> +
>> +    def get_name(self, nodeoffset):
>> +        """Get the name of a node
>> +
>> +        Args:
>> +            nodeoffset: Offset of node to check
>> +
>> +        Returns:
>> +            Node name
>> +
>> +        Raises:
>> +            FdtException on error (e.g. nodeoffset is invalid)
>> +        """
>> +        return check_err_null(fdt_get_name(self._fdt, nodeoffset))[0]
>> +
>> +    def get_property_by_offset(self, prop_offset):
>> +        """Obtains a property that can be examined
>> +
>> +        TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Consider returning a property object instead,
>> +        with the data extracted from the Fdt.
>
> AFAICT you're already copying the property value out of the fdt as a
> bytestring / bytearray.  I don't see what a property object would
> encode apart from that bytestring.

The property name.

[...]

>> +    def getprop_quiet(self, nodeoffset, prop_name):
>> +        """Get a property from a node
>> +
>> +        Args:
>> +            nodeoffset: Node offset containing property to get
>> +            prop_name: Name of property to get
>> +
>> +        Returns:
>> +            Value of property as a string, or None if not found
>> +
>> +        Raises:
>> +            FdtError if an error occurs (e.g. nodeoffset is invalid)
>> +        """
>> +        return check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_name),
>> +                              True)[0]
>
>
> There are a bunch of missing things here.  e.g. fdt_subnode_offset(),
> off_dt_strings(), fdt_parent_offset(), ...

Yes, I've only made a start. I don't want to implement the entire
thing right away! I want to get something basic agreed and accepted.
Then we can build on it. Refactoring everything as we iterate towards
a good binding takes time, and the functions I have chosen are fairly
representative of common uses.

[..]

Regards,
Simon
