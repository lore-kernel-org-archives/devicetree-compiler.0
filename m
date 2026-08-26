Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2683DC4D7;
	Wed, 26 Aug 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738083; cv=none; b=OL60er2dwzHPpt+VFFc0b9HFBkvGF6TNkFaWtG+6a9RkO7AfRuuLDWpnz+eHQI2CYfplHMCeH3w5RhjEI1Z0yxNBvJ6+Xun+LSzH6h0mHeZvLYH3MDd3jVADhQ22BEEowSd9eYEdHMGO760dqCdnwNi3CHMXYAO40FvD6D2oeDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738083; c=relaxed/simple;
	bh=pp5pjzLX3R8XOg5YTjbFX9Po5TABtKJyKr+u38ZyZ2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=el9XXhn9dCap2Wx9hHgXxloxIEcISRo5ZH0mu+1n+301+pemdYAL7kiPMVLa/1PcYye+UpLVcDND0LIB3Ygq4ASDejLaOhdvvt5xQ3fWQt2ykiaGAAGUHZZ4hqfVBurN6QwQy8QkJDVzYRkHIFG9I21Q/bpXUj/BIGyxG/4Tbw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mkNwUxHv; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mkNwUxHv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 717141A0E1B;
	Wed, 26 Aug 2026 09:54:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46AB1604EC;
	Wed, 26 Aug 2026 09:54:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDDFB11C7AD65;
	Wed, 26 Aug 2026 11:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738074; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ujcA+q4BrF2Wbd9qcs7qyevIb+7xSXGR94mEhO/DkHI=;
	b=mkNwUxHvVs9+rqUJiHf72IjMyBablap8oMwLnkTLL5ksYq9RAbxAymmUbCAqGgiA3zyrpk
	ZGFQiUsmYmhRvgjQ0twtUdVmA9RCWOJ6MoHTsEX2dgJ/Xpm3DtNUPaFWlRsrIe/arkLtw+
	zPzjMNwRH+sG8S9tgtwiA/lS1nGIQUi7GacikdUmIwqX0DNWNy3t5vtydZd+eun5KO+dB/
	cF/rv4bmJ4iWpvqlqynr0NHUs01NxRXhX1272w9gVBoW8+xUUY2ERV2avBCIbgxVQgA7lD
	AW2aTYKK5hNYDAFiPEzf2ROI5DtyvBMkeD4D8FJwSeCWVSq90jjiRQRA91MB/g==
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
Subject: [RFC PATCH v2 72/74] tests: fdtaddon: Add a test using more realistic dts and dtsa
Date: Wed, 26 Aug 2026 11:49:41 +0200
Message-ID: <20260826094950.1088288-73-herve.codina@bootlin.com>
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
index 00000000..49aa9500
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
index 00000000..54f47a1c
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
+        // [FDT_PROPDATA_PHANDLE] gpios[0]
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
+        // [FDT_EXPORT_SYM] 'connector' -> phandle 0x00000003
+        // [FDT_EXPORT_SYM] 'conn_i2c' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'conn_5v' -> phandle 0x00000005
+        compatible = "abc,foo-connector";
+        #address-cells = <0x00000000>;
+        #interrupt-cells = <0x00000002>;
+        interrupt-map = <0x00000000 0x00000000 0x00000001 0x0000000a 0x00000000 0x00000000 0x00000100 0x00000001 0x0000000a 0x00000100 0x00000001 0x00000000 0x00000002 0x00000003 0x00000000 0x00000001 0x00000100 0x00000002 0x00000003 0x00000100>;
+        // [FDT_PROPDATA_PHANDLE] interrupt-map[8]
+        // [FDT_PROPDATA_PHANDLE] interrupt-map[28]
+        // [FDT_PROPDATA_PHANDLE] interrupt-map[48]
+        // [FDT_PROPDATA_PHANDLE] interrupt-map[68]
+        #gpio-cells = <0x00000002>;
+        gpio-map-mask = <0x0000000f 0x00000000>;
+        gpio-map-pass-thru = <0x00000000 0x0000000f>;
+        gpio-map = <0x00000000 0x00000000 0x00000001 0x0000000a 0x00000000 0x00000001 0x00000000 0x00000002 0x00000003 0x00000000>;
+        // [FDT_PROPDATA_PHANDLE] gpio-map[8]
+        // [FDT_PROPDATA_PHANDLE] gpio-map[28]
+        phandle = <0x00000003>;
+        conn-i2c {
+            compatible = "i2c-bus-extension";
+            i2c-parent = <0x00000006>;
+            // [FDT_PROPDATA_PHANDLE] i2c-parent[0]
+            #address-cells = <0x00000001>;
+            #size-cells = <0x00000000>;
+            phandle = <0x00000004>;
+            eeprom@51 {
+                reg = <0x00000051>;
+                compatible = "xxx,eeprom";
+            };
+            gpio@23 {
+                reset-gpios = <0x00000003 0x00000001 0x00000000>;
+                // [FDT_PROPDATA_PHANDLE] reset-gpios[0]
+                vcc2-supply = <0x00000005>;
+                // [FDT_PROPDATA_PHANDLE] vcc2-supply[0]
+                vcc1-supply = <0x00000005>;
+                // [FDT_PROPDATA_PHANDLE] vcc1-supply[0]
+                #interrupt-cells = <0x00000002>;
+                interrupt-controller;
+                interrupts = <0x00000000 0x00000100>;
+                interrupt-parent = <0x00000003>;
+                // [FDT_PROPDATA_PHANDLE] interrupt-parent[0]
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
index 00000000..eeef4d43
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
+            // [FDT_PROPDATA_PHANDLE_REF] interrupt-parent[0], ref = connector
+            interrupts = <0x00000000 0x00000100>;
+            interrupt-controller;
+            #interrupt-cells = <0x00000002>;
+            vcc1-supply = <0xffffffff>;
+            // [FDT_PROPDATA_PHANDLE_REF] vcc1-supply[0], ref = conn_5v
+            vcc2-supply = <0xffffffff>;
+            // [FDT_PROPDATA_PHANDLE_REF] vcc2-supply[0], ref = connector.conn_5v
+            reset-gpios = <0xffffffff 0x00000001 0x00000000>;
+            // [FDT_PROPDATA_PHANDLE_REF] reset-gpios[0], ref = connector
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
index 00000000..255a1ffc
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
index 00000000..9addbbd8
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
+        // [FDT_PROPDATA_PHANDLE] gpios[0]
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
+        // [FDT_EXPORT_SYM] 'connector' -> phandle 0x00000003
+        // [FDT_EXPORT_SYM] 'conn_i2c' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'conn_5v' -> phandle 0x00000005
+        compatible = "abc,foo-connector";
+        #address-cells = <0x00000000>;
+        #interrupt-cells = <0x00000002>;
+        interrupt-map = <0x00000000 0x00000000 0x00000001 0x0000000a 0x00000000 0x00000000 0x00000100 0x00000001 0x0000000a 0x00000100 0x00000001 0x00000000 0x00000002 0x00000003 0x00000000 0x00000001 0x00000100 0x00000002 0x00000003 0x00000100>;
+        // [FDT_PROPDATA_PHANDLE] interrupt-map[8]
+        // [FDT_PROPDATA_PHANDLE] interrupt-map[28]
+        // [FDT_PROPDATA_PHANDLE] interrupt-map[48]
+        // [FDT_PROPDATA_PHANDLE] interrupt-map[68]
+        #gpio-cells = <0x00000002>;
+        gpio-map-mask = <0x0000000f 0x00000000>;
+        gpio-map-pass-thru = <0x00000000 0x0000000f>;
+        gpio-map = <0x00000000 0x00000000 0x00000001 0x0000000a 0x00000000 0x00000001 0x00000000 0x00000002 0x00000003 0x00000000>;
+        // [FDT_PROPDATA_PHANDLE] gpio-map[8]
+        // [FDT_PROPDATA_PHANDLE] gpio-map[28]
+        phandle = <0x00000003>;
+        conn-i2c {
+            compatible = "i2c-bus-extension";
+            i2c-parent = <0x00000006>;
+            // [FDT_PROPDATA_PHANDLE] i2c-parent[0]
+            #address-cells = <0x00000001>;
+            #size-cells = <0x00000000>;
+            phandle = <0x00000004>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_realistic_base.dts b/tests/fdtaddon_realistic_base.dts
new file mode 100644
index 00000000..0c13f1af
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
index d634274d..664ebf5d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1368,6 +1368,20 @@ fdtaddon_tests() {
 
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
2.55.0

