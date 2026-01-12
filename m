Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B32EB841
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227727; cv=none; b=XZUlFjx+1/M1sd4We9b3O8M13LB9xs5muhinHtbMGe7f0xLn/2Gu5TqpnflyK0Z4sG9cBc9lOy+IImfisfPNe1/3WAeMIueu62Hb3I8bb/su4gvMLqvi48QzZmLIrtaS9Nhkg7h5CvGlXfZzOonkDzOSGU4YeeLZexPrdg8g9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227727; c=relaxed/simple;
	bh=cgsbGpr650vhAbxQnzhK3YmbGYPL57A3kTQjBjqeecI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjDTxRzDjmhrRVcPWiC7K/C6ZhI8EHA73RJTKnXcUSey5TJ9KFOlzczJvgVivYxI07vvW2M7cGXiNVebaJQfQnqVXHVeuNLF44KJOFDVljxsFJUuUjNRgjb5SBepjg7xpCFbK/WNHs6vbl/Vlf3X9HUKTfMeilnjKmD6ypjzU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p3D5geHJ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p3D5geHJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C1021C2086B;
	Mon, 12 Jan 2026 14:21:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 439AA606FA;
	Mon, 12 Jan 2026 14:22:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11454103C8C61;
	Mon, 12 Jan 2026 15:22:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227723; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Alu/YSztR2sY7lzG9eizkb540piqJA1gU9XBD5NQ508=;
	b=p3D5geHJNej93Rh8JkHGSWUmKkhprm/N02OR5jKHFJHIkpGWqlWRvGK22oXJLPgwg4UOvP
	BCJ2c0M431/xLJmx7PFf9bhsUZe/TeUe08upwmt9m4SUehF9kYCN8XkA5mP5by4w9Azrze
	5oOBqyXPK/xsAlnsbfodU17JiYimpFD4k3W/mpgO7F6xZpdKyGixmqOtILF5BLtoxzkEvv
	ShP9uwMDA0kwDFg8ej8LuH1ERvd1J2adgsuHZyrgUfIhhT45sDW4LYMRaY1IZjEHpc9KeB
	1WIXgvNmWJWRR5SzyWREpIRpQquJ9jLnVTcv0rJim8AwpdTfcT9+jMPKRXT4eQ==
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
Subject: [RFC PATCH 67/77] tests: metadata: Add a test for namespace labels references
Date: Mon, 12 Jan 2026 15:19:57 +0100
Message-ID: <20260112142009.1006236-68-herve.codina@bootlin.com>
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
index 0000000..111a746
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
index 0000000..5fceb61
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
+        // [FDT_REF_PHANDLE] ref0[0], ref = foo.x.y
+        ref1 = <0x0000000a 0xffffffff 0x00000014>;
+        // [FDT_REF_PHANDLE] ref1[4], ref = bar.other
+        ref2 = <0x00000001>;
+        // [FDT_REF_LOCAL] ref2[0]
+        ref3 = <0x00000001>;
+        // [FDT_REF_LOCAL] ref3[0]
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
index 0000000..51a17a9
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
index 0000000..94861c3
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
index a371377..4392752 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1129,7 +1129,8 @@ metadata_tests() {
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
2.52.0

