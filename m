From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/4] Add an initial Python library for libfdt
Date: Mon, 6 Feb 2017 01:22:02 -0800
Message-ID: <CAPnjgZ15ARZ0-Kc7ZYDmmrV+f7PXSSLRzpoBib4aJqxDUBgb_w@mail.gmail.com>
References: <1480812490-11926-1-git-send-email-sjg@chromium.org>
 <1480812490-11926-2-git-send-email-sjg@chromium.org> <20161205043522.GE32366@umbus.fritz.box>
 <CAPnjgZ3NExZtPYHoPc-3S2D1cBizegziiCGgjRGtextvMXYmyw@mail.gmail.com> <20170112040950.GM14026@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=+Cn6KtCTmi9c4SW+h+4vVNBrqRYQC+PBGrDqBo7vZRc=;
        b=lrNI8YauBYI/o+U31gEo9OjjmxIj2OldKqrJdo+3A5alZ1o3Q0ef+W0RY32AOr6gc3
         keGa9PLEKe1N4uyykBpvh5dobKUhUFqjvHAB654R75QwiF/+B2B+XYzVjcodSNBZn7f+
         qhXKJZyFUWxvry+/Rqp8LYb1YOPUlhdIQE4noltFd139PcI/KH1GaAosw3MvXReTK49Z
         y4BKvaSY0l/VrIx0Yvx+KjLNs7M7ibRtrUYHnwoAX6xKpdXCzfWfbaMHpP9DKTkLCeWQ
         3pBlDrCedsOlKRb5XbjSwkYcSZ/T4G/ECWTHrZPoqo2mDtZbpUhKZvCzoZYybvEXoRvD
         rzCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=+Cn6KtCTmi9c4SW+h+4vVNBrqRYQC+PBGrDqBo7vZRc=;
        b=Zpk3fXI8QdqtMdT2dflYBFQmZgLcbO7A/cnmMc7k7H07h5QqanvUOSdXZyrJOKsvLj
         gptjZYrYK9LYfp4orZuWmRnhOndaQJ/uWrcxFEx1TNhpcKbzwIXNh3e9h3uhtYwWUkvl
         6FzLf0EKOKloF6esdZ1FImGbFlYxUvLer2axE=
In-Reply-To: <20170112040950.GM14026-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On Wednesday, 11 January 2017, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Sun, Dec 04, 2016 at 11:23:32PM -0700, Simon Glass wrote:
> > Hi David,
>
> Sorry for the slow reply.  I was away for a while, and then it just
> fell off my radar.

OK thanks. Have been on holiday for quite a while. This reply gave me
enough into to do v4.
>
> > On 4 December 2016 at 21:35, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > On Sat, Dec 03, 2016 at 05:48:07PM -0700, Simon Glass wrote:
> > >> Add Python bindings for a bare-bones set of libfdt functions. These allow
> > >> navigating the tree and reading node names and properties.
> > >>
> > >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > >> ---
> > >>
> > >> Changes in v3:
> > >> - Make the library more pythonic
> > >> - Add classes for Node and Prop along with methods
> > >> - Add an exception class
> > >> - Use Python to generate exeptions instead of SWIG
> > >>
> > >> Changes in v2:
> > >> - Add exceptions when functions return an error
> > >> - Correct Python naming to following PEP8
> > >> - Use a class to encapsulate the various methods
> > >> - Include fdt.h instead of redefining struct fdt_property
> > >> - Use bytearray to avoid the SWIG warning 454
> > >> - Add comments
> > >>
> > >>  pylibfdt/.gitignore        |   3 +
> > >>  pylibfdt/Makefile.pylibfdt |  18 ++
> > >>  pylibfdt/libfdt.swig       | 602 +++++++++++++++++++++++++++++++++++++++++++++
> > >>  pylibfdt/setup.py          |  34 +++
> > >>  4 files changed, 657 insertions(+)
> > >>  create mode 100644 pylibfdt/.gitignore
> > >>  create mode 100644 pylibfdt/Makefile.pylibfdt
> > >>  create mode 100644 pylibfdt/libfdt.swig
> > >>  create mode 100644 pylibfdt/setup.py
> > >>
> > [..]
> >
> > >> +# Error codes, corresponding to FDT_ERR_... in libfdt.h
> > >> +(NOTFOUND,
> > >> +        EXISTS,
> > >> +        NOSPACE,
> > >> +        BADOFFSET,
> > >> +        BADPATH,
> > >> +        BADPHANDLE,
> > >> +        BADSTATE,
> > >> +        TRUNCATED,
> > >> +        BADMAGIC,
> > >> +        BADVERSION,
> > >> +        BADSTRUCTURE,
> > >> +        BADLAYOUT,
> > >> +        INTERNAL,
> > >> +        BADNCELLS,
> > >> +        BADVALUE,
> > >> +        BADOVERLAY) = range(1, 17)
> > >
> > > Pity we can't get swig to autogenerate those.
> >
> > Maybe we can if you want it to change to an enum?
>
> Right.  Hmm, might be worth doing; I don't see any immediate reason
> we'd need these constants at the cpp level.

