From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/3] Correct output from memreserve in fdtdump
Date: Wed, 18 Jun 2014 01:00:22 -0600
Message-ID: <1403074825-5069-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This currently displays a hex value without the 0x prefix. Add the prefix
as dtc requires it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 fdtdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fdtdump.c b/fdtdump.c
index 723770d..a29aa5e 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -88,7 +88,7 @@ static void dump_blob(void *blob, bool debug)
 		if (addr == 0 && size == 0)
 			break;
 
-		printf("/memreserve/ %llx %llx;\n",
+		printf("/memreserve/ %#llx %#llx;\n",
 		       (unsigned long long)addr, (unsigned long long)size);
 	}
 
-- 
2.0.0.526.g5318336

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
