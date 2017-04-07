From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 1/3] pylibfdt: Allow setup.py to operate stand-alone
Date: Fri,  7 Apr 2017 15:51:32 -0600
Message-ID: <20170407215134.2477-2-sjg@chromium.org>
References: <20170407215134.2477-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ELFD0zLaHwUfC6o5f5Eqsgfg5jK+WGKxtF5z4HuUs7I=;
        b=bBnksKJa5WWAdCQD2BtDyGQfdyD3M0dq3K75SQJr2r7CYSndi9CVQKV0xVrhY79pN9
         Ud8ebVsyyqX1NeR1WUfhU6pVwtXQ8rnLXrZAXTwzT5cYZ5K1M/Oq7NBwFGUjgb+zmmB7
         KVBIVsnExCFjxdl5p5t5ETEWvv07hJup11KMSAvZSCBnmV1BCWVs8ZSorRKzETu1pCUU
         xVnAabCePMfYzoWRhn4G2ODOTRdHiJGX3oHr10J9mYdqPHzTk2qw76R/EU/q4bm+WCDC
         +cgFdmq6F+LLV3gSSlfelCSGbnmfx0yKt398f8pqA9/nz2h0MP8UPt0aOoABK4aFlhYc
         pZSQ==
In-Reply-To: <20170407215134.2477-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

At present we require that setup.py is executed from the Makefile, which
sets up various important things like the list of files to build and the
version number.

However many installation systems expect to be able to change to the
directory containing setup.py and run it. This allows them to support (for
example) building/installing for multiple Python versions, varying
installation paths, particular C flags, etc.

The problem in implementing this is that we don't want to duplicate the
information in the Makefile. A common solution (so I am told) is to parse
the Makefile to obtain the required information.

Update the setup.py script to read a few Makefiles when it does not see
the required information in its environment. This allows installation
using:

   ./pylibfdt/setup.py install

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v4:
- Fix dependencies to allow Python tests to run from a clean tree
- Install Python library in pylibfdt/ correctly

Changes in v3:
- Update README to suggest using setup.py for an easy install
- Allow setup.py to be run from the base directory
- Make setup.py executable
- Use define..endef instead of line continuations

Changes in v2:
- Add new patch to allow setup.py to operation stand-alone
- Rebase to master

 Makefile                   |  1 +
 README                     | 14 +++++--
 pylibfdt/Makefile.pylibfdt |  9 +++--
 pylibfdt/setup.py          | 98 +++++++++++++++++++++++++++++++++++++++++++---
 tests/Makefile.tests       |  6 +--
 5 files changed, 112 insertions(+), 16 deletions(-)
 mode change 100644 => 100755 pylibfdt/setup.py

diff --git a/Makefile b/Makefile
index 52ff72c..154f5bf 100644
--- a/Makefile
+++ b/Makefile
@@ -267,6 +267,7 @@ TESTS_BIN += convert-dtsv0
 TESTS_BIN += fdtput
 TESTS_BIN += fdtget
 TESTS_BIN += fdtdump
+TESTS_PYLIBFDT += maybe_pylibfdt
 
 include tests/Makefile.tests
 
diff --git a/README b/README
index 5add557..17dc845 100644
--- a/README
+++ b/README
@@ -50,12 +50,18 @@ If you add new features, please check code coverage:
     # Open 'htmlcov/index.html' in your browser
 
 
-To install the library use:
+To install the library via the normal setup.py method, use:
 
-    make install_pylibfdt SETUP_PREFIX=/path/to/install_dir
+    ./pylibfdt/setup.py [--prefix=/path/to/install_dir]
 
-If SETUP_PREFIX is not provided, the default prefix is used, typically '/usr'
-or '/usr/local'. See Python's distutils documentation for details.
+If --prefix is not provided, the default prefix is used, typically '/usr'
+or '/usr/local'. See Python's distutils documentation for details. You can
+also install via the Makefile if you like, but the above is more common.
+
+To install both libfdt and pylibfdt you can use:
+
+    make install [SETUP_PREFIX=/path/to/install_dir] \
+            [PREFIX=/path/to/install_dir]
 
 To disable building the python library, even if swig and Python are available,
 use:
diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 06f9296..0e8ac5f 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -5,13 +5,16 @@ PYLIBFDT_srcs = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_SRCS))
 WRAP = $(PYLIBFDT_objdir)/libfdt_wrap.c
 PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
 
-run_setup = SOURCES="$(1)" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)" \
-	VERSION="$(dtc_version)" \
-	python $(PYLIBFDT_objdir)/setup.py --quiet $(2)
+define run_setup
+	SOURCES="$(1)" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)"
+	VERSION="$(dtc_version)"
+	$(PYLIBFDT_objdir)/setup.py --quiet $(2)
+endef
 
 $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
 	@$(VECHO) PYMOD $@
 	$(call run_setup, $^, build_ext --inplace)
