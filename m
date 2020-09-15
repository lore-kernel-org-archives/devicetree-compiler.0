From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v3 2/4] pylibfdt: fix build lib location
Date: Tue, 15 Sep 2020 23:27:03 +0400
Message-ID: <20200915192705.1716282-3-marcandre.lureau@redhat.com>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600198052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N+uzQltGPZFYLiBSU+83mLspkLxqOjYunOQfRY9JkuM=;
        b=GS+XL2lRAvURGR4sc9cBDEtQ2lgWiPcoX5lzaT9GKEUzgzYNonIahEO+DhO5ZwRTzX4P4B
        aLyKxoC/yK+dTad0FNOcVRo5z/sa1y19h6Z98b0yGgDt2Yg6kNbZBYmvX6mrF83d7De/Jp
        unP+zjE+ZMiby4pF5IrnB3pjDvDlDgM=
In-Reply-To: <20200915192705.1716282-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

setup.py build_ext is run from top_srcdir with Makefile.

../pylibfdt will produce output files in parent directory.

Note that setup.py install will rebuild it with the default 'build'
directory. There doesn't seem to be a way to override that.

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 pylibfdt/Makefile.pylibfdt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 32ae1c5..1b5f236 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -18,7 +18,7 @@ endif
 
 $(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP) $(VERSION_FILE)
 	@$(VECHO) PYMOD $@
-	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=../$(PYLIBFDT_dir)
+	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=$(PYLIBFDT_dir)
 
 install_pylibfdt: $(PYMODULE)
 	@$(VECHO) INSTALL-PYLIB
-- 
2.26.2

