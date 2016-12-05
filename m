From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/4] Add an initial Python library for libfdt
Date: Mon, 5 Dec 2016 15:35:22 +1100
Message-ID: <20161205043522.GE32366@umbus.fritz.box>
References: <1480812490-11926-1-git-send-email-sjg@chromium.org>
 <1480812490-11926-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1480913613;
        bh=43ADe0fwcYSOikim7dUniIQZLJVbFf4oHrfInzdS5lU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZAtqduMXtNbV2Efo5XPs16jmdU9r7M6PYHXQnResKVge3/5vRv5HeLTO55zxbjiXi
         7f5TqfGvtOiZ+JNZJ6assp1eqtAEvvsZETap//7v82P681/TiGG1i6ePEKkkwTOGgE
         1AxkXuRYEBubhOBbAx3KLzeS0zkl5PWaTuO8D8Vk=
Content-Disposition: inline
In-Reply-To: <1480812490-11926-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 03, 2016 at 05:48:07PM -0700, Simon Glass wrote:
> Add Python bindings for a bare-bones set of libfdt functions. These allow
> navigating the tree and reading node names and properties.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v3:
> - Make the library more pythonic
> - Add classes for Node and Prop along with methods
> - Add an exception class
> - Use Python to generate exeptions instead of SWIG
>=20
> Changes in v2:
> - Add exceptions when functions return an error
> - Correct Python naming to following PEP8
> - Use a class to encapsulate the various methods
> - Include fdt.h instead of redefining struct fdt_property
> - Use bytearray to avoid the SWIG warning 454
> - Add comments
>=20
>  pylibfdt/.gitignore        |   3 +
>  pylibfdt/Makefile.pylibfdt |  18 ++
>  pylibfdt/libfdt.swig       | 602 +++++++++++++++++++++++++++++++++++++++=
++++++
>  pylibfdt/setup.py          |  34 +++
>  4 files changed, 657 insertions(+)
>  create mode 100644 pylibfdt/.gitignore
>  create mode 100644 pylibfdt/Makefile.pylibfdt
>  create mode 100644 pylibfdt/libfdt.swig
>  create mode 100644 pylibfdt/setup.py
>=20
> diff --git a/pylibfdt/.gitignore b/pylibfdt/.gitignore
> new file mode 100644
> index 0000000..5e8c5e3
> --- /dev/null
> +++ b/pylibfdt/.gitignore
> @@ -0,0 +1,3 @@
> +libfdt.py
> +libfdt.pyc
> +libfdt_wrap.c
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> new file mode 100644
> index 0000000..fa74dd2
> --- /dev/null
> +++ b/pylibfdt/Makefile.pylibfdt
> @@ -0,0 +1,18 @@
> +# Makefile.pylibfdt
> +#
> +
> +PYLIBFDT_srcs =3D $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_SRCS))
> +WRAP =3D $(PYLIBFDT_objdir)/libfdt_wrap.c
> +PYMODULE =3D $(PYLIBFDT_objdir)/_libfdt.so
> +
> +$(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
> +	@$(VECHO) PYMOD $@
> +	python $(PYLIBFDT_objdir)/setup.py "$(CPPFLAGS)" $^
> +	mv _libfdt.so $(PYMODULE)
> +
> +$(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
> +	@$(VECHO) SWIG $@
> +	swig -python -o $@ $<
> +
> +PYLIBFDT_cleanfiles =3D libfdt_wrap.c libfdt.py libfdt.pyc
> +PYLIBFDT_CLEANFILES =3D $(addprefix $(PYLIBFDT_objdir)/,$(PYLIBFDT_clean=
files))
> diff --git a/pylibfdt/libfdt.swig b/pylibfdt/libfdt.swig
> new file mode 100644
> index 0000000..461cdff
> --- /dev/null
> +++ b/pylibfdt/libfdt.swig
> @@ -0,0 +1,602 @@
> +/*
> + * pylibfdt - Flat Device Tree manipulation in Python
> + * Copyright (C) 2016 Google, Inc.
> + * Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> + *
> + * libfdt is dual licensed: you can use it either under the terms of
> + * the GPL, or the BSD license, at your option.
> + *
> + *  a) This library is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This library is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + *     You should have received a copy of the GNU General Public
> + *     License along with this library; if not, write to the Free
> + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
> + *     MA 02110-1301 USA
> + *
> + * Alternatively,
> + *
> + *  b) Redistribution and use in source and binary forms, with or
> + *     without modification, are permitted provided that the following
> + *     conditions are met:
> + *
> + *     1. Redistributions of source code must retain the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer.
> + *     2. Redistributions in binary form must reproduce the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer in the documentation and/or other materials
> + *        provided with the distribution.
> + *
> + *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> + *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
> + *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> + *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> + *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> + *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> + *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> + *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> + *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> + *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> + *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
> + *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +%module libfdt
> +
> +%{
> +#define SWIG_FILE_WITH_INIT
> +#include "libfdt.h"
> +%}
> +
> +%pythoncode %{
> +
> +import struct
> +
> +# Error codes, corresponding to FDT_ERR_... in libfdt.h
> +(NOTFOUND,
> +        EXISTS,
> +        NOSPACE,
> +        BADOFFSET,
> +        BADPATH,
> +        BADPHANDLE,
> +        BADSTATE,
> +        TRUNCATED,
> +        BADMAGIC,
> +        BADVERSION,
> +        BADSTRUCTURE,
> +        BADLAYOUT,
> +        INTERNAL,
> +        BADNCELLS,
> +        BADVALUE,
> +        BADOVERLAY) =3D range(1, 17)

Pity we can't get swig to autogenerate those.

> +class FdtException(Exception):
> +    """An exception caused by an error such as one of the codes above"""
> +    def __init__(self, err):
> +        self.err =3D err
> +
> +    def __str__(self):
> +        return 'pylibfdt error %d: %s' % (self.err, fdt_strerror(self.er=
r))
> +
> +def fdt32_to_cpu(val):
> +    """Convert a device-tree cell value into a native integer"""
> +    return struct.unpack("=3DI", struct.pack(">I", val))[0]
> +
> +def data(prop):
> +    """Extract the data from a property
> +
> +    Args:
> +        prop: Property structure, as returned by get_property_by_offset()
> +
> +    Returns:
> +        The property data as a bytearray
> +    """
> +    buf =3D bytearray(fdt32_to_cpu(prop.len))

prop.len should be a native value, not requiring byteswap.

> +    pylibfdt_copy_data(buf, prop)
> +    return buf

Urgh.. all this fdt_property() wrangling stuff is really ugly.  Any
chance we could just exclude it from the wrapper, providing only
fdt_getprop() interfaces which simply return a Python bytestring
directly?

> +def strerror(fdt_err):
> +    """Get the string for an error number
> +
> +    Args:
> +        fdt_err: Error number (-ve)
> +
> +    Returns:
> +        String containing the associated error
> +    """
> +    return fdt_strerror(fdt_err)
> +
> +def check_err(val, quiet=3DFalse):
> +    """Raise an error if the return value is -ve
> +
> +    This is used to check for errors returned by libfdt C functions.
> +
> +    Args:
> +        val: Return value from a libfdt function
> +        quiet: True to ignore the NOTFOUND error, False to raise on all =
errors
> +
> +    Returns:
> +        val if val >=3D 0
> +
> +    Raises
> +        FdtException if val is < 0
> +    """
> +    if val < 0:
> +        if not quiet or val !=3D -NOTFOUND:
> +            raise FdtException(val)
> +    return val
> +
> +def check_err_null(val):
> +    """Raise an error if the return value is NULL
> +
> +    This is used to check for a NULL return value from certain libfdt C
> +    functions
> +
> +    Args:
> +        val: Return value from a libfdt function
> +        quiet: True to ignore the NOTFOUND error, False to raise on all =
errors
> +
> +    Returns:
> +        val if val is not NULL
> +
> +    Raises
> +        FdtException if val is NULL
> +    """
> +    # Normally a tuple is returned which contains the data and its lengt=
h.

Yeah.. since Python strings / bytestrings know their own length, why
do we need such a tuple?

> +    # If we get just an integer error code, it means the function failed.
> +    if not isinstance(val, list):
> +        raise FdtException(val)
> +    return val
> +
> +class Fdt:
> +    """Device tree class, supporting all operations
> +
> +    The Fdt object is created is created from a device tree binary file,
> +    e.g. with something like:
> +
> +       fdt =3D Fdt(open("filename.dtb").read())
> +
> +    Operations can then be performed using the methods in this class. Ea=
ch
> +    method xxx(args...) corresponds to a libfdt function fdt_xxx(fdt, ar=
gs...).
> +
> +    Almost all methods raise a FdtException if an error occurs. The
> +    following does not:
> +
> +        string() - since it has no error checking
> +
> +    To avoid this behaviour a 'quiet' version is provided for some funct=
ions.
> +    This behaves as for the normal version except that it will not raise
> +    an exception in the case of an FDT_ERR_NOTFOUND error: it will simply
> +    return the -NOTFOUND error code or None.
> +
> +    Separate classes are provided for nodes (Node) and properties (Prop).
> +    """
> +    def __init__(self, data):
> +        self._fdt =3D bytearray(data)
> +
> +    def string(self, offset):
> +        """Get a string given its offset
> +
> +        Args:
> +            offset: FDT offset in big-endian format
> +
> +        Returns:
> +            string value at that offset
> +        """
> +        return fdt_string(self._fdt, fdt32_to_cpu(offset))

ARGH, no.  The offset argument is an integer, it should be treated as
a native integer, and the byteswap should absolutely not be here.

> +    def path(self, path):
> +        """Get the Node for a given path
> +
> +        Args:
> +            path: Path to the required node, e.g. '/node@3/subnode@1'
> +
> +        Returns:
> +            Node object for this node
> +
> +        Raises
> +            FdtException if the path is not valid
> +        """
> +        return Node(self, check_err(fdt_path_offset(self._fdt, path)))

This interface is a mistake - more details on class Node below.

> +    def path_quiet(self, path):
> +        """Get the Node for a given path
> +
> +        Args:
> +            path: Path to the required node, e.g. '/node@3/subnode@1'
> +
> +        Returns:
> +            Node object for this node, or None if the path is not valid
> +        """
> +        val =3D check_err(fdt_path_offset(self._fdt, path), True)
> +        if val < 0:
> +            return None
> +        return Node(self, val)
> +
> +    def path_offset(self, path):
> +        """Get the offset for a given path
> +
> +        Args:
> +            path: Path to the required node, e.g. '/node@3/subnode@1'
> +
> +        Returns:
> +            Node offset
> +
> +        Raises
> +            FdtException if the path is not valid
> +        """
> +        return check_err(fdt_path_offset(self._fdt, path))
> +
> +    def path_offset_quiet(self, path):
> +        """Get the offset for a given path
> +
> +        Args:
> +            path: Path to the required node, e.g. '/node@3/subnode@1'
> +
> +        Returns:
> +            Node offset, or -NOTFOUND if the path is not value
> +
> +        Raises
> +            FdtException if any error occurs other than NOTFOUND
> +        """
> +        return check_err(fdt_path_offset(self._fdt, path), True)
> +
> +    def first_property_offset(self, nodeoffset):
> +        """Get the offset of the first property in a node offset
> +
> +        Args:
> +            nodeoffset: Offset to the node to check
> +
> +        Returns:
> +            Offset of the first property
> +
> +        Raises
> +            FdtException if the associated node has no properties, or so=
me
> +                other error occurred
> +        """
> +        return check_err(fdt_first_property_offset(self._fdt, nodeoffset=
))
> +
> +    def first_property_offset_quiet(self, nodeoffset):
> +        """Get the offset of the first property in a node offset
> +
> +        Args:
> +            nodeoffset: Offset to the node to check
> +
> +        Returns:
> +            Offset of the first property, or -ENOTFOUND if the node has =
no
> +                properties
> +
> +        Raises
> +            FdtException if any other error occurs
> +        """
> +        return check_err(fdt_first_property_offset(self._fdt, nodeoffset=
), True)
> +
> +    # TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Comment the rest of the methods once every=
thing
> +    # is confirmed.
> +    def next_property_offset(self, prop_offset):
> +        return check_err(fdt_next_property_offset(self._fdt, prop_offset=
))
> +
> +    def next_property_offset_quiet(self, prop_offset):
> +        return check_err(fdt_next_property_offset(self._fdt, prop_offset=
), True)
> +
> +    def get_name(self, nodeoffset):
> +        return check_err_null(fdt_get_name(self._fdt, nodeoffset))[0]
> +
> +    def get_property_by_offset_internal(self, prop_offset):
> +        """Obtains a property that can be examined
> +
> +        Args:
> +            prop_offset: Offset of property (e.g. from first_property_of=
fset())
> +
> +        Returns:
> +            Property object with members:
> +                tag: Big-endian device tree tag value
> +                len: Big-endian property length
> +                nameoff: Big-endian string offset for use with string()
> +
> +            Use data() on the return value to obtain the property value.
> +
> +        Raises:
> +            FdtException on error (e.g. invalid prop_offset or device
> +            tree format)
> +        """
> +        return check_err_null(fdt_get_property_by_offset(self._fdt,
> +                                                         prop_offset))[0]
> +
> +    def get_property_by_offset(self, prop_offset):
> +        return Prop.from_offset(self, prop_offset)
> +
> +    def get_property(self, nodeoffset, name):
> +        """Get a property given a node offset and the property name
> +
> +        We cannot use fdt_get_property() here since it does not return t=
he
> +        offset. We prefer to create Node objects using the offset.
> +
> +        Args:
> +            nodeoffset: Offset of the node
> +            name: Property name
> +
> +        Returns:
> +            Prop object found
> +
> +        Raises:
> +            FdtException on error such as no such property
> +        """
> +        poffset =3D self.first_property_offset(nodeoffset)
> +        while True:
> +            pdata =3D self.get_property_by_offset_internal(poffset)
> +            if self.string(pdata.nameoff) =3D=3D name:
> +                return Prop(Node(self, nodeoffset), poffset)
> +            poffset =3D self.next_property_offset(poffset)

Wait.. what!?  You're searching through the properties in Python?
Why not just using fdt_get_property() or fdt_getprop()?

> +    def get_property_quiet(self, nodeoffset, name):
> +        """Get a property given a node offset and the property name
> +
> +        We cannot use fdt_get_property() here since it does not return t=
he
> +        offset. We prefer to create Node objects using the offset.
> +
> +        Args:
> +            nodeoffset: Offset of the node
> +            name: Property name
> +
> +        Returns:
> +            Prop object found or None if there is no such property
> +
> +        Raises:
> +            FdtException on error
> +        """
> +        poffset =3D self.first_property_offset_quiet(nodeoffset)
> +        while poffset >=3D 0:
> +            pdata =3D self.get_property_by_offset_internal(poffset)
> +            if self.string(pdata.nameoff) =3D=3D name:
> +                return Prop(Node(self, nodeoffset), poffset)
> +            poffset =3D self.next_property_offset_quiet(poffset)
> +        return None
> +
> +    def first_subnode(self, nodeoffset):
> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset))
> +
> +    def first_subnode_quiet(self, nodeoffset):
> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset), True)
> +
> +    def next_subnode(self, nodeoffset):
> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset))
> +
> +    def next_subnode_quiet(self, nodeoffset):
> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset), True)
> +
> +    def totalsize(self):
> +        return check_err(fdt_totalsize(self._fdt))
> +
> +    def off_dt_struct(self):
> +        return check_err(fdt_off_dt_struct(self._fdt))
> +
> +    def pack(self):
> +        return check_err(fdt_pack(self._fdt))
> +
> +    def delprop(self, nodeoffset, prop_name):
> +        return check_err(fdt_delprop(self._fdt, nodeoffset, prop_name))
> +
> +
> +class Node:

This can't work.  The reason that so many libfdt functions are
insistently called whatever_offset(), rather than just get_whatever()
is to constantly remind the user that this is a actual byte offset
into a buffer of data.  It's *not* a friendly stable node-handle, and
can become invalid when the fdt blob is altered.

Attempting to put a class wrapper around it obscures that vital fact.
Treat node offsets as offsets everywhere, just encoded as plain old
python integers.

> +    """A device tree node
> +
> +    This encapsulates a device-tree node and provides various operations
> +    which can be performed on the node. In particular it is possible to =
find
> +    subnodes and properties.
> +    """
> +    def __init__(self, fdt, offset):
> +        self._fdt =3D fdt
> +        self._offset =3D offset
> +
> +    def first_property(self):
> +        return Prop(self, check_err(fdt_first_property_offset(self._fdt.=
_fdt,
> +                                                              self._offs=
et)))
> +
> +    def first_property_quiet(self):
> +        val =3D check_err(fdt_first_property_offset(self._fdt._fdt, self=
=2E_offset),
> +                        True)
> +        if val < 0:
> +            return None
> +        return Prop(self, val)
> +
> +    def props(self):
> +        props =3D []
> +        prop =3D self.first_property_quiet()
> +        while prop:
> +            props.append(prop)
> +            prop =3D prop.next_quiet()
> +        return props
> +
> +    def first_subnode(self):
> +        val =3D check_err(fdt_first_subnode(self._fdt._fdt, self._offset=
))
> +        return Node(self._fdt, val)
> +
> +    def next_subnode(self):
> +        val =3D check_err(fdt_next_subnode(self._fdt._fdt, self._offset))
> +        return Node(self._fdt, val)
> +
> +    def first_subnode_quiet(self):
> +        val =3D check_err(fdt_first_subnode(self._fdt._fdt, self._offset=
), True)
> +        if val < 0:
> +            return None
> +        return Node(self._fdt, val)
> +
> +    def next_subnode_quiet(self):
> +        val =3D check_err(fdt_next_subnode(self._fdt._fdt, self._offset)=
, True)
> +        if val < 0:
> +            return None
> +        return Node(self._fdt, val)
> +
> +    def name(self):
> +        return check_err_null(fdt_get_name(self._fdt._fdt, self._offset)=
)[0]
> +
> +    def prop(self, name):
> +        return self._fdt.get_property(self._offset, name)
> +
> +
> +class Prop:
> +    """A device-tree property
> +
> +    This encapsulates a device-tree property and provides various operat=
ions
> +    which can be performed on the property.
> +
> +    Generally the standard constructor is used to create a Prop object. =
But
> +    in the case where only the property offset is known (and not the Node
> +    that holds the property), from_offset() can be used.
> +    """

TBH, I'm not really sold on the value of this class either.  Is there
really any point dealing with these rather fragile property handles,
rather than simply returning bytestrings with the values directly?  I
can't see it.

> +    def __init__(self, node, offset, fdt=3DNone):
> +        self._node =3D node
> +        self._offset =3D offset
> +        self._fdt =3D node._fdt if node else fdt
> +
> +    @classmethod
> +    def from_offset(cls, fdt, prop_offset):
> +        prop =3D cls(None, prop_offset, fdt)
> +        prop._get_name_data()
> +        return prop
> +
> +    def next(self):
> +        return Prop(self._node, check_err(fdt_next_property_offset(
> +                self._fdt._fdt, self._offset)))
> +
> +    def next_quiet(self):
> +        val =3D check_err(fdt_next_property_offset(self._fdt._fdt, self.=
_offset),
> +                        True)
> +        if val < 0:
> +            return None
> +        return Prop(self._node, val)
> +
> +    def _get_name_data(self):
> +        pdata =3D fdt_get_property_by_offset(self._fdt._fdt, self._offse=
t)
> +        if not isinstance(pdata, list):
> +            raise FdtException(pdata)
> +        return self._fdt.string(pdata[0].nameoff), data(pdata[0])
> +
> +    def name(self):
> +        return self._get_name_data()[0]
> +
> +    def data(self):
> +        return self._get_name_data()[1]
> +
> +    def delete(self):
> +        if not self._node:
> +            raise RuntimeError("Can't delete property offset %d of unkno=
wn node"
> +                               % self._offset)
> +        self._fdt.delprop(self._node._offset, self.name())
> +%}
> +
> +typedef int fdt32_t;
> +
> +%include "libfdt/fdt.h"
> +
> +%include "typemaps.i"
> +
> +%typemap(in) void * =3D char *;
> +
> +/*
> + * Unfortunately the defintiion of pybuffer_mutable_binary() in my Python
> + * version appears to be broken:
> + * pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_pylibfdt_copy_data=
=E2=80=99:
> + * pylibfdt/libfdt_wrap.c:3603:22: error: =E2=80=98size=E2=80=99 undecla=
red (first use in this
> + * function)
> + *   arg2 =3D (size_t) (size/sizeof(char));
> + *
> + * This version works correctly.
> + */
> +%define %mypybuffer_mutable_binary(TYPEMAP, SIZE)
> +%typemap(in) (TYPEMAP, SIZE)(int res, Py_ssize_t size =3D 0, void *buf =
=3D 0)
> +{
> +	res =3D PyObject_AsWriteBuffer($input, &buf, &size);
> +	if (res < 0) {
> +		PyErr_Clear();
> +		%argument_fail(res, "(TYPEMAP, SIZE)", $symname, $argnum);
> +	}
> +	$1 =3D ($1_ltype)buf;
> +	$2 =3D ($2_ltype)(size1 / sizeof($*1_type));
> +}
> +%enddef
> +
> +/* This is used to copy property data into a bytearray */
> +%mypybuffer_mutable_binary(char *str, size_t size);
> +void pylibfdt_copy_data(char *str, size_t size,
> +			const struct fdt_property *prop);
> +
> +/* Most functions don't change the device tree, so use a const void * */
> +%typemap(in) (const void *) {
> +    if (!PyByteArray_Check($input)) {
> +        SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname"
> +                            "', argument " "$argnum"" of type '" "$type"=
"'");
> +  }
> +  $1 =3D (void *)PyByteArray_AsString($input);
> +}
> +
> +/* Some functions do change the device tree, so use void * */
> +%typemap(in) (void *) {
> +    if (!PyByteArray_Check($input)) {
> +        SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname"
> +                            "', argument " "$argnum"" of type '" "$type"=
"'");
> +  }
> +  $1 =3D PyByteArray_AsString($input);
> +}
> +
> +%inline %{
> +
> +/**
> + * pylibfdt_copy_data() - Copy data from a property to the given buffer
> + *
> + * This is used by the data() function to place the contents of a proper=
ty
> + * into a bytearray.
> + *
> + * @buf: Destination pointer (typically the start of the bytearray)
> + * @size: Number of bytes to copy (size of bytearray)
> + * @prop: Property to copy
> + */
> +void pylibfdt_copy_data(char *buf, size_t size, const struct fdt_propert=
y *prop)
> +{
> +	memcpy(buf, prop + 1, size);
> +}
> +
> +%}
> +
> +/*
> + * From here are the function definitions from libfdt.h, along with their
> + * exception-handling code.
> + */

