Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6814B36C0C0;
	Mon, 12 Jan 2026 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227737; cv=none; b=afWAQ2bgbb3Z3U2bWdhhz8F1hsQ41h1iJCK9N+ZBET9thultQlERBwSVZXWsJWDPx0RLfFlvPY1YuzcNMxHa5+QUSd2ZRdyf2hpb3cz50yIKRnwOsZu4MXAkzGADqCXwYwZMu7NxBnbbXBeKQkVGHmU89DEldLWikjV1xybAZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227737; c=relaxed/simple;
	bh=lAt4uVZNdRbzX1EozzvSNLuM54ZlS0jx8jx98sUV3F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ez2U/ZKpe1B7RJA4gw9Kiddgj/KZNmXJeTKdj99Vez5FQQk0xhcRbXPjldweVXzXREq8ktNe0FtieT7SC9v8WGZWCE0uTQEnil/ERVxXUc7dxWIhFhOE73jd+ykC0PdWP3n9ivINGwynSuKvccTh07pd6hY2b1ggsNhKOiblWvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BUtrPGCm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BUtrPGCm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B6529C2086C;
	Mon, 12 Jan 2026 14:21:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A4FC606FA;
	Mon, 12 Jan 2026 14:22:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F13C7103C8C61;
	Mon, 12 Jan 2026 15:22:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227733; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=XvULYzm2XFF613WS4sfvw7F/+FRjRGtcYlZTDIIWvCM=;
	b=BUtrPGCmLltiS2fYsagm5u5TjcZQCyPpZyZUO+0DD3S7C0Be1vO6CmmCYtsAMuJNRCnVDA
	JuEcaKDZSXwBU0qOemsFuhqdyTAa1CPnfRNV9ZOgtxWfFbAalvDnjtxpz3Aw34VHP10W55
	hrE76/FAySVR3FU9X+ZpDGki6XQnl+Lk/n/BAGGSzte3dhCYkYXMOd0dx9ffIk9FQ0EasW
	PBWwRs6nf51dcvWWKgkqhO3w0nilfqplplkhHe39dkj7ifqTsEPP9Tw4YVLEfJQ8mAayIu
	rQc89ZXlbKnW7qLHLXMjUKVcLJvbtJF7sauBFg7k581OlA9SO7T5wy2dhOuHTw==
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
Subject: [RFC PATCH 73/77] tests: fdtaddon: Add a basic test for addons using an orphan nodes
Date: Mon, 12 Jan 2026 15:20:03 +0100
Message-ID: <20260112142009.1006236-74-herve.codina@bootlin.com>
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

Orphan nodes are available in addons.

Add a test checking the application of an addon when orphan nodes are
involved.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/fdtaddon_basics2-merged1.dtb.dts.expect | 35 +++++++++++++++++++
 tests/fdtaddon_basics2-merged1.dtb.expect     | 27 ++++++++++++++
 tests/fdtaddon_basics2-merged2.dtb.dts.expect | 35 +++++++++++++++++++
 tests/fdtaddon_basics2-merged2.dtb.expect     | 27 ++++++++++++++
 tests/fdtaddon_basics2.dtba.expect            |  9 +++++
 tests/fdtaddon_basics2.dtsa                   | 15 ++++++++
 tests/run_tests.sh                            |  2 +-
 7 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 tests/fdtaddon_basics2-merged1.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics2-merged1.dtb.expect
 create mode 100644 tests/fdtaddon_basics2-merged2.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics2-merged2.dtb.expect
 create mode 100644 tests/fdtaddon_basics2.dtba.expect
 create mode 100644 tests/fdtaddon_basics2.dtsa

