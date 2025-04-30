Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86741ADC98
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026773; cv=none; b=iTygHTedk6TC/uTgWbkA+Gn4SfGtkSmb3hWwj4frDhyCPG+NVqnLcfsY2xTKHe6MKTdu59+gdkhQnK15N2aKn2SATxa7hiJSxvj1WPxCrEvTF7N+C+RKFMfbHszXI104I8VVpNLm0qsnjSuqqGKS6+0DSdrZ6dI2YFn90riQtRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026773; c=relaxed/simple;
	bh=8yuyXXn1l1lOJmTNNsJz/JDsTYIqZFjL0EO+fXIqkPw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvJlJ5Sz1sbGrY1heMXtij08yitlFTGzKxi00xp4Tc6BWpJeyv01KPd/gVc3T6Ktq1UGZoNBBvRqJf4oP9gpnvlIzgiiiuPEVRad9hpm92JzKDrlxQPGRS+gZucOk4T6OqVOSLZ8hrdu899aDYXQV6babKjhYuMnTp3QDoTAx08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixykHr2G; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixykHr2G"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4772f48f516so12713061cf.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026770; x=1746631570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qyollscvOE2Nu0R890e/UkFq53YP06/iWYyk9CKYKE=;
        b=ixykHr2GUhsiQZyR2LeihAZGa30nO8U2sfXWwTqGmJT94rmGwBRva18tKcosMOLv8I
         J/CY2b5Q/NJjZtPkJrMxr1hQFrHKNWXB+JywUb636DiPB7j/PKf6XcuaDYv1Vhg64PU0
         QVMZkbjNQXi+77MXAg/WvIwl1XTWAhlloyNjRrLKVbKSQZEg6F6mwqqBAQHDRNkrKUsO
         FdFFh/SdId5DD3xyOs/JPHWKO7kAb2pWqRkWdYDWp0AE5T2g3TwEkYRHRdQogIA0n7jQ
         7AejNPXsYr58WpwYQ9Tl/i4zuvXXykM84BbaqzBW0j/bnCRm+kCvoVoo9C0PtAOtTjfv
         9zcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026770; x=1746631570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qyollscvOE2Nu0R890e/UkFq53YP06/iWYyk9CKYKE=;
        b=UwSqUNBdv1wkSEHodDIdTKoSoX9UUP2uvIMssEUqpMxzBgO/zpOcWorle7520/Tz9I
         ny1Gm3oV/J/XPghiDMLESUMZjouH8ImuAEusC2pTZGeUJFIBjpZmJuKpYoBNj3wX+OnM
         w8ntkmq2XelFlvKPL7XkhfNROD7lDoMi3bDhhFnwiQL62UbcPFWY1zLZFZRGrsRsnMK9
         3/kys0DB+m22PXHijEVAjCRZlFK7nw++McI18Uq1P0wtUA5bmeqwZWcOE8Su0wO5WHpC
         ihxoecB/kEQh+RAzSv8OryBcyaRY38CAfGTrXi4WneZFXP+YbJJRRmicOHRCNBGAAfpy
         uqZw==
X-Gm-Message-State: AOJu0Yw7SMKA7nOKAJUgnFbngi/RYFHFGnyMD73CwIbDHKjUNlk6Wwkd
	iYobVgOdASp/Isi0WaFwaQJ+l4P8/iw93/LjYaQwGHsQyC1dMU7WVMAabQ==
X-Gm-Gg: ASbGncvXIzzzpY7gN71dOGxnJOZTPpTtvEy05vZv7IwMQBmE/WSMzrW+lvnZlOsM7lL
	T9qGb3bAk/uiW5yQUmFlU/SlaLgxXEOet6mC+VA+Q136mPzaO6cI5sMbHTAsLfGjs7Mx08qlp9o
	udfavnmx0WUErZsPxQW3q8utDRBu9eUF6SRzyMArY8L60NBbElRdAyi8WZJ7XeQFMkjNVzNHD8B
	PznaIweqjyqoTN04rDwNrlxROj3r/huFlFzPqSJ7trPD8F2xkCism7IrPTjy73yt68GsXB3/EE9
	8bxVI5BOGd9tnXz6ht26UfUsJ++qi4yi2KS7og==
