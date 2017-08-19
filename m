From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 05/10] pylibfdt: Add support for fdt_parent_offset()
Date: Sat, 19 Aug 2017 11:17:58 -0600
Message-ID: <20170819171803.195806-5-sjg@chromium.org>
References: <20170819171803.195806-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JsCBFghxDzdJD5loZ2114O0b+D4LLHIiCbHuzzvh7JE=;
        b=v88ztofe0EO7FoCs546o3gacZ5GujWbVndE7WOkIRVtWkzDSDQshXm6x5sCwUaNtpI
         pPFVohQIyN4HKIvU6bDCyk6COYbYGSBATHgC9qKqoFOEkT4JROl42VTUcKNV/c+R6eLC
         n18jHEFT0ypp0U5ZG9O0UAnVDuyDjTytkj4lIkGrH6fG4iu9/o/8QahSwLmMm0uOS8g+
         RkGvCU6znadfNCdenCTZ9m7ZtugqDc3yp+7ZX3GzsSA4Js/SL42GDC5zWE4v2fVoiaTb
         AnkMWaKpM1PcTmP5M/f0siHLar7y4YxTX2wshFs4KsHsA7kjk898mLGvKR4XMdseSMZK
         10UQ==
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

 pylibfdt/libfdt.i       | 15 +++++++++++++++
 tests/pylibfdt_tests.py | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 0731202..5a1eba5 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -360,6 +360,21 @@ class Fdt:
         """
         return fdt_get_phandle(self._fdt, nodeoffset)
 
+    def parent_offset(self, nodeoffset, quiet=()):
+        """Get the offset of a node's parent
+
+        Args:
+            nodeoffset: Node offset to check
+            quiet: Errors to ignore (empty to raise on all errors)
+
+        Returns:
+            The offset of the parent node, if any
+
+        Raises:
+            FdtException if no parent found or other error occurs
+        """
+        return check_err(fdt_parent_offset(self._fdt, nodeoffset), quiet)
+
 
 class Property:
     """Holds a device tree property name and value.
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 14820d5..6b024d4 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -295,5 +295,18 @@ class PyLibfdtTests(unittest.TestCase):
         node2 = self.fdt.path_offset('/subnode@2')
         self.assertEquals(0x2000, self.fdt.get_phandle(node2))
 
+    def testParentOffset(self):
+        """Test for the parent_offset() method"""
+        self.assertEquals(-libfdt.NOTFOUND,
+                          self.fdt.parent_offset(0, QUIET_NOTFOUND))
+        with self.assertRaises(FdtException) as e:
+            self.fdt.parent_offset(0)
+        self.assertEquals(e.exception.err, -libfdt.NOTFOUND)
+
+        node1 = self.fdt.path_offset('/subnode@2')
+        self.assertEquals(0, self.fdt.parent_offset(node1))
+        node2 = self.fdt.path_offset('/subnode@2/subsubnode@0')
+        self.assertEquals(node1, self.fdt.parent_offset(node2))
+
 if __name__ == "__main__":
     unittest.main()
-- 
2.14.1.480.gb18f417b89-goog
