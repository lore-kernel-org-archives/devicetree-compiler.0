Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD53DA7DB
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738029; cv=none; b=sZIquMpYzLcM6oSPHtATD5SbjIi2ckTTS+9e+FFEYykbnOWgv6qcILFXslN9g2IHAByosyKpN216bR8JdeCLQw+3vuBNDCq348sVqTOQ3EYADuWhVskMndHdDeS6Ox8zu9yfn1dZpyz72YL0pMpIveMw2l97UR3fhoGxsUq3XGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738029; c=relaxed/simple;
	bh=JPCB9M7KbROlMOvoQzAisGzc0NB3d9rM2Ty8NaZ2Kz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AiMYzPITNZ6dbF00ca1463w8WUBUHvgwAxLCZBOTaLyy6SUh5PbAFGanzFEEgZuf/TSvt0VgEflo3crz3dHzaIEu/URc2sgL9R8vA1wr7Uu8aSWxCH/x3asH7G7n6OrVpLcSzMMbLorq0eOYqzsEMStCx50Y8t5M1nwZhH5U3dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WxGYnUkX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WxGYnUkX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 966474E413BC;
	Wed, 26 Aug 2026 09:53:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AB8B604EC;
	Wed, 26 Aug 2026 09:53:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 307E911C7AD65;
	Wed, 26 Aug 2026 11:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738025; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hrpktcQ0qyyNHgm6W4k1YNG5kh8x30F9bbqoltA7bW4=;
	b=WxGYnUkXqJBXzR0X6sW0SEvd4vQaLr8O6T3ZBr/z84wDow5i60+GIa34TKUNxtveAmw+uS
	ukXh1Ik550wvBp61K7DJABoDUnjXQcx6/2qvIuR4Vohqp1ofXJv0IssuehioXzztLs80uz
	hXMQ5cPNkG2DxD0fatkmTuUOAARxCGrK3UNPqcN8KtOLfU37GK9OIuM8PsUev5G6j7/gBu
	osc18lG2N1gmCof67jB44vSiXEVQuboJrQfav+0wBADtbLGtlPg93xddS0a9uOA4J5HuWM
	57lKZe3woUhcqVCW6+pIXbVCfz4KpruEz6jJqgD6jDXY8+pMvo8id3eEseoEsw==
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
Subject: [RFC PATCH v2 62/74] tests: metadata: Add a test for namespace labels references
Date: Wed, 26 Aug 2026 11:49:31 +0200
Message-ID: <20260826094950.1088288-63-herve.codina@bootlin.com>
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

Namespace labels references are references in the form '&foo.bar.baz'.

Support for namespace labels references has been recently added to dtc.

Add a test related to this kind of references.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 ...metadata_addon_refnamespace.dtb.dts.expect | 32 ++++++++++++++++
 tests/metadata_addon_refnamespace.dtb.expect  | 29 ++++++++++++++
 tests/metadata_addon_refnamespace.dts         | 38 +++++++++++++++++++
 ...metadata_addon_refnamespace.dts.dts.expect | 32 ++++++++++++++++
 tests/run_tests.sh                            |  3 +-
 5 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_refnamespace.dtb.dts.expect
 create mode 100644 tests/metadata_addon_refnamespace.dtb.expect
 create mode 100644 tests/metadata_addon_refnamespace.dts
 create mode 100644 tests/metadata_addon_refnamespace.dts.dts.expect

