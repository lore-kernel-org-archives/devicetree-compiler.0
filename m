From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] libfdt: prevent integer overflow in fdt_next_tag
Date: Thu, 29 Sep 2022 16:55:35 -0700
Message-ID: <20220929235536.618370-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=op5ahDYpYBN/yBHhJgE29YJTlCvl4nt5meAUE0OCiW4=;
        b=wSeiA+bnzk3CHXJBxh/t7jBc1d82UH+DqbZaNRIdW+l4JyBdi6MDuARDqeGSo2In98
         /Yzi0qjzttozNx5tZd/LkpLWThrgOSMCCAwL76PXos7kwZ2DFnwYDvwNSTwVXy65ChWP
         /2dTT06Ll5A6oW6z2jdNT5LBlXG6TCtBMVPRCiZlFoxVtf75pZmi9X0zH/32xGfFRdxl
         gNPdJi22Ee6RUYgOh0MjKMCnS+p66YK+wOAJ8R6INyl7O/S3V3q5IkfpZS4kEptdWrge
         NxhONWjnoH9QKt04pyNjfxI6L2aq4KTer+YXh+Jm3pFPWGCiQFIR44bdneBUFxzYY5sH
         qW8g==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Since fdt_next_tag() in a public API function all input parameters,
including the fdt blob should not be trusted. It is possible to forge
a blob with invalid property length that will cause integer overflow
during offset calculation. To prevent that validate the property length
read from the blob before doing calculations.

Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 libfdt/fdt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 90a39e8..c3e112a 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -186,11 +186,17 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 
 	case FDT_PROP:
 		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
-		if (!can_assume(VALID_DTB) && !lenp)
+		if (!can_assume(VALID_DTB) &&
+		    (!lenp || (INT_MAX <= fdt32_to_cpu(*lenp))))
 			return FDT_END; /* premature end */
+
 		/* skip-name offset, length and value */
 		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
 			+ fdt32_to_cpu(*lenp);
+
+		if (offset < 0)
+			return FDT_END; /* premature end */
+
 		if (!can_assume(LATEST) &&
 		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
 		    ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
-- 
2.37.3

