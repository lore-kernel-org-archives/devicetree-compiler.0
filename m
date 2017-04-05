From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 5/5] pylibfdt: Use setup.py to build the swig file
Date: Wed,  5 Apr 2017 10:01:42 -0600
Message-ID: <20170405160142.10564-6-sjg@chromium.org>
References: <20170405160142.10564-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YRgfasv40DJb6F0OEe7l/MTkUXrFIBFaZz+aCUR00yM=;
        b=QW3i3mcdjReQxsiSljpOPDD3FGWCcLuvFN/YkhPC8tNBRIl4oRF9YVpMx8smk/Ojbb
         PGQKcl8Jb2TPIOspCrgitLa6eeTK8csU2jRXhQKyASEFf9lVjmFKP0odJSMTtkc2fJZp
         YJk46sequORoclNB2GdYsitOxIRhn7oYBwCCw4kU1xRo30ReuPDSDm3NQuYW5bvZxcNY
         ayF1hRbLDvJtPwBzuym8InZdPtiKGetTBRm1SMoZ+gaY26tqZCLJ6cLEmSg5IVRQ9QJS
         DjHYlUcFIrg86+T9mUq0wO48uWc/w8CzdiK/zQ5wMNRTHkgsH1Qs6GDYRSxnSuITjALK
         MEQw==
In-Reply-To: <20170405160142.10564-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Since we are using the standard .i extension for the swig file, we can use
setup.py to build the wrapper. Drop the existing build code since it is
not needed.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v3:
- Add a new patch to use setup.py to build the swig file

Changes in v2: None

 pylibfdt/Makefile.pylibfdt | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 7ee72f2..2843ef5 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -1,8 +1,8 @@
 # Makefile.pylibfdt
 #
 
-PYLIBFDT_srcs = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_SRCS))
-WRAP = $(PYLIBFDT_objdir)/libfdt_wrap.c
+PYLIBFDT_srcs = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_SRCS)) \
+		$(PYLIBFDT_srcdir)/libfdt.i
 PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
 
 define run_setup
@@ -11,17 +11,13 @@ define run_setup
 	$(PYLIBFDT_objdir)/setup.py --quiet $(2)
 endef
 
-$(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
+$(PYMODULE): $(PYLIBFDT_srcs)
 	@$(VECHO) PYMOD $@
 	$(call run_setup, $^, build_ext --inplace)
 
-$(WRAP): $(PYLIBFDT_srcdir)/libfdt.i
-	@$(VECHO) SWIG $@
-	$(SWIG) -python -o $@ $<
-
-install_pylibfdt: $(WRAP) $(PYMODULE)
+install_pylibfdt: $(PYMODULE)
 	$(VECHO) INSTALL-PYLIB; \
-	$(call run_setup, $(PYLIBFDT_srcs) $(WRAP), \
+	$(call run_setup, $(PYLIBFDT_srcs), \
 		install $(if $(SETUP_PREFIX),--prefix=$(SETUP_PREFIX)))
 
 PYLIBFDT_cleanfiles = libfdt_wrap.c libfdt.py libfdt.pyc _libfdt.so
-- 
2.12.2.715.g7642488e1d-goog
