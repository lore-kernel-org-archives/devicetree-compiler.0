From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] pylibfdt: Support boolean properties
Date: Tue, 12 Sep 2023 12:27:13 -0600
Message-ID: <20230912182716.248253-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694543241; x=1695148041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FjtihsEkHMZczrhX5iZGvO2h1m73bOMOQggk0AyCmv4=;
        b=HqhW6qOgoqd4zQo5q4VvP+5yL9C1fMAXHJOP1pzvp1VgT9TnWaEe/9knw0aALQdMGZ
         pHCCSICSDgrpEwbzej7oghht41FTo0oX4IVl6BLG+09yKAssLN6iQr5GLcVFBI5Fa5EE
         t13+x6AOIgllgq8sCFwsob9ez5i+raG4LSyUk=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Boolean properties are unusual in that their presense or absence
indicates the value of the property. This makes them a little painful to
support using the existing getprop() support.

Add new methods to deal with booleans specifically.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2:
- Drop debug-related Makefile change
- Drop duplicate setprop_u32() test
- Add a separate test for hasprop()
- Drop checking of no-space since testSetProp() already has that

 pylibfdt/libfdt.i       | 55 +++++++++++++++++++++++++++++++++++++++++
 tests/pylibfdt_tests.py | 33 +++++++++++++++++++++++++
 tests/test_props.dts    |  1 +
 3 files changed, 89 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 2361e22..0b50983 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -419,6 +419,35 @@ class FdtRo(object):
             return pdata
         return Property(prop_name, bytearray(pdata[0]))
 
+    def hasprop(self, nodeoffset, prop_name, quiet=()):
+        """Check if a node has a property
+
+        This can be used to check boolean properties
+
+        Args:
+            nodeoffset: Node offset containing property to check
+            prop_name: Name of property to check
+            quiet: Errors to ignore (empty to raise on all errors). Note that
+                NOTFOUND is added internally by this function so need not be
+                provided
+
+        Returns:
+            True if the property exists in the node, else False. If an error
+                other than -NOTFOUND is returned by fdt_getprop() then the error
+                is return (-ve integer)
+
+        Raises:
+            FdtError if any error occurs other than NOTFOUND (e.g. the
+                nodeoffset is invalid)
+        """
+        pdata = check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_name),
+                               quiet + (NOTFOUND,))
+        if isinstance(pdata, (int)):
+            if pdata == -NOTFOUND:
+                return False
+            return pdata
+        return True
+
     def get_phandle(self, nodeoffset):
         """Get the phandle of a node
 
@@ -605,6 +634,32 @@ class Fdt(FdtRo):
         return check_err(fdt_setprop(self._fdt, nodeoffset, prop_name, val,
                                      len(val)), quiet)
 
+    def setprop_bool(self, nodeoffset, prop_name, val, quiet=()):
+        """Set the boolean value of a property
+
+        Either:
+            adds the property if not already present; or
+            deletes the property if present
+
+        Args:
+            nodeoffset: Node offset containing the property to create/delete
+            prop_name: Name of property
+            val: Boolean value to write (i.e. True or False)
+            quiet: Errors to ignore (empty to raise on all errors)
+
+        Returns:
+            Error code, or 0 if OK
+
+        Raises:
+            FdtException if no parent found or other error occurs
+        """
+        exists = self.hasprop(nodeoffset, prop_name, quiet)
+        if val != exists:
+            if val:
+                return self.setprop(nodeoffset, prop_name, b'', quiet=quiet)
+            else:
+                return self.delprop(nodeoffset, prop_name, quiet=quiet)
+
     def setprop_u32(self, nodeoffset, prop_name, val, quiet=()):
         """Set the value of a property
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 34c2764..a4f73ed 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -496,6 +496,39 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(TEST_STRING_3,
                           self.fdt.getprop(node, prop).as_str())
 
+    def testHasProp(self):
+        """Test that we can check if a node has a property"""
+        node = 0
+        self.assertFalse(self.fdt2.hasprop(node, 'missing'))
+        self.assertTrue(self.fdt2.hasprop(node, 'prop-bool'))
+
+        # Test a property with a non-empty value
+        self.assertTrue(self.fdt2.hasprop(node, 'prop-uint64'))
+
+    def testSetPropBool(self):
+        """Test that we can update and create boolean properties"""
+        node = 0
+        prop = 'prop-bool'
+
+        # Make some space and then try setting a new boolean property
+        self.fdt.resize(self.fdt.totalsize() + 50)
+        self.fdt.hasprop(node, 'missing')
+        self.fdt.setprop_bool(node, 'missing', True)
+        self.assertTrue(self.fdt.hasprop(node, 'missing'))
+
+        # Trying toggling an existing boolean property. Do each operation twice
+        # to make sure that the behaviour is correct when setting the property
+        # to the same value.
+        self.assertTrue(self.fdt2.hasprop(node, prop))
+        self.fdt2.setprop_bool(node, prop, False)
+        self.assertFalse(self.fdt2.hasprop(node, prop))
+        self.fdt2.setprop_bool(node, prop, False)
+        self.assertFalse(self.fdt2.hasprop(node, prop))
+        self.fdt2.setprop_bool(node, prop, True)
+        self.assertTrue(self.fdt2.hasprop(node, prop))
+        self.fdt2.setprop_bool(node, prop, True)
+        self.assertTrue(self.fdt2.hasprop(node, prop))
+
     def testSetName(self):
         """Test that we can update a node name"""
         node = self.fdt.path_offset('/subnode@1')
diff --git a/tests/test_props.dts b/tests/test_props.dts
index 5089023..09be197 100644
--- a/tests/test_props.dts
+++ b/tests/test_props.dts
@@ -12,4 +12,5 @@
 	prop-uint32-array = <0x1>, <0x98765432>, <0xdeadbeef>;
 	prop-int64-array = /bits/ 64 <0x100000000 0xfffffffffffffffe>;
 	prop-uint64-array = /bits/ 64 <0x100000000 0x1>;
+	prop-bool;
 };
-- 
2.42.0.283.g2d96d420d3-goog

