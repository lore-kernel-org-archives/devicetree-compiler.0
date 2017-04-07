From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 2/3] pylibfdt: Use Makefile constructs to implement NO_PYTHON
Date: Fri,  7 Apr 2017 15:51:33 -0600
Message-ID: <20170407215134.2477-3-sjg@chromium.org>
References: <20170407215134.2477-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=glrBFMx+XYt8r0hw4b3Ah71n8LfNLv8lcIKgbGnHlEU=;
        b=TN+EivBq1mifI2GIrQ+a89fd5Ux669kvW4ch6opqPiVvOxk8A0B/kLTiFw0VtpBOUJ
         3BAUabowloRwxPMYbuSlRLjRUeEI6oD+e35XT082ta7qmsLUsqkvDAdtGSamN7jDZ1+L
         vCS9FWsF8qyEnifXD50cGqEYxs73imqUicbOZVp+56Mo7ipNTgQFUZbhdFbJJ0/vtawO
         PoJi4N5qDWkdP36cOT9zaMq7wqNHsUQVI3twJ+kDTmwErcYIlOkSP3pPuiN5l4E03LM2
         xha4OGQuC7/m2y2ZePOy8wp0Mtu1EEXNyKN38T/s2cS9gW9z8Pnrt7Jinvdv3atWqU0x
         CUlQ==
In-Reply-To: <20170407215134.2477-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v4: None
Changes in v3:
- Add new patch to move to Makefile constructs for NO_PYTHON
- Update for new test dependency

Changes in v2: None

 Makefile                   | 15 ++++++++++++---
 pylibfdt/Makefile.pylibfdt |  7 -------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 154f5bf..beca4a0 100644
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
@@ -267,7 +274,9 @@ TESTS_BIN += convert-dtsv0
 TESTS_BIN += fdtput
 TESTS_BIN += fdtget
 TESTS_BIN += fdtdump
+ifeq ($(NO_PYTHON),)
 TESTS_PYLIBFDT += maybe_pylibfdt
+endif
 
 include tests/Makefile.tests
 
diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 0e8ac5f..4036b1f 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -25,11 +25,4 @@ install_pylibfdt: $(WRAP) $(PYMODULE)
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
