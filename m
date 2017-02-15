From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 1/5] Add an initial Python library for libfdt
Date: Wed, 15 Feb 2017 16:47:55 +1100
Message-ID: <20170215054755.GK12369@umbus.fritz.box>
References: <20170215035200.29934-1-sjg@chromium.org>
 <20170215035200.29934-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fUvfsPTz/SzOZDdw"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487138043;
        bh=309WY8yi2FHNCrOkIaYaLDs+aREcfw0q8WKCayEyOIs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QkzTEDmUq7CG+mSI4o0UGbD+GMo1rwlFH0yVPRhSfVRjGyhyGsrmRJaLXEmIn+h1Y
         PcLoxuhFAukklN+79p6cQUqtXLe4S12+yQlPU1BEHqZU4pcfzBlvQW1RApCNAGixNa
         IbpnbVcrg7A34fAs+eU9IFgSxDCXPD0twoQ7xbjk=
Content-Disposition: inline
In-Reply-To: <20170215035200.29934-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--fUvfsPTz/SzOZDdw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2017 at 08:51:56PM -0700, Simon Glass wrote:
> Add Python bindings for a bare-bones set of libfdt functions. These allow
> navigating the tree and reading node names and properties.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v5:
> - Use a 'quiet' parameter instead of quiet versions of functions
> - Add a Property object to hold a property's name and value
> - Drop the data() and string() functions which are not needed now
> - Rename pylibfdt_copy_data() tp pylibfdt_copy_value()
> - Change order of libfdt.h inclusion to avoid #ifdef around libfdt macros
> - Drop fdt_offset_ptr() and fdt_getprop_namelen() from the swig interface
> - Use $(SWIG) to call swig from the Makefile
> - Review function comments
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
>  Makefile                   |   1 +
>  pylibfdt/.gitignore        |   3 +
>  pylibfdt/Makefile.pylibfdt |  18 ++
>  pylibfdt/libfdt.swig       | 465 +++++++++++++++++++++++++++++++++++++++=
++++++
>  pylibfdt/setup.py          |  34 ++++
>  5 files changed, 521 insertions(+)
>  create mode 100644 pylibfdt/.gitignore
>  create mode 100644 pylibfdt/Makefile.pylibfdt
>  create mode 100644 pylibfdt/libfdt.swig
>  create mode 100644 pylibfdt/setup.py
>=20
> diff --git a/Makefile b/Makefile
> index ce05eba..1c48210 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -22,6 +22,7 @@ CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS)
> =20
>  BISON =3D bison
>  LEX =3D flex
> +SWIG =3D swig
> =20
>  INSTALL =3D /usr/bin/install
>  DESTDIR =3D
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
> index 0000000..0c0b390
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
> +	$(SWIG) -python -o $@ $<
> +
> +PYLIBFDT_cleanfiles =3D libfdt_wrap.c libfdt.py libfdt.pyc
> +PYLIBFDT_CLEANFILES =3D $(addprefix $(PYLIBFDT_objdir)/,$(PYLIBFDT_clean=
files))
> diff --git a/pylibfdt/libfdt.swig b/pylibfdt/libfdt.swig
> new file mode 100644
> index 0000000..d538b3e
> --- /dev/null
> +++ b/pylibfdt/libfdt.swig
> @@ -0,0 +1,465 @@
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
> +# Pass this as the 'quiet' parameter to return -ENOTFOUND on NOTFOUND er=
rors,
> +# instead of raising an exception.
> +QUIET_NOTFOUND =3D [NOTFOUND]
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