diff --git a/tests/metadata_addon_refnamespace.dtb.dts.expect b/tests/metadata_addon_refnamespace.dtb.dts.expect
new file mode 100644
index 00000000..111a7462
--- /dev/null
+++ b/tests/metadata_addon_refnamespace.dtb.dts.expect
@@ -0,0 +1,32 @@
+/dts-v1/;
+/addon/;
+
+/import/ foo: "abc,foo";
+/import/ bar: "abc,bar";
+
+
+&foo.x {
+
+	addon-node {
+		ref0 = <&foo.x.y>;
+		ref1 = <0x0a &bar.other 0x14>;
+		ref2 = <&{$foo.x.y.z/addon-node}>;
+		ref3 = <&{$foo.x.y.z/addon-node}>;
+	};
+};
+
+&foo.x.y.z {
+
+	addon-node {
+		prop = <0x00>;
+		phandle = <0x01>;
+	};
+};
+
+&foo.x.y {
+
+	node {
+		prop1 = <0x01>;
+		prop2 = <0x02>;
+	};
+};
diff --git a/tests/metadata_addon_refnamespace.dtb.expect b/tests/metadata_addon_refnamespace.dtb.expect
new file mode 100644
index 00000000..8db63a1b
--- /dev/null
+++ b/tests/metadata_addon_refnamespace.dtb.expect
@@ -0,0 +1,29 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'foo' (abc,foo)
+// [FDT_IMPORT_SYM] 'bar' (abc,bar)
+&foo.x {
+    addon-node {
+        ref0 = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref0[0], ref = foo.x.y
+        ref1 = <0x0000000a 0xffffffff 0x00000014>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref1[4], ref = bar.other
+        ref2 = <0x00000001>;
+        // [FDT_PROPDATA_PHANDLE] ref2[0]
+        ref3 = <0x00000001>;
+        // [FDT_PROPDATA_PHANDLE] ref3[0]
+    };
+};
+&foo.x.y.z {
+    addon-node {
+        prop = <0x00000000>;
+        phandle = <0x00000001>;
+    };
+};
+&foo.x.y {
+    node {
+        prop1 = <0x00000001>;
+        prop2 = <0x00000002>;
+    };
+};
diff --git a/tests/metadata_addon_refnamespace.dts b/tests/metadata_addon_refnamespace.dts
new file mode 100644
index 00000000..51a17a9a
--- /dev/null
+++ b/tests/metadata_addon_refnamespace.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ foo: "abc,foo";
+/import/ bar: "abc,bar";
+
+
+&foo.x {
+	addon-node {
+		ref0 = <&foo.x.y>;
+		ref1 = <10 &bar.other 20>;
+		ref2 = <&addon_node>;
+		ref3 = <&{$foo.x.y.z/addon-node}>;
+	};
+};
+
+&foo.x.y.z {
+	addon_node: addon-node {
+		prop = <0>;
+	};
+};
+
+&foo.x.y {
+	node {
+		prop1 = <1>;
+	};
+};
+
+&foo.x.y {
+	node {
+		prop2 = <2>;
+	};
+};
diff --git a/tests/metadata_addon_refnamespace.dts.dts.expect b/tests/metadata_addon_refnamespace.dts.dts.expect
new file mode 100644
index 00000000..94861c3b
--- /dev/null
+++ b/tests/metadata_addon_refnamespace.dts.dts.expect
@@ -0,0 +1,32 @@
+/dts-v1/;
+/addon/;
+
+/import/ foo: "abc,foo";
+/import/ bar: "abc,bar";
+
+
+&foo.x {
+
+	addon-node {
+		ref0 = <&foo.x.y>;
+		ref1 = <0x0a &bar.other 0x14>;
+		ref2 = <&addon_node>;
+		ref3 = <&{$foo.x.y.z/addon-node}>;
+	};
+};
+
+&foo.x.y.z {
+
+	addon_node: addon-node {
+		prop = <0x00>;
+		phandle = <0x01>;
+	};
+};
+
+&foo.x.y {
+
+	node {
+		prop1 = <0x01>;
+		prop2 = <0x02>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 61a69fcb..7f47b685 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1252,7 +1252,8 @@ metadata_tests() {
 		  metadata_addon_base metadata_exportsyms_local \
 		  metadata_exportsyms_ref metadata_importsyms \
 		  metadata_addon_orphan1 metadata_addon_orphan2 \
-		  metadata_addon_orphan3 metadata_addon_references; do
+		  metadata_addon_orphan3 metadata_addon_references \
+		  metadata_addon_refnamespace; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.55.0

