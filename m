From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/4] Add an initial Python library for libfdt
Date: Fri, 25 Nov 2016 09:49:08 +1100
Message-ID: <20161124224908.GH23872@umbus.fritz.box>
References: <1480010842-13957-1-git-send-email-sjg@chromium.org>
 <1480010842-13957-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Dx9iWuMxHO1cCoFc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1480027991;
        bh=4teuvPXysuNpQ9mamKhFsboj12Iy1/T+mffwcIwTTTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ASO+RsjizqObR+x0sRKhJzFu/M3DAEfVwiQglG3A+di6kAw082WcjD3N0MFNrycBn
         mBQJMcC+6moUr82611Y61bb7YS28mqphTnrgT8cViawaYf4Mx8GyzQeHdtl2Tt1uwa
         9mMz4QZT1VzAHnIZcId+nRYj/VokfBS04nK/QeGI=
Content-Disposition: inline
In-Reply-To: <1480010842-13957-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 11:07:19AM -0700, Simon Glass wrote:
> Add Python bindings for a bare-bones set of libfdt functions. These allow
> navigating the tree and reading node names and properties.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
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
>  pylibfdt/Makefile.pylibfdt |  21 +++
>  pylibfdt/libfdt.swig       | 427 +++++++++++++++++++++++++++++++++++++++=
++++++
>  pylibfdt/setup.py          |  34 ++++
>  4 files changed, 485 insertions(+)
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
> index 0000000..fbdbca5
> --- /dev/null
> +++ b/pylibfdt/Makefile.pylibfdt
> @@ -0,0 +1,21 @@
> +# Makefile.pylibfdt
> +#
> +# This is not a complete Makefile of itself.  Instead, it is designed to
> +# be easily embeddable into other systems of Makefiles.
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
> index 0000000..98ad0d6
> --- /dev/null
> +++ b/pylibfdt/libfdt.swig
> @@ -0,0 +1,427 @@
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
> +
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

I don't quite see how these property "object"s are being represented
on the Python side.  This seems a very awkward approach compared to
grapping a field within the object.

> +    buf =3D bytearray(fdt32_to_cpu(prop.len))
> +    pylibfdt_copy_data(buf, prop)
> +    return buf
> +
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
> +    Almost all methods raise a RuntimeException if an error occurs. The
> +    following do not:
> +
> +        string() - since it has no error checking
> +        strerror() - since it always returns a valid string
> +
> +    To avoid this behaviour a 'quiet' version is provided for some funct=
ions.
> +    This behaves as for the normal version except that it will not raise
> +    an exception in the case of an FDT_ERR_NOTFOUND error: it will simply
> +    return the -NOTFOUND error code.
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
> +
> +    def data(self, prop):
> +        """Special member function to return the data from a property"""
> +        return data(prop)

This shouldn't be a method, since it doesn't use the context of the
'self' parameter at all.

