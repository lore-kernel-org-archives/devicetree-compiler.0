From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 1/2] libfdt: prevent integer overflow in fdt_next_tag
Date: Wed,  5 Oct 2022 16:29:30 -0700
Message-ID: <20221005232931.3016047-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ls8e4J359ERSH/cQAMGc5sxHoNGcYdjafEog2+NCpPc=;
        b=VwN9fDg7dVnGRcImTO+ydpX62JZOoBCe4n2F6EuhQrG52k7mv6BLJ8WDVWAApJ6ETT
         utF2uSXvOdrNhg8TQwG3o7vbz3i8+MYyA865JdCvfFZg8O3KcuivBD9wPR5o0EW0OQdI
         4e7Ba+W68hAayIsYYyKSMWhFAx3zpa43IBoNzbYgdkkjSH4HWkl7palu1mysNkeU2pU6
         aiyWmXOopwLfkNaEuEo9iIxwaF/u+Wm6vkZbZZLbFxQrD3f6yFZofH+mk+trMeAOJd9s
         rlMs1yke15POWpPvDKuLqrFQ++LV9aI3WKzuXg7C1oVKk7clzFgiSquLMqtxAgm9EZZb
         0CqQ==
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
---
v2:
* Use len local variable to avoid multiple calls to fdt32_to_cpu(*lenp)
* Add can_assume(VALID_DTB) to the new checks
v3:
* Use unsigned integer for prop len and offset validation
---
 libfdt/fdt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 90a39e8..20c6415 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -162,7 +162,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 {
 	const fdt32_t *tagp, *lenp;
-	uint32_t tag;
+	uint32_t tag, len, sum;
 	int offset = startoffset;
 	const char *p;
 
@@ -188,12 +188,19 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
 		if (!can_assume(VALID_DTB) && !lenp)
 			return FDT_END; /* premature end */
+
+		len = fdt32_to_cpu(*lenp);
+		sum = len + offset;
+		if (!can_assume(VALID_DTB) &&
+		    (INT_MAX <= sum || sum < (uint32_t) offset))
+			return FDT_END; /* premature end */
+
 		/* skip-name offset, length and value */
-		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
-			+ fdt32_to_cpu(*lenp);
+		offset += sizeof(struct fdt_property) - FDT_TAGSIZE + len;
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
