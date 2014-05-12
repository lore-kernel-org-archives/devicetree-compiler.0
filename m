From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 1/2] libfdt: Add helpers to read #address-cells and #size-cells
Date: Mon, 12 May 2014 16:06:10 +1000
Message-ID: <1399874771-23089-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jdl-ClAdetSTwOo@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

This patch makes a small start on libfdt functions which actually help to
parse the contents of device trees, rather than purely manipulating the
tree's structure.

We add simple helpers to read and sanity check the #address-cells and
#size-cells values for a given node.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 libfdt/Makefile.libfdt  |  3 +-
 libfdt/fdt_addresses.c  | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h         | 62 +++++++++++++++++++++++++++++++-
 tests/.gitignore        |  1 +
 tests/Makefile.tests    |  1 +
 tests/addr_size_cells.c | 64 +++++++++++++++++++++++++++++++++
 tests/addresses.dts     | 15 ++++++++
 tests/run_tests.sh      |  3 ++
 8 files changed, 243 insertions(+), 2 deletions(-)
 create mode 100644 libfdt/fdt_addresses.c
 create mode 100644 tests/addr_size_cells.c
 create mode 100644 tests/addresses.dts

diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
index 91126c0..09c322e 100644
--- a/libfdt/Makefile.libfdt
+++ b/libfdt/Makefile.libfdt
@@ -6,5 +6,6 @@
 LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
 LIBFDT_VERSION = version.lds
-LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c
+LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c \
+	fdt_addresses.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
diff --git a/libfdt/fdt_addresses.c b/libfdt/fdt_addresses.c
new file mode 100644
index 0000000..eff4dbc
--- /dev/null
+++ b/libfdt/fdt_addresses.c
@@ -0,0 +1,96 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2014 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
+ *
+ * libfdt is dual licensed: you can use it either under the terms of
+ * the GPL, or the BSD license, at your option.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ *     You should have received a copy of the GNU General Public
+ *     License along with this library; if not, write to the Free
+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+ *     MA 02110-1301 USA
+ *
+ * Alternatively,
+ *
+ *  b) Redistribution and use in source and binary forms, with or
+ *     without modification, are permitted provided that the following
+ *     conditions are met:
+ *
+ *     1. Redistributions of source code must retain the above
+ *        copyright notice, this list of conditions and the following
+ *        disclaimer.
+ *     2. Redistributions in binary form must reproduce the above
+ *        copyright notice, this list of conditions and the following
+ *        disclaimer in the documentation and/or other materials
+ *        provided with the distribution.
+ *
+ *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+ *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
+ *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+ *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
+ *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+ *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+ *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
+ *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+int fdt_address_cells(const void *fdt, int nodeoffset)
+{
+	const fdt32_t *ac;
+	int val;
+	int len;
+
+	ac = fdt_getprop(fdt, nodeoffset, "#address-cells", &len);
+	if (!ac)
+		return 2;
+
+	if (len != sizeof(*ac))
+		return -FDT_ERR_BADNCELLS;
+
+	val = fdt32_to_cpu(*ac);
+	if ((val <= 0) || (val > FDT_MAX_NCELLS))
+		return -FDT_ERR_BADNCELLS;
+
+	return val;
+}
+
+int fdt_size_cells(const void *fdt, int nodeoffset)
+{
+	const fdt32_t *sc;
+	int val;
+	int len;
+
+	sc = fdt_getprop(fdt, nodeoffset, "#size-cells", &len);
+	if (!sc)
+		return 2;
+
+	if (len != sizeof(*sc))
+		return -FDT_ERR_BADNCELLS;
+
+	val = fdt32_to_cpu(*sc);
+	if ((val < 0) || (val > FDT_MAX_NCELLS))
+		return -FDT_ERR_BADNCELLS;
+
+	return val;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c4d5a91..32d5227 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -116,7 +116,12 @@
 	 * Should never be returned, if it is, it indicates a bug in
 	 * libfdt itself. */
 
-#define FDT_ERR_MAX		13
+/* Errors in device tree content */
+#define FDT_ERR_BADNCELLS	14
+	/* FDT_ERR_BADNCELLS: Device tree has a #address-cells, #size-cells
+	 * or similar property with a bad format or value */
+
+#define FDT_ERR_MAX		14
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
@@ -853,6 +858,61 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
 int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
 
 /**********************************************************************/
+/* Read-only functions (addressing related)                           */
+/**********************************************************************/
+
+/**
+ * FDT_MAX_NCELLS - maximum value for #address-cells and #size-cells
+ *
+ * This is the maximum value for #address-cells, #size-cells and
+ * similar properties that will be processed by libfdt.  IEE1275
+ * requires that OF implementations handle values up to 4.
+ * Implementations may support larger values, but in practice higher
+ * values aren't used.
+ */
+#define FDT_MAX_NCELLS		4
+
+/**
+ * fdt_address_cells - retrieve address size for a bus represented in the tree
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node to find the address size for
+ *
+ * When the node has a valid #address-cells property, returns its value.
+ *
+ * returns:
+ *	0 <= n < FDT_MAX_NCELLS, on success
+ *      2, if the node has no #address-cells property
+ *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid #address-cells property
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_address_cells(const void *fdt, int nodeoffset);
+
+/**
+ * fdt_size_cells - retrieve address range size for a bus represented in the
+ *                  tree
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node to find the address range size for
+ *
+ * When the node has a valid #size-cells property, returns its value.
+ *
+ * returns:
+ *	0 <= n < FDT_MAX_NCELLS, on success
+ *      2, if the node has no #address-cells property
+ *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid #size-cells property
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_size_cells(const void *fdt, int nodeoffset);
+
+
+/**********************************************************************/
 /* Write-in-place functions                                           */
 /**********************************************************************/
 
diff --git a/tests/.gitignore b/tests/.gitignore
index bb5e33a..5656555 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -3,6 +3,7 @@
 *.test.dts
 tmp.*
 /add_subnode_with_nops
+/addr_size_cells
 /appendprop[12]
 /asm_tree_dump
 /boot-cpuid
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index dafb618..9adedec 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -8,6 +8,7 @@ LIB_TESTS_L = get_mem_rsv \
 	char_literal \
 	sized_cells \
 	notfound \
+	addr_size_cells \
 	setprop_inplace nop_property nop_node \
 	sw_tree1 \
 	move_and_save mangle-layout nopulate \
diff --git a/tests/addr_size_cells.c b/tests/addr_size_cells.c
new file mode 100644
index 0000000..6090d93
--- /dev/null
+++ b/tests/addr_size_cells.c
@@ -0,0 +1,64 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for #address-cells and #size-cells handling
+ * Copyright (C) 2014 David Gibson, <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
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
+static void check_node(const void *fdt, const char *path, int ac, int sc)
+{
+	int offset;
+	int xac, xsc;
+
+	offset = fdt_path_offset(fdt, path);
+	if (offset < 0)
+		FAIL("Couldn't find path %s", path);
+
+	xac = fdt_address_cells(fdt, offset);
+	xsc = fdt_size_cells(fdt, offset);
+
+	if (xac != ac)
+		FAIL("Address cells for %s is %d instead of %d\n",
+		     path, xac, ac);
+	if (xsc != sc)
+		FAIL("Size cells for %s is %d instead of %d\n",
+		     path, xsc, sc);
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
+	check_node(fdt, "/", 2, 2);
+	check_node(fdt, "/identity-bus@0", 2, 2);
+	check_node(fdt, "/simple-bus@1000000", 2, 1);
+	PASS();
+}
diff --git a/tests/addresses.dts b/tests/addresses.dts
new file mode 100644
index 0000000..a2faaf5
--- /dev/null
+++ b/tests/addresses.dts
@@ -0,0 +1,15 @@
+/dts-v1/;
+
+/ {
+	compatible = "test_addresses";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	identity-bus@0 {
+	};
+
+	simple-bus@1000000 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 97e016b..f205ce6 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -188,6 +188,9 @@ ALL_LAYOUTS="mts mst tms tsm smt stm"
 libfdt_tests () {
     tree1_tests test_tree1.dtb
 
+    run_dtc_test -I dts -O dtb -o addresses.test.dtb addresses.dts
+    run_test addr_size_cells addresses.test.dtb
+
     # Sequential write tests
     run_test sw_tree1
     tree1_tests sw_tree1.test.dtb
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
