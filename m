From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] Add an initial Python library for libfdt
Date: Fri, 18 Nov 2016 11:36:45 +1100
Message-ID: <20161118003645.GC31640@umbus.fritz.box>
References: <1479423205-9817-1-git-send-email-sjg@chromium.org>
 <1479423205-9817-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1479441293;
        bh=/+zTzW0DVBpcWyiYwQ1o4pa0vvKh9m1sSsApGzEK8m0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jZU/SglfounuwdrXS6joZrz7tV4kh28Jrn1iTU1n8q+o0Wc3pz7g59pri65I9nWd9
         AbvuVaifvrtcSRxgObmhg89KYPmoBPpyCbUK55qN58OsgTBXhzABhRpZG/JGvmf9Sj
         J54bu/0UuvMQz0QLlCd4un/feQxmSpKzxKSuoFGs=
Content-Disposition: inline
In-Reply-To: <1479423205-9817-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 03:53:22PM -0700, Simon Glass wrote:
> Add Python bindings for a bare-bones set of libfdt functions. These allow
> navigating the tree and reading node names and properties.

Nice idea.  Some nits in the details..

>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
>  pylibfdt/.gitignore        |   3 +
>  pylibfdt/Makefile.pylibfdt |  21 ++++++
>  pylibfdt/libfdt.swig       | 157 +++++++++++++++++++++++++++++++++++++++=
++++++
>  pylibfdt/setup.py          |  34 ++++++++++
>  4 files changed, 215 insertions(+)
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

So, Makefile.libfdt is explicitly designed for easily embedding libfdt
in other projecs - even ones with weird build environments, like
bootloaders.  It's less clear that that's valuable for Python
wrappers.

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
> index 0000000..91887da
> --- /dev/null
> +++ b/pylibfdt/libfdt.swig
> @@ -0,0 +1,157 @@
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
> +def Raise(errnum):
> +    raise ValueError('Error %s' % fdt_strerror(errnum))

So, first, I believe this and several things below break normal Python
capitalization conventions for functions (capital-followed-by-lower
generally indicates a class).

More importantly, wouldn't it make more sense to have an Exception
subclass for libfdt errors, rather than shuffling everything through
ValueError?

> +def Name(fdt, offset):
> +    name, len =3D fdt_get_name(fdt, offset)
> +    return name
> +
> +def String(fdt, offset):
> +    offset =3D fdt32_to_cpu(offset)
> +    name =3D fdt_string(fdt, offset)
> +    return name
> +
> +def fdt32_to_cpu(val):
> +    return struct.unpack("=3DI", struct.pack(">I", val))[0]
> +
> +def Data(prop):
> +    set_prop(prop)
> +    return get_prop_data()
> +%}
> +
> +%include "typemaps.i"
> +%include "cstring.i"
> +
> +%typemap(in) void* =3D char*;
> +
> +typedef int fdt32_t;
> +
> +struct fdt_property {
> +        fdt32_t tag;
> +        fdt32_t len;
> +        fdt32_t nameoff;
> +        char data[0];
> +};

Can't you include this directly from fdt.h?  That header is guaranteed
never to have actual function definitions, just data structures and
constants.

