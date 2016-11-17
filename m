From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/4] Add an initial Python library for libfdt
Date: Thu, 17 Nov 2016 15:53:22 -0700
Message-ID: <1479423205-9817-2-git-send-email-sjg@chromium.org>
References: <1479423205-9817-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UwEYVcRw4K05Uf9U54ryKlU83P2sTNzQqNb7Her70FM=;
        b=RD/ddB0/V8HZlxGrHyJmFjkQxM6kM7IzGA9jxs0dpZrjeH0FRCkNN2AsVdfsaYSXzZ
         geyJZ9/ydk5pagstj8omKrQUe+YEFqnK10oXlTP0drU0MGlZGs7rR20+whYDRAjuTJxt
         64VL68HdXVv/kuiek/ic/uNuemQ8oy4gUAgumtOyyoM2SAVi5F0Rrf6E5AaIQEIn9XFa
         jiu81A6Nny//CnusTmer7pYHdqDajC8Bti9mu2jkrG+1bmVwYc1EhEnYUvGSll4DE+Rm
         FvI4B0KvK4Bij+oEOs3eOLDgREOCNXrf6jaN4jZcZaCO02pv2NooBffJXZ6DIHJNHXVT
         HH0g==
In-Reply-To: <1479423205-9817-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add Python bindings for a bare-bones set of libfdt functions. These allow
navigating the tree and reading node names and properties.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  21 ++++++
 pylibfdt/libfdt.swig       | 157 +++++++++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 ++++++++++
 4 files changed, 215 insertions(+)
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
index 0000000..91887da
--- /dev/null
+++ b/pylibfdt/libfdt.swig
@@ -0,0 +1,157 @@
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
+def Raise(errnum):
+    raise ValueError('Error %s' % fdt_strerror(errnum))
+
+def Name(fdt, offset):
+    name, len = fdt_get_name(fdt, offset)
+    return name
+
+def String(fdt, offset):
+    offset = fdt32_to_cpu(offset)
+    name = fdt_string(fdt, offset)
+    return name
+
+def fdt32_to_cpu(val):
+    return struct.unpack("=I", struct.pack(">I", val))[0]
+
+def Data(prop):
+    set_prop(prop)
+    return get_prop_data()
+%}
+
+%include "typemaps.i"
+%include "cstring.i"
+
+%typemap(in) void* = char*;
+
+typedef int fdt32_t;
+
+struct fdt_property {
+        fdt32_t tag;
+        fdt32_t len;
+        fdt32_t nameoff;
+        char data[0];
+};
+
+/*
+ * This is a work-around since I'm not sure of a better way to copy out the
+ * contents of a string. This is used in dtoc/GetProps(). The intent is to
+ * pass in a pointer to a property and access the data field at the end of
+ * it. Ideally the Data() function above would be able to do this directly,
+ * but I'm not sure how to do that. Needs another look.
+ */
+#pragma SWIG nowarn=454
+%inline %{
+    static struct fdt_property *cur_prop;
+
+    void set_prop(struct fdt_property *prop) {
+        cur_prop = prop;
+    }
+%}
+
+%cstring_output_allocate_size(char **s, int *sz, free(*$1));
+%inline %{
+    void get_prop_data(char **s, int *sz) {
+        *sz = fdt32_to_cpu(cur_prop->len);
+        *s = (char *)malloc(*sz);
+        if (!*s)
+            *sz = 0;
+        else
+            memcpy(*s, cur_prop + 1, *sz);
+    }
+%}
+
+%typemap(in) (const void *) {
+  if (!PyByteArray_Check($input)) {
+    SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname" "', argument "
+                       "$argnum"" of type '" "$type""'");
+  }
+  $1 = (void *) PyByteArray_AsString($input);
+}
+
+int fdt_path_offset(const void *fdt, const char *path);
+int fdt_first_property_offset(const void *fdt, int nodeoffset);
+int fdt_next_property_offset(const void *fdt, int offset);
+const char *fdt_get_name(const void *fdt, int nodeoffset, int *OUTPUT);
+const char *fdt_string(const void *fdt, int stroffset);
+const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
+                                                      int offset,
+                                                      int *OUTPUT);
+const char *fdt_strerror(int errval);
+int fdt_first_subnode(const void *fdt, int offset);
+int fdt_next_subnode(const void *fdt, int offset);
+
+%typemap(in) (void *) {
+  if (!PyByteArray_Check($input)) {
+    SWIG_exception_fail(SWIG_TypeError, "in method '" "$symname" "', argument "
+                       "$argnum"" of type '" "$type""'");
+  }
+  $1 = PyByteArray_AsString($input);
+}
+
+int fdt_delprop(void *fdt, int nodeoffset, const char *name);
+
+int fdt_pack(void *fdt);
+
+int fdt_totalsize(const void *fdt);
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
