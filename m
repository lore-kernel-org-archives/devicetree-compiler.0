Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915252D3225;
	Mon, 12 Jan 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227641; cv=none; b=Ogn0pi2q1LEKjt6slkI0p8Q2AXFBVMb2CYlOTWl5s39+2sTy9lZ/pRPwNPqGXyH3etxGqS3iq3EwY6kleo9NbqP517RUZ6dmxyombVrHZa3tN5+NgePSXnY2ljZd999iPN+aWXNKWv/aiXgnLnqo65g0walI6RyDgsWQ2uSQiW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227641; c=relaxed/simple;
	bh=ZXU9XNcj48fjtMAslY9eni60v2cXAHj2Unj3M3PwFZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNjMzrySf329WYeizED1J8fTTs2GYpHZmXMFIC8kiZ49Nyk6kRNY2FxRu8GGxcNCMAl6WwzcV90E+yOLbuN+N/6dlEwT/2pTWZz/ktb1T6SfChjNrj/Xj1v1+H33H5phoYIUtz3OpLoxmVgBOo7ts5VIcFHcz0EgT+gh4W5krR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tTVs3QV5; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tTVs3QV5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5245F4E4208D;
	Mon, 12 Jan 2026 14:20:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 27451606FA;
	Mon, 12 Jan 2026 14:20:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3ED41103C9264;
	Mon, 12 Jan 2026 15:20:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227637; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8uFabX923YEkpFpxXtAznZ2imCbjUvPJlwt8YWDTWN8=;
	b=tTVs3QV5Y8OiHUr0K8AWV6WiaX8f0TDt/7Vu0Fj4Z5coMYpYYSrhN2RzcmdXc/jPuobbMo
	LTQk2yUzU0ikk/ymI+CI4l+Oi7sesfB76T8ywTCFyosJQ2GPmmJr7ORg82c65IgbusE5Rq
	1J+4zRIjw2mjBof3muqEbDzvOghd9uLUPT6jAR2fuNIgX3pVjn1adTH05r8YnxHr7Z3btx
	3167bEOt8r4YbUsUA16CQVRW3d4ffW3ng22Bku7A2OTrXXyrWks822DdaqLHY40HORE/4N
	eYw0DAztIWWFDSCOtv1DNcOj2f0a0Q69ExCAPhCtEP/GNl7s1K7CdSFaF2k/UQ==
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
Subject: [RFC PATCH 10/77] tests: Add basic metadata tests
Date: Mon, 12 Jan 2026 15:19:00 +0100
Message-ID: <20260112142009.1006236-11-herve.codina@bootlin.com>
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

This first test is related to local phandle references (FDT_REF_LOCAL
dtb tag).

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
 tests/meson.build                      |  3 +-
 tests/metadata_reflocal.dtb.dts.expect | 23 ++++++++++
 tests/metadata_reflocal.dtb.expect     | 20 +++++++++
 tests/metadata_reflocal.dts            | 27 ++++++++++++
 tests/metadata_reflocal.dts.dts.expect | 23 ++++++++++
 tests/run_tests.sh                     | 58 +++++++++++++++++++++++++-
 6 files changed, 152 insertions(+), 2 deletions(-)
 create mode 100644 tests/metadata_reflocal.dtb.dts.expect
 create mode 100644 tests/metadata_reflocal.dtb.expect
 create mode 100644 tests/metadata_reflocal.dts
 create mode 100644 tests/metadata_reflocal.dts.dts.expect

diff --git a/tests/meson.build b/tests/meson.build
index 37bfd47..e81a2e1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -140,7 +140,8 @@ run_test_types = [
   'fdtget',
   'fdtput',
   'fdtdump',
-  'fdtoverlay'
+  'fdtoverlay',
+  'metadata'
 ]
 run_test_deps = [
   dtc_tools, dumptrees_dtb, tests_exe
diff --git a/tests/metadata_reflocal.dtb.dts.expect b/tests/metadata_reflocal.dtb.dts.expect
new file mode 100644
index 0000000..076c17a
--- /dev/null
+++ b/tests/metadata_reflocal.dtb.dts.expect
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
diff --git a/tests/metadata_reflocal.dtb.expect b/tests/metadata_reflocal.dtb.expect
new file mode 100644
index 0000000..33b3896
--- /dev/null
+++ b/tests/metadata_reflocal.dtb.expect
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
+        // [FDT_REF_LOCAL] ref-subnode-a[0]
+        ref-node-b = <0x00000123 0x00000456 0x00000002 0x00000789>;
+        // [FDT_REF_LOCAL] ref-node-b[8]
+    };
+};
diff --git a/tests/metadata_reflocal.dts b/tests/metadata_reflocal.dts
new file mode 100644
index 0000000..f04d24f
--- /dev/null
+++ b/tests/metadata_reflocal.dts
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
diff --git a/tests/metadata_reflocal.dts.dts.expect b/tests/metadata_reflocal.dts.dts.expect
new file mode 100644
index 0000000..b72b545
--- /dev/null
+++ b/tests/metadata_reflocal.dts.dts.expect
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
index f07092b..7a8bdbc 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1090,6 +1090,59 @@ fdtoverlay_tests() {
     run_wrap_test test "$bd" = "$pd"
 }
 
+# $1: f1 file
+# $2: f2 file
+check_diff () {
+    printf "diff $1 $2:	"
+    local f1="$1"
+    local f2="$2"
+    (
+        if diff $f1 $f2 >/dev/null; then
+            PASS
+        else
+            if [ -z "$QUIET_TEST" ]; then
+                echo "DIFF :-:"
+                diff -u $f1 $f2
+            fi
+            FAIL "Results differ from expected"
+        fi
+    )
+}
+
+# $1: dtb file
+# $2: out file
+wrap_fdtdump () {
+    printf "wrap_fdtdump $1:	"
+    local dtb="$1"
+    local out="$2"
+    (
+        if $FDTDUMP ${dtb} 2>/dev/null >${out}; then
+            PASS
+        else
+            FAIL
+        fi
+    )
+}
+
+metadata_tests() {
+	for dt in metadata_reflocal; do
+		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
+		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
+		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
+		base_run_test wrap_fdtdump $dt.dtb $dt.dtb.out
+		# Remove unneeded comments
+		sed -i '/^\/\/ /d' $dt.dtb.out
+		base_run_test check_diff $dt.dtb.out "$SRCDIR/$dt.dtb.expect"
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
@@ -1129,7 +1182,7 @@ while getopts "vt:me" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdtoverlay"
+    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdtoverlay metadata"
 
     # Test pylibfdt if the libfdt Python module is available.
     if ! $no_python; then
@@ -1169,6 +1222,9 @@ for set in $TESTSETS; do
         "fdtoverlay")
 	    fdtoverlay_tests
 	    ;;
+	"metadata")
+	    metadata_tests
+	    ;;
     esac
 done
 
-- 
2.52.0

