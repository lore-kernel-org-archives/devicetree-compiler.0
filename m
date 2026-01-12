Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19582DAFAF;
	Mon, 12 Jan 2026 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227669; cv=none; b=O0OuTaFniherHqu7dN1nS6Sdm1ssXpjKxM+MUhX5og1a7vMuPKi1jVzfKYHQAKBx4qzybpWe18/Azq1Atvj++qOOn+1lQwtyqO+kxPWGZt1aJTmT9JG1T6lg951QklaveqWuQL98e0JTB3xw9EYnmiNvvcCTzDvyNcNivKCSgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227669; c=relaxed/simple;
	bh=mhfCVt5rt3GPtwxOIzuJdMwa4TeV6J9WyWsZPDpBhGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4yYhP55nHOX3nv1boI9ztKTjZ3deYgP9P7Mm5RNqwK5bBYTay1Mm24MFMM9/POpYXTvL3tMPMH21BGHt/2OzPkmr4zxDSoTYajFY2q+EaxAvaak0uB9s4pH/CwfQM9Yi5LauvokXJWiP446Un2Nmp9pPDPoEgrGlbpDa9wMaL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d8vZgF/+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d8vZgF/+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 934411A2806;
	Mon, 12 Jan 2026 14:21:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69973606FA;
	Mon, 12 Jan 2026 14:21:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DCD8103C9273;
	Mon, 12 Jan 2026 15:21:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227661; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SpFU+MiK+5/rjM23lkiUnkBAKVGmsCcgGfRucPp3BEs=;
	b=d8vZgF/+/XUSTBhtcMA1b2kwW/RaSqZ59WDsVdugxm25Y74KPJXThvsqI47CZ7CsklmRh/
	ClAkUATQ85gRNu5h0n7/HB8qNnU7kQwyxFxtxbGBAnItw9QNgSfjMJEDvUAPxJX/Qb2Qbi
	eA6FCPY0V+2sr3t8RiJUr9rAEVAxJCZ9iJm42s2PMbA7DnrVft4aew1BDxm+YkWc20MX7/
	7ajQ3jArovba3VLRZSYyIf/bxgeo9BWJ0CbguC446u7UgqbdlcMgWbruJWcCK/wl7cba4K
	r0RVWB+xjBAsyT1zviDIafNd2l+7P+03qrM4dBm7ygVdL7NcB9/JlXjNvpq6Fw==
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
Subject: [RFC PATCH 26/77] tests: metadata: Add export symbols with local references tests
Date: Mon, 12 Jan 2026 15:19:16 +0100
Message-ID: <20260112142009.1006236-27-herve.codina@bootlin.com>
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

Add tests related to export symbols using local phandle references
(FDT_EXPORT_SYM dtb tag).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../metadata_exportsyms_local.dtb.dts.expect  | 26 +++++++++++++++++
 tests/metadata_exportsyms_local.dtb.expect    | 20 +++++++++++++
 tests/metadata_exportsyms_local.dts           | 28 +++++++++++++++++++
 .../metadata_exportsyms_local.dts.dts.expect  | 26 +++++++++++++++++
 tests/run_tests.sh                            |  2 +-
 5 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_exportsyms_local.dtb.dts.expect
 create mode 100644 tests/metadata_exportsyms_local.dtb.expect
 create mode 100644 tests/metadata_exportsyms_local.dts
 create mode 100644 tests/metadata_exportsyms_local.dts.dts.expect

diff --git a/tests/metadata_exportsyms_local.dtb.dts.expect b/tests/metadata_exportsyms_local.dtb.dts.expect
new file mode 100644
index 0000000..ac3d5b3
--- /dev/null
+++ b/tests/metadata_exportsyms_local.dtb.dts.expect
@@ -0,0 +1,26 @@
+/dts-v1/;
+
+/ {
+
+	node-a {
+	};
+
+	node-b {
+		phandle = <0x03>;
+	};
+
+	node-c {
+
+		sub-node {
+			phandle = <0x02>;
+		};
+	};
+
+	node-d {
+		phandle = <0x01>;
+
+		/export/ node_d: &{/node-d};
+		/export/ subnode_c: &{/node-c/sub-node};
+		/export/ node_b: &{/node-b};
+	};
+};
diff --git a/tests/metadata_exportsyms_local.dtb.expect b/tests/metadata_exportsyms_local.dtb.expect
new file mode 100644
index 0000000..2002553
--- /dev/null
+++ b/tests/metadata_exportsyms_local.dtb.expect
@@ -0,0 +1,20 @@
+/dts-v1/;
+
+/ {
+    node-a {
+    };
+    node-b {
+        phandle = <0x00000003>;
+    };
+    node-c {
+        sub-node {
+            phandle = <0x00000002>;
+        };
+    };
+    node-d {
+        phandle = <0x00000001>;
+        // [FDT_EXPORT_SYM] 'node_d' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'subnode_c' -> phandle 0x00000002
+        // [FDT_EXPORT_SYM] 'node_b' -> phandle 0x00000003
+    };
+};
diff --git a/tests/metadata_exportsyms_local.dts b/tests/metadata_exportsyms_local.dts
new file mode 100644
index 0000000..10e6e47
--- /dev/null
+++ b/tests/metadata_exportsyms_local.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+
+/ {
+	node-a {
+	};
+
+	node_b: node-b {
+	};
+
+	node-c {
+		sub_node: sub-node {
+		};
+	};
+
+	node_d: node-d {
+		/export/ node_d: &node_d;
+		/export/ subnode_c: &sub_node;
+	};
+};
+
+&node_d {
+	/export/ node_b: &node_b;
+};
diff --git a/tests/metadata_exportsyms_local.dts.dts.expect b/tests/metadata_exportsyms_local.dts.dts.expect
new file mode 100644
index 0000000..4723e7e
--- /dev/null
+++ b/tests/metadata_exportsyms_local.dts.dts.expect
@@ -0,0 +1,26 @@
+/dts-v1/;
+
+/ {
+
+	node-a {
+	};
+
+	node_b: node-b {
+		phandle = <0x03>;
+	};
+
+	node-c {
+
+		sub_node: sub-node {
+			phandle = <0x02>;
+		};
+	};
+
+	node_d: node-d {
+		phandle = <0x01>;
+
+		/export/ node_d: &node_d;
+		/export/ subnode_c: &sub_node;
+		/export/ node_b: &node_b;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index def1a7e..ed3a240 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1126,7 +1126,7 @@ wrap_fdtdump () {
 
 metadata_tests() {
 	for dt in metadata_reflocal metadata_refphandle \
-		  metadata_addon_base; do
+		  metadata_addon_base metadata_exportsyms_local; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.52.0

