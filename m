From: Ross Burton <ross.burton-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] pylibfdt: fix with Python 3.10
Date: Thu, 11 Nov 2021 15:45:48 +0000
Message-ID: <20211111154548.2515068-1-ross.burton@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Since Python 2.5 the argument parsing functions when parsing expressions
such as s# (string plus length) expect the length to be an int or a
ssize_t, depending on whether PY_SSIZE_T_CLEAN is defined or not.

Python 3.8 deprecated the use of int, and with Python 3.10 this symbol
must be defined and ssize_t used[1].

Define the magic symbol when building the extension, and cast the ints
from the libfdt API to ssize_t as appropriate.

[1] https://docs.python.org/3.10/whatsnew/3.10.html#id2

Signed-off-by: Ross Burton <ross.burton-5wv7dgnIgG8@public.gmane.org>
---
 pylibfdt/libfdt.i | 4 ++--
 pylibfdt/setup.py | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 51ee801..075ef70 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -1044,9 +1044,9 @@ typedef uint32_t fdt32_t;
 		$result = Py_None;
 	else
         %#if PY_VERSION_HEX >= 0x03000000
-            $result = Py_BuildValue("y#", $1, *arg4);
+            $result = Py_BuildValue("y#", $1, (Py_ssize_t)*arg4);
         %#else
-            $result = Py_BuildValue("s#", $1, *arg4);
+            $result = Py_BuildValue("s#", $1, (Py_ssize_t)*arg4);
         %#endif
 }
 
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index ef40f15..81e161a 100755
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -42,6 +42,7 @@ def get_version():
 libfdt_module = Extension(
     '_libfdt',
     sources=[os.path.join(srcdir, 'libfdt.i')],
+    define_macros=[('PY_SSIZE_T_CLEAN', None)],
     include_dirs=[os.path.join(srcdir, '../libfdt')],
     libraries=['fdt'],
     library_dirs=[os.path.join(top_builddir, 'libfdt')],
-- 
2.25.1

