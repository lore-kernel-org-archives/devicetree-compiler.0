Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE46436D4F7;
	Mon, 12 Jan 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227743; cv=none; b=pwM38sUlaV7kZngXnkV89QaWWfZNroxirQmmK5PCwbrEbWecYIfbXLy54AFDzgVRRmlqIgtCrnXV1vCwo2rsi2L+Rqt+aQ3BZf6STJno1E6SXggwr5jfAvw0P4w8hJOlIoCIu7i1JKzKbpsQw1e0lcA+TUdUdLOh8RtAerSGUKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227743; c=relaxed/simple;
	bh=Isd85+H9Qiys/sKykMZqET59mCJqZdWNoHohNREXU0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oX1Q4tRORxg7020t3G+kJrVmTdtEMT3QU04akB/52AC9Q51D8OmeuAdEM5nexpFj7DLrxin9+uLWpWanqHHTp2rfjDOMUrx6ouncsB4f+muihyqTEioff3SDxVMGf6mLtSJYphUep0QODGQ4t4w0vZU8WGMHmOSCscsgkBKYc+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YEC30wYd; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YEC30wYd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 701244E4209B;
	Mon, 12 Jan 2026 14:22:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4696C606FA;
	Mon, 12 Jan 2026 14:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EC36103C8C61;
	Mon, 12 Jan 2026 15:22:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227739; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bKw3147CAfL3GStkkCwGjQbpn30MvLQfo0VEk7yzljo=;
	b=YEC30wYdXPsi9BCzWc9XaCpxRKU75BSvsxWKSOASJRm9RCw2Ik0tQcqyqzIDXtZvik1NkN
	df0J13A2qgj5mC1fAA52D7eFh6xcw84/g6HL4D78xn2We9O0VVOg1OqRWlw6WJ6CIdaQIv
	wuGh1Jpcba37Yqh7WiQkJMa7+R6YdD/IHhLMXRt8fAF8F2x4CO/7V1+8FotkyqWrO5694V
	HYwYvwTJEvJ883jrPSYgUJe0duDKq8otUBoc8a6zCiPZ0AJysF3Vcn99qvMzxjvD0nG6aU
	TxTXiD5Txn95IvxQMmCQxXn8NPpZNoRqeHoEw2gtrc2f7Q1PMD+eCG9opnjUTw==
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
Subject: [RFC PATCH 77/77] tests: fdtaddon: Add a test using more realistic dts and dtsa
Date: Mon, 12 Jan 2026 15:20:07 +0100
Message-ID: <20260112142009.1006236-78-herve.codina@bootlin.com>
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

The dts and dtsa files used in the fdtaddon tests were centered on
specific addon features in order to test those specific features.

In term of structure or naming, they are not representative of real
use-cases.

This new test uses realistic dts and dtsa files with naming and
structures tradidionally found in real cases.

The dts describes the hardware of the base board.

The hardware structure of the base board is the following:

       +--------------+
       | 5V regulator +-------+
       +--------------+       |
                              |
  +----------------------+    |       +----------------+
  |        SOC           |    |       | Connector A    |
  |                      |    |       |                |
  | +-----------------+  |    +-------+ 5v             |
  | + i2c1 controller +---------------+ i2c bus        |
  | +-----------------+  |    +-------+ gpio 0 / irq 0 |
  |                      |    |   +---+ gpio 1 / irq 1 |
  | +------------------+ |    |   |   +----------------+
  | | gpio1 controller | |    |   |
  | |         gpio #10 +------+   |
  | +------------------+ |        |
  |                      |        |
  | +---------------- -+ |        |
  | | gpio2 controller | |        |
  | |          gpio #3 +----------+
  | +------------------+ |
  +----------------------+

The connector 'Connector A' is the connector where the
pluggable board can be connected to. It is described in the dts and
related export symbols are set in order to be usable by the dtsa
describing the pluggable board.

