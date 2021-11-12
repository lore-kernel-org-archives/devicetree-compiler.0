From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/6] pylibfdt_tests: Don't depend on built dtbs
Date: Thu, 11 Nov 2021 22:16:30 -0600
Message-ID: <20211112041633.741598-4-robh@kernel.org>
References: <20211112041633.741598-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211112041633.741598-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The pylibfdt tests depend on the rest of the tests to build dtbs, but
are otherwise independent. Modify the test to build dtbs itself so the
python tests can run standalone.

This also fixes an intermittent problem with the DT strings section size
varying depending on how the dtb was built. The test assumed the dtb was
built with '-H both' option which is pretty much impossible to tell from
run_tests.sh.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 tests/pylibfdt_tests.py | 22 ++++++++++++++--------
 tests/run_tests.sh      |  1 -
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 64b5bd1258f8..1025f192207a 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -4,10 +4,14 @@
 # Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 #
 
+import os
 import struct
 import sys
 import types
 import unittest
+import subprocess
+
+testsrc = os.path.dirname(__file__)
 
 sys.path.insert(0, '../pylibfdt')
 import libfdt
@@ -64,8 +68,9 @@ def _ReadFdt(fname):
     Returns:
         Fdt bytearray suitable for passing to libfdt functions
     """
-    with open(fname, mode='rb') as f:
-        return libfdt.Fdt(f.read())
+
+    dtb = subprocess.run(['dtc', '-O', 'dtb', fname], stdout=subprocess.PIPE)
+    return libfdt.Fdt(dtb.stdout)
 
 class PyLibfdtBasicTests(unittest.TestCase):
     """Test class for basic pylibfdt access functions
@@ -76,9 +81,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
 
     def setUp(self):
         """Read in the device tree we use for testing"""
-        self.fdt = _ReadFdt('test_tree1.dtb')
-        self.fdt2 = _ReadFdt('test_props.dtb')
-        self.fdt3 = _ReadFdt('aliases.dtb')
+        self.fdt = _ReadFdt(os.path.join(testsrc, 'test_tree1.dts'))
+        self.fdt2 = _ReadFdt(os.path.join(testsrc, 'test_props.dts'))
+        self.fdt3 = _ReadFdt(os.path.join(testsrc, 'aliases.dts'))
 
     def GetPropList(self, node_path):
         """Read a list of properties from a node
@@ -291,7 +296,7 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(self.fdt.version(), 17)
         self.assertEqual(self.fdt.last_comp_version(), 16)
         self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
-        self.assertEqual(self.fdt.size_dt_strings(), 105)
+        self.assertEqual(self.fdt.size_dt_strings(), 97)
         self.assertEqual(self.fdt.size_dt_struct(), 564)
 
     def testPack(self):
@@ -575,8 +580,9 @@ class PyLibfdtRoTests(unittest.TestCase):
 
     def setUp(self):
         """Read in the device tree we use for testing"""
-        with open('test_tree1.dtb', mode='rb') as f:
-            self.fdt = libfdt.FdtRo(f.read())
+        dtb = subprocess.run(['dtc', '-O', 'dtb', os.path.join(testsrc, 'test_tree1.dts')],
+                    stdout=subprocess.PIPE)
+        self.fdt = libfdt.FdtRo(dtb.stdout)
 
     def testAccess(self):
         """Basic sanity check for the FdtRo class"""
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index d100d5aaa21f..140ac03e721d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1012,7 +1012,6 @@ fdtoverlay_tests() {
 }
 
 pylibfdt_tests () {
-    run_dtc_test -I dts -O dtb -o test_props.dtb "$SRCDIR/test_props.dts"
     TMP=/tmp/tests.stderr.$$
     $PYTHON "$SRCDIR/pylibfdt_tests.py" -v 2> $TMP
 
-- 
2.32.0

