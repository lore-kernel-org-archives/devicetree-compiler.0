From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/4] Add an initial Python library for libfdt
Date: Sat,  3 Dec 2016 17:48:07 -0700
Message-ID: <1480812490-11926-2-git-send-email-sjg@chromium.org>
References: <1480812490-11926-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W4jeTAdOmlMjNOVlnDiI2M8T+1Ic43kiZbYW+deXHZM=;
        b=PGLsk9WWqnXxgQnC3n20k4iF2vfe5epFiubuFpuXWTeusxo9wbsIDamm3795Gw+5cw
         GKYT9w7kPPMDAaOb4bHXhq5QGi6YkLBtRzkup2WviY8Uj7rSKFf+zlb1Cy0pUD4vH6MY
         H1dEXnxhp4HEvMQ6IS/p1DrHtLSWHnXmrNHy+dsu7tgyn910FM3YnmXV5Mq9XD0q5+/H
         pHbw4/cHSaacaluZmjsjmH4hTW3POr7snzb2Hx47xmkEWOHmteX253jt+SBg/mwN1dcC
         KcsM4FK3aJwSdPA6Fz/NHUJE/QjIrN7dkEVogMa47ySxIOV/FQ0vPQe6Fd9Js5LKTeAa
         nxnQ==
In-Reply-To: <1480812490-11926-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add Python bindings for a bare-bones set of libfdt functions. These allow
navigating the tree and reading node names and properties.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v3:
- Make the library more pythonic
- Add classes for Node and Prop along with methods
- Add an exception class
- Use Python to generate exeptions instead of SWIG

