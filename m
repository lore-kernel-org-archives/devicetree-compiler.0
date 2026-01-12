Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7444936A00F;
	Mon, 12 Jan 2026 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227718; cv=none; b=rWB0iIRLUsWbKQ7C6rRBVJxUWBaxNM0BOuKm+C96lnWgIqs/tSEc5DROw5M0XG8V3vth7XpKLlXjTlsIq71zbpUiEAG0QXmHs6uKkRph0w5vBkdYfP2Fie8YD6emw+MP9KclIA1MrVJLgO22TCn15/MfHMKZyGv6YAgFbbb5YSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227718; c=relaxed/simple;
	bh=C/i3bZYNU7hFPWeOIO4liAFOiYkaM6HH7t8B6P6dEYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OSee1VzTa+bl6LS02UR49gklU2h9fpZGyEDKMBvResOJBDQEhit8lHe1DBp09l629qVxBDZB5dwqSYwXaY/Wb7dI48588ab5sLLWJhlEYZLkz2T00AI35cUtHYt5XI/xeHWN2KloYeJ1mGwZy4ZcvHaT/ia80SXgag3JGNsa8AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=t9dD7tOu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="t9dD7tOu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57CF11A2810;
	Mon, 12 Jan 2026 14:21:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E27A606FA;
	Mon, 12 Jan 2026 14:21:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A880B103C8CD8;
	Mon, 12 Jan 2026 15:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227714; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lBi3nUNq8ZfOvMorW6kQYzmy743beEuX+jiuAg/FG5k=;
	b=t9dD7tOu0e3cwKdWn+E10MgvT5EDWUfCOi6AjUZDPglZxqaQJHkyIKmDnTgfK++TkvYA5T
	Pd0lV0B0g2iFkV+DFwMKpXsSjnqAi1kVOnmsa1Xdon0QUvINYrmQfwpcjpBikoeb1gb/aE
	vfLxAgJeDOZ9mcd29sCT90RB+Jhoqjik2xvd3S7CQgLQyMvu0a/JHkTQQLwcl7XIh4Lfgo
	QpZdFzi/feFuE+8aIK8NldrFMInEKvvWLZUUYEKR8tuVdP6TpZB3pQ3PTWsQQLRPo74+n8
	0VItYbOwEI9O6f4XcEUNrSfsG0XluKGHffX5VIddP8jWJpjqL4QSQgtfF4JEaQ==
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
Subject: [RFC PATCH 61/77] tests: metadata: Add a test related to orphan node merging
Date: Mon, 12 Jan 2026 15:19:51 +0100
Message-ID: <20260112142009.1006236-62-herve.codina@bootlin.com>
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

Merging orphan node is supported.

Add a test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_addon_orphan3.dtb.dts.expect | 22 ++++++++++++++++
 tests/metadata_addon_orphan3.dtb.expect     | 17 +++++++++++++
 tests/metadata_addon_orphan3.dts            | 28 +++++++++++++++++++++
 tests/metadata_addon_orphan3.dts.dts.expect | 22 ++++++++++++++++
 tests/run_tests.sh                          |  3 ++-
 5 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_orphan3.dtb.dts.expect
 create mode 100644 tests/metadata_addon_orphan3.dtb.expect
 create mode 100644 tests/metadata_addon_orphan3.dts
 create mode 100644 tests/metadata_addon_orphan3.dts.dts.expect

diff --git a/tests/metadata_addon_orphan3.dtb.dts.expect b/tests/metadata_addon_orphan3.dtb.dts.expect
new file mode 100644
index 0000000..2605e1b
--- /dev/null
+++ b/tests/metadata_addon_orphan3.dtb.dts.expect
@@ -0,0 +1,22 @@
+/dts-v1/;
+/addon/;
+
+
+&base1 {
+
+	addon-node1 {
+		prop1 = <0x01>;
+		prop2 = <0x02>;
+	};
+
+	addon-node2 {
+		prop3 = <0x03>;
+	};
+};
+
+&base2 {
+
+	addon-node {
+		prop = <0x00>;
+	};
+};
diff --git a/tests/metadata_addon_orphan3.dtb.expect b/tests/metadata_addon_orphan3.dtb.expect
new file mode 100644
index 0000000..5a65483
--- /dev/null
+++ b/tests/metadata_addon_orphan3.dtb.expect
@@ -0,0 +1,17 @@
+/dts-v1/;
+/addon/;
+
+&base1 {
+    addon-node1 {
+        prop1 = <0x00000001>;
+        prop2 = <0x00000002>;
+    };
+    addon-node2 {
+        prop3 = <0x00000003>;
+    };
+};
+&base2 {
+    addon-node {
+        prop = <0x00000000>;
+    };
+};
diff --git a/tests/metadata_addon_orphan3.dts b/tests/metadata_addon_orphan3.dts
new file mode 100644
index 0000000..0fe52ec
--- /dev/null
+++ b/tests/metadata_addon_orphan3.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+&base1 {
+	addon-node1 {
+		prop1 = <1>;
+	};
+};
+
+&base2 {
+	addon-node {
+		prop = <0>;
+	};
+};
+
+&base1 {
+	addon-node1 {
+		prop2 = <2>;
+	};
+	addon-node2 {
+		prop3 = <3>;
+	};
+};
diff --git a/tests/metadata_addon_orphan3.dts.dts.expect b/tests/metadata_addon_orphan3.dts.dts.expect
new file mode 100644
index 0000000..2605e1b
--- /dev/null
+++ b/tests/metadata_addon_orphan3.dts.dts.expect
@@ -0,0 +1,22 @@
+/dts-v1/;
+/addon/;
+
+
+&base1 {
+
+	addon-node1 {
+		prop1 = <0x01>;
+		prop2 = <0x02>;
+	};
+
+	addon-node2 {
+		prop3 = <0x03>;
+	};
+};
+
+&base2 {
+
+	addon-node {
+		prop = <0x00>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5edc58b..12418bf 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1128,7 +1128,8 @@ metadata_tests() {
 	for dt in metadata_reflocal metadata_refphandle \
 		  metadata_addon_base metadata_exportsyms_local \
 		  metadata_exportsyms_ref metadata_importsyms \
-		  metadata_addon_orphan1 metadata_addon_orphan2; do
+		  metadata_addon_orphan1 metadata_addon_orphan2 \
+		  metadata_addon_orphan3; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.52.0

