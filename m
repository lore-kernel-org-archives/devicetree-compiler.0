Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08E242125B;
	Wed, 26 Aug 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738077; cv=none; b=Y19S6nNFTv8iZcDib8br3Lm7nDU9M4WyVOVvRdBlF886O2ZywCs+NF8BakWmx7hbpaCTze2wDjtDv01Nn97QG6x9Iqy+hKGWQZI0u9h/LGG7nL4JuzGRxA8NXscsHT4OO+rf445ouify+odjOOw5mJ23kSmM7RSYvUl19TFppg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738077; c=relaxed/simple;
	bh=O5IhQ/iDR3RIlHC6nNY5F2D7oss/2qXrH/QcBlRIArg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjgcpvMWaVn4FQU1T9MmsMo2xj3eUMYC4kNd+/nrdaERncrws0yMF3UnabeSbASJRobJUskxr51ygXxdCyssIM8e1NLszGDNuRV95j0GiinXQFWxTgIpwAqcoDI2IVn9CgZ3KEtrvbJJc+O+GOTyhahi8GHmaBiNhesEeFqRnIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cD5Z1HXT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cD5Z1HXT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7A2ED4E413BC;
	Wed, 26 Aug 2026 09:54:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E5DD604EC;
	Wed, 26 Aug 2026 09:54:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 658B611C7ACD5;
	Wed, 26 Aug 2026 11:54:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738068; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2BdnEMOy39b+aLJF43GGwMZUSCor1vCwKYvaphRBRvk=;
	b=cD5Z1HXTfXsVjnWXmoWd5nQ+kg59xxvpWhEjyMhvAQvHUvdk+mcJnTBYfpQG1ZQLZt6EoQ
	hI9omoPfEHflbeGP4WNx+q75Q+VpKS1E92inoQUhRgU4xNtfpfM5qVJ++rW1TTdvItDRat
	WaMdXg6iBz5A7SuBWl2XuI6k8mwfW5yGruS7xNIVqF5Q3CfAQVKaX8D8nloZJztH0Z/njY
	+piw74aJ7EYu5vWmUPyN8KkK3vcWqj2mmg8PA+ietMqNZEpv0m4c2n8P/JVur8RB28Hi/j
	Kn+JD4RYjbmiGYWfqVTVuu38+RwtPiL6wdrhJqVWMM+flEqKEuV4My6eX374xg==
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
Subject: [RFC PATCH v2 71/74] tests: fdtaddon: Add a test for using 'stacked' addons
Date: Wed, 26 Aug 2026 11:49:40 +0200
Message-ID: <20260826094950.1088288-72-herve.codina@bootlin.com>
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

Addon can be stacked on top of each other.

A first addon can be applied. This first addon exports some symbols and
those exported symbols can be used by a second addon.

Add a test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../fdtaddon_stack_1st-merged.dtb.dts.expect  | 51 ++++++++++++++
 tests/fdtaddon_stack_1st-merged.dtb.expect    | 41 +++++++++++
 tests/fdtaddon_stack_1st.dtba.expect          | 24 +++++++
 tests/fdtaddon_stack_1st.dtsa                 | 28 ++++++++
 .../fdtaddon_stack_2nd-merged.dtb.dts.expect  | 70 +++++++++++++++++++
 tests/fdtaddon_stack_2nd-merged.dtb.expect    | 59 ++++++++++++++++
 tests/fdtaddon_stack_2nd.dtba.expect          | 30 ++++++++
 tests/fdtaddon_stack_2nd.dtsa                 | 35 ++++++++++
 tests/run_tests.sh                            | 21 ++++++
 9 files changed, 359 insertions(+)
 create mode 100644 tests/fdtaddon_stack_1st-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_stack_1st-merged.dtb.expect
 create mode 100644 tests/fdtaddon_stack_1st.dtba.expect
 create mode 100644 tests/fdtaddon_stack_1st.dtsa
 create mode 100644 tests/fdtaddon_stack_2nd-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_stack_2nd-merged.dtb.expect
 create mode 100644 tests/fdtaddon_stack_2nd.dtba.expect
 create mode 100644 tests/fdtaddon_stack_2nd.dtsa