OK, will take a look (in v5).

>
> > >> +class FdtException(Exception):
> > >> +    """An exception caused by an error such as one of the codes above"""
> > >> +    def __init__(self, err):
> > >> +        self.err = err
> > >> +
> > >> +    def __str__(self):
> > >> +        return 'pylibfdt error %d: %s' % (self.err, fdt_strerror(self.err))
> > >> +
> > >> +def fdt32_to_cpu(val):
> > >> +    """Convert a device-tree cell value into a native integer"""
> > >> +    return struct.unpack("=I", struct.pack(">I", val))[0]
> > >> +
> > >> +def data(prop):
> > >> +    """Extract the data from a property
> > >> +
> > >> +    Args:
> > >> +        prop: Property structure, as returned by get_property_by_offset()
> > >> +
> > >> +    Returns:
> > >> +        The property data as a bytearray
> > >> +    """
> > >> +    buf = bytearray(fdt32_to_cpu(prop.len))
> > >
> > > prop.len should be a native value, not requiring byteswap.
> > >
> > >> +    pylibfdt_copy_data(buf, prop)
> > >> +    return buf
> > >
> > > Urgh.. all this fdt_property() wrangling stuff is really ugly.  Any
> > > chance we could just exclude it from the wrapper, providing only
> > > fdt_getprop() interfaces which simply return a Python bytestring
> > > directly?
> >
> > I effectively have, by hiding it in here. Client code need never use this.
>
> I don't see that that's the case.  At the very least they get this
> prop object back from some functions and have to explicitly call
> data() to get the actual value out.
>
> I wonder if the problem here is that you're trying to write a faithful
> wrapper for fdt_get_property().  I don't know that there's any point -
> it's really intended for some internal usage and for performance in
> some special cases that make sense in C.  For the Python wrapper I
> think you could just leave it out and provide only fdt_getprop() -
> that returns the property value directly rather than a complicated to
> encode structure.

But what about fdt_get_property_by_offset() which needs both the
property name and its value? For v4, I've left this as is.

[...]

> > >> +    def string(self, offset):
> > >> +        """Get a string given its offset
> > >> +
> > >> +        Args:
> > >> +            offset: FDT offset in big-endian format
> > >> +
> > >> +        Returns:
> > >> +            string value at that offset
> > >> +        """
> > >> +        return fdt_string(self._fdt, fdt32_to_cpu(offset))
> > >
> > > ARGH, no.  The offset argument is an integer, it should be treated as
> > > a native integer, and the byteswap should absolutely not be here.
> >
> > Ah yes, oops.

I didn't change this as it is only used in tests. I think in fact it
might go away if we have a Prop object, so will look in v5 once I have
your thoughts on that.

[...]

>
> > >> +    def get_property_quiet(self, nodeoffset, name):
> > >> +        """Get a property given a node offset and the property name
> > >> +
> > >> +        We cannot use fdt_get_property() here since it does not return the
> > >> +        offset. We prefer to create Node objects using the offset.
> > >> +
> > >> +        Args:
> > >> +            nodeoffset: Offset of the node
> > >> +            name: Property name
> > >> +
> > >> +        Returns:
> > >> +            Prop object found or None if there is no such property
> > >> +
> > >> +        Raises:
> > >> +            FdtException on error
> > >> +        """
> > >> +        poffset = self.first_property_offset_quiet(nodeoffset)
> > >> +        while poffset >= 0:
> > >> +            pdata = self.get_property_by_offset_internal(poffset)
> > >> +            if self.string(pdata.nameoff) == name:
> > >> +                return Prop(Node(self, nodeoffset), poffset)
> > >> +            poffset = self.next_property_offset_quiet(poffset)
> > >> +        return None
> > >> +
> > >> +    def first_subnode(self, nodeoffset):
> > >> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset))
> > >> +
> > >> +    def first_subnode_quiet(self, nodeoffset):
> > >> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset), True)
> > >> +
> > >> +    def next_subnode(self, nodeoffset):
> > >> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset))
> > >> +
> > >> +    def next_subnode_quiet(self, nodeoffset):
> > >> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset), True)
> > >> +
> > >> +    def totalsize(self):
> > >> +        return check_err(fdt_totalsize(self._fdt))
> > >> +
> > >> +    def off_dt_struct(self):
> > >> +        return check_err(fdt_off_dt_struct(self._fdt))
> > >> +
> > >> +    def pack(self):
> > >> +        return check_err(fdt_pack(self._fdt))
> > >> +
> > >> +    def delprop(self, nodeoffset, prop_name):
> > >> +        return check_err(fdt_delprop(self._fdt, nodeoffset, prop_name))
> > >> +
> > >> +
> > >> +class Node:
> > >
> > > This can't work.  The reason that so many libfdt functions are
> > > insistently called whatever_offset(), rather than just get_whatever()
> > > is to constantly remind the user that this is a actual byte offset
> > > into a buffer of data.  It's *not* a friendly stable node-handle, and
> > > can become invalid when the fdt blob is altered.
> > >
> > > Attempting to put a class wrapper around it obscures that vital fact.
> > > Treat node offsets as offsets everywhere, just encoded as plain old
> > > python integers.
> >
> > My intent is to make the interface more pythonic, and I've been trying
> > out various approaches. For read-only use this interface is nice.
> > Consider this the high-water mark of this approach.
>
> Ok.  So making the interface Pythonic is a reasonable goal - but not
> when it obscures fundamental properties of behaviour.  It's simply not
> possible to have a "stable" node (or property) handle with libfdt, so
> we shouldn't make the Python interface appear to have one.
>
> > But I can go back to something in between, where there is no Node or
> > Prop. But please do check the code example in the cover letter and see
> > if you are sure.
>
> I am absoltely sure.  Node and Property objects are a bad idea.
> Well.. Node objects definitely are.  Property objects could work, but
> only if they're essentially just representing a (name, length, value)
> tuple, *not* an offset into the actual tree.  i.e. such a property
> object would be a copy of some data from the tree, not a handle to
> something still within the tree.
>
> > With this approach we can do things like node.next() which is nice I think.
>
> Nice until you have a use case which breaks it, at which point it
> becomes horribly confusing.
>
> > Of course things can break if you start changing the tree while
> > keeping objects around. So it isn't a perfect illusion. Hopefully it
> > returns errors in that case..
>
> It's not really possible to safely return errors in this case.
> Usually you will get an error because your offset will point at
> something bogus.  But it doesn't require that much bad luck for the
> old offset to line up with something that's no longer the same thing
> but looks vaguely sane, at which point you'll return valid looking but
> wrong data.  You might hit an error condition later, or maybe you'll
> just carry that bad data into the rest of your program.
>
> With a bit more bad luck you could even end up with an infinite loop.
>
> No, sorry, the illusion is sufficiently incomplete as to be more
> dangerous than useful.

