Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE6A3C343A
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737920; cv=none; b=jBuPVytuzV2PCsZI5I1pbBRFz0EUL2dPcMph0b3gF5a48tEbvs/cMcym+CPZP+jskcd0a1IxLQOggZ5iLFjXT2J/nPZsjr93/JnsavaxcWgM9QAZZ08cMNLh0ri1gcUsGUxOzpbMAMp5flH9+pCx5EuB5depaGR34oaI4MvgqUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737920; c=relaxed/simple;
	bh=0UJ91EliIHMrYmF6hhnt+CR23FgAXC9L3OYxpWwaYU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4z9mbcpMrQ7jlQiybn5HiDwHRG/wX/Cc0RV4YD0j1xP1uhgSC8GeBJWcdj7zx6e4QDKzGZF3+Anu7BEj59ORq1p82jV3LrCGndfSdP1uW1Hwy9TF7mr+qVg+o+9haMx/29eE4JaS6Ay5L5U7Q3WS8WxYf3oHRozwgTkeMs8YIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kdFX+1/L; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kdFX+1/L"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 783231A183E;
	Wed, 26 Aug 2026 09:51:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46B7E604EC;
	Wed, 26 Aug 2026 09:51:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0245E11C7AD52;
	Wed, 26 Aug 2026 11:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737916; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6fo5UaPE2VW1KtAYDqr1xUO0NzeMzLyeMMLT0paCN+o=;
	b=kdFX+1/L5MLwtGly5MOzRNfitoGdgROL/DeXKaI+OBWiy5zXPXwbi7bfOh/oGR71e9ncmg
	6bCulE0E3W0qdf+eY84DfgLtW8H9TIEPKUSexKBdKftyiQi7NKtDPLYlfp1Ndpfd64ixif
	x1codX24Z8rm2TkJYqpkA2q+B1O0TfG5O8lsni0u5luU3A1vH/59BuyBTppJDlErcgZnOK
	KFCzSoA3t3gHiLP9rGsfFsZZTO5yr+m6XyB29HDLoOn4wL5zRc+JVjxfhfbdcCm7veuC4j
	mx3efWAqNhrprhEc6ddPrjcH13ICCVYeO5197XDBv3HOIHVsmhgCf0LUcs6Xbw==
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
Subject: [RFC PATCH v2 26/74] tests: metadata: Add export symbols with external references tests
Date: Wed, 26 Aug 2026 11:48:55 +0200
Message-ID: <20260826094950.1088288-27-herve.codina@bootlin.com>
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

Add tests related to export symbols using external references
(FDT_EXPORT_SYM_REF dtb tag).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_exportsyms_ref.dtb.dts.expect | 25 +++++++++++++++++++
 tests/metadata_exportsyms_ref.dtb.expect     | 18 ++++++++++++++
 tests/metadata_exportsyms_ref.dts            | 26 ++++++++++++++++++++
 tests/metadata_exportsyms_ref.dts.dts.expect | 25 +++++++++++++++++++
 tests/run_tests.sh                           |  3 ++-
 5 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_exportsyms_ref.dtb.dts.expect
 create mode 100644 tests/metadata_exportsyms_ref.dtb.expect
 create mode 100644 tests/metadata_exportsyms_ref.dts
 create mode 100644 tests/metadata_exportsyms_ref.dts.dts.expect

diff --git a/tests/metadata_exportsyms_ref.dtb.dts.expect b/tests/metadata_exportsyms_ref.dtb.dts.expect
new file mode 100644
index 00000000..d2c33203
--- /dev/null
+++ b/tests/metadata_exportsyms_ref.dtb.dts.expect
@@ -0,0 +1,25 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+	};
+
+	node-b {
+	};
+
+	node-c {
+
+		sub-node {
+
+			/export/ ref_base_node_a: &base_node_a;
+			/export/ ref_base_node_b: &base_node_b;
+		};
+	};
+
+	node-d {
+
+		/export/ ref_base_node_c: &base_node_c;
+	};
+};
diff --git a/tests/metadata_exportsyms_ref.dtb.expect b/tests/metadata_exportsyms_ref.dtb.expect
new file mode 100644
index 00000000..395861bc
--- /dev/null
+++ b/tests/metadata_exportsyms_ref.dtb.expect
@@ -0,0 +1,18 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    node-a {
+    };
+    node-b {
+    };
+    node-c {
+        sub-node {
+            // [FDT_EXPORT_SYM_REF] 'ref_base_node_a' -> 'base_node_a'
+            // [FDT_EXPORT_SYM_REF] 'ref_base_node_b' -> 'base_node_b'
+        };
+    };
+    node-d {
+        // [FDT_EXPORT_SYM_REF] 'ref_base_node_c' -> 'base_node_c'
+    };
+};
diff --git a/tests/metadata_exportsyms_ref.dts b/tests/metadata_exportsyms_ref.dts
new file mode 100644
index 00000000..c094be1e
--- /dev/null
+++ b/tests/metadata_exportsyms_ref.dts
@@ -0,0 +1,26 @@
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
+	};
+
+	node-b {
+	};
+
+	node-c {
+		sub_node: sub-node {
+			/export/ ref_base_node_a: &base_node_a;
+			/export/ ref_base_node_b: &base_node_b;
+		};
+	};
+
+	node-d {
+		/export/ ref_base_node_c: &base_node_c;
+	};
+};
diff --git a/tests/metadata_exportsyms_ref.dts.dts.expect b/tests/metadata_exportsyms_ref.dts.dts.expect
new file mode 100644
index 00000000..2654df12
--- /dev/null
+++ b/tests/metadata_exportsyms_ref.dts.dts.expect
@@ -0,0 +1,25 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+	};
+
+	node-b {
+	};
+
+	node-c {
+
+		sub_node: sub-node {
+
+			/export/ ref_base_node_a: &base_node_a;
+			/export/ ref_base_node_b: &base_node_b;
+		};
+	};
+
+	node-d {
+
+		/export/ ref_base_node_c: &base_node_c;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0c5f2849..f61f3e91 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1249,7 +1249,8 @@ fdtoverlay_tests() {
 
 metadata_tests() {
 	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref \
-		  metadata_addon_base metadata_exportsyms_local; do
+		  metadata_addon_base metadata_exportsyms_local \
+		  metadata_exportsyms_ref; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.55.0

