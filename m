From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/4] Add an initial Python library for libfdt
Date: Thu, 12 Jan 2017 15:09:50 +1100
Message-ID: <20170112040950.GM14026@umbus.fritz.box>
References: <1480812490-11926-1-git-send-email-sjg@chromium.org>
 <1480812490-11926-2-git-send-email-sjg@chromium.org>
 <20161205043522.GE32366@umbus.fritz.box>
 <CAPnjgZ3NExZtPYHoPc-3S2D1cBizegziiCGgjRGtextvMXYmyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bZ2MuwyI/0uB8yuJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1484194198;
        bh=WR3IBqNnzhqQvD0GIfxn5kSD6vy0Sykbb+1fYOuVgL8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ta4UYEwWIkyOlbiWEh2/Ts2OotZI2n58iRg/Cvmoqd+8Ry164TlfvW/1FmNynnK3G
         MpKBCJCe8ejo4M+0dhpj+V/MjVlRumKSnSVrCejpHPfu3sOfR63W/T24qr5YKMbVXg
         OhF8N/lbMpie+E2c9ijJjVHerhsTlhF92JrVO2Vg=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3NExZtPYHoPc-3S2D1cBizegziiCGgjRGtextvMXYmyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--bZ2MuwyI/0uB8yuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 04, 2016 at 11:23:32PM -0700, Simon Glass wrote:
> Hi David,

Sorry for the slow reply.  I was away for a while, and then it just
fell off my radar.

> On 4 December 2016 at 21:35, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> > On Sat, Dec 03, 2016 at 05:48:07PM -0700, Simon Glass wrote:
> >> Add Python bindings for a bare-bones set of libfdt functions. These al=
low
> >> navigating the tree and reading node names and properties.
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> ---
> >>
> >> Changes in v3:
> >> - Make the library more pythonic
> >> - Add classes for Node and Prop along with methods
> >> - Add an exception class
> >> - Use Python to generate exeptions instead of SWIG
> >>
> >> Changes in v2:
> >> - Add exceptions when functions return an error
> >> - Correct Python naming to following PEP8
> >> - Use a class to encapsulate the various methods
> >> - Include fdt.h instead of redefining struct fdt_property
> >> - Use bytearray to avoid the SWIG warning 454
> >> - Add comments
> >>
> >>  pylibfdt/.gitignore        |   3 +
> >>  pylibfdt/Makefile.pylibfdt |  18 ++
> >>  pylibfdt/libfdt.swig       | 602 ++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  pylibfdt/setup.py          |  34 +++
> >>  4 files changed, 657 insertions(+)
> >>  create mode 100644 pylibfdt/.gitignore
> >>  create mode 100644 pylibfdt/Makefile.pylibfdt
> >>  create mode 100644 pylibfdt/libfdt.swig
> >>  create mode 100644 pylibfdt/setup.py
> >>
> [..]
>=20
> >> +# Error codes, corresponding to FDT_ERR_... in libfdt.h
> >> +(NOTFOUND,
> >> +        EXISTS,
> >> +        NOSPACE,
> >> +        BADOFFSET,
> >> +        BADPATH,
> >> +        BADPHANDLE,
> >> +        BADSTATE,
> >> +        TRUNCATED,
> >> +        BADMAGIC,
> >> +        BADVERSION,
> >> +        BADSTRUCTURE,
> >> +        BADLAYOUT,
> >> +        INTERNAL,
> >> +        BADNCELLS,
> >> +        BADVALUE,
> >> +        BADOVERLAY) =3D range(1, 17)
> >
> > Pity we can't get swig to autogenerate those.
>=20
> Maybe we can if you want it to change to an enum?

Right.  Hmm, might be worth doing; I don't see any immediate reason
we'd need these constants at the cpp level.

> >> +class FdtException(Exception):
> >> +    """An exception caused by an error such as one of the codes above=
"""
> >> +    def __init__(self, err):
> >> +        self.err =3D err
> >> +
> >> +    def __str__(self):
> >> +        return 'pylibfdt error %d: %s' % (self.err, fdt_strerror(self=
=2Eerr))
> >> +
> >> +def fdt32_to_cpu(val):
> >> +    """Convert a device-tree cell value into a native integer"""
> >> +    return struct.unpack("=3DI", struct.pack(">I", val))[0]
> >> +
> >> +def data(prop):
> >> +    """Extract the data from a property
> >> +
> >> +    Args:
> >> +        prop: Property structure, as returned by get_property_by_offs=
et()
> >> +
> >> +    Returns:
> >> +        The property data as a bytearray
> >> +    """
> >> +    buf =3D bytearray(fdt32_to_cpu(prop.len))
> >
> > prop.len should be a native value, not requiring byteswap.
> >
> >> +    pylibfdt_copy_data(buf, prop)
> >> +    return buf
> >
> > Urgh.. all this fdt_property() wrangling stuff is really ugly.  Any
> > chance we could just exclude it from the wrapper, providing only
> > fdt_getprop() interfaces which simply return a Python bytestring
> > directly?
>=20
> I effectively have, by hiding it in here. Client code need never use this.

