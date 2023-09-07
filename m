From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] pylibfdt: Support boolean properties
Date: Thu,  7 Sep 2023 08:45:30 -0600
Message-ID: <20230907144531.28735-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694101085; x=1694705885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kSnnZVhAa4da8h1jL4V4GdnyOHY9nwPc2cnb8koqVI=;
        b=OAdmDhqMUjB7rGvFs0AVdKHMxZxzoLawWBGW7qOnXer1K27Gez27U+CNWHwPPZ9E28
         7Q6CsV2TjRWngxx0iwjKROJ0/SHuIGNEBrXwCznksiOuaAhEmaugeywD+JQpGhliXxzd
         9mPJspUmCIe1OJorXcZfSCluPIFwKzhYAwvW0=
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

 Makefile                |  3 ++-
 pylibfdt/libfdt.i       | 55 +++++++++++++++++++++++++++++++++++++++++
 tests/pylibfdt_tests.py | 34 +++++++++++++++++++++++++
 tests/test_props.dts    |  1 +
 4 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6ccee13..4a40993 100644
--- a/Makefile
+++ b/Makefile
@@ -24,8 +24,9 @@ CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
 WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs -Wsign-compare \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow \
 	-Wsuggest-attribute=format -Wwrite-strings
-CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
+CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) $(WARNINGS) $(EXTRA_CFLAGS)
 
+# -Werror
 BISON = bison
 LEX = flex
 SWIG = swig
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
index 34c2764..6ef8f34 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -496,6 +496,40 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(TEST_STRING_3,
                           self.fdt.getprop(node, prop).as_str())
 
+    def testSetPropU32(self):
+        """Test that we can update and create integer properties"""
+        node = 0
+        prop = 'prop-int'
+        self.fdt.setprop_u32(node, prop, TEST_VALUE_1)
+        self.assertEqual(struct.pack('>I', TEST_VALUE_1),
+                          self.fdt.getprop(node, prop))
+
+    def testSetPropBool(self):
+        """Test that we can update and create boolean properties"""
+        node = 0
+        prop = 'prop-bool'
+
+        # Check adding where there is no space
+        self.assertFalse(self.fdt2.hasprop(node, 'missing'))
+        self.assertEqual(
+            -libfdt.NOSPACE,
+            self.fdt2.setprop_bool(node, 'missing', True,
+                                   quiet=(libfdt.NOSPACE,)))
+        self.assertFalse(self.fdt2.hasprop(node, 'missing'))
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

