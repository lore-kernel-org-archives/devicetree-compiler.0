From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH] fdtdump: fix -Werror=int-to-pointer-cast
Date: Wed, 25 Aug 2021 16:13:50 +0400
Message-ID: <20210825121350.213551-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629893641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=pZMK8hJL4pPXgxFHUzgj29+NwtTcdNbm3rLz4MBQwBc=;
        b=dykplKA0yQOLMcL2yjZmn3qD4QgvDxzrB68H+ftTnWlMoHqxuKWDz4fPOFpPw3ofyr8Ob+
        eeCVsYWpjZ7HifMss9Su4S07WJMtd3bN8xY4RhNBvZ7TP92qqlIbXPig3xofwLWrIRifJA
        ZwrFcFgJ/nhgZ9B2xov8LdihGYmaqfY=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

With mingw64-gcc, the compiler complains with various warnings:
error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 fdtdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fdtdump.c b/fdtdump.c
index bdc0f94..d424869 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -21,7 +21,7 @@
 #define MAX_VERSION 17U
 
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
-#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
+#define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
 #define GET_CELL(p)	(p += 4, *((const fdt32_t *)(p-4)))
 
 static const char *tagname(uint32_t tag)
-- 
2.33.0.rc2

