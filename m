From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] libfdt: add fdt_get_property_by_offset_w helper
Date: Fri,  7 Oct 2022 12:11:15 -0700
Message-ID: <20221007191116.161426-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X33KFnbOehc32ARH7cR80ekLDQpypni50VNhotuRRFg=;
        b=IvqidsxBiaz+vky6OVpa9iKOLZmMUiMGeo2lVRQhLdlV9DUkgGp4RcoGELOaUz/nnK
         Mji3h65SYUswQ7N6fFyZIQPjXHA5IsN8Omdj5TV4q8yGPJZpc2hvPT+9W2Z9NaHTDQze
         EtMAFP+7rVL5yrd7GlIH8vPETfaGzHNuLzE7zXO9f5964dqx9CIObapSsccp6SuPWO03
         DzwVzfPEgizmR8GGPNU9CmES5OD3BKCxAw4Y+TCNZQq1jJvRaG1G//9JS+wof5HgY2XP
         i6z3jFnsbmJ5G4O43L92WhwEqpQQwjx/hsOoKu7UfDaceuUyFgMVq5pRuouXhzsSX939
         pLNQ==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add a new fdt_get_property_by_offset_w helper function.
It is a wrapper on the fdt_get_property_by_offset() cuntion
that returns a writable pointer to a property at a given offset.

Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 libfdt/libfdt.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index a7f432c..cddc2d6 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -660,6 +660,13 @@ int fdt_next_property_offset(const void *fdt, int offset);
 const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
 						      int offset,
 						      int *lenp);
+static inline struct fdt_property *fdt_get_property_by_offset_w(const void *fdt,
+								int offset,
+								int *lenp)
+{
+	return (struct fdt_property *)(uintptr_t)
+		fdt_get_property_by_offset(fdt, offset, lenp);
+}
 
 /**
  * fdt_get_property_namelen - find a property based on substring
-- 
2.37.3

