Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C93D51C
	for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731769270; cv=none; b=iV695h8yYSWNoCK6R/JcAg10gVTdOXXsB72jePxr+XtiUzYm+yKowDxiLgmcLKNEd2i3/AE6Ht9NZ2U/1RoqzVQ0aSQwXpqdNrTgBoYIB7cegVKHd5uWOwojEM5g30GlYrA8Qw0ECGMS2xO3YI7NS0MzCVYsEPQLKPteKFhNC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731769270; c=relaxed/simple;
	bh=AD6TfBWM8ecHOh5xaILgFbUWKMaJRRQB9Hj9ukrXEFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P8T86nN38GYM272BkpqvfW7jZrAg2Pg80TKfsnE4Op6Z3wHoeT7qbFVsD73dZhMqMLI15tL1Q8dds5HyuB8W7OiB6aIVQQMts4bSZKTP4h//TVPfrNdPdjt305GjaGh3oYcvYxX/tr82Z7030jLU9+tDGLolikpo2aAwk2E+aBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=JDPsmKeQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="JDPsmKeQ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-211c1c144f5so20890945ad.1
        for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 07:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731769269; x=1732374069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuzxetjocUE1Tnr+fbSgU5vKM+YohdrSqTULDKjLg8s=;
        b=JDPsmKeQiltEaYWXlqC1xbONepzp685mZ98OgT63Y5LlAQuFveQlm3PIWNMyCk3FC1
         dk0xEXaYsVksw6mkapvSWtCpWjr3J9UVhAESMpYXevy9gpwEiqjNqPVOXIEKF1bGVD2t
         /cLE1ulYcHo72ah7JCY4yIp1Znt1A0MbLFJyYhnOfTwztJHY5ggaYq3Vet7aK3lafn/d
         JICOPkraWSzdyZYNMSiQ1bco9yi/JH3JpXeeKRuNUZfqZ9o2AW0HwDmWvWmhnYQVDs3b
         EAMoLe2kHEwjyofsRLqfkrDm7gyYmT5UYxyOdldD6zXtHPXf6ZZcf9hxjn/CbLrcC/He
         53Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731769269; x=1732374069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuzxetjocUE1Tnr+fbSgU5vKM+YohdrSqTULDKjLg8s=;
        b=tZBoFVSKj6bj0mXP7vN92n9lTrpso6RuiCwueOp2qKlFyP3ukxSal8EVZVOC9g0wsp
         tPPssq926eLrKAHyLwBcapTbMhu+PLItqBrGiOUa0tqCo0ljyDVhDy9BBiTp/HT/YHVK
         6cY4hyW4XscRYRREY9xgr+pwgX8a/kvDS54yJDoiQNt08uese6KX7RL9bZCDGyOqReRH
         Dsto0uiwc8sU5gJRFh74Dswl/oZsq0DFYaTzejv7IfxMjOSszBxuW0WaHSIlIwMYlNuh
         ifXop76vbo8tEljlAk04tjTz3ElFkYLIxJ+JAejCufGOBQATF9LfPplxyPLRzUO/N4YL
         osgQ==
X-Gm-Message-State: AOJu0YxHR1lSxUh2Ml3wftWQvAFdcn7CkkFAGZdlf71qZOOAuK9OmcyJ
	VeW7VYKbFt54/3wJcH92uCK9gKlRJs+0bw0aNc2hHFXNXvLwT1e67HgyWx/UjA==
X-Google-Smtp-Source: AGHT+IGaRgULkm9o0Xmt2rv+t7FR0MRYpS6gt0acx3cg2bk5MCDZg1zkbgbwNY5nDoc19EDf7YN5Yw==
X-Received: by 2002:a17:902:e806:b0:20c:cb6b:3631 with SMTP id d9443c01a7336-211d0816a8fmr99649415ad.27.1731769268825;
        Sat, 16 Nov 2024 07:01:08 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f4694bsm28492305ad.196.2024.11.16.07.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 07:01:08 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sat, 16 Nov 2024 20:30:22 +0530
