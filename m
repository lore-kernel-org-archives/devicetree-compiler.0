Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477092DCF41
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227644; cv=none; b=c+ZWYicFi50SsuWU3BBB/SmSx5iocp6UZ/T9DBlHx4fGwdJWwyJTIcL9GU7hsMUp54UQdh4Zcy8yQzC5hkdJGqcpTzEWZVYqbnUGA26C6QyLsFsDnfF/WPXG8Y2H7m6tzhm0AnuVv9BX6ZYLppYnDAhQ9TUEOZMndZJRfDiCzhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227644; c=relaxed/simple;
	bh=MoQoo9fRri73x9p0C7T9REHSx3MxrPKkzLwacQcp6ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAiXAQ7AgNUvR6m8umXczQYMwSuMi+WN0ss5i3qV2JpsAwzzpPd+6bUYjiyqnzyLDTFrIe5+zWponJ+VFv3umhrpdwxRDYn/BzP6uBrCd5LZHXSCw/iXdpCxTRhV2PppSQnQ2Kq6PE07ZaLtc9NrhBDzuvh80hQ4+9gHtxTn51M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JlZMYo4d; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JlZMYo4d"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7C10AC2086D;
	Mon, 12 Jan 2026 14:20:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0028D606FA;
	Mon, 12 Jan 2026 14:20:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13776103C9265;
	Mon, 12 Jan 2026 15:20:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227640; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=28CXldTWxJfeqeWSrkzBjbOfb3UPT1622I/9ZKpFlS0=;
	b=JlZMYo4dpsnirBrviWPJYU0bl8RDspVQjqg8rtQtRfgIkdtbl3+Q2kw3qWYHQ7InkeMJIv
	ETxU8b5LnF2vPxvoU345fRe3HTo+A7EshEhZDU8ZUBybEs/OO1/9x0RtuXGoaMUitipfIh
	pMjcmdTx518/cNgVB09bjxaXKbrnRNYY3POYP2Se9dTkywOXPJwnajvZqsb51tyfmeZN6z
	lmDIA5Z+2KQFoVE52jTT4b5BGPKn0zOdR9/Lh9efi6EsqOq7ao8vL+d3n0pUm5NHTqbKYW
	T3mJ3SZll1oaDGXM/SAFqo1UCLRXH1/bb/e7KXRWBtNpga9yRqXQqx+r6sTPRQ==
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
Subject: [RFC PATCH 12/77] tests: metadata: Add external phandle reference tests
Date: Mon, 12 Jan 2026 15:19:02 +0100
Message-ID: <20260112142009.1006236-13-herve.codina@bootlin.com>
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

Add tests related to external phandle references (FDT_REF_PHANDLE dtb
tag).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_refphandle.dtb.dts.expect | 17 +++++++++++++++++
 tests/metadata_refphandle.dtb.expect     | 16 ++++++++++++++++
 tests/metadata_refphandle.dts            | 11 +++++++++++
 tests/metadata_refphandle.dts.dts.expect | 17 +++++++++++++++++
 tests/run_tests.sh                       |  2 +-
 5 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_refphandle.dtb.dts.expect
 create mode 100644 tests/metadata_refphandle.dtb.expect
 create mode 100644 tests/metadata_refphandle.dts
 create mode 100644 tests/metadata_refphandle.dts.dts.expect

diff --git a/tests/metadata_refphandle.dtb.dts.expect b/tests/metadata_refphandle.dtb.dts.expect
new file mode 100644
index 0000000..c229ec1
--- /dev/null
+++ b/tests/metadata_refphandle.dtb.dts.expect
@@ -0,0 +1,17 @@
+/dts-v1/;
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
diff --git a/tests/metadata_refphandle.dtb.expect b/tests/metadata_refphandle.dtb.expect
new file mode 100644
index 0000000..b2f5f95
--- /dev/null
+++ b/tests/metadata_refphandle.dtb.expect
@@ -0,0 +1,16 @@
+/dts-v1/;
+
+/ {
+    fragment@0 {
+        target = <0xffffffff>;
+        // [FDT_REF_PHANDLE] target[0], ref = test
+        __overlay__ {
+            ref = <0xffffffff>;
+            // [FDT_REF_PHANDLE] ref[0], ref = node_a
+        };
+    };
+    __fixups__ {
+        test = "/fragment@0:target:0";
+        node_a = "/fragment@0/__overlay__:ref:0";
+    };
+};
diff --git a/tests/metadata_refphandle.dts b/tests/metadata_refphandle.dts
new file mode 100644
index 0000000..b8aa650
--- /dev/null
+++ b/tests/metadata_refphandle.dts
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
diff --git a/tests/metadata_refphandle.dts.dts.expect b/tests/metadata_refphandle.dts.dts.expect
new file mode 100644
index 0000000..c229ec1
--- /dev/null
+++ b/tests/metadata_refphandle.dts.dts.expect
@@ -0,0 +1,17 @@
+/dts-v1/;
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
index 7a8bdbc..423812e 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1125,7 +1125,7 @@ wrap_fdtdump () {
 }
 
 metadata_tests() {
-	for dt in metadata_reflocal; do
+	for dt in metadata_reflocal metadata_refphandle; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.52.0

