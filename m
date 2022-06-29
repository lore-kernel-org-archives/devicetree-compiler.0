From: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Allow static building with meson
Date: Wed, 29 Jun 2022 19:35:57 +0300
Message-ID: <20220629163557.932298-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h2DzDJT35Rz4FQQTeekZzXc0oj637MrHn3fHOVje4/o=;
        b=NaTAz9KNf2eIn9OMs/SES57yu9gli6/6hey79GG647ly0r6D8GBfCSj9vl/VUnXmQ1
         oKzOs4al7UZv8uuJ0ywot+4oV4llTKUhk04naKrrmI2Orat2vnu6+3w5EaLJCRUgPD4E
         L7IseY5U1vAO44+G+Jkyu5Z6jPaW2UjXSJYXbra/X+8OjTJwD7OOO/bAuoEepdNBjO1F
         5PQwjA5AYVY+xogUhMcpdJWIaTYrhRIYuYvi7pGlLRlfaz0lPnsuHCLrM9ce4+WXPepi
         /WL3QvWM99KQuXvJqIEu6sLMDmBbzZcH3ocnKfCBIvSF+8t1Bi3Gnhuu7GBjdxzJUni2
         Du+Q==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

Added "static-build" option in the meson_options.txt.
Setting it to "true" allows static building.

Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
---
 libfdt/meson.build |  8 +++++++-
 meson.build        | 14 ++++++++++++--
 meson_options.txt  |  2 ++
 tests/meson.build  |  9 +++++++--
 4 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/libfdt/meson.build b/libfdt/meson.build
index 71f29b6..240bdf4 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -31,9 +31,15 @@ libfdt_a = static_library(
 
 libfdt_inc = include_directories('.')
 
+if static_build
+  link_with = libfdt_a
+else
+  link_with = libfdt
+endif
+
 libfdt_dep = declare_dependency(
   include_directories: libfdt_inc,
-  link_with: libfdt,
+  link_with: link_with,
 )
 
 install_headers(
diff --git a/meson.build b/meson.build
index b23ea1b..78251eb 100644
--- a/meson.build
+++ b/meson.build
@@ -31,8 +31,16 @@ add_project_arguments(
   language: 'c'
 )
 
+if get_option('static-build')
+  static_build = true
+  extra_link_args = ['-static']
+else
+  static_build = false
+  extra_link_args = []
+endif
+
 yamltree = 'yamltree.c'
-yaml = dependency('yaml-0.1', required: get_option('yaml'))
+yaml = dependency('yaml-0.1', required: get_option('yaml'), static: static_build)
 if not yaml.found()
   add_project_arguments('-DNO_YAML', language: 'c')
   yamltree = []
@@ -85,6 +93,7 @@ if get_option('tools')
       ],
       dependencies: util_dep,
       install: true,
+      link_args: extra_link_args,
     )
   endif
 
@@ -105,10 +114,11 @@ if get_option('tools')
     ],
     dependencies: [util_dep, yaml],
     install: true,
+    link_args: extra_link_args,
   )
 
   foreach e: ['fdtdump', 'fdtget', 'fdtput', 'fdtoverlay']
-    executable(e, files(e + '.c'), dependencies: util_dep, install: true)
+    executable(e, files(e + '.c'), dependencies: util_dep, install: true, link_args: extra_link_args)
   endforeach
 
   install_data(
diff --git a/meson_options.txt b/meson_options.txt
index ea59c28..82621c3 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -8,3 +8,5 @@ option('valgrind', type: 'feature', value: 'auto',
        description: 'Valgrind support')
 option('python', type: 'feature', value: 'auto',
        description: 'Build pylibfdt Python library')
+option('static-build', type: 'boolean', value: false,
+       description: 'Build static binaries')
diff --git a/tests/meson.build b/tests/meson.build
index 3776fef..4ac154a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -96,15 +96,20 @@ tests += [
 ]
 
 dl = cc.find_library('dl', required: false)
-if dl.found()
+if dl.found() and not static_build
   tests += [
     'asm_tree_dump',
     'value-labels',
   ]
 endif
 
+test_deps = [testutil_dep, util_dep, libfdt_dep]
+if not static_build
+  test_deps += [dl]
+endif
+
 foreach t: tests
-  executable(t, files(t + '.c'), dependencies: [testutil_dep, util_dep, libfdt_dep, dl])
+  executable(t, files(t + '.c'), dependencies: test_deps, link_args: extra_link_args)
 endforeach
 
 run_tests = find_program('run_tests.sh')
-- 
2.33.3

