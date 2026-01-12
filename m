Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26A36CE0F;
	Mon, 12 Jan 2026 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227743; cv=none; b=TP3z6nrCaSNAAtu55T5qGDvaVh7MupJ1E2SXwqNKK/oijXDqzqUv8mlEXsQZbBjv82wmflvrmPBMg6UpUweiDuiY8aBFr2akFg/tlCexi3iRTb+K38+niAUeutRVnANy9RiTYZGjSD0ca64B6pTaHQo/79IbkqiS+kchRUGk0e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227743; c=relaxed/simple;
	bh=0M8XNmBY1yKUUSlRfL8H3pbRWlYo1oD6dG5zGNIxxic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sf8C+ZVo2Axe27JDQJzAnpFMkGppor6I+MuaM/RF3yQqeY0QfZEOteeVzFMpFOR9iChu/epW4hMp9GQ0nNkKthvciYleY5zrZM1Ii8Qgeki6KzsMG/v1gPveuhvgM9ziDN7sKFo5+PEu5mPGIALYj/C4YQ6gLznywrK5cfney0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AX1bYBZu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AX1bYBZu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EFF6FC2086B;
	Mon, 12 Jan 2026 14:21:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 745A1606FA;
	Mon, 12 Jan 2026 14:22:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83CE9103C9261;
	Mon, 12 Jan 2026 15:22:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227737; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FTTQodoOY8eHd0/51O2e4714Yyvm5TtIBXzgYmLLMp0=;
	b=AX1bYBZuTBQzNqTHTgpVadBAqnGF4mC78KYK83qGKO+6vDWrST4+9nIQwsI9l9qB82ZWCI
	8pX75z2FY6cwuFXfAS/9ZDTDAkE2go3J9bdhv2fWJsGI4dBZjJHO1LxfnhbGsDjA4C6QJm
	CMb33igdfvXw9nr2vm9XnRXtA9AVvs1BTx+W5qlNGW78KdKn++8T4IXyytDBE8mK2g2YhA
	6G5bTtXqKmYW9c2eHel3gzaJ6o0AR2X4C0qRCXvulNf9YpO85CzBFGvNeb3rgAWWRoYmb8
	jXm30BI3V/fpU/iQA0VZwD6ACSY6CiytP1FDa12q48wF0VaPTakhsu/C3pmpfg==
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
Subject: [RFC PATCH 76/77] tests: fdtaddon: Add a test for using 'stacked' addons
Date: Mon, 12 Jan 2026 15:20:06 +0100
Message-ID: <20260112142009.1006236-77-herve.codina@bootlin.com>
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

Addon can be stacked on top of each other.

A first addon can be applied. This first addon exports some symbols and
those exported symbols can be used by a second addon.

