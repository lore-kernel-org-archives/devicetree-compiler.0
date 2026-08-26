Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D7E3BCD27;
	Wed, 26 Aug 2026 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737875; cv=none; b=sEXwzE+pY8VA11S2VvaRuE8ZTU3HesrrSlT1OWorH0mX1Nfc6G65zX5WUT7bDsOJUZcUaSVetlxjEeRf6dSFUaY5+rqwXf9ZPyQp4lUHZqXlgXww1xVgjHGpTehb803cHnnl1ppPnHKcRBGMwkGTQbpQnTTVJHZIbc8/qhvUdAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737875; c=relaxed/simple;
	bh=romTCpYRkypxj89mWq/yugo3+QK3pQGTsI+OV+8aPkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEeTopC1D7nE+iRvlomBAifeb8CsClavjFtS08x0g7F36eY1wm3wOu/JoEyBDjXBF/wwEoK1oLzlSUK6k5mMOZUh9mkFYJeG/Rz/g3sMyyhFHfiBa9RW4umTJ/eD+vzFBZOwiptVXBKMDs+2r6K7dIXrC73LQByJRmATO+N4bwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qwD0vIUl; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qwD0vIUl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F2F61A183D;
	Wed, 26 Aug 2026 09:51:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33339604EC;
	Wed, 26 Aug 2026 09:51:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B552611C7AD52;
	Wed, 26 Aug 2026 11:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737862; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=aqIeN+DRRM4prPj9xxID5A46vQ289Qirfguf0hJ38+s=;
	b=qwD0vIUlCVjpDJXzLgfeZdQUill+T0KLLGL2sfGy6/9bnL+Ge33RbgAmcMeJf88EQHnCzV
	2HL51HbmMRD2yOb9oKChYNnO72jaThW7XrmnXFBgknQrbqveGo6wh5QWO3qWYF1hZoEGim
	UOfSjMzU+qt62a6TfLrtITZmuz3lIOBfrdGNOPL0oaulyNniHlBCtm1/0W6by9YWZTkLZ+
	A9lX8IvOxwNzn87MQOFEXPvn9zU33lqSr8kMHcSLpoM7ma+P2FcV5vJg07Qh1y1j4Tzhwp
	FLDymWPc0H8HVpvIAeiCfAZcQDGvbAmyFy9eSNNwaPZ47TNWcB8mqUrdduecRQ==
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
Subject: [RFC PATCH v2 10/74] tests: Add basic metadata tests
Date: Wed, 26 Aug 2026 11:48:39 +0200
Message-ID: <20260826094950.1088288-11-herve.codina@bootlin.com>
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

This first test is related to local phandle references used in
properties (FDT_PROPDATA_PHANDLE dtb tag).

The test pattern used is
  - Generate a dts (xxx.dts.dts) from an input dts
  - Check this generated dts against expected contents
  - Generate a dtb (xxx.dtb) from the same input dts
  - Check this generated dtb against expected contents
  - Generate a dts (xxx.dtb.dts) from the generated dtb
  - Check this generated dts against expected contents
  - Generate a dtb (xxx.dtb.dts.dtb) from the generated dts
  - Check this generated dtb, expect the same contents as for xxx.dtb

Even if only one meta-data feature is currently tested in this tests
introduction, use a loop in order to ease future addition consisting in
adding new input dts as soon as new meta-data feature are supported.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/meson.build                             |  1 +
 ...data_propdata_phandle_local.dtb.dts.expect | 23 ++++++++++++++++
 ...metadata_propdata_phandle_local.dtb.expect | 20 ++++++++++++++
 tests/metadata_propdata_phandle_local.dts     | 27 +++++++++++++++++++
 ...data_propdata_phandle_local.dts.dts.expect | 23 ++++++++++++++++
 tests/run_tests.sh                            | 25 ++++++++++++++++-
 6 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_propdata_phandle_local.dtb.dts.expect
 create mode 100644 tests/metadata_propdata_phandle_local.dtb.expect
 create mode 100644 tests/metadata_propdata_phandle_local.dts
 create mode 100644 tests/metadata_propdata_phandle_local.dts.dts.expect

