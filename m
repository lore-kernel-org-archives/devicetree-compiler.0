Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39A93DB651;
	Wed, 26 Aug 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738057; cv=none; b=dbfQfx0rt48nBO9AKFeK/I3Ky0KyqW2SFzSSx7blGtvMXePZPqcPKM2CFx+gqCKOO6ewOnwM78PkCjIyG8r2b8pA3u7674/vJ+EDpfnHRA6d3pLR1ocm1UQTphjO8ZDzwCK2nNihfFHhqSaPwyamdFlUGLlW8e922aRsU3288ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738057; c=relaxed/simple;
	bh=2Cw6vPyL3itLRaJnAnv5w4kyOBsoCLiTgO+22GcyMpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHnNUakGXbgaQkwh1eFrnBxD9CDesIWliE2u6ivN0I+NZvP5Z/2Z5fny5hSLSrSzXjEXiGG2k1rTdGdJ+is422KTjqCFgLsZ3CEoYtwKnVnSWYcdWy6ViWo8/YOGoCa+zaQ2YmMKOVbOkb/uamZuOwfpraC8KYLCiOIju5BV1R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BkzxEzBB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BkzxEzBB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 901984E413BC;
	Wed, 26 Aug 2026 09:54:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63F41604EC;
	Wed, 26 Aug 2026 09:54:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B523B11C7AD6D;
	Wed, 26 Aug 2026 11:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738048; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=v1Asp1WyFa8gfU5ZcHH4YO7YDdgU9M78nTcE4XMegSc=;
	b=BkzxEzBBEMT+FILGnUL1ktJ3hdaz6jTuA1Muux7qDJkJTz2zgEEUmlcZTGLR99pVIEIdJy
	Gb4SpWWuXF1u4ZO2mzuq4nVrO4fZAgN+A+GOUQAOYqiYwlqR99eI0OhE2WaTHVx39LULMu
	+HZBOlZn3p5JkDWRzuWuhB3TAZGLE7VphG2eJfB+d4lUHoLRi9GxBOxGlnZvS36Vif6fJk
	vu5SNfmJOL8bDKudjn/wpM65I4lymZKm2LrkcQPrJEx8DcN70LR2cBDYsIx3hMBGHtLrx7
	pWVOxgdsxPBQT5dN/NDTN1vJLomoldXRiBUXYh38d8AjljSh4XPdP1UFYvWPWw==
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
Subject: [RFC PATCH v2 68/74] tests: fdtaddon: Add a basic test for addons with references by path to orphan nodes
Date: Wed, 26 Aug 2026 11:49:37 +0200
Message-ID: <20260826094950.1088288-69-herve.codina@bootlin.com>
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

Addons can use references by path to reference by path to reference an
orphan node or sub-nodes of an orphan node.

Those references are converted to either local or external references
and have to be handled when the addon is applied.

Add a basic test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/fdtaddon_basics4-merged1.dtb.dts.expect | 43 +++++++++++++++++++
 tests/fdtaddon_basics4-merged1.dtb.expect     | 37 ++++++++++++++++
 tests/fdtaddon_basics4-merged2.dtb.dts.expect | 43 +++++++++++++++++++
 tests/fdtaddon_basics4-merged2.dtb.expect     | 37 ++++++++++++++++
 tests/fdtaddon_basics4.dtba.expect            | 22 ++++++++++
 tests/fdtaddon_basics4.dtsa                   | 25 +++++++++++
 tests/run_tests.sh                            |  3 +-
 7 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 tests/fdtaddon_basics4-merged1.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics4-merged1.dtb.expect
 create mode 100644 tests/fdtaddon_basics4-merged2.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics4-merged2.dtb.expect
 create mode 100644 tests/fdtaddon_basics4.dtba.expect
 create mode 100644 tests/fdtaddon_basics4.dtsa

