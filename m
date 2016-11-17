From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/4] Add tests for pylibfdt
Date: Thu, 17 Nov 2016 15:53:23 -0700
Message-ID: <1479423205-9817-3-git-send-email-sjg@chromium.org>
References: <1479423205-9817-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZHbVMWcPMdaPCks5ksH8yYRHqbyf2VqnjDxJk9S30cw=;
        b=TtFTNUNcv+HK9HXdI2PLhvuBdRIsavgguyqfMXkmAYxkpflMUJYkJCGzNOfQLD9AIy
         9gOmbbcT48ctj5L3zdiDp4HYFBnVyynGEnoxUoygduq/vS83jCQ4Ilq/f/waL0ab8IZm
         yQKwfmzigIZE99yaPj9lGbuB201a2GCeWBC//i5cFGJ6wD57xNgX2+Jxqum2DIHjN3no
         nuhAdtHLWNI6ZFNgvso9eomsqH2LaJ/KEgpoqUTkWLdAplEsvuD8Eu3TF1v6TubGOxuH
         kWeaGDbUcCDKAypG0h62z+DdmOkQFzF53Fpm6wVUBgXY3p62RTREzPVd38UJhkid5R14
         SrOQ==
In-Reply-To: <1479423205-9817-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 tests/pylibfdt_tests.py | 179 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh      |  19 ++++-
 2 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 tests/pylibfdt_tests.py

diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
new file mode 100644
index 0000000..c406ac9
--- /dev/null
+++ b/tests/pylibfdt_tests.py
@@ -0,0 +1,179 @@
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
+class PyLibfdtTests(unittest.TestCase):
+    """Test class for pylibfdt.
+
+    Properties:
+        fdt: Device tree file used for testing
+    """
+
+    def setUp(self):
+        """Read in the device tree we use for testing"""
+        self.fdt = self._ReadFdt('test_tree1.dtb')
+
+    def _ReadFdt(self, fname):
+        """Read a device tree file into a bytearray ready for use
+
+        Args:
+            fname: Filename to read from
+
+        Returns:
+            Fdt bytearray suitable for passing to libfdt functions
+        """
+        return bytearray(open(fname).read())
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
+        node = libfdt.fdt_path_offset(self.fdt, node_path)
+        poffset = libfdt.fdt_first_property_offset(self.fdt, node)
+        while poffset >= 0:
+            pdata, plen = libfdt.fdt_get_property_by_offset(self.fdt, poffset)
+            prop_list.append(libfdt.String(self.fdt, pdata.nameoff))
+            poffset = libfdt.fdt_next_property_offset(self.fdt, poffset)
+        return prop_list
+
+    def testImport(self):
+        """Check that we can import the library correctly"""
+        self.assertEquals(type(libfdt), type(sys))
+
+    def testPathOffset(self):
+        """Check that we can find the offset of a node"""
+        self.assertEquals(libfdt.fdt_path_offset(self.fdt, '/'), 0)
+        self.assertEquals(libfdt.fdt_path_offset(self.fdt, '/subnode@1'), 124)
+
+    def testPropertyOffset(self):
+        """Walk through all the properties in the root node"""
+        self.assertEquals(libfdt.fdt_first_property_offset(self.fdt, 0), 8)
+        self.assertEquals(libfdt.fdt_next_property_offset(self.fdt, 8), 32)
+        self.assertEquals(libfdt.fdt_next_property_offset(self.fdt, 32), 48)
+        self.assertEquals(libfdt.fdt_next_property_offset(self.fdt, 48), 68)
+        self.assertEquals(libfdt.fdt_next_property_offset(self.fdt, 68), 92)
+        self.assertEquals(libfdt.fdt_next_property_offset(self.fdt, 92), 108)
+        self.assertEquals(libfdt.fdt_next_property_offset(self.fdt, 108), -1)
+
+    def testGetName(self):
+        """Check that we can get the name of a node"""
+        self.assertEquals(libfdt.fdt_get_name(self.fdt, 0), ['', 0])
+        node = libfdt.fdt_path_offset(self.fdt, '/subnode@1/subsubnode')
+        self.assertEquals(libfdt.fdt_get_name(self.fdt, node),
+                          ['subsubnode', 10])
+
+    def testGetString(self):
+        """Test that we can get a string from the string table"""
+        node = libfdt.fdt_path_offset(self.fdt, '/subnode@2')
+        poffset = libfdt.fdt_first_property_offset(self.fdt, node)
+        pdata, plen = libfdt.fdt_get_property_by_offset(self.fdt, poffset)
+        self.assertEquals(libfdt.String(self.fdt, pdata.nameoff), 'reg')
+
+    def testGetPropertyByOffset(self):
+        """Check that we can read the name and contents of a property"""
+        root = libfdt.fdt_path_offset(self.fdt, '/')
+        poffset = libfdt.fdt_first_property_offset(self.fdt, root)
+        pdata, plen = libfdt.fdt_get_property_by_offset(self.fdt, poffset)
+        self.assertEquals(libfdt.fdt32_to_cpu(pdata.tag), 3)
+        self.assertEquals(libfdt.fdt32_to_cpu(pdata.len), 11)
+        self.assertEquals(libfdt.String(self.fdt, pdata.nameoff), 'compatible')
+        self.assertEquals(libfdt.Data(pdata), 'test_tree1\0')
+
+    def testStrError(self):
+        """Check that we can get an error string"""
+        self.assertEquals(libfdt.fdt_strerror(-1), 'FDT_ERR_NOTFOUND')
+
+    def testFirstNextSubnode(self):
+        """Check that we can walk through subnodes"""
+        node_list = []
+        node = libfdt.fdt_first_subnode(self.fdt, 0)
+        while node >= 0:
+            node_list.append(libfdt.fdt_get_name(self.fdt, node)[0])
+            node = libfdt.fdt_next_subnode(self.fdt, node)
+        self.assertEquals(node_list, ['subnode@1', 'subnode@2'])
+
+    def testDeleteProperty(self):
+        """Test that we can delete a property"""
+        node_name = '/subnode@1'
+        self.assertEquals(self.GetPropList(node_name),
+                          ['compatible', 'reg', 'prop-int'])
+        node = libfdt.fdt_path_offset(self.fdt, '/%s' % node_name)
+        self.assertEquals(libfdt.fdt_delprop(self.fdt, node, 'reg'), 0)
+        self.assertEquals(self.GetPropList(node_name),
+                          ['compatible', 'prop-int'])
+
+    def testHeader(self):
+        """Test that we can access the header values"""
+        self.assertEquals(libfdt.fdt_totalsize(self.fdt), 693)
+        self.assertEquals(libfdt.fdt_off_dt_struct(self.fdt), 88)
+
+    def testPack(self):
+        """Test that we can pack the tree after deleting something"""
+        self.assertEquals(libfdt.fdt_totalsize(self.fdt), 693)
+        node = libfdt.fdt_path_offset(self.fdt, '/subnode@2')
+        self.assertEquals(libfdt.fdt_delprop(self.fdt, node, 'prop-int'), 0)
+        self.assertEquals(libfdt.fdt_totalsize(self.fdt), 693)
+        self.assertEquals(libfdt.fdt_pack(self.fdt), 0)
+        self.assertEquals(libfdt.fdt_totalsize(self.fdt), 677)
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
