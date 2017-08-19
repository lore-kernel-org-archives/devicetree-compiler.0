From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 01/10] pylibfdt: Add a test for use of uint32_t
Date: Sat, 19 Aug 2017 11:17:54 -0600
Message-ID: <20170819171803.195806-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=wWlKhjfUmPntLUki0e0uOydYk3/OuZ7ouTM09i84bzw=;
        b=Gt/utawkYuDbzZoaY5vk7dITcKegUvxvYRrIDaQRCdWA+/r+zj8QTLBW+/FV68GqkI
         jTw6ewoGTBY2a1i5/BXIRuUKaQqBReMn6wRqIsdkLa15aYso4WfRHnkOJBEgfMdF9KFp
         36A2zWFGhRfINfQCPkLSC4wx1/N/yI4bzZyFER1BrIaw42qBrGYD9hhjYr57xpMWJJUm
         6gfst242Hi0SryToocxCYVkJ+tz0Uai/PuxVwikhDbdLRH50ELvrs9Enmib6TzQjZ3Ei
         1jna5wiBM+m9zMTOkX5UD1kedRodW9/lEK2MAIpJN+KzGUlVJkTndyHZ1ATs16LaTKVk
         QyxA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Using the libfdt function without going through the Python Fdt class
requires use of the uint32_t type. Add a test that this works correctly.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 tests/pylibfdt_tests.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index ae392bb..e8a4582 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -283,6 +283,11 @@ class PyLibfdtTests(unittest.TestCase):
         self.assertEquals(-libfdt.BADPATH,
                           self.fdt.path_offset('missing', QUIET_ALL))
 
+    def testIntegers(self):
+        """Check that integers can be passed and returned"""
+        self.assertEquals(0, libfdt.fdt_get_phandle(self.fdt._fdt, 0))
+        node2 = self.fdt.path_offset('/subnode@2')
+        self.assertEquals(0x2000, libfdt.fdt_get_phandle(self.fdt._fdt, node2))
 
 if __name__ == "__main__":
     unittest.main()
-- 
2.14.1.480.gb18f417b89-goog
