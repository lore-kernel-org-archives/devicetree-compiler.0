From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/4] Add an initial Python library for libfdt
Date: Thu, 24 Nov 2016 11:07:19 -0700
Message-ID: <1480010842-13957-2-git-send-email-sjg@chromium.org>
References: <1480010842-13957-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ssEjSz0AmjrAQr01XRNxjRGcQnYjXGQwYjdcDoYvJxU=;
        b=QD5b7cK36Cb9VaSmc0XnW543mf/e5cgXyfj+ofKdPwGPepVVP3VQ9NEEyoIVmx92zN
         /S8mRRhpvFZRGSxZnzeJC8OmlOOXQMsZYTGMuoDL3/rMYG40SIZYcIya/zw23dxEClqp
         0eR1K54B/VJaEJ3FFfjpL8pweFChJk1/sUGJvm57p9/8JjFA6iz8dp2tXLLpjF/zYCRs
         uZPEibKsgjZ8xrRSygb9Y9kFM5AYOX+H9QEnKlk35lNpHY6lqa1Q8tJCCNIqtGb0/C5B
         kP2OrrsA4hJHRhcQaJKV+66EmzhUs321Vs1kgFA8XDZcqNr32WTIHhwCcG+qpbp9Bz2Q
         BJiw==
In-Reply-To: <1480010842-13957-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add Python bindings for a bare-bones set of libfdt functions. These allow
navigating the tree and reading node names and properties.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2:
- Add exceptions when functions return an error
- Correct Python naming to following PEP8
- Use a class to encapsulate the various methods
- Include fdt.h instead of redefining struct fdt_property
- Use bytearray to avoid the SWIG warning 454
- Add comments

 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  21 +++
 pylibfdt/libfdt.swig       | 427 +++++++++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 ++++
 4 files changed, 485 insertions(+)
 create mode 100644 pylibfdt/.gitignore
 create mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pylibfdt/libfdt.swig
 create mode 100644 pylibfdt/setup.py

