Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A0136CDF7
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227740; cv=none; b=dQiTlRTdpIXUnES90RQP9FsJgimvxKAIOR/MIII6vPkN5FlKdqRajh1YfyJ1v8XSCZAErA73R20bXyqrsU7MJ/R5UrwyUd+OYeeSz1ITuOPM+BcZOoP0aJG0przO5HCU9KjzgWz1CG42uduR/R1qpHBgyBUfYmPJ5po3jw9ReR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227740; c=relaxed/simple;
	bh=5ZIAcw63WtQiQvwWK/rR4xVJc5sTLEfbXhPg9Xdcbcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UhU+NuEpXCtxcTKR/hY2kRppRwLjMA9NECSEelkxDIeFjfKv83Q8wscPYiUk07Bdo9mf5tddy40EFc7jrOqEd5DCwIU+gdv+QzShw+daYr+1nP8MHX/ctq9FasVrl3inyqnxewhc6hfEbtk2Dv5713PPRUiQ28P/JCfUqexAH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=li5/YBmg; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="li5/YBmg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4EC411A2810;
	Mon, 12 Jan 2026 14:22:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26306606FA;
	Mon, 12 Jan 2026 14:22:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E21DE103C9260;
	Mon, 12 Jan 2026 15:22:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227736; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OTUh/xyZWCcTuN2OhcptvNCMGXB7wKDCYNquNTS0gLs=;
	b=li5/YBmgTqARP3FNS8i2gEUSyQ0v4MFmbCR4/u69+SU2t/W2ojHVFuWKd7a7O8DA++ET6G
	pajUHJG2DvD0EwZpefyDlxwtWUx4miHphgeLnnzwljSoTxbJix8AWtfb+gUw/GUlTMTUQd
	Z5BDW63g/F/+YEll414Y1xS+tK9GOIMi8MD/nUXl/ElUuOq1moc8o3K7ObmWJ64G+oNKwQ
	B5GJuB8vceIAxbH2xHzzQkoaIl1j/cz3CQxY6UjHmJ3x8omAzCzn71+RO8KBX/gvpeWMIY
	3yBsm8LLDvznmcgnS2oI7ussEW4IlS92JmkcxxUjnw/wjAiZRtrLesmPS9eoug==
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
Subject: [RFC PATCH 75/77] tests: fdtaddon: Add a test for addons using namespace label references
Date: Mon, 12 Jan 2026 15:20:05 +0100
Message-ID: <20260112142009.1006236-76-herve.codina@bootlin.com>
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
 tests/run_tests.sh                            | 14 +++++
 7 files changed, 247 insertions(+)
 create mode 100644 tests/fdtaddon_addon_namespace-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_addon_namespace-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_namespace.dtba.expect
 create mode 100644 tests/fdtaddon_addon_namespace.dtsa
 create mode 100644 tests/fdtaddon_base_namespace.dtb.expect
 create mode 100644 tests/fdtaddon_base_namespace.dts

diff --git a/tests/fdtaddon_addon_namespace-merged.dtb.dts.expect b/tests/fdtaddon_addon_namespace-merged.dtb.dts.expect
new file mode 100644
index 0000000..ff0e5ff
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
index 0000000..947a088
--- /dev/null
+++ b/tests/fdtaddon_addon_namespace-merged.dtb.expect
@@ -0,0 +1,49 @@
+/dts-v1/;
+
+/ {
+    other_n1 {
+        prop = <0x00000000>;
+        phandle = <0x00000005>;
+        // [FDT_EXPORT_SYM] 'a' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'b' -> phandle 0x00000002
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
+        prop = <0x00000000>;
+        phandle = <0x00000002>;
+        // [FDT_EXPORT_SYM] 'x' -> phandle 0x00000003
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
+        compatible = "abc,aaa";
+        phandle = <0x00000004>;
+        // [FDT_EXPORT_SYM] 'node' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'n1' -> phandle 0x00000005
+        addon-node2 {
+            ref-addon-n1bx = <0x00000007>;
+            // [FDT_REF_LOCAL] ref-addon-n1bx[0]
+            ref-n1bx = <0x00000003>;
+            // [FDT_REF_LOCAL] ref-n1bx[0]
+        };
+        addon-node1 {
+            ref-addon-n1a = <0x00000006>;
+            // [FDT_REF_LOCAL] ref-addon-n1a[0]
+            ref-n1a = <0x00000001>;
+            // [FDT_REF_LOCAL] ref-n1a[0]
+        };
+    };
+};
diff --git a/tests/fdtaddon_addon_namespace.dtba.expect b/tests/fdtaddon_addon_namespace.dtba.expect
new file mode 100644
index 0000000..426bfe0
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
+        // [FDT_REF_PHANDLE] ref-n1a[0], ref = n1.a
+        ref-addon-n1a = <0x00000001>;
+        // [FDT_REF_LOCAL] ref-addon-n1a[0]
+    };
+    addon-node2 {
+        ref-n1bx = <0xffffffff>;
+        // [FDT_REF_PHANDLE] ref-n1bx[0], ref = n1.b.x
+        ref-addon-n1bx = <0x00000002>;
+        // [FDT_REF_LOCAL] ref-addon-n1bx[0]
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
index 0000000..8c25d3d
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
index 0000000..8383ab0
--- /dev/null
+++ b/tests/fdtaddon_base_namespace.dtb.expect
@@ -0,0 +1,29 @@
+/dts-v1/;
+
+/ {
+    other_n1 {
+        prop = <0x00000000>;
+        phandle = <0x00000005>;
+        // [FDT_EXPORT_SYM] 'a' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'b' -> phandle 0x00000002
+    };
+    other-a {
+        prop = <0x00000000>;
+        phandle = <0x00000001>;
+    };
+    other-b {
+        prop = <0x00000000>;
+        phandle = <0x00000002>;
+        // [FDT_EXPORT_SYM] 'x' -> phandle 0x00000003
+    };
+    other-x {
+        prop = <0x00000000>;
+        phandle = <0x00000003>;
+    };
+    node {
+        compatible = "abc,aaa";
+        phandle = <0x00000004>;
+        // [FDT_EXPORT_SYM] 'node' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'n1' -> phandle 0x00000005
+    };
+};
diff --git a/tests/fdtaddon_base_namespace.dts b/tests/fdtaddon_base_namespace.dts
new file mode 100644
index 0000000..e2bc4f0
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
index 65b1abe..2cdfd89 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1207,6 +1207,20 @@ fdtaddon_tests() {
 		run_dtc_test -I dtb -O dts -o $dt-merged2.dtb.dts $dt-merged2.dtb
 		check_dts $dt-merged2.dtb.dts
 	done
+
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
2.52.0

