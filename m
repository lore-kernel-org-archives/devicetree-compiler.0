Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030D514A90
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Dec 2024 04:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733374291; cv=none; b=SnEFVL74f6GsPj2hn/6Gd2J/RQ25tU7tpfbI2VE1DEWXfnGaY0Uvb+NB6YiBVb2II+F5UttpvUfwJ63Kl0CZVcy4f/Oierx6ZzZQQd1ndNjx8YfhWp4nKoemu2bMrhfZJt0k2bdzfwjnSYkBt42SmzhyaRURUdj+heI0lRMniyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733374291; c=relaxed/simple;
	bh=tma7il3BkanMvL3E+5UsHkiB90zauupLGp+97G/yMfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IbwfimokYsU6dUqJL37E3japutbnn3/3ang4RKrMStJbVJrsU8KFlRK2JPWtFLnv7xSaVlUf48bs+lWHcvaUi58f2z/qIdvN0RCCmCVbiV6IUbigclz3DRnibi1o44QzhxBqlizZzZvD0evmW02woDExi3jMKI0p28Z2VZMoGzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=3R4wZo5M; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="3R4wZo5M"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215a7e487bfso3892485ad.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Dec 2024 20:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733374289; x=1733979089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZADLCGj3p+uoS7mz/M0PGcSTVzhU/sa1p1sznSPYRU=;
        b=3R4wZo5M86EnDrKOTdyT3Wa7hchEnepSTsh44fMVWGDzMJCIQB4Jd2+Zg9GJY76kKj
         lwD5GDxcJ/vuT3RNGekgPhL8HdQXHNNRNCVGgLd9TMgL+mP6HLT5s5HPmZelNw5+WOJy
         Xr2YCfvvxmzzxOn036fQontlKs1vRjMKAU7PB62Eduftu6cAgZCQ96F4dp+jRrb9UD0k
         JzFVUcvrDVstG/utStazCY8fnVUtRBjjB8Pt0K8j0riI+3wg4HmOaX5meU/XI4PyWqyf
         Rxx309XgKRBPlo6fWvgmLov5IdqVxobEFB/4XDy8SlmPg0rLS+2tQRUBn8kcKb/km9Co
         hyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733374289; x=1733979089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZADLCGj3p+uoS7mz/M0PGcSTVzhU/sa1p1sznSPYRU=;
        b=QUZF4/YrtW7mppQZpgwe4yeH7ND0aN821EM9uwfa7yKcvUXqkZF3Kn/wjkQnhe+Gau
         8p5P0FaDhprhuk/fwV5ss/YPafdteS0fglaXe+/oSODprVXts57xQPJY5WxyhZKO+baM
         II4/EaetZdR7ieji+FDZ4H2AIBq88dN1Z4JHW5+7+smJ/l3WWK0vcHo62+saFxAEupeq
         qVQMjwHMDwuJnNIkVZh3xC5jxaNphV0ClY4tm0LlHAaH8hSnOLQ+oVJW1nvIXjbs1fkg
         RYCeEL/ORgJ/kzL1igvdiAbV4Hq/9dcUwJ3f9AO72Skml8ocV+QKeyjUi4p46PgqtmXr
         xd9g==
X-Gm-Message-State: AOJu0Yz+DqC8vH/2pcW34lWcSVZLqRe9ig8EDNBe0jYmdkPAN3+jSImO
	u1LuKDc7JUJwpJFyF4za7Mg7M5XziamRcegs0RT4qX15l4TukGEjc4ZDHueUimvnEFZCiQaT+kL
	n6dyr5ks=
X-Gm-Gg: ASbGncsN+RVuf09B2WpPJ7sRGOapp4CHZDY87dv7FGTwwDkD4wUULbnvmvjht4gx1rh
	HT2tLin6Rj3FZ0KNKqA6YjdDpX6oyEekpFG0mJGvlq8WQ5Tahf9CHTdQQStpGkrZbtGGYyfSmll
	MEkUADk/FGYH1qgeT6Z7DJgWdcfnji5NwsdlnHS4IpZet+9Be3L+bnBEfPl1caSdlJOxj4uMSTN
	qOm2OUzbfKOfi5aCTduMzDs1l6E3zbXJhRbvwTxORfMAq5AI/gUEEVU