I don't see that that's the case.  At the very least they get this
prop object back from some functions and have to explicitly call
data() to get the actual value out.

I wonder if the problem here is that you're trying to write a faithful
wrapper for fdt_get_property().  I don't know that there's any point -
it's really intended for some internal usage and for performance in
some special cases that make sense in C.  For the Python wrapper I
think you could just leave it out and provide only fdt_getprop() -
that returns the property value directly rather than a complicated to
encode structure.

> >> +def strerror(fdt_err):
> >> +    """Get the string for an error number
> >> +
> >> +    Args:
> >> +        fdt_err: Error number (-ve)
> >> +
> >> +    Returns:
> >> +        String containing the associated error
> >> +    """
> >> +    return fdt_strerror(fdt_err)
> >> +
> >> +def check_err(val, quiet=3DFalse):
> >> +    """Raise an error if the return value is -ve
> >> +
> >> +    This is used to check for errors returned by libfdt C functions.
> >> +
> >> +    Args:
> >> +        val: Return value from a libfdt function
> >> +        quiet: True to ignore the NOTFOUND error, False to raise on a=
ll errors
> >> +
> >> +    Returns:
> >> +        val if val >=3D 0
> >> +
> >> +    Raises
> >> +        FdtException if val is < 0
> >> +    """
> >> +    if val < 0:
> >> +        if not quiet or val !=3D -NOTFOUND:
> >> +            raise FdtException(val)
> >> +    return val
> >> +
> >> +def check_err_null(val):
> >> +    """Raise an error if the return value is NULL
> >> +
> >> +    This is used to check for a NULL return value from certain libfdt=
 C
> >> +    functions
> >> +
> >> +    Args:
> >> +        val: Return value from a libfdt function
> >> +        quiet: True to ignore the NOTFOUND error, False to raise on a=
ll errors
> >> +
> >> +    Returns:
> >> +        val if val is not NULL
> >> +
> >> +    Raises
> >> +        FdtException if val is NULL
> >> +    """
> >> +    # Normally a tuple is returned which contains the data and its le=
ngth.
> >
> > Yeah.. since Python strings / bytestrings know their own length, why
> > do we need such a tuple?
>=20
> It's just what swig returns for functions like: const char *func(int *len)
>=20
> This is internal to the class so should not matter to users.

Hm, ok.

