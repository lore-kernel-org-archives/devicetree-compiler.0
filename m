From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/2] pylibfdt: Add a method to access the device tree directly
Date: Thu, 31 Aug 2017 04:41:59 -0600
Message-ID: <20170831104200.47974-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=pKL1RlCBf9Iqup/G2LeEAl5Pv8pU0J2MpbBf6lPEdkg=;
        b=aXCqIeTz2tFSsWhH0Xmu38trN/Qb9cyeoQ6sf2/PanRGpvBqcVMnpQT8+Ix7QvEGkl
         kVV7K0EwiQ0UgMesrncGqnIC9gR/294eY1mjywVL3Nn+TgkBz1TXQ55jOW06YWUh91Z1
         vaY4BqwM9XQkRNuzUsu59Q+LvyyBcrvTHOguucrhzVrld3OGbRGSlOE0UO+Srfzy4Dkf
         7Bl5wlDqaqAN07yIvf2caRCwdwqYBrs6hnfA6jNuK3nJ8zAfgSw8BKNmCsE/2qw6VZDb
         /yblqdDNxnhkXr+WRMZssyyMV7CTkbVLcRY6pnJ1falBv+fUEcWIDWsLV+x/ey2D5F47
         biMg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

When calling libfdt functions which are not supported by the Fdt class it
is necessary to get direct access to the device tree data. At present this
requries using the internal _fdt member. Add a new method to provide
public access to this.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2:
- Change from get_fdt() to as_bytearray()

 pylibfdt/libfdt.i       | 11 +++++++++++
 tests/pylibfdt_tests.py |  5 +++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 415820d..f8e3a2c 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -174,6 +174,17 @@ class Fdt:
         self._fdt = bytearray(data)
         check_err(fdt_check_header(self._fdt));
 
+    def as_bytearray(self):
+        """Get the device tree contents as a bytearray
+
+        This can be passed directly to libfdt functions that access a
+        const void * for the device tree.
+
+        Returns:
+            bytearray containing the device tree
+        """
+        return self._fdt
+
     def subnode_offset(self, parentoffset, name, quiet=()):
         """Get the offset of a named subnode
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 95d911a..0ec0f38 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -297,9 +297,10 @@ class PyLibfdtTests(unittest.TestCase):
 
     def testIntegers(self):
         """Check that integers can be passed and returned"""
-        self.assertEquals(0, libfdt.fdt_get_phandle(self.fdt._fdt, 0))
+        self.assertEquals(0, libfdt.fdt_get_phandle(self.fdt.as_bytearray(), 0))
         node2 = self.fdt.path_offset('/subnode@2')
-        self.assertEquals(0x2000, libfdt.fdt_get_phandle(self.fdt._fdt, node2))
+        self.assertEquals(
+                0x2000, libfdt.fdt_get_phandle(self.fdt.as_bytearray(), node2))
 
     def testGetPhandle(self):
         """Test for the get_phandle() method"""
-- 
2.14.1.581.gf28d330327-goog
