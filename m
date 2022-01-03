From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH 1/2] Revert "libfdt: Add static lib to meson build"
Date: Mon,  3 Jan 2022 11:38:54 +0400
Message-ID: <20220103073855.1468799-2-marcandre.lureau@redhat.com>
References: <20220103073855.1468799-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641195552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=exKZb/Pj5WSdtAFN/sk8+DEWyiL5tlyfN5oKXtZd/cg=;
        b=cEEB+0D3GepVBg4u8AjR5EmGabAm9eKQ4RbkJt6XmcCDiX3NyhPYH2Xz/U+XutGPUsl5TW
        LNasl7DHh70Z5AJwwLPfRmIc5IvHe0pnAjuoiBQ8F/nMNofllhzC8UZkVWaj4aRsxllRPQ
        MPyKnMnCiA/EelMPxTghYfPDJFAKulE=
In-Reply-To: <20220103073855.1468799-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

You can build the static library by running meson configure
-Ddefault_library=both or static.

This reverts commit 5216f3f1bbb70aef463b6cd78dbbb0f4c4c71606.

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 libfdt/meson.build | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/libfdt/meson.build b/libfdt/meson.build
index 71f29b61e870..0307ffb8d7b9 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -24,11 +24,6 @@ libfdt = library(
   install: true,
 )
 
-libfdt_a = static_library(
-  'fdt', sources,
-  install: true,
-)
-
 libfdt_inc = include_directories('.')
 
 libfdt_dep = declare_dependency(
-- 
2.34.1.8.g35151cf07204

