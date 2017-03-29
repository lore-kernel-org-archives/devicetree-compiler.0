From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 2/6] pylibfdt: Enable installation of Python module
Date: Wed, 29 Mar 2017 12:15:37 -0600
Message-ID: <20170329181541.28856-3-sjg@chromium.org>
References: <20170329181541.28856-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=W+TDsTPxdV8ds7zOD68gVNIoO06b3XEpflDBc1Ryanc=;
        b=mlBoTw1/bVmxISc9+UszGrw+9Zu1WqPC+u8bZYb55i5Hf+YlMIfbcfq2TdqwFcc4Pk
         UsvgMW4P3uvN2qESzszAOCBG48sXyarG2s7lHkQ50tlIx46pVef87kkUG4+LDnfQlZC9
         Mo+dEnMEC1YUav2xe9Ng2vd30UxP3JW4vahIDo21FUKnYCuvfGra2MiXBKDDyHJ408CY
         mIsl1HUtorzyj3scxVAZnBvtaLNTAzeosLZJwgXtMf1MAkoBJrjfVO1DetKjykqMRd2O
         d1KK5W/VJnLpJIhmwb4p7pr2fVyMd1UfmjLerwcmM9yO0eofT0HyONV49XkmU/LW9UyK
         rhMQ==
In-Reply-To: <20170329181541.28856-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Adjust the setup script to support installation, and call it from the
Makefile if enabled. It will be disabled if we were unable to build the
module (e.g. due to swig being missing), or the NO_PYTHON environment
variable is set.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2: None

 Makefile                   |  2 +-
 README                     |  7 +++++++
 pylibfdt/Makefile.pylibfdt | 14 ++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5cf4aee..52ff72c 100644
--- a/Makefile
+++ b/Makefile
@@ -195,7 +195,7 @@ install-includes:
 	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
 	$(INSTALL) -m 644 $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
 
-install: install-bin install-lib install-includes
+install: install-bin install-lib install-includes maybe_install_pylibfdt
 
 $(VERSION_FILE): Makefile FORCE
 	$(call filechk,version)
diff --git a/README b/README
index d2323fd..5add557 100644
--- a/README
+++ b/README
@@ -50,6 +50,13 @@ If you add new features, please check code coverage:
     # Open 'htmlcov/index.html' in your browser
 
 
+To install the library use:
+
+    make install_pylibfdt SETUP_PREFIX=/path/to/install_dir
+
+If SETUP_PREFIX is not provided, the default prefix is used, typically '/usr'
+or '/usr/local'. See Python's distutils documentation for details.
+
 To disable building the python library, even if swig and Python are available,
 use:
 
diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 861e67c..a0271da 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -14,4 +14,18 @@ $(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
 	@$(VECHO) SWIG $@
 	$(SWIG) -python -o $@ $<
 
+install_pylibfdt: $(WRAP) $(PYMODULE)
+	$(VECHO) INSTALL-PYLIB; \
+	SOURCES="$(PYLIBFDT_srcs) $(WRAP)" CPPFLAGS="$(CPPFLAGS)" \
+	OBJDIR="$(PYLIBFDT_objdir)" \
+	python $(PYLIBFDT_objdir)/setup.py --quiet install \
+		$(if $(SETUP_PREFIX),--prefix=$(SETUP_PREFIX))
+
+maybe_install_pylibfdt:
+	if [ -e $(PYMODULE) ]; then \
+		if [ -z "$(NO_PYTHON)" ]; then \
+			$(MAKE) install_pylibfdt; \
+		fi; \
+	fi
+
 PYLIBFDT_cleanfiles = libfdt_wrap.c libfdt.py libfdt.pyc _libfdt.so
-- 
2.12.2.564.g063fe858b8-goog
