From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v6 4/4] build-sys: replace makefiles to wrap meson/ninja
Date: Wed,  4 Nov 2020 23:45:27 +0400
Message-ID: <20201104194527.986901-5-marcandre.lureau@redhat.com>
References: <20201104194527.986901-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604519171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iYDfQ5P8fV27TfsramQ9MfNJtuUCrMrVhMcwMxSMRWA=;
        b=B8rvQ5Y1ndCcxvAkeMh2LTVQRRK2ptLf6hAp4uwTuZGurkcwka5bFbjL2xdy51PRW1ZjgR
        e3olklIbSc+pEsOlI02h7fjuH8LP+y6FXctgdZCzbV5OGGcwqoFtm9/WmMW3R8TOeBfp6D
        +us4KXcXyhjNHkQzWBft5gAViULYxRY=
In-Reply-To: <20201104194527.986901-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Makefile                   | 385 ++-----------------------------------
 Makefile.convert-dtsv0     |  14 --
 Makefile.dtc               |  23 ---
 Makefile.utils             |  31 ---
 README                     |  24 ++-
 libfdt/Makefile.libfdt     |  18 --
 pylibfdt/Makefile.pylibfdt |  30 ---
 tests/Makefile.tests       | 100 ----------
 tests/run_tests.sh         |  10 +-
 9 files changed, 39 insertions(+), 596 deletions(-)
 delete mode 100644 Makefile.convert-dtsv0
 delete mode 100644 Makefile.dtc
 delete mode 100644 Makefile.utils
 delete mode 100644 libfdt/Makefile.libfdt
 delete mode 100644 pylibfdt/Makefile.pylibfdt
 delete mode 100644 tests/Makefile.tests

diff --git a/Makefile b/Makefile
index c187d5f..cc3caa6 100644
--- a/Makefile
+++ b/Makefile
@@ -3,382 +3,19 @@
 # Device Tree Compiler
 #
 