diff --git a/tests/meson.build b/tests/meson.build
index fcc73982..ec24f0af 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -143,6 +143,7 @@ run_test_types = [
   'fdtput',
   'fdtdump',
   'fdtoverlay',
+  'metadata',
 ]
 run_test_deps = [
   dtc_tools, treegen_dtb, tests_exe,
diff --git a/tests/metadata_propdata_phandle_local.dtb.dts.expect b/tests/metadata_propdata_phandle_local.dtb.dts.expect
new file mode 100644
index 00000000..076c17ae
--- /dev/null
+++ b/tests/metadata_propdata_phandle_local.dtb.dts.expect
@@ -0,0 +1,23 @@
+/dts-v1/;
+
+/ {
+
+	node-a {
+
+		subnode-a {
+			phandle = <0x01>;
+		};
+	};
+
+	node-b {
+		phandle = <0x02>;
+	};
+
+	node-c {
+	};
+
+	node-d {
+		ref-subnode-a = <&{/node-a/subnode-a}>;
+		ref-node-b = <0x123 0x456 &{/node-b} 0x789>;
+	};
+};
diff --git a/tests/metadata_propdata_phandle_local.dtb.expect b/tests/metadata_propdata_phandle_local.dtb.expect
new file mode 100644
index 00000000..c923d2e2
--- /dev/null
+++ b/tests/metadata_propdata_phandle_local.dtb.expect
@@ -0,0 +1,20 @@
+/dts-v1/;
+
+/ {
+    node-a {
+        subnode-a {
+            phandle = <0x00000001>;
+        };
+    };
+    node-b {
+        phandle = <0x00000002>;
+    };
+    node-c {
+    };
+    node-d {
+        ref-subnode-a = <0x00000001>;
+        // [FDT_PROPDATA_PHANDLE] ref-subnode-a[0]
+        ref-node-b = <0x00000123 0x00000456 0x00000002 0x00000789>;
+        // [FDT_PROPDATA_PHANDLE] ref-node-b[8]
+    };
+};
diff --git a/tests/metadata_propdata_phandle_local.dts b/tests/metadata_propdata_phandle_local.dts
new file mode 100644
index 00000000..f04d24f9
--- /dev/null
+++ b/tests/metadata_propdata_phandle_local.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+
+/ {
+	node-a {
+		subnode_a: subnode-a {
+		};
+	};
+
+	node_b: node-b {
+	};
+
+	node-c {
+	};
+
+	node_d: node-d {
+		ref-subnode-a = <&subnode_a>;
+	};
+};
+
+&node_d {
+	ref-node-b = <0x123 0x456 &node_b 0x789>;
+};
diff --git a/tests/metadata_propdata_phandle_local.dts.dts.expect b/tests/metadata_propdata_phandle_local.dts.dts.expect
new file mode 100644
index 00000000..b72b545f
--- /dev/null
+++ b/tests/metadata_propdata_phandle_local.dts.dts.expect
@@ -0,0 +1,23 @@
+/dts-v1/;
+
+/ {
+
+	node-a {
+
+		subnode_a: subnode-a {
+			phandle = <0x01>;
+		};
+	};
+
+	node_b: node-b {
+		phandle = <0x02>;
+	};
+
+	node-c {
+	};
+
+	node_d: node-d {
+		ref-subnode-a = <&subnode_a>;
+		ref-node-b = <0x123 0x456 &node_b 0x789>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 42b74e05..8c27b463 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1239,6 +1239,26 @@ fdtoverlay_tests() {
     run_wrap_test test "$bd" = "$pd"
 }
 
+metadata_tests() {
+	for dt in metadata_propdata_phandle_local; do
+		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
+		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
+		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
+		base_run_test wrap_fdtdump $dt.dtb $dt.dtb.out
+		# Remove unneeded comments
+		sed -i '/^\/\/ /d' $dt.dtb.out
+		base_run_test check_diff $dt.dtb.out "$SRCDIR/$dt.dtb.expect"
+		run_test check_full $dt.dtb
+		run_dtc_test -I dtb -O dts -o $dt.dtb.dts $dt.dtb
+		base_run_test check_diff $dt.dtb.dts "$SRCDIR/$dt.dtb.dts.expect"
+		run_dtc_test -I dts -O dtb -o $dt.dtb.dts.dtb $dt.dtb.dts
+		base_run_test wrap_fdtdump $dt.dtb.dts.dtb $dt.dtb.dts.dtb.out
+		# Remove unneeded comments
+		sed -i '/^\/\/ /d' $dt.dtb.dts.dtb.out
+		base_run_test check_diff $dt.dtb.dts.dtb.out "$SRCDIR/$dt.dtb.expect"
+	done
+}
+
 pylibfdt_tests () {
     run_dtc_test -I dts -O dtb -o test_props.dtb "$SRCDIR/test_props.dts"
     TMP=/tmp/tests.stderr.$$
@@ -1278,7 +1298,7 @@ while getopts "vt:me" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdtoverlay"
+    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdtoverlay metadata"
 
     # Test pylibfdt if the libfdt Python module is available.
     if ! $no_python; then
@@ -1318,6 +1338,9 @@ for set in $TESTSETS; do
         "fdtoverlay")
 	    fdtoverlay_tests
 	    ;;
+	"metadata")
+	    metadata_tests
+	    ;;
     esac
 done
 
-- 
2.55.0

