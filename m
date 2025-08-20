Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA4831AF33
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695534; cv=none; b=tUIcxj3IuyyuFiJhUjH/3E316TnVkWFJ3/4bHvvLvLCIpC+f7HgywALQbc7cRHf9iQ+np9EgtSymGi2e/GWnokkPCbt52NIAlu5kdoQX9eIAxJxqLi4Nu6btpEKW/eLACNE3JHR9QfymCzfEnNytQhzFyOAS50OMEEVxjhhvZiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695534; c=relaxed/simple;
	bh=D4tPRPb9NnsRkbkEWhgvxOKbsGXv8fy2guU+/u2bdiM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p8hS23c86JjDICPMGNYqGpH+aZepwOMx5DfyKvgHJJjdOZXG3TF3ZDNTEzHf840VOKhzQPOxnI1fqx1KPh7Cd3Y7JbDkyGv1BXeP0TGvBc6bGIoPrevDBnyHIyTMskc0vWS23wRPxePVHfPE3fCs3ibYvPIwD3b6oCXmKVuqU34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SSRNRHUf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SSRNRHUf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9ba300cb9so639020f8f.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755695530; x=1756300330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqH4LbEY4QcBvzpXMQxK5uRYDKU9LhlG5LCQdVyb36Q=;
        b=SSRNRHUft9Xd3mrnBRTCNrS9U/qJ4479GgIz3BptTbQCKQ4thevsOuEQqOL57dI+wl
         fC/1auvd1wM7xwUkFcVsaXWeJPnIKETP8au8/SQJlyM01hcCaeG7s2Zs/8iDUFexGfrQ
         dqPfIfpE+pJr3+hIwpQyPZ9CefeztMSvLULZqZWSKgBbX3rkYSqRYYjmBkDgFU5eI9/G
         TS4+iWRokVCwLvwXTWrBcQUp2xK1+Z2CedCMkva3rkLbgZwAAZqjJFNsZDMXnDzRKgjx
         uDxDkje2uQu2fvl91JExkiyMPP3i96zqGoe0M/1VpORPhhmse0riEMGdFH2+j4tU1s8o
         sHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695530; x=1756300330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqH4LbEY4QcBvzpXMQxK5uRYDKU9LhlG5LCQdVyb36Q=;
        b=T48P5/KDmFfYPy0SZAszsMPEMgEylmYG1yqPMeOL52L86Wq+DZfBG3e32QiYzyzwx0
         5g1JDcXk/c4N0ibAhc6wilBSh4bAAIQahzAPqmBW8O096qz7aHnaI3aubPNTc5jXoEfV
         P4mcKjIdiINaMuu6QulfFImXJoaehoFN6yp82D+T7HuXZmTbjRSAuVExgs1Lvd1svXr3
         6nJ2DFQTJiLDfZedW5zmIIjFBbnk3YRrJaQ8PVOzm7GSztq7i3ky7TgtfcU7cafbSxAY
         XNpWrAzynfNJvSuT1Qr5u2xB32Mv9VeYPpImWYKfytG/4nmdBcS28u4HpE4DRH3v+RUO
         CjKQ==
X-Gm-Message-State: AOJu0Yy9D2Y+78r2iNX+vzyeF/fUxeS9F4Jyv9s2NGLWxUJcvJurFRR9
	xV0Eu1SbWzPzOPlQ+A8XjzXg0RMnmsLnImiP0WKJKL8cm1U3zAceQJlcKGaJBNgyWE9f/V/Tp6E
	WE7uI
X-Gm-Gg: ASbGnctc3e+L72/++7JZVKtvgvzQXbwDMW4ujnAxOqwyFQrnBbtZpWBUsK46LaMg3ib
	phshOq7mxL9g+8+l0snwK5P2SvvoUSuAICjc53wvbDJzZ9Qj7CGL+1bxtXh4hbK3wgQ74ziFZoM
	U7DUzefb0ufNxOMPFqaBdofbEXSfumRfq/YWcWEUf3klViCmZh97n8O2uWSjDdPQm27TiIoVPlp
	/4+3hwtkrFF92haCeh2c3WRDfO6ZASs98S60yDi7KlwT718eE1+mWvxwHey2e8ul/Mdza25Tnpv
	MbJCrpfy+i56ZO1u5RWTRbUf6tJQyRdZJkUddjpVLQzcjQHQaSw6ZXoox3AC4ZSIIWmOultuG4P
	ABDitxyKCWzhYmrX6BCEUTOiOW8H2uWv+Y8v0fnsSEmo4Z5zEbO13QCX7nMCqtRBI
X-Google-Smtp-Source: AGHT+IHrOcHp8f3AHdgieZ0w4FJwL54jSrd45whhrdHCU9JbQqwPs+tk5lDFPcyikEKNHVCSEVkgNQ==
X-Received: by 2002:a05:6000:40dc:b0:3b7:8ba2:9818 with SMTP id ffacd0b85a97d-3c314e74988mr2340879f8f.22.1755695529982;
        Wed, 20 Aug 2025 06:12:09 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077789106sm7757237f8f.51.2025.08.20.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:12:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 2/6] Set DTSF_PLUGIN if needed when compiling from dtb
Date: Wed, 20 Aug 2025 15:11:28 +0200
Message-ID: <03075deef27a7474914093282be9bb4e27dbce81.1755692822.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
References: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=D4tPRPb9NnsRkbkEWhgvxOKbsGXv8fy2guU+/u2bdiM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBopcmREwRaf42wNcdLkr6Nof9bpPC+C4rj+nrv4 MJH2pQSDx6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKXJkQAKCRCPgPtYfRL+ TsDKB/9a4XUBNafKSZh5Z9WCYbOmmVCX5y060b8pAkZGm5xnjqoUPt/D4HB7KKwtxUgVMnydNqn OwDO021xKW0X8wkefRIlvoVKy7rB8dOowSb9YwenzxHe5JkMMAc52CRwnBjQuH9NPOnuSHfrkDt O4En75nEAWiG+IOV+pzAbYUUSQBrLr0NBeXAzk7xwKwnkwPxVIzp1bW/9aB3waULDfI0CtvWOFJ EnKXRlnMh6QkgWX90deXUHBx2PxiYQUvDIZYUDzIen+fe4Qsh4rG6LoHRA3xOJyzrBZXxmI0Kyv 3krIcGfERMJ2CLt7Va1OwIToAZe8bS2hcH1leiC68OTkNth0
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The need for the plugin flag is determined by the existence of __fixups__
or __local_fixups__.

This is a bit simplifying because if __fixups__ or __local_fixups__
exist but don't have properties, the plugin flag isn't needed. But in
practise the test should be good enough such that this corner case
doesn't matter.

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
2.50.1

