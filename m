From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 2/2] libfdt: Add address translation functions
Date: Mon, 12 May 2014 16:06:11 +1000
Message-ID: <1399874771-23089-2-git-send-email-david@gibson.dropbear.id.au>
References: <1399874771-23089-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399874771-23089-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jdl-ClAdetSTwOo@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Add the fdt_address_translate() function to process 'ranges' properties
to translate addresses from one bus to another.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 libfdt/fdt_addresses.c      | 164 ++++++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h             |  46 ++++++++++++-
 tests/.gitignore            |   1 +
 tests/Makefile.tests        |   2 +-
 tests/addr_size_cells.c     |   2 +-
 tests/address_translation.c | 121 ++++++++++++++++++++++++++++++++
 tests/addresses.dts         |  30 +++++++-
 tests/run_tests.sh          |   1 +
 8 files changed, 363 insertions(+), 4 deletions(-)
 create mode 100644 tests/address_translation.c

diff --git a/libfdt/fdt_addresses.c b/libfdt/fdt_addresses.c
index eff4dbc..78a641a 100644
--- a/libfdt/fdt_addresses.c
+++ b/libfdt/fdt_addresses.c
@@ -94,3 +94,167 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
 
 	return val;
 }
+
+static int _fdt_address_cmp(int sizea, const fdt32_t *a,
+			    int sizeb, const fdt32_t *b)
+{
+	int n, i;
+
+	if (sizea < sizeb) {
+		for (i = 0; i < (sizeb - sizea); i++)
+			if (b[i] != 0)
+				return -1;
+
+		b += sizeb - sizea;
+		n = sizea;
+	} else if (sizeb < sizea) {
+		for (i = 0; i < (sizea - sizeb); i++)
+			if (a[i] != 0)
+				return 1;
+		a += sizea - sizeb;
+		n = sizeb;
+	} else {
+		n = sizea;
+	}
+
+	for (i = 0; i < n; i++) {
+		fdt32_t ai = fdt32_to_cpu(a[i]);
+		fdt32_t bi = fdt32_to_cpu(b[i]);
+
+		if (ai < bi)
+			return -1;
+		else if (bi < ai)
+			return 1;
+	}
+
+	return 0;
+}
+
+static int _fdt_address_diff(int size, const fdt32_t *a, const fdt32_t *b,
+			     fdt32_t *diff)
+{
+	int i;
+	int borrow = 0;
+
+	for (i = 0; i < size; i++) {
+		fdt32_t ai = fdt32_to_cpu(a[size - i - 1]);
+		fdt32_t bi = fdt32_to_cpu(b[size - i - 1]);
+
+		diff[size - i - 1] = cpu_to_fdt32(ai - bi - borrow);
+		borrow = ai < (bi + borrow);
+	}
+
+	return borrow ? -1 : 0; /* Negative result */
+}
+
+static int _fdt_address_add(int sizea, const fdt32_t *a,
+			    int sizeb, const fdt32_t *b,
+			    int size, fdt32_t *sum)
+{
+	int i;
+	int carry = 0;
+
+	for (i = 0; i < (sizea - size); i++)
+		if (a[i])
+			return -1; /* overflow */
+	for (i = 0; i < (sizeb - size); i++)
+		if (b[i])
+			return -1; /* overflow */
+	
+	for (i = 0; i < size; i++) {
+		fdt32_t ai = (i < sizea) ? fdt32_to_cpu(a[sizea - i - 1]) : 0;
+		fdt32_t bi = (i < sizeb) ? fdt32_to_cpu(b[sizeb - i - 1]) : 0;
+
+		sum[size - i - 1] = cpu_to_fdt32(ai + bi + carry);
+		carry = ((ai + bi) < ai) || ((ai + bi) < bi);
+	}
+
+	if (carry)
+		return -1; /* overflow */
+
+	return 0;
+}
+
+static int _fdt_address_apply_ranges(int ac, int sc, int pac,
+				     const fdt32_t *ranges, int rlen,
+				     const fdt32_t *addr, fdt32_t *paddr)
+{
+	int wcells = ac + sc + pac;
+	int i;
+
+	/* No translation */
+	if (!ranges)
+		return -FDT_ERR_NOTFOUND; /* No translation */
+
+	/* Identity translation */
+	if (rlen == 0) {
+		if (ac != pac)
+			return -FDT_ERR_BADRANGES;
+
+		memcpy(paddr, addr, sizeof(fdt32_t) * pac);
+		return 0;
+	}
+
+	if (rlen % (wcells * sizeof(fdt32_t)))
+		return -FDT_ERR_BADRANGES;
+
+	for (i = 0; i < (rlen / sizeof(fdt32_t) / wcells); i++) {
+		const fdt32_t *waddr = ranges + i * wcells;
+		const fdt32_t *wpaddr = waddr + ac;
+		const fdt32_t *wsize = wpaddr + pac;
+		fdt32_t offset[FDT_MAX_NCELLS];
+
+		if (_fdt_address_diff(ac, addr, waddr, offset) < 0)
+			continue;
+
+		if (_fdt_address_cmp(ac, offset, sc, wsize) >= 0)
+			continue;
+
+		if (_fdt_address_add(ac, offset, pac, wpaddr,
+				     pac, paddr) < 0)
+			return -FDT_ERR_BADRANGES;
+
+		return 0;
+	}
+
+	return -FDT_ERR_NOTFOUND;
+}
+
+int fdt_address_translate(const void *fdt,
+			  int inbusoffset, const fdt32_t *inaddr,
+			  int outbusoffset, fdt32_t *outaddr)
+{
+	int ac = fdt_address_cells(fdt, inbusoffset);
+	int sc = fdt_size_cells(fdt, inbusoffset);
+	fdt32_t tmpaddr[FDT_MAX_NCELLS];
+
+	while (inbusoffset != outbusoffset) {
+		int parent = fdt_parent_offset(fdt, inbusoffset);
+		int pac, rlen;
+		const fdt32_t *ranges;
+		int rc;
+
+		if (parent == -FDT_ERR_NOTFOUND)
+			/* Reached the root, meaning outbus wasn't an
+			 * ancestor of inbus */
+			return -FDT_ERR_BADOFFSET;
+		else if (parent < 0)
+			return parent;
+
+		pac = fdt_address_cells(fdt, parent);
+		ranges = fdt_getprop(fdt, inbusoffset, "ranges", &rlen);
+
+		rc = _fdt_address_apply_ranges(ac, sc, pac, ranges, rlen,
+					       inaddr, tmpaddr);
+		if (rc < 0)
+			return rc;
+
+		inaddr = tmpaddr;
+		ac = pac;
+		sc = fdt_size_cells(fdt, parent);
+		inbusoffset = parent;
+	}
+
+	memcpy(outaddr, inaddr, ac * sizeof(fdt32_t));
+	return 0;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 32d5227..dc321c3 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -120,8 +120,10 @@
 #define FDT_ERR_BADNCELLS	14
 	/* FDT_ERR_BADNCELLS: Device tree has a #address-cells, #size-cells
 	 * or similar property with a bad format or value */
+#define FDT_ERR_BADRANGES	15
+	/* FDT_ERR_BADRANGES: Device tree has a bad ranges property */
 
-#define FDT_ERR_MAX		14
+#define FDT_ERR_MAX		15
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
@@ -911,6 +913,48 @@ int fdt_address_cells(const void *fdt, int nodeoffset);
  */
 int fdt_size_cells(const void *fdt, int nodeoffset);
 
+/**
+ * fdt_address_translate - Translate OF addresses
+ * @fdt: pointer to the device tree blob
+ * @inbusoffset: offset of node which defines the address space of the input 
+ *               address
+ * @inaddr: input address, must point to N contiguous cells of data
+ *          where N is the #address-cells of the node at inbusoffset
+ * @outbusoffset: offset of the node into whose address space to
+ *                translate the address
+ * @outaddr: buffer to store the translated address, must point to N
+ *           contiguous cells of space (which will be overwritten),
+ *           where N is the #address-cells of the node at outbusoffset
+ *
+ * Given an address within the address space of one node, translate it
+ * to an address in the address space of an ancestor node.
+ *
+ * NOTE: This function is very expensive, as it scans the device tree
+ * structure from the start to the start of node for every level of
+ * translation, making it roughly O(n^2) in the size of the flattened
+ * tree.  FIXME: improve this
+ *
+ * returns:
+ *	0, on success outaddr will contain the translated address
+ *      -FDT_ERR_NOTFOUND, if the address is not mapped into the bus at
+ *                          outbusoffset
+ *      -FDT_ERR_BADOFFEST, of inbusoffset or outbusoffset don't point to
+ *                          nodes, or if outbusoffset is not an ancestor of
+ *		            inbusoffset
+ *      -FDT_ERR_BADNCELLS, if any intermediate node has a badly formatted or
+ *                          invalid #size-cells property
+ *      -FDT_ERR_BADRANGES, if any intermediate node has an invalid ranges
+ *                          property
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_address_translate(const void *fdt,
+			  int inbusoffset, const fdt32_t *inaddr,
+			  int outbusoffset, fdt32_t *outaddr);
+
 
 /**********************************************************************/
 /* Write-in-place functions                                           */
diff --git a/tests/.gitignore b/tests/.gitignore
index 5656555..a99e109 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -4,6 +4,7 @@
 tmp.*
 /add_subnode_with_nops
 /addr_size_cells
+/address_translation
 /appendprop[12]
 /asm_tree_dump
 /boot-cpuid
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 9adedec..2a7f347 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -8,7 +8,7 @@ LIB_TESTS_L = get_mem_rsv \
 	char_literal \
 	sized_cells \
 	notfound \
-	addr_size_cells \
+	addr_size_cells address_translation \
 	setprop_inplace nop_property nop_node \
 	sw_tree1 \
 	move_and_save mangle-layout nopulate \
diff --git a/tests/addr_size_cells.c b/tests/addr_size_cells.c
index 6090d93..6e737f4 100644
--- a/tests/addr_size_cells.c
+++ b/tests/addr_size_cells.c
@@ -59,6 +59,6 @@ int main(int argc, char *argv[])
 
 	check_node(fdt, "/", 2, 2);
 	check_node(fdt, "/identity-bus@0", 2, 2);
-	check_node(fdt, "/simple-bus@1000000", 2, 1);
+	check_node(fdt, "/offset-bus@1000000", 2, 2);
 	PASS();
 }
