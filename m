Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6621C32B10B;
	Wed, 26 Aug 2026 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737895; cv=none; b=TqRVazGzKraBeTvPD5+D5TzA2yste0tfjINQ7jeLy4P+DhvjsPL82zR3Iut96x4S89gwp88cNQOkD8JLbY9lQ4UPhKD5zHGnbbXUTPjOqcJnVkwDhUUtpd69AV12gu5D0YcTnkZXg3VuPmt6wvF0uoAFAJUYQQWxXC6hlykc4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737895; c=relaxed/simple;
	bh=dog13pytRgAm/nmQYDoTN2iPfbsX/zbQwUyECUfSkRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzvzRfQ+QbPDXG0lVVM1LT+GAxgP65qqf5QcddZ/gVqs70ax5BrTaMLD3s9cf+62LRbg9GWLKt09GOQDZ6xVlBjBzvjzsbZ8n6E6mRrfK9gSDURHv8A5T5yv8x8/XGS7PqSNvU6C0YBRvNcv+zxoLJtOL7KhkgYsSqcep09xsXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a+25KmOa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a+25KmOa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DDE4B1A183A;
	Wed, 26 Aug 2026 09:51:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B13CB604EC;
	Wed, 26 Aug 2026 09:51:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA6D411C7AD52;
	Wed, 26 Aug 2026 11:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737886; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=WDr+ip3jj8bkSnf7P4NMN3NaKedzM/la/t7iz3ZOnUA=;
	b=a+25KmOaTixpKEe9aVjGUkFooDVM3bilc+RX8eNRmI6R9JAduOdfbYl7M8guHRcBweaS9i
	wYGkBDhckSHo8q8/Wh+N29HMxRLGfagF+SlU5MVLGEeq6T/C9F6l9RxjqDzKBC0p0bgdOt
	UQfMY/Ws0z9DYBl+uVZwIGcjxNfuxFdd9AZGyCk5uG0RE3/pZxA+g4CyUH3a9OlTNxh3IU
	5ZQ1EANMZ4KEE67Ap52qQp9N8GPpcA1ZGLFQ/r/Q04Hgt4KIvwEOgDHXPqJPawn1hNOqQX
	1LT3L++NAJAEQBjmMKWv4dhjwP76uL9/o3g9/ljSrX5b05nXXSpzOwDa4Lqt3g==
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
Subject: [RFC PATCH v2 15/74] tests: metadata: Add a basic addon test
Date: Wed, 26 Aug 2026 11:48:44 +0200
Message-ID: <20260826094950.1088288-16-herve.codina@bootlin.com>
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

Support for addon dts (/addon/ keyword) and addon dtb (FDT_FLAG_ADDON
header flag) have been recently introduced.

Even if the FDT_FLAG_ADDON dtb flag itself has its own test already
available, add a basic addon test in the metadata 'dts->dts and
dts->dtb->dts' test patterns to check that addon dts/dtb are
handled correctly.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_addon_base.dtb.dts.expect | 10 ++++++++++
 tests/metadata_addon_base.dtb.expect     | 10 ++++++++++
 tests/metadata_addon_base.dts            | 14 ++++++++++++++
 tests/metadata_addon_base.dts.dts.expect | 10 ++++++++++
 tests/run_tests.sh                       |  3 ++-
 5 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_base.dtb.dts.expect
 create mode 100644 tests/metadata_addon_base.dtb.expect
 create mode 100644 tests/metadata_addon_base.dts
 create mode 100644 tests/metadata_addon_base.dts.dts.expect

diff --git a/tests/metadata_addon_base.dtb.dts.expect b/tests/metadata_addon_base.dtb.dts.expect
new file mode 100644
index 00000000..739f9db3
--- /dev/null
+++ b/tests/metadata_addon_base.dtb.dts.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+		prop = <0x01>;
+		ref-base = <&base>;
+	};
+};
diff --git a/tests/metadata_addon_base.dtb.expect b/tests/metadata_addon_base.dtb.expect
new file mode 100644
index 00000000..27378475
--- /dev/null
+++ b/tests/metadata_addon_base.dtb.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    node-a {
+        prop = <0x00000001>;
+        ref-base = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref-base[0], ref = base
+    };
+};
diff --git a/tests/metadata_addon_base.dts b/tests/metadata_addon_base.dts
new file mode 100644
index 00000000..5e29cef9
--- /dev/null
+++ b/tests/metadata_addon_base.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/ {
+	node-a {
+		prop = <1>;
+		ref-base = <&base>;
+	};
+};
diff --git a/tests/metadata_addon_base.dts.dts.expect b/tests/metadata_addon_base.dts.dts.expect
new file mode 100644
index 00000000..739f9db3
--- /dev/null
+++ b/tests/metadata_addon_base.dts.dts.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+		prop = <0x01>;
+		ref-base = <&base>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 734fd39a..f119acc0 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1248,7 +1248,8 @@ fdtoverlay_tests() {
 }
 
 metadata_tests() {
-	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref; do
+	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref \
+		  metadata_addon_base; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.55.0

