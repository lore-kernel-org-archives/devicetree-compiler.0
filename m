From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/3] fdt: Add a function to count strings
Date: Tue, 29 Sep 2015 11:09:06 +0200
Message-ID: <1443517748-27819-2-git-send-email-thierry.reding@gmail.com>
References: <1443517748-27819-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c6UM+82QsSVjRAsAdkz50mmrdNPVAbzIMb1uyE0R2so=;
        b=YH4Nvw0MRqAEyi8+ntAhGPHHDnw/vnICLe6VJ3c+h/ID1DmBf6kH1Y40F+KGfb7TUK
         XmD83VPobwYWWi9mb0nJY/fvZZc00WttE7ybIH4no1t5NVpbsXeAux3xVcrSx2UX0Ubl
         CFwy+Bd1S29I/uiEI4HMdRUl/p09Y1Fo2MgO2dc2m6PbO0K/FpSaHkIkRFoYvNXYCxlQ
         HR6mrTYYRqB8Kl952Pty4JoKvufm7pDaAJ9OWf8GLlMJr2tuO+BZ3N4RmHt8pJVtaT4D
         RF2njdASsD/TJ5D17qW3FapTlG7FcixJigDbvslmSZs6tHgpePf+N15kDH0jz+jYCm/r
         Yj7A==
In-Reply-To: <1443517748-27819-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Given a device tree node and a property name, the fdt_stringlist_count()
function counts the number of strings found in the property value.

This also adds a new error code, FDT_ERR_BADVALUE, that the function
returns when it encounters a non-NUL-terminated string list.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- rename function to fdt_stringlist_count()

Changes in v2:
- return FDT_ERR_BADVALUE error code for non-NUL-terminated properties
- add tests to cover non-NUL-terminated properties

 libfdt/fdt_ro.c      | 25 ++++++++++++++++
 libfdt/libfdt.h      | 19 +++++++++++-
 tests/.gitignore     |  1 +
 tests/Makefile.tests |  1 +
 tests/run_tests.sh   |  3 ++
 tests/strings.c      | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/strings.dts    | 12 ++++++++
 7 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 tests/strings.c
 create mode 100644 tests/strings.dts

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index a65e4b5b72b6..4cde93193c92 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -538,6 +538,31 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str)
 	return 0;
 }
 
+int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property)
+{
+	const char *list, *end;
+	int length, count = 0;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
+	if (!list)
+		return -length;
+
+	end = list + length;
+
+	while (list < end) {
+		length = strnlen(list, end - list) + 1;
+
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end)
+			return -FDT_ERR_BADVALUE;
+
+		list += length;
+		count++;
+	}
+
+	return count;
+}
+
 int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 			      const char *compatible)
 {
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 1bd024218b9c..2863001817c1 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -121,7 +121,12 @@
 	/* FDT_ERR_BADNCELLS: Device tree has a #address-cells, #size-cells
 	 * or similar property with a bad format or value */
 
-#define FDT_ERR_MAX		14
+#define FDT_ERR_BADVALUE	15
+	/* FDT_ERR_BADVALUE: Device tree has a property with an unexpected
+	 * value. For example: a property expected to contain a string list
+	 * is not NUL-terminated within the length of its value. */
+
+#define FDT_ERR_MAX		15
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
@@ -868,6 +873,18 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
  */
 int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
 
+/**
+ * fdt_stringlist_count - count the number of strings in a string list
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ * @return:
+ *   the number of strings in the given property
+ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *   -FDT_ERR_NOTFOUND if the property does not exist
+ */
+int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property);
+
 /**********************************************************************/
 /* Read-only functions (addressing related)                           */
 /**********************************************************************/
diff --git a/tests/.gitignore b/tests/.gitignore
index 5656555f9cbc..09a1d3b84f6f 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -49,6 +49,7 @@ tmp.*
 /setprop_inplace
 /sized_cells
 /string_escapes
+/strings
 /subnode_iterate
 /subnode_offset
 /supernode_atdepth_offset
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 9adedecdff3d..415e4d670f2c 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -9,6 +9,7 @@ LIB_TESTS_L = get_mem_rsv \
 	sized_cells \
 	notfound \
 	addr_size_cells \
+	strings \
 	setprop_inplace nop_property nop_node \
 	sw_tree1 \
 	move_and_save mangle-layout nopulate \
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5268293434af..92ee96340c29 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -198,6 +198,9 @@ libfdt_tests () {
     run_dtc_test -I dts -O dtb -o addresses.test.dtb addresses.dts
     run_test addr_size_cells addresses.test.dtb
 
+    run_dtc_test -I dts -O dtb -o strings.test.dtb strings.dts
+    run_test strings strings.test.dtb
+
     # Sequential write tests
     run_test sw_tree1
     tree1_tests sw_tree1.test.dtb
diff --git a/tests/strings.c b/tests/strings.c
new file mode 100644
index 000000000000..923e2ed4de02
--- /dev/null
+++ b/tests/strings.c
@@ -0,0 +1,82 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for string handling
+ * Copyright (C) 2015 NVIDIA Corporation
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
+
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
+static void check_expected_failure(const void *fdt, const char *path,
+				   const char *property)
+{
+	int offset, err;
+
+	offset = fdt_path_offset(fdt, "/");
+	if (offset < 0)
+		FAIL("Couldn't find path %s", path);
+
+	err = fdt_stringlist_count(fdt, offset, "#address-cells");
+	if (err != -FDT_ERR_BADVALUE)
+		FAIL("unexpectedly succeeded in parsing #address-cells\n");
+}
+
+static void check_string_count(const void *fdt, const char *path,
+			       const char *property, int count)
+{
+	int offset, err;
+
+	offset = fdt_path_offset(fdt, path);
+	if (offset < 0)
+		FAIL("Couldn't find path %s", path);
+
+	err = fdt_stringlist_count(fdt, offset, property);
+	if (err < 0)
+		FAIL("Couldn't count strings in property %s of node %s: %d\n",
+		     property, path, err);
+
+	if (err != count)
+		FAIL("String count for property %s of node %s is %d instead of %d\n",
+		     path, property, err, count);
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+
+	if (argc != 2)
+		CONFIG("Usage: %s <dtb file>\n", argv[0]);
+
+	test_init(argc, argv);
+	fdt = load_blob(argv[1]);
+
+	check_expected_failure(fdt, "/", "#address-cells");
+	check_expected_failure(fdt, "/", "#size-cells");
+
+	check_string_count(fdt, "/", "compatible", 1);
+	check_string_count(fdt, "/device", "compatible", 2);
+	check_string_count(fdt, "/device", "big-endian", 0);
+
+	PASS();
+}
diff --git a/tests/strings.dts b/tests/strings.dts
new file mode 100644
index 000000000000..1e4d3140458f
--- /dev/null
+++ b/tests/strings.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+/ {
+	compatible = "test-strings";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	device {
+		compatible = "foo", "bar";
+		big-endian;
+	};
+};
-- 
2.5.0