> >> +    # If we get just an integer error code, it means the function fai=
led.
> >> +    if not isinstance(val, list):
> >> +        raise FdtException(val)
> >> +    return val
> >> +
> >> +class Fdt:
> >> +    """Device tree class, supporting all operations
> >> +
> >> +    The Fdt object is created is created from a device tree binary fi=
le,
> >> +    e.g. with something like:
> >> +
> >> +       fdt =3D Fdt(open("filename.dtb").read())
> >> +
> >> +    Operations can then be performed using the methods in this class.=
 Each
> >> +    method xxx(args...) corresponds to a libfdt function fdt_xxx(fdt,=
 args...).
> >> +
> >> +    Almost all methods raise a FdtException if an error occurs. The
> >> +    following does not:
> >> +
> >> +        string() - since it has no error checking
> >> +
> >> +    To avoid this behaviour a 'quiet' version is provided for some fu=
nctions.
> >> +    This behaves as for the normal version except that it will not ra=
ise
> >> +    an exception in the case of an FDT_ERR_NOTFOUND error: it will si=
mply
> >> +    return the -NOTFOUND error code or None.
> >> +
> >> +    Separate classes are provided for nodes (Node) and properties (Pr=
op).
> >> +    """
> >> +    def __init__(self, data):
> >> +        self._fdt =3D bytearray(data)
> >> +
> >> +    def string(self, offset):
> >> +        """Get a string given its offset
> >> +
> >> +        Args:
> >> +            offset: FDT offset in big-endian format
> >> +
> >> +        Returns:
> >> +            string value at that offset
> >> +        """
> >> +        return fdt_string(self._fdt, fdt32_to_cpu(offset))
> >
> > ARGH, no.  The offset argument is an integer, it should be treated as
> > a native integer, and the byteswap should absolutely not be here.
>=20
> Ah yes, oops.
>=20
> >
> >> +    def path(self, path):
> >> +        """Get the Node for a given path
> >> +
> >> +        Args:
> >> +            path: Path to the required node, e.g. '/node@3/subnode@1'
> >> +
> >> +        Returns:
> >> +            Node object for this node
> >> +
> >> +        Raises
> >> +            FdtException if the path is not valid
> >> +        """
> >> +        return Node(self, check_err(fdt_path_offset(self._fdt, path)))
> >
> > This interface is a mistake - more details on class Node below.
>=20
> [..]
>=20
> >> +    def get_property(self, nodeoffset, name):
> >> +        """Get a property given a node offset and the property name
> >> +
> >> +        We cannot use fdt_get_property() here since it does not retur=
n the
> >> +        offset. We prefer to create Node objects using the offset.
> >> +
> >> +        Args:
> >> +            nodeoffset: Offset of the node
> >> +            name: Property name
> >> +
> >> +        Returns:
> >> +            Prop object found
> >> +
> >> +        Raises:
> >> +            FdtException on error such as no such property
> >> +        """
> >> +        poffset =3D self.first_property_offset(nodeoffset)
> >> +        while True:
> >> +            pdata =3D self.get_property_by_offset_internal(poffset)
> >> +            if self.string(pdata.nameoff) =3D=3D name:
> >> +                return Prop(Node(self, nodeoffset), poffset)
> >> +            poffset =3D self.next_property_offset(poffset)
> >
> > Wait.. what!?  You're searching through the properties in Python?
> > Why not just using fdt_get_property() or fdt_getprop()?
>=20
> Because they do not tell me the offset-(see the comment in the
> function description above:
>=20
>         We cannot use fdt_get_property() here since it does not return the
>         offset. We prefer to create Node objects using the offset.
>=20
> If we want to have a Node object, then we probably want to store the
> offset of the node. Another option would be to add a function to
> libfdt which gets a property by name, but returns its offset, rather
> than a struct?

So, most of the above is moot, because the Node object is a bad idea -
see below.

> >> +    def get_property_quiet(self, nodeoffset, name):
> >> +        """Get a property given a node offset and the property name
> >> +
> >> +        We cannot use fdt_get_property() here since it does not retur=
n the
> >> +        offset. We prefer to create Node objects using the offset.
> >> +
> >> +        Args:
> >> +            nodeoffset: Offset of the node
> >> +            name: Property name
> >> +
> >> +        Returns:
> >> +            Prop object found or None if there is no such property
> >> +
> >> +        Raises:
> >> +            FdtException on error
> >> +        """
> >> +        poffset =3D self.first_property_offset_quiet(nodeoffset)
> >> +        while poffset >=3D 0:
> >> +            pdata =3D self.get_property_by_offset_internal(poffset)
> >> +            if self.string(pdata.nameoff) =3D=3D name:
> >> +                return Prop(Node(self, nodeoffset), poffset)
> >> +            poffset =3D self.next_property_offset_quiet(poffset)
> >> +        return None
> >> +
> >> +    def first_subnode(self, nodeoffset):
> >> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset))
> >> +
> >> +    def first_subnode_quiet(self, nodeoffset):
> >> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset), Tr=
ue)
> >> +
> >> +    def next_subnode(self, nodeoffset):
> >> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset))
> >> +
> >> +    def next_subnode_quiet(self, nodeoffset):
> >> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset), Tru=
e)
> >> +
> >> +    def totalsize(self):
> >> +        return check_err(fdt_totalsize(self._fdt))
> >> +
> >> +    def off_dt_struct(self):
> >> +        return check_err(fdt_off_dt_struct(self._fdt))
> >> +
> >> +    def pack(self):
> >> +        return check_err(fdt_pack(self._fdt))
> >> +
> >> +    def delprop(self, nodeoffset, prop_name):
> >> +        return check_err(fdt_delprop(self._fdt, nodeoffset, prop_name=
))
> >> +
> >> +
> >> +class Node:
> >
> > This can't work.  The reason that so many libfdt functions are
> > insistently called whatever_offset(), rather than just get_whatever()
> > is to constantly remind the user that this is a actual byte offset
> > into a buffer of data.  It's *not* a friendly stable node-handle, and
> > can become invalid when the fdt blob is altered.
> >
> > Attempting to put a class wrapper around it obscures that vital fact.
> > Treat node offsets as offsets everywhere, just encoded as plain old
> > python integers.
>=20
> My intent is to make the interface more pythonic, and I've been trying
> out various approaches. For read-only use this interface is nice.
> Consider this the high-water mark of this approach.

