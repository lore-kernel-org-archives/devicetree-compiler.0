From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2] libfdt: add helpers to read address and size from reg
Date: Mon, 5 Dec 2016 17:11:30 -0600
Message-ID: <1480979490-3745-1-git-send-email-b-fair@ti.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This patch extends the capability of libfdt to parse the contents of device
trees in a similar manner to fdt_address_cells and fdt_size_cells.

It adds helper functions which read the address and size of a device from
the reg property and performs basic sanity checks. Some functions also
parse the values into integers in the host endianness.

The functions do not perform translation to a physical address using the
ranges properties of parents, but this enhancement may be added as a
separate function in the future.

Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
---

Changes since v1:

  * Split functions into smaller pieces
    -> Also added wrapper functions to perform the full set of actions
  * Changed types of addresses and sizes to uint64_t
  * Removed unneeded constants
  * Renamed and exported fdt_read_integer()

 libfdt/fdt_addresses.c | 118 ++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h        | 145 +++++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/version.lds     |   5 ++
 tests/.gitignore       |   1 +
 tests/Makefile.tests   |   2 +-
 tests/addr_size.c      | 130 ++++++++++++++++++++++++++++++++++++++++++++
 tests/addresses.dts    |  11 ++++
 tests/run_tests.sh     |   1 +
 8 files changed, 412 insertions(+), 1 deletion(-)
 create mode 100644 tests/addr_size.c

diff --git a/libfdt/fdt_addresses.c b/libfdt/fdt_addresses.c
index eff4dbc..752f9ef 100644
--- a/libfdt/fdt_addresses.c
+++ b/libfdt/fdt_addresses.c
@@ -94,3 +94,121 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
 
 	return val;
 }
