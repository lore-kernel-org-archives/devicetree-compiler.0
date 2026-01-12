Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86F2DA760;
	Mon, 12 Jan 2026 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227651; cv=none; b=SRuDo3wxlfcJCU5QNrwZTZkDzaEZs7IgrYhsdTfyjHtDIci0fi/2CHB17Si8upK/OiNU7BTqZyPKHYruxzCzr/qmhIv13itG2GZTMEMX/8XIQjSRA6mwPUEvI5qS7ti3xxOXfDX2sDhlCxMBusq6e5NWM0PyRtTiy58lkMg3sOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227651; c=relaxed/simple;
	bh=rAKGpL+MO0wznmSRiK03TBFwuWCatM3EtB022hXSn+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VHg8vS54jjJkxljKmUFK612J0bCPdzvvcEuJ7cRn0m9ncPcirXDEe6JrvaN6TAfnBpiyQzTwyOnKJXO9Eqsn8Vo/RM3BLhb5h3icDVnuHkEvEKp0xKCfjQeQq8BWQWStMJ27ij+pIdYWvqnfQ/sXepYWCh5OakAguoNiBUsTewU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ADn6gJZZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ADn6gJZZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A4BA0C20868;
	Mon, 12 Jan 2026 14:20:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 282C9606FA;
	Mon, 12 Jan 2026 14:20:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3315C103C926E;
	Mon, 12 Jan 2026 15:20:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227647; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=e2wg2ep97sbhvDd+Jf681JB+w9NK5Ex/WMqJnPY+158=;
	b=ADn6gJZZZuLRAnbD8EnQ3/B4zeJyv4oWU9f0lLpaDLQNS+ahjp7O9hOhZSqK0ZBb5DhdKS
	dZb8wenRhmt0ImjjvBejrMy+rtZD3bO5TU2VkCDUwHZxDJ6eXwBX+yv5pxniFwXLfI0sm5
	TIzoj2d2XaTaZUkYnoK01BlBFa8IaV9vtTtgl5NNZnM9/fmTUhmx+nK/RHD1jRBpfZtpR2
	bGrdhRC2rcDVrNLh+5FSFd+Sg3MiW5PJKyRKwaU0D0o2iSJnvzFtCQ7wAXhKpcD/m8DdrX
	ecMz6zdo1rIm/cK071gfLuxjqeFuKuy9hoLrqbUqvC/t5/erzv/FB3ZXi+ZoUQ==
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
Subject: [RFC PATCH 17/77] tests: metadata: Add a basic addon test
Date: Mon, 12 Jan 2026 15:19:07 +0100
Message-ID: <20260112142009.1006236-18-herve.codina@bootlin.com>
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

Support for addon dts (/addon/ keyword) and addon dtb (FDT_FLAG_ADDON
header flag) have been recently introduced.

Even if the FDT_FLAG_ADDON dtb flag itself has its own test already
available, add a basic addon test in the metadata 'dts->dts and
dts->dtb->dts' test patterns to check that addon dts/dtb are
handled correctly.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_addon_base.dtb.dts.expect | 10 ++++++++++
 tests/metadata_addon_base.dtb.expect     | 10 ++++++++++
 tests/metadata_addon_base.dts            | 14 ++++++++++++++
 tests/metadata_addon_base.dts.dts.expect | 10 ++++++++++
 tests/run_tests.sh                       |  3 ++-
 5 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_base.dtb.dts.expect
 create mode 100644 tests/metadata_addon_base.dtb.expect
 create mode 100644 tests/metadata_addon_base.dts
 create mode 100644 tests/metadata_addon_base.dts.dts.expect

diff --git a/tests/metadata_addon_base.dtb.dts.expect b/tests/metadata_addon_base.dtb.dts.expect
new file mode 100644
index 0000000..739f9db
--- /dev/null
+++ b/tests/metadata_addon_base.dtb.dts.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+		prop = <0x01>;
+		ref-base = <&base>;
+	};
+};
diff --git a/tests/metadata_addon_base.dtb.expect b/tests/metadata_addon_base.dtb.expect
new file mode 100644
index 0000000..6c2a89a
--- /dev/null
+++ b/tests/metadata_addon_base.dtb.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    node-a {
+        prop = <0x00000001>;
+        ref-base = <0xffffffff>;
+        // [FDT_REF_PHANDLE] ref-base[0], ref = base
+    };
+};
diff --git a/tests/metadata_addon_base.dts b/tests/metadata_addon_base.dts
new file mode 100644
index 0000000..5e29cef
--- /dev/null
+++ b/tests/metadata_addon_base.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/ {
+	node-a {
+		prop = <1>;
+		ref-base = <&base>;
+	};
+};
diff --git a/tests/metadata_addon_base.dts.dts.expect b/tests/metadata_addon_base.dts.dts.expect
new file mode 100644
index 0000000..739f9db
--- /dev/null
+++ b/tests/metadata_addon_base.dts.dts.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+		prop = <0x01>;
+		ref-base = <&base>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 688d81d..def1a7e 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1125,7 +1125,8 @@ wrap_fdtdump () {
 }
 
 metadata_tests() {
-	for dt in metadata_reflocal metadata_refphandle; do
+	for dt in metadata_reflocal metadata_refphandle \
+		  metadata_addon_base; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.52.0

