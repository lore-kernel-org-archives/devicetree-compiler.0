From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v7 7/8] libfdt: Add support for disabling ordering check/fixup
Date: Thu, 20 Feb 2020 14:45:56 -0700
Message-ID: <20200220214557.176528-8-sjg@chromium.org>
References: <20200220214557.176528-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xnyLWl00qX8ZLCssdSiOQc24mlN5LV44zuJGNz3wYUM=;
        b=IwtC+Zw3ewHiwxXJQCLT8VohSnK6oRdJf2ZrGkdfZKM0jfXU7ZwnzB1kot7ixT/gTA
         nnSDoaebXYnpxWvhO51lRgLV5IqHibC7UhMgPsU6lYlwjvwdLdzEYwb4KUqoqgCKaIZr
         t9qXYk3HIIXpZP8elymK/yGPyqxsFYnIUEhTI=
In-Reply-To: <20200220214557.176528-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add a way to remove this check and the reordering code, which is
unnecessary if the dtb is known to be correctly ordered.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---

Changes in v7:
- Use ASSUME_LIBFDT_ORDER for the ordering flag

Changes in v6:
- Add a new patch to disable the ordering check and fixup

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 libfdt/fdt_rw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index fe13671..1385425 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -435,7 +435,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 			return struct_size;
 	}
 
-	if (!fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
+	if (can_assume(LIBFDT_ORDER) |
+	    !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
 		/* no further work necessary */
 		err = fdt_move(fdt, buf, bufsize);
 		if (err)
-- 
2.25.0.265.gbab2e86ba0-goog

