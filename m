From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 4/6] pylibfdt: Use the call function to simplify the Makefile
Date: Wed, 29 Mar 2017 12:15:39 -0600
Message-ID: <20170329181541.28856-5-sjg@chromium.org>
References: <20170329181541.28856-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/iXV916l4baLrJ9S7hAjkqec64a1zB2VAwqq83FRjeI=;
        b=s3DJREDuODCBQ72jRIdxO3VQANNXE4GRtcxmdyCe3wy+FxDwXyCMMW//6CQbFcT7Rh
         vN9H4Q2qLfO61G7kJbUZy7hIsI0LhyZvmDLmk2D84vKdm5RWX75Ra+22EsDhvVAmr7J8
         Q/0gxQIWlolHgX2h1qqxfeV9tmLFtgNgGK4zk/UEXQWY9qczf2jiG+Nn9QoyJqGLfyZv
         qT5pxRKSDcY1viadde5FyPR6WevMpWBiCweRwzpLgaNkYhfK+fUTCxYx8ywZhcCfQQtJ
         tejDR/qh89O1vdhkw+7P11AZ+5QwWEJnPtxnoeeZr+Jw8xg5+p2moq0UP9r9Vg7m4JlE
         k+IQ==
In-Reply-To: <20170329181541.28856-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This is in a separate patch since I not sure if GNU make features
are permitted in the Makefile.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2: None

 pylibfdt/Makefile.pylibfdt | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index a74cd30..0d95c11 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -5,11 +5,13 @@ PYLIBFDT_srcs = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_SRCS))
 WRAP = $(PYLIBFDT_objdir)/libfdt_wrap.c
 PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
 
+run_setup = SOURCES="$(1)" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)" \
+	VERSION="$(dtc_version)" \
+	python $(PYLIBFDT_objdir)/setup.py --quiet $(2)
+
 $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
 	@$(VECHO) PYMOD $@
-	SOURCES="$^" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)" \
-	VERSION="$(dtc_version)" \
-	python $(PYLIBFDT_objdir)/setup.py --quiet build_ext --inplace
+	$(call run_setup, $^, build_ext --inplace)
 
 $(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
 	@$(VECHO) SWIG $@
@@ -17,10 +19,8 @@ $(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
 
 install_pylibfdt: $(WRAP) $(PYMODULE)
 	$(VECHO) INSTALL-PYLIB; \
-	SOURCES="$(PYLIBFDT_srcs) $(WRAP)" CPPFLAGS="$(CPPFLAGS)" \
-	OBJDIR="$(PYLIBFDT_objdir)" VERSION="$(dtc_version)" \
-	python $(PYLIBFDT_objdir)/setup.py --quiet install \
-		$(if $(SETUP_PREFIX),--prefix=$(SETUP_PREFIX))
+	$(call run_setup, $(PYLIBFDT_srcs) $(WRAP), \
+		install $(if $(SETUP_PREFIX),--prefix=$(SETUP_PREFIX)))
 
 maybe_install_pylibfdt:
 	if [ -e $(PYMODULE) ]; then \
-- 
2.12.2.564.g063fe858b8-goog
