Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838C540B11B;
	Wed, 26 Aug 2026 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738014; cv=none; b=BAMgFVUqvyMK4M5K26RKpPoqlBaS+jDhzMBxgxKefpdqH61DFAVlS4DQMPN+5t6g6/zst4h3GtpKlyukK2532NCAuD7TzWhlOduojCrOGfkrar+edMF724G8d9urmYRMMjU0eTGM8rQMyQcK5p+v1PxuW617/0moJ0LuAGNGdD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738014; c=relaxed/simple;
	bh=0t1gShhLMnScFlc+HTpNW7ec8b22R5S/ZlxX5BW8A0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2IizVMek0ap6ts/lQpIJLtRZ55f84Zf95Oh0FXWq8CqOAUrEeW3X97iC/SFbym4vxKb5knBsDPltGathYhhwAz06IfKXeRin9nSLRC5ZeFDKc9FSLq6t1BSDo49y7r1W5sV4QVqCUCDebZyWyr9eQ5skZ2ClqNCKIrn6bSIZjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eR8ZkU/F; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eR8ZkU/F"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E11BF4E413BF;
	Wed, 26 Aug 2026 09:53:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4426604EC;
	Wed, 26 Aug 2026 09:53:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8F9D11C7ACD5;
	Wed, 26 Aug 2026 11:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738009; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Z2TBvTt/Hk4pcXSEPftx1bbUO6H0/gNDTyYJFD44vA=;
	b=eR8ZkU/FsWft8t9dGEWyED8pD8kkMWBvinkPgZ+KLLUVzScEJ2RhZXmPguf9o30FJsb4T9
	ELpu+BDsr/WSMdh8tr+6Z4tM3kx8WEyGb3VNFpryV1p7/VT1otfTLkWJ8elM2OnYr29JuN
	vFsegwT8cDWXHE8VOggx09wkms5Z9xlUwIgd3qQitV2jV3HM/aDxJ8xNL40mb4wi5gaiqH
	MPYulgE0xeo3ILT5txNo1+M7yv78LPhTBCnpJd87YpBQbsa0jiQuwGyhqfDDL2pD/4MJZM
	h5JXMdLhveunKGjRl9GvV0z1Oj+egvMd131lH49E6DQAuZpLn8oqyxmWsIVCnw==
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
Subject: [RFC PATCH v2 56/74] tests: metadata: Add a test related to orphan node merging
Date: Wed, 26 Aug 2026 11:49:25 +0200
Message-ID: <20260826094950.1088288-57-herve.codina@bootlin.com>
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

Merging orphan node is supported.

Add a test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_addon_orphan3.dtb.dts.expect | 22 ++++++++++++++++
 tests/metadata_addon_orphan3.dtb.expect     | 17 +++++++++++++
 tests/metadata_addon_orphan3.dts            | 28 +++++++++++++++++++++
 tests/metadata_addon_orphan3.dts.dts.expect | 22 ++++++++++++++++
 tests/run_tests.sh                          |  3 ++-
 5 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_orphan3.dtb.dts.expect
 create mode 100644 tests/metadata_addon_orphan3.dtb.expect
 create mode 100644 tests/metadata_addon_orphan3.dts
 create mode 100644 tests/metadata_addon_orphan3.dts.dts.expect

diff --git a/tests/metadata_addon_orphan3.dtb.dts.expect b/tests/metadata_addon_orphan3.dtb.dts.expect
new file mode 100644
index 00000000..2605e1b6
--- /dev/null
+++ b/tests/metadata_addon_orphan3.dtb.dts.expect
@@ -0,0 +1,22 @@
+/dts-v1/;
+/addon/;
+
+
+&base1 {
+
+	addon-node1 {
+		prop1 = <0x01>;
+		prop2 = <0x02>;
+	};
+
+	addon-node2 {
+		prop3 = <0x03>;
+	};
+};
+
+&base2 {
+
+	addon-node {
+		prop = <0x00>;
+	};
+};
diff --git a/tests/metadata_addon_orphan3.dtb.expect b/tests/metadata_addon_orphan3.dtb.expect
new file mode 100644
index 00000000..5a654831
--- /dev/null
+++ b/tests/metadata_addon_orphan3.dtb.expect
@@ -0,0 +1,17 @@
+/dts-v1/;
+/addon/;
+
+&base1 {
+    addon-node1 {
+        prop1 = <0x00000001>;
+        prop2 = <0x00000002>;
+    };
+    addon-node2 {
+        prop3 = <0x00000003>;
+    };
+};
+&base2 {
+    addon-node {
+        prop = <0x00000000>;
+    };
+};
diff --git a/tests/metadata_addon_orphan3.dts b/tests/metadata_addon_orphan3.dts
new file mode 100644
index 00000000..0fe52ec3
--- /dev/null
+++ b/tests/metadata_addon_orphan3.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+&base1 {
+	addon-node1 {
+		prop1 = <1>;
+	};
+};
+
+&base2 {
+	addon-node {
+		prop = <0>;
+	};
+};
+
+&base1 {
+	addon-node1 {
+		prop2 = <2>;
+	};
+	addon-node2 {
+		prop3 = <3>;
+	};
+};
diff --git a/tests/metadata_addon_orphan3.dts.dts.expect b/tests/metadata_addon_orphan3.dts.dts.expect
new file mode 100644
index 00000000..2605e1b6
--- /dev/null
+++ b/tests/metadata_addon_orphan3.dts.dts.expect
@@ -0,0 +1,22 @@
+/dts-v1/;
+/addon/;
+
+
+&base1 {
+
+	addon-node1 {
+		prop1 = <0x01>;
+		prop2 = <0x02>;
+	};
+
+	addon-node2 {
+		prop3 = <0x03>;
+	};
+};
+
+&base2 {
+
+	addon-node {
+		prop = <0x00>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e099bd39..ab09d745 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1251,7 +1251,8 @@ metadata_tests() {
 	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref \
 		  metadata_addon_base metadata_exportsyms_local \
 		  metadata_exportsyms_ref metadata_importsyms \
-		  metadata_addon_orphan1 metadata_addon_orphan2; do
+		  metadata_addon_orphan1 metadata_addon_orphan2 \
+		  metadata_addon_orphan3; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.55.0

