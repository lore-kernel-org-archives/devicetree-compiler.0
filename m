Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D444052B5
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738008; cv=none; b=TIrvThQKSJqAoSIlnk2dmWTk+wEm/qonvBTsUhG6ZaQXqLgDAF/JMnOjGZyL1FYFo//MNtAMqlaGJ5tJK/eRUaIDWe6TAKAABaOOvkhuou/l+POaWrJhXcTBMmbGETq/2wbbc6Us4VLLF58+vuO0cBsyCGN3an9xQWsAztwJWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738008; c=relaxed/simple;
	bh=vRe5xJ2l7bgudHv+BdCPB4/Y2ACKzfLof/3o2r8LdTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3BVOsLJHLmzxncTAymA4AfYI3fhY0XzRxzBGUPsQL619UP7J0+tZZUseDFeIxGurDjJUz1s7myx7B6tcEt8l+K/21xGW6hmdKIiMzY7MZrGcrLGKipKsd5RV3hDTbtS7Bc8vs2OTAwOcJUNAnNCRibNe/KtrfZxvmCtm06Urc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s6ppfEfy; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s6ppfEfy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9805A1A183A;
	Wed, 26 Aug 2026 09:53:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AC3D604EC;
	Wed, 26 Aug 2026 09:53:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78E5F11C7ACD5;
	Wed, 26 Aug 2026 11:53:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738004; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sWS7zG+BLM4bEXwEI94Po9jYsGy+vM3v6+qapohqfDQ=;
	b=s6ppfEfyBwmiYh9cfQnkk7Pk/OqjPoQV+FTLY4wJVp4KAJ88EGOcV5mcGqtZbp7peM5vUz
	PAq077/a/Hr0o3f0HyQlXogaXW2HwXvZfUemMyduAdJH9bMN2qtxsET6BpkYUUThjBW2iz
	jPaBcHfx7A8p4V37jUrL/4/YU2vuzs0OV/Ok8C+m+znvbVOA33uhQ3RzdWxj2l11kKBUcl
	TG+eaSz+sf768K5vtAet6C3BfvmXcz+2g/F/pEoXidfw7TXu+yS3lEzvf+9Wv8ou6u28ch
	V8718W41Ch8XLjSwA/4VBN6/5hnu8VfqlDz2e7x+WW0W2IDtHeL3Fnn2OqUK/g==
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
Subject: [RFC PATCH v2 54/74] tests: metadata: Add a test for addon without root node
Date: Wed, 26 Aug 2026 11:49:23 +0200
Message-ID: <20260826094950.1088288-55-herve.codina@bootlin.com>
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

The root device-tree node is no more mandatory for addons.

Indeed, addons can be composed of only orphan nodes without any needs
for the root device-tree node presence.

Add a test related to addon dts and dtb without root node.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_addon_orphan2.dtb.dts.expect | 10 ++++++++++
 tests/metadata_addon_orphan2.dtb.expect     |  8 ++++++++
 tests/metadata_addon_orphan2.dts            | 13 +++++++++++++
 tests/metadata_addon_orphan2.dts.dts.expect | 10 ++++++++++
 tests/run_tests.sh                          |  2 +-
 5 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_orphan2.dtb.dts.expect
 create mode 100644 tests/metadata_addon_orphan2.dtb.expect
 create mode 100644 tests/metadata_addon_orphan2.dts
 create mode 100644 tests/metadata_addon_orphan2.dts.dts.expect

diff --git a/tests/metadata_addon_orphan2.dtb.dts.expect b/tests/metadata_addon_orphan2.dtb.dts.expect
new file mode 100644
index 00000000..32c1b1ed
--- /dev/null
+++ b/tests/metadata_addon_orphan2.dtb.dts.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+
+&base {
+
+	addon-node {
+		prop = <0x02>;
+	};
+};
diff --git a/tests/metadata_addon_orphan2.dtb.expect b/tests/metadata_addon_orphan2.dtb.expect
new file mode 100644
index 00000000..46e67d06
--- /dev/null
+++ b/tests/metadata_addon_orphan2.dtb.expect
@@ -0,0 +1,8 @@
+/dts-v1/;
+/addon/;
+
+&base {
+    addon-node {
+        prop = <0x00000002>;
+    };
+};
diff --git a/tests/metadata_addon_orphan2.dts b/tests/metadata_addon_orphan2.dts
new file mode 100644
index 00000000..d4ff42f7
--- /dev/null
+++ b/tests/metadata_addon_orphan2.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+&base {
+	addon-node {
+		prop = <2>;
+	};
+};
diff --git a/tests/metadata_addon_orphan2.dts.dts.expect b/tests/metadata_addon_orphan2.dts.dts.expect
new file mode 100644
index 00000000..32c1b1ed
--- /dev/null
+++ b/tests/metadata_addon_orphan2.dts.dts.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+
+&base {
+
+	addon-node {
+		prop = <0x02>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0ce60c3f..e099bd39 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1251,7 +1251,7 @@ metadata_tests() {
 	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref \
 		  metadata_addon_base metadata_exportsyms_local \
 		  metadata_exportsyms_ref metadata_importsyms \
-		  metadata_addon_orphan1; do
+		  metadata_addon_orphan1 metadata_addon_orphan2; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.55.0

