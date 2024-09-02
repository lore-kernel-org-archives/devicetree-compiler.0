Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC519E964
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Sep 2024 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725279514; cv=none; b=OXRl3y72TMnrV8NOuP57jpRpZo+LF89ffDyDt4Hd3EmF92UGYq+zNXfq8bP9wy8MqyLTpCz4Wdu2WpElt6Dq181svdCeGV1MmpU/VkoBL/VVh06lXdUrlgqTxKnxyrtJDBAAXKO36mZNgWrI+lijxAVLA/siPAQt5bS2jHQrUWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725279514; c=relaxed/simple;
	bh=T1lSt8dkK90JUy3ml5Ccirl1ZicG1bBh//CvWaPDOYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImAjFzgsnWkPg5ReyHVBqH/BpoNA30YLmawLGl62BsIACvRG2Bx+oXSnom1gahn6Gq5b8UfJ0GXalJUhaTRAgQflzoc4gZ3XQw3nlltnl8MPZ3uGrM+sDWHpOsAP0FXinLJwoV26MsQQpV6hoAfC5Z9tgnDGvQtvO6Ddpm+3CXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=EA24luHZ; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="EA24luHZ"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-20570b42f24so8221735ad.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 02 Sep 2024 05:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1725279512; x=1725884312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkgn2IXN9qmNHQvf0ldmi8AlgyuoJgvlPdRpQSwsRow=;
        b=EA24luHZCL1QYTLS0VPenGpIddxCdA100EyJcpf5p1Ry1dB4LsbxVdPWpBuSP7VHTU
         NKHb3uIElopoKDsNUimdRrd5wp9J4xa1AcQrFbgNoV1WmZDMH39+tWAd/r2f50aYilKx
         8ZeWc4bF/B1qRduCG0EjUYPoLYDsfGVhnTepcoTdL8MAmsfrhNg0qdQXj+k8j+Iy7OmH
         bC8+ZYCWredejrxqEI/iYN5u7o6uSUM53VdgsED5YKAkyj7mjEY53TfJ8mgG3MOq2Umw
         ZA69ncJfeTtLlW+C79QLAeKpfKPCNtdVU+giwTZC8PGpsWdd2dXkCy1xCGxTfbQjLu+y
         WzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725279512; x=1725884312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkgn2IXN9qmNHQvf0ldmi8AlgyuoJgvlPdRpQSwsRow=;
        b=i+MvhZGqqRMIWyGvcA+hvP5P3e7wCx9VwT6ukY9YnT8gkJrkDfKLjNAEgq0t3P99k6
         w6tlEKEJpAbxmmZFoGrgZEguyu2WKPEm/Ybmr8YdEje7bi1lG8PgJosuSAtK4NPJG5zT
         lRb77BQymUV5fiBV+uKjAHmyEFkP62XCGWlJWtObczHBhNsJNFEwmnNuA2pJMtoZQYA0
         eV0hCLfFgyYlY+fLLDi2GxYQNqTKMQKysm7i5OD6UWaXBzQ4i1gILTtp27F4Ih2p2fDx
         m5N8hPYq957mkya3mV6Asf/oqyIgq0Jma8BHBmGvARH5hPxuKR3XxI1DnF9lQEkI7Ad3
         nMFQ==
X-Gm-Message-State: AOJu0Yw8TAgx2OTYLrI5VEoLzMysL6AMQYqJClqS7AiIsiZanaT0HYZD
	PSdH4IjzCtMByWCwDeeOvzbuctAGRdVAK6OJV3XI1R5ZQDTzuDPatUStCWB9Kg==
X-Google-Smtp-Source: AGHT+IEUrEW00o8pRMcxRaxFyHr++PqOWtimoAYX+mli1xXzLg6x3bFBUknZjM6owveDXsL5bT7Ccg==
X-Received: by 2002:a17:903:94d:b0:205:2d09:9a30 with SMTP id d9443c01a7336-2052d09ab3dmr99312765ad.13.1725279512111;
        Mon, 02 Sep 2024 05:18:32 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2055d6fe84dsm25262125ad.11.2024.09.02.05.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 05:18:31 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Mon, 02 Sep 2024 17:47:55 +0530
Subject: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
In-Reply-To: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=T1lSt8dkK90JUy3ml5Ccirl1ZicG1bBh//CvWaPDOYU=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm1a0NuJyAABuSSZSRsdm7r5+RqxXrOMHnRg4bZ
 p0lMkAYQ+yJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZtWtDQAKCRAFzvXHieVa
 dBblD/9TP98yY4umec017IcJKnRcY/NfG+e2VHVaLCHumBdgPTlHhhnGKwnEYEQ9l+ivNQPIatr
 9CEfbKzk8iaVkh+0bXYQjbWKYaq5OPWY/+tnLN0yCJ/NmPr3EAp4SjgROaxEvRN8UVTNa5gLqPt
 uxjPdJU4/vBm78BEm072KdZGfNKCbnZgr0Ih3u+QxR1vo4xOP8LhhD1jZdTk/3dRcVJjq+s9TdB
 atFO5WMe6Qf5O1aJxYcNaOHQBFS3mjUP1ZjxramQg8HxvWEz2LbiaoUVlFh/TsRAZSdZP/anZfc
 KB94WToyz8NP5HLMBTF54eaPqi/dFkSRKaRESak0MzRt8ye9cX8csGStO/ZZKURI7PGl/rTU59W
 mFgi/2vNgzF9qBDcvF459P/x4FDY+HEpDik6+cEzmiBHk2YRRHcwyYNH0XH1mZtQ12zEsHldwac
 +gum4ltYMljgWr2E4ylNzqZ9XGiDgReCCVfurXjtvPUk5TsTf+ZMg4v6YFnjimvliOeShkmIzvU
 nLOlXfBYbQ4g55TbSqP5TA9aGiNP76LzjC8Ha/ZsDlxY4VVGmxml7ps0Mwwpa3PLecwa98tzuuj
 Qdvl9uuWsYnWqb+D50jr79bilbYxj8WYIOAPQ+VP9MStYF4Bo2yiXR+8lJffVnXSE9JqswCoUhi
 3q5HIqbhYqRRghw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add ability to resolve symbols pointing to phandles instead of strings.

Combining this with existing fixups infrastructure allows creating
symbols in overlays that refer to undefined phandles. This is planned to
be used for addon board chaining [1].

[1] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/fdt_overlay.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 28b667f..10127be 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -395,12 +395,16 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 	symbol_path = fdt_getprop(fdt, symbols_off, label, &prop_len);
 	if (!symbol_path)
 		return prop_len;
-	
-	symbol_off = fdt_path_offset(fdt, symbol_path);
-	if (symbol_off < 0)
-		return symbol_off;
-	
-	phandle = fdt_get_phandle(fdt, symbol_off);
+
+	if (prop_len == sizeof(uint32_t) && symbol_path[0] != '/') {
+		phandle = fdt32_ld((const fdt32_t *)symbol_path);
+	} else {
+		symbol_off = fdt_path_offset(fdt, symbol_path);
+		if (symbol_off < 0)
+			return symbol_off;
+		phandle = fdt_get_phandle(fdt, symbol_off);
+	}
+
 	if (!phandle)
 		return -FDT_ERR_NOTFOUND;
 

-- 
2.46.0

