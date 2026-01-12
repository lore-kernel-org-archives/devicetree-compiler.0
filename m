Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3B35CBAF;
	Mon, 12 Jan 2026 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227672; cv=none; b=leh+0oezB4naAuvmrhwNTgKBoMN0b+ICE+0vuinacpNT9r3HKdDZgIZANJaAYcoBG0GslgPreVwNn2rUzD1cAcWD4vQsrNsrJ1iAUhSIyj+9zu9v5rAIbZFAFZbFgD6IHO1Fhru6hv/klGmlok8anZRv2ui4cDakwQwo8UyYtGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227672; c=relaxed/simple;
	bh=P/XdXd/bYrHZDkDSuHHmyyBrAIsBa+F365UKC6ogKGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iY85CNQQ8/xoH69iFdm8gMQeogz7KMFVm5jMIbdW++mD/fDIECEqH64uWyP+s+Ve809Ag0Mc4r+xqVWUGH18WcLtBcLCCJU71JHl0WkqFARC6jZJonnms+XP0KJMdWp2KflDLEo+SoQgBmlqYhnE7ILw3gphyvlbSRyiOPwpyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I5dUvqxY; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I5dUvqxY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6FB051A280A;
	Mon, 12 Jan 2026 14:21:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40832606FA;
	Mon, 12 Jan 2026 14:21:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF03F103C9281;
	Mon, 12 Jan 2026 15:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227665; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lIzmhSqDNTNqAbKeLro4jdmwBQewOntD3SjbuDJaI24=;
	b=I5dUvqxY5xJG2c6pwe+N4sFvEgcHpPGPyMCBud3s8zVfSDuIq8eUlxGaTmlZ73Y0rY+YWV
	4zbyufJMhvKzlnoWGbva+xs7kaeeNvIlxmQ/b2/kMJbG6l2nCZvPN67M5JeJ6veqDdi3oT
	K33k/3oYguaQ+q3VPx5OGX5Mk4VHBEAQd1h8ySx3Fv42EnxFiWEHNixwySmlNY1dzXWUk6
	5ek2OS5KShqVztkDeXHhPqIBk/CRct2jUqX+OaFD2GwkbHRWmcIajgzU4ah9LbacaBEQCI
	Dh/qLQ/WiijDrv7Qu/PBCUa9MOmJSIT4JtJfB4nBjT0bERpLBsNwHSmwVRogQQ==
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
Subject: [RFC PATCH 28/77] tests: metadata: Add a test for export symbols sorting
Date: Mon, 12 Jan 2026 15:19:18 +0100
Message-ID: <20260112142009.1006236-29-herve.codina@bootlin.com>
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

dtc is able to sort the export symbols list when the --sort option is
used.

Add a test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_sort.dtb.dts.expect | 18 ++++++++++++++++++
 tests/metadata_sort.dtb.expect     | 15 +++++++++++++++
 tests/metadata_sort.dts            | 21 +++++++++++++++++++++
 tests/run_tests.sh                 |  8 ++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 tests/metadata_sort.dtb.dts.expect
 create mode 100644 tests/metadata_sort.dtb.expect
 create mode 100644 tests/metadata_sort.dts

diff --git a/tests/metadata_sort.dtb.dts.expect b/tests/metadata_sort.dtb.dts.expect
new file mode 100644
index 0000000..f07a42b
--- /dev/null
+++ b/tests/metadata_sort.dtb.dts.expect
@@ -0,0 +1,18 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+		prop_a = <0x1c8>;
+		prop_b = <0x7b>;
+
+		/export/ a: &{/node-b};
+		/export/ ba: &{/node-b};
+		/export/ bb: &{/node-b};
+	};
+
+	node-b {
+		phandle = <0x01>;
+	};
+};
diff --git a/tests/metadata_sort.dtb.expect b/tests/metadata_sort.dtb.expect
new file mode 100644
index 0000000..7856894
--- /dev/null
+++ b/tests/metadata_sort.dtb.expect
@@ -0,0 +1,15 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    node-a {
+        prop_a = <0x000001c8>;
+        prop_b = <0x0000007b>;
+        // [FDT_EXPORT_SYM] 'a' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'ba' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'bb' -> phandle 0x00000001
+    };
+    node-b {
+        phandle = <0x00000001>;
+    };
+};
diff --git a/tests/metadata_sort.dts b/tests/metadata_sort.dts
new file mode 100644
index 0000000..7d1cca7
--- /dev/null
+++ b/tests/metadata_sort.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/ {
+	node_b: node-b {
+	};
+
+	node-a {
+		prop_b = <123>;
+		prop_a = <456>;
+
+		/export/ ba: &node_b;
+		/export/ bb: &node_b;
+		/export/ a: &node_b;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index ed3a240..fc270e2 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1154,6 +1154,14 @@ metadata_tests() {
 	# Keep only lines containing 'dt_flags'
 	sed -i '/dt_flags/!d' metadata_dtflags1.dtb.out
 	base_run_test check_diff metadata_dtflags1.dtb.out "$SRCDIR/metadata_dtflags1.dtb.expect"
+
+	run_dtc_test -I dts -O dtb -s -o metadata_sort.dtb "$SRCDIR/metadata_sort.dts"
+	base_run_test wrap_fdtdump metadata_sort.dtb metadata_sort.dtb.out
+	# Remove unneeded comments
+	sed -i '/^\/\/ /d' metadata_sort.dtb.out
+	base_run_test check_diff metadata_sort.dtb.out "$SRCDIR/metadata_sort.dtb.expect"
+	run_dtc_test -I dtb -O dts -o metadata_sort.dtb.dts metadata_sort.dtb
+	base_run_test check_diff metadata_sort.dtb.dts "$SRCDIR/metadata_sort.dtb.dts.expect"
 }
 
 pylibfdt_tests () {
-- 
2.52.0

