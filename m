From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v5] libfdt: add helpers to read address and size from reg
Date: Thu, 1 Feb 2018 17:04:16 -0600
Message-ID: <20180201230416.6641-1-afd@ti.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1517526256;
        bh=hHD0VU4fsCQLq6xa7F++uzea+N7pTyaPSiw9PMZ5NTU=;
        h=From:To:CC:Subject:Date;
        b=GTAAN0idElIMCk/O7CyZkhwrYcbfKgfb/2iOQNXAuhKjyFGqd/xvKDi4smIRKqUTm
         UK08bloApn+Tcp47Y35J5nw7V5JbhquQV8daAOf2NkuGvgB4wBzG9Rgcz2WsAJgPH0
         +MISIFFTFgiplujQD7fd5NBE6iXESNy7O40Hdi5I=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>

From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>

This patch extends the capability of libfdt to parse the contents of device
trees in a similar manner to fdt_address_cells and fdt_size_cells.

It adds a helper function which reads the address and size of a device from
the reg property and performs basic sanity checks.

It does not perform translation to a physical address using the ranges
properties of parents, but this enhancement may be added as a separate
function in the future.

Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>
Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
---

Changes from v4:
 - Removed unneeded #defines
 - Return status in parameter to avoid unsafe conversion to unsigned
 - Added error code translation for NOTFOUND -> BADNCELLS
 - Check for cell sizes being larger than the types they go into
 - Added tests for failure cases

The only comment from the last posting I didn't agree on was
converting the type of the parameters into uint64_t. This
helper function is designed to be used to get the size and
address for instant use. If we have to cast them later we need
extra checks for size correctness in the caller, who can't do
that as they would then have to check the cells sizes themselves,
which defeats the whole point of this function.

To make this intentional behavior more clear we add checks for
miss-sized types and return appropriate errors for that. We even
add some test cases for platforms with different sized types to
check the same.

 libfdt/fdt_addresses.c | 72 ++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h        | 33 ++++++++++++++++++
 libfdt/version.lds     |  1 +
 tests/.gitignore       |  1 +
 tests/Makefile.tests   |  2 +-
 tests/addr_size.c      | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/addresses.dts    | 20 +++++++++++
 tests/run_tests.sh     |  1 +
 8 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 tests/addr_size.c

diff --git a/libfdt/fdt_addresses.c b/libfdt/fdt_addresses.c
index eff4dbc..41d3c5d 100644
--- a/libfdt/fdt_addresses.c
+++ b/libfdt/fdt_addresses.c
@@ -94,3 +94,75 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
 
 	return val;
 }