Ok.  So making the interface Pythonic is a reasonable goal - but not
when it obscures fundamental properties of behaviour.  It's simply not
possible to have a "stable" node (or property) handle with libfdt, so
we shouldn't make the Python interface appear to have one.

> But I can go back to something in between, where there is no Node or
> Prop. But please do check the code example in the cover letter and see
> if you are sure.

I am absoltely sure.  Node and Property objects are a bad idea.
Well.. Node objects definitely are.  Property objects could work, but
only if they're essentially just representing a (name, length, value)
tuple, *not* an offset into the actual tree.  i.e. such a property
object would be a copy of some data from the tree, not a handle to
something still within the tree.

> With this approach we can do things like node.next() which is nice I thin=
k.

Nice until you have a use case which breaks it, at which point it
becomes horribly confusing.

> Of course things can break if you start changing the tree while
> keeping objects around. So it isn't a perfect illusion. Hopefully it
> returns errors in that case..

It's not really possible to safely return errors in this case.
Usually you will get an error because your offset will point at
something bogus.  But it doesn't require that much bad luck for the
old offset to line up with something that's no longer the same thing
but looks vaguely sane, at which point you'll return valid looking but
wrong data.  You might hit an error condition later, or maybe you'll
just carry that bad data into the rest of your program.

With a bit more bad luck you could even end up with an infinite loop.

No, sorry, the illusion is sufficiently incomplete as to be more
dangerous than useful.

> [..]
>=20
> >> +class Prop:
> >> +    """A device-tree property
> >> +
> >> +    This encapsulates a device-tree property and provides various ope=
rations
> >> +    which can be performed on the property.
> >> +
> >> +    Generally the standard constructor is used to create a Prop objec=
t. But
> >> +    in the case where only the property offset is known (and not the =
Node
> >> +    that holds the property), from_offset() can be used.
> >> +    """
> >
> > TBH, I'm not really sold on the value of this class either.  Is there
> > really any point dealing with these rather fragile property handles,
> > rather than simply returning bytestrings with the values directly?  I
> > can't see it.
>=20
> It provides the ability to iterate, get the name (as well as the
> data), delete the property, etc.

Name is only relevant when iterating (otherwise you already knew the
name in order to get the property).  For iteration we could add an
interface to return a (name, value) tuple easily enough.  For
iteration itself I think we want something closer to the raw library
iterators - something working explicitly in terms of property offsets.

And I think we should only use those special considerations when doing
iteration.  For the common case of retrieving a property with a known
name, we should just have a simple wrapper on fdt_getprop() returning
a value directly, not messing around with objects and structures.

> >> +    def __init__(self, node, offset, fdt=3DNone):
> >> +        self._node =3D node
> >> +        self._offset =3D offset
> >> +        self._fdt =3D node._fdt if node else fdt
> >> +
> >> +    @classmethod
> >> +    def from_offset(cls, fdt, prop_offset):
> >> +        prop =3D cls(None, prop_offset, fdt)
> >> +        prop._get_name_data()
> >> +        return prop
> >> +
> >> +    def next(self):
> >> +        return Prop(self._node, check_err(fdt_next_property_offset(
> >> +                self._fdt._fdt, self._offset)))
> >> +
> >> +    def next_quiet(self):
> >> +        val =3D check_err(fdt_next_property_offset(self._fdt._fdt, se=
lf._offset),
> >> +                        True)
> >> +        if val < 0:
> >> +            return None
> >> +        return Prop(self._node, val)
> >> +
> >> +    def _get_name_data(self):
> >> +        pdata =3D fdt_get_property_by_offset(self._fdt._fdt, self._of=
fset)
> >> +        if not isinstance(pdata, list):
> >> +            raise FdtException(pdata)
> >> +        return self._fdt.string(pdata[0].nameoff), data(pdata[0])
> >> +
> >> +    def name(self):
> >> +        return self._get_name_data()[0]
> >> +
> >> +    def data(self):
> >> +        return self._get_name_data()[1]
> >> +
> >> +    def delete(self):
> >> +        if not self._node:
> >> +            raise RuntimeError("Can't delete property offset %d of un=
known node"
> >> +                               % self._offset)
> >> +        self._fdt.delprop(self._node._offset, self.name())
> >> +%}
>=20
> [..]
>=20
> >> +
> >> +/*
> >> + * From here are the function definitions from libfdt.h, along with t=
heir
> >> + * exception-handling code.
> >> + */
> >
> > Uh.. why do you need to duplicate these rather than including libfdt.h?
>=20
> Hopefully I can do that, even with fdt_totalsize(). Will check.
>=20
> >
> >> +int fdt_path_offset(const void *fdt, const char *path);
> >> +
> >> +int fdt_first_property_offset(const void *fdt, int nodeoffset);
> >> +
> >> +int fdt_next_property_offset(const void *fdt, int offset);
> >> +
> >> +const char *fdt_get_name(const void *fdt, int nodeoffset, int *OUTPUT=
);
> >> +
> >> +/* no exception handling, since this function has no error checking */
> >> +const char *fdt_string(const void *fdt, int stroffset);
> >> +
> >> +const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
> >> +                                                      int offset, int=
 *OUTPUT);
