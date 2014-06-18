From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/3] Tweak code to display cell values
Date: Wed, 18 Jun 2014 01:00:23 -0600
Message-ID: <1403074825-5069-2-git-send-email-sjg@chromium.org>
References: <1403074825-5069-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403074825-5069-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Move the division out of the loop; this seems slightly cleaner.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 util.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util.c b/util.c
index 1ce8b97..9d65226 100644
--- a/util.c
+++ b/util.c
@@ -371,9 +371,9 @@ void utilfdt_print_data(const char *data, int len)
 		const uint32_t *cell = (const uint32_t *)data;
 
 		printf(" = <");
-		for (i = 0; i < len; i += 4)
-			printf("0x%08x%s", fdt32_to_cpu(cell[i / 4]),
-			       i < (len - 4) ? " " : "");
+		for (i = 0, len /= 4; i < len; i++)
+			printf("0x%08x%s", fdt32_to_cpu(cell[i]),
+			       i < (len - 1) ? " " : "");
 		printf(">");
 	} else {
 		printf(" = [");
-- 
2.0.0.526.g5318336

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
