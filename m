From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] fdtget: Support decoding phandles
Date: Thu, 31 Aug 2017 05:45:36 -0600
Message-ID: <20170831114536.55423-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=7FNiqL2CfRTMbNsCj7TrIriLrWmSoMFM88v7vJr8TgU=;
        b=db782GXrR96SiwL8qr1ntt3I6LhecUyXNGkFWUO83+FZTxtgtLAqbp/Rb8wHQGVMJI
         DS6/piC6BcEzXd2foSCa7OqPszhBIWjO+Bq4mj6SXNoK7gIHsmOiA6g5tf29nrGemOF+
         iGNHuJGW940RCccWuF5wtseoFQDZ8c8StWs+IfEH3SrXcva2PyXCnxiJhn2sCI8VkEo7
         cXWi3hrojx/yUY4hKhe2KllC0ZN6v/3U/eNqJisvdU3e995EapXsxDIN7aM7BprGW0FT
         9gu1BxRg0D8NwcANbqrCvh0cdrNqBH8bkD7pMAvoIL4gw4eam221D/d256abX8lqklVg
         auXg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Jason Clinton <jclinton-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Currently nodes with phandles just print out as plain integer values, e.g.

   $ fdtget firefly-rk3288/u-boot.dtb /gpio-keys/button@0 gpios
   112 5 1

A common use of phandles is:

   <phandle> <n cells of stuff> <phandle> <m cells of stuff>

It is useful to be able to decode these phandles and print them out in a
properly formatted way, e.g.

   $ fdtget firefly-rk3288/u-boot.dtb -P -c gpio /gpio-keys/button@0 gpios
   /pinctrl/gpio0@ff750000 5 1

Add a -P option to decode these sorts of phandles. For those which require
arguments, add a -c option to specify the name of the '#xxx-cells' property
in the target node. This allows the tool to look up the number of cells
that follow each phandle.

This feature covers a common use of phandles. Of course it is not possible
to detect phandles automatically and other uses of phandles will not be
correctly displayed by this feature.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2:
- Use 'decode' rather than 'follow'
- Be more specific in the commit message about what is and isn't supported
- Drop the unnecessary phandle_start variable

 fdtget.c           | 113 +++++++++++++++++++++++++++++++++++++++++++++++++----
 tests/label01.dts  |  30 ++++++++++++++
 tests/run_tests.sh |  18 +++++++++
 3 files changed, 154 insertions(+), 7 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 6cc5242..5efd3b4 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -46,6 +46,10 @@ struct display_info {
 	int size;		/* data size (1/2/4) */
 	enum display_mode mode;	/* display mode that we are using */
 	const char *default_val; /* default value if node/property not found */
+
+	int decode_phandle;	/* decode_phandle values */
+	/* property which defines the number of argument cells for a phandle */
+	char *phandle_cells;
 };
 
 static void report_error(const char *where, int err)
@@ -53,6 +57,59 @@ static void report_error(const char *where, int err)
 	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
 }
 
