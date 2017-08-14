From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] pylibfdt: Add stdint include to fix uint32_t
Date: Mon, 14 Aug 2017 13:07:28 -0600
Message-ID: <20170814190728.151775-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=xd9ZRDk9y/f9lupqkrrmmWHe7mwHYzy2LZQG5OeLetg=;
        b=pfOc280sPtNNonAxLFWk1474QXDzwm1G/g1nFw3zf8fJK3Zf8NfTIrjcDu/v3PIFrd
         bKIUosf7KRU1XfbcWW0q3RKnQ1xxrTGTSgV74apjBe1ij9RryWFYm0eAnvmLwnUYCy+R
         H9R0jxa5bMBgh8Oq9nCBcY8qPd6w4muP3M/dME6m+q2Dvq36aI7C61Z4D+cPQw26lCD8
         C/uGLZPnS+FKCOerqQxbgo6kukmU+tHIV+DfkM9gdKbnSDvuqZJmhk3W+WhHAOCVBCwN
         WPKFoapLcv1dftgsgr8oGeQ9SQ/Wwb1gfun6QEgL8FNESV7m96XfKZg1DggIuMcTCrQs
         urKw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Some types used by libfdt.h are not understood the Python module since
they are defined outside it. An example is an attempt to do this:

   import libfdt
   result = libfdt.fdt_node_offset_by_phandle(fdt, phandle)

This results in:

TypeError: in method 'fdt_node_offset_by_phandle', argument 2 of
	type 'uint32_t'

Include the standard integer header file to fix this.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 pylibfdt/libfdt.i | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index cd1c6a9..c7b79ec 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -52,6 +52,8 @@
 
 %module libfdt
 
+%include <stdint.i>
+
 %{
 #define SWIG_FILE_WITH_INIT
 #include "libfdt.h"
-- 
2.14.0.434.g98096fd7a8-goog
