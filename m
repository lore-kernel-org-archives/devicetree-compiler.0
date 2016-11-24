From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 2/4] Add tests for pylibfdt
Date: Thu, 24 Nov 2016 11:07:20 -0700
Message-ID: <1480010842-13957-3-git-send-email-sjg@chromium.org>
References: <1480010842-13957-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=k7AEpAHZa/2jszXx+/1HXu2MsMVYScqPlRDdFowIaDI=;
        b=UuBUCZUaQAE/OPf+TAeXZkKMjKv3q/eLGeaf81yQrC4bNufPzdJ9HtVTYnETwWrXM+
         foHKCAZuUWQPuaOn3S3l1qQTChGsZFwEpKlIlCUWv3YwYnHvtDaZ2ht0ujri8UMbe5M+
         NrmYSR2lnpO6XfNfthajpPYnroA8o0QNd3YIshMF2e7J1ZW4twP22ImTqfSBId5Jw7aX
         uHZIrEU0klikjA4wyGRzw+NwBJj/oZgiVazrVkjpFwPoyQPAO29dVEyjRm+jPFG1t6lQ
         G2ZM0oYqcd3eccUuScDL+pwNnzLrZ/OVC8QpjJkUgW7SxuNWdE/f8t+tQBdePtbEj2f+
         8cRA==
In-Reply-To: <1480010842-13957-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v2:
- Update tests for new pylibfdt
- Add a few more tests to increase coverage

 tests/pylibfdt_tests.py | 245 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh      |  19 +++-
 2 files changed, 263 insertions(+), 1 deletion(-)
 create mode 100644 tests/pylibfdt_tests.py

diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
new file mode 100644
index 0000000..5eaaa4c
--- /dev/null
+++ b/tests/pylibfdt_tests.py
@@ -0,0 +1,245 @@
+# pylibfdt - Tests for Flat Device Tree manipulation in Python
+# Copyright (C) 2016 Google, Inc.
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
+import unittest
+
+sys.path.append('../pylibfdt')
+import libfdt
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
+    """Test class for pylibfdt.
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
+        poffset = self.fdt.first_property_offset_quiet(node)
+        while poffset > 0:
+            pdata = self.fdt.get_property_by_offset(poffset)
+            prop_list.append(self.fdt.string(pdata.nameoff))
+            poffset = self.fdt.next_property_offset_quiet(poffset)
+        return prop_list
+
+    def testImport(self):
+        """Check that we can import the library correctly"""
+        self.assertEquals(type(libfdt), type(sys))
+
+    def testPathOffset(self):
+        """Check that we can find the offset of a node"""
+        self.assertEquals(self.fdt.path_offset('/'), 0)
+        self.assertEquals(self.fdt.path_offset('/subnode@1'), 124)
+
+    def testPropertyOffset(self):
+        """Walk through all the properties in the root node"""
+        self.assertEquals(self.fdt.first_property_offset(0), 8)
+        self.assertEquals(self.fdt.next_property_offset(8), 32)
+        self.assertEquals(self.fdt.next_property_offset(32), 48)
+        self.assertEquals(self.fdt.next_property_offset(48), 68)
+        self.assertEquals(self.fdt.next_property_offset(68), 92)
+        self.assertEquals(self.fdt.next_property_offset(92), 108)
+        self.assertEquals(self.fdt.next_property_offset_quiet(108),
+                          -libfdt.NOTFOUND)
+
+    def testPropertyOffsetExceptions(self):
+        """Check that exceptions are raised as expected"""
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.NOTFOUND)):
+            self.fdt.next_property_offset(108)
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.BADOFFSET)):
+            self.fdt.next_property_offset(107)
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.BADOFFSET)):
+            self.fdt.first_property_offset_quiet(107)
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.BADOFFSET)):
+            self.fdt.next_property_offset_quiet(107)
+
+        node = self.fdt.path_offset('/subnode@1/ss1')
+        self.assertEquals(self.fdt.first_property_offset_quiet(node),
+                          -libfdt.NOTFOUND)
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.NOTFOUND)):
+            self.fdt.first_property_offset(node)
+
+    def testGetName(self):
+        """Check that we can get the name of a node"""
+        self.assertEquals(self.fdt.get_name(0), ['', 0])
+        node = self.fdt.path_offset('/subnode@1/subsubnode')
+        self.assertEquals(self.fdt.get_name(node),
+                          ['subsubnode', 10])
+
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.BADOFFSET)):
+            self.fdt.get_name(-2)
+
+    def testGetString(self):
+        """Test that we can get a string from the string table"""
+        node = self.fdt.path_offset('/subnode@2')
+        poffset = self.fdt.first_property_offset(node)
+        pdata = self.fdt.get_property_by_offset(poffset)
+        self.assertEquals(self.fdt.string(pdata.nameoff), 'reg')
+
+    def testGetPropertyByOffset(self):
+        """Check that we can read the name and contents of a property"""
+        root = self.fdt.path_offset('/')
+        poffset = self.fdt.first_property_offset(root)
+        pdata = self.fdt.get_property_by_offset(poffset)
+        self.assertEquals(libfdt.fdt32_to_cpu(pdata.tag), 3)
+        self.assertEquals(libfdt.fdt32_to_cpu(pdata.len), 11)
+        self.assertEquals(self.fdt.string(pdata.nameoff), 'compatible')
+        self.assertEquals(self.fdt.data(pdata), 'test_tree1\0')
+
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.BADOFFSET)):
+            self.fdt.get_property_by_offset(-2)
+
+    def testStrError(self):
+        """Check that we can get an error string"""
+        self.assertEquals(self.fdt.strerror(-libfdt.NOTFOUND),
+                          'FDT_ERR_NOTFOUND')
+
+    def testFirstNextSubnode(self):
+        """Check that we can walk through subnodes"""
+        node_list = []
+        node = self.fdt.first_subnode_quiet(0)
+        while node >= 0:
+            node_list.append(self.fdt.get_name(node)[0])
+            node = self.fdt.next_subnode_quiet(node)
+        self.assertEquals(node_list, ['subnode@1', 'subnode@2'])
+
+    def testFirstNextSubnodeExceptions(self):
+        """Check except handling for first/next subnode functions"""
+        node = self.fdt.path_offset('/subnode@1/subsubnode')
+        self.assertEquals(self.fdt.first_subnode_quiet(node), -libfdt.NOTFOUND)
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.NOTFOUND)):
+            self.fdt.first_subnode(node)
+
+        node = self.fdt.path_offset('/subnode@1/ss1')
+        self.assertEquals(self.fdt.next_subnode_quiet(node), -libfdt.NOTFOUND)
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.NOTFOUND)):
+            self.fdt.next_subnode(node)
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
+        self.assertEquals(self.fdt.totalsize(), 693)
+        self.assertEquals(self.fdt.off_dt_struct(), 88)
+
+    def testPack(self):
+        """Test that we can pack the tree after deleting something"""
+        self.assertEquals(self.fdt.totalsize(), 693)
+        node = self.fdt.path_offset('/subnode@2')
+        self.assertEquals(self.fdt.delprop(node, 'prop-int'), 0)
+        self.assertEquals(self.fdt.totalsize(), 693)
+        self.assertEquals(self.fdt.pack(), 0)
+        self.assertEquals(self.fdt.totalsize(), 677)
+
+    def testBadPropertyOffset(self):
+        """Test that bad property offsets are detected"""
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.BADOFFSET)):
+            self.fdt.get_property_by_offset(13)
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.BADOFFSET)):
+            self.fdt.first_property_offset(3)
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.BADOFFSET)):
+            self.fdt.next_property_offset(3)
+
+    def testBadPathOffset(self):
+        """Test that bad path names are detected"""
+        with self.assertRaisesRegexp(RuntimeError, get_err(libfdt.BADPATH)):
+            self.fdt.path_offset('not-present')
+
+    def testEndian(self):
+        """Check that we can convert from FDT (big endian) to native endian"""
+        self.assertEquals(libfdt.fdt32_to_cpu(0x10000000), 0x10)
+
+if __name__ == "__main__":
+    unittest.main()
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e4139dd..707702d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -720,6 +720,20 @@ fdtdump_tests () {
     run_fdtdump_test fdtdump.dts
 }
 
+pylibfdt_tests () {
+    TMP=/tmp/tests.stderr.$$
+    python pylibfdt_tests.py 2> ${TMP}
+    result=$(head -1 ${TMP} | awk \
+        '{ for (i = 1; i <= length($0); i++) { \
+            result = substr($0,i,1); fail = fail + (result == "F"); \
+            ok = ok + (result == ".")}; } END { print fail,  ok, fail + ok}')
+
+    # Extract the test results and add them to our totals
+    tot_fail=$((tot_fail + $(echo $result | cut -d" " -f 1)))
+    tot_pass=$((tot_pass + $(echo $result | cut -d" " -f 2)))
+    tot_tests=$((tot_tests + $(echo $result | cut -d" " -f 3)))
+}
+
 while getopts "vt:me" ARG ; do
     case $ARG in
 	"v")
@@ -738,7 +752,7 @@ while getopts "vt:me" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump"
+    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump pylibfdt"
 fi
 
 # Make sure we don't have stale blobs lying around
@@ -767,6 +781,9 @@ for set in $TESTSETS; do
 	"fdtdump")
 	    fdtdump_tests
 	    ;;
+	"pylibfdt")
+	    pylibfdt_tests
+	    ;;
     esac
 done
 
-- 
2.8.0.rc3.226.g39d4020