OK, I dropped this in v4. Thanks for taking the time to go through
this in detail.

>
> > [..]
> >
> > >> +class Prop:
> > >> +    """A device-tree property
> > >> +
> > >> +    This encapsulates a device-tree property and provides various operations
> > >> +    which can be performed on the property.
> > >> +
> > >> +    Generally the standard constructor is used to create a Prop object. But
> > >> +    in the case where only the property offset is known (and not the Node
> > >> +    that holds the property), from_offset() can be used.
> > >> +    """
> > >
> > > TBH, I'm not really sold on the value of this class either.  Is there
> > > really any point dealing with these rather fragile property handles,
> > > rather than simply returning bytestrings with the values directly?  I
> > > can't see it.
> >
> > It provides the ability to iterate, get the name (as well as the
> > data), delete the property, etc.
>
> Name is only relevant when iterating (otherwise you already knew the
> name in order to get the property).  For iteration we could add an
> interface to return a (name, value) tuple easily enough.  For
> iteration itself I think we want something closer to the raw library
> iterators - something working explicitly in terms of property offsets.
>
> And I think we should only use those special considerations when doing
> iteration.  For the common case of retrieving a property with a known
> name, we should just have a simple wrapper on fdt_getprop() returning
> a value directly, not messing around with objects and structures.

OK I've done this in v4.

[...]

> > >> +
> > >> +/*
> > >> + * From here are the function definitions from libfdt.h, along with their
> > >> + * exception-handling code.
> > >> + */
> > >
> > > Uh.. why do you need to duplicate these rather than including libfdt.h?
> >
> > Hopefully I can do that, even with fdt_totalsize(). Will check.

Unfortunately I don't think I can, as they are #define macros.

[...]

> > >> diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> > >> new file mode 100644
> > >> index 0000000..8f8618e
> > >> --- /dev/null
> > >> +++ b/pylibfdt/setup.py
> > >> @@ -0,0 +1,34 @@
> > >> +#!/usr/bin/env python
> > >> +
> > >> +"""
> > >> +setup.py file for SWIG libfdt
> > >> +"""
> > >> +
> > >> +from distutils.core import setup, Extension
> > >> +import os
> > >> +import sys
> > >> +
> > >> +progname = sys.argv[0]
> > >> +cflags = sys.argv[1]
> > >> +files = sys.argv[2:]
> > >> +
> > >> +if cflags:
> > >> +    cflags = [flag for flag in cflags.split(' ') if flag]
> > >> +else:
> > >> +    cflags = None
> > >> +
> > >> +libfdt_module = Extension(
> > >> +    '_libfdt',
> > >> +    sources = files,
> > >> +    extra_compile_args =  cflags
> > >> +)
> > >> +
> > >> +sys.argv = [progname, '--quiet', 'build_ext', '--inplace']
> > >> +
> > >> +setup (name = 'libfdt',
> > >> +       version = '0.1',
> > >> +       author      = "SWIG Docs",
> > >
> > > Um.. that doesn't seem quite right.
> >
> > Nope, will fix.

(in v5, as I forgot this time)

Regards,
Simon
