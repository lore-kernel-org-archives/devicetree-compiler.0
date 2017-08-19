From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 02/10] pylibfdt: Use local pylibfdt module
Date: Sat, 19 Aug 2017 11:17:55 -0600
Message-ID: <20170819171803.195806-2-sjg@chromium.org>
References: <20170819171803.195806-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=29zwCSeZw8bvryHw7VUgD7DJdKzuIXOHbxNhBOaDL3I=;
        b=PT9u4qLrkkLUxfeq3vW9dFTTfudjW/xt29qD+iDZe2mZWU/f+gxyszqGFf4HNbieZp
         dBT8CaRWoRC2Oo4tqUmioSmKwYffqhMZzDvKJYVrq1FyKxFWAx74obCoFXv3i1P28+cu
         s0B7hFW/lzhXLJDPLRwkdLvQlLGkw7D4ks7M82B9Eg2r7DZKHFh3QRGnIAjLhbY9sG8K
         e3Dyp/NPX35bX3A5NdAZ2F2ekXwP/CPXxPe8yQkI9gv0Sf0LnTZs4f1leASJFkiWV+KL
         nmShjR8eUk5PvAs9pcobfefXWfT/nfU+maRNWHON4YkZYgARwEFmrVb7hSh6yq6AbQWx
         8PYQ==
In-Reply-To: <20170819171803.195806-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Some systems may have the Python libfdt.py library installed. Adjust the
tests to prepend the local libfdt path so that we test the local version
instead of the system version.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 tests/pylibfdt_tests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index e8a4582..32a1daa 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -53,7 +53,7 @@ import sys
 import types
 import unittest
 
-sys.path.append('../pylibfdt')
+sys.path.insert(0, '../pylibfdt')
 import libfdt
 from libfdt import FdtException, QUIET_NOTFOUND, QUIET_ALL
 
@@ -66,7 +66,7 @@ def get_err(err_code):
     Returns:
         String error code
     """
-    return 'pylibfdt error %d: %s' % (-err_code, libfdt.fdt_strerror(-err_code))
+    return 'pylibfdt error %d: %s' % (-err_code, libfdt.strerror(-err_code))
 
 def _ReadFdt(fname):
     """Read a device tree file into an Fdt object, ready for use
-- 
2.14.1.480.gb18f417b89-goog
