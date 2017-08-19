From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 08/10] pylibfdt: Add support for fdt_subnode_offset()
Date: Sat, 19 Aug 2017 11:18:01 -0600
Message-ID: <20170819171803.195806-8-sjg@chromium.org>
References: <20170819171803.195806-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iMoegE1Z//2t2zA1UQZqy1Q+OiSws5G/TjXxcQhV0aY=;
        b=fs28CZwd2AQ5Ao4rNTU/38ixdQE6p1DBRaxs12TMFtArM7HtrwOri75QRQCet9/Mtb
         zWzNBAjuL4BmCRYj0ApoeuW+MjOxcVq+G/GXHF+IBMEY1wMbFBVENQCf0t6Qld9PmeDs
         I8pBdu/dSEf1dv3GbIa+RP/z1p/2g5CJpb5Z9CNt9tSkStl0ln42UYCORv8AZDn7ToSh
         Mtw3HM84mSAq5KdXn0EkruPmrSIU55DNPjoD6BUgSnoORSy/xdS6uHa+KgfKoi0Y0H0a
         cybYoxskETX46PyI6p5K8R8sIqBixpFMt/ZFM+hv2mqUcdt/GcazHEIXJNIgE4vk1Hoa
         WPJA==
In-Reply-To: <20170819171803.195806-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add this into the class to simplify use of this function.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 pylibfdt/libfdt.i       | 17 +++++++++++++++++
 tests/pylibfdt_tests.py | 12 ++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 1f6809e..47d34ae 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -185,6 +185,23 @@ class Fdt:
         """
         return self._fdt
 
+    def subnode_offset(self, parentoffset, name, quiet=()):
+        """Get the offset of a named subnode
+
+        Args:
+            parentoffset: Offset of the parent node to check
+            name: Name of the required subnode, e.g. 'subnode@1'
+            quiet: Errors to ignore (empty to raise on all errors)
+
+        Returns:
+            The node offset of the found node, if any
+
+        Raises
+            FdtException if there is no node with that name, or other error
+        """
+        return check_err(fdt_subnode_offset(self._fdt, parentoffset, name),
+                         quiet)
+
     def path_offset(self, path, quiet=()):
         """Get the offset for a given path
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index a775d37..a6e3354 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -118,6 +118,18 @@ class PyLibfdtTests(unittest.TestCase):
             fdt = libfdt.Fdt('a string')
         self.assertEquals(e.exception.err, -libfdt.BADMAGIC)
 
+    def testSubnodeOffset(self):
+        """check that we can locate a subnode by name"""
+        node1 = self.fdt.path_offset('/subnode@1')
+        self.assertEquals(self.fdt.subnode_offset(0, 'subnode@1'), node1)
+
+        with self.assertRaises(FdtException) as e:
+            self.fdt.subnode_offset(0, 'missing')
+        self.assertEquals(e.exception.err, -libfdt.NOTFOUND)
+
+        node2 = self.fdt.path_offset('/subnode@1/subsubnode')
+        self.assertEquals(self.fdt.subnode_offset(node1, 'subsubnode'), node2)
+
     def testPathOffset(self):
         """Check that we can find the offset of a node"""
         self.assertEquals(self.fdt.path_offset('/'), 0)
-- 
2.14.1.480.gb18f417b89-goog
