From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] pylibfdt: fix swig build in install
Date: Thu,  3 Feb 2022 12:04:07 -0600
Message-ID: <20220203180408.611645-2-robh@kernel.org>
References: <20220203180408.611645-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20220203180408.611645-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hector Oron <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Natanael Copa <ncopa-Tvuechaw34bCfDggNXIi3w@public.gmane.org>

A 'pip install' is silently broken unless the tree is dirty and contains
pylibfdt/libfdt.py. The problem is a known issue[1] with SWIG and
setuptools where the 'build_py' stage needing module.py runs before
the 'build_ext' stage which generates it. The work-around is to override
'build_py' to run 'build_ext' first.

[1] https://stackoverflow.com/questions/50239473/building-a-module-with-setuptools-and-swig

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 MANIFEST.in | 1 -
 setup.py    | 8 ++++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/MANIFEST.in b/MANIFEST.in
index d9fb71b77a65..6e7244d195e6 100644
--- a/MANIFEST.in
+++ b/MANIFEST.in
@@ -6,7 +6,6 @@ include GPL
 include BSD-2-Clause
 include setup.py
 include pylibfdt/libfdt.i
-include pylibfdt/*.py
 include libfdt/libfdt.h
 include libfdt/fdt.h
 include libfdt/libfdt_env.h
diff --git a/setup.py b/setup.py
index 029aa6182221..a8e54a361512 100755
--- a/setup.py
+++ b/setup.py
@@ -11,6 +11,8 @@ Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 """
 
 from setuptools import setup, Extension
+from setuptools.command.build_py import build_py as _build_py
+
 import os
 import re
 import sys
@@ -40,11 +42,17 @@ libfdt_module = Extension(
     swig_opts=['-I' + os.path.join(srcdir, 'libfdt')],
 )
 
+class build_py(_build_py):
+    def run(self):
+        self.run_command("build_ext")
+        return super().run()
+
 setup(
     name='libfdt',
     use_scm_version={
         "root": srcdir,
     },
+    cmdclass = {'build_py' : build_py},
     setup_requires = ['setuptools_scm'],
     author='Simon Glass',
     author_email='sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org',
-- 
2.32.0

