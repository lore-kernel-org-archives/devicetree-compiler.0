From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/4] libfdt: Fix a few typos
Date: Mon,  2 Mar 2020 12:02:52 -0700
Message-ID: <20200302190255.51426-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xKTJFhtfYH6bAa9fcIzUyuXOQ/cxb+6vQCio+zN1C6k=;
        b=aFHBgpnF9AnlnQt0Pg+MHymvDPDFI60mOIFJvBAQas9LBYQaB3ZeG3u3JOhQ9sX1ne
         TCtgg7tOxtcusg2bKyF+yxYagOAoZOeRcA0jthIOdMpS2xwQKtrp3mQcJVNCqDHXxSBp
         mfyyq2fh1PF2DsamtzgFuxUxy3sLvHKz+oY/w=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Fix 'saftey' and 'additional' typos noticed in the assumption series.
Reword the ASSUME_NO_ROLLBACK slightly to improve clarity.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Suggested-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---

 libfdt/libfdt_internal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index e9913cd..3201678 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -58,7 +58,7 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(void *fdt, int n)
 
 /*
  * Defines assumptions which can be enabled. Each of these can be enabled
- * individually. For maximum saftey, don't enable any assumptions!
+ * individually. For maximum safety, don't enable any assumptions!
  *
  * For minimal code size and no safety, use ASSUME_PERFECT at your own risk.
  * You should have another method of validating the device tree, such as a
@@ -121,8 +121,8 @@ enum {
 	ASSUME_LATEST		= 1 << 2,
 
 	/*
-	 * This assume that it is OK for a failed additional to the device tree
-	 * due to lack of space or some other problem can skip any rollback
+	 * This assumes that it is OK for a failed addition to the device tree,
+	 * due to lack of space or some other problem, to skip any rollback
 	 * steps (such as dropping the property name from the string table).
 	 * This is safe to enable in most circumstances, even though it may
 	 * leave the tree in a sub-optimal state.
-- 
2.25.0.265.gbab2e86ba0-goog

