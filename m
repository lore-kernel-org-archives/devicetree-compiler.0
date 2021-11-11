From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/4] pylibfdt: Use setuptools_scm for the version
Date: Wed, 10 Nov 2021 19:11:33 -0600
Message-ID: <20211111011135.2386773-3-robh@kernel.org>
References: <20211111011135.2386773-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211111011135.2386773-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

The DTC version in version_gen.h causes a warning with setuptools:

setuptools/dist.py:501: UserWarning: The version specified ('1.6.1-g5454474d') \
is an invalid version, this may not work as expected with newer versions of \
setuptools, pip, and PyPI. Please see PEP 440 for more details.

It also creates an unnecessary dependency on the rest of the build
system(s). Switch to use setuptools_scm instead to get the version for
pylibfdt.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 pylibfdt/Makefile.pylibfdt |  2 +-
 pylibfdt/meson.build       |  1 -
 pylibfdt/setup.py          | 18 ++++--------------
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 1b5f23634e30..015a05ec7590 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -16,7 +16,7 @@ ifndef V
 SETUPFLAGS += --quiet
 endif
 
-$(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP) $(VERSION_FILE)
+$(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP)
 	@$(VECHO) PYMOD $@
 	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=$(PYLIBFDT_dir)
 
diff --git a/pylibfdt/meson.build b/pylibfdt/meson.build
index 088f24934b4f..fad5aa1c8bc3 100644
--- a/pylibfdt/meson.build
+++ b/pylibfdt/meson.build
@@ -5,7 +5,6 @@ custom_target(
   'pylibfdt',
   input: 'libfdt.i',
   output: '_libfdt.so',
-  depends: version_gen_h,
   command: [setup_py, 'build_ext', '--build-lib=' + meson.current_build_dir()],
   build_by_default: true,
 )
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index f065a5947067..52b61b6d7be2 100755
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -15,10 +15,6 @@ import os
 import re
 import sys
 
-
-VERSION_PATTERN = '^#define DTC_VERSION "DTC ([^"]*)"$'
-
-
 def get_top_builddir():
     if '--top-builddir' in sys.argv:
         index = sys.argv.index('--top-builddir')
@@ -27,18 +23,9 @@ def get_top_builddir():
     else:
         return os.getcwd()
 
-
 srcdir = os.path.dirname(os.path.abspath(sys.argv[0]))
 top_builddir = get_top_builddir()
 
-
-def get_version():
-    version_file = os.path.join(top_builddir, 'version_gen.h')
-    f = open(version_file, 'rt')
-    m = re.match(VERSION_PATTERN, f.readline())
-    return m.group(1)
-
-
 libfdt_module = Extension(
     '_libfdt',
     sources=[os.path.join(srcdir, 'libfdt.i')],
@@ -50,7 +37,10 @@ libfdt_module = Extension(
 
 setup(
     name='libfdt',
-    version=get_version(),
+    use_scm_version={
+        "root": os.path.join(srcdir, '..'),
+    },
+    setup_requires = ['setuptools_scm'],
     author='Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
     description='Python binding for libfdt',
     ext_modules=[libfdt_module],
-- 
2.32.0