Uh.. why do you need to duplicate these rather than including libfdt.h?

> +int fdt_path_offset(const void *fdt, const char *path);
> +
> +int fdt_first_property_offset(const void *fdt, int nodeoffset);
> +
> +int fdt_next_property_offset(const void *fdt, int offset);
> +
> +const char *fdt_get_name(const void *fdt, int nodeoffset, int *OUTPUT);
> +
> +/* no exception handling, since this function has no error checking */
> +const char *fdt_string(const void *fdt, int stroffset);
> +
> +const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
> +                                                      int offset, int *O=
UTPUT);
> +
> +/* no exception handling, this this function always returns a valid stri=
ng */
> +const char *fdt_strerror(int errval);
> +
> +int fdt_first_subnode(const void *fdt, int offset);
> +
> +int fdt_next_subnode(const void *fdt, int offset);
> +
> +int fdt_delprop(void *fdt, int nodeoffset, const char *name);
> +
> +int fdt_pack(void *fdt);
> +
> +int fdt_totalsize(const void *fdt);
> +
> +int fdt_off_dt_struct(const void *fdt);
> diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> new file mode 100644
> index 0000000..8f8618e
> --- /dev/null
> +++ b/pylibfdt/setup.py
> @@ -0,0 +1,34 @@
> +#!/usr/bin/env python
> +
> +"""
> +setup.py file for SWIG libfdt
> +"""
> +
> +from distutils.core import setup, Extension
> +import os
> +import sys
> +
> +progname =3D sys.argv[0]
> +cflags =3D sys.argv[1]
> +files =3D sys.argv[2:]
> +
> +if cflags:
> +    cflags =3D [flag for flag in cflags.split(' ') if flag]
> +else:
> +    cflags =3D None
> +
> +libfdt_module =3D Extension(
> +    '_libfdt',
> +    sources =3D files,
> +    extra_compile_args =3D  cflags
> +)
> +
> +sys.argv =3D [progname, '--quiet', 'build_ext', '--inplace']
> +
> +setup (name =3D 'libfdt',
> +       version =3D '0.1',
> +       author      =3D "SWIG Docs",

Um.. that doesn't seem quite right.

> +       description =3D """Simple swig libfdt from docs""",
> +       ext_modules =3D [libfdt_module],
> +       py_modules =3D ["libfdt"],
> +       )

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYRO6IAAoJEGw4ysog2bOSrXkQALur0v7BBdCXAb6IOU/q/g+1
a7bm5YPGAxWuGT6/DcwLetbSI+hr9wmnMv4USRL+FFMge1Vv25x4vU/oNcBzf1hP
anjuk3Hd1vKdg6zbJSiL4O0mR5U+FldVbYdhzBJ42QbUCA4EEGc3Z15f4bKnO8JQ
9hpjZ42amFidXM17KmU7vnuqDBy7xro73k3ith8yQqD9ZkGATHg0v000YZdgk7jt
FZLklq3xzY3HxDy7I6ozPGIA7za4vgIKM2nnAGKGis/3EjFH/S1ySbFdFcbXcRFp
eY7WEHhKLlbKrhfTy7u1K97NLSn602oBYmNwRh4mB/pdQcS1oNa21zikohguUgTZ
FjtPEMJ0SrJp3iP4tWVQmF4O0AoLC4OmUqYTGjOXZlraEVTmrq76WtUTGkEwqGjd
w0oAQH3x1+RSJfTF8830d9TxFFbUYxx4BqWyEnsDIC4qvI9m4/Yrw8MeAKQUIoJ3
PchYhEoooIBSeCWynAXcjUAqEi4xxJH80bimU7XjNcEysEWLBt7rNmjdIxAsfrF3
hWv/yNxfqpKCoC1lFF1tSZtgduUk2egQV82U00SVaW1uDgZly8hDwouITsGgJiwp
+UJpuQSZ98KlfwMUJsRdLVaQSzfFjix6jHNZ/cDzbC4jtPTgQ2cMdvQF89HPOjKl
BgiRgXO6L1Ue/iDghx/S
=vdEd
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--
