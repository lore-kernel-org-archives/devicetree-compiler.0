Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDDE247291
	for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274201; cv=none; b=s5Ms4jQ9FkJ1a3/9zV5qg/QPZbJ1w9jxPXjH4wadncT3PiDf9CgXYJTi5jgLBpwpV2aU6zBSGzs0r2MraVAc2K78mAn4eBAMPD40YCo0qtvNUB68SerEMb9mKKFZ4/gK1qNJaLHV/LfCcuoXIDVCmBawXyLNKQEHmlUHH7mzb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274201; c=relaxed/simple;
	bh=KA0gk1LKaPOrM1FTrbEyZPgEVFS3BfeqI1u+dWSYUtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETqZ8pHAfjLofXChv5MVUdSGYWLUVZ2SDZEVd56vuVtrNNPzffZjK+GVz4xCo3rwRRYGygyETE9FvgEKaikglSmwQvq2rhOUBHZpLsaZERGzYv24Qth0iXGkqEhPkjtnSZtIThOnhQM2GzyGTd1uZTYpAUBzOJIuFv6MeQGMCTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rZeHzmhk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rZeHzmhk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b042eb09948so332991266b.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758274198; x=1758878998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUHhP6z5a7H6W+nJEQ4LqPyWoAygTqCviwlfZrf8Oxs=;
        b=rZeHzmhkglJRfpR62zLU6zukcdwdRmYjrGZpvwACl+Cbr0DsW5uzadZkj++vIavwsF
         TYfaRKjg95e4d8yb7rzEzgE4Qel4hCshy0lcMANMVOa2tSuQFoMRukhFkrqE6AQIejC9
         AigooD/12lkytaXbjkiJOxqmSHkXObsUbYUnXTpGMZh78cNSE/kKFg7WzllL72cWUpZ+
         60gtpu8NLayxFmFI/u9holj7p+YCSMpDpEVgTiwOA9H/rkYcBbhb/RTXzoxIeYAxEyiK
         bR+atV70sa6HZas/XGIII6t0vKCEYOz52VtKi+iNj0RFTrOqHolPF26gmLKTRqanLb0z
         pnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274198; x=1758878998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUHhP6z5a7H6W+nJEQ4LqPyWoAygTqCviwlfZrf8Oxs=;
        b=fF4Q5vyvcl7ye1YuRMoattLiDkA7qrNK2JJ8c0QjjdRw3+bryobNUZZdftOvyitzMk
         OH8woSY29uYiEDxnZGqHDHuc9coybSm29fgkf7XiRjTHx45WCv4opqK6nxQcpPkprgDv
         e4UgtOzokFoC0AT4hIaxL/D3/29tyYzwVtZ4ZJGWea4UCW4YDyATr+L5U7Vl1Jsi6Biw
         w8BAatBL08+bd3VRK/JbCAh6f8IKd+mUQLMKW8FOmGDLrMaUmNBIpqK+THDeSQjRc5TF
         z2+uu/uZbm+jzpfpMIkqyIoz5N16Gmj41HL7szjGKuLdCNNWWKqWNPywLuPbV5xh2Glm
         3uwg==
X-Gm-Message-State: AOJu0YzqEnhVGtHuqN8d494mSECrNXqggJYe+mV15jDjcWNtTd1waMOe
	vdrzg8R4lMdPHH1yKuMoNNwqf9R1s+aUBZUsPvWlGDoTtGTdT8GwCis3296aWlTzBxQiYd0lRvD
	IXFLk
X-Gm-Gg: ASbGncs/EAiZo+aKpzWKmdbayhTzWK2Xc2+R/UKol0BGFob0NPTAFuZLwEgDUqBgoj8
	2/uGZKWZng5rnbu6KMLGZjN3HQw5uV7pGZWadz7AaOsCkppUXOsxKMYXuIraUGSX/BJWXR3Usnv
	6Zg0WwKgtqr8zqTy3Mc1QbV1p47TsNWMzeygtq82B+ieYSH1a+K9Ha78/gW60VKozmTbeWl0zPt
	q6YQsahvGb8M0PDFNNy3NKmJYFT7xzZnL5E/ZPYHczIH5YemLnT2Wf35eUVA82QekqGfDbpi/VU
	PrWpksGJeI/jwmZKlYw0tvpxsU/lSs5h4RlWzHPdwYjzo3/9C/0Jgub3jEGBgoOUDmn5nLuE+Ro
	eVxXjKMpdYOEko7FH/B2WX1j8LlbWH1O1NKsAI8maV8TZMJveo/iUEW5W1CN+l8F2
