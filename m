From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 9/9] tests: Introduce DT overlay tests
Date: Fri, 27 May 2016 11:13:22 +0200
Message-ID: <1464340402-2249-10-git-send-email-maxime.ripard@free-electrons.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464340402-2249-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

This adds a bunch of unit tests for the "fdt apply" command.

They've all been run successfully in the sandbox. However, as you still
require an out-of-tree dtc with overlay support, this is disabled by
default.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 Makefile                          |   1 +
 include/test/overlay.h            |  16 ++++
 include/test/suites.h             |   1 +
 test/Kconfig                      |   1 +
 test/cmd_ut.c                     |   6 ++
 test/overlay/Kconfig              |  10 +++
 test/overlay/Makefile             |  15 ++++
 test/overlay/cmd_ut_overlay.c     | 176 ++++++++++++++++++++++++++++++++++++++
 test/overlay/test-fdt-base.dts    |  17 ++++
 test/overlay/test-fdt-overlay.dts |  60 +++++++++++++
 10 files changed, 303 insertions(+)
 create mode 100644 include/test/overlay.h
 create mode 100644 test/overlay/Kconfig
 create mode 100644 test/overlay/Makefile
 create mode 100644 test/overlay/cmd_ut_overlay.c
 create mode 100644 test/overlay/test-fdt-base.dts
 create mode 100644 test/overlay/test-fdt-overlay.dts

diff --git a/Makefile b/Makefile
index 954a865381af..71272501a75e 100644
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
index 000000000000..b8e01a934373
--- /dev/null
+++ b/test/overlay/Kconfig
@@ -0,0 +1,10 @@
+config UT_OVERLAY
+	bool "Enable Device Tree Overlays Unit Tests"
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
index 000000000000..3ff1d61b7e31
--- /dev/null
+++ b/test/overlay/cmd_ut_overlay.c
@@ -0,0 +1,176 @@
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
+static int fdt_getprop_u32(void *fdt, const char *path, const char *name,
+			   u32 *out)
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
+	if (!val || (len != sizeof(uint32_t)))
+		return -FDT_ERR_NOTFOUND;
+
+	*out = fdt32_to_cpu(*val);
+
+	return 0;
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
+int do_ut_overlay(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
+{
+	struct unit_test *tests = ll_entry_start(struct unit_test,
+						 overlay_test);
+	const int n_ents = ll_entry_count(struct unit_test, overlay_test);
+	struct unit_test_state *uts;
+	struct unit_test *test;
+	void *fdt_base = &__dtb_test_fdt_base_begin;
+	void *fdt_overlay = &__dtb_test_fdt_overlay_begin;
+	void *fdt_base_copy;
+
+	ut_assertok(fdt_check_header(fdt_base));
+	ut_assertok(fdt_check_header(fdt_overlay));
+
+	uts = calloc(1, sizeof(*uts));
+	if (!uts)
+		return -ENOMEM;
+
+	fdt_base_copy = malloc(FDT_COPY_SIZE);
+	if (!fdt_base_copy)
+		return -ENOMEM;
+	uts->priv = fdt_base_copy;
+
+	/*
+	 * Resize the FDT to 4k so that we have room to operate on
+	 *
+	 * (and relocate it since the memory might be mapped
+	 * read-only)
+	 */
+	ut_assertok(fdt_open_into(fdt_base, fdt_base_copy, FDT_COPY_SIZE));
+
+	/* Apply the overlay */
+	ut_assertok(fdt_overlay_apply(fdt_base_copy, fdt_overlay));
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
+	free(fdt_base_copy);
+	free(uts);
+
+	return uts->fail_count ? CMD_RET_FAILURE : 0;
+}
diff --git a/test/overlay/test-fdt-base.dts b/test/overlay/test-fdt-base.dts
new file mode 100644
index 000000000000..e8fa9bb5be82
--- /dev/null
+++ b/test/overlay/test-fdt-base.dts
@@ -0,0 +1,17 @@
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
+	};
+};
+
+
diff --git a/test/overlay/test-fdt-overlay.dts b/test/overlay/test-fdt-overlay.dts
new file mode 100644
index 000000000000..ca3abcff287c
--- /dev/null
+++ b/test/overlay/test-fdt-overlay.dts
@@ -0,0 +1,60 @@
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
+};
-- 
2.8.2
