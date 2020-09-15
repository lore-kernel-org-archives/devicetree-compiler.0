From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v3 3/4] build-sys: add meson build
Date: Tue, 15 Sep 2020 23:27:04 +0400
Message-ID: <20200915192705.1716282-4-marcandre.lureau@redhat.com>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600198062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dv29yLPYx9ErmP18XhXNS49GiD5aOMqiHm9BpKhPgJY=;
        b=DavAdBZ/IAl6gL5E1VyNtkvfoIg463RSrN1mVgQvMGpg9cJnK3GkRvjcSlBt2kEiuIyHEk
        EmFICzhUDkml6rnKe5L1q+lG7eHMkR8NWG9Z7UlO7Uqo6EY49C9eT8xSAxNL6gkQ0/Lp2v
        Q7tMfjCD45EnGs0YENbd8DUSy9A6ybM=
In-Reply-To: <20200915192705.1716282-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

The meson build system allows projects to "vendor" dtc easily, thanks to
subproject(). QEMU has recently switched to meson, and adding meson
support to dtc will help to handle the QEMU submodule.

meson rules are arguably simpler to write and maintain than
the hand-crafted/custom Makefile. meson support various backends, and
default build options (including coverage, sanitizer, debug/release
etc, see: https://mesonbuild.com/Builtin-options.html)

Compare to the Makefiles, the same build targets should be built and
installed and the same tests should be run ("meson test" can be provided
extra test arguments for running the equivalent of checkm/checkv).

There is no support EXTRAVERSION/LOCAL_VERSION/CONFIG_LOCALVERSION,
instead the version is simply set with project(), and vcs_tag() is
used for git/dirty version reporting (This is most common and is
hopefully enough. If necessary, configure-time options could be added
for extra versioning.).

libfdt shared library is build following regular naming conventions:
instead of libfdt.so.1 -> libfdt-1.6.0.so (with current build-sys),
libfdt.so.1 -> libfdt.so.1.6.0. I am not sure why the current build
system use an uncommon naming pattern. I also included a libfdt.pc
pkg-config file, as convenience.

Both Linux native build and mingw cross-build pass. CI pass. Tests are
only run on native build.

The current Makefiles are left in-tree, and make/check still work.
Eventually, the Makefiles could be marked as deprecated, to start a
transition period and avoid having to maintain 2 build systems in the
near future.

(run_tests.sh could eventually be replaced by the meson test runner,
which would have several advantages in term of flexibility/features,
but this is left for another day)

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 libfdt/meson.build   |  50 +++++++++++++++++
 meson.build          | 127 ++++++++++++++++++++++++++++++++++++++++++
 meson_options.txt    |  10 ++++
 pylibfdt/meson.build |  13 +++++
 tests/meson.build    | 130 +++++++++++++++++++++++++++++++++++++++++++
 version_gen.h.in     |   1 +
 6 files changed, 331 insertions(+)
 create mode 100644 libfdt/meson.build
 create mode 100644 meson.build
 create mode 100644 meson_options.txt
 create mode 100644 pylibfdt/meson.build
 create mode 100644 tests/meson.build
 create mode 100644 version_gen.h.in

diff --git a/libfdt/meson.build b/libfdt/meson.build
new file mode 100644
index 0000000..0307ffb
--- /dev/null
+++ b/libfdt/meson.build
@@ -0,0 +1,50 @@
+version_script = '-Wl,--version-script=@0@'.format(meson.current_source_dir() / 'version.lds')
+if not cc.has_link_argument(version_script)
+  version_script = []
+endif
+
+sources = files(
+  'fdt.c',
+  'fdt_addresses.c',
+  'fdt_check.c',
+  'fdt_empty_tree.c',
+  'fdt_overlay.c',
+  'fdt_ro.c',
+  'fdt_rw.c',
+  'fdt_strerror.c',
+  'fdt_sw.c',
+  'fdt_wip.c',
+)
+
+libfdt = library(
+  'fdt', sources,
+  version: '1.6.0',
+  link_args: ['-Wl,--no-undefined', version_script],
+  link_depends: 'version.lds',
+  install: true,
+)
+
+libfdt_inc = include_directories('.')
+
+libfdt_dep = declare_dependency(
+  include_directories: libfdt_inc,
+  link_with: libfdt,
+)
+
+install_headers(
+  files(
+    'fdt.h',
+    'libfdt.h',
+    'libfdt_env.h',
+  )
+)
+
+pkgconfig = import('pkgconfig')
+
+pkgconfig.generate(
+  libraries: libfdt,
+  version: meson.project_version(),
+  filebase: 'libfdt',
+  name: 'libfdt',
+  description: 'Flat Device Tree manipulation',
+)
diff --git a/meson.build b/meson.build
new file mode 100644
index 0000000..2c65104
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,127 @@
+project('dtc', 'c',
+  version: '1.6.0',
+  license: ['GPL2+', 'BSD-2'],
+  default_options: 'werror=true',
+)
+
+cc = meson.get_compiler('c')
+
+add_project_arguments(cc.get_supported_arguments([
+  '-Wall',
+  '-Wpointer-arith',
+  '-Wcast-qual',
+  '-Wnested-externs',
+  '-Wstrict-prototypes',
+  '-Wmissing-prototypes',
+  '-Wredundant-decls',
+  '-Wshadow'
+]),language: 'c')
+
+if host_machine.system() == 'windows'
+  add_project_arguments(
+    '-D__USE_MINGW_ANSI_STDIO=1',
+    language: 'c'
+  )
+endif
+
+add_project_arguments(
+  '-DFDT_ASSUME_MASK=' + get_option('assume-mask').to_string(),
+  language: 'c'
+)
+
+yamltree = 'yamltree.c'
+yaml = dependency('yaml-0.1', required: get_option('yaml'))
+if not yaml.found()
+  add_project_arguments('-DNO_YAML', language: 'c')
+  yamltree = []
+endif
+
+valgrind = dependency('valgrind', required: get_option('valgrind'))
+if not valgrind.found()
+  add_project_arguments('-DNO_VALGRIND', language: 'c')
+endif
+
+py = import('python')
+py = py.find_installation(required: get_option('python'))
+swig = find_program('swig', required: get_option('python'))
+
+version_gen_h = vcs_tag(
+  input: 'version_gen.h.in',
+  output: 'version_gen.h',
+)
+
+subdir('libfdt')
+
+if get_option('tools')
+  flex = find_program('flex', required: true)
+  bison = find_program('bison', required: true)
+
+  util_dep = declare_dependency(
+    sources: ['util.c', version_gen_h],
+    include_directories: '.',
+    dependencies: libfdt_dep
+  )
+
+  lgen = generator(
+    flex,
+    output: '@PLAINNAME@.lex.c',
+    arguments: ['-o', '@OUTPUT@', '@INPUT@'],
+  )
+
+  pgen = generator(
+    bison,
+    output: ['@BASENAME@.tab.c', '@BASENAME@.tab.h'],
+    arguments: ['@INPUT@', '--defines=@OUTPUT1@', '--output=@OUTPUT0@'],
+  )
+
+  if cc.check_header('fnmatch.h')
+    executable(
+      'convert-dtsv0',
+      [
+        lgen.process('convert-dtsv0-lexer.l'),
+        'srcpos.c',
+      ],
+      dependencies: util_dep,
+      install: true,
+    )
+  endif
+
+  executable(
+    'dtc',
+    [
+      lgen.process('dtc-lexer.l'),
+      pgen.process('dtc-parser.y'),
+      'checks.c',
+      'data.c',
+      'dtc.c',
+      'flattree.c',
+      'fstree.c',
+      'livetree.c',
+      'srcpos.c',
+      'treesource.c',
+      yamltree,
+    ],
+    dependencies: [util_dep, yaml],
+    install: true,
+  )
+
+  foreach e: ['fdtdump', 'fdtget', 'fdtput', 'fdtoverlay']
+    executable(e, files(e + '.c'), dependencies: util_dep, install: true)
+  endforeach
+
+  install_data(
+    'dtdiff',
+    install_dir: get_option('prefix') / get_option('bindir'),
+    install_mode: 'rwxr-xr-x',
+  )
+endif
+
+if not meson.is_cross_build()
+  if py.found() and swig.found()
+    subdir('pylibfdt')
+  endif
+
+  if get_option('tools')
+    subdir('tests')
+  endif
+endif
diff --git a/meson_options.txt b/meson_options.txt
new file mode 100644
index 0000000..ea59c28
--- /dev/null
+++ b/meson_options.txt
@@ -0,0 +1,10 @@
+option('tools', type: 'boolean', value: true,
+       description: 'Build tools')
+option('assume-mask', type: 'integer', value: 0,
+       description: 'Control the assumptions made (e.g. risking security issues) in the code.')
+option('yaml', type: 'feature', value: 'auto',
+       description: 'YAML support')
+option('valgrind', type: 'feature', value: 'auto',
+       description: 'Valgrind support')
+option('python', type: 'feature', value: 'auto',
+       description: 'Build pylibfdt Python library')
diff --git a/pylibfdt/meson.build b/pylibfdt/meson.build
new file mode 100644
index 0000000..088f249
--- /dev/null
+++ b/pylibfdt/meson.build
@@ -0,0 +1,13 @@
+setup_py = find_program('setup.py')
+setup_py = [setup_py.path(), '--quiet', '--top-builddir', meson.current_build_dir() / '..']
+
+custom_target(
+  'pylibfdt',
+  input: 'libfdt.i',
+  output: '_libfdt.so',
+  depends: version_gen_h,
+  command: [setup_py, 'build_ext', '--build-lib=' + meson.current_build_dir()],
+  build_by_default: true,
+)
+
+meson.add_install_script(setup_py, 'install', '--prefix=' + get_option('prefix'), '--root=$DESTDIR')
diff --git a/tests/meson.build b/tests/meson.build
new file mode 100644
index 0000000..8976dc1
--- /dev/null
+++ b/tests/meson.build
@@ -0,0 +1,130 @@
+trees = static_library('trees', files('trees.S'), c_args: '-D__ASSEMBLY__',
+                       include_directories: libfdt_inc)
+
+dumptrees = executable('dumptrees', files('dumptrees.c'),
+                       link_with: trees, dependencies: libfdt_dep)
+
+dumptrees_dtb = custom_target(
+  'dumptrees',
+  command: [dumptrees, meson.current_build_dir()],
+  output: [
+    'test_tree1.dtb',
+    'bad_node_char.dtb',
+    'bad_node_format.dtb',
+    'bad_prop_char.dtb',
+    'ovf_size_strings.dtb',
+    'truncated_property.dtb',
+    'truncated_string.dtb',
+    'truncated_memrsv.dtb',
+  ]
+)
+
+testutil_dep = declare_dependency(sources: ['testutils.c'], link_with: trees)
+
+tests = [
+  'add_subnode_with_nops',
+  'addr_size_cells',
+  'addr_size_cells2',
+  'appendprop1',
+  'appendprop2',
+  'appendprop_addrrange',
+  'boot-cpuid',
+  'char_literal',
+  'check_full',
+  'check_header',
+  'check_path',
+  'del_node',
+  'del_property',
+  'dtb_reverse',
+  'dtbs_equal_ordered',
+  'dtbs_equal_unordered',
+  'extra-terminating-null',
+  'find_property',
+  'fs_tree1',
+  'get_alias',
+  'get_mem_rsv',
+  'get_name',
+  'get_path',
+  'get_phandle',
+  'get_prop_offset',
+  'getprop',
+  'incbin',
+  'integer-expressions',
+  'mangle-layout',
+  'move_and_save',
+  'node_check_compatible',
+  'node_offset_by_compatible',
+  'node_offset_by_phandle',
+  'node_offset_by_prop_value',
+  'nop_node',
+  'nop_property',
+  'nopulate',
+  'notfound',
+  'open_pack',
+  'overlay',
+  'overlay_bad_fixup',
+  'parent_offset',
+  'path-references',
+  'path_offset',
+  'path_offset_aliases',
+  'phandle_format',
+  'property_iterate',
+  'propname_escapes',
+  'references',
+  'root_node',
+  'rw_oom',
+  'rw_tree1',
+  'set_name',
+  'setprop',
+  'setprop_inplace',
+  'sized_cells',
+  'string_escapes',
+  'stringlist',
+  'subnode_iterate',
+  'subnode_offset',
+  'supernode_atdepth_offset',
+  'sw_states',
+  'sw_tree1',
+  'utilfdt_test',
+]
+
+tests += [
+  'truncated_memrsv',
+  'truncated_property',
+  'truncated_string',
+]
+
+dl = cc.find_library('dl', required: false)
+if dl.found()
+  tests += [
+    'asm_tree_dump',
+    'value-labels',
+  ]
+endif
+
+foreach t: tests
+  executable(t, files(t + '.c'), dependencies: [testutil_dep, util_dep, libfdt_dep, dl])
+endforeach
+
+run_tests = find_program('run_tests.sh')
+
+
+env = [
+  'PYTHON=' + py.path(),
+  'PYTHONPATH=' + meson.source_root() / 'pylibfdt',
+]
+
+if not py.found()
+  env += 'NO_PYTHON=1'
+endif
+if not yaml.found()
+  env += 'NO_YAML=1'
+endif
+
+test(
+  'run-test',
+  run_tests,
+  workdir: meson.current_build_dir(),
+  depends: dumptrees_dtb,
+  env: env,
+)
diff --git a/version_gen.h.in b/version_gen.h.in
new file mode 100644
index 0000000..7771abb
--- /dev/null
+++ b/version_gen.h.in
@@ -0,0 +1 @@
+#define DTC_VERSION "DTC @VCS_TAG@"
-- 
2.26.2

