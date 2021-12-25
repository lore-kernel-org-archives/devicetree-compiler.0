From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: [PATCH 3/4] pylibfdt: add FdtRo.get_path()
Date: Sat, 25 Dec 2021 14:25:57 +0100
Message-ID: <20211225132558.167123-4-luca@z3ntu.xyz>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1640438780; bh=KL1v+N2vIWOwctfIP/VJDRQI5AxEc5bUswBPQF2mcXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=wty/VB36qqLtSkfcS84G6vIT24DKYcQOC+rhyzsea1RB2lax4wba5XEPfq/E6F4iS
         Q3oEQhpgsU2rGMnErIZbh6imcZ+D4CdUy3bIUfCBuxeIi3iom/Cld9cX40ZCjeMjIk
         zrscAyfkaCTsk6rQzC1XckBaHNMaCben1+yC40xk=
In-Reply-To: <20211225132558.167123-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

Add a new Python method wrapping fdt_get_path() from the C API.

Also add a test for the new method.

Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
---
 pylibfdt/libfdt.i       | 21 +++++++++++++++++++++
 tests/pylibfdt_tests.py | 12 ++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index ac70762..5434d48 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -443,6 +443,22 @@ class FdtRo(object):
         """
         return fdt_get_alias(self._fdt, name)
 
+    def get_path(self, nodeoffset, size=128):
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
+        ret, path = fdt_get_path(self._fdt, nodeoffset, size)
+        check_err(ret)
+        return path
+
     def parent_offset(self, nodeoffset, quiet=()):
         """Get the offset of a node's parent
 
@@ -1115,6 +1131,11 @@ typedef uint32_t fdt32_t;
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
index 5479363..bcd3daa 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -348,6 +348,18 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual("/subnode@1/subsubnode", self.fdt3.get_alias('ss1'))
         self.assertEqual("/subnode@1/subsubnode/subsubsubnode", self.fdt3.get_alias('sss1'))
 
+    def testGetPath(self):
+        """Test for the get_path() method"""
+        node = self.fdt.path_offset('/subnode@1')
+        node2 = self.fdt.path_offset('/subnode@1/subsubnode')
+        self.assertEqual("/subnode@1", self.fdt.get_path(node))
+        self.assertEqual("/subnode@1", self.fdt.get_path(node, 16))
+        self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(node2))
+
+        with self.assertRaises(FdtException) as e:
+            self.fdt.get_path(node2, 16)
+        self.assertEqual(e.exception.err, -libfdt.NOSPACE)
+
     def testParentOffset(self):
         """Test for the parent_offset() method"""
         self.assertEqual(-libfdt.NOTFOUND,
-- 
2.34.1

