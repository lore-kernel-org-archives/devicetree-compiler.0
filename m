From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v8 2/5] Add tests for pylibfdt
Date: Tue, 28 Feb 2017 22:34:12 -0700
Message-ID: <20170301053415.5388-3-sjg@chromium.org>
References: <20170301053415.5388-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YCYCcapma0QnWfbUTsPlo042ls3xn254Phzhon/AbcI=;
        b=lYXmwoBahEMF5WjNEyQ88Z4qXUTsgStxaI3MUjOr1WVa1Ad0nMcl707YA4NcZivmuQ
         2Zsk0/Fj+apdfQ0Ddh0AKI6pvBgrlgNiELtVsE1fUAhVpDE2Ry5ds5Ctc7pF1qbw5Yxw
         hAdoYYkiOgYSKah7YyGCVHFpCBWfeGFC1CuGT9TDmmWbbkNmJmgMdmFu/JS0fpcSu91d
         QOdG+vLERf2lfAMVFJFNmg9VKrYlRu2wXbUperMmOpHrqP1hi4HHlZon5TTh/ChzHSZI
         sUGF/fZa1vwnF947w7FoRxH7SyElu5yiPA0m40T1WCyGf2XABiGhznBgkAhUsaIP/uNr
         0bbA==
In-Reply-To: <20170301053415.5388-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add a set of tests to cover the functionality in pylibfdt.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v8:
- Avoid using hard-coded offsets (ROOT_PROPS)
- Use types.ModuleType instead of type(str)
- Compare exception number instead of using a regex
- Avoid using hard-coded size
- Drop testEndian()

Changes in v7:
- Add a test for QUIET_ALL

Changes in v6:
- Adjust tests to avoid checking a hard-coded offset
- Use 0 instead of self.fdt.path_offset('/')
- Adjust the totalsize() test to compare against the file size
- Adjust test result processing to avoid using awk

Changes in v5:
- Adjust tests to match new swig bindings

Changes in v4:
- Drop tests that are no-longer applicable
- Add a get for getprop()

Changes in v3:
- Add some more tests

Changes in v2:
- Update tests for new pylibfdt
- Add a few more tests to increase coverage

 tests/pylibfdt_tests.py | 284 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh      |  16 ++-
 2 files changed, 299 insertions(+), 1 deletion(-)
 create mode 100644 tests/pylibfdt_tests.py

diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
new file mode 100644
index 0000000..84d4ed5
--- /dev/null
+++ b/tests/pylibfdt_tests.py
@@ -0,0 +1,284 @@
+# pylibfdt - Tests for Flat Device Tree manipulation in Python
+# Copyright (C) 2017 Google, Inc.
+# Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+#
+# libfdt is dual licensed: you can use it either under the terms of
+# the GPL, or the BSD license, at your option.
+#
+#  a) This library is free software; you can redistribute it and/or
+#     modify it under the terms of the GNU General Public License as
+#     published by the Free Software Foundation; either version 2 of the
+#     License, or (at your option) any later version.
+#
+#     This library is distributed in the hope that it will be useful,
+#     but WITHOUT ANY WARRANTY; without even the implied warranty of
+#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#     GNU General Public License for more details.
+#
+#     You should have received a copy of the GNU General Public
+#     License along with this library; if not, write to the Free
+#     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+#     MA 02110-1301 USA
+#
+# Alternatively,
+#
+#  b) Redistribution and use in source and binary forms, with or
+#     without modification, are permitted provided that the following
+#     conditions are met:
+#
+#     1. Redistributions of source code must retain the above
+#        copyright notice, this list of conditions and the following
+#        disclaimer.
+#     2. Redistributions in binary form must reproduce the above
+#        copyright notice, this list of conditions and the following
+#        disclaimer in the documentation and/or other materials
+#        provided with the distribution.
+#
+#     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+#     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
+#     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+#     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+#     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
+#     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+#     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+#     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+#     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+#     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+#     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+#     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
+#     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+#
+
+import sys
+import types
+import unittest
+
+sys.path.append('../pylibfdt')
+import libfdt
+from libfdt import FdtException, QUIET_NOTFOUND, QUIET_ALL
+
+def get_err(err_code):
+    """Convert an error code into an error message
+
+    Args:
+        err_code: Error code value (FDT_ERR_...)
+
+    Returns:
+        String error code
+    """
+    return 'pylibfdt error %d: %s' % (-err_code, libfdt.fdt_strerror(-err_code))
+
+def _ReadFdt(fname):
+    """Read a device tree file into an Fdt object, ready for use
+
+    Args:
+        fname: Filename to read from
+
+    Returns:
+        Fdt bytearray suitable for passing to libfdt functions
+    """
+    return libfdt.Fdt(open(fname).read())
+
+class PyLibfdtTests(unittest.TestCase):
+    """Test class for pylibfdt
+
+    Properties:
+        fdt: Device tree file used for testing
+    """
+
+    def setUp(self):
+        """Read in the device tree we use for testing"""
+        self.fdt = _ReadFdt('test_tree1.dtb')
+
+    def GetPropList(self, node_path):
+        """Read a list of properties from a node
+
+        Args:
+            node_path: Full path to node, e.g. '/subnode@1/subsubnode'
+
+        Returns:
+            List of property names for that node, e.g. ['compatible', 'reg']
+        """
+        prop_list = []
+        node = self.fdt.path_offset(node_path)
+        poffset = self.fdt.first_property_offset(node, QUIET_NOTFOUND)
+        while poffset > 0:
+            prop = self.fdt.get_property_by_offset(poffset)
+            prop_list.append(prop.name)
+            poffset = self.fdt.next_property_offset(poffset, QUIET_NOTFOUND)
+        return prop_list
+
+    def testImport(self):
+        """Check that we can import the library correctly"""
+        self.assertEquals(type(libfdt), types.ModuleType)
+
+    def testBadFdt(self):
+        """Check that a filename provided accidentally is not accepted"""
+        with self.assertRaises(FdtException) as e:
+            fdt = libfdt.Fdt('a string')
+        self.assertEquals(e.exception.err, -libfdt.BADMAGIC)
+
+    def testPathOffset(self):
+        """Check that we can find the offset of a node"""
+        self.assertEquals(self.fdt.path_offset('/'), 0)
+        self.assertTrue(self.fdt.path_offset('/subnode@1') > 0)
+        with self.assertRaises(FdtException) as e:
+            self.fdt.path_offset('/wibble')
+        self.assertEquals(e.exception.err, -libfdt.NOTFOUND)
+        self.assertEquals(self.fdt.path_offset('/wibble', QUIET_NOTFOUND),
+                          -libfdt.NOTFOUND)
+
+    def testPropertyOffset(self):
+        """Walk through all the properties in the root node"""
+        offset = self.fdt.first_property_offset(0)
+        self.assertTrue(offset > 0)
+        for i in range(5):
+            next_offset = self.fdt.next_property_offset(offset)
+            self.assertTrue(next_offset > offset)
+            offset = next_offset
+        self.assertEquals(self.fdt.next_property_offset(offset, QUIET_NOTFOUND),
+                          -libfdt.NOTFOUND)
+
+    def testPropertyOffsetExceptions(self):
+        """Check that exceptions are raised as expected"""
+        with self.assertRaises(FdtException) as e:
+            self.fdt.first_property_offset(107)
+        self.assertEquals(e.exception.err, -libfdt.BADOFFSET)
+        with self.assertRaises(FdtException) as e:
+            self.fdt.first_property_offset(107, QUIET_NOTFOUND)
+        self.assertEquals(e.exception.err, -libfdt.BADOFFSET)
+        with self.assertRaises(FdtException) as e:
+            self.fdt.next_property_offset(107, QUIET_NOTFOUND)
+        self.assertEquals(e.exception.err, -libfdt.BADOFFSET)
+
+        node = self.fdt.path_offset('/subnode@1/ss1')
+        self.assertEquals(self.fdt.first_property_offset(node, QUIET_NOTFOUND),
+                          -libfdt.NOTFOUND)
+        with self.assertRaises(FdtException) as e:
+            self.fdt.first_property_offset(node)
+        self.assertEquals(e.exception.err, -libfdt.NOTFOUND)
+
+    def testGetName(self):
+        """Check that we can get the name of a node"""
+        self.assertEquals(self.fdt.get_name(0), '')
+        node = self.fdt.path_offset('/subnode@1/subsubnode')
+        self.assertEquals(self.fdt.get_name(node), 'subsubnode')
+
+        with self.assertRaises(FdtException) as e:
+            self.fdt.get_name(-2)
+        self.assertEquals(e.exception.err, -libfdt.BADOFFSET)
+
+    def testGetPropertyByOffset(self):
+        """Check that we can read the name and contents of a property"""
+        root = 0
+        poffset = self.fdt.first_property_offset(root)
+        prop = self.fdt.get_property_by_offset(poffset)
+        self.assertEquals(prop.name, 'compatible')
+        self.assertEquals(prop.value, 'test_tree1\0')
+
+        with self.assertRaises(FdtException) as e:
+            self.fdt.get_property_by_offset(-2)
+        self.assertEquals(e.exception.err, -libfdt.BADOFFSET)
+        self.assertEquals(
+                -libfdt.BADOFFSET,
+                self.fdt.get_property_by_offset(-2, [libfdt.BADOFFSET]))
+
+    def testGetProp(self):
+        """Check that we can read the contents of a property by name"""
+        root = self.fdt.path_offset('/')
+        value = self.fdt.getprop(root, "compatible")
+        self.assertEquals(value, 'test_tree1\0')
+        self.assertEquals(-libfdt.NOTFOUND, self.fdt.getprop(root, 'missing',
+                                                             QUIET_NOTFOUND))
+
+        with self.assertRaises(FdtException) as e:
+            self.fdt.getprop(root, 'missing')
+        self.assertEquals(e.exception.err, -libfdt.NOTFOUND)
+
+        node = self.fdt.path_offset('/subnode@1/subsubnode')
+        value = self.fdt.getprop(node, "compatible")
+        self.assertEquals(value, 'subsubnode1\0subsubnode\0')
+
+    def testStrError(self):
+        """Check that we can get an error string"""
+        self.assertEquals(libfdt.strerror(-libfdt.NOTFOUND),
+                          'FDT_ERR_NOTFOUND')
+
+    def testFirstNextSubnodeOffset(self):
+        """Check that we can walk through subnodes"""
+        node_list = []
+        node = self.fdt.first_subnode(0, QUIET_NOTFOUND)
+        while node >= 0:
+            node_list.append(self.fdt.get_name(node))
+            node = self.fdt.next_subnode(node, QUIET_NOTFOUND)
+        self.assertEquals(node_list, ['subnode@1', 'subnode@2'])
+
+    def testFirstNextSubnodeOffsetExceptions(self):
+        """Check except handling for first/next subnode functions"""
+        node = self.fdt.path_offset('/subnode@1/subsubnode', QUIET_NOTFOUND)
+        self.assertEquals(self.fdt.first_subnode(node, QUIET_NOTFOUND),
+                          -libfdt.NOTFOUND)
+        with self.assertRaises(FdtException) as e:
+            self.fdt.first_subnode(node)
+        self.assertEquals(e.exception.err, -libfdt.NOTFOUND)
+
+        node = self.fdt.path_offset('/subnode@1/ss1', QUIET_NOTFOUND)
+        self.assertEquals(self.fdt.next_subnode(node, QUIET_NOTFOUND),
+                          -libfdt.NOTFOUND)
+        with self.assertRaises(FdtException) as e:
+            self.fdt.next_subnode(node)
+        self.assertEquals(e.exception.err, -libfdt.NOTFOUND)
+
+    def testDeleteProperty(self):
+        """Test that we can delete a property"""
+        node_name = '/subnode@1'
+        self.assertEquals(self.GetPropList(node_name),
+                          ['compatible', 'reg', 'prop-int'])
+        node = self.fdt.path_offset('/%s' % node_name)
+        self.assertEquals(self.fdt.delprop(node, 'reg'), 0)
+        self.assertEquals(self.GetPropList(node_name),
+                          ['compatible', 'prop-int'])
+
+    def testHeader(self):
+        """Test that we can access the header values"""
+        self.assertEquals(self.fdt.totalsize(), len(self.fdt._fdt))
+        self.assertEquals(self.fdt.off_dt_struct(), 88)
+
+    def testPack(self):
+        """Test that we can pack the tree after deleting something"""
+        orig_size = self.fdt.totalsize()
+        node = self.fdt.path_offset('/subnode@2', QUIET_NOTFOUND)
+        self.assertEquals(self.fdt.delprop(node, 'prop-int'), 0)
+        self.assertEquals(orig_size, self.fdt.totalsize())
+        self.assertEquals(self.fdt.pack(), 0)
+        self.assertTrue(self.fdt.totalsize() < orig_size)
+
+    def testBadPropertyOffset(self):
+        """Test that bad property offsets are detected"""
+        with self.assertRaises(FdtException) as e:
+            self.fdt.get_property_by_offset(13)
+        self.assertEquals(e.exception.err, -libfdt.BADOFFSET)
+        with self.assertRaises(FdtException) as e:
+            self.fdt.first_property_offset(3)
+        self.assertEquals(e.exception.err, -libfdt.BADOFFSET)
+        with self.assertRaises(FdtException) as e:
+            self.fdt.next_property_offset(3)
+        self.assertEquals(e.exception.err, -libfdt.BADOFFSET)
+
+    def testBadPathOffset(self):
+        """Test that bad path names are detected"""
+        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADPATH)):
+            self.fdt.path_offset('not-present')
+
+    def testQuietAll(self):
+        """Check that exceptions can be masked by QUIET_ALL"""
+        self.assertEquals(-libfdt.NOTFOUND,
+                          self.fdt.path_offset('/missing', QUIET_ALL))
+        self.assertEquals(-libfdt.BADOFFSET,
+                          self.fdt.get_property_by_offset(13, QUIET_ALL))
+        self.assertEquals(-libfdt.BADPATH,
+                          self.fdt.path_offset('missing', QUIET_ALL))
+
+
+if __name__ == "__main__":
+    unittest.main()
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index ed489db..76d20d8 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -769,6 +769,17 @@ fdtdump_tests () {
     run_fdtdump_test fdtdump.dts
 }
 
+pylibfdt_tests () {
+    TMP=/tmp/tests.stderr.$$
+    python pylibfdt_tests.py 2> ${TMP}
+    result=$(head -1 ${TMP})
+
+    # Extract the test results and add them to our totals
+    tot_fail=$((tot_fail + $(echo $result | tr -d '\n.' | wc -c)))
+    tot_pass=$((tot_pass + $(echo $result | tr -d '\nF' | wc -c)))
+    tot_tests=$((tot_tests + $(echo $result | tr -d '\n' | wc -c)))
+}
+
 while getopts "vt:me" ARG ; do
     case $ARG in
 	"v")
@@ -787,7 +798,7 @@ while getopts "vt:me" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump"
+    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump pylibfdt"
 fi
 
 # Make sure we don't have stale blobs lying around
@@ -816,6 +827,9 @@ for set in $TESTSETS; do
 	"fdtdump")
 	    fdtdump_tests
 	    ;;
+	"pylibfdt")
+	    pylibfdt_tests
+	    ;;
     esac
 done
 
-- 
2.12.0.rc1.440.g5b76565f74-goog
