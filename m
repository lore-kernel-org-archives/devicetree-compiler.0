From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v3 1/4] pylibfdt: allow build out of tree
Date: Tue, 15 Sep 2020 23:27:02 +0400
Message-ID: <20200915192705.1716282-2-marcandre.lureau@redhat.com>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600198044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QT5svik7fodjBpIAo8voJaqZt55fi6iBospUG+UkS+0=;
        b=LR5Uk6hZ+FwmReEbRBQi4uSJ0boyQI2O03yQmoxUKB82n0mucrkacpZreFLSG9rUbGESyl
        QbaMBk3p/NME3HkrjCEhZzieckYZt1fgU0ccB5GdJHjtAhliXWT6IXTWhKw7tU5mpcScw3
        0kLZNINW7Dxk7atzCBne+5Q7sMXAewI=
In-Reply-To: <20200915192705.1716282-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

With meson, we have to support out-of-tree build. Fix path lookup.

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 pylibfdt/Makefile.pylibfdt |  2 +-
 pylibfdt/setup.py          | 25 +++++++++++++++++--------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 6866a0b..32ae1c5 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -10,7 +10,7 @@ PYLIBFDT_CLEANDIRS_L = build __pycache__
 PYLIBFDT_CLEANDIRS = $(PYLIBFDT_CLEANDIRS_L:%=$(PYLIBFDT_dir)/%)
 
 SETUP = $(PYLIBFDT_dir)/setup.py
-SETUPFLAGS =
+SETUPFLAGS = --top-builddir .
 
 ifndef V
 SETUPFLAGS += --quiet
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index 53f2bef..f8ec924 100755
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -19,23 +19,31 @@ import sys
 VERSION_PATTERN = '^#define DTC_VERSION "DTC ([^"]*)"$'
 
 
+def get_top_builddir():
+    assert '--top-builddir' in sys.argv
+    index = sys.argv.index('--top-builddir')
+    sys.argv.pop(index)
+    return sys.argv.pop(index)
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
@@ -44,5 +52,6 @@ setup(
     author='Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
     description='Python binding for libfdt',
     ext_modules=[libfdt_module],
+    package_dir={'': srcdir},
     py_modules=['libfdt'],
 )
-- 
2.26.2