X-Google-Smtp-Source: AGHT+IHJiY/PLCppm4vnHmXgmh0ER4OzG9yX76E4ephVSfbjYHmviynAsurMaZe4kJepgFd1RZhRnA==
X-Received: by 2002:a05:6214:5190:b0:6f0:e2d3:d812 with SMTP id 6a1803df08f44-6f4fdd60be5mr49792056d6.18.1746026770223;
        Wed, 30 Apr 2025 08:26:10 -0700 (PDT)
Received: from acleverhostname.lan ([2603:6011:3f0:6f00::12ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe85d881sm9228086d6.105.2025.04.30.08.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:26:09 -0700 (PDT)
From: Eli Schwartz <eschwartz93@gmail.com>
X-Google-Original-From: Eli Schwartz <eschwartz@gentoo.org>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH v3 2/2] meson: port python bindings to build natively via meson and meson-python
Date: Wed, 30 Apr 2025 11:25:26 -0400
Message-ID: <20250430152601.43554-3-eschwartz@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430152601.43554-1-eschwartz@gentoo.org>
References: <aBI_wad4TnNRCTWA@zatzit>
 <20250430152601.43554-1-eschwartz@gentoo.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We get full build parallelism and fewer confusing ancient distutils
paths. The python wheels build fully standalone, including linking
libfdt as a static library.

For convenience, when running pip install a meson option is passed that
prevents building tools or installing headers/pkgconfig files.
meson-python would otherwise include them in the wheel itself, in case
they are needed, but this is essentially a bit useless so don't bother.

The old setuptools-based build is now redundant and goes away.

Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
---
 MANIFEST.in                | 12 -----
 Makefile                   | 49 +------------------
 libfdt/meson.build         | 32 +++++++------
 meson.build                |  3 +-
 meson_options.txt          |  2 +
 pylibfdt/Makefile.pylibfdt | 30 ------------
 pylibfdt/meson.build       | 28 +++++++----
 pyproject.toml             | 33 +++++++++++++
 setup.py                   | 97 --------------------------------------
 9 files changed, 73 insertions(+), 213 deletions(-)
 delete mode 100644 MANIFEST.in
 delete mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pyproject.toml
 delete mode 100755 setup.py

diff --git a/MANIFEST.in b/MANIFEST.in
deleted file mode 100644
index 904d124..0000000
--- a/MANIFEST.in
+++ /dev/null
@@ -1,12 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
-
-global-exclude *
-include README.md
-include GPL
-include BSD-2-Clause
-include setup.py
-include pylibfdt/libfdt.i
-include libfdt/libfdt.h
-include libfdt/fdt.h
-include libfdt/libfdt_env.h
-include VERSION.txt
diff --git a/Makefile b/Makefile
index 6ab5f97..b1815c3 100644
--- a/Makefile
+++ b/Makefile
@@ -31,7 +31,6 @@ BISON = bison
 LEX = flex
 SWIG = swig
 PKG_CONFIG ?= pkg-config
-PYTHON ?= python3
 
 INSTALL = install
 INSTALL_PROGRAM = $(INSTALL)
@@ -47,8 +46,6 @@ INCLUDEDIR = $(PREFIX)/include
 HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
 	    sed -e 's/\(cygwin\|msys\).*/\1/')
 
-NO_PYTHON ?= 0
-
 NO_VALGRIND := $(shell $(PKG_CONFIG) --exists valgrind; echo $$?)
 ifeq ($(NO_VALGRIND),1)
 	CPPFLAGS += -DNO_VALGRIND
