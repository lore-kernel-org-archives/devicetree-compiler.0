From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: [PATCH 4/4] pylibfdt: add FdtRo.getprop_or_none()
Date: Sat, 25 Dec 2021 14:25:58 +0100
Message-ID: <20211225132558.167123-5-luca@z3ntu.xyz>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1640438780; bh=of62/GE/o3XTP/DCSyfiWFqaka+bYeEACPdSGEa8NFY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=zC2Nk89/A2cVTmohqHyVjShnBlEH7ooAtE4GGRQEUKyecUVMNwS36e9VjBTATk/v3
         Hg7E3xjLQbixwbRRIaEvLXQbTTMigdryfzlwVIw6PHcXB0ZPqD2VK1BmY5zSm981EF
         PfuZCxjlJF59MzeRCW/+q4GQjzGzmqSc2c3K6RE8=
In-Reply-To: <20211225132558.167123-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

Add a new method that doesn't throw an exception when a property isn't
found but returns None instead.

Also add a test for the new method.

Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
---
 pylibfdt/libfdt.i       | 10 ++++++++++
 tests/pylibfdt_tests.py |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 5434d48..2c2fa5c 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -419,6 +419,16 @@ class FdtRo(object):
             return pdata
         return Property(prop_name, bytearray(pdata[0]))
 
+    def getprop_or_none(self, nodeoffset, prop_name):
+        """Get a property from a node, or None if it is not found
+
+        See getprop() for the arguments.
+        """
+        prop = self.getprop(nodeoffset, prop_name, [FDT_ERR_NOTFOUND])
+        if prop == -FDT_ERR_NOTFOUND:
+            return None
+        return prop
+
     def get_phandle(self, nodeoffset):
         """Get the phandle of a node
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index bcd3daa..152e925 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -219,6 +219,8 @@ class PyLibfdtBasicTests(unittest.TestCase):
             self.fdt.getprop(root, 'missing')
         self.assertEqual(e.exception.err, -libfdt.NOTFOUND)
 
+        self.assertIsNone(self.fdt.getprop_or_none(root, 'missing'))
+
         node = self.fdt.path_offset('/subnode@1/subsubnode')
         value = self.fdt.getprop(node, "compatible")
         self.assertEqual(value, b'subsubnode1\0subsubnode\0')
-- 
2.34.1

