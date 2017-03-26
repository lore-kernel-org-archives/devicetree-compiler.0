From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 5/7] pylibfdt: Enable installation of Python module
Date: Sun, 26 Mar 2017 13:06:21 -0600
Message-ID: <20170326190623.27518-6-sjg@chromium.org>
References: <20170326190623.27518-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GE3NCrQEDLqScglWYQddt9MgAk/s+f+icj2yfgfsuFI=;
        b=LgHWpVtQKrV4bx1ieo6cYPQL8H3ow5WY2x8FUPRjd24+3JHUCcI2YqIhvaFasD4OoO
         iPfdos94SYWR6r0FQL8wdYiTHfK4lhfiZ+hhlQfb4LznDbdYle98itHkg9hGhmqQhEhY
         2b86nlV6oM6RhzuxvRu9DqR9mtCusGxqoIJaqgu6l+AyOJBuHdPKkDqpL3McgAhx8xah
         Vwh3Y2DK1Aqt4JABUWgGaiH79dR3jZAWO/DtoJi/Hv+tqKarsm/JGZqViFtqtmJMQBlc
         SllfkEDWqUPNhEbDW6ee+ngLOmIUnyuPQiSWIi8jOpiUHih0PWpBfqyrmhUivJeb/Xgs
         K83w==
In-Reply-To: <20170326190623.27518-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
2.12.1.578.ge9c3154ca4-goog