Changes in v2:
- Add exceptions when functions return an error
- Correct Python naming to following PEP8
- Use a class to encapsulate the various methods
- Include fdt.h instead of redefining struct fdt_property
- Use bytearray to avoid the SWIG warning 454
- Add comments

 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  18 ++
 pylibfdt/libfdt.swig       | 602 +++++++++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 +++
 4 files changed, 657 insertions(+)
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
index 0000000..fa74dd2
--- /dev/null
+++ b/pylibfdt/Makefile.pylibfdt
@@ -0,0 +1,18 @@
+# Makefile.pylibfdt
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
index 0000000..461cdff
--- /dev/null
+++ b/pylibfdt/libfdt.swig
@@ -0,0 +1,602 @@
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
+class FdtException(Exception):
+    """An exception caused by an error such as one of the codes above"""
+    def __init__(self, err):
+        self.err = err
+
+    def __str__(self):
+        return 'pylibfdt error %d: %s' % (self.err, fdt_strerror(self.err))
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
+def strerror(fdt_err):
+    """Get the string for an error number
+
+    Args:
+        fdt_err: Error number (-ve)
+
+    Returns:
+        String containing the associated error
+    """
+    return fdt_strerror(fdt_err)
+
+def check_err(val, quiet=False):
+    """Raise an error if the return value is -ve
+
+    This is used to check for errors returned by libfdt C functions.
+
+    Args:
+        val: Return value from a libfdt function
+        quiet: True to ignore the NOTFOUND error, False to raise on all errors
+
+    Returns:
+        val if val >= 0
+
+    Raises
+        FdtException if val is < 0
+    """
+    if val < 0:
+        if not quiet or val != -NOTFOUND:
+            raise FdtException(val)
+    return val
+
+def check_err_null(val):
+    """Raise an error if the return value is NULL
+
+    This is used to check for a NULL return value from certain libfdt C
+    functions
+
+    Args:
+        val: Return value from a libfdt function
+        quiet: True to ignore the NOTFOUND error, False to raise on all errors
+
+    Returns:
+        val if val is not NULL
+
+    Raises
+        FdtException if val is NULL
+    """
+    # Normally a tuple is returned which contains the data and its length.
+    # If we get just an integer error code, it means the function failed.
+    if not isinstance(val, list):
+        raise FdtException(val)
+    return val
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
+    Almost all methods raise a FdtException if an error occurs. The
+    following does not:
+
+        string() - since it has no error checking
+
+    To avoid this behaviour a 'quiet' version is provided for some functions.
+    This behaves as for the normal version except that it will not raise
+    an exception in the case of an FDT_ERR_NOTFOUND error: it will simply
+    return the -NOTFOUND error code or None.
+
+    Separate classes are provided for nodes (Node) and properties (Prop).
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
+    def path(self, path):
+        """Get the Node for a given path
+
+        Args:
+            path: Path to the required node, e.g. '/node@3/subnode@1'
+
+        Returns:
+            Node object for this node
+
+        Raises
+            FdtException if the path is not valid
+        """
+        return Node(self, check_err(fdt_path_offset(self._fdt, path)))
+
+    def path_quiet(self, path):
+        """Get the Node for a given path
+
+        Args:
+            path: Path to the required node, e.g. '/node@3/subnode@1'
+
+        Returns:
+            Node object for this node, or None if the path is not valid
+        """
+        val = check_err(fdt_path_offset(self._fdt, path), True)
+        if val < 0:
+            return None
+        return Node(self, val)
+
+    def path_offset(self, path):
+        """Get the offset for a given path
+
+        Args:
+            path: Path to the required node, e.g. '/node@3/subnode@1'
+
+        Returns:
+            Node offset
+
+        Raises
+            FdtException if the path is not valid
+        """
+        return check_err(fdt_path_offset(self._fdt, path))
+
+    def path_offset_quiet(self, path):
+        """Get the offset for a given path
+
+        Args:
+            path: Path to the required node, e.g. '/node@3/subnode@1'
+
+        Returns:
+            Node offset, or -NOTFOUND if the path is not value
+
+        Raises
+            FdtException if any error occurs other than NOTFOUND
+        """
+        return check_err(fdt_path_offset(self._fdt, path), True)
+
+    def first_property_offset(self, nodeoffset):
+        """Get the offset of the first property in a node offset
+
+        Args:
+            nodeoffset: Offset to the node to check
+
+        Returns:
+            Offset of the first property
+
+        Raises
+            FdtException if the associated node has no properties, or some
+                other error occurred
+        """
+        return check_err(fdt_first_property_offset(self._fdt, nodeoffset))
+
+    def first_property_offset_quiet(self, nodeoffset):
+        """Get the offset of the first property in a node offset
+
+        Args:
+            nodeoffset: Offset to the node to check
+
+        Returns:
+            Offset of the first property, or -ENOTFOUND if the node has no
+                properties
+
+        Raises
+            FdtException if any other error occurs
+        """
+        return check_err(fdt_first_property_offset(self._fdt, nodeoffset), True)
+
+    # TODO(sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org): Comment the rest of the methods once everything
+    # is confirmed.
+    def next_property_offset(self, prop_offset):
+        return check_err(fdt_next_property_offset(self._fdt, prop_offset))
+
+    def next_property_offset_quiet(self, prop_offset):
+        return check_err(fdt_next_property_offset(self._fdt, prop_offset), True)
+
+    def get_name(self, nodeoffset):
+        return check_err_null(fdt_get_name(self._fdt, nodeoffset))[0]
+
+    def get_property_by_offset_internal(self, prop_offset):
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
+            FdtException on error (e.g. invalid prop_offset or device
+            tree format)
+        """
+        return check_err_null(fdt_get_property_by_offset(self._fdt,
+                                                         prop_offset))[0]
+
+    def get_property_by_offset(self, prop_offset):
+        return Prop.from_offset(self, prop_offset)
+
+    def get_property(self, nodeoffset, name):
+        """Get a property given a node offset and the property name
+
+        We cannot use fdt_get_property() here since it does not return the
+        offset. We prefer to create Node objects using the offset.
+
+        Args:
+            nodeoffset: Offset of the node
+            name: Property name
+
+        Returns:
+            Prop object found
+
+        Raises:
+            FdtException on error such as no such property
+        """
+        poffset = self.first_property_offset(nodeoffset)
+        while True:
+            pdata = self.get_property_by_offset_internal(poffset)
+            if self.string(pdata.nameoff) == name:
+                return Prop(Node(self, nodeoffset), poffset)
+            poffset = self.next_property_offset(poffset)
+
+    def get_property_quiet(self, nodeoffset, name):
+        """Get a property given a node offset and the property name
+
+        We cannot use fdt_get_property() here since it does not return the
+        offset. We prefer to create Node objects using the offset.
+
+        Args:
+            nodeoffset: Offset of the node
+            name: Property name
+
+        Returns:
+            Prop object found or None if there is no such property
+
+        Raises:
+            FdtException on error
+        """
+        poffset = self.first_property_offset_quiet(nodeoffset)
+        while poffset >= 0:
+            pdata = self.get_property_by_offset_internal(poffset)
+            if self.string(pdata.nameoff) == name:
+                return Prop(Node(self, nodeoffset), poffset)
+            poffset = self.next_property_offset_quiet(poffset)
+        return None
+
+    def first_subnode(self, nodeoffset):
+        return check_err(fdt_first_subnode(self._fdt, nodeoffset))
+
+    def first_subnode_quiet(self, nodeoffset):
+        return check_err(fdt_first_subnode(self._fdt, nodeoffset), True)
+
+    def next_subnode(self, nodeoffset):
+        return check_err(fdt_next_subnode(self._fdt, nodeoffset))
+
+    def next_subnode_quiet(self, nodeoffset):
+        return check_err(fdt_next_subnode(self._fdt, nodeoffset), True)
+
+    def totalsize(self):
+        return check_err(fdt_totalsize(self._fdt))
+
+    def off_dt_struct(self):
+        return check_err(fdt_off_dt_struct(self._fdt))
+
+    def pack(self):
+        return check_err(fdt_pack(self._fdt))
+
+    def delprop(self, nodeoffset, prop_name):
+        return check_err(fdt_delprop(self._fdt, nodeoffset, prop_name))
+
+
+class Node:
+    """A device tree node
+
+    This encapsulates a device-tree node and provides various operations
+    which can be performed on the node. In particular it is possible to find
+    subnodes and properties.
+    """
+    def __init__(self, fdt, offset):
+        self._fdt = fdt
+        self._offset = offset
+
+    def first_property(self):
+        return Prop(self, check_err(fdt_first_property_offset(self._fdt._fdt,
+                                                              self._offset)))
+
+    def first_property_quiet(self):
+        val = check_err(fdt_first_property_offset(self._fdt._fdt, self._offset),
+                        True)
+        if val < 0:
+            return None
+        return Prop(self, val)
+
+    def props(self):
+        props = []
+        prop = self.first_property_quiet()
+        while prop:
+            props.append(prop)
+            prop = prop.next_quiet()
+        return props
+
+    def first_subnode(self):
+        val = check_err(fdt_first_subnode(self._fdt._fdt, self._offset))
+        return Node(self._fdt, val)
+
+    def next_subnode(self):
+        val = check_err(fdt_next_subnode(self._fdt._fdt, self._offset))
+        return Node(self._fdt, val)
+
+    def first_subnode_quiet(self):
+        val = check_err(fdt_first_subnode(self._fdt._fdt, self._offset), True)
+        if val < 0:
+            return None
+        return Node(self._fdt, val)
+
+    def next_subnode_quiet(self):
+        val = check_err(fdt_next_subnode(self._fdt._fdt, self._offset), True)
+        if val < 0:
+            return None
+        return Node(self._fdt, val)
+
+    def name(self):
+        return check_err_null(fdt_get_name(self._fdt._fdt, self._offset))[0]
+
+    def prop(self, name):
+        return self._fdt.get_property(self._offset, name)
+
+
+class Prop:
+    """A device-tree property
+
+    This encapsulates a device-tree property and provides various operations
+    which can be performed on the property.
+
+    Generally the standard constructor is used to create a Prop object. But
+    in the case where only the property offset is known (and not the Node
+    that holds the property), from_offset() can be used.
+    """
+    def __init__(self, node, offset, fdt=None):
+        self._node = node
+        self._offset = offset
+        self._fdt = node._fdt if node else fdt
+
+    @classmethod
+    def from_offset(cls, fdt, prop_offset):
+        prop = cls(None, prop_offset, fdt)
+        prop._get_name_data()
+        return prop
+
+    def next(self):
+        return Prop(self._node, check_err(fdt_next_property_offset(
+                self._fdt._fdt, self._offset)))
+
+    def next_quiet(self):
+        val = check_err(fdt_next_property_offset(self._fdt._fdt, self._offset),
+                        True)
+        if val < 0:
+            return None
+        return Prop(self._node, val)
+
+    def _get_name_data(self):
+        pdata = fdt_get_property_by_offset(self._fdt._fdt, self._offset)
+        if not isinstance(pdata, list):
+            raise FdtException(pdata)
+        return self._fdt.string(pdata[0].nameoff), data(pdata[0])
+
+    def name(self):
+        return self._get_name_data()[0]
+
+    def data(self):
+        return self._get_name_data()[1]
+
+    def delete(self):
+        if not self._node:
+            raise RuntimeError("Can't delete property offset %d of unknown node"
+                               % self._offset)
+        self._fdt.delprop(self._node._offset, self.name())
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
+%}
+
+/*
+ * From here are the function definitions from libfdt.h, along with their
+ * exception-handling code.
+ */
+int fdt_path_offset(const void *fdt, const char *path);
+
+int fdt_first_property_offset(const void *fdt, int nodeoffset);
+
+int fdt_next_property_offset(const void *fdt, int offset);
+
+const char *fdt_get_name(const void *fdt, int nodeoffset, int *OUTPUT);
+
+/* no exception handling, since this function has no error checking */
+const char *fdt_string(const void *fdt, int stroffset);
+
+const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
+                                                      int offset, int *OUTPUT);
+
+/* no exception handling, this this function always returns a valid string */
+const char *fdt_strerror(int errval);
+
+int fdt_first_subnode(const void *fdt, int offset);
+
+int fdt_next_subnode(const void *fdt, int offset);
+
+int fdt_delprop(void *fdt, int nodeoffset, const char *name);
+
+int fdt_pack(void *fdt);
+
+int fdt_totalsize(const void *fdt);
+
+int fdt_off_dt_struct(const void *fdt);
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
