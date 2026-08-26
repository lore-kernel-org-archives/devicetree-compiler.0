Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E320E3D9043;
	Wed, 26 Aug 2026 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738003; cv=none; b=V/fICvMETfr5wuSBpkjfGU6ZAKlYBMl3SC+SuEi4Gofc8iyPxwhn2QTesPR2DnDZEesOoN9X87O2DLJomd+F+eDtwLGGMarjx3cL47IMMvLoxYnLXpsCnsCovTPKZwU5eeMSV7JiDdbgoI5jw0UWaJiri+BtdQ9uhq7O3sVi0EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738003; c=relaxed/simple;
	bh=1qxpugmBn/4endoHwz9EILu7vYVoe9JP5zyZyyPAgY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AR3mqLbXV7SMHuWAtw6snKfDSRaBxvl28Y5jrvjFMXobkZ0MMu1uA+SDSyBpEccVEVJ19ol7kwiCnDLD9eOyZr7b5izjFntQ1+UGbtjwW2FPlyxSBa+V9cJYz89Ql/ek6rVGglufzcF19iufoMA0WqbjR2DWzynM4O2N7vqpJfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QTk4yox1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QTk4yox1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9DD044E413BC;
	Wed, 26 Aug 2026 09:53:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69B40604EC;
	Wed, 26 Aug 2026 09:53:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D17E711C7AD35;
	Wed, 26 Aug 2026 11:53:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737999; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7lhAwsiGlrSZc63/UADNNN1tDiNHpRD6jgmTzIo6Opc=;
	b=QTk4yox16k3M289U4NcAHLOIS07ke4WBc598pxbDh0mEQELS7qysyJLdaALTGBKkDu+QtC
	5ZS/jFfN+GXw+yaWFDIDm1+TKl7aSXY2M3uOm8BfYBRT2TfzJwGf4uAuaH7TjHcME+OdT9
	72iip/LQ5pRcpyvA9VvBWd+8fR0YACaDYZYFjWQPVa2xRof+AdrxF0tN8DCXWX0XoJLsMr
	kXc0ajYjtznAyRb5ZG3DS8bc4jYFKM1bxW82r2s3turFE7UN7R6mjwPKASqVwLZf64w4s2
	OfdMvnpAvouSrnp3yngSZxPd715GwaA3WwvEA8/+cKxZX7rY8orHhe0UcrdwYg==
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
Subject: [RFC PATCH v2 52/74] tests: metadata: Add basic test for addon orphan nodes
Date: Wed, 26 Aug 2026 11:49:21 +0200
Message-ID: <20260826094950.1088288-53-herve.codina@bootlin.com>
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
index 00000000..c24a00f1
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
index 00000000..7058a2e0
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
index 00000000..f20d1791
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
index 00000000..c24a00f1
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
index 7c45835e..0ce60c3f 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1250,7 +1250,8 @@ fdtoverlay_tests() {
 metadata_tests() {
 	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref \
 		  metadata_addon_base metadata_exportsyms_local \
-		  metadata_exportsyms_ref metadata_importsyms; do
+		  metadata_exportsyms_ref metadata_importsyms \
+		  metadata_addon_orphan1; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.55.0