+
+static uint64_t _fdt_read_cells(const fdt32_t *cells, unsigned int n, int *res)
+{
+	int i;
+	uint64_t value;
+
+	if (n > 2) {
+		*res = -FDT_ERR_BADNCELLS;
+		return 0;
+	}
+
+	value = 0;
+	for (i = 0; i < n; i++) {
+		value <<= (sizeof(*cells) * 8);
+		value |= fdt32_to_cpu(cells[i]);
+	}
+
+	*res = 0;
+	return value;
+}
+
+int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
+			 uintptr_t *addrp, size_t *sizep)
+{
+	int parent;
+	int ac, sc, reg_stride;
+	int res;
+	const fdt32_t *reg;
+
+	reg = fdt_getprop(fdt, nodeoffset, "reg", &res);
+	if (res < 0)
+		return res;
+
+	parent = fdt_parent_offset(fdt, nodeoffset);
+	if (parent == -FDT_ERR_NOTFOUND) /* an node without a parent does
+					  * not have _any_ number of cells */
+		return -FDT_ERR_BADNCELLS;
+	if (parent < 0)
+		return parent;
+
+	ac = fdt_address_cells(fdt, parent);
+	if (ac < 0)
+		return ac;
+	if (ac * sizeof(fdt32_t) > sizeof(*addrp))
+		return -FDT_ERR_BADNCELLS;
+
+	sc = fdt_size_cells(fdt, parent);
+	if (sc < 0)
+		return sc;
+	if (sc * sizeof(fdt32_t) > sizeof(*sizep))
+		return -FDT_ERR_BADNCELLS;
+
+	reg_stride = ac + sc;
+
+	/* res is the number of bytes read and must be an even multiple of the
+	 * sum of address cells and size cells */
+	if ((res % (reg_stride * sizeof(*reg))) != 0)
+		return -FDT_ERR_BADVALUE;
+
+	if (addrp) {
+		*addrp = (uintptr_t) _fdt_read_cells(&reg[reg_stride * idx], ac, &res);
+		if (res < 0)
+			return res;
+	}
+	if (sizep) {
+		*sizep = (size_t) _fdt_read_cells(&reg[ac + reg_stride * idx], sc, &res);
+		if (res < 0)
+			return res;
+	}
+
+	return 0;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c8c00fa..73f2fea 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1101,6 +1101,39 @@ int fdt_address_cells(const void *fdt, int nodeoffset);
  */
 int fdt_size_cells(const void *fdt, int nodeoffset);
 
+/**
+ *
+ * fdt_simple_addr_size - read address and/or size from the reg property of a
+ *                        device node.
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node to find the address and/or size from
+ * @idx: which address/size pair to read
+ * @addrp: pointer to where address will be stored (will be overwritten) or NULL
+ * @sizep: pointer to where size will be stored (will be overwritten) or NULL
+ *
+ * When the node has a valid reg property, returns the address and/or size
+ * values stored there. It does not perform any type of translation based on
+ * the parent bus(es).
+ *
+ * NOTE: This function is expensive, as it must scan the device tree
+ * structure from the start to nodeoffset, *twice*, with fdt_parent_offset.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_BADVALUE, if there is an unexpected number of entries in the
+ *		reg property
+ *	-FDT_ERR_NOTFOUND, if the node does not have a reg property
+ *	-FDT_ERR_BADNCELLS, if the number of address or size cells is invalid
+ *		or greater than 2 (which is the maximum currently supported)
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+
+int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
+			 uintptr_t *addrp, size_t *sizep);
 
 /**********************************************************************/
 /* Write-in-place functions                                           */
diff --git a/libfdt/version.lds b/libfdt/version.lds
index 18fb69f..1f19341 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -59,6 +59,7 @@ LIBFDT_1.2 {
 		fdt_next_subnode;
 		fdt_address_cells;
 		fdt_size_cells;
+		fdt_simple_addr_size;
 		fdt_stringlist_contains;
 		fdt_stringlist_count;
 		fdt_stringlist_search;
diff --git a/tests/.gitignore b/tests/.gitignore
index 9e209d5..acb9335 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -43,6 +43,7 @@ tmp.*
 /path_offset
 /path_offset_aliases
 /phandle_format
+/addr_size
 /property_iterate
 /propname_escapes
 /references
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 262944a..1e326ea 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -8,7 +8,7 @@ LIB_TESTS_L = get_mem_rsv \
 	char_literal \
 	sized_cells \
 	notfound \
-	addr_size_cells \
+	addr_size_cells addr_size \
 	stringlist \
 	setprop_inplace nop_property nop_node \
 	sw_tree1 \
diff --git a/tests/addr_size.c b/tests/addr_size.c
new file mode 100644
index 0000000..10275f4
--- /dev/null
+++ b/tests/addr_size.c
@@ -0,0 +1,93 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for address and size handling
+ * Copyright (C) 2016-2018 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Based on addr_size_cells.c by David Gibson, <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any kind,
+ * whether express or implied; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
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
+static void check_node(const void *fdt, const char *path, int err,
+		       int idx, uintptr_t addr, size_t size)
+{
+	int offset, res;
+	uintptr_t xaddr;
+	size_t xsize;
+
+	offset = fdt_path_offset(fdt, path);
+	if (offset < 0)
+		FAIL("Couldn't find path %s", path);
+
+	res = fdt_simple_addr_size(fdt, offset, idx, &xaddr, &xsize);
+	if (res != err)
+		FAIL("fdt_simple_addr_size returned %s instead of %s",
+		     fdt_strerror(res), fdt_strerror(err));
+	if (res < 0)
+		return;
+
+	if (xaddr != addr)
+		FAIL("Physical address for %s is %p instead of %p\n",
+		     path, (void *) xaddr, (void *) addr);
+
+	if (xsize != size)
+		FAIL("Size for %s is %zx instead of %zx\n",
+		     path, xsize, size);
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
+	if (sizeof(uintptr_t) == 4 && sizeof(size_t) == 4) {
+		/* 32-bit address , 32-bit size */
+		check_node(fdt, "/identity-bus@0/id-device@400",
+			   -FDT_ERR_BADNCELLS, 0, 0x0, 0x0);
+		check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
+			   -FDT_ERR_BADNCELLS, 0, 0x0, 0x0);
+	}
+	else if (sizeof(uintptr_t) == 8 && sizeof(size_t) == 8) {
+		/* 64-bit uintptr_t , 64-bit size_t */
+		check_node(fdt, "/identity-bus@0/id-device@400",
+			   0, 0,0x400, 0x100);
+		check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
+			   0, 0, 0x8000000800, 0x200);
+		check_node(fdt, "/identity-bus@0/id-device@400",
+			   0, 1, 0x400000000, 0x100000030);
+		check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
+			   0, 1, 0x70000000, 0x700);
+		check_node(fdt, "/simple-bus@1000000/sb-device@8000000800",
+			   0, 2, 0x1050000000, 0x20);
+	}
+
+	check_node(fdt, "/identity-bus@0",
+		   -FDT_ERR_NOTFOUND, 0, 0x0, 0x0);
+	check_node(fdt, "/narrow-bus@2000000/sb-device@80000000",
+		   0, 0, 0x00000800, 0x200);
+
+	PASS();
+}
diff --git a/tests/addresses.dts b/tests/addresses.dts
index a2faaf5..747c291 100644
--- a/tests/addresses.dts
+++ b/tests/addresses.dts
@@ -6,10 +6,30 @@
 	#size-cells = <2>;
 
 	identity-bus@0 {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		id-device@400 {
+			reg = <0x0 0x00000400 0x0 0x00000100>,
+			      <0x4 0x00000000 0x1 0x00000030>;
+		};
 	};
 
 	simple-bus@1000000 {
 		#address-cells = <2>;
 		#size-cells = <1>;
+		sb-device@8000000800 {
+			reg = <0x80 0x00000800 0x200>,
+			      <0x00 0x70000000 0x700>,
+			      <0x10 0x50000000 0x020>;
+		};
+	};
+
+	narrow-bus@2000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		sb-device@80000000 {
+			reg = <0x00000800 0x200>,
+			      <0x50000000 0x020>;
+		};
 	};
 };
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0d30edf..c195d0d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -311,6 +311,7 @@ libfdt_tests () {
 
     run_dtc_test -I dts -O dtb -o addresses.test.dtb addresses.dts
     run_test addr_size_cells addresses.test.dtb
+    run_test addr_size addresses.test.dtb
 
     run_dtc_test -I dts -O dtb -o stringlist.test.dtb stringlist.dts
     run_test stringlist stringlist.test.dtb
-- 
2.16.1
