Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D4B15F3FB
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Jun 2024 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719388573; cv=none; b=XdUurw4H9Ivj7Vo42MXswEjZByjXvmDsfG7fqE5bzSYH2kMC688X3FV2YFSxfQ5yR0ZfdlTjCvDzOLyVYZPQPzbK69PHh0iPRxBUtsgJcDV/FRK3Ud4hfNFcQd8o67hf6k1AYCJoqSNG2OmGgc2NctunBUTdEeybxBSBlDMGau4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719388573; c=relaxed/simple;
	bh=pJB3eIs/1Ehv1iB2oXxlbyJtz6SfKIWm1EQlAxeVHgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oXQhVf7jhsYOjZwpS14vZeAK3v5hRhqxx591CKzhIbbxwBR5vKOHBsn7jzn6IgD6cYB+ad37FiTYsemL+PeMQWBnnmxFNWL+R6u4dwcs7HxiUQ1ndPCPzgT08jeClyHomEJfbryIe0uOkyWb12tr9YfjoJwtLnMaMyEJrnDd5rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZocE3/NJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZocE3/NJ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00b97so6422681a12.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 26 Jun 2024 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719388568; x=1719993368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=deBUlUmH83r74GGtUWtNA3I5zHjNGAvZ6Ce0ERGouGs=;
        b=ZocE3/NJ34j4kfIJmSIfKQmtSW913RxjCBE0AuitkLlTkCda3PwTvwRcYkY0Y5Uhzo
         BhdbJ3B2of6mEiNGbBNMoC5PzcLNXLucQh7trXTTc/c4/WBW5B9acYUZzWEv88KbVQvB
         6zWizcPPWdeMQrr/xFDLYcSU/VSXiCmVju/TyvZquARwvBt7X4IpMnnIkAPNVjFqFpns
         jR8dqKY52ihdmhuiujZZWINnXCdlYyOncqeFjg9wOwZdkUaLKPHPvIy+k0mYtwYkNEqG
         sntI5XHLmFPimygWwHI+OkTaAeXkkFkgZo0lyIEwyL+JD2AyAmy4RLCcD5sqwke5mpoy
         XckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388568; x=1719993368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deBUlUmH83r74GGtUWtNA3I5zHjNGAvZ6Ce0ERGouGs=;
        b=ndQZPKXdAZL4ZdQjKrTMXFqvfMeBDvzaWqk5OQ4kuixYmVpVtRkYRHrAVhCMLpVWqG
         +EHJXKOEYNNiDi7eDI1hKlMBsjMqFf7j3UKnOeZCfsqhn97FQ5jbhhTzg/OzaBfzAn2b
         qV46KItr83FL5TceZsFRTrTLyFGad8hYr4+DTdQfmgI5NLlDkKbTedhhlPWjAFJd7Bkx
         9SNYqGgh7PBwd5qPsGSaVvmJ1edWJIryaBg31yJbEguGP1wzdQBb799i1l0gerYBNg26
         2cnzDSKeEU0/aPPwhII3bvo2NYm1p0AJtQ4G+bDiN+xPEuPIK8Q4+yztSDD94B0an+bn
         qHJg==
X-Gm-Message-State: AOJu0Yw9xRlD4H8xB/K6H413nmWf5wRZ2qsjJjQrsZED4ISXLNqUQzsb
	Ua+OWlwH1Sw0ZgkVBUukq3IgOXoLVYQNdz3lw0Ws3BLWd2cDIS7/OzEwu02Cd8/kVY4Ul28pnxJ
	iSzg=
X-Google-Smtp-Source: AGHT+IGJAr7HZMyq4bbgf24V7CsYbL9bnjoWvP1wf+7EhFiCSO+fQBK77B0qwmLwnzOlaMxqFlk3EA==
X-Received: by 2002:a50:c04f:0:b0:57d:3791:e8e4 with SMTP id 4fb4d7f45d1cf-57d4bdcad8dmr6524709a12.32.1719388567855;
        Wed, 26 Jun 2024 00:56:07 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da25fsm6905235a12.5.2024.06.26.00.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 00:56:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"Saravana Kannan" <saravanak@google.com>,
	devicetree@vger.kernel.org
