From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: [PATCH 1/4] pylibfdt: add Property.as_stringlist()
Date: Sat, 25 Dec 2021 14:25:55 +0100
Message-ID: <20211225132558.167123-2-luca@z3ntu.xyz>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1640438779; bh=RcUIf/qSJ2lNjMIaG0xF4EhqVJhmCvOHwtpQhdiRAbg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=u+Ml/b18dKslt9VQye/hdHNvGOcnNdOGokciSdxySsW3q32cOuhXdZ1xXn/wtKouk
         tN0Kjuwk/YslpskMiYCSneQiVEmhEzBG6cxkj4J8SUKgoewUQCCUJeyqEO102ETvYJ
         ckA7coqmtIWEcz718zQNagQT/M1e+x4ltCFMyRf0=
In-Reply-To: <20211225132558.167123-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

Add a new method for decoding a string list property, useful for e.g.
the "reg-names" property.

Also add a test for the new method.

Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
---
 pylibfdt/libfdt.i       | 7 +++++++
 tests/pylibfdt_tests.py | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 9ccc57b..c81b504 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -724,6 +724,13 @@ class Property(bytearray):
             raise ValueError('Property contains embedded nul characters')
         return self[:-1].decode('utf-8')
 
+    def as_stringlist(self):
+        """Unicode is supported by decoding from UTF-8"""
+        if self[-1] != 0:
+            raise ValueError('Property lacks nul termination')
+        parts = self[:-1].split(b'\x00')
+        return list(map(lambda x: x.decode('utf-8'), parts))
+
 
 class FdtSw(FdtRo):
     """Software interface to create a device tree from scratch
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 64b5bd1..7e3cc4c 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -382,6 +382,14 @@ class PyLibfdtBasicTests(unittest.TestCase):
                           self.get_prop("prop-uint64").as_uint64())
         self.assertEqual(-2, self.get_prop("prop-int64").as_int64())
 
+    def testGetStringlistProperties(self):
+        """Test that we can access properties as string list"""
+        node = self.fdt.path_offset('/subnode@1/subsubnode')
+        self.assertEqual(["subsubnode1", "subsubnode"],
+                         self.fdt.getprop(node, "compatible").as_stringlist())
+        self.assertEqual(["this is a placeholder string", "string2"],
+                         self.fdt.getprop(node, "placeholder").as_stringlist())
+
     def testReserveMap(self):
         """Test that we can access the memory reserve map"""
         self.assertEqual(2, self.fdt.num_mem_rsv())
-- 
2.34.1

