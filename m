Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85535421259;
	Wed, 26 Aug 2026 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738050; cv=none; b=V9KFTwdQaTdisyov5iXzTsBknL3sJPNpl+n0zUcwIeqr+ZbDd/9Zam3JFveMC+22jz9pJC4UfS0oBdmA/NGmpC/PMHyY9E01b/pf/3QhHizoC9/f+8gK7uR6p/Up7WBbZSrhKYMyPyCbr2AY8XYsZcA0SWxcxWiCHFjYgElJwwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738050; c=relaxed/simple;
	bh=a4NXlVB5zZSzkiMLWzSwv7ABizKXCCoVs/PQc8UJ0Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WX+jzkMn8FbJRlJD5quMuNYf2tWdDTSZ112JD+Z47OOwhZvNyN0JwoFs94op7vtbQJa6NqzBTkGjWNtJ1lp51+8kGJlPzliTJagz4YN75wN+VKBysBZm1QcgiC1w5rjMVsd+4YYPPEJUTFRHlilBFIg+TcqZrL0xClFRTJ1zFig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MWo1ZuZI; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MWo1ZuZI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4A6241A0E1B;
	Wed, 26 Aug 2026 09:54:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CBF3604EC;
	Wed, 26 Aug 2026 09:54:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E21C511C7AD65;
	Wed, 26 Aug 2026 11:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738042; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=75CsgcEdDtja8VUmeDx5kT2X9DM5QC5X/cDmRtn72LE=;
	b=MWo1ZuZI0kbUVNjLjJEOfPgX4pQRQR+GojFLrlBtSvEwchavdT8p4XIYlLd1veAen4PbzM
	ZlLzrYtfJzTIZcQReS5SpgXxhV56rl9vFISIBRIfKHZwZXtk7Uk4wAtPb9sHdnrBXitt+5
	63FnXNSYzXR1hTroeTYDIs68qXzunBZHgDo7FEX0BN6Mte0usXdYa5dtEoM3Z+ucv+kx1Q
	BMXPQMiy0DN/HBIc4qgd3LLXKJWrQH1aWoBbgSRsyJkX73lURE2Cwt7cBMLp0LRXwSb31a
	YmCTR7yteO5/u8zMXbjh2CTzWneXbsM2p4ruhr2LRHopLwK2F5DKXY7nZ87Y0w==
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
Subject: [RFC PATCH v2 67/74] tests: fdtaddon: Add a basic test for addons with unresolved phandle references
Date: Wed, 26 Aug 2026 11:49:36 +0200
Message-ID: <20260826094950.1088288-68-herve.codina@bootlin.com>
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

Addons can have unresolved phandle references. Those references are
resolved when the addon is applied.

Add a basic test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/fdtaddon_basics3-merged1.dtb.dts.expect | 36 +++++++++++++++++++
 tests/fdtaddon_basics3-merged1.dtb.expect     | 29 +++++++++++++++
 tests/fdtaddon_basics3-merged2.dtb.dts.expect | 36 +++++++++++++++++++
 tests/fdtaddon_basics3-merged2.dtb.expect     | 29 +++++++++++++++
 tests/fdtaddon_basics3.dtba.expect            | 12 +++++++
 tests/fdtaddon_basics3.dtsa                   | 17 +++++++++
 tests/run_tests.sh                            |  2 +-
 7 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 tests/fdtaddon_basics3-merged1.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics3-merged1.dtb.expect
 create mode 100644 tests/fdtaddon_basics3-merged2.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics3-merged2.dtb.expect
 create mode 100644 tests/fdtaddon_basics3.dtba.expect
 create mode 100644 tests/fdtaddon_basics3.dtsa

diff --git a/tests/fdtaddon_basics3-merged1.dtb.dts.expect b/tests/fdtaddon_basics3-merged1.dtb.dts.expect
new file mode 100644
index 00000000..c1bf3cc2
--- /dev/null
+++ b/tests/fdtaddon_basics3-merged1.dtb.dts.expect
@@ -0,0 +1,36 @@
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
+				ref-other = <&{/base-node/sub-node} 0x0a>;
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
diff --git a/tests/fdtaddon_basics3-merged1.dtb.expect b/tests/fdtaddon_basics3-merged1.dtb.expect
new file mode 100644
index 00000000..8dccf052
--- /dev/null
+++ b/tests/fdtaddon_basics3-merged1.dtb.expect
@@ -0,0 +1,29 @@
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
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            addon-node {
+                ref-other = <0x00000002 0x0000000a>;
+                // [FDT_PROPDATA_PHANDLE] ref-other[0]
+                prop = <0x00000000>;
+            };
+        };
+        node-a2 {
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000003
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000003>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_basics3-merged2.dtb.dts.expect b/tests/fdtaddon_basics3-merged2.dtb.dts.expect
new file mode 100644
index 00000000..8dc9fd25
--- /dev/null
+++ b/tests/fdtaddon_basics3-merged2.dtb.dts.expect
@@ -0,0 +1,36 @@
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
+				ref-other = <&{/base-node/sub-node} 0x0a>;
+				prop = <0x00>;
+			};
+		};
+	};
+};
diff --git a/tests/fdtaddon_basics3-merged2.dtb.expect b/tests/fdtaddon_basics3-merged2.dtb.expect
new file mode 100644
index 00000000..4761a8e5
--- /dev/null
+++ b/tests/fdtaddon_basics3-merged2.dtb.expect
@@ -0,0 +1,29 @@
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
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+        };
+        node-a2 {
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000003
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000003>;
+            addon-node {
+                ref-other = <0x00000002 0x0000000a>;
+                // [FDT_PROPDATA_PHANDLE] ref-other[0]
+                prop = <0x00000000>;
+            };
+        };
+    };
+};
diff --git a/tests/fdtaddon_basics3.dtba.expect b/tests/fdtaddon_basics3.dtba.expect
new file mode 100644
index 00000000..20a87a19
--- /dev/null
+++ b/tests/fdtaddon_basics3.dtba.expect
@@ -0,0 +1,12 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'node_a' (abc,aaa)
+// [FDT_IMPORT_SYM] 'other' ()
+&node_a {
+    addon-node {
+        prop = <0x00000000>;
+        ref-other = <0xffffffff 0x0000000a>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref-other[0], ref = other
+    };
+};
diff --git a/tests/fdtaddon_basics3.dtsa b/tests/fdtaddon_basics3.dtsa
new file mode 100644
index 00000000..8658b45e
--- /dev/null
+++ b/tests/fdtaddon_basics3.dtsa
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ node_a: "abc,aaa";
+/import/ other: "";
+
+&node_a {
+	addon-node {
+		prop = <0>;
+		ref-other = <&other 10>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 558f4bd1..de3d31a3 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1303,7 +1303,7 @@ fdtaddon_tests() {
 	run_dtc_test -I dts -O dtb -o fdtaddon_base.dtb "$SRCDIR/fdtaddon_base.dts"
 	check_dtb fdtaddon_base.dtb
 
-	for dt in fdtaddon_basics1 fdtaddon_basics2; do
+	for dt in fdtaddon_basics1 fdtaddon_basics2 fdtaddon_basics3; do
 		run_dtc_test -I dts -O dtb -o $dt.dtba "$SRCDIR/$dt.dtsa"
 		check_dtb $dt.dtba
 
-- 
2.55.0

