From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/4] libfdt: Improve comments in some of the assumptions
Date: Mon,  2 Mar 2020 12:02:53 -0700
Message-ID: <20200302190255.51426-2-sjg@chromium.org>
References: <20200302190255.51426-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zi/8M6gv9hxh0S8gHVwUzJVn/WkfPkMMMAl0WADzWBE=;
        b=fV9hO4eLtnhGahPWfkT45c+rgjduoatsNEpQsKhQS85vKMVB92flEioF/73uSDWmBN
         bDp+OACrk/26zNc6FJ404eIPhMcTK7di1pFmNLysXpoaOYpJoD5LD17687UmqaNUsWtQ
         wjjE+sp5xknBbK16G1hd9+mthT1fwRaZWT0rI=
In-Reply-To: <20200302190255.51426-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add a little more detail in a few of these comments.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Suggested-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---

 libfdt/libfdt_internal.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 3201678..7999f6a 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -91,7 +91,9 @@ enum {
 	 *
 	 * With this assumption enabled, normal device trees produced by libfdt
 	 * and the compiler should be handled safely. Malicious device trees and
-	 * complete garbage may cause libfdt to behave badly or crash.
+	 * complete garbage may cause libfdt to behave badly or crash. Truncated
+	 * device trees (e.g. those only partially loaded) can also cause
+	 * problems.
 	 *
 	 * Note: Only checks that relate exclusively to the device tree itself
 	 * (not the parameters passed to libfdt) are disabled by this
@@ -130,8 +132,15 @@ enum {
 	ASSUME_NO_ROLLBACK	= 1 << 3,
 
 	/*
-	 * This assumes that the device tree components appear in the correct
-	 * order. As such it disables a check in fdt_open_into() and removes the
+	 * This assumes that the device tree components appear in a 'convenient'
+	 * order, i.e. the memory reservation block first, then the structure
+	 * block and finally the string block.
+	 *
+	 * This order is not specified by the device-tree specification,
+	 * but is expected by libfdt. The device-tree compiler always created
+	 * device trees with this order.
+	 *
+	 * This assumption disables a check in fdt_open_into() and removes the
 	 * ability to fix the problem there. This is safe if you know that the
 	 * device tree is correctly ordered. See fdt_blocks_misordered_().
 	 */
-- 
2.25.0.265.gbab2e86ba0-goog