@@ -158,29 +155,6 @@ SCRIPTS = dtdiff
 
 all: $(BIN) libfdt
 
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
 ifneq ($(DEPTARGETS),)
 ifneq ($(MAKECMDGOALS),libfdt)
 -include $(DTC_OBJS:%.o=%.d)
@@ -254,14 +228,6 @@ install-includes:
 
 install: install-bin install-lib install-includes
 
-.PHONY: maybe_install_pylibfdt
-maybe_install_pylibfdt: FORCE
-	target=install_pylibfdt; $(check_python_deps)
-
-ifeq ($(NO_PYTHON),0)
-install: maybe_install_pylibfdt
-endif
-
 $(VERSION_FILE): Makefile FORCE
 	$(call filechk,version)
 
@@ -287,16 +253,6 @@ dist:
 		gzip -9 > ../dtc-$(dtc_version).tar.gz
 
 
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
 #
 # Release signing and uploading
 # This is for maintainer convenience, don't try this at home.
@@ -330,9 +286,6 @@ TESTS_BIN += fdtput
 TESTS_BIN += fdtget
 TESTS_BIN += fdtdump
 TESTS_BIN += fdtoverlay
-ifeq ($(NO_PYTHON),0)
-TESTS_PYLIBFDT += maybe_pylibfdt
-endif
 
 ifneq ($(MAKECMDGOALS),libfdt)
 include tests/Makefile.tests
@@ -344,7 +297,7 @@ endif
 STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
 	*.tab.[ch] *.lex.c *.output
 
-clean: libfdt_clean pylibfdt_clean tests_clean
+clean: libfdt_clean tests_clean
 	@$(VECHO) CLEAN
 	rm -f $(STD_CLEANFILES)
 	rm -f $(VERSION_FILE)
diff --git a/libfdt/meson.build b/libfdt/meson.build
index c2f4bd6..9c6ef54 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -31,7 +31,7 @@ libfdt = library(
   version: meson.project_version(),
   link_args: link_args,
   link_depends: 'version.lds',
-  install: true,
+  install: get_option('default_library') != 'static' or not wheel_only,
 )
 
 libfdt_inc = include_directories('.')
@@ -41,20 +41,22 @@ libfdt_dep = declare_dependency(
   link_with: libfdt,
 )
 
