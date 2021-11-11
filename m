From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] pylibfdt: Move setup.py to the top level
Date: Wed, 10 Nov 2021 19:11:35 -0600
Message-ID: <20211111011135.2386773-5-robh@kernel.org>
References: <20211111011135.2386773-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211111011135.2386773-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Using 'pip' and several setup.py sub-commands currently don't work with
pylibfdt. The primary reason is Python packaging has opinions on the
directory structure of repositories and one of those appears to be the
inability to reference source files outside of setup.py's subtree. This
means a sdist cannot be created with all necessary source components
(i.e. libfdt headers). Moving setup.py to the top-level solves these
problems.

With this change. the following commands now work:

Creating packages for pypi.org:
./setup.py sdist bdist_wheel

Using pip for installs:
pip install .
pip install git+http://github.com/robherring/dtc.git@pypi-v2

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .gitignore                    |  4 ++++
 MANIFEST.in                   |  9 +++++++++
 pylibfdt/Makefile.pylibfdt    |  3 +--
 pylibfdt/meson.build          |  4 ++--
 pylibfdt/setup.py => setup.py | 15 ++++++++-------
 5 files changed, 24 insertions(+), 11 deletions(-)
 create mode 100644 MANIFEST.in
 rename pylibfdt/setup.py => setup.py (75%)

diff --git a/.gitignore b/.gitignore
index 8e332d8d8e07..416fa05be56a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -22,3 +22,7 @@ lex.yy.c
 # cscope files
 cscope.*
 ncscope.*
+
+.eggs/
+build/
+dist/
diff --git a/MANIFEST.in b/MANIFEST.in
new file mode 100644
index 000000000000..9e6c4ac4610c
--- /dev/null
+++ b/MANIFEST.in
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+
+global-exclude *
+include setup.py
+include pylibfdt/libfdt.i
+include pylibfdt/*.py
+include libfdt/libfdt.h
+include libfdt/fdt.h
+include libfdt/libfdt_env.h
diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 015a05ec7590..82f565e370fb 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -9,8 +9,7 @@ PYLIBFDT_CLEANFILES = $(PYLIBFDT_CLEANFILES_L:%=$(PYLIBFDT_dir)/%)
 PYLIBFDT_CLEANDIRS_L = build __pycache__
 PYLIBFDT_CLEANDIRS = $(PYLIBFDT_CLEANDIRS_L:%=$(PYLIBFDT_dir)/%)
 
-SETUP = $(PYLIBFDT_dir)/setup.py
-SETUPFLAGS = --top-builddir .
+SETUP = ./setup.py
 
 ifndef V
 SETUPFLAGS += --quiet
diff --git a/pylibfdt/meson.build b/pylibfdt/meson.build
index fad5aa1c8bc3..f684cbbfb6eb 100644
--- a/pylibfdt/meson.build
+++ b/pylibfdt/meson.build
@@ -1,5 +1,5 @@
-setup_py = find_program('setup.py')
-setup_py = [setup_py.path(), '--quiet', '--top-builddir', meson.current_build_dir() / '..']
+setup_py = find_program('../setup.py')
+setup_py = [setup_py.path(), '--quiet', '--top-builddir', meson.project_build_root()]
 
 custom_target(
   'pylibfdt',
diff --git a/pylibfdt/setup.py b/setup.py
similarity index 75%
rename from pylibfdt/setup.py
rename to setup.py
index 75ce09ac8f6d..4b07be972466 100755
--- a/pylibfdt/setup.py
+++ b/setup.py
@@ -15,36 +15,37 @@ import os
 import re
 import sys
 
+srcdir = os.path.dirname(__file__)
+
 def get_top_builddir():
     if '--top-builddir' in sys.argv:
         index = sys.argv.index('--top-builddir')
         sys.argv.pop(index)
         return sys.argv.pop(index)
     else:
-        return os.getcwd()
+        return srcdir
 
-srcdir = os.path.dirname(os.path.abspath(sys.argv[0]))
 top_builddir = get_top_builddir()
 
 libfdt_module = Extension(
     '_libfdt',
-    sources=[os.path.join(srcdir, 'libfdt.i')],
-    include_dirs=[os.path.join(srcdir, '../libfdt')],
+    sources=[os.path.join(srcdir, 'pylibfdt/libfdt.i')],
+    include_dirs=[os.path.join(srcdir, 'libfdt')],
     libraries=['fdt'],
     library_dirs=[os.path.join(top_builddir, 'libfdt')],
-    swig_opts=['-I' + os.path.join(srcdir, '../libfdt')],
+    swig_opts=['-I' + os.path.join(srcdir, 'libfdt')],
 )
 
 setup(
     name='libfdt',
     use_scm_version={
-        "root": os.path.join(srcdir, '..'),
+        "root": srcdir,
     },
     setup_requires = ['setuptools_scm'],
     author='Simon Glass',
     author_email='sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org',
     description='Python binding for libfdt',
     ext_modules=[libfdt_module],
-    package_dir={'': srcdir},
+    package_dir={'': os.path.join(srcdir, 'pylibfdt')},
     py_modules=['libfdt'],
 )
-- 
2.32.0