> +/*
> + * This is a work-around since I'm not sure of a better way to copy out =
the
> + * contents of a string. This is used in dtoc/GetProps(). The intent is =
to
> + * pass in a pointer to a property and access the data field at the end =
of
> + * it. Ideally the Data() function above would be able to do this direct=
ly,
> + * but I'm not sure how to do that. Needs another look.
> + */
> +#pragma SWIG nowarn=3D454
> +%inline %{
> +    static struct fdt_property *cur_prop;
> +
> +    void set_prop(struct fdt_property *prop) {
> +        cur_prop =3D prop;
> +    }

Eugh... a global variable making this totally non thread safe.  You
really need a better solution.  Property values you should be able to
represent nicely as Python strings (since unlike C strings, those can
include embedded \0).  Uh.. I guess that's 'bytes' for Python3

Of course, in the other direction, node and property names can't
include \0, so you probably need some sort of exception if a Python
string which includes them is passed in.

> +%}
> +
> +%cstring_output_allocate_size(char **s, int *sz, free(*$1));
> +%inline %{
> +    void get_prop_data(char **s, int *sz) {
> +        *sz =3D fdt32_to_cpu(cur_prop->len);
> +        *s =3D (char *)malloc(*sz);
> +        if (!*s)
> +            *sz =3D 0;
> +        else
> +            memcpy(*s, cur_prop + 1, *sz);
> +    }
> +%}
> +
> +%typemap(in) (const void *) {
> +  if (!PyByteArray_Check($input)) {
> +    SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname" "', arg=
ument "
> +                       "$argnum"" of type '" "$type""'");
> +  }
> +  $1 =3D (void *) PyByteArray_AsString($input);
> +}
> +
> +int fdt_path_offset(const void *fdt, const char *path);
> +int fdt_first_property_offset(const void *fdt, int nodeoffset);
> +int fdt_next_property_offset(const void *fdt, int offset);
> +const char *fdt_get_name(const void *fdt, int nodeoffset, int *OUTPUT);
> +const char *fdt_string(const void *fdt, int stroffset);
> +const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
> +                                                      int offset,
> +                                                      int *OUTPUT);
> +const char *fdt_strerror(int errval);
> +int fdt_first_subnode(const void *fdt, int offset);
> +int fdt_next_subnode(const void *fdt, int offset);
> +
> +%typemap(in) (void *) {
> +  if (!PyByteArray_Check($input)) {
> +    SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname" "', arg=
ument "
> +                       "$argnum"" of type '" "$type""'");
> +  }
> +  $1 =3D PyByteArray_AsString($input);
> +}
> +
> +int fdt_delprop(void *fdt, int nodeoffset, const char *name);
> +
> +int fdt_pack(void *fdt);
> +
> +int fdt_totalsize(const void *fdt);
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
> +       description =3D """Simple swig libfdt from docs""",
> +       ext_modules =3D [libfdt_module],
> +       py_modules =3D ["libfdt"],
> +       )

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYLk0aAAoJEGw4ysog2bOSJi4P/2+zN1Zh6SEKu0cFR98W5++C
ne4lfRyCnIARnLpC7h+5ZRn36Aa2QeSz/DN+LUbgf618kBphmFBp+FdwP/O3zZuU
oBP7H8fav31gxKehBtYVgdDOi5+niPidmdlj3cwX9Lta3IfEQDV/XVWAOWTwLI3N
GoB2ENqzkgi8csgZzfqGnTmDhw3hZGvDs/ea1pSHs5s18WIuKiJLT1sUyT/awJcQ
wcR19Z5Qlw6s2jxhZ9vp81a+99sPRG7vsd1T41b/O/+cb2KzvF8vQ5vpoaqLNWRE
Ga3CwA7gqRHeCCU+EEMOqci+rRjxjxJn63qWnZsTR58qLtfxdXaYxv3wD4rfRKkG
zNe5sfnnDvpdlXK7GnnzWaVkg14ookXDYMdT8Dh1GD6zYx/ZjT6f+/WmObttKZ0t
YJg3YoZXuhu42AcZdHld9RFSN/Cf2SXbqxiD+6lBmDzTesSC9megQZ3rEUB8L8Ei
AUQnmyBc7qxc7We/SXkUJcS5fxVeoJQwctfuGMyHTrSHVyJFfwa+DtWgvNmld+tr
Dcz/gIGVJtloRzKsYZ+WEnp/sAra3h3CPyxjScE4JgO7/F9wCjEardcp1wuaf3XO
VCjVUNH8gr2DHatyZJW/2LYOZ0+3hl1Waqe5y4/aPzqQ2hP7e1/WjHiQqTYg1psF
1ra8sZEWKJo+Z2hx2e0j
=lfcH
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
