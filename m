From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v5 1/3] pylibfdt: allow build out of tree
Date: Mon, 12 Oct 2020 11:34:03 +0400
Message-ID: <20201012073405.1682782-2-marcandre.lureau@redhat.com>
References: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602488064;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a78YEF1C/yNSO2RY2ePyyVA1yqqkkMZ6dEJcESWBb9g=;
        b=AIamhinX+oaNFaAAWx/7UwwoJCafUd7nhQKA5ZVztv27GgFrGnBYkZvKhqqBFaJdDbuYBW
        F/Gfyp2e9t437QNHFWDR/TEkCm8R0nnrsvRxBUX0GX/2ScGWUr8ITcB0OMJ2HfeMFb9sRR
        WE3gr3H9mShA0xQR3LfoSxrfnr8QBB0=
In-Reply-To: <20201012073405.1682782-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

With meson, we have to support out-of-tree build.

Introduce a --top-builddir option, which will default to the current
directory to lookup generated filed such as version_gen.h and output
directories.

Other source paths are derived from the location of the setup.py script
in the source tree.

--build-lib is changed to be relative to the current directory, instead
of relative to setup.py. This has less surprising results!

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 pylibfdt/Makefile.pylibfdt |  4 ++--
 pylibfdt/setup.py          | 27 +++++++++++++++++++--------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 6866a0b..1b5f236 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -10,7 +10,7 @@ PYLIBFDT_CLEANDIRS_L = build __pycache__
 PYLIBFDT_CLEANDIRS = $(PYLIBFDT_CLEANDIRS_L:%=$(PYLIBFDT_dir)/%)
 
 SETUP = $(PYLIBFDT_dir)/setup.py
-SETUPFLAGS =
+SETUPFLAGS = --top-builddir .
 
 ifndef V
 SETUPFLAGS += --quiet
@@ -18,7 +18,7 @@ endif
 
 $(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP) $(VERSION_FILE)
 	@$(VECHO) PYMOD $@
-	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=../$(PYLIBFDT_dir)
+	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=$(PYLIBFDT_dir)
 
 install_pylibfdt: $(PYMODULE)
 	@$(VECHO) INSTALL-PYLIB
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index 53f2bef..ef40f15 100755
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -19,23 +19,33 @@ import sys
 VERSION_PATTERN = '^#define DTC_VERSION "DTC ([^"]*)"$'
 
 
+def get_top_builddir():
+    if '--top-builddir' in sys.argv:
+        index = sys.argv.index('--top-builddir')
+        sys.argv.pop(index)
+        return sys.argv.pop(index)
+    else:
+        return os.getcwd()
+
+
+srcdir = os.path.dirname(os.path.abspath(sys.argv[0]))
+top_builddir = get_top_builddir()
+
+
 def get_version():
-    version_file = "../version_gen.h"
+    version_file = os.path.join(top_builddir, 'version_gen.h')
     f = open(version_file, 'rt')
     m = re.match(VERSION_PATTERN, f.readline())
     return m.group(1)
 
 
-setupdir = os.path.dirname(os.path.abspath(sys.argv[0]))
-os.chdir(setupdir)
-
 libfdt_module = Extension(
     '_libfdt',
-    sources=['libfdt.i'],
-    include_dirs=['../libfdt'],
+    sources=[os.path.join(srcdir, 'libfdt.i')],
+    include_dirs=[os.path.join(srcdir, '../libfdt')],
     libraries=['fdt'],
-    library_dirs=['../libfdt'],
-    swig_opts=['-I../libfdt'],
+    library_dirs=[os.path.join(top_builddir, 'libfdt')],
+    swig_opts=['-I' + os.path.join(srcdir, '../libfdt')],
 )
 
 setup(
@@ -44,5 +54,6 @@ setup(
     author='Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
     description='Python binding for libfdt',
     ext_modules=[libfdt_module],
+    package_dir={'': srcdir},
     py_modules=['libfdt'],
 )
-- 
2.28.0

