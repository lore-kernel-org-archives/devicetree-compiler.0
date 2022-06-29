From: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] Allow static building with make
Date: Wed, 29 Jun 2022 19:35:31 +0300
Message-ID: <20220629163531.932281-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJ2XOAz80U8rLlC6GDn924lItdE3oGcCIzKLVmvPBIY=;
        b=FdLKUd/0KxwT2xbazDJu4uEwJIfzDasHzNlIpGTvCAnBGsY996w9PJU6tLb0A3g04S
         ZOZFM3hKioGlhCzmOQxWxm4d23HMBFnMpmGv4mIrCWpWuWoTSCb6nuQzufrDAQzpzPbq
         LWkeQdz/W48Axg1gaNQIL9nW16Ky/WDwl5EKt0CJEZTUhkm8Sc6cO5Pc76pSE/HXwDgv
         k5nHgfqTFfttxhC+Bj3ik3N89mt10cBwZ2eR4NHbDZnYR3l7N73RwIM8Rd49uiXpL6zH
         2ZzYf9OmOC/X13F8pyHJw/2rgVW5fnbyQ+RSq8wuTQSdFpigPCoRoBAAaXnlDbuL01qF
         XVOw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

Set STATIC_BUILD=1 environment variable to enable static building
when using makefiles.

Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
---
 Makefile             | 13 ++++++++++---
 tests/Makefile.tests | 12 +++++++-----
 tests/run_tests.sh   | 10 +++++++---
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index ee77115..9f1223f 100644
--- a/Makefile
+++ b/Makefile
@@ -198,6 +198,13 @@ LIBFDT_lib = $(LIBFDT_dir)/$(LIBFDT_LIB)
 LIBFDT_include = $(addprefix $(LIBFDT_dir)/,$(LIBFDT_INCLUDES))
 LIBFDT_version = $(addprefix $(LIBFDT_dir)/,$(LIBFDT_VERSION))
 
+ifeq ($(STATIC_BUILD),1)
+	CFLAGS += -static
+	LIBFDT_dep = $(LIBFDT_archive)
+else
+	LIBFDT_dep = $(LIBFDT_lib)
+endif
+
 include $(LIBFDT_dir)/Makefile.libfdt
 
 .PHONY: libfdt
@@ -261,11 +268,11 @@ convert-dtsv0: $(CONVERT_OBJS)
 
 fdtdump:	$(FDTDUMP_OBJS)
 
-fdtget:	$(FDTGET_OBJS) $(LIBFDT_lib)
+fdtget:	$(FDTGET_OBJS) $(LIBFDT_dep)
 
-fdtput:	$(FDTPUT_OBJS) $(LIBFDT_lib)
+fdtput:	$(FDTPUT_OBJS) $(LIBFDT_dep)
 
-fdtoverlay: $(FDTOVERLAY_OBJS) $(LIBFDT_lib)
+fdtoverlay: $(FDTOVERLAY_OBJS) $(LIBFDT_dep)
 
 dist:
 	git archive --format=tar --prefix=dtc-$(dtc_version)/ HEAD \
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 2f78952..2d36c5d 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -37,8 +37,10 @@ LIBTREE_TESTS_L = truncated_property truncated_string truncated_memrsv \
 
 LIBTREE_TESTS = $(LIBTREE_TESTS_L:%=$(TESTS_PREFIX)%)
 
-DL_LIB_TESTS_L = asm_tree_dump value-labels
-DL_LIB_TESTS = $(DL_LIB_TESTS_L:%=$(TESTS_PREFIX)%)
+ifneq ($(STATIC_BUILD),1)
+	DL_LIB_TESTS_L = asm_tree_dump value-labels
+	DL_LIB_TESTS = $(DL_LIB_TESTS_L:%=$(TESTS_PREFIX)%)
+endif
 
 TESTS = $(LIB_TESTS) $(LIBTREE_TESTS) $(DL_LIB_TESTS)
 
@@ -60,17 +62,17 @@ TESTS_CLEANDIRS = $(TESTS_CLEANDIRS_L:%=$(TESTS_PREFIX)%)
 .PHONY: tests
 tests:	$(TESTS) $(TESTS_TREES)
 
-$(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_lib)
+$(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_dep)
 
 # Not necessary on all platforms; allow -ldl to be excluded instead of forcing
 # other platforms to patch it out.
 LIBDL = -ldl
-$(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_lib)
+$(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_dep)
 	@$(VECHO) LD [libdl] $@
 	$(LINK.c) -o $@ $^ $(LIBDL)
 
 $(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o \
-		util.o $(LIBFDT_lib)
+		util.o $(LIBFDT_dep)
 
 $(TESTS_PREFIX)dumptrees: $(TESTS_PREFIX)trees.o
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 1b16eb8..0cabd13 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -607,11 +607,15 @@ dtc_tests () {
 	run_dtc_test -I dts -O asm -o oasm_$tree.test.s "$SRCDIR/$tree"
 	asm_to_so_test oasm_$tree
 	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree"
-	run_test asm_tree_dump ./oasm_$tree.test.so oasm_$tree.test.dtb
-	run_wrap_test cmp oasm_$tree.test.dtb $tree.test.dtb
+	if [ -x ./asm_tree_dump ]; then
+	    run_test asm_tree_dump ./oasm_$tree.test.so oasm_$tree.test.dtb
+	    run_wrap_test cmp oasm_$tree.test.dtb $tree.test.dtb
+	fi
     done
 
-    run_test value-labels ./oasm_value-labels.dts.test.so
+    if [ -x ./value-labels ]; then
+	run_test value-labels ./oasm_value-labels.dts.test.so
+    fi
 
     # Check -Odts mode preserve all dtb information
     for tree in test_tree1.dtb dtc_tree1.test.dtb dtc_escapes.test.dtb \
-- 
2.33.3

