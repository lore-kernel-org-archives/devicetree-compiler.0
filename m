Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14497247291
	for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274198; cv=none; b=LL/XLbx2stZ+d1ypErsKrk5X9vsrbodlCDtzDaVWom0PmY//DO61HcOSYZZHa2KS9bt+WVP2Mm3/aG0fuT9U/FvrcE73xsmRl6FcZD8RvgnXmaVaDKjzvuTsVH5lOFsHCX6x6smzC5osdtgIsRoVmppIY71tpyTOxgvCWWsmfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274198; c=relaxed/simple;
	bh=YK04b9wovJAcXMg0KUaKNQZmPvPmdwUFa6XQBZqAbXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTvVVu8fKZrU73Q8IaBCRhtGpoW61NlGcesUBFafKzNBcZKNyfePg/5O3uGOUz5aXmT122nP3he5ewscxELRCp0u0GgYerEAlbCu2y35us6I7fsBburZ5BfbEBFgI7MMQzyp7RMzai5laW/cXfEJ80F4Wvqk0G3zIO7ZYhA4gg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Csbvr+vZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Csbvr+vZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b00a9989633so391900566b.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758274193; x=1758878993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIgQ9gOWbXPtyZyraL8LMTGVZxTrfPlI6DzRRcIIof8=;
        b=Csbvr+vZZjiUfv7PzgQrnLXWzL17/xpQ1T+ML5RJdbcgL3kf6GMleVaVt9T7lx6VKF
         EaWbAVhL9QMg5ME9nJrW+IwlWlcC7V0uLsHM1q0LAlb7KAdMGJBMHpeLuBI9vg4xoEbu
         zNUjGkXbyRHIy2+ACEsIbP3e1u2S+E2gxKIaJ+efXnrUNXAMnUauWoCrRG+6LJ1wcazo
         lVsdtSNZ5+Y01TyjJgNFOVeP6d+PYZBHacn27l8+8M3ZVoiJ/HnoMVLC16lsMmMWDb8G
         cCPtPuPfWO1Hk8ZWBHs7rTMmtWHRg8dQMfKXIH2PXCZWE5HcWCWF+kUpIa9Ob2VgH1ex
         KXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274193; x=1758878993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIgQ9gOWbXPtyZyraL8LMTGVZxTrfPlI6DzRRcIIof8=;
        b=FOmX58QYX7II1WpHAy+rVeBUHi/nH2HyxKEDUJDNJ0bJw5wZcbfUL/07eEeOg6/zFc
         ZWMoL7eXeUoN2pfQ1QqLVOEjpKdxpm2Nr/posQ5KR2Glv/rBqHUwj+h7y2UYZcQfVyxf
         ZItAtMcX7XhG5PcVxGpMc0JIOM0ThSxb+T5Kh6OmxczL3kE3Jn5Fx8lEH5+Icsz4iP5I
         EMjR4xT04gHq/pau4ZR24Y4kV49FPqbSHLx7Nq5Yio9uIczVOJc8kQiepAV3yqYfz9mk
         fWVtVCqzlKhi7Bns5bswNraDdHaDtQTixZ/z2lhfUYs7Xce6cLc8ejM/BF7uMoDLuKx5
         diUw==
X-Gm-Message-State: AOJu0Yy+QyZHrrblde1xXZkW7fDKY4mtufI4b6fTeP04PwVcdAd8am3H
	ZbDvuMTnW/WbwxNh5gCHlO6d85IXBb96AsFEuX8xNzQ2BOxYYMtG07+XOXBzH1/9n3GmRq3V073
	xUbPf
X-Gm-Gg: ASbGncs/Dnd6xKe260WreuAQEW+CA+kIlzJpw7exp2Ua+wVify+4YLRXHc9rmb6SIiR
	gASG9kvHIpNvrBWkA5Xy5EpbBUBRhvC3H71DqFDI92JmgEI3SrEseZPIUtnkoVEHok0gruFEwSn
	88wRgKYt674btH1v9TRJmz9im2OGrNVCv7jrx1J1NpbLdj5E4D/PkHzSVCn+yrCGFVldl2L/l25
	8Rka2TMqw1LxqL8+X7aCszTZ4SP6r0UGYA6RT7LwU9gkyxcB4eWmU4c5C3wtfN8mZH/tCNpMdPk
	YoWQgm/0vcAQy4z//RdEMhiE5ctCspKnI3nrVH5qdU96m8JPWWxSk0pX2r0CPwMBGxEkTEKYIAC
	+XpIqhqjRYYrAe/QAcJvareuZz2eJCaiwqS4W2/DvHMH+72cRshTZyOGj0mZjpr2fZ2TMKKlb9g
	w=
X-Google-Smtp-Source: AGHT+IGZLQX9FTdT0+koWTzBMDiqg+tJdgwxOn5VD4V3hBywF8t0qusQV8bXQgruSOqFbQ5GjC820A==
X-Received: by 2002:a17:907:9483:b0:b0b:e3f2:9a74 with SMTP id a640c23a62f3a-b1faa40b357mr738926166b.10.1758274193183;
        Fri, 19 Sep 2025 02:29:53 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62fa5d03befsm3093939a12.2.2025.09.19.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:29:52 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 1/6] Emit /plugin/ when compiling to .dts with DTSF_PLUGIN set
Date: Fri, 19 Sep 2025 11:29:14 +0200
Message-ID: <20250919092912.663304-9-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
References: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=YK04b9wovJAcXMg0KUaKNQZmPvPmdwUFa6XQBZqAbXI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBozSJrsV7lsnUmDA64aR2QIQ6++3ad/G5JstyVr F6kEWcXBrKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaM0iawAKCRCPgPtYfRL+ Tj8hCACyaSzFZ6nMlwH1MJtM9ZfmGWi1DoucUT9ILgq8caHLVioGXud74y0WmpMWhYkVN15XNii tvKx1Zx5DSXkqzeF8BeDCw2gBg+iuvu36A8hB93qvKwRUNSfYX93mMchYQMy+X9Q3IybB6ooQkf gHNJb+xN64sbHzUG9ODFPhgi5lw2mpSMMQs1UI+461n0QyWkCEnT7tCYTDJiyrVl3h8IBIEGiug 5ZJPcUZdxJXxYo4tKS5b/rPwK1zah3YHRrPC3JIDI0LZxlTjrlSJe34dFaBnpDRe9NjtcGQgbzQ 06dE+bbT8FoYgmcZwuXnXOHOKUzMyIg5oI0NNdB/maJwlYD2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This fixes `dtc -I dts -O dts` to make the file a plugin if the source
file is one.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 treesource.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/treesource.c b/treesource.c
index d25f01fc6937..72d1cb5508b5 100644
--- a/treesource.c
+++ b/treesource.c
@@ -369,7 +369,10 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 {
 	struct reserve_info *re;
 
-	fprintf(f, "/dts-v1/;\n\n");
+	fprintf(f, "/dts-v1/;\n");
+	if (dti->dtsflags & DTSF_PLUGIN)
+		fprintf(f, "/plugin/;\n");
+	fprintf(f, "\n");
 
 	for (re = dti->reservelist; re; re = re->next) {
 		struct label *l;
-- 
2.51.0