The hardware structure of the pluggable board is the following:

                               +---------------+
                               | EEPROM        |
                               | i2c addr 0x51 |
                               |               +
                       +-------+ i2c           |
                       |       +---------------+
                       |
                       |       +---------------+
                       |       | Expander IO   |
  +----------------+   |       | i2c addr 0x23 |
  |   Connector    |   |       |               |
  |                |   |   +---+ Vcc1          |
  |             5v +---|---+---+ Vcc2          |
  |        i2c bus +---+-------+ i2c           |
  | gpio 0 / irq 0 +-----------+ irq           |
  | gpio 1 / irq 1 +-----------+ reset         |
  +----------------+           +---------------+

This structure is described in the addon dtsa. This addon dtsa is
expected to be applied to the base device tree node describing the
connector the pluggable board is connected to.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 ...ddon_realistic_addon-merged.dtb.dts.expect | 91 ++++++++++++++++++
 ...fdtaddon_realistic_addon-merged.dtb.expect | 93 +++++++++++++++++++
 tests/fdtaddon_realistic_addon.dtba.expect    | 32 +++++++
 tests/fdtaddon_realistic_addon.dtsa           | 50 ++++++++++
 tests/fdtaddon_realistic_base.dtb.expect      | 72 ++++++++++++++
 tests/fdtaddon_realistic_base.dts             | 74 +++++++++++++++
 tests/run_tests.sh                            | 14 +++
 7 files changed, 426 insertions(+)
 create mode 100644 tests/fdtaddon_realistic_addon-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_realistic_addon-merged.dtb.expect
 create mode 100644 tests/fdtaddon_realistic_addon.dtba.expect
 create mode 100644 tests/fdtaddon_realistic_addon.dtsa
 create mode 100644 tests/fdtaddon_realistic_base.dtb.expect
 create mode 100644 tests/fdtaddon_realistic_base.dts

