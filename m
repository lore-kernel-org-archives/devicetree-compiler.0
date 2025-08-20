Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A222BEC5C
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695533; cv=none; b=s3CFH1//jMTesH2GFwUmPnFBTEh005RlA/I8bSsVsvrOe7vQt2hJXVbOviFSmovbnPNL9pSm4QKoHEL3tQDhL2qzxUidRgMglUN3YZAnS60NdCEU/H0ZbvxV4JI5UcT4YwfHBJWikdenW+UBL3kfXiOtQOJ6HStl0CvFv4igh1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695533; c=relaxed/simple;
	bh=3Ss49Lgs8ol2qnVizri1HYBhE9xiJV17/EcO6bWfLWY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lr0YmXe2agqFyv+E7AJKfNZ/CTBMBMYSaHuYBHyqP/9f5ctRLYuedNea4B/s5EUK4NO1ii0mFTLzOv2ggdbqN3fsL05X/nyd74jSXj6C99XQDYCfx8l/d0qwe/AgeVWq/AZknmF6btg4o4kKzfEG3eLPBdojr3c/UsWkQwLs4Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SegKokJ1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SegKokJ1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso34076575e9.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755695528; x=1756300328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqFfs33piMXhFFgWf+NyqVgQXLZzlUjoSqImKrxTAZQ=;
        b=SegKokJ1J+9klvUJE8bB6AahB8nkHJFZwFPvNSOmWWFoP11pyEu2Iz2Co2JT3ewh54
         fb6oD+OGEksXexMmxxWIuTnJmtX5HWjT9yBh1EYXB64ic2sCDJ3TbpyoeqEOHYoIvEGk
         jaTorbHbklA4Dzu3r7Y6V2Iv6C8Cj8o8qe3LkaLLOBQuqsMeTvCmCROKYgfa9DbmIydm
         TJUBISbWHbnnNah2CBi5ZvOyshoutYludfzZ9sTe28oIkY4ZSsdDJLA6IVbgrspjz17H
         c3H/i7tx1sWaDkzi41adgqqXts0HwYURNak28LFEFBGQFN2pZvcJ40xEK2l4pO9CRDIR
         muWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695528; x=1756300328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqFfs33piMXhFFgWf+NyqVgQXLZzlUjoSqImKrxTAZQ=;
        b=hsYIPN8a6S8bzTHiF7xwXgG1KMEQX8oJTOvQOlxC9EC7kZz/L+D34c4NyBv1kIWatR
         lWjXLqBinc1hsSJuHsYMmJIaivqwb0ndwhOqXoqeOc4Qxw44cxVCdtd9gseg87zXbrZn
         VqJQargHxBY3qYo7MsQ+C2Er9KWUxV2MVTW/IlK8CTgcA5Dcuny05kD7SOUPaj+BXExX
         +taBOG/udseG/hdF4FBWKlqoS6ZchGTBaHPkfW5Cpnrrm28CwQBRCA7uLJXq14JDywMS
         L2Ethace8ofGw+vSVOSoB4H4TWga1e6jO+l8UmnxK+DcNKC32Jq5EfpeeWy5GUdqPRD5
         Z2AA==
X-Gm-Message-State: AOJu0Ywm1pPiAaFv7wo7AD2CmnJ7TZvKXKTPwS6IQte+hbr3X7nwBVK4
	7kZSMby7fwW3BumavO8IFIQwn/4AYC6oThwgJHinSMzssxfV6bJb/An++yhTUgddhgzwGdua4hr
	NlzI7
X-Gm-Gg: ASbGncvCbAE9I+BcQ+ka9JVAtxnJva6ZvwbcoCZazO8VR171gSNtbfY6UVQbm1seMV+
	vYiv3/tJ0G7c1oloeTZ+o2/wZjQki31rsm1oMzYt/SV3KmznFr9+kQG775dOXyybAPG54I5kBEL
	gMzoVb61dzfOVaaUuchfiXM86vl+Yhz0TvVPhK1E3ROfUwx/v6hPjmsmaHxxjZV3nJDRLiDx3nE
	Op+365hdswVHgvatBWnh6o9Kldlx+uzRcN65AFb7qppEPUDRRLBkq5MlIPZ3CL7Qs1HVrlasv9Q
	QmBKYcFJ2sxYV1ZTvkJfpshbdllUEWGBNWi5KAFShMc8NQ3LDSCwaZ4de4BVc/BjrxIDVy7z3wG
	6METrLtMJ5+0K3x1B1m61/Yhox/+AUURUTJV58j6wU3GflZXIz8y7R5PTrSy8cRgI
X-Google-Smtp-Source: AGHT+IFvU470b5wmPmvHU1C3S+/Hv4iAuQup4ef4VZjSL//g03Jqw2SKrItkmsl19YDUKe6ww0RT4w==
X-Received: by 2002:a05:600c:45d0:b0:459:d6a6:77c with SMTP id 5b1f17b1804b1-45b47a0125bmr20709525e9.33.1755695528223;
        Wed, 20 Aug 2025 06:12:08 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b47c6485dsm35980645e9.22.2025.08.20.06.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:12:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 1/6] Emit /plugin/ when compiling to .dts with DTSF_PLUGIN set
Date: Wed, 20 Aug 2025 15:11:27 +0200
Message-ID: <3dff5b0db7c17aa388010222d36946fe9177f69b.1755692822.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=3Ss49Lgs8ol2qnVizri1HYBhE9xiJV17/EcO6bWfLWY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBopcmOX/6Whgi4P1oo+/P6aOC7naTpnez0VmV4V DnV+YNc7ACJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKXJjgAKCRCPgPtYfRL+ TrRmB/9fZH1EueeZ5ujJ317M+D14q+DJSOdpq3L2p4cHu2QQT3uH8XWueNdoidfKYw/Zh2zgUTw MJQMO1I0fb5a5FeGay0lbv1ucyiZBzjYsqL8bfC1W75n2xPLTC7KfSMjLbsYpMMKirfvT4jkyGq LHP84QQoBDFSJ79mY7M3xhdJST+slN9dYQJMQqjFPEcUtSXz02ZixU9HCfyaqzzBhji3ZixpJx6 y0GtJPYAbs7lTI8EeE/gGYvbqTpch2Zntw1xkoQl9sAVLvsU6yLd06Wj6Z3wbjak5vvUfwAKGTm +8zFkhIg522upRoMEQA75PBOIDxDVa9iaY/ikTvnv8Qutv8E
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This fixes `dtc -I dts -O dts` to make the file a plugin if the source
file is one.

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
2.50.1

