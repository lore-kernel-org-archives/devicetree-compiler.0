From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 06/10] pylibfdt: Add support for fdt_node_offset_by_phandle()
Date: Sat, 19 Aug 2017 11:17:59 -0600
Message-ID: <20170819171803.195806-6-sjg@chromium.org>
References: <20170819171803.195806-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cTzTZkoyELShsNlX7eoBRZWe/RiCBrXqDoduaLpM/Uo=;
        b=KK7+SEZk0h0Y/DLdq/D/xvlWcxaGbvVl2H0yzkdPhDzEmtN3q4v18n2NS2Im1XVyak
         OtVhLu8odjEGJpgPVdv35Jq2pX3vFKkyyfbWk0EUq9XEli31tQvfov2xAIl8h74BTY2l
         Med8AJY7BB5OXKDWoujmUrZE82UJV/i1yOtO17pqU1PAjcLE73seXv/dVtYhOwcKjkI1
         OXhwxVz/uOmoJah+c2qXfnVZeyPqnqKACjI2nshSuLo+YQtaKtzVmSMJnKgBj7tQg7BG
         bZKraF60MhI375Tg8Y1x1l5mYkvWnnWQEdnIU+ECx6O9MvTU3lnVAxi+XQIbZZhNTT8l
         Mo/Q==
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

 pylibfdt/libfdt.i       | 14 ++++++++++++++
 tests/pylibfdt_tests.py | 10 ++++++++++
 2 files changed, 24 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 5a1eba5..d492d58 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -375,6 +375,20 @@ class Fdt:
         """
         return check_err(fdt_parent_offset(self._fdt, nodeoffset), quiet)
 
+    def node_offset_by_phandle(self, phandle, quiet=()):
+        """Get the offset of a node with the given phandle
+
+        Args:
+            phandle: Phandle to search for
+            quiet: Errors to ignore (empty to raise on all errors)
+
+        Returns:
+            The offset of node with that phandle, if any
+
+        Raises:
+            FdtException if no node found or other error occurs
+        """
+        return check_err(fdt_node_offset_by_phandle(self._fdt, phandle), quiet)
 
 class Property:
     """Holds a device tree property name and value.
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 6b024d4..8028c1a 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -308,5 +308,15 @@ class PyLibfdtTests(unittest.TestCase):
         node2 = self.fdt.path_offset('/subnode@2/subsubnode@0')
         self.assertEquals(node1, self.fdt.parent_offset(node2))
 
+    def testNodeOffsetByPhandle(self):
+        """Test for the node_offset_by_phandle() method"""
+        self.assertEquals(-libfdt.NOTFOUND,
+                          self.fdt.node_offset_by_phandle(1, QUIET_NOTFOUND))
+        node1 = self.fdt.path_offset('/subnode@2')
+        self.assertEquals(node1, self.fdt.node_offset_by_phandle(0x2000))
+        node2 = self.fdt.path_offset('/subnode@2/subsubnode@0')
+        self.assertEquals(node2, self.fdt.node_offset_by_phandle(0x2001))
+
+
 if __name__ == "__main__":
     unittest.main()
-- 
2.14.1.480.gb18f417b89-goog