+/**
+ * Shows the target node of a phandle
+ *
+ * @param disp		Display information / options
+ * @param value		Phandle value to look up
+ * @param blob		Device tree blob (for looking up phandles)
+ * @return number of arguments expected, or -1 on error
+ */
+static int show_phandle_target(struct display_info *disp, int value,
+			       const char *blob)
+{
+	const void *cells_prop;
+	int phandle_args = 0;
+	int cells_size;
+	char buf[256];
+	int target;
+	int ret;
+
+	target = fdt_node_offset_by_phandle(blob, value);
+	if (target < 0) {
+		printf("invalid_%d", value);
+		return -1;
+	}
+
+	if (disp->phandle_cells) {
+		cells_prop = fdt_getprop(blob, target, disp->phandle_cells,
+					 &cells_size);
+		if (!cells_prop) {
+			fprintf(stderr, "Expected node '%s' to have property "
+				"'%s' but it is missing\n",
+				fdt_get_name(blob, target, NULL),
+				disp->phandle_cells);
+			return -1;
+		}
+		if (cells_size != 4) {
+			fprintf(stderr, "Expected node '%s' property '%s' size "
+				"to be 4, but it is %d\n",
+				fdt_get_name(blob, target, NULL),
+				disp->phandle_cells, cells_size);
+			return -1;
+		}
+		phandle_args = fdt32_to_cpu(*(const fdt32_t *)cells_prop);
+	}
+	ret = fdt_get_path(blob, target, buf, sizeof(buf));
+	if (ret < 0) {
+		report_error("Could not get full path", ret);
+		return -1;
+	}
+	printf("%s", buf);
+
+	return phandle_args;
+}
+
 /**
  * Shows a list of cells in the requested format
  *
@@ -60,12 +117,14 @@ static void report_error(const char *where, int err)
  * @param data		Data to display
  * @param len		Maximum length of buffer
  * @param size		Data size to use for display (e.g. 4 for 32-bit)
+ * @param blob		Device tree blob (for looking up phandles)
  * @return 0 if ok, -1 on error
  */
 static int show_cell_list(struct display_info *disp, const char *data, int len,
-			  int size)
+			  int size, const void *blob)
 {
 	const uint8_t *p = (const uint8_t *)data;
+	int phandle_args = 0; /* numnber of phandle args left to process */
 	char fmt[3];
 	int value;
 	int i;
@@ -73,12 +132,32 @@ static int show_cell_list(struct display_info *disp, const char *data, int len,
 	fmt[0] = '%';
 	fmt[1] = disp->type ? disp->type : 'd';
 	fmt[2] = '\0';
+	if (disp->decode_phandle) {
+		if (size != 4) {
+			fprintf(stderr, "Decoding phandles requires an output "
+				"size of 4 bytes\n");
+			return -1;
+		}
+	}
 	for (i = 0; i < len; i += size, p += size) {
 		if (i)
 			printf(" ");
 		value = size == 4 ? fdt32_to_cpu(*(const fdt32_t *)p) :
 			size == 2 ? (*p << 8) | p[1] : *p;
-		printf(fmt, value);
+		if (disp->decode_phandle && phandle_args <= 0) {
+			phandle_args = show_phandle_target(disp, value, blob);
+			if (phandle_args < 0)
+				return phandle_args;
+		} else {
+			printf(fmt, value);
+			if (phandle_args > 0)
+				phandle_args--;
+		}
+	}
+	if (phandle_args > 0) {
+		fprintf(stderr, "Not enough data: %d more arg(s) expected",
+			phandle_args);
+		return -1;
 	}
 
 	return 0;
@@ -93,9 +172,11 @@ static int show_cell_list(struct display_info *disp, const char *data, int len,
  * @param disp		Display information / options
  * @param data		Data to display
  * @param len		Maximum length of buffer
- * @return 0 if ok, -1 if data does not match format
+ * @param blob		Device tree blob (for looking up phandles)
+ * @return 0 if ok, -1 on error
  */
-static int show_data(struct display_info *disp, const char *data, int len)
+static int show_data(struct display_info *disp, const char *data, int len,
+		     const void *blob)
 {
 	int size;
 	const char *s;
@@ -128,7 +209,7 @@ static int show_data(struct display_info *disp, const char *data, int len)
 		return -1;
 	}
 
-	return show_cell_list(disp, data, len, size);
+	return show_cell_list(disp, data, len, size, blob);
 }
 
 /**
@@ -241,7 +322,7 @@ static int show_data_for_item(const void *blob, struct display_info *disp,
 		assert(property);
 		value = fdt_getprop(blob, node, property, &len);
 		if (value) {
-			if (show_data(disp, value, len))
+			if (show_data(disp, value, len, blob))
 				err = -1;
 			else
 				printf("\n");
@@ -310,12 +391,14 @@ static const char usage_synopsis[] =
 	"\n"
 	"Each value is printed on a new line.\n"
 	USAGE_TYPE_MSG;
-static const char usage_short_opts[] = "t:pld:" USAGE_COMMON_SHORT_OPTS;
+static const char usage_short_opts[] = "t:pld:Pc:" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
 	{"type",              a_argument, NULL, 't'},
 	{"properties",       no_argument, NULL, 'p'},
 	{"list",             no_argument, NULL, 'l'},
 	{"default",           a_argument, NULL, 'd'},
+	{"phandle",          no_argument, NULL, 'P'},
+	{"cells",             a_argument, NULL, 'c'},
 	USAGE_COMMON_LONG_OPTS,
 };
 static const char * const usage_opts_help[] = {
@@ -323,6 +406,8 @@ static const char * const usage_opts_help[] = {
 	"List properties for each node",
 	"List subnodes for each node",
 	"Default value to display when the property is missing",
+	"Print phandle targets and (with -c) args",
+	"Cells property in phandle target (e.g. 'gpio' for '#gpio-cells') ",
 	USAGE_COMMON_OPTS_HELP
 };
 
@@ -360,6 +445,20 @@ int main(int argc, char *argv[])
 		case 'd':
 			disp.default_val = optarg;
 			break;
+
+		case 'P':
+			disp.decode_phandle = 1;
+			break;
+
+		case 'c':
+			disp.phandle_cells = malloc(strlen(optarg) +
+						    strlen("#-cells"));
+			if (!disp.phandle_cells) {
+				fprintf(stderr, "Out of memory\n");
+				return 1;
+			}
+			sprintf(disp.phandle_cells, "#%s-cells", optarg);
+			break;
 		}
 	}
 
diff --git a/tests/label01.dts b/tests/label01.dts
index a895803..020e27d 100644
--- a/tests/label01.dts
+++ b/tests/label01.dts
@@ -59,5 +59,35 @@ memrsv2: /memreserve/ 0x2000000000000000 0x0100000000000000;
 		linux,platform = <0x600>;
 	};
 
+	phandle-test {
+		first = <&target_a 10 20>;
+		both = <&target_a 30 40 &target_b 50 &target_a 60 70>;
+		third = <&target_c &target_c>;
+		all = <&target_a 30 40 &target_b 50 &target_c &target_a 60 70>;
+		too-few-args = <&target_a 80>;
+		invalid-size = [01];
+		invalid-target = <&target_d>;
+	};
+
+	target_a: target@0 {
+		reg = <0 0 0 0>;
+		#gpio-cells = <2>;
+	};
+
+	target_b: target@1 {
+		reg = <1 0 0 0>;
+		#gpio-cells = <1>;
+	};
+
+	target_c: target@2 {
+		reg = <2 0 0 0>;
+		#gpio-cells = <0>;
+	};
+
+	target_d: target@3 {
+		reg = <3 0 0 0>;
+		#gpio-cells = [01];	/* invalid cell value */
+	};
+
 };
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index fa7b2f7..84a5b35 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -692,6 +692,24 @@ fdtget_tests () {
     run_fdtget_test "<the dead silence>" -tx \
 	-d "<the dead silence>" $dtb /randomnode doctor-who
     run_fdtget_test "<blink>" -tx -d "<blink>" $dtb /memory doctor-who
+
+    # Test decoding of phandles
+    run_fdtget_test "/target@0 10 20" -P -c "gpio" $dtb /phandle-test first
+    run_fdtget_test "/target@0 30 40 /target@1 50 /target@0 60 70" \
+	-P -c "gpio" $dtb /phandle-test both
+    run_fdtget_test "/target@2 /target@2" -P -c "gpio" $dtb /phandle-test third
+    run_fdtget_test "/target@0 30 40 /target@1 50 /target@2 /target@0 60 70" \
+	-P -c "gpio" $dtb /phandle-test all
+
+    # Without the -c parameter we cannot decode some phandles.
+    run_wrap_error_test $DTGET -P $dtb /phandle-test first
+    run_wrap_error_test $DTGET -P $dtb /phandle-test both
+    run_wrap_error_test $DTGET -P $dtb /phandle-test all
+    run_wrap_error_test $DTGET -P -c wrong $dtb /phandle-test all
+
+    run_wrap_error_test $DTGET -P -c gpio $dtb /phandle-test too-few-args
+    run_wrap_error_test $DTGET -P -c gpio $dtb /phandle-test invalid-size
+    run_wrap_error_test $DTGET -P -c gpio $dtb /phandle-test invalid-target
 }
 
 fdtput_tests () {
-- 
2.14.1.581.gf28d330327-goog
