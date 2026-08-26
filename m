Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A0F3DB651
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738063; cv=none; b=iOs5bE9EjxrbAzYds2VYnOh1nPMavmAvuCC0P+fIjqI8EByORUgSfSSOsrIW/D4QTrESdFpot5pA8jstu89EP6uNHy0bjvT258qnpvuoaUm0Qzbuvx0JYvSQTiIH/3xpX3bM7LBwhw3zMP3JVoU7OrqB/jQRC79SVjhiSTbdb10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738063; c=relaxed/simple;
	bh=gTjnDdjzLXNImWFuYw4EExm1I0v3x15NXuGmt/w5Q5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmh/qaW/lxVoO0vHtfSJnmVurZYz8jIRUDrwBoSCnz5yCKHEd3TAgnxj6vcVS132xYOvwTcxjQwZgd9CMeDdE9iU45Rx7zY2RdVjsTxU4RxGeEZrLZsMbziYr0FhjWgr1FtuHvYKrfAteSAfCz4nm+qostDFH6a+FXtLxpor6dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o4lKOQoF; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o4lKOQoF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 380D31A0E1B;
	Wed, 26 Aug 2026 09:54:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C0DF604EC;
	Wed, 26 Aug 2026 09:54:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE29F11C7AD65;
	Wed, 26 Aug 2026 11:54:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738054; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=b9oQR74shA4BDKEeFIaO6NnQSEVFzaXwGxE7a6ZpWjo=;
	b=o4lKOQoFOIgO6CoJL5RyeMYgtCo+iJj1LtzhtaINGMY61+aXMjzvLBssAWlIXYLEYrVaB6
	G+RkAF/qokdSq0c2E+trS7WwUbX8wM6e1E1gHKeFZuHzTf9PQ72gKZPCZ2dz1wjxKUyc5+
	FU0sie11bJQQH+3HSrhRAgo/70VSKayIubsWH+faG/ujiaSIq+raLHAcl9v0+n33stiXxp
	87qBq82ioJiOG1IicCRW22ChUeGiBjfQcRjaP4L1z23UuFURmiAYLIKrDjkBOHyPvJHjrn
	IDcrV3yBP4zJ6+9S67NrW44t1TBPpnj+Wv2/ApfZ8GPKsTFGfeBGPAbkDfHjnw==
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
Subject: [RFC PATCH v2 69/74] tests: fdtaddon: Add a test for addons with properties identical to existing ones
Date: Wed, 26 Aug 2026 11:49:38 +0200
Message-ID: <20260826094950.1088288-70-herve.codina@bootlin.com>
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

An addon cannot modify or add a property in a existing node.

If an addon has a property with the exact same value as an existing one,
applying the addon doesn't lead to a property modification.

Indeed, because both properties (the addon one and the existing one) are
equal, the existing one is not modified.

Add a test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 ...n_addon_prop_existing_ok-merged.dtb.expect | 20 +++++++++++++++
 ...dtaddon_addon_prop_existing_ok.dtba.expect | 17 +++++++++++++
 tests/fdtaddon_addon_prop_existing_ok.dtsa    | 25 +++++++++++++++++++
 tests/fdtaddon_base_prop_existing.dtb.expect  | 17 +++++++++++++
 tests/fdtaddon_base_prop_existing.dts         | 22 ++++++++++++++++
 tests/run_tests.sh                            | 12 +++++++++
 6 files changed, 113 insertions(+)
 create mode 100644 tests/fdtaddon_addon_prop_existing_ok-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_prop_existing_ok.dtba.expect
 create mode 100644 tests/fdtaddon_addon_prop_existing_ok.dtsa
 create mode 100644 tests/fdtaddon_base_prop_existing.dtb.expect
 create mode 100644 tests/fdtaddon_base_prop_existing.dts

