From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: [PATCH 2/4] pylibfdt: add Property.as_*int*_array()
Date: Sat, 25 Dec 2021 14:25:56 +0100
Message-ID: <20211225132558.167123-3-luca@z3ntu.xyz>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1640438780; bh=6udFDaK+6ofZmEPaJbNhzwvbViJvUmyL+b17HApJCu0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Rmf/wWcN7UT6zm1aIRqqjAFgmoM0jua4XyaIgmMppKDYDOafkOGP2ru3pDQg2xeYw
         MwfezRQptrnLDDfk84EC6EwP7XJhpvQT6IH9CYnAwqLG1B+J86Dwl8mUJjdJW2Dkzq
         mQ0wyRh0CD/oK/7VwfYrOXF4fhuPwhSeaqx8BcZ8=
In-Reply-To: <20211225132558.167123-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

Add new methods to handle decoding of int32, uint32, int64 and uint64
arrays.

Also add tests for the new methods.

Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
---
 pylibfdt/libfdt.i       | 15 +++++++++++++++
 tests/pylibfdt_tests.py | 11 +++++++++++
 tests/test_props.dts    |  4 ++++
 3 files changed, 30 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index c81b504..ac70762 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -716,6 +716,21 @@ class Property(bytearray):
     def as_int64(self):
         return self.as_cell('q')
 
+    def as_list(self, fmt):
+        return list(map(lambda x: x[0], struct.iter_unpack('>' + fmt, self)))
+
+    def as_uint32_list(self):
+        return self.as_list('L')
+
+    def as_int32_list(self):
+        return self.as_list('l')
+
+    def as_uint64_list(self):
+        return self.as_list('Q')
+
+    def as_int64_list(self):
+        return self.as_list('q')
+
     def as_str(self):
         """Unicode is supported by decoding from UTF-8"""
         if self[-1] != 0:
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 7e3cc4c..5479363 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -382,6 +382,17 @@ class PyLibfdtBasicTests(unittest.TestCase):
                           self.get_prop("prop-uint64").as_uint64())
         self.assertEqual(-2, self.get_prop("prop-int64").as_int64())
 
+    def testGetIntListProperties(self):
+        """Test that we can access properties as integer lists"""
+        self.assertEqual([128, -16, -2],
+                         self.get_prop("prop-int32-array").as_int32_list())
+        self.assertEqual([0x1, 0x98765432, 0xdeadbeef],
+                         self.get_prop("prop-uint32-array").as_uint32_list())
+        self.assertEqual([0x100000000, -2],
+                         self.get_prop("prop-int64-array").as_int64_list())
+        self.assertEqual([0x100000000, 0x1],
+                         self.get_prop("prop-uint64-array").as_uint64_list())
+
     def testGetStringlistProperties(self):
         """Test that we can access properties as string list"""
         node = self.fdt.path_offset('/subnode@1/subsubnode')
diff --git a/tests/test_props.dts b/tests/test_props.dts
index 7e59bd1..5089023 100644
--- a/tests/test_props.dts
+++ b/tests/test_props.dts
@@ -8,4 +8,8 @@
 	prop-hex64 = /bits/ 64 <0xdeadbeef01abcdef>;
 	prop-uint64 = /bits/ 64 <9223372036854775807>;
 	prop-int64 = /bits/ 64 <0xfffffffffffffffe>;
+	prop-int32-array = <128>, <(-16)>, <0xfffffffe>;
+	prop-uint32-array = <0x1>, <0x98765432>, <0xdeadbeef>;
+	prop-int64-array = /bits/ 64 <0x100000000 0xfffffffffffffffe>;
+	prop-uint64-array = /bits/ 64 <0x100000000 0x1>;
 };
-- 
2.34.1

