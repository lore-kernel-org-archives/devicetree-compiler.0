Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3B62C2372
	for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513363; cv=none; b=dlwGf0WPG4tfEcZ9Z71j179gVGu0lyNZ5YjIFE8mKBR0kHtMOIFg1ANLark2mYRisgaMcWNROkPF84z7aQBpExgPwcdo1P7qd7ouRu/KGk0BxZI0Sz9rSAD1VZ6QajCwAmwVJ7cboEl3wUSFf9rN/ITj4ftmmroxHsTgi7H/a0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513363; c=relaxed/simple;
	bh=y/m4Blfot9oCUT0dry50R4C4PO5PMYiMyTdgqjUtPgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrJo+nOW2Qp0KZh5CgiWtaeKw8E6bmXaTVk1gi9I2eU1BB1u6pJM2Gyxi+D7R8/lhS4nCNW7hTAeLp3UqP2weN7BlD3y1ZChfyWEx1JNi4QfezXBCNAZYPkA89SwTdzxbwTkzkgzG3aA/rFn19Zj4OvpEqtldJoUFT6KYu0Xl6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IxklhK+5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IxklhK+5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e414ef53so4196335f8f.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755513359; x=1756118159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpqtS/FEbhjXm2/wovH0Q6hpkzYVj4SB1X/BPvIW6lA=;
        b=IxklhK+5E7Vs7DfGIDz9f0C+rs6O9pDDu+fgi3skJ/aaM3ntiC+WjzfQtqLe/6Qt0/
         bfIihJLHgGwBx/bm4gMWyaJcRrkfYHooy2MrbUxHbX/93cxCGbMH1Qxl/9Cjr+59QBxP
         KP0NhD86BdPdBgwNJX3SS2xK/mH1/fTARMwIGj0Adh+4JBp5cFR0512IH5+xLEzdhC7j
         yxQlX9+MU2LPwI/aXPrcE8pdAdm/s3BujvVxOQMue8UDhnxJkEtz9AUPKnzbVNeCaLo9
         Z8NucPCFQ7wvVhz4SjuWFv8yHJT/Tz5mcMG3B2iTZDpMIqXzHXaQ3zaRrOMcKBOO/NKa
         T2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755513359; x=1756118159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpqtS/FEbhjXm2/wovH0Q6hpkzYVj4SB1X/BPvIW6lA=;
        b=i8yCt/eHbrghFCq/YfB0Ryl9hkV9gqgSdErBisyhGYILNu43xZLqAb669JGEtjZnO2
         aVQiT08mUkoQ01tKtD0Y2LMIlYd/8EzEu+0ExVL5CjkZRUIQxtF+4ih0fqlrxQuRoLqY
         6PZjBNbahXy7EYKoxVdpsYLHP2iWdVx4sjRrb2DEcWrUfTiNMg/awcbf9MLskA773K2/
         sKSBQNmcjHSjmqYOjULKyb6NJBFAotDNXpzzmYrzoSi9q2Rz51zxlgxFMhaI/3P748xS
         uiqu350Bjn5kEoCfapEyq6aBDyYGgBoPXPXR6N+1V9OSo3hQZbXHCbXIs6sVT9loWTh9
         9PHQ==
X-Gm-Message-State: AOJu0YxIL6mSG6Wv49ApOY1QFVWOhNBoawHBFTZLUXM3aKreqJ+D3aW9
	uuiFoYatexfiyBVBlmLKeo7OUowRlOTW+gslRi9YLLXM3H5NDCZQdXLfL0vbTXhrjTrc0vz07Sn
	jeGF7
X-Gm-Gg: ASbGncuwhWv5kO7gciZmeu2xEUMGTaHQ/Ophraxo1SMGtZ9dARmAkTS06nNDPjYUrs8
	Rzy8iA8Ic4f+dEBzeMxfOcNmfE4FFsE/nLDyvnqznTeeUj6w3xzl06t3lZwhXwjkZLkxX/+Aq3T
	hVdjXVuG+ydcB/vWjxIvPtlRCLw/0S9f3SujfOGaFE8ELgXOVbkY4HEd86JIxw7U5Z4OLPm//uZ
	nqWC5gEHdA4U96X5Txx4d7WAVbAN/1HcXlzhtbecQAKiYPbR8I/pZAvOT6koCIgg0dqJosQunBP
	yCybxwQwO5xb/XNCpkwBWRBeG42dxlDyUmd19s31PTwqIFxAXp6YyfwF/q8pPWrp9tu/cgnwa7q
	NheiK5U7y6UHQhSVdiee3f7MXbiXGXhKq9aNqWjhL9prDWFMfKCZEvwBRDdeETVn8
X-Google-Smtp-Source: AGHT+IF2Cv8DItdkUr/TkgJ5jekdrQmJgP0TjVBPEubVGRcCGHx2VC3r7jbKy9EYCJJkmPpIgbIW1Q==
X-Received: by 2002:a5d:5d11:0:b0:3b7:810f:6caf with SMTP id ffacd0b85a97d-3bb68a1874amr9649228f8f.32.1755513358884;
        Mon, 18 Aug 2025 03:35:58 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb64758441sm12336449f8f.13.2025.08.18.03.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 03:35:58 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v3 1/2] livetree: Simplify append_to_property()
Date: Mon, 18 Aug 2025 12:35:45 +0200
Message-ID: <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755512759.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
References: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=y/m4Blfot9oCUT0dry50R4C4PO5PMYiMyTdgqjUtPgE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoowIC/DQM8h95yodKV1cBl/jnUz0aH4Lu3exOC 7Zh7RzDbpOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKMCAgAKCRCPgPtYfRL+ Tg1xCACx4vr7KNmf2jN8p3cwy/KCv3ZnXVIyIi1vgmu57ravnjSL+zJDQcfXAss6aZsYsnXlNRO iwspCBAfjCOf+sjnDXN6sBT0Ss9yGC4b5ymOcfDfvj/SqaNl2h9fZUKW7cGluT6GjPueO37m9L2 qvfgfYENZbPlC5Z9dxUVIKKLeQgLalWjb4OaUjsSQ3uVLmNp6QmSBAxCwd7jOsfCTkmIVrOuJ/i LtAzbld5lPaENUkG57JZeNJm0HDG6a44rZgtO3CU8QE/3jBh1PSVNhIAAAxElaVpn08Do0FROHw NtxwEVjMFC9wqE8kYo9JndDHvkuA/+FbBYQqMffTOzQ8yier
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

