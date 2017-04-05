From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 4/5] pylibfdt: Use Makefile constructs to implement NO_PYTHON
Date: Wed,  5 Apr 2017 10:01:41 -0600
Message-ID: <20170405160142.10564-5-sjg@chromium.org>
References: <20170405160142.10564-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DzJ0cFMet7mDfUmJQwYVA0rV8r60lulOJByWkFCH7dU=;
        b=kk52RYk7Q/3WhICIcNOkcyt2g/56sXkPJI/KLTd9Pl2W48hZl73Cf+Vxjm3X1eiWHd
         uhqI+4wNDBF6DG+NRZw58O/eYyfqRfdJJW/35hxxPsRMNAmqV2DBOEkMy5FPKGaiBdxo
         no7EzaVULVcvKRlGYOAdy948Gxp31PJFM6swqzdFUlzbtTpZTnfEEwIEgs4gpTHa1H/h
         jksvj8wZpI5h2OZgzcbciYZh8PkqMg4g1JmP5ScsYjlLZkWfFab8/GKMMC9cZPlFyU/C
         9q1bn0Fmg3Kq/TQPFFZ+PZpCuYYX5vNF1D8y0MEOgC2dIqGenou1erJEceeoLrCDw9e7
         1HCQ==
In-Reply-To: <20170405160142.10564-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The current mechanism uses a shell construct, but it seems better to use
a Makefile approach.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Suggested-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---

Changes in v3:
- Add new patch to move to Makefile constructs for NO_PYTHON

Changes in v2: None

 Makefile                   | 13 ++++++++++---
 pylibfdt/Makefile.pylibfdt |  7 -------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 52ff72c..88cbfe2 100644
--- a/Makefile
+++ b/Makefile
@@ -117,10 +117,11 @@ BIN += fdtput
 
 SCRIPTS = dtdiff
 
+all: $(BIN) libfdt
+
 # We need both Python and swig to build pylibfdt.
 .PHONY: maybe_pylibfdt
 maybe_pylibfdt: FORCE
-	if [ -n "${NO_PYTHON}" ]; then exit; fi; \
 	if $(PKG_CONFIG) --cflags python >/dev/null 2>&1; then \
 		if which swig >/dev/null 2>&1; then \
 			can_build=yes; \
@@ -132,7 +133,9 @@ maybe_pylibfdt: FORCE
 		echo "## Skipping pylibfdt (install python dev and swig to build)"; \
 	fi
 
-all: $(BIN) libfdt maybe_pylibfdt
+ifeq ($(NO_PYTHON),)
+all: maybe_pylibfdt
+endif
 
 
 ifneq ($(DEPTARGETS),)
@@ -195,7 +198,11 @@ install-includes:
 	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
 	$(INSTALL) -m 644 $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
 
-install: install-bin install-lib install-includes maybe_install_pylibfdt
+install: install-bin install-lib install-includes
+
+ifeq ($(NO_PYTHON),)
+install: install_pylibfdt
+endif
 
 $(VERSION_FILE): Makefile FORCE
 	$(call filechk,version)
diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index f7f9d5e..7ee72f2 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -24,11 +24,4 @@ install_pylibfdt: $(WRAP) $(PYMODULE)
 	$(call run_setup, $(PYLIBFDT_srcs) $(WRAP), \
 		install $(if $(SETUP_PREFIX),--prefix=$(SETUP_PREFIX)))
 
-maybe_install_pylibfdt:
-	if [ -e $(PYMODULE) ]; then \
-		if [ -z "$(NO_PYTHON)" ]; then \
-			$(MAKE) install_pylibfdt; \
-		fi; \
-	fi
-
 PYLIBFDT_cleanfiles = libfdt_wrap.c libfdt.py libfdt.pyc _libfdt.so
-- 
2.12.2.715.g7642488e1d-goog