+
+int fdt_read_integer(const fdt32_t *cells, int n, uint64_t *out)
+{
+	int i;
+
+	/* Make sure the result will fit */
+	if (n > sizeof(*out) / sizeof(*cells))
+		return -FDT_ERR_BADNCELLS;
+
+	for (*out = 0, i = 0; i < n; i++) {
+		*out <<= sizeof(*cells) * 8;
+		*out |= fdt32_to_cpu(cells[i]);
+	}
+
+	return 0;
+}
+
+int fdt_addr_size(const void *fdt, int nodeoffset, int idx,
+		  const fdt32_t **addrp, const fdt32_t **sizep)
+{
+	int parent;
+	int ac, sc;
+
+	parent = fdt_parent_offset(fdt, nodeoffset);
+	if (parent < 0)
+		return parent;
+
+	ac = fdt_address_cells(fdt, parent);
+	if (ac < 0)
+		return ac;
+
+	sc = fdt_size_cells(fdt, parent);
+	if (sc < 0)
+		return sc;
+
+	return fdt_addr_size_cellcount(fdt, nodeoffset, idx,
+				       ac, addrp, sc, sizep);
+}
+
+int fdt_addr_size_cellcount(const void *fdt, int nodeoffset, int idx,
+			    int ac, const fdt32_t **addrp,
+			    int sc, const fdt32_t **sizep)
+{
+	int reg_stride;
+	int res;
+	const fdt32_t *reg;
+
+	reg = fdt_getprop(fdt, nodeoffset, "reg", &res);
+	if (res < 0)
+		return res;
+
+	reg_stride = ac + sc;
+	/*
+	 * res is the number of bytes read and must be an even multiple of the
+	 * sum of ac and sc.
+	 */
+	if ((res % (reg_stride * sizeof(fdt32_t))) != 0)
+		return -FDT_ERR_BADVALUE;
+	/* Check that there are enough entries in reg */
+	if (res < reg_stride * (idx + 1))
+		return -FDT_ERR_BADVALUE;
+
+	if (addrp)
+		*addrp = &reg[reg_stride * idx];
+	if (sizep)
+		*sizep = &reg[ac + reg_stride * idx];
+
+	return 0;
+}
+
+int fdt_integer_addr_size(const void *fdt, int nodeoffset, int idx,
+			  uint64_t *addrp, uint64_t *sizep)
+{
+	int parent;
+	int ac, sc;
+
+	parent = fdt_parent_offset(fdt, nodeoffset);
+	if (parent < 0)
+		return parent;
+
+	ac = fdt_address_cells(fdt, parent);
+	if (ac < 0)
+		return ac;
+
+	sc = fdt_size_cells(fdt, parent);
+	if (sc < 0)
+		return sc;
+
+	return fdt_integer_addr_size_cellcount(fdt, nodeoffset, idx,
+					       ac, addrp, sc, sizep);
+}
+
+int fdt_integer_addr_size_cellcount(const void *fdt, int nodeoffset, int idx,
+				    int ac, uint64_t *addr,
+				    int sc, uint64_t *size)
+{
+	const fdt32_t *fdt_addr, *fdt_size;
+	int res;
+
+	res = fdt_addr_size_cellcount(fdt, nodeoffset, idx,
+				      ac, &fdt_addr, sc, &fdt_size);
+	if (res < 0)
+		return res;
+
+	if (addr) {
+		res = fdt_read_integer(fdt_addr, ac, addr);
+		if (res < 0)
+			return res;
+	}
+
+	if (size) {
+		res = fdt_read_integer(fdt_size, sc, size);
+		if (res < 0)
+			return res;
+	}
+
+	return 0;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c69e918..9eaf790 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1085,6 +1085,151 @@ int fdt_address_cells(const void *fdt, int nodeoffset);
  */
 int fdt_size_cells(const void *fdt, int nodeoffset);
 
+/**
+ * fdt_read_integer - parse an array of cells into an integer
+ * @cells: pointer to an array of cells
+ * @n: number of cells to parse
+ * @out: pointer to where the value should be stored (will be overwritten)
+ *
+ * Given an array of cells from a property, convert the first n of them into a
+ * single integer in the host's endianness.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_BADNCELLS, if n is greater than 2
+ */
+int fdt_read_integer(const fdt32_t *cells, int n, uint64_t *out);
+
+/**
+ * fdt_addr_size - get pointers to the address and/or size values from the reg
+ *                 property of a device node.
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node to find the address and/or size from
+ * @idx: which address/size pair to read
+ * @addrp: pointer to where address pointer will be stored (will be
+ *         overwritten) or NULL
+ * @sizep: pointer to where size pointer will be stored (will be overwritten)
+ *         or NULL
+ *
+ * When the node has a valid reg property, returns pointers to the address
+ * and/or size values stored there. It does not parse the cell arrays into a
+ * single integer or covert them to host endianness.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_BADVALUE, if there is an unexpected number of entries in the
+ *		reg property
+ *	-FDT_ERR_NOTFOUND, if the node does not have a reg property
+ *	-FDT_ERR_BADNCELLS, if the number of address or size cells is invalid
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_addr_size(const void *fdt, int nodeoffset, int idx,
+		  const fdt32_t **addrp, const fdt32_t **sizep);
+
+/**
+ * fdt_addr_size_cellcount - get pointers to the address and/or size values
+ *                           from the reg property of a device node given the
+ *                           number of address and size cells.
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node to find the address and/or size from
+ * @idx: which address/size pair to read
+ * @ac: number of address cells
+ * @addrp: pointer to where address pointer will be stored (will be
+ *         overwritten) or NULL
+ * @sc: number of size cells
+ * @sizep: pointer to where size pointer will be stored (will be overwritten)
+ *         or NULL
+ *
+ * When the node has a valid reg property, returns pointers to the address
+ * and/or size values stored there. It does not parse the cell arrays into a
+ * single integer or covert them to host endianness. This version uses values
+ * for #address-cells and #size-cells which are passed in as arguments, rather
+ * than reading them from the parent node. Therefore, this version is much
+ * faster if these values are already known.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_BADVALUE, if there is an unexpected number of entries in the
+ *		reg property
+ *	-FDT_ERR_NOTFOUND, if the node does not have a reg property
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_addr_size_cellcount(const void *fdt, int nodeoffset, int idx,
+			    int ac, const fdt32_t **addrp,
+			    int sc, const fdt32_t **sizep);
+
+/**
+ * fdt_integer_addr_size - find address and/or size from the reg property of a
+ *                         device node and return them as integers.
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node to find the address and/or size from
+ * @idx: which address/size pair to read
+ * @addrp: pointer to where address will be stored (will be overwritten) or NULL
+ * @sizep: pointer to where size will be stored (will be overwritten) or NULL
+ *
+ * When the node has a valid reg property, returns the address and/or size
+ * values stored there as integers in the host endianness. It does not perform
+ * any type of translation based on the parent bus(es).
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
+int fdt_integer_addr_size(const void *fdt, int nodeoffset, int idx,
+			  uint64_t *addrp, size_t *sizep);
+
+/**
+ * fdt_integer_addr_size_cellcount - find address and/or size from the reg
+ *                                   property of a device node and return them
+ *                                   as integers.
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node to find the address and/or size from
+ * @idx: which address/size pair to read
+ * @ac: number of address cells
+ * @addrp: pointer to where address will be stored (will be overwritten) or NULL
+ * @sc: number of size cells
+ * @sizep: pointer to where size will be stored (will be overwritten) or NULL
+ *
+ * When the node has a valid reg property, returns the address and/or size
+ * values stored there as integers in the host endianness. It does not perform
+ * any type of translation based on the parent bus(es). This version uses
+ * values for #address-cells and #size-cells which are passed in as arguments,
+ * rather than reading them from the parent node. Therefore, this version is
+ * much faster if these values are already known.
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
+int fdt_integer_addr_size_cellcount(const void *fdt, int nodeoffset, int idx,
+				    int ac, uint64_t *addr,
+				    int sc, uint64_t *size);
 
 /**********************************************************************/
 /* Write-in-place functions                                           */
diff --git a/libfdt/version.lds b/libfdt/version.lds
index cff0358..0106f9d 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -59,6 +59,11 @@ LIBFDT_1.2 {
 		fdt_next_subnode;
 		fdt_address_cells;
 		fdt_size_cells;
+		fdt_read_integer;
+		fdt_addr_size;
+		fdt_addr_size_cellcount;
+		fdt_integer_addr_size;
+		fdt_integer_addr_size_cellcount;
 		fdt_stringlist_contains;
 		fdt_resize;
 		fdt_overlay_apply;
diff --git a/tests/.gitignore b/tests/.gitignore
index 354b565..9018414 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -42,6 +42,7 @@ tmp.*
 /path_offset
 /path_offset_aliases
 /phandle_format
+/addr_size
 /property_iterate
 /propname_escapes
 /references
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index eb039c5..c715421 100644
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
index 0000000..4ee4c1b
--- /dev/null
+++ b/tests/addr_size.c
@@ -0,0 +1,130 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for address and size handling
+ * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
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
+static void check_node_integer(const void *fdt, const char *path, int idx,
+			       uint64_t addr, uint64_t size)
+{
+	int offset, res;
+	uint64_t xaddr, xsize;
+
+	offset = fdt_path_offset(fdt, path);
+	if (offset < 0)
+		FAIL("Couldn't find path %s", path);
+
+	res = fdt_integer_addr_size(fdt, offset, idx, &xaddr, &xsize);
+	if (res < 0)
+		FAIL("fdt_integer_addr_size gave error: %s", fdt_strerror(res));
+
+	if (xaddr != addr)
+		FAIL("Physical address for %s is %lx instead of %lx\n", path,
+		     xaddr, addr);
+
+	if (xsize != size)
+		FAIL("Size for %s is %lx instead of %lx\n", path,
+		     xsize, size);
+}
+
+static void check_node(const void *fdt, const char *path, int idx,
+		       uint64_t addr, uint64_t size)
+{
+	int offset, parent, res;
+	int ac, sc;
+	const fdt32_t *xaddr_fdt, *xsize_fdt;
+	uint64_t xaddr, xsize;
+
+	offset = fdt_path_offset(fdt, path);
+	if (offset < 0)
+		FAIL("Couldn't find path %s", path);
+
+	parent = fdt_parent_offset(fdt, offset);
+	if (parent < 0)
+		FAIL("Couldn't get parent: %s", fdt_strerror(parent));
+
+	ac = fdt_address_cells(fdt, parent);
+	if (ac < 0)
+		FAIL("Couldn't read #address-cells: %s", fdt_strerror(ac));
+
+	sc = fdt_size_cells(fdt, parent);
+	if (sc < 0)
+		FAIL("Couldn't read #size-cells: %s", fdt_strerror(sc));
+
+	res = fdt_addr_size_cellcount(fdt, offset, idx, ac, &xaddr_fdt, sc,
+				      &xsize_fdt);
+	if (res < 0)
+		FAIL("Couldn't find entries in reg: %s", fdt_strerror(res));
+
+	res = fdt_read_integer(xaddr_fdt, ac, &xaddr);
+	if (res < 0)
+		FAIL("Couldn't parse entries in reg: %s", fdt_strerror(res));
+
+	res = fdt_read_integer(xsize_fdt, sc, &xsize);
+	if (res < 0)
+		FAIL("Couldn't parse entries in reg: %s", fdt_strerror(res));
+
+	if (xaddr != addr)
+		FAIL("Physical address for %s is %lx instead of %lx\n", path,
+		     xaddr, addr);
+
+	if (xsize != size)
+		FAIL("Size for %s is %lx instead of %lx\n", path,
+		     xsize, size);
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
+	check_node(fdt, "/identity-bus@0/id-device@400", 0,
+		   0x400, 0x100);
+	check_node(fdt, "/simple-bus@1000000/sb-device@8000000800", 0,
+		   0x8000000800, 0x200);
+	check_node(fdt, "/identity-bus@0/id-device@400", 1,
+		   0x400000000, 0x100000030);
+	check_node(fdt, "/simple-bus@1000000/sb-device@8000000800", 1,
+		   0x70000000, 0x700);
+	check_node(fdt, "/simple-bus@1000000/sb-device@8000000800", 2,
+		   0x1050000000, 0x20);
+
+	check_node_integer(fdt, "/identity-bus@0/id-device@400", 0,
+			   0x400, 0x100);
+	check_node_integer(fdt, "/simple-bus@1000000/sb-device@8000000800", 0,
+			   0x8000000800, 0x200);
+	check_node_integer(fdt, "/identity-bus@0/id-device@400", 1,
+			   0x400000000, 0x100000030);
+	check_node_integer(fdt, "/simple-bus@1000000/sb-device@8000000800", 1,
+			   0x70000000, 0x700);
+	check_node_integer(fdt, "/simple-bus@1000000/sb-device@8000000800", 2,
+			   0x1050000000, 0x20);
+	PASS();
+}
diff --git a/tests/addresses.dts b/tests/addresses.dts
index a2faaf5..32c4379 100644
--- a/tests/addresses.dts
+++ b/tests/addresses.dts
@@ -6,10 +6,21 @@
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
 	};
 };
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e4139dd..96aca48 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -243,6 +243,7 @@ libfdt_tests () {
 
     run_dtc_test -I dts -O dtb -o addresses.test.dtb addresses.dts
     run_test addr_size_cells addresses.test.dtb
+    run_test addr_size addresses.test.dtb
 
     run_dtc_test -I dts -O dtb -o stringlist.test.dtb stringlist.dts
     run_test stringlist stringlist.test.dtb
-- 
1.9.1