Subject: [PATCH 4/5] tests: Fix overlay tests
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-overlay-path-v1-4-ac3e121359e9@beagleboard.org>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
In-Reply-To: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=AD6TfBWM8ecHOh5xaILgFbUWKMaJRRQB9Hj9ukrXEFA=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnOLOhzDKfwWC4X6hO91cdRXwUqHNThbVs7vDnG
 Svwf1a5XomJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZzizoQAKCRAFzvXHieVa
 dIL2EACP1g0bHoB4RqNyjKmuLlYwY1Z1Z078Bsz83P1wxTBUQmjlkeJ2Nd19SmegpgCf+kThRBD
 T9Os8XunxhGje803fCdPF6rdeZVWgx8Kd97K+GhM63vjFYdQQCvsvrqqWUrAdco10M+M02eF4Cy
 c9IOt+SHUksC4qCbzWIpsEs7lE13X0sW8YHHsIrTrYwax/noenuyquhNPdZiovdX20EtB8bUzgq
 gDWuwzbjsx6HJ4XHdACs9rG56lTlD8clczaNCqQWwqlklJ1Dc4jj3cSZa4PSWINLrW33ECopFV7
 qDSB2V3z3S/xYNJZqGmRkYEYgIXNfkwvsOcRBwn0hYldnDj5z5DbvR73SzCtFVeSsB8dIRHgT3W
 bUAWhQQU8fSTjXVbt+kuGLaa1EE0k6xSj5Z2DgUTL8yFtGwR9FDAh0W/fRF0lhS1n683gwsbPQO
 h+bRwHvhXzsHX7gu6UfOSbpj+bx1Df/4XoT76Zqri8MJUw/MQEIk5vEfAyicWD0NGVHsjnj0csz
 UaqGZfVIWgX8jxmw8Ve4MvM+13Qr5tXhcouwSH4RoePlxwEYApk+5eUeoljpCWane0tE0pcxAB9
 YnJ0y3ODfSliNz9UQDf69dE1t4idByz8eoxC8kQZa0ea7YK3hvSQstThsjFckvLLEEJwNFngAnr
 /QfMmXomV0bRn3A==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Fix tests broken by introduction of fdt_overlay_prepare()

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 tests/overlay.c           | 1 +
 tests/overlay_bad_fixup.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/overlay.c b/tests/overlay.c
index 2d27918a336939743c4ef6bd0c9b93d1e9dfc8fb..9d387aba8f85cf1b5a3d397613708b5c82655b68 100644
--- a/tests/overlay.c
+++ b/tests/overlay.c
@@ -203,6 +203,7 @@ int main(int argc, char *argv[])
 	fdt_overlay = open_dt(argv[2]);
 
 	/* Apply the overlay */
+	CHECK(fdt_overlay_prepare(fdt_base, fdt_overlay));
 	CHECK(fdt_overlay_apply(fdt_base, fdt_overlay));
 
 	fdt_overlay_change_int_property(fdt_base);
diff --git a/tests/overlay_bad_fixup.c b/tests/overlay_bad_fixup.c
index 029bc7982d328b0dd538dd30f066ae414b989232..2f7471a60d926a959ac5dfb66ef02712259e1a4d 100644
--- a/tests/overlay_bad_fixup.c
+++ b/tests/overlay_bad_fixup.c
@@ -51,7 +51,7 @@ int main(int argc, char *argv[])
 	fdt_overlay = open_dt(argv[2]);
 
 	/* Apply the overlay */
-	CHECK(fdt_overlay_apply(fdt_base, fdt_overlay), -FDT_ERR_BADOVERLAY);
+	CHECK(fdt_overlay_prepare(fdt_base, fdt_overlay), -FDT_ERR_BADOVERLAY);
 
 	PASS();
 }

-- 
2.47.0