diff --git a/tests/fdtaddon_stack_1st-merged.dtb.dts.expect b/tests/fdtaddon_stack_1st-merged.dtb.dts.expect
new file mode 100644
index 00000000..766f3c94
--- /dev/null
+++ b/tests/fdtaddon_stack_1st-merged.dtb.dts.expect
@@ -0,0 +1,51 @@
+/dts-v1/;
+
+/ {
+
+	base-node {
+
+		sub-node {
+			prop = <0x00>;
+			phandle = <0x02>;
+		};
+	};
+
+	somewhere {
+
+		node-a1 {
+			compatible = "abc,aaa";
+			phandle = <0x01>;
+
+			/export/ node_a: &{/somewhere/node-a1};
+			/export/ other: &{/base-node/sub-node};
+
+			addon1-node {
+				ref-other = <&{/base-node/sub-node} 0x0a>;
+				prop = <0x00>;
+
+				sub-node-other {
+					phandle = <0x05>;
+					prop = <0x01>;
+				};
+
+				sub-node-stack1 {
+					phandle = <0x04>;
+					prop = <0x00>;
+					compatible = "abc,bbb";
+
+					/export/ stack: &{/somewhere/node-a1/addon1-node/sub-node-stack1};
+					/export/ base_other: &{/base-node/sub-node};
+					/export/ other: &{/somewhere/node-a1/addon1-node/sub-node-other};
+				};
+			};
+		};
+
+		node-a2 {
+			compatible = "abc,aaa";
+			phandle = <0x03>;
+
+			/export/ node_a: &{/somewhere/node-a2};
+			/export/ other: &{/base-node/sub-node};
+		};
+	};
+};
diff --git a/tests/fdtaddon_stack_1st-merged.dtb.expect b/tests/fdtaddon_stack_1st-merged.dtb.expect
new file mode 100644
index 00000000..367695a0
--- /dev/null
+++ b/tests/fdtaddon_stack_1st-merged.dtb.expect
@@ -0,0 +1,41 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        sub-node {
+            prop = <0x00000000>;
+            phandle = <0x00000002>;
+        };
+    };
+    somewhere {
+        node-a1 {
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            addon1-node {
+                ref-other = <0x00000002 0x0000000a>;
+                // [FDT_PROPDATA_PHANDLE] ref-other[0]
+                prop = <0x00000000>;
+                sub-node-other {
+                    phandle = <0x00000005>;
+                    prop = <0x00000001>;
+                };
+                sub-node-stack1 {
+                    // [FDT_EXPORT_SYM] 'stack' -> phandle 0x00000004
+                    // [FDT_EXPORT_SYM] 'base_other' -> phandle 0x00000002
+                    // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000005
+                    phandle = <0x00000004>;
+                    prop = <0x00000000>;
+                    compatible = "abc,bbb";
+                };
+            };
+        };
+        node-a2 {
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000003
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000003>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_stack_1st.dtba.expect b/tests/fdtaddon_stack_1st.dtba.expect
new file mode 100644
index 00000000..cd0d89a0
--- /dev/null
+++ b/tests/fdtaddon_stack_1st.dtba.expect
@@ -0,0 +1,24 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'node_a' (abc,aaa)
+// [FDT_IMPORT_SYM] 'other' ()
+&node_a {
+    addon1-node {
+        prop = <0x00000000>;
+        ref-other = <0xffffffff 0x0000000a>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref-other[0], ref = other
+        sub-node-stack1 {
+            // [FDT_EXPORT_SYM] 'stack' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM_REF] 'base_other' -> 'other'
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,bbb";
+            prop = <0x00000000>;
+            phandle = <0x00000001>;
+        };
+        sub-node-other {
+            prop = <0x00000001>;
+            phandle = <0x00000002>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_stack_1st.dtsa b/tests/fdtaddon_stack_1st.dtsa
new file mode 100644
index 00000000..c4c86ff9
--- /dev/null
+++ b/tests/fdtaddon_stack_1st.dtsa
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ node_a: "abc,aaa";
+/import/ other: "";
+
+&node_a {
+	addon1-node {
+		prop = <0>;
+		ref-other = <&other 10>;
+		stack1: sub-node-stack1 {
+			compatible = "abc,bbb";
+			prop = <0>;
+			/export/ stack: &stack1;
+			/export/ base_other: &other;
+			/export/ other: &new_other;
+
+		};
+		new_other: sub-node-other {
+			prop = <1>;
+		};
+	};
+};
diff --git a/tests/fdtaddon_stack_2nd-merged.dtb.dts.expect b/tests/fdtaddon_stack_2nd-merged.dtb.dts.expect
new file mode 100644
index 00000000..fd38dc8c
--- /dev/null
+++ b/tests/fdtaddon_stack_2nd-merged.dtb.dts.expect
@@ -0,0 +1,70 @@
+/dts-v1/;
+
+/ {
+
+	base-node {
+
+		sub-node {
+			prop = <0x00>;
+			phandle = <0x02>;
+
+			addon2-node-base-other {
+				ref = <&{/somewhere/node-a1/addon1-node/sub-node-stack1/addon2-node}>;
+				prop = <0x01>;
+			};
+		};
+	};
+
+	somewhere {
+
+		node-a1 {
+			compatible = "abc,aaa";
+			phandle = <0x01>;
+
+			/export/ node_a: &{/somewhere/node-a1};
+			/export/ other: &{/base-node/sub-node};
+
+			addon1-node {
+				ref-other = <&{/base-node/sub-node} 0x0a>;
+				prop = <0x00>;
+
+				sub-node-other {
+					phandle = <0x05>;
+					prop = <0x01>;
+
+					addon2-node-other {
+						prop = <&{/base-node/sub-node}>;
+
+						addon2-subnode {
+							prop = <0x02>;
+						};
+					};
+				};
+
+				sub-node-stack1 {
+					phandle = <0x04>;
+					prop = <0x00>;
+					compatible = "abc,bbb";
+
+					/export/ stack: &{/somewhere/node-a1/addon1-node/sub-node-stack1};
+					/export/ base_other: &{/base-node/sub-node};
+					/export/ other: &{/somewhere/node-a1/addon1-node/sub-node-other};
+
+					addon2-node {
+						phandle = <0x06>;
+						ref-other = <&{/somewhere/node-a1/addon1-node/sub-node-other} 0x0a>;
+						prop = <0x00>;
+					};
+				};
+			};
+		};
+
+		node-a2 {
+			compatible = "abc,aaa";
+			phandle = <0x03>;
+
+			/export/ node_a: &{/somewhere/node-a2};
+			/export/ other: &{/base-node/sub-node};
+		};
+	};
+};
diff --git a/tests/fdtaddon_stack_2nd-merged.dtb.expect b/tests/fdtaddon_stack_2nd-merged.dtb.expect
new file mode 100644
index 00000000..1d45dd23
--- /dev/null
+++ b/tests/fdtaddon_stack_2nd-merged.dtb.expect
@@ -0,0 +1,59 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        sub-node {
+            prop = <0x00000000>;
+            phandle = <0x00000002>;
+            addon2-node-base-other {
+                ref = <0x00000006>;
+                // [FDT_PROPDATA_PHANDLE] ref[0]
+                prop = <0x00000001>;
+            };
+        };
+    };
+    somewhere {
+        node-a1 {
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            addon1-node {
+                ref-other = <0x00000002 0x0000000a>;
+                // [FDT_PROPDATA_PHANDLE] ref-other[0]
+                prop = <0x00000000>;
+                sub-node-other {
+                    phandle = <0x00000005>;
+                    prop = <0x00000001>;
+                    addon2-node-other {
+                        prop = <0x00000002>;
+                        // [FDT_PROPDATA_PHANDLE] prop[0]
+                        addon2-subnode {
+                            prop = <0x00000002>;
+                        };
+                    };
+                };
+                sub-node-stack1 {
+                    // [FDT_EXPORT_SYM] 'stack' -> phandle 0x00000004
+                    // [FDT_EXPORT_SYM] 'base_other' -> phandle 0x00000002
+                    // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000005
+                    phandle = <0x00000004>;
+                    prop = <0x00000000>;
+                    compatible = "abc,bbb";
+                    addon2-node {
+                        phandle = <0x00000006>;
+                        ref-other = <0x00000005 0x0000000a>;
+                        // [FDT_PROPDATA_PHANDLE] ref-other[0]
+                        prop = <0x00000000>;
+                    };
+                };
+            };
+        };
+        node-a2 {
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000003
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            compatible = "abc,aaa";
+            phandle = <0x00000003>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_stack_2nd.dtba.expect b/tests/fdtaddon_stack_2nd.dtba.expect
new file mode 100644
index 00000000..2e0f948a
--- /dev/null
+++ b/tests/fdtaddon_stack_2nd.dtba.expect
@@ -0,0 +1,30 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'stack' (abc,bbb)
+// [FDT_IMPORT_SYM] 'other' ()
+// [FDT_IMPORT_SYM] 'base_other' ()
+&stack {
+    addon2-node {
+        prop = <0x00000000>;
+        ref-other = <0xffffffff 0x0000000a>;
+        // [FDT_PROPDATA_PHANDLE_REF] ref-other[0], ref = other
+        phandle = <0x00000001>;
+    };
+};
+&other {
+    addon2-node-other {
+        prop = <0xffffffff>;
+        // [FDT_PROPDATA_PHANDLE_REF] prop[0], ref = base_other
+        addon2-subnode {
+            prop = <0x00000002>;
+        };
+    };
+};
+&base_other {
+    addon2-node-base-other {
+        prop = <0x00000001>;
+        ref = <0x00000001>;
+        // [FDT_PROPDATA_PHANDLE] ref[0]
+    };
+};
diff --git a/tests/fdtaddon_stack_2nd.dtsa b/tests/fdtaddon_stack_2nd.dtsa
new file mode 100644
index 00000000..21d80d2a
--- /dev/null
+++ b/tests/fdtaddon_stack_2nd.dtsa
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ stack: "abc,bbb";
+/import/ other: "";
+/import/ base_other: "";
+
+&stack {
+	addon2_node: addon2-node {
+		prop = <0>;
+		ref-other = <&other 10>;
+	};
+};
+
+&other {
+	addon2-node-other {
+		prop = <&base_other>;
+
+		addon2-subnode {
+			prop = <2>;
+		};
+	};
+};
+
+&base_other {
+	addon2-node-base-other {
+		prop = <1>;
+		ref = <&addon2_node>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 8f8db608..d634274d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1347,6 +1347,27 @@ fdtaddon_tests() {
 
 	run_dtc_test -I dtb -O dts -o fdtaddon_addon_namespace-merged.dtb.dts fdtaddon_addon_namespace-merged.dtb
 	check_dts fdtaddon_addon_namespace-merged.dtb.dts
+
+	# test stacked addons
+	run_dtc_test -I dts -O dtb -o fdtaddon_stack_1st.dtba "$SRCDIR/fdtaddon_stack_1st.dtsa"
+	check_dtb fdtaddon_stack_1st.dtba
+
+	run_fdtaddon_test -i fdtaddon_base.dtb -o fdtaddon_stack_1st-merged.dtb \
+			  -t "/somewhere/node-a1" fdtaddon_stack_1st.dtba
+	check_dtb fdtaddon_stack_1st-merged.dtb
+
+	run_dtc_test -I dtb -O dts -o fdtaddon_stack_1st-merged.dtb.dts fdtaddon_stack_1st-merged.dtb
+	check_dts fdtaddon_stack_1st-merged.dtb.dts
+
+	run_dtc_test -I dts -O dtb -o fdtaddon_stack_2nd.dtba "$SRCDIR/fdtaddon_stack_2nd.dtsa"
+	check_dtb fdtaddon_stack_2nd.dtba
+
+	run_fdtaddon_test -i fdtaddon_stack_1st-merged.dtb -o fdtaddon_stack_2nd-merged.dtb \
+			  -t "/somewhere/node-a1/addon1-node/sub-node-stack1" fdtaddon_stack_2nd.dtba
+	check_dtb fdtaddon_stack_2nd-merged.dtb
+
+	run_dtc_test -I dtb -O dts -o fdtaddon_stack_2nd-merged.dtb.dts fdtaddon_stack_2nd-merged.dtb
+	check_dts fdtaddon_stack_2nd-merged.dtb.dts
 }
 
 pylibfdt_tests () {
-- 
2.55.0

