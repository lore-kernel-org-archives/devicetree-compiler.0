Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCADE3C3443;
	Wed, 26 Aug 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737888; cv=none; b=DmE/NPVmGkbyLYxIOlblTyyqSvf7+ID65zAi7d5zKYmCGCJZjamr9FY87+dB5H4VnoDJyYN2RiTlujzQ2GTJTr8GCz+qwllS1abTSfhvCzS9J107li8NPS/rkAwBeFo5/eRAdkWnXIrp4som660STIdpJ+jX/xBF7l8YQRwg62Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737888; c=relaxed/simple;
	bh=jDRrStbxDEF27i9PKcMF71vSb8ERx1X9Tef6+60YxhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q99fMzivw+56a7TO8MSCvuIJ5ak7ih3o0EjcsNnhgx9ZnaAEkk+32ZpzscdUqj+8pVWcRLf6ChpRvAvaCA8tj+CKFx9BG7MFvBNwBz8zbVWwdAsmGZ9EyLg75rG7qXJlc7i3bToY1XEnKQu9r+AgclW5Orb3nkt9A7Aa9JPR3Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XRECA1N5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XRECA1N5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 66E4E1A183A;
	Wed, 26 Aug 2026 09:51:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 350C2604EC;
	Wed, 26 Aug 2026 09:51:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B51C11C7AD64;
	Wed, 26 Aug 2026 11:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737880; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pJc3+Rr2qTZdW2JMtEFzukfNaw+Z+ZB2P/aYqtOrOyc=;
	b=XRECA1N5vfxYBumdHwdv4nOvKiucstVarFuhNX+SjE0W3HX5s0ccSsynfj8/GY8QDn6vU8
	QC2SKQvhRSznEiDLE1BUbwCSSW8y3pICqgplpdWH3Cw5Io4pLvASRgdyPSKeXR1ua8neEo
	vCl4RqucTzsYBJb6rAJHqk16C6klIuT4hL1Uzi3kc28EbxhaL6THbMTMlTNym8M6Yh0cI2
	mGOsQbZap5q0sal+8oYRDe6X6McQlBFdgzaBVvFy7mgqwfI9uSzUtg5j6+nkTNB0rRi6k2
	N8IY2caaB4jzQdnqiBEyzlUcNw56lnba5br7GCMopLWAK+BLZJSvi+U0kiSdJQ==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH v2 14/74] tests: Add a test related to addon dt_flags header value
Date: Wed, 26 Aug 2026 11:48:43 +0200
Message-ID: <20260826094950.1088288-15-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826094950.1088288-1-herve.codina@bootlin.com>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Addon dtbs leads to the dt_flags header field set to FDT_FLAG_ADDON
(0x1).

Add a specific test to check this value.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/dtflags_addon.dtb.expect |  1 +
 tests/dtflags_addon.dts        | 11 +++++++++++
 tests/run_tests.sh             |  8 ++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 tests/dtflags_addon.dtb.expect
 create mode 100644 tests/dtflags_addon.dts

diff --git a/tests/dtflags_addon.dtb.expect b/tests/dtflags_addon.dtb.expect
new file mode 100644
index 00000000..00f98f32
--- /dev/null
+++ b/tests/dtflags_addon.dtb.expect
@@ -0,0 +1 @@
+// dt_flags:		0x1
diff --git a/tests/dtflags_addon.dts b/tests/dtflags_addon.dts
new file mode 100644
index 00000000..d2b22951
--- /dev/null
+++ b/tests/dtflags_addon.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/ {
+	prop = <1>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f5ea02bf..734fd39a 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -926,6 +926,14 @@ dtc_tests () {
     sed -i '/dt_flags/!d' dtflags_default.dtb.out
     base_run_test check_diff dtflags_default.dtb.out "$SRCDIR/dtflags_default.dtb.expect"
     run_test check_full dtflags_default.dtb
+
+    # Tests dt_flags header field (FDT_FLAG_ADDON value)
+    run_dtc_test -I dts -O dtb -o dtflags_addon.dtb "$SRCDIR/dtflags_addon.dts"
+    base_run_test wrap_fdtdump dtflags_addon.dtb dtflags_addon.dtb.out
+    # Keep only lines containing 'dt_flags'
+    sed -i '/dt_flags/!d' dtflags_addon.dtb.out
+    base_run_test check_diff dtflags_addon.dtb.out "$SRCDIR/dtflags_addon.dtb.expect"
+    run_test check_full dtflags_addon.dtb
 }
 
 cmp_tests () {
-- 
2.55.0

