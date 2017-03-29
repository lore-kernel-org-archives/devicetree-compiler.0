From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 6/6] pylibfdt: Allow setup.py to operation stand-alone
Date: Wed, 29 Mar 2017 12:15:41 -0600
Message-ID: <20170329181541.28856-7-sjg@chromium.org>
References: <20170329181541.28856-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/HOwS1oaq8+kQX8TMRrbADOF6HyRLfI+tVEtxbDwsYc=;
        b=ts529lOzrIph3v8PJE3vLj8RRNuncoSOYXVitxajeHVrIqsv5Tkm0HpMewH32I1dyn
         2jLt9CWDaateKRqa3WEeOfQ0JowBRGL42WznJwiJ7CTViQYSp/XGREDzm8TFFUDjnrBl
         C2x2yzgdxeNwIx7GnGgV2h71wtgwNB8rKlthOP0EA5rIsOB7F/eyrna7Lc02i8Fqy1zw
         Ll00Og62mck7u7ByiD8Njabb5LrDT6e9tTzFEgXJY8kIfdIZLwHFn+dLWtgwGebIrf6L
         rLfCzTLAI2OxK/yLKkr6U6YXF6vQUxIzRyFrkYez8tLB+T6k999r3vlBMIthlXpJgSuY
         KVEw==
In-Reply-To: <20170329181541.28856-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

   cd pylibfdt
   python setup.py install

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2:
- Add new patch to allow setup.py to operation stand-alone
- Rebase to master

 README            | 10 +++++-
 pylibfdt/setup.py | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 99 insertions(+), 6 deletions(-)

diff --git a/README b/README
index 5add557..561a364 100644
--- a/README
+++ b/README
@@ -55,7 +55,15 @@ To install the library use:
     make install_pylibfdt SETUP_PREFIX=/path/to/install_dir
 
 If SETUP_PREFIX is not provided, the default prefix is used, typically '/usr'
-or '/usr/local'. See Python's distutils documentation for details.
+or '/usr/local'. See Python's distutils documentation for details. You can
+also install using:
+
+    cd pylibfdt
+    python setup.py install
+
+To install both libfdt and pylibfdt you can use:
+
+    make install SETUP_PREFIX=/path/to/install_dir PREFIX=/path/to/install_dir
 
 To disable building the python library, even if swig and Python are available,
 use:
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index 9f87fe9..42c86e4 100644
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -2,27 +2,112 @@
 
 """
 setup.py file for SWIG libfdt
+Copyright (C) 2017 Google, Inc.
+Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 
 Files to be built into the extension are provided in SOURCES
 C flags to use are provided in CPPFLAGS
 Object file directory is provided in OBJDIR
 Version is provided in VERSION
+
+If these variables are not given they are parsed from the Makefiles. This
+allows this script to be run stand-alone, e.g.:
+
+    cd pylibfdt
+    python setup.py install [--prefix=...]
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
+    This assumes that this script is being run from the pylibfdt directory.
+
+    Returns:
+        Tuple with:
+            List of swig options
+            Version string
+            List of files to build
+            List of extra C preprocessor flags needed
+            Object directory to use (always '')
+    """
+    basedir = os.path.dirname(os.getcwd())
+    swig_opts = ['-I%s' % basedir]
+    makevars = ParseMakefile(os.path.join(basedir, 'Makefile'))
+    version = '%s.%s.%s' % (makevars['VERSION'], makevars['PATCHLEVEL'],
+                            makevars['SUBLEVEL'])
+    makevars = ParseMakefile(os.path.join(basedir, 'libfdt', 'Makefile.libfdt'))
+    files = makevars['LIBFDT_SRCS'].split()
+    files = [os.path.join(basedir, 'libfdt', fname) for fname in files]
+    files.append('libfdt.i')
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
 
 setup (name = 'libfdt',
-- 
2.12.2.564.g063fe858b8-goog