-install_headers(
-  files(
-    'fdt.h',
-    'libfdt.h',
-    'libfdt_env.h',
+if not wheel_only
+  install_headers(
+    files(
+      'fdt.h',
+      'libfdt.h',
+      'libfdt_env.h',
+    )
   )
-)
 
-pkgconfig = import('pkgconfig')
+  pkgconfig = import('pkgconfig')
 
-pkgconfig.generate(
-  libraries: libfdt,
-  version: meson.project_version(),
-  filebase: 'libfdt',
-  name: 'libfdt',
-  description: 'Flat Device Tree manipulation',
-)
+  pkgconfig.generate(
+    libraries: libfdt,
+    version: meson.project_version(),
+    filebase: 'libfdt',
+    name: 'libfdt',
+    description: 'Flat Device Tree manipulation',
+  )
+endif
diff --git a/meson.build b/meson.build
index 3026f88..ed4a39d 100644
--- a/meson.build
+++ b/meson.build
@@ -43,6 +43,7 @@ py = import('python')
 py = py.find_installation(required: get_option('python'))
 swig = find_program('swig', required: get_option('python'))
 pylibfdt_enabled = not meson.is_cross_build() and py.found() and swig.found() ? true : false
+wheel_only = get_option('wheel-only')
 
 version_gen_h = vcs_tag(
   command: ['git', 'describe', '--dirty=+'],
@@ -59,7 +60,7 @@ util_dep = declare_dependency(
   dependencies: libfdt_dep
 )
 
-if get_option('tools')
+if get_option('tools') and not wheel_only
   flex = find_program('flex', required: true)
   bison = find_program('bison', required: true)
 
diff --git a/meson_options.txt b/meson_options.txt
index 62b31b3..a866b17 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -10,3 +10,5 @@ option('python', type: 'feature', value: 'auto',
        description: 'Build pylibfdt Python library')
 option('tests', type: 'boolean', value: true,
        description: 'Build tests')
+option('wheel-only', type: 'boolean', value: false,
+       description: 'building from meson-python')
diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
deleted file mode 100644
index 647203f..0000000
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
-PYLIBFDT_CLEANDIRS_L = __pycache__ libfdt.egg-info
-PYLIBFDT_CLEANDIRS = build $(PYLIBFDT_CLEANDIRS_L:%=$(PYLIBFDT_dir)/%)
-
-SETUP = ./setup.py
-
-ifndef V
-SETUPFLAGS += --quiet
-endif
-
-$(PYMODULE): WARNINGS =  # suppress warnings from generated code
-$(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP)
-	@$(VECHO) PYMOD $@
-	CFLAGS="$(CFLAGS) -Wno-error" $(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext
-
-install_pylibfdt: $(PYMODULE)
-	@$(VECHO) INSTALL-PYLIB
-	$(PYTHON) $(SETUP) $(SETUPFLAGS) install --prefix=$(PREFIX)
-
-pylibfdt_clean:
-	@$(VECHO) CLEAN "(pylibfdt)"
-	rm -f $(PYLIBFDT_CLEANFILES)
-	rm -rf $(PYLIBFDT_CLEANDIRS)
diff --git a/pylibfdt/meson.build b/pylibfdt/meson.build
index 6157f8d..b13d802 100644
--- a/pylibfdt/meson.build
+++ b/pylibfdt/meson.build
@@ -1,13 +1,21 @@
-setup_py = find_program('../setup.py')
-setup_py = [setup_py, '--quiet', '--top-builddir', meson.project_build_root()]
-
-pylibfdt = custom_target(
-  'pylibfdt',
+libfdt_c = custom_target(
+  'swig',
   input: 'libfdt.i',
-  depends: libfdt,
-  output: '_libfdt.so',
-  command: [setup_py, 'build_ext'],
-  build_by_default: true,
+  output: ['libfdt.c', 'libfdt.py'],
+  install: true,
+  install_dir: [false, py.get_install_dir(pure: false)],
+  command: [swig, '-python', '-I'+meson.current_source_dir() / '../libfdt', '-o', '@OUTPUT0@', '@INPUT@']
 )
 
-meson.add_install_script(setup_py, 'install', '--prefix=' + get_option('prefix'), '--root=$DESTDIR')
+nowarn_gen = cc.get_supported_arguments(
+  '-Wno-cast-qual',
+  '-Wno-missing-prototypes',
+  '-Wno-redundant-decls',
+)
+pylibfdt = py.extension_module(
+  '_libfdt',
+  libfdt_c,
+  c_args: ['-DPY_SSIZE_T_CLEAN'] + nowarn_gen,
+  dependencies: [libfdt_dep, py.dependency()],
+  install: true,
+)
diff --git a/pyproject.toml b/pyproject.toml
new file mode 100644
index 0000000..853d13e
--- /dev/null
+++ b/pyproject.toml
@@ -0,0 +1,33 @@
+[build-system]
+build-backend = 'mesonpy'
+requires = ['meson-python']
+
+[project]
+name = 'libfdt'
+authors = [
+    {name = 'Simon Glass', email = 'sjg@chromium.org'},
+]
+classifiers = [
+    'Programming Language :: Python :: 3',
+    'License :: OSI Approved :: BSD License',
+    'License :: OSI Approved :: GNU General Public License v2 or later (GPLv2+)',
+    'Operating System :: OS Independent',
+]
+description = 'Python binding for libfdt'
+readme = 'README.md'
+requires-python = '>=3.8'
+dynamic = ['version']
+
+[project.urls]
+'homepage' = 'https://git.kernel.org/pub/scm/utils/dtc/dtc.git'
+
+# These arguments are applied only when building a redistributable binary wheel
+# for uploading to PyPI. We don't want to install libraries (or headers /
+# pkgconfig files / executables) that clash with system C installs, so we
+# disable everything other than the python bindings themselves, and build the
+# python C-API extension using static linkage to avoid juggling "libdir" /
+# LD_LIBRARY_PATH / RPATH around. When building both the C library and the
+# python bindings for a distro, `meson setup` will still default to shared
+# libraries.
+[tool.meson-python.args]
+setup = ['-Ddefault_library=static', '-Dwheel-only=true']
diff --git a/setup.py b/setup.py
deleted file mode 100755
index 52844ce..0000000
--- a/setup.py
+++ /dev/null
@@ -1,97 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
-
-"""
-setup.py file for SWIG libfdt
-Copyright (C) 2017 Google, Inc.
-Written by Simon Glass <sjg@chromium.org>
-"""
-
-import os
-import sys
-
-from setuptools import setup, Extension
-from setuptools.command.build_py import build_py as _build_py
-
-
-def scan_for_info(srcdir):
-    """Scan for the version and long_description fields
-
-    Args:
-        srcdir (str): Source-directory path
-
-    Returns: tuple
-        str: Full description (contents of README.md)
-        str: Version string
-    """
-    with open(os.path.join(srcdir, "VERSION.txt"), "r", encoding='utf-8') as fh:
-        version = fh.readline().strip()
-
-    with open(os.path.join(srcdir, "README.md"), "r", encoding='utf-8') as fh:
-        long_description = fh.read()
-
-    return version, long_description
-
-
-def get_top_builddir(srcdir):
-    """Figure out the top-level directory containing the source code
-
-    Args:
-        srcdir (str): Source-directory path
-
-    Returns:
-        str: Directory to build in
-    """
-    if '--top-builddir' in sys.argv:
-        index = sys.argv.index('--top-builddir')
-        sys.argv.pop(index)
-        return sys.argv.pop(index)
-    return srcdir
-
-
-class BuildPy(_build_py):
-    """Small class to run the build_ext command"""
-    def run(self):
-        self.run_command("build_ext")
-        return super().run()
-
-
-srcdir = os.path.dirname(__file__)
-version, long_description = scan_for_info(srcdir)
-
-libfdt_module = Extension(
-    '_libfdt',
-    sources=[os.path.join(srcdir, 'pylibfdt/libfdt.i')],
-    define_macros=[('PY_SSIZE_T_CLEAN', None)],
-    include_dirs=[os.path.join(srcdir, 'libfdt')],
-    libraries=['fdt'],
-    library_dirs=[os.path.join(get_top_builddir(srcdir), 'libfdt')],
-    swig_opts=['-I' + os.path.join(srcdir, 'libfdt')],
-)
-
-
-setup(
-    name='libfdt',
-    version=version,
-    cmdclass = {'build_py' : BuildPy},
-    author='Simon Glass',
-    author_email='sjg@chromium.org',
-    description='Python binding for libfdt',
-    ext_modules=[libfdt_module],
-    package_dir={'': os.path.join(srcdir, 'pylibfdt')},
-    py_modules=['libfdt'],
-    python_requires=">=3.8",
-
-    long_description=long_description,
-    long_description_content_type="text/plain",
-    url="https://git.kernel.org/pub/scm/utils/dtc/dtc.git",
-    license="BSD",
-    license_files=["GPL", "BSD-2-Clause"],
-
-    classifiers=[
-        "Programming Language :: Python :: 3",
-        "License :: OSI Approved :: BSD License",
-        "License :: OSI Approved :: GNU General Public License v2 or later (GPLv2+)",
-        "Operating System :: OS Independent",
-    ],
-)
-- 
2.49.0

