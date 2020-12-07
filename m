From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH 3/5] meson: increase default timeout for tests
Date: Mon,  7 Dec 2020 17:00:53 +0400
Message-ID: <20201207130055.462734-4-marcandre.lureau@redhat.com>
References: <20201207130055.462734-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607346080;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1ihTb+z/9bb3A3sTF3QrHMg/8YuI0egC62WeCzOD+wo=;
        b=NhkWi5cfSuSOt2uE4mT8kEEO2OUnJojd81rNQK6+27djZU0Cm6EMAINJxlGb2CKl3QmneE
        M4O+4J4tYr7NMOWtFpiniMMXnbsPa7bk5DbVLCS3bZYRXBTijoOGvdIZV6Sm3LVUSaMTr1
        9c9iCUvwkgcRt1QktKEs6jWFIcTH380=
In-Reply-To: <20201207130055.462734-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 tests/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/meson.build b/tests/meson.build
index 9d3a4e7..fa06824 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -127,4 +127,5 @@ test(
   workdir: meson.current_build_dir(),
   depends: dumptrees_dtb,
   env: env,
+  timeout: 1800, # mostly for valgrind
 )
-- 
2.29.0

