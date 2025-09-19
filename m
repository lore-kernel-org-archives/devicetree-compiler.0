Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709C2F291B
	for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274199; cv=none; b=Gv6kxfEy8ERCsH3GPpJt3pBy/JTye381ZozngMnjdZo9wmqBxmyQooKus7Mv6pyEqJUbxDqPXxjszgTAeKhutk5c2Oy6RjUIGOzOLtKNNY7Fb5ZX/wU+qUixu2821fVEx6SEM18uKJOahAIj2NBtgW8pYjoFqLISUpTf3RKQRkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274199; c=relaxed/simple;
	bh=DkYSSU6gVPH6oyk/xEQ4vYlktS4VWqRN3bKqw7we/ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nK4zGFfxJnoL+kAKIMDsN/4/G8kDZjTvN8neZcZhULtj/2WgPKVrzCA+AKeYUkV8cZwnpXkXVr91DJPHrrp/PtXZErqoQUCqN8OAKCEyanj2ie9J1qHX+Sn3MI0jA/cIjuufxRZv6IwP1IS5CFF3UgvVkaC2d2qkMCq7KQAQpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2RbnAO0h; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2RbnAO0h"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0b6bf0097aso347346166b.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 02:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758274195; x=1758878995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYmDKXGsyW9jpxk8VSph0PJ6jyNFQg8UqN12DaWQE34=;
        b=2RbnAO0hR/49b1OgsTA9n63K25wDSya9uFs5524CLswRCe0zV7b7TcM0pxyeYCuO42
         ZeacwOK5R0v9sZP+i9Z9/iFbMPcDv7DyE9wXXCS3SYbLxdMwDYHw73sVrFdauomMRzuB
         bX2hsgMY/a6bO0xctkhWasRh5PMw5B3FGHzuGJpYDb9JHS6atU+wI3UogYy/g5DOaR7e
         4D2lvA5TG46jr+bzrFYmtFAI+uAsy7em0yDBlW0eTPv1PH/Ux9SUYojR2kAw29sAVvzE
         cuAPAN/D6flDMcSdKrCMJzCLVNiCT9dbUQfD9mafj/pv6KsWAMHa+47Emqk+9llRi5Vg
         gBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274195; x=1758878995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYmDKXGsyW9jpxk8VSph0PJ6jyNFQg8UqN12DaWQE34=;
        b=PkOpCCByfAAFPkdWTZV3b9pztgDTQ5+Gh0suqu9bY9boN97bMEW6kmiNbKgXVKY6ZU
         novrtDVRVLYI7OJLxT6VjBVjkTvcz0Vz47oZ72XKt+uRDsKzkiaNd5F8BRU3k/tDmnj1
         AwunnzdkqX73VPrXX5SMHcPOanYlTQiFjGVBNTeTh+R4HdgznbxFosqhrfpQocyRicDO
         B1an+gJfZSw/cuh2M2rMqpFmRW1GFJNuuL7xYyZ1rjFdwL9NzOCeuogfb/HrHXejV8KP
         bk2/XZSkdPObyHUODiVlbQmM/JGTHoqhKhhHnhH8s9nFSOkJ1hizBNN0bO7oM/uoQpOr
         BXFw==
X-Gm-Message-State: AOJu0Yy1n7LLZ6WakRxsx9zvZ8uXeF7QZ+lOXoEPob+3d/26PiqQVo2y
	jFwtcQh1P1sheZ8lLrnF9+IsjOfryEPxUa0/5gIuVuqpujoRFCEK4SqCuGODWeTNlgzAWSixCuT
	+yuAK
X-Gm-Gg: ASbGncvwc3hYdkwwqBSuiPvSo8ASFI1gJCNen87bs2MMIczP7n2yrO8SGJuuZh313fb
	eMa1NeitHz5lVYv7LoQ6/Cl6CNF9PbNBGpGAjfucYG35nF7muqHEWjcHRyFBtO6Qm0GunyL6aqg
	VHTngYEgPKt1gcddkLg9A3phlmhd4r27qm98DBrkK5qLshFav855Urg5o9IXY5LhJQPgk1yRkQG
	36QOTSph1WbS955EB7xd8SrdEyB+HeleH7wfRHy2GqH6FvjG4ijfxTjH/KOPJ4HjfKPQoJwQwan
	iVb77HQPybuKBVRWdNW6bjCDWu/eKtr09CtFTvIApBhj904TjFMWGzMQ33TEaGMHhd+kuEsN8b9
	fG1Rarpu0URNIMjBpvJOcY1Glb4w08Tc057bNA6WNII9kws26/9WYEOxzqfanArxh
X-Google-Smtp-Source: AGHT+IFU2a90zbCp99zqhYclHehq69PgfAELO9L4FKA6je/LK1zYOy+BIL8U2DnitnO5CX/1H1ex6g==
X-Received: by 2002:a17:907:849:b0:b0e:8cd4:e2e8 with SMTP id a640c23a62f3a-b24eedc3122mr275963766b.17.1758274194666;
        Fri, 19 Sep 2025 02:29:54 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b2636394e32sm72811566b.16.2025.09.19.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:29:54 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 2/6] Set DTSF_PLUGIN if needed when compiling from dtb
Date: Fri, 19 Sep 2025 11:29:15 +0200
Message-ID: <20250919092912.663304-10-u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=DkYSSU6gVPH6oyk/xEQ4vYlktS4VWqRN3bKqw7we/ls=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBozSJvK+j5h6EfCzAjxvVOmA1SlD9ojMV48fqy4 OdI1CBpU4CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaM0ibwAKCRCPgPtYfRL+ TuyAB/9jkuapWs2hMG3c4eYp1TRkx1+/9u8mzl/QHUdiVt+MTkD64GcFXfJImOpkiwK5E76dBe+ 9EjAx5wA1Urhy4uSGmAI2ftyV2pbJSrVEtLs8MlGu+dSFgyFhNU0DdHH+wKh+g35w4RvRqHuj17 u0lu/tBaSUjsf24iPJNR315qJhty+TMrhrmcsEdtyyuUkOyqA6oZ0ZpqfjOKslM9QGSksrD5hGS PvQqTE5ztGZbRklx5xUW8P7/zkqEy7/7g3IIUEq71kk4GDZVa87dP+cG1Oo2DdBJKjbJyf4jZtm GMENYl4JhgH3XQD2EJpDZ/EqA3gSYUXEhO1JTrqkXVx77g3q
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The need for the plugin flag is determined by the existence of __fixups__
or __local_fixups__.

This is a bit simplifying because if __fixups__ or __local_fixups__
exist but don't have properties, the plugin flag isn't needed. But in
practise the test should be good enough such that this corner case
doesn't matter.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 flattree.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/flattree.c b/flattree.c
index 30e6de2044b2..f3b698c17e89 100644
--- a/flattree.c
+++ b/flattree.c
@@ -807,6 +807,7 @@ struct dt_info *dt_from_blob(const char *fname)
 	struct node *tree;
 	uint32_t val;
 	int flags = 0;
+	unsigned int dtsflags = DTSF_V1;
 
 	f = srcfile_relative_open(fname, NULL);
 
@@ -919,5 +920,8 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	fclose(f);
 
-	return build_dt_info(DTSF_V1, reservelist, tree, boot_cpuid_phys);
+	if (get_subnode(tree, "__fixups__") || get_subnode(tree, "__local_fixups__"))
+		dtsflags |= DTSF_PLUGIN;
+
+	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys);
 }
-- 
2.51.0