Subject: [PATCH] libfdt: overlay: Fix phandle overwrite check for new subtrees
Date: Wed, 26 Jun 2024 09:55:52 +0200
Message-ID: <20240626075551.2493048-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2511; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=pJB3eIs/1Ehv1iB2oXxlbyJtz6SfKIWm1EQlAxeVHgs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBme8mHS8+t3/VP91dfX2+MkgyZdMGPWQanRmK63 /d7MVt5ZkSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnvJhwAKCRCPgPtYfRL+ Tuf5B/4+S60h0S4OkJF8XdvPDsMzIBv5kyP2gVVe4Q1khndbxw1Kp9iS6fM7YSbzpdfp8YF1zei tam8BpZ9CpAdrjOfyuOD2Ar8zvedcQxg+EE2Abgl0jVj6/k4xL+pY66zcTSyjbP0cAVcLCJ9K7K ByWXu2vxfqDMbPTELk89RPTzRZiWPJbfLvpQWDuua8+q4ucyM/Qocwsl6PVKHLnQ7vdhDGkdOPZ OEm50S8KNK1MybB83D4z8EXZxAxAlRFAc4ayP9pYdGdVSB56RZZrzk8KmMq2hVxiF2ZWkuu61vL Ow0EDGbIMZft+rEh6XI6dqXFPa/FS8+ZIyMnLaKUb+JpcsH8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

If the overlay's target is only created in a previous fragment, it
doesn't exist in the unmodified base device tree. For the phandle
overwrite check this can be ignored because in this case the base tree
doesn't contain a phandle that could be overwritten.

Adapt the corresponding check to not error out if that happens but just
continue with the next fragment.

This is currently triggered by
arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso in the kernel
repository which creates /panel in its first fragment and modifies it in
its second.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/all/CAL_JsqL9MPycDjqQfPNAuGfC6EMrdzUivr+fuOS7YgU3biGd4A@mail.gmail.com/
Fixes: 1fad065080e6 ("libfdt: overlay: ensure that existing phandles are not overwritten")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 libfdt/fdt_overlay.c                | 8 +++++++-
 tests/overlay_overlay_bypath.dts    | 4 ++++
 tests/overlay_overlay_no_fixups.dts | 8 ++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index e19506fb56a5..28b667ffc490 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -729,7 +729,13 @@ static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
 			return overlay;
 
 		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
-		if (target < 0)
+		if (target == -FDT_ERR_NOTFOUND)
+			/*
+			 * The subtree doesn't exist in the base, so nothing
+			 * will be overwritten.
+			 */
+			continue;
+		else if (target < 0)
 			return target;
 
 		ret = overlay_prevent_phandle_overwrite_node(fdt, target,
diff --git a/tests/overlay_overlay_bypath.dts b/tests/overlay_overlay_bypath.dts
index f23e7b6035e2..dfcb7cdb25a4 100644
--- a/tests/overlay_overlay_bypath.dts
+++ b/tests/overlay_overlay_bypath.dts
@@ -46,3 +46,7 @@
 		new-sub-test-property;
 	};
 };
+
+&{/new-local-node} {
+	another-new-property;
+};
diff --git a/tests/overlay_overlay_no_fixups.dts b/tests/overlay_overlay_no_fixups.dts
index e8d0f96d889c..1dbdcdc2b40f 100644
--- a/tests/overlay_overlay_no_fixups.dts
+++ b/tests/overlay_overlay_no_fixups.dts
@@ -72,6 +72,14 @@
 		};
 	};
 
+	fragment@7 {
+		target-path = "/new-local-node";
+
+		__overlay__ {
+			another-new-property;
+		};
+	};
+
 	__local_fixups__ {
 		fragment@5 {
 			__overlay__ {

base-commit: ff4f17eb58650784ffb2e8a8fbefebce1038f80b
-- 
2.43.0

