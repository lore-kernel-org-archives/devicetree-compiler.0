From: Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Makefile: allow to install libfdt without building executables
Date: Wed, 26 Jul 2023 16:43:11 +0200
Message-ID: <20230726144336.677135-1-nico.escande@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690382634; x=1690987434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t+nNN3pvjPlyXya+VU20v9XbFyUmKUJyg+3ygP77iFI=;
        b=ZD0JBs5zGDPPxe2pDCiVklXC85gIs+sWmIH6j0eB8m8bxH94MeE204xe8m0SXrfwL4
         hBYUvkiS1FI5MZgpCfCsbcMkAqG52FPxnLZ4blJlbripBgOxLxBVQetksL7G5ddwMsnY
         EDQhCtNpJS6xQlRCxIfZAnaFlf4O/18SevOlXAfgxoQ+qazKOtaG057Svv0/nLGPCAVu
         vDCewIyoIOB6vRe2KkP/nEaErxd9j0MyDw5xSiKv8el6xX1TGQGl5fGIuvtDBvMk8xbG
         x2Ezg1d+cFYSFqtBQaxZNQ37tU/Mi9ws5KFvzaMMs/wzyogot7aHlPZukqUYSoYU02XY
         mIYg==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

When we only need the libfdt calling the target install-lib also builds the
executables listed in $(BINS) because this target depends on all
Instead lets make install-lib only depend on libfdt.

Signed-off-by: Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 784e2f8..c0b68a2 100644
--- a/Makefile
+++ b/Makefile
@@ -238,7 +238,7 @@ install-bin: all $(SCRIPTS)
 	$(INSTALL_PROGRAM) $(BIN) $(DESTDIR)$(BINDIR)
 	$(INSTALL_SCRIPT) $(SCRIPTS) $(DESTDIR)$(BINDIR)
 
-install-lib: all
+install-lib: libfdt
 	@$(VECHO) INSTALL-LIB
 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
 	$(INSTALL_LIB) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
-- 
2.41.0