-#
-# Version information will be constructed in this order:
-# EXTRAVERSION might be "-rc", for example.
-# LOCAL_VERSION is likely from command line.
-# CONFIG_LOCALVERSION from some future config system.
-#
-VERSION = 1
-PATCHLEVEL = 6
-SUBLEVEL = 0
-EXTRAVERSION =
-LOCAL_VERSION =
-CONFIG_LOCALVERSION =
-
-# Control the assumptions made (e.g. risking security issues) in the code.
-# See libfdt_internal.h for details
-ASSUME_MASK ?= 0
-
-CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
-WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
-	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
-CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
-
-BISON = bison
-LEX = flex
-SWIG = swig
-PKG_CONFIG ?= pkg-config
-PYTHON ?= python3
-
-INSTALL = /usr/bin/install
-INSTALL_PROGRAM = $(INSTALL)
-INSTALL_LIB = $(INSTALL)
-INSTALL_DATA = $(INSTALL) -m 644
-INSTALL_SCRIPT = $(INSTALL)
-DESTDIR =
-PREFIX = $(HOME)
-BINDIR = $(PREFIX)/bin
-LIBDIR = $(PREFIX)/lib
-INCLUDEDIR = $(PREFIX)/include
-
-HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
-	    sed -e 's/\(cygwin\|msys\).*/\1/')
-
-NO_PYTHON ?= 0
-
-NO_VALGRIND := $(shell $(PKG_CONFIG) --exists valgrind; echo $$?)
-ifeq ($(NO_VALGRIND),1)
-	CPPFLAGS += -DNO_VALGRIND
-else
-	CFLAGS += $(shell $(PKG_CONFIG) --cflags valgrind)
-endif
-
-NO_YAML := $(shell $(PKG_CONFIG) --exists yaml-0.1; echo $$?)
-ifeq ($(NO_YAML),1)
-	CFLAGS += -DNO_YAML
-else
-	LDLIBS_dtc += $(shell $(PKG_CONFIG) --libs yaml-0.1)
-	CFLAGS += $(shell $(PKG_CONFIG) --cflags yaml-0.1)
-endif
-
-ifeq ($(HOSTOS),darwin)
-SHAREDLIB_EXT     = dylib
-SHAREDLIB_CFLAGS  = -fPIC
-SHAREDLIB_LDFLAGS = -fPIC -dynamiclib -Wl,-install_name -Wl,
-else ifeq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin))
-SHAREDLIB_EXT     = so
-SHAREDLIB_CFLAGS  =
-SHAREDLIB_LDFLAGS = -shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
-else
-SHAREDLIB_EXT     = so
-SHAREDLIB_CFLAGS  = -fPIC
-SHAREDLIB_LDFLAGS = -fPIC -shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
-endif
-
-#
-# Overall rules
-#
-ifdef V
-VECHO = :
-else
-VECHO = echo "	"
-ARFLAGS = rc
-.SILENT:
-endif
-
-NODEPTARGETS = clean
-ifeq ($(MAKECMDGOALS),)
-DEPTARGETS = all
-else
-DEPTARGETS = $(filter-out $(NODEPTARGETS),$(MAKECMDGOALS))
-endif
-
-#
-# Rules for versioning
-#
-
-DTC_VERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-VERSION_FILE = version_gen.h
-
-CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
-	  else if [ -x /bin/bash ]; then echo /bin/bash; \
-	  else echo sh; fi ; fi)
-
-nullstring :=
-space	:= $(nullstring) # end of line
-
-localver_config = $(subst $(space),, $(string) \
-			      $(patsubst "%",%,$(CONFIG_LOCALVERSION)))
-
-localver_cmd = $(subst $(space),, $(string) \
-			      $(patsubst "%",%,$(LOCALVERSION)))
-
-localver_scm = $(shell $(CONFIG_SHELL) ./scripts/setlocalversion)
-localver_full  = $(localver_config)$(localver_cmd)$(localver_scm)
-
-dtc_version = $(DTC_VERSION)$(localver_full)
-
-# Contents of the generated version file.
-define filechk_version
-	(echo "#define DTC_VERSION \"DTC $(dtc_version)\""; )
-endef
-
-define filechk
-	set -e;					\
-	echo '	CHK $@';			\
-	mkdir -p $(dir $@);			\
-	$(filechk_$(1)) < $< > $@.tmp;		\
-	if [ -r $@ ] && cmp -s $@ $@.tmp; then	\
-		rm -f $@.tmp;			\
-	else					\
-		echo '	UPD $@';		\
-		mv -f $@.tmp $@;		\
-	fi;
-endef
-
-
-include Makefile.convert-dtsv0
-include Makefile.dtc
-include Makefile.utils
-
-BIN += convert-dtsv0
-BIN += dtc
-BIN += fdtdump
-BIN += fdtget
-BIN += fdtput
-BIN += fdtoverlay
-
-SCRIPTS = dtdiff
-
-all: $(BIN) libfdt
-
-# We need both Python and swig to build/install pylibfdt.
-# This builds the given make ${target} if those deps are found.
-check_python_deps = \
-	if $(PKG_CONFIG) --cflags $(PYTHON) >/dev/null 2>&1; then \
-		if which swig >/dev/null 2>&1; then \
-			can_build=yes; \
-		fi; \
-	fi; \
-	if [ "$${can_build}" = "yes" ]; then \
-		$(MAKE) $${target}; \
-	else \
-		echo "\#\# Skipping pylibfdt (install python dev and swig to build)"; \
-	fi ;
-
-.PHONY: maybe_pylibfdt
-maybe_pylibfdt: FORCE
-	target=pylibfdt; $(check_python_deps)
-
-ifeq ($(NO_PYTHON),0)
-all: maybe_pylibfdt
-endif
-
-
-ifneq ($(DEPTARGETS),)
-ifneq ($(MAKECMDGOALS),libfdt)
--include $(DTC_OBJS:%.o=%.d)
--include $(CONVERT_OBJS:%.o=%.d)
--include $(FDTDUMP_OBJS:%.o=%.d)
--include $(FDTGET_OBJS:%.o=%.d)
--include $(FDTPUT_OBJS:%.o=%.d)
--include $(FDTOVERLAY_OBJS:%.o=%.d)
-endif
-endif
-
-
-
-#
-# Rules for libfdt
-#
-LIBFDT_dir = libfdt
-LIBFDT_archive = $(LIBFDT_dir)/libfdt.a
-LIBFDT_lib = $(LIBFDT_dir)/$(LIBFDT_LIB)
-LIBFDT_include = $(addprefix $(LIBFDT_dir)/,$(LIBFDT_INCLUDES))
-LIBFDT_version = $(addprefix $(LIBFDT_dir)/,$(LIBFDT_VERSION))
-
-include $(LIBFDT_dir)/Makefile.libfdt
-
-.PHONY: libfdt
-libfdt: $(LIBFDT_archive) $(LIBFDT_lib)
-
-$(LIBFDT_archive): $(addprefix $(LIBFDT_dir)/,$(LIBFDT_OBJS))
-
-$(LIBFDT_lib): $(addprefix $(LIBFDT_dir)/,$(LIBFDT_OBJS)) $(LIBFDT_version)
-	@$(VECHO) LD $@
-	$(CC) $(LDFLAGS) $(SHAREDLIB_LDFLAGS)$(LIBFDT_soname) -o $(LIBFDT_lib) \
-		$(addprefix $(LIBFDT_dir)/,$(LIBFDT_OBJS))
-	ln -sf $(LIBFDT_LIB) $(LIBFDT_dir)/$(LIBFDT_soname)
-
-ifneq ($(DEPTARGETS),)
--include $(LIBFDT_OBJS:%.o=$(LIBFDT_dir)/%.d)
-endif
-
-# This stops make from generating the lex and bison output during
-# auto-dependency computation, but throwing them away as an
-# intermediate target and building them again "for real"
-.SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
-
-install-bin: all $(SCRIPTS)
-	@$(VECHO) INSTALL-BIN
-	$(INSTALL) -d $(DESTDIR)$(BINDIR)
-	$(INSTALL_PROGRAM) $(BIN) $(DESTDIR)$(BINDIR)
-	$(INSTALL_SCRIPT) $(SCRIPTS) $(DESTDIR)$(BINDIR)
-
-install-lib: all
-	@$(VECHO) INSTALL-LIB
-	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
-	$(INSTALL_LIB) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
-	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
-	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
-	$(INSTALL_DATA) $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
-
-install-includes:
-	@$(VECHO) INSTALL-INC
-	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
-	$(INSTALL_DATA) $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
-
-install: install-bin install-lib install-includes
-
-.PHONY: maybe_install_pylibfdt
-maybe_install_pylibfdt: FORCE
-	target=install_pylibfdt; $(check_python_deps)
-
-ifeq ($(NO_PYTHON),0)
-install: maybe_install_pylibfdt
-endif
-
-$(VERSION_FILE): Makefile FORCE
-	$(call filechk,version)
-
-
-dtc: $(DTC_OBJS)
-
-convert-dtsv0: $(CONVERT_OBJS)
-	@$(VECHO) LD $@
-	$(LINK.c) -o $@ $^
-
-fdtdump:	$(FDTDUMP_OBJS)
-
-fdtget:	$(FDTGET_OBJS) $(LIBFDT_lib)
-
-fdtput:	$(FDTPUT_OBJS) $(LIBFDT_lib)
-
-fdtoverlay: $(FDTOVERLAY_OBJS) $(LIBFDT_lib)
-
-dist:
-	git archive --format=tar --prefix=dtc-$(dtc_version)/ HEAD \
-		> ../dtc-$(dtc_version).tar
-	cat ../dtc-$(dtc_version).tar | \
-		gzip -9 > ../dtc-$(dtc_version).tar.gz
-
-
-#
-# Rules for pylibfdt
-#
-PYLIBFDT_dir = pylibfdt
-
-include $(PYLIBFDT_dir)/Makefile.pylibfdt
-
-.PHONY: pylibfdt
-pylibfdt: $(PYLIBFDT_dir)/_libfdt.so
-
-#
-# Release signing and uploading
-# This is for maintainer convenience, don't try this at home.
-#
-ifeq ($(MAINTAINER),y)
-GPG = gpg2
-KUP = kup
-KUPDIR = /pub/software/utils/dtc
-
-kup: dist
-	$(GPG) --detach-sign --armor -o ../dtc-$(dtc_version).tar.sign \
-		../dtc-$(dtc_version).tar
-	$(KUP) put ../dtc-$(dtc_version).tar.gz ../dtc-$(dtc_version).tar.sign \
-		$(KUPDIR)/dtc-$(dtc_version).tar.gz
-endif
-
-tags: FORCE
-	rm -f tags
-	find . \( -name tests -type d -prune \) -o \
-	       \( ! -name '*.tab.[ch]' ! -name '*.lex.c' \
-	       -name '*.[chly]' -type f -print \) | xargs ctags -a
-
-#
-# Testsuite rules
-#
-TESTS_PREFIX=tests/
-
-TESTS_BIN += dtc
-TESTS_BIN += convert-dtsv0
-TESTS_BIN += fdtput
-TESTS_BIN += fdtget
-TESTS_BIN += fdtdump
-TESTS_BIN += fdtoverlay
-ifeq ($(NO_PYTHON),0)
-TESTS_PYLIBFDT += maybe_pylibfdt
-endif
-
-ifneq ($(MAKECMDGOALS),libfdt)
-include tests/Makefile.tests
-endif
-
-#
-# Clean rules
-#
-STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
-	*.tab.[ch] *.lex.c *.output
-
-clean: libfdt_clean pylibfdt_clean tests_clean
-	@$(VECHO) CLEAN
-	rm -f $(STD_CLEANFILES)
-	rm -f $(VERSION_FILE)
-	rm -f $(BIN)
-	rm -f dtc-*.tar dtc-*.tar.sign dtc-*.tar.asc
-
-#
-# Generic compile rules
-#
-%: %.o
-	@$(VECHO) LD $@
-	$(LINK.c) -o $@ $^ $(LDLIBS_$*)
-
-%.o: %.c
-	@$(VECHO) CC $@
-	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<
-
-%.o: %.S
-	@$(VECHO) AS $@
-	$(CC) $(CPPFLAGS) $(AFLAGS) -D__ASSEMBLY__ -o $@ -c $<
-
-%.d: %.c
-	@$(VECHO) DEP $<
-	$(CC) $(CPPFLAGS) $(CFLAGS) -MM -MG -MT "$*.o $@" $< > $@
-
-%.d: %.S
-	@$(VECHO) DEP $<
-	$(CC) $(CPPFLAGS) -MM -MG -MT "$*.o $@" $< > $@
-
-%.i:	%.c
-	@$(VECHO) CPP $@
-	$(CC) $(CPPFLAGS) -E $< > $@
+BUILD_DIR=build
 
