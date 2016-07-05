From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 13/13] tests: Introduce DT overlay tests
Date: Tue,  5 Jul 2016 10:26:46 +0200
Message-ID: <20160705082646.25044-14-maxime.ripard@free-electrons.com>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160705082646.25044-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

This adds a bunch of unit tests for the "fdt apply" command.

They've all been run successfully in the sandbox. However, as you still
require an out-of-tree dtc with overlay support, this is disabled by
default.

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 Makefile                          |   1 +
 include/test/overlay.h            |  16 ++
 include/test/suites.h             |   1 +
 lib/libfdt/fdt_overlay.c          | 311 ++++++++++++++++++++++++++++++++------
 test/Kconfig                      |   1 +
 test/cmd_ut.c                     |   6 +
 test/overlay/Kconfig              |  11 ++
 test/overlay/Makefile             |  15 ++
 test/overlay/cmd_ut_overlay.c     | 268 ++++++++++++++++++++++++++++++++
 test/overlay/test-fdt-base.dts    |  21 +++
 test/overlay/test-fdt-overlay.dts |  96 ++++++++++++
 11 files changed, 698 insertions(+), 49 deletions(-)
 create mode 100644 include/test/overlay.h
 create mode 100644 test/overlay/Kconfig
 create mode 100644 test/overlay/Makefile
 create mode 100644 test/overlay/cmd_ut_overlay.c
 create mode 100644 test/overlay/test-fdt-base.dts
 create mode 100644 test/overlay/test-fdt-overlay.dts

diff --git a/Makefile b/Makefile
index 09a18e1a4dde..a19c56467ae7 100644
--- a/Makefile
+++ b/Makefile
@@ -665,6 +665,7 @@ libs-$(CONFIG_HAS_POST) += post/
 libs-y += test/
 libs-y += test/dm/
 libs-$(CONFIG_UT_ENV) += test/env/
+libs-$(CONFIG_UT_OVERLAY) += test/overlay/
 
 libs-y += $(if $(BOARDDIR),board/$(BOARDDIR)/)
 
diff --git a/include/test/overlay.h b/include/test/overlay.h
new file mode 100644
index 000000000000..392f28ff8405
--- /dev/null
+++ b/include/test/overlay.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __TEST_OVERLAY_H__
+#define __TEST_OVERLAY_H__
+
+#include <test/test.h>
+
+/* Declare a new environment test */
+#define OVERLAY_TEST(_name, _flags)	UNIT_TEST(_name, _flags, overlay_test)
+
+#endif /* __TEST_OVERLAY_H__ */
diff --git a/include/test/suites.h b/include/test/suites.h
index f5790333ff8e..0e94feb07a79 100644
--- a/include/test/suites.h
+++ b/include/test/suites.h
@@ -10,6 +10,7 @@
 
 int do_ut_dm(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]);
 int do_ut_env(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]);
+int do_ut_overlay(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]);
 int do_ut_time(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]);
 
 #endif /* __TEST_SUITES_H__ */
diff --git a/lib/libfdt/fdt_overlay.c b/lib/libfdt/fdt_overlay.c
index 1dac8fd48343..40b6d274558a 100644
--- a/lib/libfdt/fdt_overlay.c
+++ b/lib/libfdt/fdt_overlay.c
@@ -5,6 +5,20 @@
 
 #include "libfdt_internal.h"
 
+/**
+ * overlay_get_target_phandle - retrieves the target phandle of a fragment
+ * @fdto: pointer to the device tree overlay blob
+ * @fragment: node offset of the fragment in the overlay
+ *
+ * overlay_get_target_phandle() retrieves the target phandle of an
+ * overlay fragment when that fragment uses a phandle (target
+ * property) instead of a path (target-path property).
+ *
+ * returns:
+ *      the phandle pointed by the target property
+ *      0, if the phandle was not found
+ *	-1, if the phandle was malformed
+ */
 static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
 {
 	const uint32_t *val;
@@ -14,12 +28,26 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
 	if (!val)
 		return 0;
 
-	if ((*val == 0xffffffff) || (len != sizeof(*val)))
-		return 0xffffffff;
+	if ((*val == (uint32_t)-1) || (len != sizeof(*val)))
+		return (uint32_t)-1;
 
 	return fdt32_to_cpu(*val);
 }
 
