Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE506368296;
	Mon, 12 Jan 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227714; cv=none; b=gtLnBOKTfEiDIRQTU5HYW2OvT8w0pGqfcajaCRCfG4xvkOiSoYA55aWIPgZ596A2FBjrLoGvK5dAubcheWnBRY25HmeNG4O3/ZdlY7McoIXfpZqNZOF5oUj3OYq1VGDcSRSnZxOz5AzbF1EcI/0mLf5Lu/SBAgSQMHR74YdJiAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227714; c=relaxed/simple;
	bh=wC8+9farHpO7TwHISd+JDQg+88Xnm1DglxtBoZNZQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQlm79NvVjG6iAHtCgivhKBna/mqED3bNeR2xZ6tjL8mMO6t0tzbhZJjg1fcze1cej/aMYvdJNjjopaTlNm1bqL6bhIC5wjg2R3TiLANLk0sd8R2WyXaORdIYkqo8VBD8VAfyTW/hnzveJhJnJxGXBHM9JZZtrl9AZXPgR/eUFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AChO2PuV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AChO2PuV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2DE67C20868;
	Mon, 12 Jan 2026 14:21:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A53F2606FA;
	Mon, 12 Jan 2026 14:21:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9730B103C8C61;
	Mon, 12 Jan 2026 15:21:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227710; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OkYo61wpmCiei7gTekU+N071yho8X+Jnp5LaOOR8E2g=;
	b=AChO2PuV2eYCy2/CyiEsEo/M7SMwl3h5wld0TOzXZvoBPez6jo90x9FvMaBISfDWtJb6qO
	LBh0DsQRcpQXX5wC9ijgHsYk4M9hmdSBFP42u1JOYCseZydfd/CHV8gGRv/rVqoQs38jyU
	Du4EiJ3uYyuIPIwtGB7AY2HbZ9iv/HogMoAY7ZXGA12PYFKfn4mpB+2HSGjcV6urGjMHze
	5qpG7aYG/KWSbZxmmURf5Eg+3n5H4OZqURULyfhQJ0s2SvZpVyKG4U7nw7oJ1+zQfU1iyX
	fnR4Ut3ZwSNKOKBaD/8zjJZTEn92rjXgiUhaFwDX7fovedb+LHVMJOvxDr1ahA==
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
Subject: [RFC PATCH 59/77] tests: metadata: Add a test for addon without root node
Date: Mon, 12 Jan 2026 15:19:49 +0100
Message-ID: <20260112142009.1006236-60-herve.codina@bootlin.com>
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

The root device-tree node is no more mandatory for addons.

Indeed, addons can be composed of only orphan nodes without any needs
for the root device-tree node presence.

Add a test related to addon dts and dtb without root node.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_addon_orphan2.dtb.dts.expect | 10 ++++++++++
 tests/metadata_addon_orphan2.dtb.expect     |  8 ++++++++
 tests/metadata_addon_orphan2.dts            | 13 +++++++++++++
 tests/metadata_addon_orphan2.dts.dts.expect | 10 ++++++++++
 tests/run_tests.sh                          |  2 +-
 5 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_addon_orphan2.dtb.dts.expect
 create mode 100644 tests/metadata_addon_orphan2.dtb.expect
 create mode 100644 tests/metadata_addon_orphan2.dts
 create mode 100644 tests/metadata_addon_orphan2.dts.dts.expect

diff --git a/tests/metadata_addon_orphan2.dtb.dts.expect b/tests/metadata_addon_orphan2.dtb.dts.expect
new file mode 100644
index 0000000..32c1b1e
--- /dev/null
+++ b/tests/metadata_addon_orphan2.dtb.dts.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+
+&base {
+
+	addon-node {
+		prop = <0x02>;
+	};
+};
diff --git a/tests/metadata_addon_orphan2.dtb.expect b/tests/metadata_addon_orphan2.dtb.expect
new file mode 100644
index 0000000..46e67d0
--- /dev/null
+++ b/tests/metadata_addon_orphan2.dtb.expect
@@ -0,0 +1,8 @@
+/dts-v1/;
+/addon/;
+
+&base {
+    addon-node {
+        prop = <0x00000002>;
+    };
+};
diff --git a/tests/metadata_addon_orphan2.dts b/tests/metadata_addon_orphan2.dts
new file mode 100644
index 0000000..d4ff42f
--- /dev/null
+++ b/tests/metadata_addon_orphan2.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+&base {
+	addon-node {
+		prop = <2>;
+	};
+};
diff --git a/tests/metadata_addon_orphan2.dts.dts.expect b/tests/metadata_addon_orphan2.dts.dts.expect
new file mode 100644
index 0000000..32c1b1e
--- /dev/null
+++ b/tests/metadata_addon_orphan2.dts.dts.expect
@@ -0,0 +1,10 @@
+/dts-v1/;
+/addon/;
+
+
+&base {
+
+	addon-node {
+		prop = <0x02>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 659b42b..5edc58b 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1128,7 +1128,7 @@ metadata_tests() {
 	for dt in metadata_reflocal metadata_refphandle \
 		  metadata_addon_base metadata_exportsyms_local \
 		  metadata_exportsyms_ref metadata_importsyms \
-		  metadata_addon_orphan1; do
+		  metadata_addon_orphan1 metadata_addon_orphan2; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.52.0

