Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90389244669
	for <devicetree-compiler@vger.kernel.org>; Fri, 15 Aug 2025 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755264912; cv=none; b=D2ldnB5b9gv1K57ubmwSlmpwCHr8B4goIerVqzoOyLpNhHwxO1aK7zdvHMkhhhT+wOPgnb3Kcbta3IwgjbIAfYAwG1Sroqc+LmHDRtzd1BSUgnJXnAPf4+arQQwFLnuZKPxp77Ed+ziM+sgwkgUxtUol5TVNJiIYZDdCs2p6rfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755264912; c=relaxed/simple;
	bh=y/m4Blfot9oCUT0dry50R4C4PO5PMYiMyTdgqjUtPgE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eurz/PFZm7CcwNASu3jt8RQrHljP7C1Q9B7r5ItYi1+e9YQR+ocHQ546/Rg8hqfIw8xc3NBoKUHiOEwdSMXp3rmp8C8fyU/PXJxRcuvJWeD+rtoT7lTFolm8AMsuFJXHpXKcKcdTlDLfU6JzqeWch5vMjuhAEhGBgxOsCaMMofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=o0rrBVce; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o0rrBVce"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so10715475e9.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 15 Aug 2025 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755264906; x=1755869706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpqtS/FEbhjXm2/wovH0Q6hpkzYVj4SB1X/BPvIW6lA=;
        b=o0rrBVceG/93Zv6Cpg4HwHMEn45iIU5rqMthA/4pxF/8zvTvYw9iUyErLts7xebOW/
         cKGzCqv9f5ka+P7fwXQ5ovlk84ZXTSRBqYLF7UVpKc+LKNgk7rftC0/+5FSHUAy7/GWn
         65LuzfcfTEM42CpXYRAunNG73A3f8HdX0saJQF5WV4nkJw2YQzx7ABW8FzU9BXilmUxt
         m5sp3S8xvTiL5/pirxWFYLs1GAo3qW1Ptq13rO4N1QmBqkGIBmlFbj+1C5D6my62eOSN
         N0aEGk2voI+f2fyEhAvwf0yA8cjacEcDIwIzsERoqqNtQBgbvFxXQxkFqeFpdKOFlIUT
         lUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755264906; x=1755869706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpqtS/FEbhjXm2/wovH0Q6hpkzYVj4SB1X/BPvIW6lA=;
        b=fLkCkemLmlECwBLyqEbejSKUp4aLw+nxyNCVbkj4b2xDPzxahJHKHXkk7Q6nKhYTKX
         zNCHWD2qxaAYSqPuQdG68ZGlC85hv8lkApSSqYxe/Dtt9xTslkuJr+H46XF61wmX6h0A
         R7Pn/NtyRVtwcA09qGpJQACf5jpI1o5Y8oX+x74K0+gGgt/Fy6WpN470hJdbhquM8IbU
         f95KHlwHSOKKA4fJZBZlIWwjF5IIfGq4gYKSUb23xdGUjBukc5GHfGfVmF9d3hESX0l2
         Puk03w4qLfk3XwPcE4JHGpsoM2sa3+fDL3R9zsYgOV4pFhREVU3VGJq0pzOqOxdurH5P
         m2rA==
X-Gm-Message-State: AOJu0YwDCOWkZcQGLCCUubIRlWuipsGU8Vsrr/BD1dQnQVkVKX4JrjuA
	Yu+NMHp/SI9aWWiAWq3mpFQTHrUna7opL3TR3lvb9aQlIHfUwTlLfGyrfUDQUKn4DyFMFXZFDOL
	rdbiv
X-Gm-Gg: ASbGncsO3BuH1P04FV7IpVvkefIg/lCwdZVo+SHI99MxRULZy/XEjl+zs0FO0tCGcL4
	gwHGMJhGYQZEB9JxLZtqYYdoVHJ5MFUYXl8dugjO0mVS1N2VSUvwJgvIvGDvq0jkiTeDKmVcs2r
	k/nuQsZtO3bjER6dIViUhSQ1UTFVyLpshFzikpNKa1IzhBQ2Ls1MwMcgbY11DCGuyojEblDPPIy
	mzHtMWkyioEG6rAunEPDMHheM+wbMeJzoUoR+YDw0frrognCcP6lObgvn/4H3g3WIuYTvvmpN7u
	Dvspt4TBPYli/ajI70VqRq18g2taTR9pqPFsoW4vuM67SK5uq6UlbjhVJYTbBttpmR+sNS/rgNY
	wiLWfLqDRXACTzXXmKTscvh4FdetXA/HEPuks8DWpwL8mWqqxnwcWCTJAHZchOlAS
X-Google-Smtp-Source: AGHT+IFz6weCAVDmKcDzYiuwRqHtuAAJbjvkoe0paI5Um7+6mokHIsnE1GdCLeFMy7wlQ2CLVNXCXQ==
X-Received: by 2002:a05:600c:190e:b0:458:bc3f:6a7b with SMTP id 5b1f17b1804b1-45a21859692mr19281205e9.18.1755264906539;
        Fri, 15 Aug 2025 06:35:06 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb68079336sm1918522f8f.53.2025.08.15.06.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:35:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH v2 1/2] livetree: Simplify append_to_property()
Date: Fri, 15 Aug 2025 15:34:53 +0200
Message-ID: <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755264521.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755264521.git.u.kleine-koenig@baylibre.com>
References: <cover.1755264521.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=y/m4Blfot9oCUT0dry50R4C4PO5PMYiMyTdgqjUtPgE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBonzd+3BxqPHk0vgiVzLXy5m8msMkpnEuckZaVf VldKZ1+KwCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaJ83fgAKCRCPgPtYfRL+ To1kB/47gMa4WA7BXaVroGnnUWiwE19D9RP+S/aKJhn5J4KCp/ZXcigd9O5wsSCDVBJTmqcIBiy eXMH+8Mkft0/q/eRgdP8/jL94xsov29xS3YxeFrsmizm7B4o118WsGpyzntvlFk/r/lxnciYfUe ZJRuZZUHxa+S1PMKHgjth/hA0vB7YNqIhLfFa3VRqaQ962hRH0WPtvIbP3j2wYG/kpkJa0iW4nu mk5/3sV7C/3p43Gj7kZFwBlqEVMOqnyS3hw8z5Pni5H/ZUYGhu2cQFLZo0lNH56Ovy7T4ibEa/C MaaHk+RuXgKaBd8sa/+/zoJ/OetWyq0mXZO30vYxM4HqmemD
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The two if branches are quite similar. Build the property first (in case
it doesn't exist) and then the common parts can be done outside the if
block.
---
 livetree.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/livetree.c b/livetree.c
index d51d05830b18..6127d604d528 100644
--- a/livetree.c
+++ b/livetree.c
@@ -340,20 +340,16 @@ void append_to_property(struct node *node,
 			char *name, const void *data, int len,
 			enum markertype type)
 {
-	struct data d;
 	struct property *p;
 
 	p = get_property(node, name);
-	if (p) {
-		d = data_add_marker(p->val, type, name);
-		d = data_append_data(d, data, len);
-		p->val = d;
-	} else {
-		d = data_add_marker(empty_data, type, name);
-		d = data_append_data(d, data, len);
-		p = build_property(name, d, NULL);
+	if (!p) {
+		p = build_property(name, empty_data, NULL);
 		add_property(node, p);
 	}
+
+	p->val = data_add_marker(p->val, type, name);
+	p->val = data_append_data(p->val, data, len);
 }
 
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
-- 
2.50.1