X-Google-Smtp-Source: AGHT+IG4Ba/RCbiTrNLCxL+T1WTLpj4yzU/tJlsYwKokXuO3dPariFXh65KUFJRKM6YcVY3ebfs/XA==
X-Received: by 2002:a17:902:cec7:b0:215:a81b:c182 with SMTP id d9443c01a7336-215bcfc530fmr98909775ad.10.1733374288725;
        Wed, 04 Dec 2024 20:51:28 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8efa47esm3801015ad.153.2024.12.04.20.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 20:51:28 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 05 Dec 2024 10:21:04 +0530
Subject: [PATCH v2 2/4] libfdt_internal: fdt_find_string_len_()
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-setprop-namelen-v2-2-0d85a3d2e7b1@beagleboard.org>
References: <20241205-setprop-namelen-v2-0-0d85a3d2e7b1@beagleboard.org>
In-Reply-To: <20241205-setprop-namelen-v2-0-0d85a3d2e7b1@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=tma7il3BkanMvL3E+5UsHkiB90zauupLGp+97G/yMfU=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnUTFB0A6GMur3AKuuldFpSy2YSyuNReerkU2Va
 cN8BhuMKJKJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ1ExQQAKCRAFzvXHieVa
 dP35EACowJHTlH2Y40gdLata7dAqiK2kCo5OumxOJ4OwhguEkMy0p1MO2LZb9qs2YZ0UrM8i6L7
 QVC5BDGJAGWQ1GeLmnM/kwq/E5QyXP2nXX1V11M7qVo9G/NCELc+eS29nLinf5JpocL7GqVcVx2
 t+3FHb/SuV+hDc5lNGao5QYFoCFDyIK+c48CE7Jvm41bjPEBeC70uAL+6YpFVYXOVC5h930lQ9Q
 G1Il9oco9nwsFldaMo/c1gxBm0xDrBq4mW6xdo2Cu6258fmPVTMOYo9f3uBmL1S/cjWHLn2xZIM
 prRDU9qdo3PP3M8cxgGPguWOGz9QyWy65aVCAqAr/TAqOKlKf8fH5q5QzLxiYDBKEMug2Gfy7JB
 2EpppOy0RyGFkrnRffeA1BW3YSw46/L76sf9pSeUvYnZwF+5x51IO/+xlCVyrLlHfpnTn4CXHnc
 rxmsCxa002WxzOiUENeN1C//ROogrC3E8Y8bGsmlHe44YrEaLXROBtBXqx6J5tZKouaHieUgXgC
 xxTDywuGzhj1KBWSZ9I0FtjHea7XgrhQdtqxmn9lwhPHrJss93RE/VVs93UJvdJYF/yNb6OlyOh
 rslTq0yOG9RZ1rlDOHNPlUVbh/3LDQO1/Pzlyj+5xjC5eu9zX2Hq1bZ5pO1DUDdxb2VYeP7s5Sn
 6yy0o7YgsR+9gZg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow specifying string length to `fdt_find_string_`.
fdt_find_string_() now internally uses this function.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/fdt.c             |  8 ++++----
 libfdt/libfdt_internal.h | 11 ++++++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 20c6415b9ced113d9fcce25b69007a6b0f9e68e7..95f644c31f9431eb597b6f683741ff9be375cebf 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -312,14 +312,14 @@ int fdt_next_subnode(const void *fdt, int offset)
 	return offset;
 }
 
-const char *fdt_find_string_(const char *strtab, int tabsize, const char *s)
+const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
+				 int slen)
 {
-	int len = strlen(s) + 1;
-	const char *last = strtab + tabsize - len;
+	const char *last = strtab + tabsize - (slen + 1);
 	const char *p;
 
 	for (p = strtab; p <= last; p++)
-		if (memcmp(p, s, len) == 0)
+		if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
 			return p;
 	return NULL;
 }
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 16bda1906a7b335519b9f748d1be6110de551e79..1fd35f364e9af15df19ae5b8b7231584804e96a4 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -6,6 +6,7 @@
  * Copyright (C) 2006 David Gibson, IBM Corporation.
  */
 #include <fdt.h>
+#include <string.h>
 
 #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
 #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
@@ -20,7 +21,15 @@ int32_t fdt_ro_probe_(const void *fdt);
 
 int fdt_check_node_offset_(const void *fdt, int offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
-const char *fdt_find_string_(const char *strtab, int tabsize, const char *s);
+
+const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
+				 int s_len);
+static inline const char *fdt_find_string_(const char *strtab, int tabsize,
+					   const char *s)
+{
+	return fdt_find_string_len_(strtab, tabsize, s, strlen(s));
+}
+
 int fdt_node_end_offset_(void *fdt, int nodeoffset);
 
 static inline const void *fdt_offset_ptr_(const void *fdt, int offset)

-- 
2.47.1

