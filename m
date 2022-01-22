From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: [PATCH v2] pylibfdt: add FdtRo.get_path()
Date: Sat, 22 Jan 2022 11:56:54 +0100
Message-ID: <20220122105653.31219-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1642849161; bh=xdNeBgoeK2GyByIXpvOXhvrTFpc0G8k1cgonDlgQ7V8=;
        h=From:To:Cc:Subject:Date;
        b=rmgPOO6mGbMyYXHU/ng/wi7aBhNZ6Nc1GxceUtd0W3IJ9cY2pMyeJeKZw4sUNawuK
         fZ8hfz5wlfrsJg9xOFmdT1dw0dtVt4XY+942SWS+KyoQaQjbz8njigMghozvPPfKcP
         6LLoJHHeT7l6/gzfez3zW2fiFuwvCqb3BjFqIEZg=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

Add a new Python method wrapping fdt_get_path() from the C API.

Also add a test for the new method.

Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
---
Changes in v2:
- dynamically increase size of string buffer until it fits.
  The values are chosen relatively arbitrary, and terminates at lengths
  over than 4096 as I don't expect paths to be longer and there should
  be an exit condition to not eat up RAM in case of some bug.

 pylibfdt/libfdt.i       | 27 +++++++++++++++++++++++++++
 tests/pylibfdt_tests.py |  7 +++++++
 2 files changed, 34 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index ac70762..d103bb6 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -443,6 +443,28 @@ class FdtRo(object):
         """
         return fdt_get_alias(self._fdt, name)
 
+    def get_path(self, nodeoffset):
+        """Get the full path of a node
+
+        Args:
+            nodeoffset: Node offset to check
+
+        Returns:
+            Full path to the node
+
+        Raises:
+            FdtException if the path is longer than 'size' or other error occurs
+        """
+        size = 64
+        while size < 4096:
+            ret, path = fdt_get_path(self._fdt, nodeoffset, size)
+            if ret == -NOSPACE:
+                size += 64
+                continue
+            check_err(ret)
+            return path
+        raise ValueError('Node path is unexpectedly long')
+
     def parent_offset(self, nodeoffset, quiet=()):
         """Get the offset of a node's parent
 
@@ -1115,6 +1137,11 @@ typedef uint32_t fdt32_t;
         }
 }
 
+%include "cstring.i"
+
+%cstring_output_maxsize(char *buf, int buflen);
+int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
+
 /* We have both struct fdt_property and a function fdt_property() */
 %warnfilter(302) fdt_property;
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 5479363..2335a73 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -348,6 +348,13 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual("/subnode@1/subsubnode", self.fdt3.get_alias('ss1'))
         self.assertEqual("/subnode@1/subsubnode/subsubsubnode", self.fdt3.get_alias('sss1'))
 
+    def testGetPath(self):
+        """Test for the get_path() method"""
+        node = self.fdt.path_offset('/subnode@1')
+        node2 = self.fdt.path_offset('/subnode@1/subsubnode')
+        self.assertEqual("/subnode@1", self.fdt.get_path(node))
+        self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(node2))
+
     def testParentOffset(self):
         """Test for the parent_offset() method"""
         self.assertEqual(-libfdt.NOTFOUND,
-- 
2.34.1

