From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 3/3] pylibfdt: Use setup.py to build the swig file
Date: Fri,  7 Apr 2017 15:51:34 -0600
Message-ID: <20170407215134.2477-4-sjg@chromium.org>
References: <20170407215134.2477-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JlT62nMM2RNtFQ2qeVBYyESc24KqAgctX5UXCuOElWg=;
        b=dI8VXKAtAN+1xnEh/Vqt1Gf14hwlQxTHoAfdnGluKM6XpFPzTQLw7tJegK+nRF0P1E
         INbDzD6g2TaXL+XeueL16fMxNV/H0QSZK5XWI/WqMC01Xhh0UnDhOvmwyk+DWbAZmx0p
         KCdRN+TtHIH3+pQy8nd6WlxYrwoOC7k9Cjp+wHxs59Orlx/axVrMChdukggy6nvA0Bvg
         GqB99jdBl1+jT7SOTCnyZ/MPs+JC/DiGAq6pfF9ylT+dLetucrqfV0CWp7oIsFnq+CDv
         42w5TOeXRRkcC72ww5ks+NcJZFDp5AFtCMxaYY46m62lRPpByeTBDTm+1RnsezEC1OKk
         Y00Q==
In-Reply-To: <20170407215134.2477-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v4: None
Changes in v3:
- Add a new patch to use setup.py to build the swig file

Changes in v2: None

 pylibfdt/Makefile.pylibfdt | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 4036b1f..9507d3d 100644
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
@@ -11,18 +11,14 @@ define run_setup
 	$(PYLIBFDT_objdir)/setup.py --quiet $(2)
 endef
 
-$(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
+$(PYMODULE): $(PYLIBFDT_srcs)
 	@$(VECHO) PYMOD $@
 	$(call run_setup, $^, build_ext --inplace)
 	mv _libfdt.so $@
 
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
