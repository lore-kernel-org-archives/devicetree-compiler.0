From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] libfdt: Add static lib to meson build
Date: Wed, 10 Nov 2021 18:33:29 -0600
Message-ID: <20211111003329.2347536-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The meson build is not building the static libfdt, so add it.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 libfdt/meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/libfdt/meson.build b/libfdt/meson.build
index 0307ffb8d7b9..71f29b61e870 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -24,6 +24,11 @@ libfdt = library(
   install: true,
 )
 
+libfdt_a = static_library(
+  'fdt', sources,
+  install: true,
+)
+
 libfdt_inc = include_directories('.')
 
 libfdt_dep = declare_dependency(
-- 
2.32.0