diff --git a/tests/fdtaddon_basics4-merged1.dtb.dts.expect b/tests/fdtaddon_basics4-merged1.dtb.dts.expect
new file mode 100644
index 00000000..9e6bbf18
--- /dev/null
+++ b/tests/fdtaddon_basics4-merged1.dtb.dts.expect
@@ -0,0 +1,43 @@
+/dts-v1/;
+
+/ {
+
+	base-node {
+
+		sub-node {
+			prop = <0x00>;
+			phandle = <0x02>;
+
+			sub-node {
+				phandle = <0x04>;
+				prop = <0x01>;
+			};
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
+				ref-other-subnode = <&{/base-node/sub-node/sub-node}>;
+				ref-other2 = <&{/base-node/sub-node}>;
+				ref-other1 = <&{/base-node/sub-node} 0x0a>;
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
diff --git a/tests/fdtaddon_basics4-merged1.dtb.expect b/tests/fdtaddon_basics4-merged1.dtb.expect
new file mode 100644
index 00000000..f339430a
--- /dev/null
+++ b/tests/fdtaddon_basics4-merged1.dtb.expect
@@ -0,0 +1,37 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        sub-node {
+            prop = <0x00000000>;
+            phandle = <0x00000002>;
+            sub-node {
+                phandle = <0x00000004>;
+                prop = <0x00000001>;
+            };
+        };
+    };
+    somewhere {
+        node-a1 {
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            addon-node {
+                ref-other-subnode = <0x00000004>;
+                // [FDT_PROPDATA_PHANDLE] ref-other-subnode[0]
+                ref-other2 = <0x00000002>;
+                // [FDT_PROPDATA_PHANDLE] ref-other2[0]
+                ref-other1 = <0x00000002 0x0000000a>;
+                // [FDT_PROPDATA_PHANDLE] ref-other1[0]
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
diff --git a/tests/fdtaddon_basics4-merged2.dtb.dts.expect b/tests/fdtaddon_basics4-merged2.dtb.dts.expect
new file mode 100644
index 00000000..0c513c93
--- /dev/null
+++ b/tests/fdtaddon_basics4-merged2.dtb.dts.expect
@@ -0,0 +1,43 @@
+/dts-v1/;
+
+/ {
+
+	base-node {
+
+		sub-node {
+			prop = <0x00>;
+			phandle = <0x02>;
+
+			sub-node {
+				phandle = <0x04>;
+				prop = <0x01>;
+			};
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
+				ref-other-subnode = <&{/base-node/sub-node/sub-node}>;
+				ref-other2 = <&{/base-node/sub-node}>;
+				ref-other1 = <&{/base-node/sub-node} 0x0a>;
+				prop = <0x00>;
+			};
+		};
+	};
+};
diff --git a/tests/fdtaddon_basics4-merged2.dtb.expect b/tests/fdtaddon_basics4-merged2.dtb.expect
new file mode 100644
index 00000000..f4072f16
--- /dev/null
+++ b/tests/fdtaddon_basics4-merged2.dtb.expect
@@ -0,0 +1,37 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        sub-node {
+            prop = <0x00000000>;
+            phandle = <0x00000002>;
+            sub-node {
+                phandle = <0x00000004>;
+                prop = <0x00000001>;
+            };
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
+                ref-other-subnode = <0x00000004>;
+                // [FDT_PROPDATA_PHANDLE] ref-other-subnode[0]
+                ref-other2 = <0x00000002>;
+                // [FDT_PROPDATA_PHANDLE] ref-other2[0]
+                ref-other1 = <0x00000002 0x0000000a>;
+                // [FDT_PROPDATA_PHANDLE] ref-other1[0]
+                prop = <0x00000000>;
+            };
+        };
+    };
+};
diff --git a/tests/fdtaddon_basics4.dtba.expect b/tests/fdtaddon_basics4.dtba.expect
new file mode 100644
index 00000000..14450cb9
--- /dev/null
+++ b/tests/fdtaddon_basics4.dtba.expect
@@ -0,0 +1,22 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'node_a' (abc,aaa)
+// [FDT_IMPORT_SYM] 'other' ()
+&node_a {
+    addon-node {
+        prop = <0x00000000>;
+        ref-other1 = <0xffffffff 0x0000000a>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref-other1[0], ref = other
+        ref-other2 = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref-other2[0], ref = other
+        ref-other-subnode = <0x00000001>;
+        // [FDT_PROPDATA_PHANDLE] ref-other-subnode[0]
+    };
+};
+&other {
+    sub-node {
+        prop = <0x00000001>;
+        phandle = <0x00000001>;
+    };
+};
diff --git a/tests/fdtaddon_basics4.dtsa b/tests/fdtaddon_basics4.dtsa
new file mode 100644
index 00000000..5ca19ce9
--- /dev/null
+++ b/tests/fdtaddon_basics4.dtsa
@@ -0,0 +1,25 @@
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
+		ref-other1 = <&other 10>;
+		ref-other2 = <&{$other}>;
+		ref-other-subnode = <&{$other/sub-node}>;
+	};
+};
+
+&other {
+	sub-node {
+		prop = <1>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index de3d31a3..5f09bf47 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1303,7 +1303,8 @@ fdtaddon_tests() {
 	run_dtc_test -I dts -O dtb -o fdtaddon_base.dtb "$SRCDIR/fdtaddon_base.dts"
 	check_dtb fdtaddon_base.dtb
 
-	for dt in fdtaddon_basics1 fdtaddon_basics2 fdtaddon_basics3; do
+	for dt in fdtaddon_basics1 fdtaddon_basics2 fdtaddon_basics3 \
+		  fdtaddon_basics4; do
 		run_dtc_test -I dts -O dtb -o $dt.dtba "$SRCDIR/$dt.dtsa"
 		check_dtb $dt.dtba
 
-- 
2.55.0