diff --git a/tests/fdtaddon_realistic_addon-merged.dtb.dts.expect b/tests/fdtaddon_realistic_addon-merged.dtb.dts.expect
new file mode 100644
index 0000000..49aa950
--- /dev/null
+++ b/tests/fdtaddon_realistic_addon-merged.dtb.dts.expect
@@ -0,0 +1,91 @@
+/dts-v1/;
+
+/ {
+
+	regulator {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <0x4c4b40>;
+		regulator-max-microvolt = <0x4c4b40>;
+		gpios = <&{/soc/gpio@2000} 0x05 0x00>;
+		phandle = <0x05>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <0x01>;
+		#size-cells = <0x01>;
+
+		i2c@1000 {
+			compatible = "xyz,i2c-controller";
+			reg = <0x1000 0x100>;
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			phandle = <0x06>;
+		};
+
+		gpio@2000 {
+			compatible = "xyz,gpio-controller";
+			reg = <0x2000 0x100>;
+			gpio-controller;
+			#gpio-cells = <0x02>;
+			interrupt-controller;
+			#interrupt-cells = <0x02>;
+			#address-cells = <0x00>;
+			phandle = <0x01>;
+		};
+
+		gpio@3000 {
+			compatible = "xyz,gpio-controller";
+			reg = <0x3000 0x100>;
+			gpio-controller;
+			#gpio-cells = <0x02>;
+			interrupt-controller;
+			#interrupt-cells = <0x02>;
+			#address-cells = <0x00>;
+			phandle = <0x02>;
+		};
+	};
+
+	connector-a {
+		compatible = "abc,foo-connector";
+		#address-cells = <0x00>;
+		#interrupt-cells = <0x02>;
+		interrupt-map = <0x00 0x00 &{/soc/gpio@2000} 0x0a 0x00 0x00 0x100 &{/soc/gpio@2000} 0x0a 0x100 0x01 0x00 &{/soc/gpio@3000} 0x03 0x00 0x01 0x100 &{/soc/gpio@3000} 0x03 0x100>;
+		#gpio-cells = <0x02>;
+		gpio-map-mask = <0x0f 0x00>;
+		gpio-map-pass-thru = <0x00 0x0f>;
+		gpio-map = <0x00 0x00 &{/soc/gpio@2000} 0x0a 0x00 0x01 0x00 &{/soc/gpio@3000} 0x03 0x00>;
+		phandle = <0x03>;
+
+		/export/ connector: &{/connector-a};
+		/export/ conn_i2c: &{/connector-a/conn-i2c};
+		/export/ conn_5v: &{/regulator};
+
+		conn-i2c {
+			compatible = "i2c-bus-extension";
+			i2c-parent = <&{/soc/i2c@1000}>;
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			phandle = <0x04>;
+
+			eeprom@51 {
+				reg = <0x51>;
+				compatible = "xxx,eeprom";
+			};
+
+			gpio@23 {
+				reset-gpios = <&{/connector-a} 0x01 0x00>;
+				vcc2-supply = <&{/regulator}>;
+				vcc1-supply = <&{/regulator}>;
+				#interrupt-cells = <0x02>;
+				interrupt-controller;
+				interrupts = <0x00 0x100>;
+				interrupt-parent = <&{/connector-a}>;
+				#gpio-cells = <0x02>;
+				gpio-controller;
+				reg = <0x23>;
+				compatible = "xxx,expander-io";
+			};
+		};
+	};
+};
diff --git a/tests/fdtaddon_realistic_addon-merged.dtb.expect b/tests/fdtaddon_realistic_addon-merged.dtb.expect
new file mode 100644
index 0000000..fbebb4c
--- /dev/null
+++ b/tests/fdtaddon_realistic_addon-merged.dtb.expect
@@ -0,0 +1,93 @@
+/dts-v1/;
+
+/ {
+    regulator {
+        compatible = "regulator-fixed";
+        regulator-min-microvolt = <0x004c4b40>;
+        regulator-max-microvolt = <0x004c4b40>;
+        gpios = <0x00000001 0x00000005 0x00000000>;
+        // [FDT_REF_LOCAL] gpios[0]
+        phandle = <0x00000005>;
+    };
+    soc {
+        compatible = "simple-bus";
+        #address-cells = <0x00000001>;
+        #size-cells = <0x00000001>;
+        i2c@1000 {
+            compatible = "xyz,i2c-controller";
+            reg = <0x00001000 0x00000100>;
+            #address-cells = <0x00000001>;
+            #size-cells = <0x00000000>;
+            phandle = <0x00000006>;
+        };
+        gpio@2000 {
+            compatible = "xyz,gpio-controller";
+            reg = <0x00002000 0x00000100>;
+            gpio-controller;
+            #gpio-cells = <0x00000002>;
+            interrupt-controller;
+            #interrupt-cells = <0x00000002>;
+            #address-cells = <0x00000000>;
+            phandle = <0x00000001>;
+        };
+        gpio@3000 {
+            compatible = "xyz,gpio-controller";
+            reg = <0x00003000 0x00000100>;
+            gpio-controller;
+            #gpio-cells = <0x00000002>;
+            interrupt-controller;
+            #interrupt-cells = <0x00000002>;
+            #address-cells = <0x00000000>;
+            phandle = <0x00000002>;
+        };
+    };
+    connector-a {
+        compatible = "abc,foo-connector";
+        #address-cells = <0x00000000>;
+        #interrupt-cells = <0x00000002>;
+        interrupt-map = <0x00000000 0x00000000 0x00000001 0x0000000a 0x00000000 0x00000000 0x00000100 0x00000001 0x0000000a 0x00000100 0x00000001 0x00000000 0x00000002 0x00000003 0x00000000 0x00000001 0x00000100 0x00000002 0x00000003 0x00000100>;
+        // [FDT_REF_LOCAL] interrupt-map[8]
+        // [FDT_REF_LOCAL] interrupt-map[28]
+        // [FDT_REF_LOCAL] interrupt-map[48]
+        // [FDT_REF_LOCAL] interrupt-map[68]
+        #gpio-cells = <0x00000002>;
+        gpio-map-mask = <0x0000000f 0x00000000>;
+        gpio-map-pass-thru = <0x00000000 0x0000000f>;
+        gpio-map = <0x00000000 0x00000000 0x00000001 0x0000000a 0x00000000 0x00000001 0x00000000 0x00000002 0x00000003 0x00000000>;
+        // [FDT_REF_LOCAL] gpio-map[8]
+        // [FDT_REF_LOCAL] gpio-map[28]
+        phandle = <0x00000003>;
+        // [FDT_EXPORT_SYM] 'connector' -> phandle 0x00000003
+        // [FDT_EXPORT_SYM] 'conn_i2c' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'conn_5v' -> phandle 0x00000005
+        conn-i2c {
+            compatible = "i2c-bus-extension";
+            i2c-parent = <0x00000006>;
+            // [FDT_REF_LOCAL] i2c-parent[0]
+            #address-cells = <0x00000001>;
+            #size-cells = <0x00000000>;
+            phandle = <0x00000004>;
+            eeprom@51 {
+                reg = <0x00000051>;
+                compatible = "xxx,eeprom";
+            };
+            gpio@23 {
+                reset-gpios = <0x00000003 0x00000001 0x00000000>;
+                // [FDT_REF_LOCAL] reset-gpios[0]
+                vcc2-supply = <0x00000005>;
+                // [FDT_REF_LOCAL] vcc2-supply[0]
+                vcc1-supply = <0x00000005>;
+                // [FDT_REF_LOCAL] vcc1-supply[0]
+                #interrupt-cells = <0x00000002>;
+                interrupt-controller;
+                interrupts = <0x00000000 0x00000100>;
+                interrupt-parent = <0x00000003>;
+                // [FDT_REF_LOCAL] interrupt-parent[0]
+                #gpio-cells = <0x00000002>;
+                gpio-controller;
+                reg = <0x00000023>;
+                compatible = "xxx,expander-io";
+            };
+        };
+    };
+};
diff --git a/tests/fdtaddon_realistic_addon.dtba.expect b/tests/fdtaddon_realistic_addon.dtba.expect
new file mode 100644
index 0000000..bc2efd4
--- /dev/null
+++ b/tests/fdtaddon_realistic_addon.dtba.expect
@@ -0,0 +1,32 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'connector' (abc,foo-connector)
+// [FDT_IMPORT_SYM] 'conn_5v' ()
+&connector {
+    conn-i2c {
+        gpio@23 {
+            compatible = "xxx,expander-io";
+            reg = <0x00000023>;
+            gpio-controller;
+            #gpio-cells = <0x00000002>;
+            interrupt-parent = <0xffffffff>;
+            // [FDT_REF_PHANDLE] interrupt-parent[0], ref = connector
+            interrupts = <0x00000000 0x00000100>;
+            interrupt-controller;
+            #interrupt-cells = <0x00000002>;
+            vcc1-supply = <0xffffffff>;
+            // [FDT_REF_PHANDLE] vcc1-supply[0], ref = conn_5v
+            vcc2-supply = <0xffffffff>;
+            // [FDT_REF_PHANDLE] vcc2-supply[0], ref = connector.conn_5v
+            reset-gpios = <0xffffffff 0x00000001 0x00000000>;
+            // [FDT_REF_PHANDLE] reset-gpios[0], ref = connector
+        };
+    };
+};
+&connector.conn_i2c {
+    eeprom@51 {
+        compatible = "xxx,eeprom";
+        reg = <0x00000051>;
+    };
+};
diff --git a/tests/fdtaddon_realistic_addon.dtsa b/tests/fdtaddon_realistic_addon.dtsa
new file mode 100644
index 0000000..255a1ff
--- /dev/null
+++ b/tests/fdtaddon_realistic_addon.dtsa
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ connector: "abc,foo-connector";
+/import/ conn_5v: "";
+
+&connector {
+	/*
+	 * Add a gpio expander at the conn-i2c node (i2c extension bus)
+	 * available at the connector node
+	 */
+	conn-i2c {
+		gpio@23 {
+			compatible = "xxx,expander-io";
+			reg = <0x23>;
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			/* Use the connector interrupt number 0 */
+			interrupt-parent = <&connector>;
+			interrupts = <0 0x100>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			/* Use 5V power-supply wired to the connector */
+			vcc1-supply = <&conn_5v>; /* Need to be an imported symbol */
+			vcc2-supply = <&connector.conn_5v>; /* Only connector need to be imported */
+
+			/* Use the connector gpio number 1 */
+			reset-gpios = <&connector 1 0>;
+		};
+	};
+};
+
+/*
+ * Use namespace reference to add an EEPROM at i2c bus connected
+ * to the connector. It can be an i2c extension or the i2c controller itself.
+ * We don't know and we don't have to know.
+ */
+&connector.conn_i2c {
+	eeprom@51 {
+		compatible = "xxx,eeprom";
+		reg = <0x51>;
+	};
+};
diff --git a/tests/fdtaddon_realistic_base.dtb.expect b/tests/fdtaddon_realistic_base.dtb.expect
new file mode 100644
index 0000000..9064a7a
--- /dev/null
+++ b/tests/fdtaddon_realistic_base.dtb.expect
@@ -0,0 +1,72 @@
+/dts-v1/;
+
+/ {
+    regulator {
+        compatible = "regulator-fixed";
+        regulator-min-microvolt = <0x004c4b40>;
+        regulator-max-microvolt = <0x004c4b40>;
+        gpios = <0x00000001 0x00000005 0x00000000>;
+        // [FDT_REF_LOCAL] gpios[0]
+        phandle = <0x00000005>;
+    };
+    soc {
+        compatible = "simple-bus";
+        #address-cells = <0x00000001>;
+        #size-cells = <0x00000001>;
+        i2c@1000 {
+            compatible = "xyz,i2c-controller";
+            reg = <0x00001000 0x00000100>;
+            #address-cells = <0x00000001>;
+            #size-cells = <0x00000000>;
+            phandle = <0x00000006>;
+        };
+        gpio@2000 {
+            compatible = "xyz,gpio-controller";
+            reg = <0x00002000 0x00000100>;
+            gpio-controller;
+            #gpio-cells = <0x00000002>;
+            interrupt-controller;
+            #interrupt-cells = <0x00000002>;
+            #address-cells = <0x00000000>;
+            phandle = <0x00000001>;
+        };
+        gpio@3000 {
+            compatible = "xyz,gpio-controller";
+            reg = <0x00003000 0x00000100>;
+            gpio-controller;
+            #gpio-cells = <0x00000002>;
+            interrupt-controller;
+            #interrupt-cells = <0x00000002>;
+            #address-cells = <0x00000000>;
+            phandle = <0x00000002>;
+        };
+    };
+    connector-a {
+        compatible = "abc,foo-connector";
+        #address-cells = <0x00000000>;
+        #interrupt-cells = <0x00000002>;
+        interrupt-map = <0x00000000 0x00000000 0x00000001 0x0000000a 0x00000000 0x00000000 0x00000100 0x00000001 0x0000000a 0x00000100 0x00000001 0x00000000 0x00000002 0x00000003 0x00000000 0x00000001 0x00000100 0x00000002 0x00000003 0x00000100>;
+        // [FDT_REF_LOCAL] interrupt-map[8]
+        // [FDT_REF_LOCAL] interrupt-map[28]
+        // [FDT_REF_LOCAL] interrupt-map[48]
+        // [FDT_REF_LOCAL] interrupt-map[68]
+        #gpio-cells = <0x00000002>;
+        gpio-map-mask = <0x0000000f 0x00000000>;
+        gpio-map-pass-thru = <0x00000000 0x0000000f>;
+        gpio-map = <0x00000000 0x00000000 0x00000001 0x0000000a 0x00000000 0x00000001 0x00000000 0x00000002 0x00000003 0x00000000>;
+        // [FDT_REF_LOCAL] gpio-map[8]
+        // [FDT_REF_LOCAL] gpio-map[28]
+        phandle = <0x00000003>;
+        // [FDT_EXPORT_SYM] 'connector' -> phandle 0x00000003
+        // [FDT_EXPORT_SYM] 'conn_i2c' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'conn_5v' -> phandle 0x00000005
+        conn-i2c {
+            compatible = "i2c-bus-extension";
+            i2c-parent = <0x00000006>;
+            // [FDT_REF_LOCAL] i2c-parent[0]
+            #address-cells = <0x00000001>;
+            #size-cells = <0x00000000>;
+            phandle = <0x00000004>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_realistic_base.dts b/tests/fdtaddon_realistic_base.dts
new file mode 100644
index 0000000..0c13f1a
--- /dev/null
+++ b/tests/fdtaddon_realistic_base.dts
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+
+/ {
+	conn_a_5v: regulator {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpios = <&gpio1 5 0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		i2c1: i2c@1000 {
+			compatible = "xyz,i2c-controller";
+			reg = <0x1000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		gpio1: gpio@2000 {
+			compatible = "xyz,gpio-controller";
+			reg = <0x2000 0x100>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>; /* interrupt-map usage */
+		};
+
+		gpio2: gpio@3000 {
+			compatible = "xyz,gpio-controller";
+			reg = <0x3000 0x100>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>; /* interrupt-map usage */
+		};
+	};
+
+	conn_a: connector-a {
+		compatible = "abc,foo-connector";
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		interrupt-map = <0 0     &gpio1 10 0>,
+				<0 0x100 &gpio1 10 0x100>,
+				<1 0     &gpio2 3 0>,
+				<1 0x100 &gpio2 3 0x100>;
+		#gpio-cells = <2>;
+		gpio-map-mask = <0xf 0x0>;
+		gpio-map-pass-thru = <0x0 0xf>;
+		gpio-map = <0 0 &gpio1 10 0>,
+			   <1 0 &gpio2 3 0>;
+
+		/export/ connector: &conn_a;
+		/export/ conn_i2c: &conn_a_i2c;
+		/export/ conn_5v: &conn_a_5v;
+
+		conn_a_i2c: conn-i2c {
+			compatible = "i2c-bus-extension";
+			i2c-parent = <&i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 69ca39e..a6213ab 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1242,6 +1242,20 @@ fdtaddon_tests() {
 
 	run_dtc_test -I dtb -O dts -o fdtaddon_stack_2nd-merged.dtb.dts fdtaddon_stack_2nd-merged.dtb
 	check_dts fdtaddon_stack_2nd-merged.dtb.dts
+
+	# More realistic dts and dtsa input files
+	run_dtc_test -I dts -O dtb -o fdtaddon_realistic_base.dtb "$SRCDIR/fdtaddon_realistic_base.dts"
+	check_dtb fdtaddon_realistic_base.dtb
+
+	run_dtc_test -I dts -O dtb -o fdtaddon_realistic_addon.dtba "$SRCDIR/fdtaddon_realistic_addon.dtsa"
+	check_dtb fdtaddon_realistic_addon.dtba
+
+	run_fdtaddon_test -i fdtaddon_realistic_base.dtb -o fdtaddon_realistic_addon-merged.dtb \
+			  -t "/connector-a" fdtaddon_realistic_addon.dtba
+	check_dtb fdtaddon_realistic_addon-merged.dtb
+
+	run_dtc_test -I dtb -O dts -o fdtaddon_realistic_addon-merged.dtb.dts fdtaddon_realistic_addon-merged.dtb
+	check_dts fdtaddon_realistic_addon-merged.dtb.dts
 }
 
 pylibfdt_tests () {
-- 
2.52.0

