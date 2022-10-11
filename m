From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/2] libfdt: add fdt_get_property_by_offset_w helper
Date: Tue, 11 Oct 2022 11:26:10 -0700
Message-ID: <20221011182611.116011-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8sL+MerUYidxnSLjWpY0ZCdMNuifAN05957kJj9x0A=;
        b=ULGyIZLbSjxVwypxtPJF1gRHQwfJVPrnlaOQYdEay6O5PBnm2C677ZzW3LXKJkqayg
         EJtGWJ1ewB8ej+pzcjogGStKWpsCR/o0Ym2fmnh2MyIf8wryRjbkf4JI3Q1J/QYbLWEL
         c4kwcOx80OtgQ1rFAVfsg+D7HChoxR6EGsjrhW0xKt1dVOi4hjGBTMUalVwBlCM2pFTJ
         zs0cktqbvpfDUJeotufzpJ9TieF2Aq52vN8uoWU7vKv0BaTsDyxJyzttCwa/qy6ph4x5
         s6r64FriwrEkcT4cmYdLuRLlXngheBK4HOeherbVEYZ1NO5Hb8aPehN7b94ZVoZApx0e
         razQ==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add a new fdt_get_property_by_offset_w helper function.
It is a wrapper on fdt_get_property_by_offset that returns
a writable pointer to a property at a given offset.

Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
v2: Remove const from the first param (fdt).
---
 libfdt/libfdt.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index a7f432c..d0a2ed2 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -660,6 +660,13 @@ int fdt_next_property_offset(const void *fdt, int offset);
 const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
 						      int offset,
 						      int *lenp);
+static inline struct fdt_property *fdt_get_property_by_offset_w(void *fdt,
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