-%.s:	%.c
-	@$(VECHO) CC -S $@
-	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -S $<
+all: $(BUILD_DIR)/build.ninja
+	ninja -C build
 
-%.a:
-	@$(VECHO) AR $@
-	$(AR) $(ARFLAGS) $@ $^
+$(BUILD_DIR)/build.ninja:
+	meson $(BUILD_DIR)
 
-%.lex.c: %.l
-	@$(VECHO) LEX $@
-	$(LEX) -o$@ $<
+check:
+	meson test -C $(BUILD_DIR) -v
 
-%.tab.c %.tab.h %.output: %.y
-	@$(VECHO) BISON $@
-	$(BISON) -b $(basename $(basename $@)) -d $<
+checkm:
+	WITH_VALGRIND=1 meson test -C $(BUILD_DIR) -v
 
-FORCE:
+%::
+	ninja -C $(BUILD_DIR) $@
diff --git a/Makefile.convert-dtsv0 b/Makefile.convert-dtsv0
deleted file mode 100644
index c12ed40..0000000
--- a/Makefile.convert-dtsv0
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-#
-# This is not a complete Makefile of itself.
-# Instead, it is designed to be easily embeddable
-# into other systems of Makefiles.
-#
-
-CONVERT_SRCS = \
-	srcpos.c \
-	util.c
-
-CONVERT_GEN_SRCS = convert-dtsv0-lexer.lex.c
-
-CONVERT_OBJS = $(CONVERT_SRCS:%.c=%.o) $(CONVERT_GEN_SRCS:%.c=%.o)
diff --git a/Makefile.dtc b/Makefile.dtc
deleted file mode 100644
index 9c467b0..0000000
--- a/Makefile.dtc
+++ /dev/null
@@ -1,23 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# Makefile.dtc
-#
-# This is not a complete Makefile of itself.  Instead, it is designed to
-# be easily embeddable into other systems of Makefiles.
-#
-DTC_SRCS = \
-	checks.c \
-	data.c \
-	dtc.c \
-	flattree.c \
-	fstree.c \
-	livetree.c \
-	srcpos.c \
-	treesource.c \
-	util.c
-
-ifneq ($(NO_YAML),1)
-DTC_SRCS += yamltree.c
-endif
-
-DTC_GEN_SRCS = dtc-lexer.lex.c dtc-parser.tab.c
-DTC_OBJS = $(DTC_SRCS:%.c=%.o) $(DTC_GEN_SRCS:%.c=%.o)
diff --git a/Makefile.utils b/Makefile.utils
deleted file mode 100644
index 9436b34..0000000
--- a/Makefile.utils
+++ /dev/null
@@ -1,31 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-#
-# This is not a complete Makefile of itself.  Instead, it is designed to
-# be easily embeddable into other systems of Makefiles.
-#
-
-FDTDUMP_SRCS = \
-	fdtdump.c \
-	util.c
-
-FDTDUMP_OBJS = $(FDTDUMP_SRCS:%.c=%.o)
-
-
-FDTGET_SRCS = \
-	fdtget.c \
-	util.c
-
-FDTGET_OBJS = $(FDTGET_SRCS:%.c=%.o)
-
-
-FDTPUT_SRCS = \
-	fdtput.c \
-	util.c
-
-FDTPUT_OBJS = $(FDTPUT_SRCS:%.c=%.o)
-
-FDTOVERLAY_SRCS = \
-	fdtoverlay.c \
-	util.c
-
-FDTOVERLAY_OBJS = $(FDTOVERLAY_SRCS:%.c=%.o)
diff --git a/README b/README
index 9465ee5..68a06f6 100644
--- a/README
+++ b/README
@@ -7,6 +7,21 @@ DTC and LIBFDT are maintained by:
 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
 Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
 
