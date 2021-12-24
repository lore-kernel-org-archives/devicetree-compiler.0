From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: [PATCH] Fix Python crash on getprop deallocation
Date: Fri, 24 Dec 2021 11:28:12 +0100
Message-ID: <20211224102811.70695-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1640341807; bh=GQag8TQa+jIM+O19bqEkWsjsVUKrwuG3K1/8F8IcYeY=;
        h=From:To:Cc:Subject:Date;
        b=rug4qzYJmfCMMck50KqUjrqDLNRXYrMJ4YKQNLJp0tbS+5VcjJsvtTUeoeCmrYigE
         dThLgaA1kZvdvdLdlPwckiLpvbb1/o6J6/BW0+4dwI3UW6ReTwGzyOWvYfKWzUv+O9
         lMRXC903RdSsSSbNZiKH03MoOyfyyKxrPONeojSk=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

Fatal Python error: none_dealloc: deallocating None
Python runtime state: finalizing (tstate=0x000055c9bac70920)

Current thread 0x00007fbe34e47740 (most recent call first):
  <no Python frame>
Aborted (core dumped)

This is caused by a missing Py_INCREF on the returned Py_None, as
demonstrated e.g. in https://github.com/mythosil/swig-python-incref or
described at https://edcjones.tripod.com/refcount.html ("Remember to
INCREF Py_None!")

A PoC for triggering this crash is uploaded to
https://github.com/z3ntu/pylibfdt-crash .
With this patch applied to pylibfdt the crash does not happen.

Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
---
Unrelated but I've noticed that in this file the indentation is quite
mixed between spaces and tabs. This patch tries to keep to the style in
the lines around.

 pylibfdt/libfdt.i | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 075ef70..9ccc57b 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -1040,14 +1040,16 @@ typedef uint32_t fdt32_t;
 
 /* typemap used for fdt_getprop() */
 %typemap(out) (const void *) {
-	if (!$1)
+	if (!$1) {
 		$result = Py_None;
-	else
+		Py_INCREF($result);
+	} else {
         %#if PY_VERSION_HEX >= 0x03000000
             $result = Py_BuildValue("y#", $1, (Py_ssize_t)*arg4);
         %#else
             $result = Py_BuildValue("s#", $1, (Py_ssize_t)*arg4);
         %#endif
+    }
 }
 
 /* typemap used for fdt_setprop() */
-- 
2.34.1