Sorry, missed this on the first pass.  I dislike this function,
because it presumes that some bytes in the fdt have already been
converted into a Python integer, with the wrong endianness.  If a
value makes it into a Python int (as opposed to a string or bytes
object) it should already have been endian converted.

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
> +def check_err(val, quiet=3D[]):
> +    """Raise an error if the return value is -ve
> +
> +    This is used to check for errors returned by libfdt C functions.
> +
> +    Args:
> +        val: Return value from a libfdt function
> +        quiet: Errors to ignore (empty to raise on all errors)
> +
> +    Returns:
> +        val if val >=3D 0
> +
> +    Raises
> +        FdtException if val < 0
> +    """
> +    if val < 0:
> +        if -val not in quiet:
> +            raise FdtException(val)
> +    return val
> +
> +def check_err_null(val, quiet=3D[]):
> +    """Raise an error if the return value is NULL
> +
> +    This is used to check for a NULL return value from certain libfdt C
> +    functions
> +
> +    Args:
> +        val: Return value from a libfdt function
> +        quiet: Errors to ignore (empty to raise on all errors)
> +
> +    Returns:
> +        val if val is a list, None if not
> +
> +    Raises
> +        FdtException if val indicates an error was reported and the error
> +        is not in @quiet.
> +    """
> +    # Normally a tuple is returned which contains the data and its lengt=
h.
> +    # If we get just an integer error code, it means the function failed.
> +    if not isinstance(val, list):
> +        if -val not in quiet:
> +            raise FdtException(val)
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
> +    All methods raise an FdtException if an error occurs. To avoid this
> +    behaviour a 'quiet' parameter is provided for some functions. This
> +    defaults to empty, but you can pass a list of errors that you expect.
> +    If one of these errors occurs, the function will return an error num=
ber
> +    (e.g. -NOTFOUND).
> +    """
> +    def __init__(self, data):
> +        self._fdt =3D bytearray(data)
> +        check_err(fdt_check_header(self._fdt));
> +
> +    def path_offset(self, path, quiet=3D[]):
> +        """Get the offset for a given path
> +
> +        Args:
> +            path: Path to the required node, e.g. '/node@3/subnode@1'
> +            quiet: Errors to ignore (empty to raise on all errors)
> +
> +        Returns:
> +            Node offset
> +
> +        Raises
> +            FdtException if the path is not valid or not found
> +        """
> +        return check_err(fdt_path_offset(self._fdt, path), quiet)
> +
> +    def first_property_offset(self, nodeoffset, quiet=3D[]):
> +        """Get the offset of the first property in a node offset
> +
> +        Args:
> +            nodeoffset: Offset to the node to check
> +            quiet: Errors to ignore (empty to raise on all errors)
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
),
> +                         quiet)
> +
> +    def next_property_offset(self, prop_offset, quiet=3D[]):
> +        """Get the next property in a node
> +
> +        Args:
> +            prop_offset: Offset of the previous property
> +            quiet: Errors to ignore (empty to raise on all errors)
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
),
> +                         quiet)
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
> +    def get_property_by_offset(self, prop_offset, quiet=3D[]):
> +        """Obtains a property that can be examined
> +
> +        Args:
> +            prop_offset: Offset of property (e.g. from first_property_of=
fset())
> +            quiet: Errors to ignore (empty to raise on all errors)
> +
> +        Returns:
> +            Property object, or None if not found
> +
> +        Raises:
> +            FdtException on error (e.g. invalid prop_offset or device
> +            tree format)
> +        """
> +        pdata =3D check_err_null(
> +                fdt_get_property_by_offset(self._fdt, prop_offset), quie=
t)
> +        if isinstance(pdata, (int)):
> +            return pdata
> +        return Property(self, pdata[0])
> +
> +    def first_subnode(self, nodeoffset, quiet=3D[]):
> +        """Find the first subnode of a parent node
> +
> +        Args:
> +            nodeoffset: Node offset of parent node
> +            quiet: Errors to ignore (empty to raise on all errors)
> +
> +        Returns:
> +            The offset of the first subnode, if any
> +
> +        Raises:
> +            FdtException if no subnode found or other error occurs
> +        """
> +        return check_err(fdt_first_subnode(self._fdt, nodeoffset), quiet)
> +
> +    def next_subnode(self, nodeoffset, quiet=3D[]):
> +        """Find the next subnode
> +
> +        Args:
> +            nodeoffset: Node offset of previous subnode
> +            quiet: Errors to ignore (empty to raise on all errors)
> +
> +        Returns:
> +            The offset of the next subnode, if any
> +
> +        Raises:
> +            FdtException if no more subnode found or other error occurs
> +        """
> +        return check_err(fdt_next_subnode(self._fdt, nodeoffset), quiet)
> +
> +    def totalsize(self):
> +        """Return the total size of the device tree
> +
> +        Returns:
> +            Total tree size in bytes
> +        """
> +        return check_err(fdt_totalsize(self._fdt))
> +
> +    def off_dt_struct(self):
> +        """Return the start of the device tree struct area
> +
> +        Returns:
> +            Start offset of struct area
> +        """
> +        return check_err(fdt_off_dt_struct(self._fdt))
> +
> +    def pack(self, quiet=3D[]):
> +        """Pack the device tree to remove unused space
> +
> +        This adjusts the tree in place.
> +
> +        Args:
> +            quiet: Errors to ignore (empty to raise on all errors)
> +
> +        Raises:
> +            FdtException if any error occurs
> +        """
> +        return check_err(fdt_pack(self._fdt), quiet)
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
> +    def getprop(self, nodeoffset, prop_name, quiet=3D[]):
> +        """Get a property from a node
> +
> +        Args:
> +            nodeoffset: Node offset containing property to get
> +            prop_name: Name of property to get
> +            quiet: Errors to ignore (empty to raise on all errors)
> +
> +        Returns:
> +            Value of property as a string, or -ve error number
> +
> +        Raises:
> +            FdtError if any error occurs (e.g. the property is not found)
> +        """
> +        pdata =3D check_err_null(fdt_getprop(self._fdt, nodeoffset, prop=
_name),
> +                               quiet)
> +        if isinstance(pdata, (int)):
> +            return pdata
> +        return pdata[0]
> +
> +
> +class Property:
> +    """Holds a device tree property name and value.
> +
> +    This holds a copy of a property taken from the device tree. It does =
not
> +    reference the device tree, so if anything changes in the device tree,
> +    a Property object will remain valid.
> +
> +    Properties:
> +        name: Property name
> +        value: Proper value as a bytearray
> +    """
> +    def __init__(self, fdt, pdata):
> +        self.name =3D fdt_string(fdt._fdt, fdt32_to_cpu(pdata.nameoff))
> +        self.value =3D bytearray(fdt32_to_cpu(pdata.len))
> +        pylibfdt_copy_value(self.value, pdata)
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
> + * pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_pylibfdt_copy_valu=
e=E2=80=99:
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
> +void pylibfdt_copy_value(char *str, size_t size,
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
> + * pylibfdt_copy_value() - Copy value from a property to the given buffer
> + *
> + * This is used by the Property class to place the contents of a property
> + * into a bytearray.
> + *
> + * @buf: Destination pointer (typically the start of the bytearray)
> + * @size: Number of bytes to copy (size of bytearray)
> + * @prop: Property to copy
> + */
> +void pylibfdt_copy_value(char *buf, size_t size, const struct fdt_proper=
ty *prop)
> +{
> +	memcpy(buf, prop + 1, size);
> +}
> +
> +%}
> +
> +%apply int *OUTPUT { int *lenp };
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
> +
> +%include <../libfdt/libfdt.h>
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

--fUvfsPTz/SzOZDdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYo+uLAAoJEGw4ysog2bOSOC0QAKrwgVdfW43ChYTeYNE/Jqjl
18g3HILATdvWwQaWoJU38BPxSZFUo57G0CYMxD9Qr07udypRtsqJ2MDXhIhXZObP
ifgSQgaRXC7YUT2GOyPTaCQemHcqZKCokfG07nkQtsUvG8+hT1unk1dsKFDGGUfi
1kHDV7rM/+hLECpdmI3Hf4YeC4W164NLXZp5snQ5+qUxb65fWJDcpcKtfsE7Am/p
pq689jPX7Ca6zOUe0ayTBerfjYiJMu9zsUYdKj44fNDN1ZAY5NigdYyJHNxGAUrl
6KvgWerfIrLvtosxldkrUtD4UswtDmxmxTWwodSlWXpN6VCM6kPWJbiS/26wD6sm
QVCxPd1HambPI5FDPldYlI+RX+5T7fi0BptHViuNt/5d7xWwTBTsLNlVfogG9a7T
fg/FABUTgZS+W/O4oUidhDEha+pgBGyqs3FAZFcEgJDEAtkYcdFaVYNA+7jpVOuC
k7NJ3Oi+/HhF8bN8ZeVHycXycEcvzPQ61456gCbhO4XydAkcEoovRdMNK5piR4Ol
1fCPi9EmAkgNAmmeN5I24JYEpjHxqxlHtP2QKJNhHG81pdxZ/7KD37xbTIVW/gmm
07hOUPiWRCKeYSX5gOGyw/aX7td2AyfSa4gikS8j7rg3F1HMEbAO18Or8w/wAJLI
Zp1t/RuBpe/W+zWnNeT6
=iY06
-----END PGP SIGNATURE-----

--fUvfsPTz/SzOZDdw--
