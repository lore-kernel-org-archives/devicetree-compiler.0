Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB1012E5B
	for <devicetree-compiler@vger.kernel.org>; Mon, 17 Mar 2025 00:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742172140; cv=none; b=Ygv5At2dLS+ESUpiqFjALsLcCy71B5Ar1dvKZagOW6UW5heXzvzgfDtfqvEh2KiYByvMWZPeb21HwsgTFiAejB99cwdjaIO5BrGk4v+akbtRLKxwGNmgB9Mnh4p11aEj2l4X0fSfo2lNMAxmd/UQ2gyVkbGQE0z7FTSbl1CLks8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742172140; c=relaxed/simple;
	bh=lTm1rsbpm+ai7RZVlJaBaC6nQ+ZWAcpWeoDCeuyKnn4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=t0ieA+HZXhYqsoaQnPmZ8znyWXtqdWzPRGRqD5Yv2eGvZHXceQAQYQw/905vLXHq2uS6IfGPAi9fiCe96zoevL2v9otX53iTZnvqyoo1jFtUUUVtUnhK8ImhY7Wt7DPL1laiHBSSThx52OwOZ7Xl/koGdHKnvEBm8P9Raci+G28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from acleverhostname.lan (unknown [IPv6:2603:6011:3f0:6f00::12ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: eschwartz@gentoo.org)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4E6BB3431FC
	for <devicetree-compiler@vger.kernel.org>; Mon, 17 Mar 2025 00:42:18 +0000 (UTC)
From: Eli Schwartz <eschwartz@gentoo.org>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH] meson: port python bindings to build natively via meson and meson-python
Date: Sun, 16 Mar 2025 20:40:56 -0400
Message-ID: <20250317004056.14564-1-eschwartz@gentoo.org>
X-Mailer: git-send-email 2.48.1
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

Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
---
 MANIFEST.in          | 12 ------
 libfdt/meson.build   | 32 ++++++++-------
 meson.build          |  3 +-
 meson_options.txt    |  2 +
 pylibfdt/meson.build | 28 ++++++++-----
 pyproject.toml       | 25 ++++++++++++
 setup.py             | 97 --------------------------------------------
 7 files changed, 64 insertions(+), 135 deletions(-)
 delete mode 100644 MANIFEST.in
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
index 0000000..0929bd0
--- /dev/null
+++ b/pyproject.toml
@@ -0,0 +1,25 @@
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
+[tool.meson-python.args]
+'setup' = ['-Ddefault_library=static', '-Dwheel-only=true']
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
2.48.1