diff --git a/pylibfdt/.gitignore b/pylibfdt/.gitignore
new file mode 100644
index 0000000..5e8c5e3
--- /dev/null
+++ b/pylibfdt/.gitignore
@@ -0,0 +1,3 @@
+libfdt.py
+libfdt.pyc
+libfdt_wrap.c
diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
new file mode 100644
index 0000000..fbdbca5
--- /dev/null
+++ b/pylibfdt/Makefile.pylibfdt
@@ -0,0 +1,21 @@
+# Makefile.pylibfdt
+#
+# This is not a complete Makefile of itself.  Instead, it is designed to
+# be easily embeddable into other systems of Makefiles.
+#
+
+PYLIBFDT_srcs = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_SRCS))
+WRAP = $(PYLIBFDT_objdir)/libfdt_wrap.c
+PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
+
+$(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
+	@$(VECHO) PYMOD $@
+	python $(PYLIBFDT_objdir)/setup.py "$(CPPFLAGS)" $^
+	mv _libfdt.so $(PYMODULE)
+
+$(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
+	@$(VECHO) SWIG $@
+	swig -python -o $@ $<
+
+PYLIBFDT_cleanfiles = libfdt_wrap.c libfdt.py libfdt.pyc
+PYLIBFDT_CLEANFILES = $(addprefix $(PYLIBFDT_objdir)/,$(PYLIBFDT_cleanfiles))
diff --git a/pylibfdt/libfdt.swig b/pylibfdt/libfdt.swig
new file mode 100644
index 0000000..98ad0d6
--- /dev/null
+++ b/pylibfdt/libfdt.swig
@@ -0,0 +1,427 @@
+/*
+ * pylibfdt - Flat Device Tree manipulation in Python
+ * Copyright (C) 2016 Google, Inc.
+ * Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+ *
+ * libfdt is dual licensed: you can use it either under the terms of
+ * the GPL, or the BSD license, at your option.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ *     You should have received a copy of the GNU General Public
+ *     License along with this library; if not, write to the Free
+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+ *     MA 02110-1301 USA
+ *
+ * Alternatively,
+ *
+ *  b) Redistribution and use in source and binary forms, with or
+ *     without modification, are permitted provided that the following
+ *     conditions are met:
+ *
+ *     1. Redistributions of source code must retain the above
+ *        copyright notice, this list of conditions and the following
+ *        disclaimer.
+ *     2. Redistributions in binary form must reproduce the above
+ *        copyright notice, this list of conditions and the following
+ *        disclaimer in the documentation and/or other materials
+ *        provided with the distribution.
+ *
+ *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+ *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
+ *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+ *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
+ *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+ *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+ *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
+ *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+%module libfdt
+
+%{
+#define SWIG_FILE_WITH_INIT
+#include "libfdt.h"
+%}
+
+%pythoncode %{
+
+import struct
+
+# Error codes, corresponding to FDT_ERR_... in libfdt.h
+(NOTFOUND,
+        EXISTS,
+        NOSPACE,
+        BADOFFSET,
+        BADPATH,
+        BADPHANDLE,
+        BADSTATE,
+        TRUNCATED,
+        BADMAGIC,
+        BADVERSION,
+        BADSTRUCTURE,
+        BADLAYOUT,
+        INTERNAL,
+        BADNCELLS,
+        BADVALUE,
+        BADOVERLAY) = range(1, 17)
+
+
+def fdt32_to_cpu(val):
+    """Convert a device-tree cell value into a native integer"""
+    return struct.unpack("=I", struct.pack(">I", val))[0]
+
+def data(prop):
+    """Extract the data from a property
+
+    Args:
+        prop: Property structure, as returned by get_property_by_offset()
+
+    Returns:
+        The property data as a bytearray
+    """
+    buf = bytearray(fdt32_to_cpu(prop.len))
+    pylibfdt_copy_data(buf, prop)
+    return buf
+
+
+class Fdt:
+    """Device tree class, supporting all operations
+
+    The Fdt object is created is created from a device tree binary file,
+    e.g. with something like:
+
+       fdt = Fdt(open("filename.dtb").read())
+
+    Operations can then be performed using the methods in this class. Each
+    method xxx(args...) corresponds to a libfdt function fdt_xxx(fdt, args...).
+
+    Almost all methods raise a RuntimeException if an error occurs. The
+    following do not:
+
+        string() - since it has no error checking
+        strerror() - since it always returns a valid string
+
+    To avoid this behaviour a 'quiet' version is provided for some functions.
+    This behaves as for the normal version except that it will not raise
+    an exception in the case of an FDT_ERR_NOTFOUND error: it will simply
+    return the -NOTFOUND error code.
+    """
+    def __init__(self, data):
+        self._fdt = bytearray(data)
+
+    def string(self, offset):
+        """Get a string given its offset
+
+        Args:
+            offset: FDT offset in big-endian format
+
+        Returns:
+            string value at that offset
+        """
+        return fdt_string(self._fdt, fdt32_to_cpu(offset))
+
+    def data(self, prop):
+        """Special member function to return the data from a property"""
+        return data(prop)
+
+    def path_offset(self, path):
+        return fdt_path_offset(self._fdt, path)
+
+    def first_property_offset(self, nodeoffset):
+        return fdt_first_property_offset(self._fdt, nodeoffset)
+
+    def first_property_offset_quiet(self, nodeoffset):
+        return fdt_first_property_offset_quiet(self._fdt, nodeoffset)
+
+    def next_property_offset(self, prop_offset):
+        return fdt_next_property_offset(self._fdt, prop_offset)
+
+    def next_property_offset_quiet(self, prop_offset):
+        return fdt_next_property_offset_quiet(self._fdt, prop_offset)
+
+    def get_name(self, nodeoffset):
+        return fdt_get_name(self._fdt, nodeoffset)
+
+    def get_property_by_offset(self, prop_offset):
+        """Obtains a property that can be examined
+
+        Args:
+            prop_offset: Offset of property (e.g. from first_property_offset())
+
+        Returns:
+            Property object with members:
+                tag: Big-endian device tree tag value
+                len: Big-endian property length
+                nameoff: Big-endian string offset for use with string()
+
+            Use data() on the return value to obtain the property value.
+
+        Raises:
+            RuntimeException on error (e.g. invalid prop_offset or device
+            tree format)
+        """
+        return fdt_get_property_by_offset(self._fdt, prop_offset)[0]
+
+    def strerror(self, fdt_err):
+        return fdt_strerror(fdt_err)
+
+    def first_subnode(self, nodeoffset):
+        return fdt_first_subnode(self._fdt, nodeoffset)
+
+    def first_subnode_quiet(self, nodeoffset):
+        return fdt_first_subnode_quiet(self._fdt, nodeoffset)
+
+    def next_subnode(self, nodeoffset):
+        return fdt_next_subnode(self._fdt, nodeoffset)
+
+    def next_subnode_quiet(self, nodeoffset):
+        return fdt_next_subnode_quiet(self._fdt, nodeoffset)
+
+    def totalsize(self):
+        return fdt_totalsize(self._fdt)
+
+    def off_dt_struct(self):
+        return fdt_off_dt_struct(self._fdt)
+
+    def pack(self):
+        return fdt_pack(self._fdt)
+
+    def delprop(self, nodeoffset, prop_name):
+        return fdt_delprop(self._fdt, nodeoffset, prop_name)
+%}
+
+typedef int fdt32_t;
+
+%include "libfdt/fdt.h"
+
+%include "typemaps.i"
+
+%typemap(in) void * = char *;
+
+/*
+ * Unfortunately the defintiion of pybuffer_mutable_binary() in my Python
+ * version appears to be broken:
+ * pylibfdt/libfdt_wrap.c: In function ‘_wrap_pylibfdt_copy_data’:
+ * pylibfdt/libfdt_wrap.c:3603:22: error: ‘size’ undeclared (first use in this
+ * function)
+ *   arg2 = (size_t) (size/sizeof(char));
+ *
+ * This version works correctly.
+ */
+%define %mypybuffer_mutable_binary(TYPEMAP, SIZE)
+%typemap(in) (TYPEMAP, SIZE)(int res, Py_ssize_t size = 0, void *buf = 0)
+{
+	res = PyObject_AsWriteBuffer($input, &buf, &size);
+	if (res < 0) {
+		PyErr_Clear();
+		%argument_fail(res, "(TYPEMAP, SIZE)", $symname, $argnum);
+	}
+	$1 = ($1_ltype)buf;
+	$2 = ($2_ltype)(size1 / sizeof($*1_type));
+}
+%enddef
+
+/* This is used to copy property data into a bytearray */
+%mypybuffer_mutable_binary(char *str, size_t size);
+void pylibfdt_copy_data(char *str, size_t size,
+			const struct fdt_property *prop);
+
+/* Most functions don't change the device tree, so use a const void * */
+%typemap(in) (const void *) {
+    if (!PyByteArray_Check($input)) {
+        SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname"
+                            "', argument " "$argnum"" of type '" "$type""'");
+  }
+  $1 = (void *)PyByteArray_AsString($input);
+}
+
+/* Some functions do change the device tree, so use void * */
+%typemap(in) (void *) {
+    if (!PyByteArray_Check($input)) {
+        SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname"
+                            "', argument " "$argnum"" of type '" "$type""'");
+  }
+  $1 = PyByteArray_AsString($input);
+}
+
+%inline %{
+
+/**
+ * pylibfdt_copy_data() - Copy data from a property to the given buffer
+ *
+ * This is used by the data() function to place the contents of a property
+ * into a bytearray.
+ *
+ * @buf: Destination pointer (typically the start of the bytearray)
+ * @size: Number of bytes to copy (size of bytearray)
+ * @prop: Property to copy
+ */
+void pylibfdt_copy_data(char *buf, size_t size, const struct fdt_property *prop)
+{
+	memcpy(buf, prop + 1, size);
+}
+
+/**
+ * pylibfdt_record_error() - Records an exception with SWIG
+ *
+ * This causes an exception to be raised when we return back to Python.
+ *
+ * @err: Negative FDT error code value to use (-FDT_ERR_...)
+ *
+ * TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Can we define a LibfdtException class to return
+ * instead of RuntimeError?
+ */
+static void pylibfdt_record_error(int err)
+{
+	static char msg[80];
+
+	snprintf(msg, sizeof(msg), "pylibfdt error %d: %s", err,
+		 fdt_strerror(err));
+	SWIG_Error(SWIG_RuntimeError, msg);
+}
+
+%}
+
+/* Check the return value and generation an exception if there is an error */
+#define INT_EXC(_func) \
+	%exception _func \
+	{ \
+		$action \
+		if (result < 0) { \
+			pylibfdt_record_error(result); \
+			return NULL; \
+		} \
+	}
+
+/*
+ * Check the return value and generation an exception if there is an error
+ * other that FDT_ERR_NOTFOUND. This is used for 'quiet' versions of
+ * functions which can fail to find something, but don't want to raise an
+ * exception in that case.
+ */
+#define QUIET_EXC(_func) \
+        %exception _func \
+        { \
+                $action \
+                if (result < 0 && result != -FDT_ERR_NOTFOUND) { \
+                        pylibfdt_record_error(result); \
+                        return NULL; \
+                } \
+        }
+
+/* Check the return value and generation an exception if NULL */
+#define NULL_EXC(_func) \
+    %exception _func { \
+        $action \
+        if (!result) { \
+                pylibfdt_record_error(*arg3); \
+                return NULL; \
+        } \
+    }
+
+
+/*
+ * From here are the function definitions from libfdt.h, along with their
+ * exception-handling code.
+ */
+INT_EXC(fdt_path_offset)
+int fdt_path_offset(const void *fdt, const char *path);
+
+INT_EXC(fdt_first_property_offset)
+int fdt_first_property_offset(const void *fdt, int nodeoffset);
+
+QUIET_EXC(fdt_first_property_offset_quiet)
+int fdt_first_property_offset_quiet(const void *fdt, int nodeoffset);
+
+INT_EXC(fdt_next_property_offset)
+int fdt_next_property_offset(const void *fdt, int offset);
+
+QUIET_EXC(fdt_next_property_offset_quiet)
+int fdt_next_property_offset_quiet(const void *fdt, int prop_offset);
+
+NULL_EXC(fdt_get_name)
+const char *fdt_get_name(const void *fdt, int nodeoffset, int *OUTPUT);
+
+/* no exception handling, since this function has no error checking */
+const char *fdt_string(const void *fdt, int stroffset);
+
+/*
+ * TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Consider making this return a class so we can do
+ * things like:
+ *
+ *    prop = fdt.get_property_by_offset(offset)
+ *    prop.name
+ *    prop.data
+ *
+ * The same could perhaps be done with nodes.
+ */
+NULL_EXC(fdt_get_property_by_offset)
+const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
+                                                      int offset,
+                                                      int *OUTPUT);
+
+/* no exception handling, this this function always returns a valid string */
+const char *fdt_strerror(int errval);
+
+INT_EXC(fdt_first_subnode)
+int fdt_first_subnode(const void *fdt, int offset);
+
+QUIET_EXC(fdt_first_subnode_quiet)
+int fdt_first_subnode_quiet(const void *fdt, int offset);
+
+INT_EXC(fdt_next_subnode)
+int fdt_next_subnode(const void *fdt, int offset);
+
+QUIET_EXC(fdt_next_subnode_quiet)
+int fdt_next_subnode_quiet(const void *fdt, int offset);
+
+INT_EXC(fdt_delprop)
+int fdt_delprop(void *fdt, int nodeoffset, const char *name);
+
+INT_EXC(fdt_pack)
+int fdt_pack(void *fdt);
+
+INT_EXC(fdt_totalsize)
+int fdt_totalsize(const void *fdt);
+
+INT_EXC(fdt_off_dt_struct)
+int fdt_off_dt_struct(const void *fdt);
+
+%inline %{
+
+/* These are simple converters from the quiet functions to the real ones */
+int fdt_first_property_offset_quiet(const void *fdt, int nodeoffset)
+{
+    return fdt_first_property_offset(fdt, nodeoffset);
+}
+
+int fdt_next_property_offset_quiet(const void *fdt, int prop_offset)
+{
+    return fdt_next_property_offset(fdt, prop_offset);
+}
+
+int fdt_first_subnode_quiet(const void *fdt, int nodeoffset)
+{
+    return fdt_first_subnode(fdt, nodeoffset);
+}
+
+int fdt_next_subnode_quiet(const void *fdt, int offset)
+{
+    return fdt_next_subnode(fdt, offset);
+}
+
+%}
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
new file mode 100644
index 0000000..8f8618e
--- /dev/null
+++ b/pylibfdt/setup.py
@@ -0,0 +1,34 @@
+#!/usr/bin/env python
+
+"""
+setup.py file for SWIG libfdt
+"""
+
+from distutils.core import setup, Extension
+import os
+import sys
+
+progname = sys.argv[0]
+cflags = sys.argv[1]
+files = sys.argv[2:]
+
+if cflags:
+    cflags = [flag for flag in cflags.split(' ') if flag]
+else:
+    cflags = None
+
+libfdt_module = Extension(
+    '_libfdt',
+    sources = files,
+    extra_compile_args =  cflags
+)
+
+sys.argv = [progname, '--quiet', 'build_ext', '--inplace']
+
+setup (name = 'libfdt',
+       version = '0.1',
+       author      = "SWIG Docs",
+       description = """Simple swig libfdt from docs""",
+       ext_modules = [libfdt_module],
+       py_modules = ["libfdt"],
+       )
-- 
2.8.0.rc3.226.g39d4020