diff --git a/tests/address_translation.c b/tests/address_translation.c
new file mode 100644
index 0000000..c205598
--- /dev/null
+++ b/tests/address_translation.c
@@ -0,0 +1,121 @@
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
+static void verbose_print_addr(int cells, const fdt32_t *addr)
+{
+	int i;
+
+	for (i = 0; i < cells; i++)
+		verbose_printf("%08x ", fdt32_to_cpu(addr[i]));
+}
+
+static void check_node(const void *fdt, int offset)
+{
+	char path[1024];
+	const fdt32_t *tests;
+	int testlen, rc, i;
+	int ac;
+
+	rc = fdt_get_path(fdt, offset, path, sizeof(path));
+	if (rc < 0)
+		FAIL("fdt_get_path(): %s\n", fdt_strerror(rc));
+
+	ac = fdt_address_cells(fdt, offset);
+	
+	verbose_printf("Checking node %s [#address-cells = %d]\n", path, ac);
+
+	tests = fdt_getprop(fdt, offset, "libfdt,test-translation", &testlen);
+	if (!tests)
+		return;
+
+	i = 0;
+	while (i < (testlen / sizeof(fdt32_t))) {
+		int phandle = fdt32_to_cpu(tests[i++]);
+		int toffset;
+		const fdt32_t *inaddr, *checkaddr;
+		fdt32_t *outaddr;
+		int tac;
+		char tpath[1024];
+
+		toffset = fdt_node_offset_by_phandle(fdt, phandle);
+
+		tac = fdt_address_cells(fdt, toffset);
+		rc = fdt_get_path(fdt, toffset, tpath, sizeof(tpath));
+		if (rc < 0)
+			FAIL("fdt_get_path(): %s\n", fdt_strerror(rc));
+
+		inaddr = tests + i;
+		i += ac;
+		checkaddr = tests + i;
+		i += tac;
+
+		verbose_printf("Translating address ");
+		verbose_print_addr(ac, inaddr);
+		verbose_printf("to bus %s [#address-cells = %d]\n",
+			       tpath, tac);
+
+		verbose_printf("Expecting: ");
+		verbose_print_addr(tac, checkaddr);
+		verbose_printf("\n");
+
+		outaddr = alloca(tac * sizeof(fdt32_t));
+		rc = fdt_address_translate(fdt, offset, inaddr, toffset, outaddr);
+		if (rc < 0)
+			FAIL("fdt_address_translate(): %s\n", fdt_strerror(rc));
+
+		verbose_printf("Got: ");
+		verbose_print_addr(tac, outaddr);
+		verbose_printf("\n");
+
+		if (memcmp(outaddr, checkaddr, tac * sizeof(fdt32_t)) != 0)
+			FAIL("Incorrect translated address");
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+	int offset = 0;
+
+	if (argc != 2)
+		CONFIG("Usage: %s <dtb file>\n", argv[0]);
+
+	test_init(argc, argv);
+	fdt = load_blob(argv[1]);
+
+	do {
+		check_node(fdt, offset);
+		offset = fdt_next_node(fdt, offset, NULL);
+	} while (offset >= 0);
+
+	if (offset != -FDT_ERR_NOTFOUND)
+		FAIL("fdt_next_node(): %s\n", fdt_strerror(offset));
+
+	PASS();
+}
diff --git a/tests/addresses.dts b/tests/addresses.dts
index a2faaf5..2ee2be7 100644
--- a/tests/addresses.dts
+++ b/tests/addresses.dts
@@ -6,10 +6,38 @@
 	#size-cells = <2>;
 
 	identity-bus@0 {
+		ranges;
+
+		libfdt,test-translation = <
+			&{/} 0 0  0 0
+			&{/} 0xabcd 0x1234  0xabcd 0x1234
+		>;
 	};
 
-	simple-bus@1000000 {
+	offset-bus@1000000 {
 		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x1000000 0x0 0x1000000>;
+
+		libfdt,test-translation = <
+			&{/} 0 0  0 0x1000000
+			&{/} 0 0x1234  0 0x1001234
+			&{/} 0 0xffffff 0 0x1ffffff
+		>;
+	};
+
+	embed-bus@100000000 {
+		#address-cells = <1>;
 		#size-cells = <1>;
+		ranges = <0x0 0x1 0x0 0x80000000
+			  0x80000000 0x1 0x80000000 0x80000000>;
+
+		libfdt,test-translation = <
+			&{/} 0x0  0x1 0x0
+			&{/} 0xabcd  0x1 0xabcd
+			&{/} 0x7fffffff  0x1 0x7fffffff
+			&{/} 0x80000000  0x1 0x80000000
+			&{/} 0xffffffff  0x1 0xffffffff
+		>;
 	};
 };
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f205ce6..68d4360 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -190,6 +190,7 @@ libfdt_tests () {
 
     run_dtc_test -I dts -O dtb -o addresses.test.dtb addresses.dts
     run_test addr_size_cells addresses.test.dtb
+    run_test address_translation addresses.test.dtb
 
     # Sequential write tests
     run_test sw_tree1
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
