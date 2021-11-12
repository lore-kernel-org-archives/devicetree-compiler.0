From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/6] pylibfdt: Add packaging metadata
Date: Thu, 11 Nov 2021 22:16:29 -0600
Message-ID: <20211112041633.741598-3-robh@kernel.org>
References: <20211112041633.741598-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211112041633.741598-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

PyPI expects to have various package metadata including long
description, license, and classifiers. Add them.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
A test package is here: https://test.pypi.org/project/libfdt/
---
 MANIFEST.in |  3 +++
 setup.py    | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/MANIFEST.in b/MANIFEST.in
index 9e6c4ac4610c..ff8f5d637d46 100644
--- a/MANIFEST.in
+++ b/MANIFEST.in
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 
 global-exclude *
+include README
+include GPL
+include BSD-2-Clause
 include setup.py
 include pylibfdt/libfdt.i
 include pylibfdt/*.py
diff --git a/setup.py b/setup.py
index 0a0daf1c201d..00444e64337b 100755
--- a/setup.py
+++ b/setup.py
@@ -17,6 +17,9 @@ import sys
 
 srcdir = os.path.dirname(__file__)
 
+with open("README", "r") as fh:
+    long_description = fh.read()
+
 def get_top_builddir():
     if '--top-builddir' in sys.argv:
         index = sys.argv.index('--top-builddir')
@@ -49,4 +52,18 @@ setup(
     ext_modules=[libfdt_module],
     package_dir={'': os.path.join(srcdir, 'pylibfdt')},
     py_modules=['libfdt'],
+
+    long_description=long_description,
+    long_description_content_type="text/plain",
+    url="https://git.kernel.org/pub/scm/utils/dtc/dtc.git",
+    license="BSD",
+    license_files=["GPL", "BSD-2-Clause"],
+
+    classifiers=[
+        "Programming Language :: Python :: 3",
+        "License :: OSI Approved :: BSD License",
+        "License :: OSI Approved :: GNU General Public License v2 or later (GPLv2+)",
+        "Operating System :: OS Independent",
+    ],
+
 )
-- 
2.32.0

