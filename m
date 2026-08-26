Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5143DA7C4;
	Wed, 26 Aug 2026 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738024; cv=none; b=DUnYsLiHitpf2rduRbjhk53xyG37H/2dcIaZ0vfvWrK2pb8CuaCkFd8+EbmAy19kbUzDiGdcUrtvEDxdpLyJwVLjoWzeZgoLYZX9xTdpKcQln8oO4RKeRiXUerUykfmEIK5O1YBjWu4ZGQtNi+pRWTsqSq4qmQp56pCJOL9/5wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738024; c=relaxed/simple;
	bh=GMAAqiQdcU0tZ5idYyQng0vbUQ5u9Ntk7T0lIHMgajk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8J+3iUbS0CDaNSm5H33NrNHszS0awTTYndyCHOS5sCv0Ghw6a9QSwcduUgP8GLpWo+Tte8W8VrP/GxcHitX2WyWeuxPxPgKQLrCaV77OA/pU1/ttuOvPL4fZdkwQN3HX2NP7/uqDQ0Pvem1jM7rMSa/tH+jaU2Ei3b8USmd1N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E+ZRFYkT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E+ZRFYkT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E7C684E413BC;
	Wed, 26 Aug 2026 09:53:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBE6E604EC;
	Wed, 26 Aug 2026 09:53:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A37111C7AD65;
	Wed, 26 Aug 2026 11:53:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738019; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uYEYHzVamgMMqJiPZi+Ehy8nVDS2QRdmNXkGwIMFa24=;
	b=E+ZRFYkTPx99F5IkH7gVs1dVcV7PIVkpDJiesgMUa74WF0aGAY99jGLnQ9dmXFSjhJuATh
	5C8x/Miv52K9WsTZV1oJOMYFRcLw3R7PJ3UYQ5/sMHtwJyFVu1DbWrXHa5nyVSpLj03dIx
	gO1tkdyD4N96B8jaul5jS9TkU31Q0JYbMjNXb9NcjqyrM8Eee5wuMb5htPFoo0ol4m5gOB
	VDfmvU7kUsknWxbrR+vTHfA0AElv+vYE6be8s+DqA1zewW6VNR70miFdB3iFhkyiwlXmlo
	U+5W8DtvkFv638FCck3/ibrn9XS2m00NslUaNRv2RIQl8B66hb9HaJh0AdzRSw==
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
Subject: [RFC PATCH v2 60/74] tests: metadata: Add a test for references by path involving orphan nodes
Date: Wed, 26 Aug 2026 11:49:29 +0200
Message-ID: <20260826094950.1088288-61-herve.codina@bootlin.com>
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

The syntax '&{$<orphan_name>/<path>}' allows to reference by path a node
that belongs to an orphan node.

Add a test related to this kind of references.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../metadata_addon_references.dtb.dts.expect  | 47 +++++++++++++++++++
 tests/metadata_addon_references.dtb.expect    | 47 +++++++++++++++++++
 tests/metadata_addon_references.dts           | 43 +++++++++++++++++
 .../metadata_addon_references.dts.dts.expect  | 47 +++++++++++++++++++
 tests/run_tests.sh                            |  2 +-
 5 files changed, 185 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_references.dtb.dts.expect
 create mode 100644 tests/metadata_addon_references.dtb.expect
 create mode 100644 tests/metadata_addon_references.dts
 create mode 100644 tests/metadata_addon_references.dts.dts.expect

diff --git a/tests/metadata_addon_references.dtb.dts.expect b/tests/metadata_addon_references.dtb.dts.expect
new file mode 100644
index 00000000..ccd7c849
--- /dev/null
+++ b/tests/metadata_addon_references.dtb.dts.expect
@@ -0,0 +1,47 @@
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
+		ref5-base3 = <&base3>;
+		ref6-base3 = <&base3>;
+		ref7-base3-subsubnode = <&{$base3/sub-node/sub-subnode}>;
+		phandle = <0x03>;
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
+
+	sub-node {
+		prop = <0x03>;
+
+		sub-subnode {
+			prop = <0x04>;
+			phandle = <0x02>;
+		};
+	};
+};
diff --git a/tests/metadata_addon_references.dtb.expect b/tests/metadata_addon_references.dtb.expect
new file mode 100644
index 00000000..c58e3b2d
--- /dev/null
+++ b/tests/metadata_addon_references.dtb.expect
@@ -0,0 +1,47 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    sub-node {
+        ref1-base1 = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref1-base1[0], ref = base1
+        ref2-base1-addon-node = <0x00000001>;
+        // [FDT_PROPDATA_PHANDLE] ref2-base1-addon-node[0]
+        ref3-base1-addon-node = <0x00000001>;
+        // [FDT_PROPDATA_PHANDLE] ref3-base1-addon-node[0]
+        ref4-base1-addon-node = <0x00000001>;
+        // [FDT_PROPDATA_PHANDLE] ref4-base1-addon-node[0]
+        ref5-base3 = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref5-base3[0], ref = base3
+        ref6-base3 = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref6-base3[0], ref = base3
+        ref7-base3-subsubnode = <0x00000002>;
+        // [FDT_PROPDATA_PHANDLE] ref7-base3-subsubnode[0]
+        phandle = <0x00000003>;
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
+        // [FDT_PROPDATA_PHANDLE] ref-base1-addon-node[0]
+    };
+    addon-node2 {
+        ref-root-sub-node = <0x00000003>;
+        // [FDT_PROPDATA_PHANDLE] ref-root-sub-node[0]
+    };
+};
+&base3 {
+    sub-node {
+        prop = <0x00000003>;
+        sub-subnode {
+            prop = <0x00000004>;
+            phandle = <0x00000002>;
+        };
+    };
+};
diff --git a/tests/metadata_addon_references.dts b/tests/metadata_addon_references.dts
new file mode 100644
index 00000000..239c1416
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
index 00000000..47c30a1f
--- /dev/null
+++ b/tests/metadata_addon_references.dts.dts.expect
@@ -0,0 +1,47 @@
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
+		ref5-base3 = <&base3>;
+		ref6-base3 = <&base3>;
+		ref7-base3-subsubnode = <&{$base3/sub-node/sub-subnode}>;
+		phandle = <0x03>;
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
+
+	sub-node {
+		prop = <0x03>;
+
+		sub-subnode {
+			prop = <0x04>;
+			phandle = <0x02>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index ab09d745..61a69fcb 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1252,7 +1252,7 @@ metadata_tests() {
 		  metadata_addon_base metadata_exportsyms_local \
 		  metadata_exportsyms_ref metadata_importsyms \
 		  metadata_addon_orphan1 metadata_addon_orphan2 \
-		  metadata_addon_orphan3; do
+		  metadata_addon_orphan3 metadata_addon_references; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.55.0

