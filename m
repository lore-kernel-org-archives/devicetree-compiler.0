Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51884423E8F;
	Wed, 26 Aug 2026 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738070; cv=none; b=QmzjNyneCBGeDqFifDpAf/jlP7JR6ij/9BhIhtktbmTafYWOcT3ujHNuXPXW9aSIfU46bakuNCZtqaQulQPhvbP+5c+/kUrmaPv8Zm2itkbJE1oIfeAkynB1U4PdR3BDLPqfvqzaQBp/8UDcEFGoxnChLmGbhTO44Zxc+U48PVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738070; c=relaxed/simple;
	bh=MHnNR2pV7IRFuaKfOt2KHUASy69UhfvCkta9wVvsJgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqm1p+jRq9yORTXUhei6k5mVhimCLUcDsYvMbKMXm52+yZAFomdI+z67Xhb3fjJPAybUK1ndQUUeVzRYEn8sqYZrINX9Z/hCMYW770iFJQsm8YCzgFUhH1tWiW0I97srX1FrVeXfkGjKzGYpPKHzJCAc9k0t2zc48j64NahUL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pbXcjOg3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pbXcjOg3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0EE944E413BC;
	Wed, 26 Aug 2026 09:54:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0674604EC;
	Wed, 26 Aug 2026 09:54:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A52C11C7AD68;
	Wed, 26 Aug 2026 11:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738061; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9pMDiGyCLLstUmB3wiJhwi2oHDjtrJbG23U6ozFYFFY=;
	b=pbXcjOg3Y+8LHn26vgpi2xGfR9R6lorLxaUd+uJHnUysTNGUlox7nCvVwPu7KRLwlWPGDP
	ZqLb5ZPZu76QawjIVZyhHG2/YnW7P6Aa6bMIuPCXidbyP/h9/9ltbi0Cd7CdX+K8iP1qKr
	5kdOsDrs8f7r3nsGYhkyuc6fDsvX/8811PwQFQ0mamj755aWFQre0kYntYqk3oiYR6yyEL
	q9kjWbqH8WagvLCPBHTiOAF45Lft70GGwCLFC7bDb4QHsutgM3H0oLlAlSzsnToxGxyz2M
	Znnwd4S+JnwkBX//L6Xisvox8cNQ96KGAPktYovKQ+REWzvU3yyt/6tJFCyi8Q==
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
Subject: [RFC PATCH v2 70/74] tests: fdtaddon: Add a test for addons using namespace label references
Date: Wed, 26 Aug 2026 11:49:39 +0200
Message-ID: <20260826094950.1088288-71-herve.codina@bootlin.com>
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

Namespace label references are labels in the form &foo.bar.baz

Those kind of labels allow to 'jump' from node to node based on
exported symbols defined at each nodes.

Add a test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 ...ddon_addon_namespace-merged.dtb.dts.expect | 57 +++++++++++++++++++
 ...fdtaddon_addon_namespace-merged.dtb.expect | 49 ++++++++++++++++
 tests/fdtaddon_addon_namespace.dtba.expect    | 31 ++++++++++
 tests/fdtaddon_addon_namespace.dtsa           | 34 +++++++++++
 tests/fdtaddon_base_namespace.dtb.expect      | 29 ++++++++++
 tests/fdtaddon_base_namespace.dts             | 33 +++++++++++
 tests/run_tests.sh                            | 13 +++++
 7 files changed, 246 insertions(+)
 create mode 100644 tests/fdtaddon_addon_namespace-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_addon_namespace-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_namespace.dtba.expect
 create mode 100644 tests/fdtaddon_addon_namespace.dtsa
 create mode 100644 tests/fdtaddon_base_namespace.dtb.expect
 create mode 100644 tests/fdtaddon_base_namespace.dts