+Building
+--------
+
+This project is built with meson. See the manual for detailed usages:
+https://mesonbuild.com/Running-Meson.html
+
+In short, from the source directory, you can configure, build and test the
+project with those commands:
+$ meson builddir
+$ ninja -C builddir
+$ ninja -C builddir test
+
+For convenience, a Makefile wraps meson for you with the regular "make", "make
+check" and "make install" targets. Although further build tweaking will require
+you to invoke meson manually.
 
 Python library
 --------------
@@ -58,13 +73,12 @@ also install via the Makefile if you like, but the above is more common.
 
 To install both libfdt and pylibfdt you can use:
 
-    make install [SETUP_PREFIX=/path/to/install_dir] \
-            [PREFIX=/path/to/install_dir]
+    meson -C builddir install
 
 To disable building the python library, even if swig and Python are available,
 use:
 
-    make NO_PYTHON=1
+    meson configure builddir -Dpython=disabled
 
 
 More work remains to support all of libfdt, including access to numeric
@@ -74,8 +88,8 @@ values.
 Tests
 -----
 
-Test files are kept in the tests/ directory. Use 'make check' to build and run
-all tests.
+Test files are kept in the tests/ directory. Use 'ninja test' to build and run
+all tests (or 'make check' in the source directory).
 
 If you want to adjust a test file, be aware that tree_tree1.dts is compiled
 and checked against a binary tree from assembler macros in trees.S. So
diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
deleted file mode 100644
index b6d8fc0..0000000
--- a/libfdt/Makefile.libfdt
+++ /dev/null
@@ -1,18 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
-# Makefile.libfdt
-#
-# This is not a complete Makefile of itself.  Instead, it is designed to
-# be easily embeddable into other systems of Makefiles.
-#
-LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
-LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
-LIBFDT_VERSION = version.lds
-LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c \
-	fdt_addresses.c fdt_overlay.c fdt_check.c
-LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
-LIBFDT_LIB = libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT)
-
-libfdt_clean:
-	@$(VECHO) CLEAN "(libfdt)"
-	rm -f $(STD_CLEANFILES:%=$(LIBFDT_dir)/%)
-	rm -f $(LIBFDT_dir)/$(LIBFDT_soname)
diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
deleted file mode 100644
index 1b5f236..0000000
--- a/pylibfdt/Makefile.pylibfdt
+++ /dev/null
@@ -1,30 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
-# Makefile.pylibfdt
-#
-
-PYLIBFDT_srcs = $(PYLIBFDT_dir)/libfdt.i
-PYMODULE = $(PYLIBFDT_dir)/_libfdt.so
-PYLIBFDT_CLEANFILES_L = libfdt_wrap.c libfdt.py *.pyc *.so
-PYLIBFDT_CLEANFILES = $(PYLIBFDT_CLEANFILES_L:%=$(PYLIBFDT_dir)/%)
-PYLIBFDT_CLEANDIRS_L = build __pycache__
-PYLIBFDT_CLEANDIRS = $(PYLIBFDT_CLEANDIRS_L:%=$(PYLIBFDT_dir)/%)
-
-SETUP = $(PYLIBFDT_dir)/setup.py
-SETUPFLAGS = --top-builddir .
-
-ifndef V
-SETUPFLAGS += --quiet
-endif
-
-$(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP) $(VERSION_FILE)
-	@$(VECHO) PYMOD $@
-	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=$(PYLIBFDT_dir)
-
-install_pylibfdt: $(PYMODULE)
-	@$(VECHO) INSTALL-PYLIB
-	$(PYTHON) $(SETUP) $(SETUPFLAGS) install --prefix=$(PREFIX)
-
-pylibfdt_clean:
-	@$(VECHO) CLEAN "(pylibfdt)"
-	rm -f $(PYLIBFDT_CLEANFILES)
-	rm -rf $(PYLIBFDT_CLEANDIRS)
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
deleted file mode 100644
index cb66c9f..0000000
--- a/tests/Makefile.tests
+++ /dev/null
@@ -1,100 +0,0 @@
-LIB_TESTS_L = get_mem_rsv \
-	root_node find_property subnode_offset path_offset \
-	get_name getprop get_prop_offset get_phandle \
-	get_path supernode_atdepth_offset parent_offset \
-	node_offset_by_prop_value node_offset_by_phandle \
-	node_check_compatible node_offset_by_compatible \
-	get_alias \
-	char_literal \
-	sized_cells \
-	notfound \
-	addr_size_cells \
-	addr_size_cells2 \
-	appendprop_addrrange \
-	stringlist \
-	setprop_inplace nop_property nop_node \
-	sw_tree1 sw_states \
-	move_and_save mangle-layout nopulate \
-	open_pack rw_tree1 rw_oom set_name setprop del_property del_node \
-	appendprop1 appendprop2 propname_escapes \
-	string_escapes references path-references phandle_format \
-	boot-cpuid incbin \
-	extra-terminating-null \
-	dtbs_equal_ordered \
-	dtb_reverse dtbs_equal_unordered \
-	add_subnode_with_nops path_offset_aliases \
-	utilfdt_test \
-	integer-expressions \
-	property_iterate \
-	subnode_iterate \
-	overlay overlay_bad_fixup \
-	check_path check_header check_full \
-	fs_tree1
-LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
-
-LIBTREE_TESTS_L = truncated_property truncated_string truncated_memrsv
-LIBTREE_TESTS = $(LIBTREE_TESTS_L:%=$(TESTS_PREFIX)%)
-
-DL_LIB_TESTS_L = asm_tree_dump value-labels
-DL_LIB_TESTS = $(DL_LIB_TESTS_L:%=$(TESTS_PREFIX)%)
-
-TESTS = $(LIB_TESTS) $(LIBTREE_TESTS) $(DL_LIB_TESTS)
-
-TESTS_TREES_L = test_tree1.dtb
-TESTS_TREES = $(TESTS_TREES_L:%=$(TESTS_PREFIX)%)
-
-TESTS_TARGETS = $(TESTS) $(TESTS_TREES)
-
-TESTS_DEPFILES = $(TESTS:%=%.d) \
-	$(addprefix $(TESTS_PREFIX),testutils.d trees.d dumptrees.d)
-
-TESTS_CLEANFILES_L = $(STD_CLEANFILES) \
-	*.dtb *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
-	dumptrees
-TESTS_CLEANFILES = $(TESTS) $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
-TESTS_CLEANDIRS_L = fs
-TESTS_CLEANDIRS = $(TESTS_CLEANDIRS_L:%=$(TESTS_PREFIX)%)
-
-.PHONY: tests
-tests:	$(TESTS) $(TESTS_TREES)
-
-$(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_lib)
-
-# Not necessary on all platforms; allow -ldl to be excluded instead of forcing
-# other platforms to patch it out.
-LIBDL = -ldl
-$(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_lib)
-	@$(VECHO) LD [libdl] $@
-	$(LINK.c) -o $@ $^ $(LIBDL)
-
-$(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o \
-		util.o $(LIBFDT_lib)
-
-$(TESTS_PREFIX)dumptrees: $(TESTS_PREFIX)trees.o
-
-$(TESTS_TREES): $(TESTS_PREFIX)dumptrees
-	@$(VECHO) DUMPTREES
-	cd $(TESTS_PREFIX); ./dumptrees . >/dev/null
-
-tests_clean:
-	@$(VECHO) CLEAN "(tests)"
-	rm -f $(TESTS_CLEANFILES)
-	rm -rf $(TESTS_CLEANDIRS)
-
-check:	tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
-	cd $(TESTS_PREFIX); ./run_tests.sh
-
-ifeq ($(NO_VALGRIND),1)
-checkm:
-	@echo "make checkm requires valgrind, but NO_VALGRIND=1"
-else
-checkm: tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
-	cd $(TESTS_PREFIX); ./run_tests.sh -m
-endif
-
-checkv:	tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
-	cd $(TESTS_PREFIX); ./run_tests.sh -v
-
-ifneq ($(DEPTARGETS),)
--include $(TESTS_DEPFILES)
-endif
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 294585b..535f6e0 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1027,6 +1027,10 @@ pylibfdt_tests () {
     tot_tests=$((tot_tests + $total_tests))
 }
 
+setup_valgrind () {
+    VALGRIND="valgrind --tool=memcheck -q --error-exitcode=$VGCODE"
+}
+
 while getopts "vt:me" ARG ; do
     case $ARG in
 	"v")
@@ -1036,7 +1040,7 @@ while getopts "vt:me" ARG ; do
 	    TESTSETS=$OPTARG
 	    ;;
 	"m")
-	    VALGRIND="valgrind --tool=memcheck -q --error-exitcode=$VGCODE"
+	    setup_valgrind
 	    ;;
 	"e")
 	    STOP_ON_FAIL=1
@@ -1044,6 +1048,10 @@ while getopts "vt:me" ARG ; do
     esac
 done
 
+if [ -n "$WITH_VALGRIND" ]; then
+    setup_valgrind
+fi
+
 if [ -z "$TESTSETS" ]; then
     TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdtoverlay"
 
-- 
2.29.0

