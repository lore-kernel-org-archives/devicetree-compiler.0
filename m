From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 07/10] pylibfdt: Add a method to access the device tree directly
Date: Sat, 19 Aug 2017 11:18:00 -0600
Message-ID: <20170819171803.195806-7-sjg@chromium.org>
References: <20170819171803.195806-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Gt4KxQ2gcrusQETwyw08nOgTVaA/bLHOw1lya7Zuhtw=;
        b=WA4RyepZsmSU5fCmXo7QZ9/AvFPbEEjUpL9LwtbHLhVenNNmL60QH3WZ4pQmNdzcmP
         kiAUmLSjMt/lI+575ZjU9ErACP/Re6/hnxKWOZeD8zlq7Ad634ZqUOQ2vvfrtNrevFVR
         s05ZvRf4oea2kax5N8mfYfnuP6pS8knNHS5VLKBk0Mv2HLvF92STcyyDAch0HfQyD2qh
         5fwFMw/M7mnQb7MTdUtIVRTpzV5jLhiQC/KB7EClOZ8drRokHH/f2MSugodJ833HlGkc
         kzJBUpSK9jFdGyUfubDpGVloK0RHlPvwfNxHG3ODqdJ8+WJ6WfS4WrSUBguKgUd7NTZf
         Q0hg==
In-Reply-To: <20170819171803.195806-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

 pylibfdt/libfdt.i       | 11 +++++++++++
 tests/pylibfdt_tests.py |  5 +++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index d492d58..1f6809e 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -174,6 +174,17 @@ class Fdt:
         self._fdt = bytearray(data)
         check_err(fdt_check_header(self._fdt));
 
+    def get_fdt(self):
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
     def path_offset(self, path, quiet=()):
         """Get the offset for a given path
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 8028c1a..a775d37 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -285,9 +285,10 @@ class PyLibfdtTests(unittest.TestCase):
 
     def testIntegers(self):
         """Check that integers can be passed and returned"""
-        self.assertEquals(0, libfdt.fdt_get_phandle(self.fdt._fdt, 0))
+        self.assertEquals(0, libfdt.fdt_get_phandle(self.fdt.get_fdt(), 0))
         node2 = self.fdt.path_offset('/subnode@2')
-        self.assertEquals(0x2000, libfdt.fdt_get_phandle(self.fdt._fdt, node2))
+        self.assertEquals(0x2000,
+                          libfdt.fdt_get_phandle(self.fdt.get_fdt(), node2))
 
     def testGetPhandle(self):
         """Test for the get_phandle() method"""
-- 
2.14.1.480.gb18f417b89-goog