> +
> +    def path_offset(self, path):
> +        return fdt_path_offset(self._fdt, path)
> +
> +    def first_property_offset(self, nodeoffset):
> +        return fdt_first_property_offset(self._fdt, nodeoffset)
> +
> +    def first_property_offset_quiet(self, nodeoffset):
> +        return fdt_first_property_offset_quiet(self._fdt, nodeoffset)
> +
> +    def next_property_offset(self, prop_offset):
> +        return fdt_next_property_offset(self._fdt, prop_offset)
> +
> +    def next_property_offset_quiet(self, prop_offset):
> +        return fdt_next_property_offset_quiet(self._fdt, prop_offset)
> +
> +    def get_name(self, nodeoffset):
> +        return fdt_get_name(self._fdt, nodeoffset)
> +
> +    def get_property_by_offset(self, prop_offset):
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
> +            RuntimeException on error (e.g. invalid prop_offset or device
> +            tree format)
> +        """
> +        return fdt_get_property_by_offset(self._fdt, prop_offset)[0]
> +
> +    def strerror(self, fdt_err):
> +        return fdt_strerror(fdt_err)

Likewise this should not be a method.

> +    def first_subnode(self, nodeoffset):
> +        return fdt_first_subnode(self._fdt, nodeoffset)
> +
> +    def first_subnode_quiet(self, nodeoffset):
> +        return fdt_first_subnode_quiet(self._fdt, nodeoffset)
> +
> +    def next_subnode(self, nodeoffset):
> +        return fdt_next_subnode(self._fdt, nodeoffset)
> +
> +    def next_subnode_quiet(self, nodeoffset):
> +        return fdt_next_subnode_quiet(self._fdt, nodeoffset)
> +
> +    def totalsize(self):
> +        return fdt_totalsize(self._fdt)
> +
> +    def off_dt_struct(self):
> +        return fdt_off_dt_struct(self._fdt)
> +
> +    def pack(self):
> +        return fdt_pack(self._fdt)
> +
> +    def delprop(self, nodeoffset, prop_name):
> +        return fdt_delprop(self._fdt, nodeoffset, prop_name)
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
> +/**
> + * pylibfdt_record_error() - Records an exception with SWIG
> + *
> + * This causes an exception to be raised when we return back to Python.
> + *
> + * @err: Negative FDT error code value to use (-FDT_ERR_...)
> + *
> + * TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Can we define a LibfdtException class to retu=
rn
> + * instead of RuntimeError?

We certainly should, but I think you're making life too difficult for
yourself.  It's pretty standard practice in Swig to have a "raw"
interface which is the thinnest possible wrapper around the C code,
then a more Pythonic higher level wrapper, written in Python.  I think
the "raw" interface should just return error codes - just like the C.
The Pythonic wrapper can catch that and throw a LibFdtError (or
whatever) without having to dick around with swig's exception magic.


TBH.. I'm actually wondering if swig is being more trouble than it's
worth here.  Given the pretty simple datatypes that libfdt deals with,
would it be as simple or simpler to just load libfdt.so using the
ctypes module and write a Pythonic wrapper to do the various
conversions between ctypes.c_char_p and string/bytes buffers.

> + */
> +static void pylibfdt_record_error(int err)
> +{
> +	static char msg[80];
> +
> +	snprintf(msg, sizeof(msg), "pylibfdt error %d: %s", err,
> +		 fdt_strerror(err));
> +	SWIG_Error(SWIG_RuntimeError, msg);
> +}
> +
> +%}
> +
> +/* Check the return value and generation an exception if there is an err=
or */
> +#define INT_EXC(_func) \
> +	%exception _func \
> +	{ \
> +		$action \
> +		if (result < 0) { \
> +			pylibfdt_record_error(result); \
> +			return NULL; \
> +		} \
> +	}
> +
> +/*
> + * Check the return value and generation an exception if there is an err=
or
> + * other that FDT_ERR_NOTFOUND. This is used for 'quiet' versions of
> + * functions which can fail to find something, but don't want to raise an
> + * exception in that case.
> + */
> +#define QUIET_EXC(_func) \
> +        %exception _func \
> +        { \
> +                $action \
> +                if (result < 0 && result !=3D -FDT_ERR_NOTFOUND) { \
> +                        pylibfdt_record_error(result); \
> +                        return NULL; \
> +                } \
> +        }
> +
> +/* Check the return value and generation an exception if NULL */
> +#define NULL_EXC(_func) \
> +    %exception _func { \
> +        $action \
> +        if (!result) { \
> +                pylibfdt_record_error(*arg3); \
> +                return NULL; \
> +        } \
> +    }
> +
> +
> +/*
> + * From here are the function definitions from libfdt.h, along with their
> + * exception-handling code.
> + */
> +INT_EXC(fdt_path_offset)
> +int fdt_path_offset(const void *fdt, const char *path);
> +
> +INT_EXC(fdt_first_property_offset)
> +int fdt_first_property_offset(const void *fdt, int nodeoffset);
> +
> +QUIET_EXC(fdt_first_property_offset_quiet)
> +int fdt_first_property_offset_quiet(const void *fdt, int nodeoffset);
> +
> +INT_EXC(fdt_next_property_offset)
> +int fdt_next_property_offset(const void *fdt, int offset);
> +
> +QUIET_EXC(fdt_next_property_offset_quiet)
> +int fdt_next_property_offset_quiet(const void *fdt, int prop_offset);
> +
> +NULL_EXC(fdt_get_name)
> +const char *fdt_get_name(const void *fdt, int nodeoffset, int *OUTPUT);
> +
> +/* no exception handling, since this function has no error checking */
> +const char *fdt_string(const void *fdt, int stroffset);
> +
> +/*
> + * TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Consider making this return a class so we can=
 do
> + * things like:
> + *
> + *    prop =3D fdt.get_property_by_offset(offset)
> + *    prop.name
> + *    prop.data
> + *
> + * The same could perhaps be done with nodes.
> + */
> +NULL_EXC(fdt_get_property_by_offset)
> +const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
> +                                                      int offset,
> +                                                      int *OUTPUT);
> +
> +/* no exception handling, this this function always returns a valid stri=
ng */
> +const char *fdt_strerror(int errval);
> +
> +INT_EXC(fdt_first_subnode)
> +int fdt_first_subnode(const void *fdt, int offset);
> +
> +QUIET_EXC(fdt_first_subnode_quiet)
> +int fdt_first_subnode_quiet(const void *fdt, int offset);
> +
> +INT_EXC(fdt_next_subnode)
> +int fdt_next_subnode(const void *fdt, int offset);
> +
> +QUIET_EXC(fdt_next_subnode_quiet)
> +int fdt_next_subnode_quiet(const void *fdt, int offset);
> +
> +INT_EXC(fdt_delprop)
> +int fdt_delprop(void *fdt, int nodeoffset, const char *name);
> +
> +INT_EXC(fdt_pack)
> +int fdt_pack(void *fdt);
> +
> +INT_EXC(fdt_totalsize)
> +int fdt_totalsize(const void *fdt);
> +
> +INT_EXC(fdt_off_dt_struct)
> +int fdt_off_dt_struct(const void *fdt);
> +
> +%inline %{
> +
> +/* These are simple converters from the quiet functions to the real ones=
 */
> +int fdt_first_property_offset_quiet(const void *fdt, int nodeoffset)
> +{
> +    return fdt_first_property_offset(fdt, nodeoffset);
> +}
> +
> +int fdt_next_property_offset_quiet(const void *fdt, int prop_offset)
> +{
> +    return fdt_next_property_offset(fdt, prop_offset);
> +}
> +
> +int fdt_first_subnode_quiet(const void *fdt, int nodeoffset)
> +{
> +    return fdt_first_subnode(fdt, nodeoffset);
> +}
> +
> +int fdt_next_subnode_quiet(const void *fdt, int offset)
> +{
> +    return fdt_next_subnode(fdt, offset);
> +}
> +
> +%}
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

--Dx9iWuMxHO1cCoFc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYN25hAAoJEGw4ysog2bOS+BYP/Asfbdn0T/HGFTIFdDlLFPiE
dG+bB2EOfQEwr4Y+P53SwjP7gkYdRREQb3acjPaXSiqVfi629rAzQQ8cJWAtgxko
a2Cfk3W6jdKfWCYfUrCdTXx3WDYxP6z2woe6+fV9MoyLlwfxOz1biKZwZGiqAjC2
mJQmOp/W6Toaq3cxBPz70YSs1yHhoX8VE51TmmRPGJ4K/JoQXA1MdRTjgUaVO3QY
0EluJMYNIQZSkSECE/C6X4RR3NFQbvR3AOoRylkpVFqaAM8NWoA8LzsKh72HB49X
GAqri1hkrt/PbWirjxAAnrPsGWEqoQ0P0zlsvVDWykZExNma1EyIZ8FCc3W21t0h
mAovEJr1bD6qcZzms6wGpdx8vLwu34Mwq1JGmKf34dB2q6K8cmmYOSnw9V/Iluh5
oYvgWb8Qw/5AKoz+IYTAD8OpWnNtnAZfZczUDMW7QGj6xcH7EADTYEgDIOQktVhu
W4J11y53129l/Dp7qZMDioC63KxB4AlJ2hYwXZQnxur2cfe4DR2NtEyOCzrmYBeg
xljK7BULaDJWju555mWxJkK3fPEnbMBNcjjnZKkagirm0F/DBaWwbQhrMIKRckGJ
rruLbgQjSkNI2iiVNddH+9SAGgw3eob40LFoU+/wcgXcg34jV7D03/NjS7Oq+SX4
611g1gGFZBReDyt3N+ed
=oxHm
-----END PGP SIGNATURE-----

--Dx9iWuMxHO1cCoFc--