> >> +
> >> +/* no exception handling, this this function always returns a valid s=
tring */
> >> +const char *fdt_strerror(int errval);
> >> +
> >> +int fdt_first_subnode(const void *fdt, int offset);
> >> +
> >> +int fdt_next_subnode(const void *fdt, int offset);
> >> +
> >> +int fdt_delprop(void *fdt, int nodeoffset, const char *name);
> >> +
> >> +int fdt_pack(void *fdt);
> >> +
> >> +int fdt_totalsize(const void *fdt);
> >> +
> >> +int fdt_off_dt_struct(const void *fdt);
> >> diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> >> new file mode 100644
> >> index 0000000..8f8618e
> >> --- /dev/null
> >> +++ b/pylibfdt/setup.py
> >> @@ -0,0 +1,34 @@
> >> +#!/usr/bin/env python
> >> +
> >> +"""
> >> +setup.py file for SWIG libfdt
> >> +"""
> >> +
> >> +from distutils.core import setup, Extension
> >> +import os
> >> +import sys
> >> +
> >> +progname =3D sys.argv[0]
> >> +cflags =3D sys.argv[1]
> >> +files =3D sys.argv[2:]
> >> +
> >> +if cflags:
> >> +    cflags =3D [flag for flag in cflags.split(' ') if flag]
> >> +else:
> >> +    cflags =3D None
> >> +
> >> +libfdt_module =3D Extension(
> >> +    '_libfdt',
> >> +    sources =3D files,
> >> +    extra_compile_args =3D  cflags
> >> +)
> >> +
> >> +sys.argv =3D [progname, '--quiet', 'build_ext', '--inplace']
> >> +
> >> +setup (name =3D 'libfdt',
> >> +       version =3D '0.1',
> >> +       author      =3D "SWIG Docs",
> >
> > Um.. that doesn't seem quite right.
>=20
> Nope, will fix.
>=20
> >
> >> +       description =3D """Simple swig libfdt from docs""",
> >> +       ext_modules =3D [libfdt_module],
> >> +       py_modules =3D ["libfdt"],
> >> +       )
> >
>=20
> Regards,
> Simon

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bZ2MuwyI/0uB8yuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYdwGMAAoJEGw4ysog2bOSsYgQAJgBI5YCrD0jnGaODt/abhFp
BhvR9P0QpXho4UtXS21WFZLzQ2+O0z4tWTKm4MdzxeH16QuqbjngkfNVlvoAv/my
UBKE/qHogB9AaTWuJ1KDFoMEPlkPsLeSN52xlDyelsp82IIwKfW/9AK5izXs9Zlk
C6hLHeBqNy0wYrKgUhVCHL8sMXZsAfp0hcSl39nonktbdC91Cyj4jOoImd9pyxIF
SI/GOlx9nDXOwydnHSuKa+5L2WAFQ14veNq09fnX4y3Mf2Mdagkdy7KfQ1qGxgWQ
vMPt13ojGNMwib+lgKSa70BTeK6qjpA0rRhdWbZH2LWjpBd/JV+cjNbFiMJ8S0NV
+j4FYoVuLOpN2QBVyroK2GBMRmMRZBEo57eNJnKLjNbtz58ADu5yQRf+FerPHHOv
QwdqNGGVP6fIii8xF2vMiCzdAtS7/KY9GEXAUo8WAMN5Wqfo7QggAGKR+hsT2WEP
K/7nZuTzgmK3IHWYSAl74/etczOEdbZA5FLl65Tkcc51tlXmcPQG3Q34DYX/jdYA
PUwWRmcc1BWldfma+0NdXoozYxjJyUMpoaLqIjPMO22xgaPBiZdQK5iHncD68gaZ
BN34yDP2dBRs6S3599BErYFVXcmuI1+N1T3U+08SIR4obi8NEE+SVast+3KnORnF
tYTe73KryL7f10ImpL2f
=pxXv
-----END PGP SIGNATURE-----

--bZ2MuwyI/0uB8yuJ--