X-Google-Smtp-Source: AGHT+IFnXA6agNmHX2RvTfLGugWcLUvsqd9YFRHboSsHivnEJDcBOhJx+p+WumGbzxcrHIu4NmoAqw==
X-Received: by 2002:a17:906:478c:b0:b14:f921:5b23 with SMTP id a640c23a62f3a-b24f6121033mr250527066b.46.1758274197685;
        Fri, 19 Sep 2025 02:29:57 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fc5f382b0sm406591066b.2.2025.09.19.02.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:29:57 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 4/6] Restore labels from __symbols__ node
Date: Fri, 19 Sep 2025 11:29:17 +0200
Message-ID: <20250919092912.663304-12-u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2192; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=KA0gk1LKaPOrM1FTrbEyZPgEVFS3BfeqI1u+dWSYUtQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBozSJ0pzyl4dXJxuCnjcanjBxInP2S5yfwWi3VD +PSB9VXw+iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaM0idAAKCRCPgPtYfRL+ TqkhB/45PwcNIJ+TCVA7sbvOrzeDLLdEPAwT/aawEJDwUzcwnvYLoMjTwKcf/rjPt6dGFAdAkUf 7VpSGxVlmVVNhFaEVisbiwkSETUesHlSzhzNAuP0hJvePRSMlso+ksLpOYcZCv+Vizmg1oZfjUY +T3g6fY8GMf+RsMqTryv9Ijo5cqc0G2WHeMhKU9L3HL6+Dd4SscRtn5oG01UzJ6Wq0KDU/E2KAN my77y4BYzWBm4u03JeojxtgJZ7f/qewZImp0e6pjVrYhiAwkAFZK7KtX9abda5eCFbqXp5vVPKf LRthdJw8gGvyENhIX2kTmxT72oaXgmv5aP9e8jaf7kP+J9hC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

If the input has a __symbols__ node, restore the named labels for the
respective nodes.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 dtc.c      |  2 ++
 dtc.h      |  1 +
 livetree.c | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/dtc.c b/dtc.c
index b3445b7d6473..63a6c85da5cf 100644
--- a/dtc.c
+++ b/dtc.c
@@ -338,6 +338,8 @@ int main(int argc, char *argv[])
 	if (auto_label_aliases)
 		generate_label_tree(dti, "aliases", false);
 
+	generate_labels_from_tree(dti, "__symbols__");
+
 	if (generate_symbols)
 		generate_label_tree(dti, "__symbols__", true);
 
diff --git a/dtc.h b/dtc.h
index 3a220b9afc99..f97f3c29e2d4 100644
--- a/dtc.h
+++ b/dtc.h
@@ -339,6 +339,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys);
 void sort_tree(struct dt_info *dti);
+void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
 void generate_fixups_tree(struct dt_info *dti, const char *name);
 void generate_local_fixups_tree(struct dt_info *dti, const char *name);
diff --git a/livetree.c b/livetree.c
index f328824c3bc6..8aafc9aa5cd6 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1112,6 +1112,27 @@ static int generate_local_fixups_tree_internal(struct dt_info *dti,
 	return ret;
 }
 
+void generate_labels_from_tree(struct dt_info *dti, const char *name)
+{
+	struct node *an;
+	struct property *p;
+
+	an = get_subnode(dti->dt, name);
+	if (!an)
+		return;
+
+	for_each_property(an, p) {
+		struct node *labeled_node;
+
+		labeled_node = get_node_by_path(dti->dt, p->val.val);
+		if (labeled_node)
+			add_label(&labeled_node->labels, p->name);
+		else if (quiet < 1)
+			fprintf(stderr, "Warning: Path %s referenced in property %s/%s missing",
+				p->val.val, name, p->name);
+	}
+}
+
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
 {
 	if (!any_label_tree(dti, dti->dt))
-- 
2.51.0

