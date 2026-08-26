Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2C3C4B93;
	Wed, 26 Aug 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737881; cv=none; b=UIT6E0opsllzB8RXPbr5hKma+Sm8Zj+JGbr04Awd8cmYGmoHKlB2/weHg3kCJCw22bTupP60cLbgZ6pUHc5aXFiByjVQ0OfuSWJggmZwzcHyNjFka79pmZ7H73LmANtpTx40Qoon1Nd2m57dZEyzqVPOoKVKGOAdpje6VtXQE2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737881; c=relaxed/simple;
	bh=uRh2sj/WLKWEXNAEVviKOEzrQ489d4X8/ox//WICEG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqObX2YGad59FQiLjqDR1tR2MgTU/MMjWUq+tRJuQh+te1Lv16LPVyfxFcQ68V5K3NK0HFFaWawKJbKOtBX+WsQiAyBexc/pg7JprFZlTvz9ZB0zcTI72Uaqxtus+6R7+OvmiQKtqxAUhdlu345rX6asSXjkO2nL6eRmZMbDDS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bFOwavnT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bFOwavnT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A7CD04E413C1;
	Wed, 26 Aug 2026 09:51:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 748F1604EC;
	Wed, 26 Aug 2026 09:51:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5165811C7AD5F;
	Wed, 26 Aug 2026 11:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737871; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2PIbndfDwZB2ksXzfk5pD7iDFCgcIP1Yx+S/ij9EjL0=;
	b=bFOwavnTo+mPl+u4E5r8EzND0wKiVad9eAOlzPWe2ga91hoaujgly2JsU18vCQ5fs7GaeT
	RIDBXBIfz1et5UWJa2ujaeazDmOA+N+YoUDV4SU9V4alruWWLvs+hi5FvkM41C0S07p5g0
	DOtjZJS3vVzKe61dD+U5Vf09+GJAvtv2QGsSVcw4wfnMRPLI7wsDYJRA3gxnAKq/HUd2jE
	CcXbwltAtLOlsgvbWH3ic6w7x6VkyQf6YyFT4/2jhI1kqj0UqgvqcP+yA3Qmv/aVjHauJD
	ikgE4NyjLGwSo6S3gVp6vfpdWLau4xL9sLicajsm2k1TrSWh5VK1Dy5dTGcTCA==
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
Subject: [RFC PATCH v2 12/74] tests: metadata: Add external phandle reference tests
Date: Wed, 26 Aug 2026 11:48:41 +0200
Message-ID: <20260826094950.1088288-13-herve.codina@bootlin.com>
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

Add tests related to external phandle references used in
properties (FDT_PROPDATA_PHANDLE_REF dtb tag).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 ...etadata_propdata_phandle_ref.dtb.dts.expect | 18 ++++++++++++++++++
 tests/metadata_propdata_phandle_ref.dtb.expect | 16 ++++++++++++++++
 tests/metadata_propdata_phandle_ref.dts        | 11 +++++++++++
 ...etadata_propdata_phandle_ref.dts.dts.expect | 18 ++++++++++++++++++
 tests/run_tests.sh                             |  2 +-
 5 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_propdata_phandle_ref.dtb.dts.expect
 create mode 100644 tests/metadata_propdata_phandle_ref.dtb.expect
 create mode 100644 tests/metadata_propdata_phandle_ref.dts
 create mode 100644 tests/metadata_propdata_phandle_ref.dts.dts.expect

diff --git a/tests/metadata_propdata_phandle_ref.dtb.dts.expect b/tests/metadata_propdata_phandle_ref.dtb.dts.expect
new file mode 100644
index 00000000..61ce943b
--- /dev/null
+++ b/tests/metadata_propdata_phandle_ref.dtb.dts.expect
@@ -0,0 +1,18 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+
+	fragment@0 {
+		target = <&test>;
+
+		__overlay__ {
+			ref = <&node_a>;
+		};
+	};
+
+	__fixups__ {
+		test = "/fragment@0:target:0";
+		node_a = "/fragment@0/__overlay__:ref:0";
+	};
+};
diff --git a/tests/metadata_propdata_phandle_ref.dtb.expect b/tests/metadata_propdata_phandle_ref.dtb.expect
new file mode 100644
index 00000000..f79f542d
--- /dev/null
+++ b/tests/metadata_propdata_phandle_ref.dtb.expect
@@ -0,0 +1,16 @@
+/dts-v1/;
+
+/ {
+    fragment@0 {
+        target = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] target[0], ref = test
+        __overlay__ {
+            ref = <0xffffffff>;
+            // [FDT_PROPDATA_PHANDLE_REF] ref[0], ref = node_a
+        };
+    };
+    __fixups__ {
+        test = "/fragment@0:target:0";
+        node_a = "/fragment@0/__overlay__:ref:0";
+    };
+};
diff --git a/tests/metadata_propdata_phandle_ref.dts b/tests/metadata_propdata_phandle_ref.dts
new file mode 100644
index 00000000..b8aa6509
--- /dev/null
+++ b/tests/metadata_propdata_phandle_ref.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/plugin/;
+
+&test {
+	ref = <&node_a>;
+};
diff --git a/tests/metadata_propdata_phandle_ref.dts.dts.expect b/tests/metadata_propdata_phandle_ref.dts.dts.expect
new file mode 100644
index 00000000..61ce943b
--- /dev/null
+++ b/tests/metadata_propdata_phandle_ref.dts.dts.expect
@@ -0,0 +1,18 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+
+	fragment@0 {
+		target = <&test>;
+
+		__overlay__ {
+			ref = <&node_a>;
+		};
+	};
+
+	__fixups__ {
+		test = "/fragment@0:target:0";
+		node_a = "/fragment@0/__overlay__:ref:0";
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 8c27b463..f5ea02bf 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1240,7 +1240,7 @@ fdtoverlay_tests() {
 }
 
 metadata_tests() {
-	for dt in metadata_propdata_phandle_local; do
+	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.55.0

