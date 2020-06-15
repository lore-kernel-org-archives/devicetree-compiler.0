From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] libfdt: Correct condition for reordering blocks
Date: Mon, 15 Jun 2020 10:00:33 -0600
Message-ID: <20200615160033.87328-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XNd8wjdk9Z6wPdAG9N/HVPd2WmGov9a1a7PPkVgkfQw=;
        b=NcQ5Zj6FDvMTvzDrXUzw5gLiFNFrfalimMmYK0wR0mh8ZhheGNsEHISa/wnY/bNJqS
         oA9/ubEwuwlb7qIdfetX1B5t3vlyyuHgL17ZGN/UZnGsMOStr/1/4GkdthjxEPjvj/cV
         wg3CFMpl75reugEf7OO3vd1FlICAfr9Ed00YM=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

This condition uses bitwise OR but should be logical OR. Fix it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reported-by: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---

 libfdt/fdt_rw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 524b520..93e4a2b 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -436,7 +436,7 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 			return struct_size;
 	}
 
-	if (can_assume(LIBFDT_ORDER) |
+	if (can_assume(LIBFDT_ORDER) ||
 	    !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
 		/* no further work necessary */
 		err = fdt_move(fdt, buf, bufsize);
-- 
2.27.0.290.gba653c62da-goog

