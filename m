From: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] pylibfdt: Fix install location of libfdt.py
Date: Tue, 7 Nov 2017 16:17:41 +0200
Message-ID: <20171107141741.1733-1-tuomas@tuxera.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>

Currently 'make install' produces a directory tree like this
for the Python module:

$PREFIX
`-- lib
    `-- python2.7
        `-- site-packages
            |-- _libfdt.so
            |-- libfdt-1.4.5-py2.7.egg-info
            `-- pylibfdt
                |-- libfdt.py
                `-- libfdt.pyc

That is, libfdt.py is installed in an unexpected subdirectory pylibfdt
so 'import libfdt' fails. Fix this by properly pointing package_dir to
the root of the Python sources, producing the correct directory tree:

$PREFIX
`-- lib
    `-- python2.7
        `-- site-packages
            |-- _libfdt.so
            |-- libfdt-1.4.5-py2.7.egg-info
            |-- libfdt.py
            `-- libfdt.pyc

Signed-off-by: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
---
 pylibfdt/Makefile.pylibfdt | 1 -
 pylibfdt/setup.py          | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 9507d3d..2843ef5 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -14,7 +14,6 @@ endef
 $(PYMODULE): $(PYLIBFDT_srcs)
 	@$(VECHO) PYMOD $@
 	$(call run_setup, $^, build_ext --inplace)
-	mv _libfdt.so $@
 
 install_pylibfdt: $(PYMODULE)
 	$(VECHO) INSTALL-PYLIB; \
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index 1a1e832..49ab3cc 100755
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -116,6 +116,6 @@ setup(
     author='Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
     description='Python binding for libfdt',
     ext_modules=[libfdt_module],
-    package_dir={'': objdir},
-    py_modules=['pylibfdt/libfdt'],
+    package_dir={'': 'pylibfdt'},
+    py_modules=['libfdt'],
 )
-- 
2.15.0
