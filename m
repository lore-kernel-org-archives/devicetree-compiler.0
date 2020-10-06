From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v4 1/4] pylibfdt: fix build-lib location
Date: Tue,  6 Oct 2020 12:27:09 +0400
Message-ID: <20201006082712.241224-2-marcandre.lureau@redhat.com>
References: <20201006082712.241224-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601972867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1tzgkoZUf3s4f2i4RjU1mC2FAIwGqS0YpNZVZMXIwNg=;
        b=DK6zJ3Po6tveSG163q+s7jhj8YVrjZwm70iGaAx05oF7KfIVXjdtmRDgwbqT8rvinXhuuS
        oKwZuOTK8SsofBtQx+PYyGnzp4DTAgn88qZAn+Rd8f7JwKD2xclwKJ1pGmZ7xFszp0h8sX
        e9g5/2JsYQMVD1/ViZm8UP/gCaJIwDc=
In-Reply-To: <20201006082712.241224-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

setup.py build_ext is run from top_srcdir with the Makefile
build-system, due to Makefile.pylibfdt inclusion in top_srcdir/Makefile.

--build-lib=../pylibfdt will produce output files in the parent
directory of the current directory. Ex:

~/src/dtc$ make && ls ../pylibfdt
_libfdt.cpython-38-x86_64-linux-gnu.so

Fix it by changing the build-lib directory to $(cwd)/pylibfdt instead.

(note that setup.py install will rebuild it with the default 'build'
directory, there doesn't seem to be a way to override that)

Fixes: 1e4a0928f3b3b827824222572e551a60935607e3 ("pylibfdt: Don't have
setup.py depend on where it's invoked from")
Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 pylibfdt/Makefile.pylibfdt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 6866a0b..0c07224 100644
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
2.28.0

