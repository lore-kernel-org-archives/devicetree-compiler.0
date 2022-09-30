From: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/2] libfdt: tests: add get_next_tag_invalid_prop_len
Date: Fri, 30 Sep 2022 08:20:04 -0700
Message-ID: <20220930152004.674591-2-tadeusz.struk@linaro.org>
References: <20220930152004.674591-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Vz9lA0F1yHOg7HfAgSRPTst4o2oZQcaGQFkK3cA66Go=;
        b=Znl4T2a/aOuQ4qL8DqBD6ZHf2vsPqVNSAFlUD80feoyqFFLZv/bsarrO1vM494MOJa
         jQUtfOuINTBL2HrshAitY0cIENMLmb0PD4zMKkMx21p3wqC8yxqXptCVH1Vz6k5jr8gQ
         swGSk+K3IvFVH59NjyFoBs0oOIsPRUwiKOU6xMiiYB7J9Ph2vplQgqHrOUmydvBi2ZFw
         YugaCkvAJR0bN6e4BpDzetlc0xNiYgC6lWx9Jh78uq9qqi1ehId+Sv2dac1aLxH+0dG1
         T23ZT47tqAcRzPxd+qMbdaAIDO1w+8Jn7KFpuIPgxvVHeCzy6sPshXyfSMozyuaKNvi8
         L4IQ==
In-Reply-To: <20220930152004.674591-1-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add a new test get_next_tag_invalid_prop_len, which covers
fdt_next_tag(), when it is passed an corrupted blob, with
invalid property len values.

Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 tests/.gitignore                      |  1 +
 tests/Makefile.tests                  |  2 +-
 tests/get_next_tag_invalid_prop_len.c | 65 +++++++++++++++++++++++++++
 tests/meson.build                     |  1 +
 tests/run_tests.sh                    |  1 +
 5 files changed, 69 insertions(+), 1 deletion(-)
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
index 0000000..c02f6a3
--- /dev/null
+++ b/tests/get_next_tag_invalid_prop_len.c
@@ -0,0 +1,65 @@
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
+int main(int argc, char *argv[])
+{
+	struct fdt_header *hdr;
+	struct fdt_property *prp;
+	void *fdt;
+	int size, nextoff = 0;
+	uint32_t tag;
+
+	test_init(argc, argv);
+	size = sizeof(*hdr) + sizeof(*prp) + 256;
+	fdt = calloc(1, size);
+	if (!fdt)
+		FAIL("Can't allocate memory");
+
+	hdr = fdt;
+	prp = (struct fdt_property *)(((char *) fdt) + sizeof(*hdr));
+	fdt_set_magic(fdt, FDT_MAGIC);
+	fdt_set_totalsize(fdt, size);
+	fdt_set_version(fdt, 0x10);
+	prp->tag = cpu_to_fdt32(FDT_PROP);
+	prp->len = cpu_to_fdt32(256);
+	prp->nameoff = 0;
+
+	tag = fdt_next_tag(fdt, sizeof(*hdr), &nextoff);
+	if (tag != FDT_PROP)
+		FAIL("Invalid tag %X", tag);
+
+	if (nextoff != size)
+		FAIL("Invalid next_offset");
+
+	/* int overflow case */
+	prp->len = cpu_to_fdt32(0xFFFFFFFA);
+	tag = fdt_next_tag(fdt, sizeof(*hdr), &nextoff);
+	if (tag != FDT_END)
+		FAIL("Invalid tag, expected premature end");
+
+	if (nextoff != -FDT_ERR_BADSTRUCTURE)
+		FAIL("Invalid nextoff, expected error FDT_ERR_BADSTRUCTURE");
+
+	/* negative offset case */
+	prp->len = cpu_to_fdt32(0x7FFFFFFA);
+	tag = fdt_next_tag(fdt, sizeof(*hdr), &nextoff);
+	if (tag != FDT_END)
+		FAIL("Invalid tag, expected premature end");
+
+	if (nextoff != -FDT_ERR_BADSTRUCTURE)
+		FAIL("Invalid nextoff, expected error FDT_ERR_BADSTRUCTURE");
+
+	free(fdt);
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
index 244df8a..397b9cf 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -346,6 +346,7 @@ tree1_tests () {
     run_test get_prop_offset $TREE
     run_test get_phandle $TREE
     run_test get_path $TREE
+    run_test get_next_tag_invalid_prop_len $TREE #TREE not really needed
     run_test supernode_atdepth_offset $TREE
     run_test parent_offset $TREE
     run_test node_offset_by_prop_value $TREE
-- 
2.37.3

