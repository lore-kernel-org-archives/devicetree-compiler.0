From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] libfdt/tests: Add fdt_path_offset_namelen() test
Date: Sun,  5 Apr 2015 00:05:56 -0400
Message-ID: <1428206756-27160-1-git-send-email-peter@hurleysoftware.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>

Add unit test for fdt_path_offset_namelen(). Verify partial path-
descending retrieves the same node offset as fdt_subnode_offset().
Verify parsing correctness with multiple path separators, both
mid-path and trailing.

Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
---
 tests/Makefile.tests        |   2 +-
 tests/path_offset_namelen.c | 169 ++++++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh          |   1 +
 3 files changed, 171 insertions(+), 1 deletion(-)
 create mode 100644 tests/path_offset_namelen.c

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index dafb618..9d5c456 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -1,6 +1,6 @@
 LIB_TESTS_L = get_mem_rsv \
 	root_node find_property subnode_offset path_offset \
-	get_name getprop get_phandle \
+	path_offset_namelen get_name getprop get_phandle \
 	get_path supernode_atdepth_offset parent_offset \
 	node_offset_by_prop_value node_offset_by_phandle \
 	node_check_compatible node_offset_by_compatible \
diff --git a/tests/path_offset_namelen.c b/tests/path_offset_namelen.c
new file mode 100644
index 0000000..3893d89
--- /dev/null
+++ b/tests/path_offset_namelen.c
@@ -0,0 +1,169 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for fdt_path_offset_namelen()
+ * Copyright (C) 2015 Peter Hurley
+ * based on path_offset.c, Copyright (C) 2006 David Gibson, IBM Corporation.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public License
+ * as published by the Free Software Foundation; either version 2.1 of
+ * the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+static int check_subnode(void *fdt, int parent, const char *name)
+{
+	int offset;
+	const struct fdt_node_header *nh;
+	uint32_t tag;
+
+	verbose_printf("Checking subnode \"%s\" of %d...", name, parent);
+	offset = fdt_subnode_offset(fdt, parent, name);
+	verbose_printf("offset %d...", offset);
+	if (offset < 0)
+		FAIL("fdt_subnode_offset(\"%s\"): %s", name, fdt_strerror(offset));
+	nh = fdt_offset_ptr(fdt, offset, sizeof(*nh));
+	verbose_printf("pointer %p\n", nh);
+	if (! nh)
+		FAIL("NULL retrieving subnode \"%s\"", name);
+
+	tag = fdt32_to_cpu(nh->tag);
+
+	if (tag != FDT_BEGIN_NODE)
+		FAIL("Incorrect tag 0x%08x on property \"%s\"", tag, name);
+	if (!nodename_eq(nh->name, name))
+		FAIL("Subnode name mismatch \"%s\" instead of \"%s\"",
+		     nh->name, name);
+
+	return offset;
+}
+
+static void check_root(void *fdt)
+{
+	int root;
+
+	root = fdt_path_offset_namelen(fdt, "/", 1);
+	if (root < 0)
+		FAIL("fdt_path_offset_namelen(\"/\") failed: %s",
+		     fdt_strerror(root));
+	else if (root != 0)
+		FAIL("fdt_path_offset_namelen(\"/\") bad offset %d", root);
+}
+
+static void check_offsets(int subnode, int path)
+{
+	if (subnode != path)
+		FAIL("Mismatch: subnode_offset (%d) != path_offset (%d)",
+		     subnode, path);
+}
+
+static const char *get_subpath(const char *path, int len)
+{
+	const char *p;
+
+	p = strchr(path, '/');
+	if (!p)
+		FAIL("no / in %s", path);
+	p = strchr(p + 1, '/');
+	if (!p)
+		FAIL("no subpath %s", path);
+	if (p - path >= len)
+		FAIL("subpath len (%d) > path (%s) length (%d)",
+		     (int)(p - path), path, len);
+
+	return p;
+}
+
+static const char *get_subsubpath(const char *path, int len)
+{
+	const char *p;
+
+	p = strchr(path, ':');
+	if (!p)
+		FAIL("no subsubpath in %s", path);
+	if (p - path >= len)
+		FAIL("subsubpath len (%d) > path (%s) length (%d)",
+		     (int)(p - path), path, len);
+
+	return p;
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+	int subnode1_offset, subnode2_offset;
+	int subnode1_offset_p, subnode2_offset_p;
+	int subsubnode1_offset, subsubnode2_offset, subsubnode2_offset2;
+	int subsubnode1_offset_p, subsubnode2_offset_p, subsubnode2_offset2_p;
+	int path1_len, path2_len, path3_len, path4_len;
+	const char *p1, *p2, *p3, *p4;
+
+	static const char path1[] = "/subnode@1/subsubnode:";
+	static const char path2[] = "/subnode@2/subsubnode@0:";
+	static const char path3[] = "/subnode@1////subsubnode///:";
+	static const char path4[] = "/subnode@2///subsubnode///:/subnode@1";
+
+
+	test_init(argc, argv);
+	fdt = load_blob_arg(argc, argv);
+
+	check_root(fdt);
+
+	subnode1_offset = check_subnode(fdt, 0, "subnode@1");
+	subnode2_offset = check_subnode(fdt, 0, "subnode@2");
+	subsubnode1_offset = check_subnode(fdt, subnode1_offset, "subsubnode");
+	subsubnode2_offset = check_subnode(fdt, subnode2_offset, "subsubnode@0");
+	subsubnode2_offset2 = check_subnode(fdt, subnode2_offset, "subsubnode");
+
+	path1_len = strlen(path1);
+	path2_len = strlen(path2);
+	path3_len = strlen(path3);
+	path4_len = strlen(path4);
+
+	p1 = get_subpath(path1, path1_len);
+	p2 = get_subpath(path2, path2_len);
+	subnode1_offset_p = fdt_path_offset_namelen(fdt, path1, p1 - path1);
+	subnode2_offset_p = fdt_path_offset_namelen(fdt, path2, p2 - path2);
+	check_offsets(subnode1_offset, subnode1_offset_p);
+	check_offsets(subnode2_offset, subnode2_offset_p);
+
+	p1 = get_subsubpath(path1, path1_len);
+	p2 = get_subsubpath(path2, path2_len);
+	subsubnode1_offset_p = fdt_path_offset_namelen(fdt, path1, p1 - path1);
+	subsubnode2_offset_p = fdt_path_offset_namelen(fdt, path2, p2 - path2);
+	check_offsets(subsubnode1_offset, subsubnode1_offset_p);
+	check_offsets(subsubnode2_offset, subsubnode2_offset_p);
+
+	p3 = get_subpath(path3, path3_len);
+	p4 = get_subpath(path4, path4_len);
+	subnode1_offset_p = fdt_path_offset_namelen(fdt, path3, p3 - path3);
+	subnode2_offset_p = fdt_path_offset_namelen(fdt, path4, p4 - path4);
+	check_offsets(subnode1_offset, subnode1_offset_p);
+	check_offsets(subnode2_offset, subnode2_offset_p);
+
+	p3 = get_subsubpath(path3, path3_len);
+	p4 = get_subsubpath(path4, path4_len);
+	subsubnode1_offset_p = fdt_path_offset_namelen(fdt, path3, p3 - path3);
+	subsubnode2_offset2_p = fdt_path_offset_namelen(fdt, path4, p4 - path4);
+	check_offsets(subsubnode1_offset, subsubnode1_offset_p);
+	check_offsets(subsubnode2_offset2, subsubnode2_offset2_p);
+
+	PASS();
+}
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index c0a136b..6c15c96 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -143,6 +143,7 @@ tree1_tests () {
     run_test find_property $TREE
     run_test subnode_offset $TREE
     run_test path_offset $TREE
+    run_test path_offset_namelen $TREE
     run_test get_name $TREE
     run_test getprop $TREE
     run_test get_phandle $TREE
-- 
2.3.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
