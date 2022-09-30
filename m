From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/2] libfdt: prevent integer overflow in fdt_next_tag
Date: Fri, 30 Sep 2022 08:20:03 -0700
Message-ID: <20220930152004.674591-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=sgdOKqL14yd+eVQhXQ4lHU2sZ9RqXiCCsu5egzJjzvU=;
        b=b6HS3xgQmcuLy13TnsVpXrnxz1IqYxVpbowiK+zrSAZ5mihsN4aY45nl5+bq9FKp46
         YzDmaIpotpnBbd/w9LR3Rw1NNxMMZu7KjVuhLyxGRbU0dIgmJxgqtldH1pLEJdMsg2UN
         Aj3QYh0/blr5x9stIq7eUGKe5o5mTmiwyNWm1GTrUpR5fODwZhQh5pLZDUzCKxRoVR01
         naAftOrhmiHrCv85VaUE6Ne/hxKe98PzqkzgAvd5YKVF9HHI4acfPe/HD7nkuD+sLySE
         Pkl4rd3HSOddcx+XjxPNdgXDnImqdtKrRtFkDOoxwfDONheD0cNatyD0rizi0GtdTlqL
         TqAw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Since fdt_next_tag() in a public API function all input parameters,
including the fdt blob should not be trusted. It is possible to forge
a blob with invalid property length that will cause integer overflow
during offset calculation. To prevent that, validate the property length
read from the blob before doing calculations.

Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
v2:
* Use len local variable to avoid multiple calls to fdt32_to_cpu(*lenp)
* Add can_assume(VALID_DTB) to the new checks
---
 libfdt/fdt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 90a39e8..b7c202a 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -162,7 +162,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 {
 	const fdt32_t *tagp, *lenp;
-	uint32_t tag;
+	uint32_t tag, len;
 	int offset = startoffset;
 	const char *p;
 
@@ -188,12 +188,20 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
 		if (!can_assume(VALID_DTB) && !lenp)
 			return FDT_END; /* premature end */
+
+		len = fdt32_to_cpu(*lenp);
+		if (!can_assume(VALID_DTB) && INT_MAX <= len)
+			return FDT_END; /* premature end */
+
 		/* skip-name offset, length and value */
-		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
-			+ fdt32_to_cpu(*lenp);
+		offset += sizeof(struct fdt_property) - FDT_TAGSIZE + len;
+
+		if (!can_assume(VALID_DTB) && offset < 0)
+			return FDT_END; /* premature end */
+
 		if (!can_assume(LATEST) &&
-		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
-		    ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
+		    fdt_version(fdt) < 0x10 && len >= 8 &&
+		    ((offset - len) % 8) != 0)
 			offset += 4;
 		break;
 
-- 
2.37.3

