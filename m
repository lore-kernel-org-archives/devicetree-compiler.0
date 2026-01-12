Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2236AB42;
	Mon, 12 Jan 2026 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227723; cv=none; b=gwdjeDno7o1FuOx9MBqEPvmJEzen1USaN3g0gDBAf+dZOCfEsO5MuR6YRUVQ1JqA5OE0H9R7EjzBYpx4HK1SAVs7Z/GVX9pAqAaWuZCc66T5pjV6mzg4tBCKvUxHdWssxQ3/4UtbtEMLBlqIXYV+Rugc/gKLUZrI0qI3K4B+5j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227723; c=relaxed/simple;
	bh=rK1ZcaZmBbXCSSt1XxWv9W9a2SVisNF0mjPNBoGR07k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3pWEmuAj2Sdl0QRadp5iJ3q14zoYzBLUzopxUgB2a4/AbQDlr3dh2zCkt90N7DCoQcGXNs478PLFZXZ1rNIopE5HtiXn24TJ14xO2AOg3pcPJsvvW4arz4fpWh2D7uR4dYI0sxw4wVCh0iJOijwx0v9Js3u1ND34HAgbHEjsco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EuN5Fakk; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EuN5Fakk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C1CD4E42094;
	Mon, 12 Jan 2026 14:22:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 030CD606FA;
	Mon, 12 Jan 2026 14:22:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBD43103C8CD8;
	Mon, 12 Jan 2026 15:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227720; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FsyA8Thd/0g5Sni0FrJIXg1W4AOtqLdlEbFPH+WugoE=;
	b=EuN5FakkGTML/LcGys1WJ57HfNVhKljk/KA6vRS9lcIkWQ0VECJbTik7+k/oDZQvxFhHx4
	kKsiu1580QRAizlJmrBMpPAC8hdY/X0wSatSLgL3tAIYwx8whY+WmbZeF/llW6zOS0QgW/
	RIY9ioAFgXw5mRTCMBpatfvU7KY04/TJlAvN5dCAb5sUbY3zpPQdu+fBKJCdOwdAe4H0gR
	JkZ0Pox3eTQ8ZQYgn0EFdTvh7l15n8Q23de2aEumdKpdP2chDImBLT+xlnnSWCEzzKOHMU
	xvpq3QVHxSjJ5d/xd4G5tmPLG7dIvKvFlw7be7b+Qh3R/XpJpwzuK3vzi/aSbw==
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
Subject: [RFC PATCH 65/77] tests: metadata: Add a test for references by path involving orphan nodes
Date: Mon, 12 Jan 2026 15:19:55 +0100
Message-ID: <20260112142009.1006236-66-herve.codina@bootlin.com>
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

The syntax '&{$<orphan_name>/<path>}' allows to reference by path a node
that belongs to an orphan node.

Add a test related to this kind of references.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../metadata_addon_references.dtb.dts.expect  | 48 +++++++++++++++++++
 tests/metadata_addon_references.dtb.expect    | 48 +++++++++++++++++++
 tests/metadata_addon_references.dts           | 43 +++++++++++++++++
 .../metadata_addon_references.dts.dts.expect  | 48 +++++++++++++++++++
 tests/run_tests.sh                            |  2 +-
 5 files changed, 188 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_references.dtb.dts.expect
 create mode 100644 tests/metadata_addon_references.dtb.expect
 create mode 100644 tests/metadata_addon_references.dts
 create mode 100644 tests/metadata_addon_references.dts.dts.expect

