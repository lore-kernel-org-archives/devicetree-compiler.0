From: Johannes Beisswenger <johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] tests: Add test cases for bad endpoint node and remote-endpoint prop checks
Date: Fri, 28 Apr 2023 15:38:33 +0200
Message-ID: <20230428133834.78178-2-johannes.beisswenger@cetitec.com>
References: <20230428133834.78178-1-johannes.beisswenger@cetitec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cetitec.com;
        s=cetitec.com; t=1682689163;
        bh=jrlpJjL0I/FlTXjZr/rAr1x624qNcDsWpy5jOiXUA5w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=psaQUwSgSD8KnfR+j8ZuWQxl9LOmf8e0+ja60aBNlOj52NgmWJ/PlF09NCniNYt1C
         kbNCkKLyPJg+kVZbBTpxAQvOwSMnPPLw0fJsMUKpWcb3U/BVTD1Cj6SybD4H9h91VW
         UrDkLbsPBP29rO0Xngk9N5p/mnXyzG4OFXm6Tpig=
In-Reply-To: <20230428133834.78178-1-johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Johannes Beisswenger <johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>

Signed-off-by: Johannes Beisswenger <johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>
---
 tests/bad-graph-root1.dts |  7 +++++++
 tests/bad-graph-root2.dts |  2 ++
 tests/bad-graph-root3.dts | 14 ++++++++++++++
 tests/bad-graph-root4.dts | 19 +++++++++++++++++++
 tests/run_tests.sh        |  4 ++++
 5 files changed, 46 insertions(+)
 create mode 100644 tests/bad-graph-root1.dts
 create mode 100644 tests/bad-graph-root2.dts
 create mode 100644 tests/bad-graph-root3.dts
 create mode 100644 tests/bad-graph-root4.dts

diff --git a/tests/bad-graph-root1.dts b/tests/bad-graph-root1.dts
new file mode 100644
index 0000000..06cf915
--- /dev/null
+++ b/tests/bad-graph-root1.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+
+/ {
+	foo {
+                remote-endpoint = <0xdeadbeef>;
+	};
+};
diff --git a/tests/bad-graph-root2.dts b/tests/bad-graph-root2.dts
new file mode 100644
index 0000000..026f207
--- /dev/null
+++ b/tests/bad-graph-root2.dts
@@ -0,0 +1,2 @@
+/dts-v1/;
+/ {	endpoint {};  };
diff --git a/tests/bad-graph-root3.dts b/tests/bad-graph-root3.dts
new file mode 100644
index 0000000..7360013
--- /dev/null
+++ b/tests/bad-graph-root3.dts
@@ -0,0 +1,14 @@
+/dts-v1/;
+
+ / {
+	bar: bar {
+		port {
+			bar_con: endpoint {
+				remote-endpoint = <&foo_con>;
+			};
+		};
+	};
+	foo_con: endpoint {
+		remote-endpoint = <&bar_con>;
+	};
+};
diff --git a/tests/bad-graph-root4.dts b/tests/bad-graph-root4.dts
new file mode 100644
index 0000000..5b1a1ea
--- /dev/null
+++ b/tests/bad-graph-root4.dts
@@ -0,0 +1,19 @@
+/dts-v1/;
+
+ / {
+
+	bar: bar {
+		port {
+			bar_con: endpoint {
+				remote-endpoint = <&foo_con>;
+			};
+		};
+	};
+	foo {
+		remote-endpoint = <&bar_con>; // misplaced remote-endpoint property
+		port {
+			foo_con: endpoint {
+			};
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f899d8c..2af8c15 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -730,6 +730,10 @@ dtc_tests () {
     check_tests "$SRCDIR/bad-graph.dts" graph_child_address
     check_tests "$SRCDIR/bad-graph.dts" graph_port
     check_tests "$SRCDIR/bad-graph.dts" graph_endpoint
+    check_tests "$SRCDIR/bad-graph-root1.dts" graph_nodes
+    check_tests "$SRCDIR/bad-graph-root2.dts" graph_nodes
+    check_tests "$SRCDIR/bad-graph-root3.dts" graph_nodes
+    check_tests "$SRCDIR/bad-graph-root4.dts" graph_nodes
     run_sh_test "$SRCDIR/dtc-checkfails.sh" deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/bad-gpio.dts"
     run_sh_test "$SRCDIR/dtc-checkfails.sh" -n deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/good-gpio.dts"
     check_tests "$SRCDIR/bad-interrupt-cells.dts" interrupts_property
-- 
2.40.0

