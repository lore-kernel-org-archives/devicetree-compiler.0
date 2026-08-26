Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1053DAADF;
	Wed, 26 Aug 2026 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738044; cv=none; b=bBvOkuFAQJTM/pRbXwlaTG2yg0yDy8RcWrFcLi0mPEA3v6xdOJCEdZi8XbkmZGvOTvPqQgxKBozU7QwtbMJ+nWcp8X2IpeKtluSLZ4GKBAHkL5mxIMeXbf+1Oi8A8bH/Ezo47c204VoisvXXX1RNGI2jkfgVc0JpyvlvxBkr+pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738044; c=relaxed/simple;
	bh=JkWMrCyJ4iXRbFDdu5sFRz9JVPemNVB5upCHYVECUtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oH3XAc9WQqGfsxBTbkZuLetZ45jyRAhQ2NyNvHKahMLEO+LroXCKJQTcoYERNKsCmAloqChCDP78OkVD/NZe0eJuv66y/TweBovqAGK7iGwqePoZ7liKK0qaVsEX7g2Q3P7EI8bNULquAuKbqRCYPcS8NSkE2p5dFKC4n58fo5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=emSTif9k; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="emSTif9k"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A37D81A0E1B;
	Wed, 26 Aug 2026 09:54:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7094B604EC;
	Wed, 26 Aug 2026 09:54:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 954C411C7AD6E;
	Wed, 26 Aug 2026 11:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738035; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kq+3KzaSHF4QKpXXgYA6QkJuldrig8PqiNl5QyeuZkA=;
	b=emSTif9k8PtzOIXYfhfMNkuEnz0VuAuO0G7R89g02qMkUVKjOHZNwzNnYC0eT2ct0iRoKt
	wHvSlre0QQzqvr1Ap8NTcYptwws0Cr9RZFswlR3S4lQu6vcnTPM3JCFSO7sjERDod3oUcm
	QRxKbkC022dwZCUdKpt9orqGfvEH4SyMykFhndvBdM2f7utl+jb15WWW0yo0PsODiFxo9r
	vKvEnUGHB5vtqYAnwGpdq80HEKGBD2K+0JBX5TYzYDDZVfvvaloBIOIk0H5VcjINqyNW6C
	+9Uoya8HvHhBn2c09XxJLf1ewEVXLwUs6eYOrAnjTsefquTVirIlfAI2iaYcbQ==
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
Subject: [RFC PATCH v2 66/74] tests: fdtaddon: Add a basic test for addons using an orphan nodes
Date: Wed, 26 Aug 2026 11:49:35 +0200
Message-ID: <20260826094950.1088288-67-herve.codina@bootlin.com>
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
index 00000000..927733c1
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
index 00000000..966a43df
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
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            addon-node {
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
diff --git a/tests/fdtaddon_basics2-merged2.dtb.dts.expect b/tests/fdtaddon_basics2-merged2.dtb.dts.expect
new file mode 100644
index 00000000..d85567b7
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
index 00000000..ca9c7ba0
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
+                prop = <0x00000000>;
+            };
+        };
+    };
+};
diff --git a/tests/fdtaddon_basics2.dtba.expect b/tests/fdtaddon_basics2.dtba.expect
new file mode 100644
index 00000000..ec1582e6
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
index 00000000..0dc70af9
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
index 3f80b183..558f4bd1 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1303,7 +1303,7 @@ fdtaddon_tests() {
 	run_dtc_test -I dts -O dtb -o fdtaddon_base.dtb "$SRCDIR/fdtaddon_base.dts"
 	check_dtb fdtaddon_base.dtb
 
-	for dt in fdtaddon_basics1; do
+	for dt in fdtaddon_basics1 fdtaddon_basics2; do
 		run_dtc_test -I dts -O dtb -o $dt.dtba "$SRCDIR/$dt.dtsa"
 		check_dtb $dt.dtba
 
-- 
2.55.0

