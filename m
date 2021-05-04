From: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] tests: add a positive gpio test case
Date: Mon,  3 May 2021 20:59:44 -0700
Message-ID: <20210504035944.8453-5-ilya.lipnitskiy@gmail.com>
References: <20210504035944.8453-1-ilya.lipnitskiy@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BCiTMDlFrQ2oSVUCKSYvqqtheduwIs3T+9gM+cKDy9Q=;
        b=lKEZAuxNrCDeYl6/79YOa2FyeBZsBuKWQZ72DptAjZV33wxwMvBr6S0t9hI3Flg/ao
         j+QZfxoa9jlKK9p0TQLnWqJh0A6fzFMANIGGJcyl7/ZtyD0bLN3JNaQthV/jCC4ZIpGz
         6gKVlBYaqAD1mIj3BqWNyOd8s30uUTPOVlAjPrZDuTxPN2fZHgRujmOakFJGkabYGJiE
         fw+/gZC1n8X2U7UD0i/Qa+ngebtnW9yzKEX45ml0OFKO45w6o23XJ93L4yGG/87pbGR9
         x7oNJw7zKlJHg6taNRqIo1XO4HPHqFcICB2bhNLbCZl1WEegGn4bqZaW5sAsuEz/Rvvr
         2ofA==
In-Reply-To: <20210504035944.8453-1-ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Ensure that properly named properties don't trigger warnings

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 tests/good-gpio.dts | 12 ++++++++++++
 tests/run_tests.sh  |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 tests/good-gpio.dts

diff --git a/tests/good-gpio.dts b/tests/good-gpio.dts
new file mode 100644
index 000000000000..65d1c177afa5
--- /dev/null
+++ b/tests/good-gpio.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+/ {
+	gpio: gpio-controller {
+		#gpio-cells = <3>;
+	};
+
+	node {
+		foo,nr-gpios = <1>;
+		foo-gpios = <&gpio 1 2 3>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5c2b1e8dc29b..0e8ecdb40c2c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -709,10 +709,12 @@ dtc_tests () {
     check_tests "$SRCDIR/unit-addr-unique.dts" unique_unit_address
     check_tests "$SRCDIR/bad-phandle-cells.dts" interrupts_extended_property
     check_tests "$SRCDIR/bad-gpio.dts" gpios_property
+    check_tests "$SRCDIR/good-gpio.dts" -n gpios_property
     check_tests "$SRCDIR/bad-graph.dts" graph_child_address
     check_tests "$SRCDIR/bad-graph.dts" graph_port
     check_tests "$SRCDIR/bad-graph.dts" graph_endpoint
     run_sh_test "$SRCDIR/dtc-checkfails.sh" deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/bad-gpio.dts"
+    run_sh_test "$SRCDIR/dtc-checkfails.sh" -n deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/good-gpio.dts"
     check_tests "$SRCDIR/bad-interrupt-cells.dts" interrupts_property
     check_tests "$SRCDIR/bad-interrupt-controller.dts" interrupt_provider
     run_sh_test "$SRCDIR/dtc-checkfails.sh" node_name_chars -- -I dtb -O dtb bad_node_char.dtb
-- 
2.31.1