Add a test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../fdtaddon_stack_1st-merged.dtb.dts.expect  | 51 ++++++++++++++
 tests/fdtaddon_stack_1st-merged.dtb.expect    | 41 +++++++++++
 tests/fdtaddon_stack_1st.dtba.expect          | 24 +++++++
 tests/fdtaddon_stack_1st.dtsa                 | 27 +++++++
 .../fdtaddon_stack_2nd-merged.dtb.dts.expect  | 70 +++++++++++++++++++
 tests/fdtaddon_stack_2nd-merged.dtb.expect    | 59 ++++++++++++++++
 tests/fdtaddon_stack_2nd.dtba.expect          | 30 ++++++++
 tests/fdtaddon_stack_2nd.dtsa                 | 35 ++++++++++
 tests/run_tests.sh                            | 21 ++++++
 9 files changed, 358 insertions(+)
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
index 0000000..eb6ee30
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
+					/export/ other: &{/somewhere/node-a1/addon1-node/sub-node-other};
+					/export/ base_other: &{/base-node/sub-node};
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
index 0000000..332bb26
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
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            addon1-node {
+                ref-other = <0x00000002 0x0000000a>;
+                // [FDT_REF_LOCAL] ref-other[0]
+                prop = <0x00000000>;
+                sub-node-other {
+                    phandle = <0x00000005>;
+                    prop = <0x00000001>;
+                };
+                sub-node-stack1 {
+                    phandle = <0x00000004>;
+                    prop = <0x00000000>;
+                    compatible = "abc,bbb";
+                    // [FDT_EXPORT_SYM] 'stack' -> phandle 0x00000004
+                    // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000005
+                    // [FDT_EXPORT_SYM] 'base_other' -> phandle 0x00000002
+                };
+            };
+        };
+        node-a2 {
+            compatible = "abc,aaa";
+            phandle = <0x00000003>;
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000003
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+        };
+    };
+};
diff --git a/tests/fdtaddon_stack_1st.dtba.expect b/tests/fdtaddon_stack_1st.dtba.expect
new file mode 100644
index 0000000..1e1ce57
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
+        // [FDT_REF_PHANDLE] ref-other[0], ref = other
+        sub-node-stack1 {
+            compatible = "abc,bbb";
+            prop = <0x00000000>;
+            phandle = <0x00000001>;
+            // [FDT_EXPORT_SYM] 'stack' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            // [FDT_EXPORT_SYM_REF] 'base_other' -> 'other'
+        };
+        sub-node-other {
+            prop = <0x00000001>;
+            phandle = <0x00000002>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_stack_1st.dtsa b/tests/fdtaddon_stack_1st.dtsa
new file mode 100644
index 0000000..5529dde
--- /dev/null
+++ b/tests/fdtaddon_stack_1st.dtsa
@@ -0,0 +1,27 @@
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
+			/export/ other: &new_other;
+			/export/ base_other: &other;
+		};
+		new_other: sub-node-other {
+			prop = <1>;
+		};
+	};
+};
diff --git a/tests/fdtaddon_stack_2nd-merged.dtb.dts.expect b/tests/fdtaddon_stack_2nd-merged.dtb.dts.expect
new file mode 100644
index 0000000..af31f05
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
+					/export/ other: &{/somewhere/node-a1/addon1-node/sub-node-other};
+					/export/ base_other: &{/base-node/sub-node};
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
index 0000000..ccae793
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
+                // [FDT_REF_LOCAL] ref[0]
+                prop = <0x00000001>;
+            };
+        };
+    };
+    somewhere {
+        node-a1 {
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000001
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+            addon1-node {
+                ref-other = <0x00000002 0x0000000a>;
+                // [FDT_REF_LOCAL] ref-other[0]
+                prop = <0x00000000>;
+                sub-node-other {
+                    phandle = <0x00000005>;
+                    prop = <0x00000001>;
+                    addon2-node-other {
+                        prop = <0x00000002>;
+                        // [FDT_REF_LOCAL] prop[0]
+                        addon2-subnode {
+                            prop = <0x00000002>;
+                        };
+                    };
+                };
+                sub-node-stack1 {
+                    phandle = <0x00000004>;
+                    prop = <0x00000000>;
+                    compatible = "abc,bbb";
+                    // [FDT_EXPORT_SYM] 'stack' -> phandle 0x00000004
+                    // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000005
+                    // [FDT_EXPORT_SYM] 'base_other' -> phandle 0x00000002
+                    addon2-node {
+                        phandle = <0x00000006>;
+                        ref-other = <0x00000005 0x0000000a>;
+                        // [FDT_REF_LOCAL] ref-other[0]
+                        prop = <0x00000000>;
+                    };
+                };
+            };
+        };
+        node-a2 {
+            compatible = "abc,aaa";
+            phandle = <0x00000003>;
+            // [FDT_EXPORT_SYM] 'node_a' -> phandle 0x00000003
+            // [FDT_EXPORT_SYM] 'other' -> phandle 0x00000002
+        };
+    };
+};
diff --git a/tests/fdtaddon_stack_2nd.dtba.expect b/tests/fdtaddon_stack_2nd.dtba.expect
new file mode 100644
index 0000000..dbb8afa
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
+        // [FDT_REF_PHANDLE] ref-other[0], ref = other
+        phandle = <0x00000001>;
+    };
+};
+&other {
+    addon2-node-other {
+        prop = <0xffffffff>;
+        // [FDT_REF_PHANDLE] prop[0], ref = base_other
+        addon2-subnode {
+            prop = <0x00000002>;
+        };
+    };
+};
+&base_other {
+    addon2-node-base-other {
+        prop = <0x00000001>;
+        ref = <0x00000001>;
+        // [FDT_REF_LOCAL] ref[0]
+    };
+};
diff --git a/tests/fdtaddon_stack_2nd.dtsa b/tests/fdtaddon_stack_2nd.dtsa
new file mode 100644
index 0000000..21d80d2
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
index 2cdfd89..69ca39e 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1221,6 +1221,27 @@ fdtaddon_tests() {
 
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
2.52.0

