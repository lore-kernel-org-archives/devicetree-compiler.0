Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB502E36F3
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227650; cv=none; b=MMYwWciZwvvh1Y2/jIhop6ChoymiF8UqtEoFDv8J2h2f4Lfd6VzsBXbAxctR4+jCFZyRqPI32zeZ+LA6xo4H+ov2XdtIp07BvRhAHFb2xeAGh/3OK15QJBxMW7Zd3b4GYcYiEFYXgIfqL0QgpgfBzHWy736fjxK6xiREnIkrDnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227650; c=relaxed/simple;
	bh=YO3kQz2fR8DAC3SdoniBXXwcSaVv9biWxGqGAHPUv88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEnu1dVUk/khOFbG1MCq+KnxdwX01sLXrQjHQQFoZR9WWwkHHrdF2mwU1xfPsj3+Syd2fmkKK7MAuKU6pfwEh684C3gM9lfBcsbyNJwJAjiRIr4Neji6/CzX+9grk+cuoE0Ad1RmacUt41cEsz1clO2gUq6mxHP2VO0zf/YfvKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D6wtx5al; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D6wtx5al"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CC5734E42091;
	Mon, 12 Jan 2026 14:20:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A252A606FA;
	Mon, 12 Jan 2026 14:20:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B28B7103C9269;
	Mon, 12 Jan 2026 15:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227645; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vovB9PJwe7q82dhVvrskUXYb/fGDuEJF62Jmd31jrl0=;
	b=D6wtx5alwH/bc4Z2IFvnSyvqi9HVyHD6Cr1DvkW8rv+qAcJj275g+fvH0Z5/ySQ9K+CQlb
	A+suecQV/dd/Mhjx6jNMyMSyFxuEnNOFP0gUfFbCX0Vuh29S9swI4nXxPuf+K7TzVWFxCE
	MU1Rux5ktyBkbSVytj8lXsIdsZwpYM2eqDdyqa6xTrvBQJMfxXBRjr9AeoQMv+1O/Ft4rh
	d/iZvHXjflZCvar3fO35LnPoLboAA9y4nfquOUsyo3WAbxzRTTaIOD++1rPYUnGD1ohUs0
	4uodWgQ7FO4DzByjHhXALEY0upiJZz8OtL8oN7M3qneybJYXAwzNznUa3VIWnw==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
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
Subject: [RFC PATCH 16/77] tests: metadata: Add a test related to addon dt_flags header value
Date: Mon, 12 Jan 2026 15:19:06 +0100
Message-ID: <20260112142009.1006236-17-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
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
 tests/metadata_dtflags1.dtb.expect |  1 +
 tests/metadata_dtflags1.dts        | 11 +++++++++++
 tests/run_tests.sh                 |  6 ++++++
 3 files changed, 18 insertions(+)
 create mode 100644 tests/metadata_dtflags1.dtb.expect
 create mode 100644 tests/metadata_dtflags1.dts

diff --git a/tests/metadata_dtflags1.dtb.expect b/tests/metadata_dtflags1.dtb.expect
new file mode 100644
index 0000000..00f98f3
--- /dev/null
+++ b/tests/metadata_dtflags1.dtb.expect
@@ -0,0 +1 @@
+// dt_flags:		0x1
diff --git a/tests/metadata_dtflags1.dts b/tests/metadata_dtflags1.dts
new file mode 100644
index 0000000..d2b2295
--- /dev/null
+++ b/tests/metadata_dtflags1.dts
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
index 496fcb9..688d81d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1147,6 +1147,12 @@ metadata_tests() {
 	# Keep only lines containing 'dt_flags'
 	sed -i '/dt_flags/!d' metadata_dtflags0.dtb.out
 	base_run_test check_diff metadata_dtflags0.dtb.out "$SRCDIR/metadata_dtflags0.dtb.expect"
+
+	run_dtc_test -I dts -O dtb -o metadata_dtflags1.dtb "$SRCDIR/metadata_dtflags1.dts"
+	base_run_test wrap_fdtdump metadata_dtflags1.dtb metadata_dtflags1.dtb.out
+	# Keep only lines containing 'dt_flags'
+	sed -i '/dt_flags/!d' metadata_dtflags1.dtb.out
+	base_run_test check_diff metadata_dtflags1.dtb.out "$SRCDIR/metadata_dtflags1.dtb.expect"
 }
 
 pylibfdt_tests () {
-- 
2.52.0

