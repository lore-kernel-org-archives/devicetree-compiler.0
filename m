From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH 1/5] meson: fix -Wall warning
Date: Mon,  7 Dec 2020 17:00:51 +0400
Message-ID: <20201207130055.462734-2-marcandre.lureau@redhat.com>
References: <20201207130055.462734-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607346070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/8kQIRLCS9qf00wO2fy7HYvLWV0mbPFaqynjdk5veAw=;
        b=B0eV3PuTwfh85NMiY26zIjN60tdOVEdUhClfZC6D2Qhy+6Smgqvl3VvkHsyPdasFu8sjTJ
        nnREgrKKCtmn7khBvwohfX3Ig9RCczjeTPzXURHacuWWrp7xaPTK41UDMTdnUJBr6f3TDh
        Kc7OMpk6lvlTIwWc3oY2Urd7mbE+Im8=
In-Reply-To: <20201207130055.462734-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Meson already handles Wall via the built-in warning_level option.

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 meson.build | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meson.build b/meson.build
index 2c65104..b23ea1b 100644
--- a/meson.build
+++ b/meson.build
@@ -6,16 +6,18 @@ project('dtc', 'c',
 
 cc = meson.get_compiler('c')
 
-add_project_arguments(cc.get_supported_arguments([
-  '-Wall',
-  '-Wpointer-arith',
-  '-Wcast-qual',
-  '-Wnested-externs',
-  '-Wstrict-prototypes',
-  '-Wmissing-prototypes',
-  '-Wredundant-decls',
-  '-Wshadow'
-]),language: 'c')
+add_project_arguments(
+  cc.get_supported_arguments([
+    '-Wpointer-arith',
+    '-Wcast-qual',
+    '-Wnested-externs',
+    '-Wstrict-prototypes',
+    '-Wmissing-prototypes',
+    '-Wredundant-decls',
+    '-Wshadow'
+  ]),
+  language: 'c'
+)
 
 if host_machine.system() == 'windows'
   add_project_arguments(
-- 
2.29.0

