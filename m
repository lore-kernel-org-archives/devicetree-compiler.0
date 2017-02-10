From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/5] Add an initial Python library for libfdt
Date: Fri, 10 Feb 2017 15:37:09 +1100
Message-ID: <20170210043709.GB25381@umbus>
References: <20170205201323.15411-1-sjg@chromium.org>
 <20170205201323.15411-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486701660;
        bh=fKVmpO9M7VJQKhFFdtQgMZZtFoB/BAkA+ImPhcEo7W0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nehDJ5TY39C48pVFxOwz4CygHndnGdrrucswrIj9dzgvWkhT5sqCMqzUgea+ATeE5
         pAhUuDlV7rHdCgHBbJ3NeDsLVqCu3K/Zq5k7iGlxPFoFfWfJr14t962W4NE7zYSbJn
         DnYXQWgCg9uoE1cpg/rwaMnRv3KJZtB0HU1LYyno=
Content-Disposition: inline
In-Reply-To: <20170205201323.15411-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 05, 2017 at 01:13:19PM -0700, Simon Glass wrote:
> Add Python bindings for a bare-bones set of libfdt functions. These allow
> navigating the tree and reading node names and properties.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v4:
> - Make the library less pythonic to avoid a shaky illusion
> - Drop classes for Node and Prop, along with associated methods
> - Include libfdt.h instead of repeating it
> - Add support for fdt_getprop()
> - Bring in all libfdt functions (but Python support is missing for many)
> - Add full comments for Python methods
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
>  pylibfdt/libfdt.swig       | 565 +++++++++++++++++++++++++++++++++++++++=
++++++
>  pylibfdt/setup.py          |  34 +++
>  4 files changed, 620 insertions(+)
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
> index 0000000..ac478d5
> --- /dev/null
> +++ b/pylibfdt/libfdt.swig
> @@ -0,0 +1,565 @@
> +/*
> + * pylibfdt - Flat Device Tree manipulation in Python
> + * Copyright (C) 2017 Google, Inc.
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
> +
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
> +    This is an internal function only.
> +
> +    Args:
> +        prop: Property structure, as returned by get_property_by_offset()
> +
> +    Returns:
> +        The property data as a bytearray
> +    """
> +    buf =3D bytearray(fdt32_to_cpu(prop.len))
> +    pylibfdt_copy_data(buf, prop)
> +    return buf

AFAICT this data() function (and the C functions it uses) aren't
actually used any more.  I think you can remove them.

> +
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
> +        FdtException if val < 0
> +    """
> +    if val < 0:
> +        if not quiet or val !=3D -NOTFOUND:

I don't really like hardcoding the specialness of NOTFOUND here -
depending on the call, there could be different error codes which are
relatively harmless.

Instead of a quiet boolean, you could pass in a set (list, sequence,
whatever) of error codes to be considered quiet.

> +            raise FdtException(val)
> +    return val
> +
> +def check_err_null(val, quiet=3DFalse):
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
> +        val if val is a list, None if not
> +
> +    Raises
> +        FdtException if quiet is False and val indicates an error was
> +           reported. If quiet if True then an FdtException is raised onl=
y if
> +           the error is something other than -NOTFOUND.
> +    """
> +    # Normally a tuple is returned which contains the data and its lengt=
h.
> +    # If we get just an integer error code, it means the function failed.
> +    if not isinstance(val, list):
> +        if not quiet or val !=3D -NOTFOUND:
> +            raise FdtException(val)
> +        return None,
> +    return val
> +
> +class Fdt:
> +    """Device tree class, supporting all operations
> +
> +    The Fdt object is created is created from a device tree binary file,
> +    e.g. with something like:
> +
> +       fdt =3D Fdt(open("filename.dtb").read())

I noticed when playing with this that doing Fdt("filename.dtb") will
appear to succeed, but then (of course) fail with BADMAGIC as soon as
you do anything.  Might be an idea to at least do a magic number check
in the constructor.

> +
> +    Operations can then be performed using the methods in this class. Ea=
ch
> +    method xxx(args...) corresponds to a libfdt function fdt_xxx(fdt, ar=
gs...).
> +
> +    Almost all methods raise an FdtException if an error occurs. The
> +    following does not:
> +
> +        string() - since it has no error checking
> +
> +    To avoid this behaviour a 'quiet' version is provided for some funct=
ions.
> +    This behaves as for the normal version except that it will not raise
> +    an exception in the case of an FDT_ERR_NOTFOUND error: it will simply
> +    return the -NOTFOUND error code or None.
> +    """
> +    def __init__(self, data):
> +        self._fdt =3D bytearray(data)
> +
> +    def string(self, offset):
> +        """Get a string given its offset
> +
> +        This is an internal function.
> +
> +        Args:
> +            offset: FDT offset in big-endian format
> +
> +        Returns:
> +            string value at that offset
> +        """
> +        return fdt_string(self._fdt, fdt32_to_cpu(offset))
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

Ugh.  I don't much like the idea of making quiet versions of a bunch
of entry points.  I think we need to pick one:
    a) Just return error codes (not very Pythonic, but you can't have
       everything)
    b) Always raise exceptions, and the user has to try: except: to
       quiet then (creating different error classes for the different
       codes could make this easier).

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
> +            Offset of the first property, or -NOTFOUND if the node has no
> +                properties
> +
> +        Raises
> +            FdtException if any other error occurs
> +        """
> +        return check_err(fdt_first_property_offset(self._fdt, nodeoffset=
), True)
> +
> +    def next_property_offset(self, prop_offset):
> +        """Get the next property in a node
> +
> +        Args:
> +            prop_offset: Offset of the previous property
> +
> +        Returns:
> +            Offset of the next property
> +
> +        Raises:
> +            FdtException if the associated node has no more properties, =
or
> +                some other error occurred
> +        """
> +        return check_err(fdt_next_property_offset(self._fdt, prop_offset=
))
> +
> +    def next_property_offset_quiet(self, prop_offset):
> +        """Get the next property in a node
> +
> +        Args:
> +            prop_offset: Offset of the previous property
> +
> +        Returns:
> +            Offset ot the next property, or -NOTFOUND if there are no mo=
re
> +            properties
> +
> +        Raises:
> +            FdtException if any other error occurs
> +        """
> +        return check_err(fdt_next_property_offset(self._fdt, prop_offset=
), True)
> +
> +    def get_name(self, nodeoffset):
> +        """Get the name of a node
> +
> +        Args:
> +            nodeoffset: Offset of node to check
> +
> +        Returns:
> +            Node name
> +
> +        Raises:
> +            FdtException on error (e.g. nodeoffset is invalid)
> +        """
> +        return check_err_null(fdt_get_name(self._fdt, nodeoffset))[0]
> +
> +    def get_property_by_offset(self, prop_offset):
> +        """Obtains a property that can be examined
> +
> +        TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Consider returning a property object ins=
tead,
> +        with the data extracted from the Fdt.

AFAICT you're already copying the property value out of the fdt as a
bytestring / bytearray.  I don't see what a property object would
encode apart from that bytestring.

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
> +    def first_subnode(self, nodeoffset):
> +        """Find the first subnode of a parent node
> +
> +        Args:
> +            nodeoffset: Node offset of parent node
> +
> +        Returns:
> +            The offset of the first subnode, if any
> +
> +        Raises:
> +            FdtException if no subnode found or other error occurs
> +        """
> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset))
> +
> +    def first_subnode_quiet(self, nodeoffset):
> +        """Find the first subnode of a node
> +
> +        Args:
> +            nodeoffset: Node offset of parent node
> +
> +        Returns:
> +            The offset of the first subnode, or -NOTFOUND if none
> +
> +        Raises:
> +            FdtException on error (e.g. invalid nodeoffset)
> +        """
> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset), True)
> +
> +    def next_subnode(self, nodeoffset):
> +        """Find the next subnode
> +
> +        Args:
> +            nodeoffset: Node offset of previous subnode
> +
> +        Returns:
> +            The offset of the next subnode, if any
> +
> +        Raises:
> +            FdtException if no more subnode found or other error occurs
> +        """
> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset))
> +
> +    def next_subnode_quiet(self, nodeoffset):
> +        """Find the next subnode
> +
> +        Args:
> +            nodeoffset: Node offset of previous subnode
> +
> +        Returns:
> +            The offset of the next subnode, or -NOTFOUND if none
> +
> +        Raises:
> +            FdtException on error (e.g. invalid nodeoffset)
> +        """
> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset), True)
> +
> +    def totalsize(self):
> +        """Return the total size of the device tree
> +
> +        Returns:
> +            Total tree size in bytes
> +
> +        Raises:
> +            FdtException if any error occurs
> +        """
> +        return check_err(fdt_totalsize(self._fdt))
> +
> +    def off_dt_struct(self):
> +        """Return the start of the device tree struct area
> +
> +        Returns:
> +            Start offset of struct area
> +
> +        Raises:
> +            FdtException if any error occurs
> +        """
> +        return check_err(fdt_off_dt_struct(self._fdt))
> +
> +    def pack(self):
> +        """Pack the device tree to remove unused space
> +
> +        This adjusts the tree in place.
> +
> +        Raises:
> +            FdtException if any error occurs
> +        """
> +        return check_err(fdt_pack(self._fdt))
> +
> +    def delprop(self, nodeoffset, prop_name):
> +        """Delete a property from a node
> +
> +        Args:
> +            nodeoffset: Node offset containing property to delete
> +            prop_name: Name of property to delete
> +
> +        Raises:
> +            FdtError if the property does not exist, or another error oc=
curs
> +        """
> +        return check_err(fdt_delprop(self._fdt, nodeoffset, prop_name))
> +
> +    def getprop(self, nodeoffset, prop_name):
> +        """Get a property from a node
> +
> +        Args:
> +            nodeoffset: Node offset containing property to get
> +            prop_name: Name of property to get
> +
> +        Returns:
> +            Value of property as a string
> +
> +        Raises:
> +            FdtError if any error occurs (e.g. the property is not found)
> +        """
> +        return check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_na=
me))[0]
> +
> +    def getprop_quiet(self, nodeoffset, prop_name):
> +        """Get a property from a node
> +
> +        Args:
> +            nodeoffset: Node offset containing property to get
> +            prop_name: Name of property to get
> +
> +        Returns:
> +            Value of property as a string, or None if not found
> +
> +        Raises:
> +            FdtError if an error occurs (e.g. nodeoffset is invalid)
> +        """
> +        return check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_na=
me),
> +                              True)[0]


There are a bunch of missing things here.  e.g. fdt_subnode_offset(),
off_dt_strings(), fdt_parent_offset(), ...

> +%}
> +
> +%rename(fdt_property) fdt_property_func;
> +
> +typedef int fdt32_t;
> +
> +%include "libfdt/fdt.h"
> +
> +%include "typemaps.i"
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
> +	if (!PyByteArray_Check($input)) {
> +		SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname"
> +			"', argument " "$argnum"" of type '" "$type""'");
> +	}
> +	$1 =3D (void *)PyByteArray_AsString($input);
> +}
> +
> +/* Some functions do change the device tree, so use void * */
> +%typemap(in) (void *) {
> +	if (!PyByteArray_Check($input)) {
> +		SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname"
> +			"', argument " "$argnum"" of type '" "$type""'");
> +	}
> +	$1 =3D PyByteArray_AsString($input);
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
> +%apply int *OUTPUT { int *lenp };
> +
> +/* Handle a few special cases which conflict with the typemap below */
> +const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int che=
cklen);
> +const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
> +				const char *name, int namelen, int *lenp);
> +
> +/* typemap used for fdt_getprop() */
> +%typemap(out) (const void *) {
> +	if (!$1)
> +		$result =3D Py_None;
> +	else
> +		/* TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Can we avoid the 'arg4'? */
> +		$result =3D Py_BuildValue("s#", $1, *arg4);
> +}
> +
> +/* We have both struct fdt_property and a function fdt_property() */
> +%warnfilter(302) fdt_property;
> +
> +%include <../libfdt/libfdt.h>
> +
> +/* These are macros in the header so have to be redefined here */
> +int fdt_magic(const void *fdt);
> +int fdt_totalsize(const void *fdt);
> +int fdt_off_dt_struct(const void *fdt);
> +int fdt_off_dt_strings(const void *fdt);
> +int fdt_off_mem_rsvmap(const void *fdt);
> +int fdt_version(const void *fdt);
> +int fdt_last_comp_version(const void *fdt);
> +int fdt_boot_cpuid_phys(const void *fdt);
> +int fdt_size_dt_strings(const void *fdt);
> +int fdt_size_dt_struct(const void *fdt);
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
> +       description =3D """Simple swig libfdt from docs""",
> +       ext_modules =3D [libfdt_module],
> +       py_modules =3D ["libfdt"],
> +       )

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnUNyAAoJEGw4ysog2bOShK8QAKTnYR05xUf2Yvz2M4K/2gEJ
9Db7ZAVul+ZV4KAkqSIif5MJChHmEW7bxhjMIxSspo8xt28GsxWUHVjHtcLpnGOg
RYQL/xH8/YsHl8KrEK0sDPy0Ye+fAX9/cDkdmqqngglSyslwyLOhq+wTmMhBP6P1
7+uCxYHQGhEk8dUyplpb2a3uYD71bzo64uN7unMssITNFwjnSKIzRyxCks89/smf
KzwBAFUpXFrvvh+7jBte59ee2n0TYEXwPaA2X3NBYsvAzLSxEKkr7rDzBGzHXtRp
7yFxH3kPJKxpVGob1rNULLAf1qIsa7crTtti+B+QaQTs+mXhJh4H1cC8PbhnDB2P
pXIN0cA+/hjkEuCTUziqWvzNTfhV9CbnT6WGb8wvjTHy5aWTrh6dXa1LNA0EG9EF
TAEkljLrEClSJs9BEoiMlXgzufXYRiJFwzesApoZw2hbkhSHRxTFLjEWqRfr5mqt
PWhApVv7QaGUcqGCxBx/MF80tSuaWM7FDc5JgkJxCttxg2a1RUOydq0tsWyBXabY
WWo9gPYLc7tD3vtOE+lwTSgguawSAWNNd3vQew9MX9DcOXaNwSygu5xz7MdH49vb
f+z8rt3AC3TARvRwB9k1GMAEGq9DLgBRwQo1NJyTsWdzz0Vvo7MTDTa9INi1Nyw9
IGkBKgO20L10hXDXwXz3
=Epm4
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