+	mv _libfdt.so $@
 
 $(WRAP): $(PYLIBFDT_srcdir)/libfdt.i
 	@$(VECHO) SWIG $@
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
old mode 100644
new mode 100755
index 1597b44..90e80f3
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -2,26 +2,112 @@
 
 """
 setup.py file for SWIG libfdt
+Copyright (C) 2017 Google, Inc.
+Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 
 Files to be built into the extension are provided in SOURCES
 C flags to use are provided in CPPFLAGS
 Object file directory is provided in OBJDIR
+Version is provided in VERSION
+
+If these variables are not given they are parsed from the Makefiles. This
+allows this script to be run stand-alone, e.g.:
+
+    ./pylibfdt/setup.py install [--prefix=...]
 """
 
 from distutils.core import setup, Extension
 import os
+import re
 import sys
 
+# Decodes a Makefile assignment line into key and value (and plus for +=)
+RE_KEY_VALUE = re.compile('(?P<key>\w+) *(?P<plus>[+])?= *(?P<value>.*)$')
+
+
+def ParseMakefile(fname):
+    """Parse a Makefile to obtain its variables.
+
+    This collects variable assigments of the form:
+
+        VAR = value
+        VAR += more
+
+    It does not pick out := assignments, as these are not needed here. It does
+    handle line continuation.
+
+    Returns a dict:
+        key: Variable name (e.g. 'VAR')
+        value: Variable value (e.g. 'value more')
+    """
+    makevars = {}
+    with open(fname) as fd:
+        prev_text = ''  # Continuation text from previous line(s)
+        for line in fd.read().splitlines():
+          if line and line[-1] == '\\':  # Deal with line continuation
+            prev_text += line[:-1]
+            continue
+          elif prev_text:
+            line = prev_text + line
+            prev_text = ''  # Continuation is now used up
+          m = RE_KEY_VALUE.match(line)
+          if m:
+            value = m.group('value') or ''
+            key = m.group('key')
+
+            # Appending to a variable inserts a space beforehand
+            if 'plus' in m.groupdict() and key in makevars:
+              makevars[key] += ' ' + value
+            else:
+              makevars[key] = value
+    return makevars
+
+def GetEnvFromMakefiles():
+    """Scan the Makefiles to obtain the settings we need.
+
+    This assumes that this script is being run from the top-level directory,
+    not the pylibfdt directory.
+
+    Returns:
+        Tuple with:
+            List of swig options
+            Version string
+            List of files to build
+            List of extra C preprocessor flags needed
+            Object directory to use (always '')
+    """
+    basedir = os.path.dirname(os.path.dirname(os.path.abspath(sys.argv[0])))
+    swig_opts = ['-I%s' % basedir]
+    makevars = ParseMakefile(os.path.join(basedir, 'Makefile'))
+    version = '%s.%s.%s' % (makevars['VERSION'], makevars['PATCHLEVEL'],
+                            makevars['SUBLEVEL'])
+    makevars = ParseMakefile(os.path.join(basedir, 'libfdt', 'Makefile.libfdt'))
+    files = makevars['LIBFDT_SRCS'].split()
+    files = [os.path.join(basedir, 'libfdt', fname) for fname in files]
+    files.append('pylibfdt/libfdt.i')
+    cflags = ['-I%s' % basedir, '-I%s/libfdt' % basedir]
+    objdir = ''
+    return swig_opts, version, files, cflags, objdir
+
+
 progname = sys.argv[0]
-files = os.environ['SOURCES'].split()
-cflags = os.environ['CPPFLAGS'].split()
-objdir = os.environ['OBJDIR']
-version = os.environ['VERSION']
+files = os.environ.get('SOURCES', '').split()
+cflags = os.environ.get('CPPFLAGS', '').split()
+objdir = os.environ.get('OBJDIR')
+version = os.environ.get('VERSION')
+swig_opts = []
+
+# If we were called directly rather than through our Makefile (which is often
+# the case with Python module installation), read the settings from the
+# Makefile.
+if not all((version, files, cflags, objdir)):
+    swig_opts, version, files, cflags, objdir = GetEnvFromMakefiles()
 
 libfdt_module = Extension(
     '_libfdt',
     sources = files,
-    extra_compile_args = cflags
+    extra_compile_args = cflags,
+    swig_opts = swig_opts,
 )
 
 setup(
@@ -31,5 +117,5 @@ setup(
     description='Python binding for libfdt',
     ext_modules=[libfdt_module],
     package_dir={'': objdir},
-    py_modules=['libfdt'],
+    py_modules=['pylibfdt/libfdt'],
 )
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 3d7a4f8..2258135 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -72,13 +72,13 @@ tests_clean:
 	rm -f $(STD_CLEANFILES:%=$(TESTS_PREFIX)%)
 	rm -f $(TESTS_CLEANFILES)
 
-check:	tests ${TESTS_BIN}
+check:	tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
 	cd $(TESTS_PREFIX); ./run_tests.sh
 
-checkm: tests ${TESTS_BIN}
+checkm: tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
 	cd $(TESTS_PREFIX); ./run_tests.sh -m 2>&1 | tee vglog.$$$$
 
-checkv:	tests ${TESTS_BIN}
+checkv:	tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
 	cd $(TESTS_PREFIX); ./run_tests.sh -v
 
 ifneq ($(DEPTARGETS),)
-- 
2.12.2.715.g7642488e1d-goog
