From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 2/2] libfdt: tests: add get_next_tag_invalid_prop_len
Date: Fri,  7 Oct 2022 12:11:16 -0700
Message-ID: <20221007191116.161426-2-tadeusz.struk@linaro.org>
References: <20221007191116.161426-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdvE2IDZlB1Y3HbmvUMs04k2VVXo+MuYagZupHijn6I=;
        b=rww/nAJx/y+K/abCIaSBro5ui3XZ4A3Cv5MgZVCnElylsxOwEwHvnvkhZLfblD1O+D
         YHNYaJu8VEEQgR8VYFPR7SNxWnL50AvPgrEunHGZVkFVGxVesEn+5Yk49hKFy5D2+POI
         g+ipzxK92aVoPQTdRhb5yI6CVbjAnGGOBBc5JS9zAmHe0eyLsh3au95Wa2eBP+cjfSFF
         Sft0HLw8ND7oZY0tdUhBZVuAYU2bEKQp3BbCd91B1XI32lCZg6i7ZmFCT3qOIE2RKLTc
         SfRIO3SVkPk+DvufUVoM9qCemRPeDiTUzMYiKERlw3HujRsWvl1mszHSIMyD92/s+eXC
         GMuA==
In-Reply-To: <20221007191116.161426-1-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add a new test get_next_tag_invalid_prop_len, which covers
fdt_next_tag(), when it is passed an corrupted blob, with
invalid property len values. The test runs twice, on a blob
in sw and finished state.

Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
v5:
 * Add back fdt_finish_reservemap() instead of directly calling
   fdt_set_off_dt_strings()
 * Call the test twice, on the blob in sw, and finished state
 * Use the new fdt_get_property_by_offset_w() helper to get the
   pointer to the property at a given address.
v4:
 * I didn't keep track of the changes in the test code,
   but this version should have all the comments addressed.
---
 tests/.gitignore                      |   1 +
 tests/Makefile.tests                  |   2 +-
 tests/get_next_tag_invalid_prop_len.c | 106 ++++++++++++++++++++++++++
 tests/meson.build                     |   1 +
 tests/run_tests.sh                    |   1 +
 5 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 tests/get_next_tag_invalid_prop_len.c

diff --git a/tests/.gitignore b/tests/.gitignore
index 03bdde2..3376ed9 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -74,3 +74,4 @@ tmp.*
 /truncated_memrsv
 /utilfdt_test
 /value-labels
+/get_next_tag_invalid_prop_len
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 2d36c5d..2c5b4c9 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -4,7 +4,7 @@ LIB_TESTS_L = get_mem_rsv \
 	get_path supernode_atdepth_offset parent_offset \
 	node_offset_by_prop_value node_offset_by_phandle \
 	node_check_compatible node_offset_by_compatible \
-	get_alias \
+	get_alias get_next_tag_invalid_prop_len \
 	char_literal \
 	sized_cells \
 	notfound \
