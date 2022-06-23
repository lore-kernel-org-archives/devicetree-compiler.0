From: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Depend on .a instead of .so when building static
Date: Thu, 23 Jun 2022 15:44:44 +0300
Message-ID: <20220623124444.445049-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R02aDjhvcozSh8q9F91VWKd8eAJF2/Ga6rnShC8yC3s=;
        b=lxiKOMkfhcUX04TukTfeMmpepxfQe/B5PQR/mwARR49wz9oSkGfGcBjmZqev0YlBZZ
         KMXdVMalbfBHnIm6wqicVdG4stdsSNUuVdhyg4v5av1ls7NTYEfsOtCdwqSI28X5Svq1
         62RHLwO+zF2tQSuxpxmAMoHD5T1J0/mZ4jo2jkY1WSEkY/Ur9oJZVCsAGKtGyQ0WHkP9
         3AS+M0l3ZvYbXcpccMailPtnOK5ayA0YY2V8lPeIZ2Ua7xrYEiA7YVKCvOzTQ2Scqs49
         b5Vp7nIlIZxSQpmE3/fRNlVF8xfUmFK2tAh2SBRsRRw/KzUwHuSHSEWLRtTRIjGR5GfH
         uDrg==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

Static build needs to be indicated with an environment variable:
STATIC_BUILD=1

Checks are skipped on static builds as they contain dynamic
library tests.

Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
---
 Makefile             | 12 +++++++++---
 tests/Makefile.tests | 11 ++++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index ee77115..9f550b4 100644
--- a/Makefile
+++ b/Makefile
@@ -198,6 +198,12 @@ LIBFDT_lib = $(LIBFDT_dir)/$(LIBFDT_LIB)
 LIBFDT_include = $(addprefix $(LIBFDT_dir)/,$(LIBFDT_INCLUDES))
 LIBFDT_version = $(addprefix $(LIBFDT_dir)/,$(LIBFDT_VERSION))
 
+ifeq ($(STATIC_BUILD),1)
+	LIBFDT_dep = $(LIBFDT_archive)
+else
+	LIBFDT_dep = $(LIBFDT_lib)
+endif
+
 include $(LIBFDT_dir)/Makefile.libfdt
 
 .PHONY: libfdt
@@ -261,11 +267,11 @@ convert-dtsv0: $(CONVERT_OBJS)
 
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
index 2f78952..f13b16d 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -60,17 +60,17 @@ TESTS_CLEANDIRS = $(TESTS_CLEANDIRS_L:%=$(TESTS_PREFIX)%)
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
 
@@ -83,8 +83,13 @@ tests_clean:
 	rm -f $(TESTS_CLEANFILES)
 	rm -rf $(TESTS_CLEANDIRS)
 
+ifeq ($(STATIC_BUILD),1)
+check:
+	@echo Skipping checks for static build
+else
 check:	tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
 	cd $(TESTS_PREFIX); ./run_tests.sh
+endif
 
 ifeq ($(NO_VALGRIND),1)
 checkm:
-- 
2.33.3