diff --git a/tests/fdtaddon_addon_prop_existing_ok-merged.dtb.expect b/tests/fdtaddon_addon_prop_existing_ok-merged.dtb.expect
new file mode 100644
index 00000000..a49c3f36
--- /dev/null
+++ b/tests/fdtaddon_addon_prop_existing_ok-merged.dtb.expect
@@ -0,0 +1,20 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        // [FDT_EXPORT_SYM] 'base' -> phandle 0x00000001
+        compatible = "abc,base";
+        exist_bool;
+        exist_int = <0x0000007b>;
+        exist_string = "abcdef";
+        phandle = <0x00000001>;
+        sub-node {
+            sub_exist_bool;
+            sub_exist_int = <0x000001c8>;
+            sub_exist_string = "ghi";
+            addon-node {
+                prop;
+            };
+        };
+    };
+};
diff --git a/tests/fdtaddon_addon_prop_existing_ok.dtba.expect b/tests/fdtaddon_addon_prop_existing_ok.dtba.expect
new file mode 100644
index 00000000..c16c38c7
--- /dev/null
+++ b/tests/fdtaddon_addon_prop_existing_ok.dtba.expect
@@ -0,0 +1,17 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'base' (abc,base)
+&base {
+    exist_bool;
+    exist_int = <0x0000007b>;
+    exist_string = "abcdef";
+    sub-node {
+        sub_exist_bool;
+        sub_exist_int = <0x000001c8>;
+        sub_exist_string = "ghi";
+        addon-node {
+            prop;
+        };
+    };
+};
diff --git a/tests/fdtaddon_addon_prop_existing_ok.dtsa b/tests/fdtaddon_addon_prop_existing_ok.dtsa
new file mode 100644
index 00000000..16e525c1
--- /dev/null
+++ b/tests/fdtaddon_addon_prop_existing_ok.dtsa
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ base: "abc,base";
+
+&base {
+	exist_bool;
+	exist_int = <123>;
+	exist_string = "abcdef";
+
+	sub-node {
+		sub_exist_bool;
+		sub_exist_int = <456>;
+		sub_exist_string = "ghi";
+
+		addon-node {
+			prop;
+		};
+	};
+};
diff --git a/tests/fdtaddon_base_prop_existing.dtb.expect b/tests/fdtaddon_base_prop_existing.dtb.expect
new file mode 100644
index 00000000..2b9d3ac0
--- /dev/null
+++ b/tests/fdtaddon_base_prop_existing.dtb.expect
@@ -0,0 +1,17 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        // [FDT_EXPORT_SYM] 'base' -> phandle 0x00000001
+        compatible = "abc,base";
+        exist_bool;
+        exist_int = <0x0000007b>;
+        exist_string = "abcdef";
+        phandle = <0x00000001>;
+        sub-node {
+            sub_exist_bool;
+            sub_exist_int = <0x000001c8>;
+            sub_exist_string = "ghi";
+        };
+    };
+};
diff --git a/tests/fdtaddon_base_prop_existing.dts b/tests/fdtaddon_base_prop_existing.dts
new file mode 100644
index 00000000..7b0f7102
--- /dev/null
+++ b/tests/fdtaddon_base_prop_existing.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+
+/ {
+	base_node: base-node {
+		compatible = "abc,base";
+		exist_bool;
+		exist_int = <123>;
+		exist_string = "abcdef";
+		/export/ base: &base_node;
+
+		sub-node {
+			sub_exist_bool;
+			sub_exist_int = <456>;
+			sub_exist_string = "ghi";
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5f09bf47..0182dffc 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1322,6 +1322,18 @@ fdtaddon_tests() {
 		run_dtc_test -I dtb -O dts -o $dt-merged2.dtb.dts $dt-merged2.dtb
 		check_dts $dt-merged2.dtb.dts
 	done
+
+	# Test addon with exact same properties as ones available in the base tree
+	run_dtc_test -I dts -O dtb -o fdtaddon_base_prop_existing.dtb "$SRCDIR/fdtaddon_base_prop_existing.dts"
+	check_dtb fdtaddon_base_prop_existing.dtb
+
+	run_dtc_test -I dts -O dtb -o fdtaddon_addon_prop_existing_ok.dtba "$SRCDIR/fdtaddon_addon_prop_existing_ok.dtsa"
+	check_dtb fdtaddon_addon_prop_existing_ok.dtba
+
+	run_fdtaddon_test -i fdtaddon_base_prop_existing.dtb -o fdtaddon_addon_prop_existing_ok-merged.dtb \
+			  -t "/base-node" fdtaddon_addon_prop_existing_ok.dtba
+	check_dtb fdtaddon_addon_prop_existing_ok-merged.dtb
+
 }
 
 pylibfdt_tests () {
-- 
2.55.0

