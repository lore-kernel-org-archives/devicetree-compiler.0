Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146FD369217;
	Mon, 12 Jan 2026 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227711; cv=none; b=jm67Fg9SK7lOdf+YjlgwNNx/U5RwxD1uHSjqi0MXsuz3HuQofaHeFd7pOkr/q0TN671VogwLjT8elXzEJQ6MbzsYhxcCz+iDsy/ea+1VG1W6uk3swMpt3wELwlA+sqypdLfMuWF1iD188pKHfH6wc+DLrP8D5YEBXSl5eJhx1C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227711; c=relaxed/simple;
	bh=33CQC7Szuv6vQuD6MYd8I6qLlyhra2an6beTaS4rIdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbO5pPyuM9dkYxobu7pz+ctF1E1yYCfKLxTTw/ZbCERR0mJfcJyL/De7GAL7Z4UX9JSSoqnaNfZi/jylSGqFmeJd9LZih2t6LktwNr0Yb9OMu66RqcWW123nyYdWK62682O7xZT6igRYDyz6tBq9pJiPC+ywO33KCILqgEx7QrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ezbG/TrZ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ezbG/TrZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C74914E4209B;
	Mon, 12 Jan 2026 14:21:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D684606FA;
	Mon, 12 Jan 2026 14:21:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4980A103C9263;
	Mon, 12 Jan 2026 15:21:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227707; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mHHeMqCiMsa26df8ovlDZ1daSTZXRPr5pWsCtMQc3Tc=;
	b=ezbG/TrZhwV0hPA+c4Dp40+1cDfzL/Vs2lIvQ2ablplCHiVyPrJwPup4JQJKs6hILzTf0N
	4uneonI7EyXrmrJF3lxr2h2lEmj3M1XFekxMzmNibbnMdfp3OdCxzUdQSrSBKy30Aq4VfV
	BWvkRV7kaE2iUZMiVXSfmsP6EQTpkrw2gczvnvqj70SoumgS1TsHAWXiJZEl3X6sGwzjxj
	AQCHyJpPoCKMQsBW47c1NH6vl0BK6ufKfyZEr7PFO7vA2K9gkC/bxmym6Dyp1jT7RaWKM0
	Plvp5AlUnSTEQeQY8J/FNThxydSZ+AMfxEdlONPmIJpQ48YHWBlDx7jfBBaWZw==
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
Subject: [RFC PATCH 57/77] tests: metadata: Add basic test for addon orphan nodes
Date: Mon, 12 Jan 2026 15:19:47 +0100
Message-ID: <20260112142009.1006236-58-herve.codina@bootlin.com>
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

Add tests related to addon orphan nodes (FDT_BEGIN_NODE_REF dtb tag).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_addon_orphan1.dtb.dts.expect | 16 ++++++++++++++++
 tests/metadata_addon_orphan1.dtb.expect     | 13 +++++++++++++
 tests/metadata_addon_orphan1.dts            | 19 +++++++++++++++++++
 tests/metadata_addon_orphan1.dts.dts.expect | 16 ++++++++++++++++
 tests/run_tests.sh                          |  3 ++-
 5 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_orphan1.dtb.dts.expect
 create mode 100644 tests/metadata_addon_orphan1.dtb.expect
 create mode 100644 tests/metadata_addon_orphan1.dts
 create mode 100644 tests/metadata_addon_orphan1.dts.dts.expect

diff --git a/tests/metadata_addon_orphan1.dtb.dts.expect b/tests/metadata_addon_orphan1.dtb.dts.expect
new file mode 100644
index 0000000..c24a00f
--- /dev/null
+++ b/tests/metadata_addon_orphan1.dtb.dts.expect
@@ -0,0 +1,16 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+		prop = <0x01>;
+	};
+};
+
+&base {
+
+	addon-node {
+		prop = <0x02>;
+	};
+};
diff --git a/tests/metadata_addon_orphan1.dtb.expect b/tests/metadata_addon_orphan1.dtb.expect
new file mode 100644
index 0000000..7058a2e
--- /dev/null
+++ b/tests/metadata_addon_orphan1.dtb.expect
@@ -0,0 +1,13 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    node-a {
+        prop = <0x00000001>;
+    };
+};
+&base {
+    addon-node {
+        prop = <0x00000002>;
+    };
+};
diff --git a/tests/metadata_addon_orphan1.dts b/tests/metadata_addon_orphan1.dts
new file mode 100644
index 0000000..f20d179
--- /dev/null
+++ b/tests/metadata_addon_orphan1.dts
@@ -0,0 +1,19 @@
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
+	};
+};
+
+&base {
+	addon-node {
+		prop = <2>;
+	};
+};
diff --git a/tests/metadata_addon_orphan1.dts.dts.expect b/tests/metadata_addon_orphan1.dts.dts.expect
new file mode 100644
index 0000000..c24a00f
--- /dev/null
+++ b/tests/metadata_addon_orphan1.dts.dts.expect
@@ -0,0 +1,16 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+		prop = <0x01>;
+	};
+};
+
+&base {
+
+	addon-node {
+		prop = <0x02>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index a5e31df..659b42b 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1127,7 +1127,8 @@ wrap_fdtdump () {
 metadata_tests() {
 	for dt in metadata_reflocal metadata_refphandle \
 		  metadata_addon_base metadata_exportsyms_local \
-		  metadata_exportsyms_ref metadata_importsyms; do
+		  metadata_exportsyms_ref metadata_importsyms \
+		  metadata_addon_orphan1; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.52.0

