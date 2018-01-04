From: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Subject: [PATCH] Makefile: Split INSTALL out into INSTALL_{PROGRAM,LIB,DATA,SCRIPT}
Date: Wed,  3 Jan 2018 21:49:23 -0600
Message-ID: <20180104034923.2919-1-kevans@FreeBSD.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

For adoption into systems that may have additional arguments to be passed into
install(1) upon install, split out INSTALL into the different types of files to
be installed and use them appropriately. This allows, for instance, passing -s
to strip binaries and libs while not botching directory installs or data/script
installations.

Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
---
 Makefile | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 9ba8121..5f1c274 100644
--- a/Makefile
+++ b/Makefile
@@ -26,6 +26,10 @@ SWIG = swig
 PKG_CONFIG ?= pkg-config
 
 INSTALL = /usr/bin/install
+INSTALL_PROGRAM = $(INSTALL)
+INSTALL_LIB = $(INSTALL)
+INSTALL_DATA = $(INSTALL) -m 644
+INSTALL_SCRIPT = $(INSTALL)
 DESTDIR =
 PREFIX = $(HOME)
 BINDIR = $(PREFIX)/bin
@@ -191,20 +195,21 @@ endif
 install-bin: all $(SCRIPTS)
 	@$(VECHO) INSTALL-BIN
 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
-	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
+	$(INSTALL_PROGRAM) $(BIN) $(DESTDIR)$(BINDIR)
+	$(INSTALL_SCRIPT) $(SCRIPTS) $(DESTDIR)$(BINDIR)
 
 install-lib: all
 	@$(VECHO) INSTALL-LIB
 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
-	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+	$(INSTALL_LIB) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
 	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
 	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
-	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
+	$(INSTALL_DATA) $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
 
 install-includes:
 	@$(VECHO) INSTALL-INC
 	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
-	$(INSTALL) -m 644 $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
+	$(INSTALL_DATA) $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
 
 install: install-bin install-lib install-includes
 
-- 
2.15.1