diff --git a/tests/fdtaddon_addon_namespace-merged.dtb.dts.expect b/tests/fdtaddon_addon_namespace-merged.dtb.dts.expect
new file mode 100644
index 00000000..ff0e5fff
--- /dev/null
+++ b/tests/fdtaddon_addon_namespace-merged.dtb.dts.expect
@@ -0,0 +1,57 @@
+/dts-v1/;
+
+/ {
+
+	other_n1 {
+		prop = <0x00>;
+		phandle = <0x05>;
+
+		/export/ a: &{/other-a};
+		/export/ b: &{/other-b};
+	};
+
+	other-a {
+		prop = <0x00>;
+		phandle = <0x01>;
+
+		addon-node-1a {
+			phandle = <0x06>;
+			prop = <0x1a>;
+		};
+	};
+
+	other-b {
+		prop = <0x00>;
+		phandle = <0x02>;
+
+		/export/ x: &{/other-x};
+	};
+
+	other-x {
+		prop = <0x00>;
+		phandle = <0x03>;
+
+		addon-node-1bx {
+			phandle = <0x07>;
+			prop = <0x1b>;
+		};
+	};
+
+	node {
+		compatible = "abc,aaa";
+		phandle = <0x04>;
+
+		/export/ node: &{/node};
+		/export/ n1: &{/other_n1};
+
+		addon-node2 {
+			ref-addon-n1bx = <&{/other-x/addon-node-1bx}>;
+			ref-n1bx = <&{/other-x}>;
+		};
+
+		addon-node1 {
+			ref-addon-n1a = <&{/other-a/addon-node-1a}>;
+			ref-n1a = <&{/other-a}>;
+		};
+	};
+};
diff --git a/tests/fdtaddon_addon_namespace-merged.dtb.expect b/tests/fdtaddon_addon_namespace-merged.dtb.expect
new file mode 100644
index 00000000..71edbba8
--- /dev/null
+++ b/tests/fdtaddon_addon_namespace-merged.dtb.expect
@@ -0,0 +1,49 @@
+/dts-v1/;
+
+/ {
+    other_n1 {
+        // [FDT_EXPORT_SYM] 'a' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'b' -> phandle 0x00000002
+        prop = <0x00000000>;
+        phandle = <0x00000005>;
+    };
+    other-a {
+        prop = <0x00000000>;
+        phandle = <0x00000001>;
+        addon-node-1a {
+            phandle = <0x00000006>;
+            prop = <0x0000001a>;
+        };
+    };
+    other-b {
+        // [FDT_EXPORT_SYM] 'x' -> phandle 0x00000003
+        prop = <0x00000000>;
+        phandle = <0x00000002>;
+    };
+    other-x {
+        prop = <0x00000000>;
+        phandle = <0x00000003>;
+        addon-node-1bx {
+            phandle = <0x00000007>;
+            prop = <0x0000001b>;
+        };
+    };
+    node {
+        // [FDT_EXPORT_SYM] 'node' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'n1' -> phandle 0x00000005
+        compatible = "abc,aaa";
+        phandle = <0x00000004>;
+        addon-node2 {
+            ref-addon-n1bx = <0x00000007>;
+            // [FDT_PROPDATA_PHANDLE] ref-addon-n1bx[0]
+            ref-n1bx = <0x00000003>;
+            // [FDT_PROPDATA_PHANDLE] ref-n1bx[0]
+        };
+        addon-node1 {
+            ref-addon-n1a = <0x00000006>;
+            // [FDT_PROPDATA_PHANDLE] ref-addon-n1a[0]
+            ref-n1a = <0x00000001>;
+            // [FDT_PROPDATA_PHANDLE] ref-n1a[0]
+        };
+    };
+};
diff --git a/tests/fdtaddon_addon_namespace.dtba.expect b/tests/fdtaddon_addon_namespace.dtba.expect
new file mode 100644
index 00000000..ec1090b5
--- /dev/null
+++ b/tests/fdtaddon_addon_namespace.dtba.expect
@@ -0,0 +1,31 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'node' (abc,aaa)
+// [FDT_IMPORT_SYM] 'n1' ()
+&node {
+    addon-node1 {
+        ref-n1a = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref-n1a[0], ref = n1.a
+        ref-addon-n1a = <0x00000001>;
+        // [FDT_PROPDATA_PHANDLE] ref-addon-n1a[0]
+    };
+    addon-node2 {
+        ref-n1bx = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref-n1bx[0], ref = n1.b.x
+        ref-addon-n1bx = <0x00000002>;
+        // [FDT_PROPDATA_PHANDLE] ref-addon-n1bx[0]
+    };
+};
+&n1.a {
+    addon-node-1a {
+        prop = <0x0000001a>;
+        phandle = <0x00000001>;
+    };
+};
+&n1.b.x {
+    addon-node-1bx {
+        prop = <0x0000001b>;
+        phandle = <0x00000002>;
+    };
+};
diff --git a/tests/fdtaddon_addon_namespace.dtsa b/tests/fdtaddon_addon_namespace.dtsa
new file mode 100644
index 00000000..8c25d3d4
--- /dev/null
+++ b/tests/fdtaddon_addon_namespace.dtsa
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ node: "abc,aaa";
+/import/ n1: "";
+
+&node {
+	addon-node1 {
+		ref-n1a = <&n1.a>;
+		ref-addon-n1a = <&addon_n1a>;
+	};
+
+	addon-node2 {
+		ref-n1bx = <&n1.b.x>;
+		ref-addon-n1bx = <&addon_n1bx>;
+	};
+};
+
+&n1.a {
+	addon_n1a: addon-node-1a {
+		prop = <0x1a>;
+	};
+};
+
+&n1.b.x {
+	addon_n1bx: addon-node-1bx {
+		prop = <0x1b>;
+	};
+};
diff --git a/tests/fdtaddon_base_namespace.dtb.expect b/tests/fdtaddon_base_namespace.dtb.expect
new file mode 100644
index 00000000..879c4550
--- /dev/null
+++ b/tests/fdtaddon_base_namespace.dtb.expect
@@ -0,0 +1,29 @@
+/dts-v1/;
+
+/ {
+    other_n1 {
+        // [FDT_EXPORT_SYM] 'a' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'b' -> phandle 0x00000002
+        prop = <0x00000000>;
+        phandle = <0x00000005>;
+    };
+    other-a {
+        prop = <0x00000000>;
+        phandle = <0x00000001>;
+    };
+    other-b {
+        // [FDT_EXPORT_SYM] 'x' -> phandle 0x00000003
+        prop = <0x00000000>;
+        phandle = <0x00000002>;
+    };
+    other-x {
+        prop = <0x00000000>;
+        phandle = <0x00000003>;
+    };
+    node {
+        // [FDT_EXPORT_SYM] 'node' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'n1' -> phandle 0x00000005
+        compatible = "abc,aaa";
+        phandle = <0x00000004>;
+    };
+};
diff --git a/tests/fdtaddon_base_namespace.dts b/tests/fdtaddon_base_namespace.dts
new file mode 100644
index 00000000..e2bc4f04
--- /dev/null
+++ b/tests/fdtaddon_base_namespace.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+
+/ {
+	n1: other_n1 {
+		prop = <0>;
+		/export/ a: &other_a;
+		/export/ b: &other_b;
+	};
+
+	other_a: other-a {
+		prop = <0>;
+	};
+
+	other_b: other-b {
+		prop = <0>;
+		/export/ x: &other_x;
+	};
+
+	other_x: other-x {
+		prop = <0>;
+	};
+
+	node: node {
+		compatible = "abc,aaa";
+		/export/ node: &node;
+		/export/ n1: &n1;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0182dffc..8f8db608 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1334,6 +1334,19 @@ fdtaddon_tests() {
 			  -t "/base-node" fdtaddon_addon_prop_existing_ok.dtba
 	check_dtb fdtaddon_addon_prop_existing_ok-merged.dtb
 
+	# Test namespace label reference
+	run_dtc_test -I dts -O dtb -o fdtaddon_base_namespace.dtb "$SRCDIR/fdtaddon_base_namespace.dts"
+	check_dtb fdtaddon_base_namespace.dtb
+
+	run_dtc_test -I dts -O dtb -o fdtaddon_addon_namespace.dtba "$SRCDIR/fdtaddon_addon_namespace.dtsa"
+	check_dtb fdtaddon_addon_namespace.dtba
+
+	run_fdtaddon_test -i fdtaddon_base_namespace.dtb -o fdtaddon_addon_namespace-merged.dtb \
+			  -t "/node" fdtaddon_addon_namespace.dtba
+	check_dtb fdtaddon_addon_namespace-merged.dtb
+
+	run_dtc_test -I dtb -O dts -o fdtaddon_addon_namespace-merged.dtb.dts fdtaddon_addon_namespace-merged.dtb
+	check_dts fdtaddon_addon_namespace-merged.dtb.dts
 }
 
 pylibfdt_tests () {
-- 
2.55.0