+/**
+ * overlay_get_target - retrieves the target phandle of a fragment
+ * @fdt: Base device tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment: node offset of the fragment in the overlay
+ *
+ * overlay_get_target() retrieves the target phandle in the base
+ * device tree of a fragment, no matter how the actual targetting is
+ * done (through a phandle or a path)
+ *
+ * returns:
+ *      the targetted node offset in the base device tree
+ *      Negative error code on error
+ */
 static int overlay_get_target(const void *fdt, const void *fdto,
 			      int fragment)
 {
@@ -28,7 +56,7 @@ static int overlay_get_target(const void *fdt, const void *fdto,
 
 	/* Try first to do a phandle based lookup */
 	phandle = overlay_get_target_phandle(fdto, fragment);
-	if (phandle == -1)
+	if (phandle == (uint32_t)-1)
 		return -FDT_ERR_BADPHANDLE;
 
 	if (phandle)
@@ -42,6 +70,20 @@ static int overlay_get_target(const void *fdt, const void *fdto,
 	return fdt_path_offset(fdt, path);
 }
 
+/**
+ * overlay_phandle_add_offset - Increases a phandle by an offset
+ * @fdt: Base device tree blob
+ * @node: Device tree overlay blob
+ * @name: Name of the property to modify (phandle or linux,phandle)
+ * @delta: offset to apply
+ *
+ * overlay_phandle_add_offset() increments a node phandle by a given
+ * offset.
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
 static int overlay_phandle_add_offset(void *fdt, int node,
 				      const char *name, uint32_t delta)
 {
@@ -64,6 +106,21 @@ static int overlay_phandle_add_offset(void *fdt, int node,
 	return fdt_setprop_inplace_u32(fdt, node, name, adj_val);
 }
 
+/**
+ * overlay_adjust_node_phandles - Offsets the phandles of a node
+ * @fdto: Device tree overlay blob
+ * @node: Offset of the node we want to adjust
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_adjust_node_phandles() adds a constant to all the phandles
+ * of a given node. This is mainly use as part of the overlay
+ * application process, when we want to update all the overlay
+ * phandles to not conflict with the overlays of the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
 static int overlay_adjust_node_phandles(void *fdto, int node,
 					uint32_t delta)
 {
@@ -95,6 +152,20 @@ static int overlay_adjust_node_phandles(void *fdto, int node,
 	return 0;
 }
 
+/**
+ * overlay_adjust_local_phandles - Adjust the phandles of a whole overlay
+ * @fdto: Device tree overlay blob
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_adjust_local_phandles() adds a constant to all the
+ * phandles of an overlay. This is mainly use as part of the overlay
+ * application process, when we want to update all the overlay
+ * phandles to not conflict with the overlays of the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
 static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
 {
 	/*
@@ -103,6 +174,25 @@ static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
 	return overlay_adjust_node_phandles(fdto, 0, delta);
 }
 
+/**
+ * overlay_update_local_node_references - Adjust the overlay references
+ * @fdto: Device tree overlay blob
+ * @tree_node: Node offset of the node to operate on
+ * @fixup_node: Node offset of the matching local fixups node
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_update_local_nodes_references() update the phandles
+ * pointing to a node within the device tree overlay by adding a
+ * constant delta.
+ *
+ * This is mainly used as part of a device tree application process,
+ * where you want the device tree overlays phandles to not conflict
+ * with the ones from the base device tree before merging them.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
 static int overlay_update_local_node_references(void *fdto,
 						int tree_node,
 						int fixup_node,
@@ -113,41 +203,49 @@ static int overlay_update_local_node_references(void *fdto,
 	int ret;
 
 	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
-		const uint32_t *val = NULL;
-		uint32_t adj_val, index;
+		const unsigned char *fixup_val, *tree_val;
 		const char *name;
 		int fixup_len;
 		int tree_len;
+		int i;
 
-		val = fdt_getprop_by_offset(fdto, fixup_prop,
-					    &name, &fixup_len);
-		if (!val)
+		fixup_val = fdt_getprop_by_offset(fdto, fixup_prop,
+						  &name, &fixup_len);
+		if (!fixup_val)
 			return fixup_len;
-		index = fdt32_to_cpu(*val);
 
-		val = fdt_getprop(fdto, tree_node, name, &tree_len);
-		if (!val)
+		tree_val = fdt_getprop(fdto, tree_node, name, &tree_len);
+		if (!tree_val)
 			return tree_len;
 
-		/*
-		 * The index can be unaligned.
-		 *
-		 * Use a memcpy for the architectures that do not
-		 * support unaligned accesses.
-		 */
-		memcpy(&adj_val, (unsigned char *)val + index,
-		       sizeof(uint32_t));
-
-		adj_val = fdt32_to_cpu(adj_val);
-		adj_val += delta;
-		adj_val = cpu_to_fdt32(adj_val);
-
-		ret = fdt_setprop_inplace_namelen_partial(fdto, tree_node,
-							  name, strlen(name),
-							  index, &adj_val,
-							  sizeof(adj_val));
-		if (ret)
-			return ret;
+		for (i = 0; i < fixup_len; i += sizeof(uint32_t)) {
+			uint32_t adj_val, index;
+
+			index = *(uint32_t *)(fixup_val + i);
+			index = fdt32_to_cpu(index);
+
+			/*
+			 * phandles to fixup can be unaligned.
+			 *
+			 * Use a memcpy for the architectures that do
+			 * not support unaligned accesses.
+			 */
+			memcpy(&adj_val, tree_val + index, sizeof(uint32_t));
+
+			adj_val = fdt32_to_cpu(adj_val);
+			adj_val += delta;
+			adj_val = cpu_to_fdt32(adj_val);
+
+			ret = fdt_setprop_inplace_namelen_partial(fdto,
+								  tree_node,
+								  name,
+								  strlen(name),
+								  index,
+								  &adj_val,
+								  sizeof(adj_val));
+			if (ret)
+				return ret;
+		}
 	}
 
 	fdt_for_each_subnode(fdto, fixup_child, fixup_node) {
@@ -171,11 +269,28 @@ static int overlay_update_local_node_references(void *fdto,
 	return 0;
 }
 
-static int overlay_update_local_references(void *dto, uint32_t delta)
+/**
+ * overlay_update_local_references - Adjust the overlay references
+ * @fdto: Device tree overlay blob
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_update_local_references() update all the phandles pointing
+ * to a node within the device tree overlay by adding a constant
+ * delta to not conflict with the base overlay.
+ *
+ * This is mainly used as part of a device tree application process,
+ * where you want the device tree overlays phandles to not conflict
+ * with the ones from the base device tree before merging them.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_local_references(void *fdto, uint32_t delta)
 {
 	int fixups;
 
-	fixups = fdt_path_offset(dto, "/__local_fixups__");
+	fixups = fdt_path_offset(fdto, "/__local_fixups__");
 	if (fixups < 0) {
 		/* There's no local phandles to adjust, bail out */
 		if (fixups == -FDT_ERR_NOTFOUND)
@@ -187,10 +302,33 @@ static int overlay_update_local_references(void *dto, uint32_t delta)
 	/*
 	 * Update our local references from the root of the tree
 	 */
-	return overlay_update_local_node_references(dto, 0, fixups,
+	return overlay_update_local_node_references(fdto, 0, fixups,
 						    delta);
 }
 
+/**
+ * overlay_fixup_one_phandle - Set an overlay phandle to the base one
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @path: Path to a node holding a phandle in the overlay
+ * @path_len: number of path characters to consider
+ * @name: Name of the property holding the phandle reference in the overlay
+ * @name_len: number of name characters to consider
+ * @index: Index in the overlay property where the phandle is stored
+ * @label: Label of the node referenced by the phandle
+ *
+ * overlay_fixup_one_phandle() resolves an overlay phandle pointing to
+ * a node in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want all the phandles in the overlay to point to the actual
+ * base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
 static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 				     int symbols_off,
 				     const char *path, uint32_t path_len,
@@ -225,6 +363,25 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 						   &phandle, sizeof(phandle));
 };
 
+/**
+ * overlay_fixup_phandle - Set an overlay phandle to the base one
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @property: Property offset in the overlay holding the list of fixups
+ *
+ * overlay_fixup_phandle() resolves all the overlay phandles pointed
+ * to in a __local_fixup__ property, and updates them to match the
+ * phandles in use in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want all the phandles in the overlay to point to the actual
+ * base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
 static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 				 int property)
 {
@@ -275,57 +432,98 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 	return 0;
 }
 
-static int overlay_fixup_phandles(void *dt, void *dto)
+/**
+ * overlay_fixup_phandles - Resolve the overlay phandles to the base
+ *                          device tree
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_fixup_phandles() resolves all the overlay phandles pointing
+ * to nodes in the base device tree.
+ *
+ * This is one of the steps of the device tree overlay application
+ * process, when you want all the phandles in the overlay to point to
+ * the actual base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_phandles(void *fdt, void *fdto)
 {
 	int fixups_off, symbols_off;
 	int property;
 
-	symbols_off = fdt_path_offset(dt, "/__symbols__");
-	fixups_off = fdt_path_offset(dto, "/__fixups__");
+	symbols_off = fdt_path_offset(fdt, "/__symbols__");
+	fixups_off = fdt_path_offset(fdto, "/__fixups__");
+
+	fdt_for_each_property_offset(property, fdto, fixups_off) {
+		int ret;
 
-	fdt_for_each_property_offset(property, dto, fixups_off)
-		overlay_fixup_phandle(dt, dto, symbols_off, property);
+		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
 
-static int apply_overlay_node(void *dt, int target,
-			      void *dto, int fragment)
+/**
+ * overlay_apply_node - Merge an overlay fragment into the base device tree
+ * @fdt: Base Device Tree blob
+ * @target: Node offset in the base device tree to apply the fragment to
+ * @fdto: Device tree overlay blob
+ * @fragment: Node offset in the overlay holding the changes to merge
+ *
+ * overlay_apply_node() merges an overlay fragment into a target base
+ * device tree node pointed.
+ *
+ * This is part of the final step in the device tree overlay
+ * application process, when all the phandles have been adjusted and
+ * resolved and you just have to merge overlay into the base device
+ * tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_apply_node(void *fdt, int target,
+			      void *fdto, int fragment)
 {
 	int property;
 	int node;
 
-	fdt_for_each_property_offset(property, dto, fragment) {
+	fdt_for_each_property_offset(property, fdto, fragment) {
 		const char *name;
 		const void *prop;
 		int prop_len;
 		int ret;
 
-		prop = fdt_getprop_by_offset(dto, property, &name,
+		prop = fdt_getprop_by_offset(fdto, property, &name,
 					     &prop_len);
 		if (prop_len == -FDT_ERR_NOTFOUND)
 			return -FDT_ERR_INTERNAL;
 		if (prop_len < 0)
 			return prop_len;
 
-		ret = fdt_setprop(dt, target, name, prop, prop_len);
+		ret = fdt_setprop(fdt, target, name, prop, prop_len);
 		if (ret)
 			return ret;
 	}
 
-	fdt_for_each_subnode(dto, node, fragment) {
-		const char *name = fdt_get_name(dto, node, NULL);
+	fdt_for_each_subnode(fdto, node, fragment) {
+		const char *name = fdt_get_name(fdto, node, NULL);
 		int nnode;
 		int ret;
 
-		nnode = fdt_add_subnode(dt, target, name);
+		nnode = fdt_add_subnode(fdt, target, name);
 		if (nnode == -FDT_ERR_EXISTS)
-			nnode = fdt_subnode_offset(dt, target, name);
+			nnode = fdt_subnode_offset(fdt, target, name);
 
 		if (nnode < 0)
 			return nnode;
 
-		ret = apply_overlay_node(dt, nnode, dto, node);
+		ret = overlay_apply_node(fdt, nnode, fdto, node);
 		if (ret)
 			return ret;
 	}
@@ -333,6 +531,21 @@ static int apply_overlay_node(void *dt, int target,
 	return 0;
 }
 
+/**
+ * overlay_merge - Merge an overlay into its base device tree
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_merge() merges an overlay into its base device tree.
+ *
+ * This is the final step in the device tree overlay application
+ * process, when all the phandles have been adjusted and resolved and
+ * you just have to merge overlay into the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
 static int overlay_merge(void *dt, void *dto)
 {
 	int fragment;
@@ -350,7 +563,7 @@ static int overlay_merge(void *dt, void *dto)
 		if (overlay < 0)
 			return overlay;
 
-		ret = apply_overlay_node(dt, target, dto, overlay);
+		ret = overlay_apply_node(dt, target, dto, overlay);
 		if (ret)
 			return ret;
 	}
diff --git a/test/Kconfig b/test/Kconfig
index d71c332eee27..3643761bc6ef 100644
--- a/test/Kconfig
+++ b/test/Kconfig
@@ -17,3 +17,4 @@ config UT_TIME
 
 source "test/dm/Kconfig"
 source "test/env/Kconfig"
+source "test/overlay/Kconfig"
diff --git a/test/cmd_ut.c b/test/cmd_ut.c
index f6e1f413db7f..14333423a178 100644
--- a/test/cmd_ut.c
+++ b/test/cmd_ut.c
@@ -19,6 +19,9 @@ static cmd_tbl_t cmd_ut_sub[] = {
 #if defined(CONFIG_UT_ENV)
 	U_BOOT_CMD_MKENT(env, CONFIG_SYS_MAXARGS, 1, do_ut_env, "", ""),
 #endif
+#ifdef CONFIG_UT_OVERLAY
+	U_BOOT_CMD_MKENT(overlay, CONFIG_SYS_MAXARGS, 1, do_ut_overlay, "", ""),
+#endif
 #ifdef CONFIG_UT_TIME
 	U_BOOT_CMD_MKENT(time, CONFIG_SYS_MAXARGS, 1, do_ut_time, "", ""),
 #endif
@@ -68,6 +71,9 @@ static char ut_help_text[] =
 #ifdef CONFIG_UT_ENV
 	"ut env [test-name]\n"
 #endif
+#ifdef CONFIG_UT_OVERLAY
+	"ut overlay [test-name]\n"
+#endif
 #ifdef CONFIG_UT_TIME
 	"ut time - Very basic test of time functions\n"
 #endif
diff --git a/test/overlay/Kconfig b/test/overlay/Kconfig
new file mode 100644
index 000000000000..13c85428cbaa
--- /dev/null
+++ b/test/overlay/Kconfig
@@ -0,0 +1,11 @@
+config UT_OVERLAY
+	bool "Enable Device Tree Overlays Unit Tests"
+	depends on OF_LIBFDT_OVERLAY
+	depends on UNIT_TEST
+	help
+	  This enables the 'ut overlay' command which runs a series of unit
+	  tests on the fdt overlay code.
+	  If all is well then all tests pass although there will be a few
+	  messages printed along the way.
+	  Be warned that it requires an out-of-tree dtc compiler with patches
+	  to support the DT overlays, otherwise it will fail.
diff --git a/test/overlay/Makefile b/test/overlay/Makefile
new file mode 100644
index 000000000000..907f08544619
--- /dev/null
+++ b/test/overlay/Makefile
@@ -0,0 +1,15 @@
+#
+# Copyright (c) 2016 NextThing Co
+# Copyright (c) 2016 Free Electrons
+#
+# SPDX-License-Identifier:	GPL-2.0+
+#
+
+# Test files
+obj-y += cmd_ut_overlay.o
+
+DTC_FLAGS += -@
+
+# DT overlays
+obj-y += test-fdt-base.dtb.o
+obj-y += test-fdt-overlay.dtb.o
diff --git a/test/overlay/cmd_ut_overlay.c b/test/overlay/cmd_ut_overlay.c
new file mode 100644
index 000000000000..87dc9328c674
--- /dev/null
+++ b/test/overlay/cmd_ut_overlay.c
@@ -0,0 +1,268 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <command.h>
+#include <errno.h>
+#include <malloc.h>
+
+#include <linux/sizes.h>
+
+#include <test/ut.h>
+#include <test/overlay.h>
+
+/* 4k ought to be enough for anybody */
+#define FDT_COPY_SIZE	(4 * SZ_1K)
+
+extern u32 __dtb_test_fdt_base_begin;
+extern u32 __dtb_test_fdt_overlay_begin;
+
+static int fdt_getprop_u32_by_index(void *fdt, const char *path,
+				    const char *name, int index,
+				    u32 *out)
+{
+	const fdt32_t *val;
+	int node_off;
+	int len;
+
+	node_off = fdt_path_offset(fdt, path);
+	if (node_off < 0)
+		return node_off;
+
+	val = fdt_getprop(fdt, node_off, name, &len);
+	if (!val || (len < (sizeof(uint32_t) * (index + 1))))
+		return -FDT_ERR_NOTFOUND;
+
+	*out = fdt32_to_cpu(*(val + index));
+
+	return 0;
+}
+
+static int fdt_getprop_u32(void *fdt, const char *path, const char *name,
+			   u32 *out)
+{
+	return fdt_getprop_u32_by_index(fdt, path, name, 0, out);
+}
+
+static int fdt_getprop_str(void *fdt, const char *path, const char *name,
+			   const char **out)
+{
+	int node_off;
+
+	node_off = fdt_path_offset(fdt, path);
+	if (node_off < 0)
+		return node_off;
+
+	return fdt_get_string(fdt, node_off, name, out);
+}
+
+static int fdt_overlay_change_int_property(struct unit_test_state *uts)
+{
+	void *fdt = uts->priv;
+	u32 val = 0;
+
+	ut_assertok(fdt_getprop_u32(fdt, "/test-node", "test-int-property",
+				    &val));
+	ut_asserteq(43, val);
+
+	return CMD_RET_SUCCESS;
+}
+OVERLAY_TEST(fdt_overlay_change_int_property, 0);
+
+static int fdt_overlay_change_str_property(struct unit_test_state *uts)
+{
+	void *fdt = uts->priv;
+	const char *val = NULL;
+
+	ut_assertok(fdt_getprop_str(fdt, "/test-node", "test-str-property",
+				    &val));
+	ut_asserteq_str("foobar", val);
+
+	return CMD_RET_SUCCESS;
+}
+OVERLAY_TEST(fdt_overlay_change_str_property, 0);
+
+static int fdt_overlay_add_str_property(struct unit_test_state *uts)
+{
+	void *fdt = uts->priv;
+	const char *val = NULL;
+
+	ut_assertok(fdt_getprop_str(fdt, "/test-node", "test-str-property-2",
+				    &val));
+	ut_asserteq_str("foobar2", val);
+
+	return CMD_RET_SUCCESS;
+}
+OVERLAY_TEST(fdt_overlay_add_str_property, 0);
+
+static int fdt_overlay_add_node_by_phandle(struct unit_test_state *uts)
+{
+	void *fdt = uts->priv;
+	int off;
+
+	off = fdt_path_offset(fdt, "/test-node/new-node");
+	ut_assert(off >= 0);
+
+	ut_assertnonnull(fdt_getprop(fdt, off, "new-property", NULL));
+
+	return CMD_RET_SUCCESS;
+}
+OVERLAY_TEST(fdt_overlay_add_node_by_phandle, 0);
+
+static int fdt_overlay_add_node_by_path(struct unit_test_state *uts)
+{
+	void *fdt = uts->priv;
+	int off;
+
+	off = fdt_path_offset(fdt, "/new-node");
+	ut_assert(off >= 0);
+
+	ut_assertnonnull(fdt_getprop(fdt, off, "new-property", NULL));
+
+	return CMD_RET_SUCCESS;
+}
+OVERLAY_TEST(fdt_overlay_add_node_by_path, 0);
+
+static int fdt_overlay_add_subnode_property(struct unit_test_state *uts)
+{
+	void *fdt = uts->priv;
+	int off;
+
+	off = fdt_path_offset(fdt, "/test-node/sub-test-node");
+	ut_assert(off >= 0);
+
+	ut_assertnonnull(fdt_getprop(fdt, off, "sub-test-property", NULL));
+	ut_assertnonnull(fdt_getprop(fdt, off, "new-sub-test-property", NULL));
+
+	return CMD_RET_SUCCESS;
+}
+OVERLAY_TEST(fdt_overlay_add_subnode_property, 0);
+
+static int fdt_overlay_local_phandle(struct unit_test_state *uts)
+{
+	uint32_t local_phandle;
+	void *fdt = uts->priv;
+	u32 val = 0;
+	int off;
+
+	off = fdt_path_offset(fdt, "/new-local-node");
+	ut_assert(off >= 0);
+
+	local_phandle = fdt_get_phandle(fdt, off);
+	ut_assert(local_phandle);
+
+	ut_assertok(fdt_getprop_u32_by_index(fdt, "/", "test-several-phandle",
+					     0, &val));
+	ut_asserteq(local_phandle, val);
+
+	ut_assertok(fdt_getprop_u32_by_index(fdt, "/", "test-several-phandle",
+					     1, &val));
+	ut_asserteq(local_phandle, val);
+
+	return CMD_RET_SUCCESS;
+}
+OVERLAY_TEST(fdt_overlay_local_phandle, 0);
+
+static int fdt_overlay_local_phandles(struct unit_test_state *uts)
+{
+	uint32_t local_phandle, test_phandle;
+	void *fdt = uts->priv;
+	u32 val = 0;
+	int off;
+
+	off = fdt_path_offset(fdt, "/new-local-node");
+	ut_assert(off >= 0);
+
+	local_phandle = fdt_get_phandle(fdt, off);
+	ut_assert(local_phandle);
+
+	off = fdt_path_offset(fdt, "/test-node");
+	ut_assert(off >= 0);
+
+	test_phandle = fdt_get_phandle(fdt, off);
+	ut_assert(test_phandle);
+
+	ut_assertok(fdt_getprop_u32_by_index(fdt, "/", "test-phandle", 0,
+					     &val));
+	ut_asserteq(test_phandle, val);
+
+	ut_assertok(fdt_getprop_u32_by_index(fdt, "/", "test-phandle", 1,
+					     &val));
+	ut_asserteq(local_phandle, val);
+
+	return CMD_RET_SUCCESS;
+}
+OVERLAY_TEST(fdt_overlay_local_phandles, 0);
+
+int do_ut_overlay(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
+{
+	struct unit_test *tests = ll_entry_start(struct unit_test,
+						 overlay_test);
+	const int n_ents = ll_entry_count(struct unit_test, overlay_test);
+	struct unit_test_state *uts;
+	struct unit_test *test;
+	void *fdt_base = &__dtb_test_fdt_base_begin;
+	void *fdt_overlay = &__dtb_test_fdt_overlay_begin;
+	void *fdt_base_copy, *fdt_overlay_copy;
+
+	uts = calloc(1, sizeof(*uts));
+	if (!uts)
+		return -ENOMEM;
+
+	ut_assertok(fdt_check_header(fdt_base));
+	ut_assertok(fdt_check_header(fdt_overlay));
+
+	fdt_base_copy = malloc(FDT_COPY_SIZE);
+	if (!fdt_base_copy)
+		return -ENOMEM;
+	uts->priv = fdt_base_copy;
+
+	fdt_overlay_copy = malloc(FDT_COPY_SIZE);
+	if (!fdt_overlay_copy)
+		return -ENOMEM;
+
+	/*
+	 * Resize the FDT to 4k so that we have room to operate on
+	 *
+	 * (and relocate it since the memory might be mapped
+	 * read-only)
+	 */
+	ut_assertok(fdt_open_into(fdt_base, fdt_base_copy, FDT_COPY_SIZE));
+
+	/*
+	 * Resize the overlay to 4k so that we have room to operate on
+	 *
+	 * (and relocate it since the memory might be mapped
+	 * read-only)
+	 */
+	ut_assertok(fdt_open_into(fdt_overlay, fdt_overlay_copy,
+				  FDT_COPY_SIZE));
+
+	/* Apply the overlay */
+	ut_assertok(fdt_overlay_apply(fdt_base_copy, fdt_overlay_copy));
+
+	if (argc == 1)
+		printf("Running %d environment tests\n", n_ents);
+
+	for (test = tests; test < tests + n_ents; test++) {
+		if (argc > 1 && strcmp(argv[1], test->name))
+			continue;
+		printf("Test: %s\n", test->name);
+
+		uts->start = mallinfo();
+
+		test->func(uts);
+	}
+
+	printf("Failures: %d\n", uts->fail_count);
+
+	free(fdt_overlay_copy);
+	free(fdt_base_copy);
+	free(uts);
+
+	return uts->fail_count ? CMD_RET_FAILURE : 0;
+}
diff --git a/test/overlay/test-fdt-base.dts b/test/overlay/test-fdt-base.dts
new file mode 100644
index 000000000000..2603adb6821e
--- /dev/null
+++ b/test/overlay/test-fdt-base.dts
@@ -0,0 +1,21 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	test: test-node {
+		test-int-property = <42>;
+		test-str-property = "foo";
+
+		subtest: sub-test-node {
+			sub-test-property;
+		};
+	};
+};
+
+
diff --git a/test/overlay/test-fdt-overlay.dts b/test/overlay/test-fdt-overlay.dts
new file mode 100644
index 000000000000..d30ecdf3661c
--- /dev/null
+++ b/test/overlay/test-fdt-overlay.dts
@@ -0,0 +1,96 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	/* Test that we can change an int by another */
+	fragment@0 {
+		target = <&test>;
+
+		__overlay__ {
+			test-int-property = <43>;
+		};
+	};
+
+	/* Test that we can replace a string by a longer one */
+	fragment@1 {
+		target = <&test>;
+
+		__overlay__ {
+			test-str-property = "foobar";
+		};
+	};
+
+	/* Test that we add a new property */
+	fragment@2 {
+		target = <&test>;
+
+		__overlay__ {
+			test-str-property-2 = "foobar2";
+		};
+	};
+
+	/* Test that we add a new node (by phandle) */
+	fragment@3 {
+		target = <&test>;
+
+		__overlay__ {
+			new-node {
+				new-property;
+			};
+		};
+	};
+
+	/* Test that we add a new node (by path) */
+	fragment@4 {
+		target-path = "/";
+
+		__overlay__ {
+			new-node {
+				new-property;
+			};
+		};
+	};
+
+	fragment@5 {
+		target-path = "/";
+
+		__overlay__ {
+			local: new-local-node {
+				new-property;
+			};
+		};
+	};
+
+	fragment@6 {
+		target-path = "/";
+
+		__overlay__ {
+			test-phandle = <&test>, <&local>;
+		};
+	};
+
+	fragment@7 {
+		target-path = "/";
+
+		__overlay__ {
+			test-several-phandle = <&local>, <&local>;
+		};
+	};
+
+	fragment@8 {
+		target = <&test>;
+
+		__overlay__ {
+			sub-test-node {
+				new-sub-test-property;
+			};
+		};
+	};
+};
-- 
2.9.0