diff --git a/tests/get_next_tag_invalid_prop_len.c b/tests/get_next_tag_invalid_prop_len.c
new file mode 100644
index 0000000..dc42412
--- /dev/null
+++ b/tests/get_next_tag_invalid_prop_len.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for fdt_next_tag()
+ */
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+#include <libfdt.h>
+#include "tests.h"
+#include "testdata.h"
+
+#define FDT_SIZE 65536
+#define RET_FAIL(fmt, ...) \
+({ \
+	printf("FAIL\t"fmt "\n", ##__VA_ARGS__); \
+	return -1; \
+})
+#define CHECK_ERR(err) \
+({ if (err) \
+	FAIL("%s: %d: %s", __FILE__, __LINE__, fdt_strerror(err)); \
+})
+
+static int fdt_next_tag_test(bool fdt_finished)
+{
+	struct fdt_property *prp;
+	void *fdt;
+	int nextoff = 0, offset, err;
+	uint32_t tag;
+
+	fdt = malloc(FDT_SIZE);
+	if (!fdt)
+		FAIL("Can't allocate memory");
+	err = fdt_create(fdt, FDT_SIZE);
+	CHECK_ERR(err);
+	err = fdt_finish_reservemap(fdt);
+	CHECK_ERR(err);
+	/* Create a root node and add two properties */
+	err = fdt_begin_node(fdt, "");
+	CHECK_ERR(err);
+	err = fdt_property_u32(fdt, "prop-int-32", 0x1234);
+	CHECK_ERR(err);
+	err = fdt_property_u32(fdt, "prop2-int-32", 0x4321);
+	CHECK_ERR(err);
+	err = fdt_end_node(fdt);
+	CHECK_ERR(err);
+	if (fdt_finished) {
+		/* Call ftd_finish to set the correct ftd state. */
+		err = fdt_finish(fdt);
+		CHECK_ERR(err);
+	}
+
+	offset = fdt_first_property_offset(fdt, 0);
+	if (offset <= 0)
+		RET_FAIL("Invalid offset %x, expected value greater than 0\n", offset);
+
+	/* Normal case */
+	tag = fdt_next_tag(fdt, offset, &nextoff);
+	if (tag != FDT_PROP)
+		RET_FAIL("Invalid tag %x, expected FDT_PROP\n", tag);
+	if (nextoff <= 0)
+		RET_FAIL("Invalid nextoff %d, expected value greater than 0", nextoff);
+
+	/* Get a writable ptr to the first property and corrupt the lenght */
+	prp = fdt_get_property_by_offset_w(fdt, offset, NULL);
+	if (!prp)
+		RET_FAIL("Bad property pointer");
+
+	/* int overflow case */
+	prp->len = cpu_to_fdt32(0xFFFFFFFA);
+	tag = fdt_next_tag(fdt, offset, &nextoff);
+	if (tag != FDT_END)
+		RET_FAIL("Invalid tag %x, expected premature FDT_END", tag);
+	if (nextoff != -FDT_ERR_BADSTRUCTURE)
+		RET_FAIL("Invalid nextoff, expected error -FDT_ERR_BADSTRUCTURE");
+
+	/* negative offset case */
+	prp->len = cpu_to_fdt32(0x7FFFFFFA);
+	tag = fdt_next_tag(fdt, offset, &nextoff);
+	if (tag != FDT_END)
+		RET_FAIL("Invalid tag %x, expected premature FDT_END", tag);
+	if (nextoff != -FDT_ERR_BADSTRUCTURE)
+		RET_FAIL("Invalid nextoff, expected error -FDT_ERR_BADSTRUCTURE");
+
+	free(fdt);
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int res;
+
+	test_init(argc, argv);
+
+	res = fdt_next_tag_test(false);
+	if (res)
+		FAIL("Failed test ftd in sw state");
+
+	res = fdt_next_tag_test(true);
+	if (res)
+		FAIL("Failed test ftd in finished state");
+
+	PASS();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 4ac154a..29a42dd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -47,6 +47,7 @@ tests = [
   'get_path',
   'get_phandle',
   'get_prop_offset',
+  'get_next_tag_invalid_prop_len',
   'getprop',
   'incbin',
   'integer-expressions',
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 244df8a..46678cb 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -513,6 +513,7 @@ libfdt_tests () {
     run_dtc_test -I fs -O dts -o fs.test_tree1.test.dts $FSBASE/test_tree1
     run_dtc_test -I fs -O dtb -o fs.test_tree1.test.dtb $FSBASE/test_tree1
     run_test dtbs_equal_unordered -m fs.test_tree1.test.dtb test_tree1.dtb
+    run_test get_next_tag_invalid_prop_len
 
     ## https://github.com/dgibson/dtc/issues/64
     check_tests "$SRCDIR/phandle-args-overflow.dts" clocks_property
-- 
2.37.3

