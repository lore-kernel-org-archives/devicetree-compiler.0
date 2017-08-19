From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 04/10] pylibfdt: Add support for fdt_get_phandle()
Date: Sat, 19 Aug 2017 11:17:57 -0600
Message-ID: <20170819171803.195806-4-sjg@chromium.org>
References: <20170819171803.195806-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OkYXlnWaS4hDDnUKvnHc9JMORc7Mc3dH7BRKovDUTPg=;
        b=wHv3deLLQnjk+IJfNnZEwfEQAXe5w5O0Qyml6LgkhaBpAPRJ5RZqL2S2bE8P8wQRWy
         elBnHbfOmcBS/5GhsITe92aw4TaJDxGYgOX/nB7H/C8XojHAub5N1K6VMR4w6BUh3lfi
         368ORL0Q0QGoJT5yyAFe+nJ9qVHJNRqiSjo6GC05CVEnIPhVXfzX3o0dN/oaSTqWpXnc
         PQBiMCwRJssDfW8M9Jpbiv+e09QkMu4K6m5m6+PzJuEVNgP4PmJ3KIiUHvx7W60+FiMw
         JUn+z2QN+axQcMqSlYmxWoyCaXKgiINuZxHtQiKd6X5GZGYnd5QhN5W23rBBGyUp5dQJ
         bXsg==
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

 pylibfdt/libfdt.i       | 12 ++++++++++++
 tests/pylibfdt_tests.py |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index c7b79ec..0731202 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -348,6 +348,18 @@ class Fdt:
             return pdata
         return bytearray(pdata[0])
 
+    def get_phandle(self, nodeoffset):
+        """Get the phandle of a node
+
+        Args:
+            nodeoffset: Node offset to check
+
+        Returns:
+            phandle of node, or 0 if the node has no phandle or another error
+            occurs
+        """
+        return fdt_get_phandle(self._fdt, nodeoffset)
+
 
 class Property:
     """Holds a device tree property name and value.
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 32a1daa..14820d5 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -289,5 +289,11 @@ class PyLibfdtTests(unittest.TestCase):
         node2 = self.fdt.path_offset('/subnode@2')
         self.assertEquals(0x2000, libfdt.fdt_get_phandle(self.fdt._fdt, node2))
 
+    def testGetPhandle(self):
+        """Test for the get_phandle() method"""
+        self.assertEquals(0, self.fdt.get_phandle(0))
+        node2 = self.fdt.path_offset('/subnode@2')
+        self.assertEquals(0x2000, self.fdt.get_phandle(node2))
+
 if __name__ == "__main__":
     unittest.main()
-- 
2.14.1.480.gb18f417b89-goog
