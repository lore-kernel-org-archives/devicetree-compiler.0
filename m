Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38521BD50C
	for <devicetree-compiler@vger.kernel.org>; Tue, 29 Apr 2025 01:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745890978; cv=none; b=sRdUFJVqiYwyUbXBeo6ByUILTDbUTOv3pgZ0IscZoLxbl1KbLdhrbAvy169ZDXwOwRkN5pCRTNr0frwk+cEi8O8GRCTFM5m+qo5zj0WMbL4p3ibN2TurtPjvF075th4eEGMatJN/duZU/Wtc17lQ3mtYERPZeBx9/hB216CKDkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745890978; c=relaxed/simple;
	bh=IgaQKrVAjizqrApc0pQDkFmnBxUUt16fM7ub1CQruxo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9OvWaETIoVySMyGl2O6CuQ6e3tKmGzNGRCMR0wLMSGW5Qvp+XfJJ70fJs0RdBRJQi72gyMhPq9QPk/ycWtOAmH+DwvM8e/XUOXSSUagV33kgYjHZXZQhrbqWZh1NUZPF+ydDU0mQktCTztabaid3wWqyOePfKRlDnjnPDTX6ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMHWVAfw; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMHWVAfw"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e2fe5f17so580727485a.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 28 Apr 2025 18:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745890974; x=1746495774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gs3sUuUl2eFVKbVvEa5rtrC1pwbaYNRc7Uz2NHq0doY=;
        b=PMHWVAfwj9w1hiSiamIMIpddw2+AeqKWb8iDH7lcX15luY0AkanP0Og5/0pNBeUxRI
         HB8ch/sIkS162UgCLAyYkeYgJXCOsBAMiA5W8F6jRhJGGeVsLZCkMFjX+yJEzyen/NMA
         NIJOagY+IU3hiJq53yAEmxXnE+O3V3/ncOjt1qeRsCjfrPED23jVp7smxiiWPz7TXa3t
         WWyRIwFixuCwc1uPc/snn+1ivT0J2h5tCAn15CFrXULRgROG+SINyHBGKKS0BVuTqeDP
         LU7h1ocZFusCUwx1pVJGqpQbw+nfd7nnbjv3E7Kf8Pw/qeK5oGmk5HRkd4EHm0DebS1l
         S60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745890974; x=1746495774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gs3sUuUl2eFVKbVvEa5rtrC1pwbaYNRc7Uz2NHq0doY=;
        b=PR/Y+h0gfOuynIGYsmf+daiS94UhksUE4Bu0HyXc9dYZoMxB8sI4UQez//zRAgqysL
         iM1MFC8n3zZ3tWSquBsCEPHh31HrGXR9teUxpup8bpbrqVeKSpGQI+3MP6+4bG+LDvqS
         y6cDuWvZhbbNrEeF/eBlsaqYWyMLSC91Dm4XoYPvIaV4F3evpEX3HqHbPBt2IaFB+Arw
         HHqMGT+1BQtXvZNJlI058C22ZxGMKJ1qKb16ycmv7zGJvGpMtO4ahE1RnvEwNd0XoYbl
         e2DRdt1Dl8aQuZFHznTetTzmCt9RZk9WRxhHktmcpTaHWfSpxvIcvtpF+06L2AN72K+e
         Di4A==
X-Gm-Message-State: AOJu0YzOOddnYJGn8SmqdWnTqUano3ptNx0V8mGJLB0YLs4ukvaRhdmM
	a1oEuvzgKdUzmF2IMOdFnjY6koIwbYOD+u63STXk1uVFD8HjpkNzGmWm8U8S
X-Gm-Gg: ASbGncsycb1XJiRJUfk3XwDmI3GEHvp1plMN7PGiu278TIn18c8d+gZI7avy/oKKnRh
	tjMFo35lSN0IlvaCGJc384MdZIp7j7/Vh8rNfow5dLz5xrB0xFBuhHf+BE25EZUAFXJ6AAAhLLT
	7Pl8h0pm5wvnYcvkEBxwluAZbEiFxz9NYn6h/zXa+HLGylg4mV7FuFFI4LjHs6JfINc7Ms5R+Zl
	lBBxed/PK6zFvKYyQplW9a2eravCSeeivBmkdy6DAmPwHdERj1Bu6EEIidokUFp+Y+dwNwOttzJ
	N7ELF85V/Pt4n/j0mws4zCnTTnO95w81+oh3Tw==
X-Google-Smtp-Source: AGHT+IFnvk3iwItfIhWdkhVap9E3vwfyg+hfFlTMSeUvThw5UeGvrLwtxK+ntHG/qEHyQ+7xj6VDOw==
X-Received: by 2002:a05:6214:4013:b0:6f2:a886:7c6d with SMTP id 6a1803df08f44-6f4f26d2f66mr18331286d6.3.1745890974196;
        Mon, 28 Apr 2025 18:42:54 -0700 (PDT)
Received: from acleverhostname.lan ([2603:6011:3f0:6f00::12ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a7419asm67034126d6.89.2025.04.28.18.42.53
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 18:42:53 -0700 (PDT)
From: Eli Schwartz <eschwartz93@gmail.com>
X-Google-Original-From: Eli Schwartz <eschwartz@gentoo.org>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH v2 2/2] meson: port python bindings to build natively via meson and meson-python
Date: Mon, 28 Apr 2025 21:41:43 -0400
Message-ID: <20250429014241.90681-3-eschwartz@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429014241.90681-1-eschwartz@gentoo.org>
References: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
 <20250429014241.90681-1-eschwartz@gentoo.org>
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
index 000dd85..9fc8b14 100644
--- a/Makefile
+++ b/Makefile
@@ -33,7 +33,6 @@ BISON = bison
 LEX = flex
 SWIG = swig
 PKG_CONFIG ?= pkg-config
-PYTHON ?= python3
 
 INSTALL = install
 INSTALL_PROGRAM = $(INSTALL)
@@ -49,8 +48,6 @@ INCLUDEDIR = $(PREFIX)/include
 HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
 	    sed -e 's/\(cygwin\|msys\).*/\1/')
 
-NO_PYTHON ?= 0
-
 NO_VALGRIND := $(shell $(PKG_CONFIG) --exists valgrind; echo $$?)
 ifeq ($(NO_VALGRIND),1)
 	CPPFLAGS += -DNO_VALGRIND
@@ -160,29 +157,6 @@ SCRIPTS = dtdiff
 
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
@@ -256,14 +230,6 @@ install-includes:
 
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
 
@@ -289,16 +255,6 @@ dist:
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
@@ -332,9 +288,6 @@ TESTS_BIN += fdtput
 TESTS_BIN += fdtget
 TESTS_BIN += fdtdump
 TESTS_BIN += fdtoverlay
-ifeq ($(NO_PYTHON),0)
-TESTS_PYLIBFDT += maybe_pylibfdt
-endif
 
 ifneq ($(MAKECMDGOALS),libfdt)
 include tests/Makefile.tests
@@ -346,7 +299,7 @@ endif
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
index 0000000..8682026
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
+description = 'Pthon binding for libfdt'
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