diff --git a/tests/metadata_addon_references.dtb.dts.expect b/tests/metadata_addon_references.dtb.dts.expect
new file mode 100644
index 0000000..267a929
--- /dev/null
+++ b/tests/metadata_addon_references.dtb.dts.expect
@@ -0,0 +1,48 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	sub-node {
+		ref1-base1 = <&base1>;
+		ref2-base1-addon-node = <&{$base1/addon-node}>;
+		ref3-base1-addon-node = <&{$base1/addon-node}>;
+		ref4-base1-addon-node = <&{$base1/addon-node}>;
+		ref5-base3 = <&{$base3}>;
+		ref6-base3 = <&{$base3}>;
+		ref7-base3-subsubnode = <&{$base3/sub-node/sub-subnode}>;
+		phandle = <0x04>;
+	};
+};
+
+&base1 {
+
+	addon-node {
+		prop = <0x02>;
+		phandle = <0x01>;
+	};
+};
+
+&base2 {
+
+	addon-node1 {
+		ref-base1-addon-node = <&{$base1/addon-node}>;
+	};
+
+	addon-node2 {
+		ref-root-sub-node = <&{/sub-node}>;
+	};
+};
+
+&base3 {
+	phandle = <0x02>;
+
+	sub-node {
+		prop = <0x03>;
+
+		sub-subnode {
+			prop = <0x04>;
+			phandle = <0x03>;
+		};
+	};
+};
diff --git a/tests/metadata_addon_references.dtb.expect b/tests/metadata_addon_references.dtb.expect
new file mode 100644
index 0000000..d8db6cb
--- /dev/null
+++ b/tests/metadata_addon_references.dtb.expect
@@ -0,0 +1,48 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    sub-node {
+        ref1-base1 = <0xffffffff>;
+        // [FDT_REF_PHANDLE] ref1-base1[0], ref = base1
+        ref2-base1-addon-node = <0x00000001>;
+        // [FDT_REF_LOCAL] ref2-base1-addon-node[0]
+        ref3-base1-addon-node = <0x00000001>;
+        // [FDT_REF_LOCAL] ref3-base1-addon-node[0]
+        ref4-base1-addon-node = <0x00000001>;
+        // [FDT_REF_LOCAL] ref4-base1-addon-node[0]
+        ref5-base3 = <0x00000002>;
+        // [FDT_REF_LOCAL] ref5-base3[0]
+        ref6-base3 = <0x00000002>;
+        // [FDT_REF_LOCAL] ref6-base3[0]
+        ref7-base3-subsubnode = <0x00000003>;
+        // [FDT_REF_LOCAL] ref7-base3-subsubnode[0]
+        phandle = <0x00000004>;
+    };
+};
+&base1 {
+    addon-node {
+        prop = <0x00000002>;
+        phandle = <0x00000001>;
+    };
+};
+&base2 {
+    addon-node1 {
+        ref-base1-addon-node = <0x00000001>;
+        // [FDT_REF_LOCAL] ref-base1-addon-node[0]
+    };
+    addon-node2 {
+        ref-root-sub-node = <0x00000004>;
+        // [FDT_REF_LOCAL] ref-root-sub-node[0]
+    };
+};
+&base3 {
+    phandle = <0x00000002>;
+    sub-node {
+        prop = <0x00000003>;
+        sub-subnode {
+            prop = <0x00000004>;
+            phandle = <0x00000003>;
+        };
+    };
+};
diff --git a/tests/metadata_addon_references.dts b/tests/metadata_addon_references.dts
new file mode 100644
index 0000000..239c141
--- /dev/null
+++ b/tests/metadata_addon_references.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/ {
+	sub_node: sub-node {
+		ref1-base1 = <&base1>;
+		ref2-base1-addon-node = <&b1_addon>;
+		ref3-base1-addon-node = <&{$base1/addon-node}>;
+		ref4-base1-addon-node = <&{$base1/addon-node/}>;
+		ref5-base3 = <&{$base3}>;
+		ref6-base3 = <&{$base3/}>;
+		ref7-base3-subsubnode = <&{$base3/sub-node/sub-subnode}>;
+	};
+};
+
+&base1 {
+	b1_addon: addon-node {
+		prop = <2>;
+	};
+};
+
+&base2 {
+	addon-node1 {
+		ref-base1-addon-node = <&b1_addon>;
+	};
+	addon-node2 {
+		ref-root-sub-node = <&sub_node>;
+	};
+};
+
+&base3 {
+	sub-node {
+		prop = <3>;
+		sub-subnode {
+			prop = <4>;
+		};
+	};
+};
diff --git a/tests/metadata_addon_references.dts.dts.expect b/tests/metadata_addon_references.dts.dts.expect
new file mode 100644
index 0000000..dff893e
--- /dev/null
+++ b/tests/metadata_addon_references.dts.dts.expect
@@ -0,0 +1,48 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	sub_node: sub-node {
+		ref1-base1 = <&base1>;
+		ref2-base1-addon-node = <&b1_addon>;
+		ref3-base1-addon-node = <&{$base1/addon-node}>;
+		ref4-base1-addon-node = <&{$base1/addon-node/}>;
+		ref5-base3 = <&{$base3}>;
+		ref6-base3 = <&{$base3/}>;
+		ref7-base3-subsubnode = <&{$base3/sub-node/sub-subnode}>;
+		phandle = <0x04>;
+	};
+};
+
+&base1 {
+
+	b1_addon: addon-node {
+		prop = <0x02>;
+		phandle = <0x01>;
+	};
+};
+
+&base2 {
+
+	addon-node1 {
+		ref-base1-addon-node = <&b1_addon>;
+	};
+
+	addon-node2 {
+		ref-root-sub-node = <&sub_node>;
+	};
+};
+
+&base3 {
+	phandle = <0x02>;
+
+	sub-node {
+		prop = <0x03>;
+
+		sub-subnode {
+			prop = <0x04>;
+			phandle = <0x03>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 12418bf..a371377 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1129,7 +1129,7 @@ metadata_tests() {
 		  metadata_addon_base metadata_exportsyms_local \
 		  metadata_exportsyms_ref metadata_importsyms \
 		  metadata_addon_orphan1 metadata_addon_orphan2 \
-		  metadata_addon_orphan3; do
+		  metadata_addon_orphan3 metadata_addon_references; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.52.0