diff --git a/tests/fdtaddon_basics2-merged1.dtb.dts.expect b/tests/fdtaddon_basics2-merged1.dtb.dts.expect
new file mode 100644
index 0000000..927733c
--- /dev/null
+++ b/tests/fdtaddon_basics2-merged1.dtb.dts.expect
@@ -0,0 +1,35 @@
+/dts-v1/;
+
+/ {
+
+	base-node {
+
+		sub-node {
+			prop = <0x00>;
+			phandle = <0x02>;
+		};
+	};
+
+	somewhere {
+
+		node-a1 {
+			compatible = "abc,aaa";
+			phandle = <0x01>;
+
+			/export/ node_a: &{/somewhere/node-a1};
+			/export/ other: &{/base-node/sub-node};
+
+			addon-node {
+				prop = <0x00>;
+			};
+		};
+
+		node-a2 {
+			compatible = "abc,aaa";
+			phandle = <0x03>;
+
+			/export/ node_a: &{/somewhere/node-a2};
+			/export/ other: &{/base-node/sub-node};
+		};
+	};
+};
diff --git a/tests/fdtaddon_basics2-merged1.dtb.expect b/tests/fdtaddon_basics2-merged1.dtb.expect
new file mode 100644
index 0000000..bee1397
--- /dev/null
+++ b/tests/fdtaddon_basics2-merged1.dtb.expect
@@ -0,0 +1,27 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        sub-node {
+            prop = <0x00000000>;
+            phandle = <0x00000002>;
+        };
+    };
+    somewhere {
+        node-a1 {
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            addon-node {
+                prop = <0x00000000>;
+            };
+        };
+        node-a2 {
+            compatible = "abc,aaa";
+            phandle = <0x00000003>;
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000003
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+        };
+    };
+};
diff --git a/tests/fdtaddon_basics2-merged2.dtb.dts.expect b/tests/fdtaddon_basics2-merged2.dtb.dts.expect
new file mode 100644
index 0000000..d85567b
--- /dev/null
+++ b/tests/fdtaddon_basics2-merged2.dtb.dts.expect
@@ -0,0 +1,35 @@
+/dts-v1/;
+
+/ {
+
+	base-node {
+
+		sub-node {
+			prop = <0x00>;
+			phandle = <0x02>;
+		};
+	};
+
+	somewhere {
+
+		node-a1 {
+			compatible = "abc,aaa";
+			phandle = <0x01>;
+
+			/export/ node_a: &{/somewhere/node-a1};
+			/export/ other: &{/base-node/sub-node};
+		};
+
+		node-a2 {
+			compatible = "abc,aaa";
+			phandle = <0x03>;
+
+			/export/ node_a: &{/somewhere/node-a2};
+			/export/ other: &{/base-node/sub-node};
+
+			addon-node {
+				prop = <0x00>;
+			};
+		};
+	};
+};
diff --git a/tests/fdtaddon_basics2-merged2.dtb.expect b/tests/fdtaddon_basics2-merged2.dtb.expect
new file mode 100644
index 0000000..34a4b36
--- /dev/null
+++ b/tests/fdtaddon_basics2-merged2.dtb.expect
@@ -0,0 +1,27 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        sub-node {
+            prop = <0x00000000>;
+            phandle = <0x00000002>;
+        };
+    };
+    somewhere {
+        node-a1 {
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+        };
+        node-a2 {
+            compatible = "abc,aaa";
+            phandle = <0x00000003>;
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000003
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            addon-node {
+                prop = <0x00000000>;
+            };
+        };
+    };
+};
diff --git a/tests/fdtaddon_basics2.dtba.expect b/tests/fdtaddon_basics2.dtba.expect
new file mode 100644
index 0000000..ec1582e
--- /dev/null
+++ b/tests/fdtaddon_basics2.dtba.expect
@@ -0,0 +1,9 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'node_a' (abc,aaa)
+&node_a {
+    addon-node {
+        prop = <0x00000000>;
+    };
+};
diff --git a/tests/fdtaddon_basics2.dtsa b/tests/fdtaddon_basics2.dtsa
new file mode 100644
index 0000000..0dc70af
--- /dev/null
+++ b/tests/fdtaddon_basics2.dtsa
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ node_a: "abc,aaa";
+
+&node_a {
+	addon-node {
+		prop = <0>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 32c40cf..d62496c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1189,7 +1189,7 @@ fdtaddon_tests() {
 	run_dtc_test -I dts -O dtb -o fdtaddon_base.dtb "$SRCDIR/fdtaddon_base.dts"
 	check_dtb fdtaddon_base.dtb
 
-	for dt in fdtaddon_basics1; do
+	for dt in fdtaddon_basics1 fdtaddon_basics2; do
 		run_dtc_test -I dts -O dtb -o $dt.dtba "$SRCDIR/$dt.dtsa"
 		check_dtb $dt.dtba
 
-- 
2.52.0

