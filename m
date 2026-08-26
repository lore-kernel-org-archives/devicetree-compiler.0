Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1D43E63B0;
	Wed, 26 Aug 2026 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737933; cv=none; b=lyXDVD0aO/x+rJxeSw//ccNSq1IdqHB5Y7GAVhqDzSEUltua20aekpKlwXfXjJeAqxoUHQsVPd3PApGmxKdKMQ8ETrDsc+TCfPNmRWQqA9TKmROCfmhnRqhdjvI4u8AC9PECj+li1UUEUA+NxB8XAg3A8rZdtgD/n7NUo1Wx5fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737933; c=relaxed/simple;
	bh=bkgRyyE/qnR5IaZjkz9G3XEna/bC7PCIOFhVcbkR/lY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1xrVg/Z/ndC7H2S57yZizP412K7o0fLMm6EXPw3Ogm70Y9ARItQq1MqXjTgO45Wt180tQWlHBsvDq9QziH8v/cy3J7/vz6Ogc8LHP+ztlsf3nf5wYj6kDuCMO8UD4eyE9zl96IiWOrKDocI5zJGUZyzq6bXPzysZWO1SWy2r6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N3L7IAHM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N3L7IAHM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A4D84E413C2;
	Wed, 26 Aug 2026 09:52:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F8BE604EC;
	Wed, 26 Aug 2026 09:52:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96C6C11C7AD6A;
	Wed, 26 Aug 2026 11:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737928; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QwNPhcy1PagZ/1ECwu2v8KpqOlrxr1UO2KrdkLHMpj8=;
	b=N3L7IAHMl8FEJnT5uKUE+jyWkoL9yC0N/Ct7Jd2GxKctYAswMlLf3rqFigC3MaB/pHhqp0
	L2eFGj27qgI8Sv4qtnZfUGr2FsYr/zg7Q789y+Ek6ioUIurMVgvUOwSrII9Ct4iZhjVsRZ
	K+1kZ5cJiT2zCUDdOzt3063Yt8nIpD9hi0qmqRTakeRDz0FjJRy35l2SQasOCMrpZTzCZU
	FUO0J5SaO6Qojtd9Xge6rRSEBIFlxqDOEkqm+xgjDDhq7/A8/pGTdFPxDly9oz2tVkFM+2
	W6Dxpa4l3vlsl8EgzGVzF9F/OEmsxyoyhfV30Nz0QV7ESsgr/SZfztLcYvmUMw==
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
Subject: [RFC PATCH v2 32/74] tests: metadata: Add import symbols tests
Date: Wed, 26 Aug 2026 11:49:01 +0200
Message-ID: <20260826094950.1088288-33-herve.codina@bootlin.com>
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

Add tests related to import symbols (FDT_IMPORT_SYM dtb tag).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_importsyms.dtb.dts.expect |  9 +++++++++
 tests/metadata_importsyms.dtb.expect     |  8 ++++++++
 tests/metadata_importsyms.dts            | 14 ++++++++++++++
 tests/metadata_importsyms.dts.dts.expect |  9 +++++++++
 tests/run_tests.sh                       | 10 +++++-----
 5 files changed, 45 insertions(+), 5 deletions(-)
 create mode 100644 tests/metadata_importsyms.dtb.dts.expect
 create mode 100644 tests/metadata_importsyms.dtb.expect
 create mode 100644 tests/metadata_importsyms.dts
 create mode 100644 tests/metadata_importsyms.dts.dts.expect

diff --git a/tests/metadata_importsyms.dtb.dts.expect b/tests/metadata_importsyms.dtb.dts.expect
new file mode 100644
index 00000000..eabf8c70
--- /dev/null
+++ b/tests/metadata_importsyms.dtb.dts.expect
@@ -0,0 +1,9 @@
+/dts-v1/;
+/addon/;
+
+/import/ base_a: "foo,bar";
+/import/ base_b: "foo,baz";
+
+/ {
+	prop = <0x01>;
+};
diff --git a/tests/metadata_importsyms.dtb.expect b/tests/metadata_importsyms.dtb.expect
new file mode 100644
index 00000000..21770262
--- /dev/null
+++ b/tests/metadata_importsyms.dtb.expect
@@ -0,0 +1,8 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    prop = <0x00000001>;
+};
+// [FDT_IMPORT_SYM] 'base_a' (foo,bar)
+// [FDT_IMPORT_SYM] 'base_b' (foo,baz)
diff --git a/tests/metadata_importsyms.dts b/tests/metadata_importsyms.dts
new file mode 100644
index 00000000..671586db
--- /dev/null
+++ b/tests/metadata_importsyms.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ base_a: "foo,bar";
+/import/ base_b: "foo,baz";
+
+/ {
+	prop = <1>;
+};
diff --git a/tests/metadata_importsyms.dts.dts.expect b/tests/metadata_importsyms.dts.dts.expect
new file mode 100644
index 00000000..eabf8c70
--- /dev/null
+++ b/tests/metadata_importsyms.dts.dts.expect
@@ -0,0 +1,9 @@
+/dts-v1/;
+/addon/;
+
+/import/ base_a: "foo,bar";
+/import/ base_b: "foo,baz";
+
+/ {
+	prop = <0x01>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f61f3e91..7a041aae 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1250,21 +1250,21 @@ fdtoverlay_tests() {
 metadata_tests() {
 	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref \
 		  metadata_addon_base metadata_exportsyms_local \
-		  metadata_exportsyms_ref; do
+		  metadata_exportsyms_ref metadata_importsyms; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
 		base_run_test wrap_fdtdump $dt.dtb $dt.dtb.out
-		# Remove unneeded comments
-		sed -i '/^\/\/ /d' $dt.dtb.out
+		# Remove unneeded comments, keep comments in the form '// [xxxx'
+		sed -i '/^\/\/ [^\[]/d' $dt.dtb.out
 		base_run_test check_diff $dt.dtb.out "$SRCDIR/$dt.dtb.expect"
 		run_test check_full $dt.dtb
 		run_dtc_test -I dtb -O dts -o $dt.dtb.dts $dt.dtb
 		base_run_test check_diff $dt.dtb.dts "$SRCDIR/$dt.dtb.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb.dts.dtb $dt.dtb.dts
 		base_run_test wrap_fdtdump $dt.dtb.dts.dtb $dt.dtb.dts.dtb.out
-		# Remove unneeded comments
-		sed -i '/^\/\/ /d' $dt.dtb.dts.dtb.out
+		# Remove unneeded comments, keep comments in the form '// [xxxx'
+		sed -i '/^\/\/ [^\[]/d' $dt.dtb.dts.dtb.out
 		base_run_test check_diff $dt.dtb.dts.dtb.out "$SRCDIR/$dt.dtb.expect"
 	done
 
-- 
2.55.0

