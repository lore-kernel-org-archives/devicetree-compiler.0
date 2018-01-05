From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] Avoid installing pylibfdt when dependencies are missing
Date: Fri,  5 Jan 2018 11:54:12 -0700
Message-ID: <20180105185412.167666-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=xuyvcU5b4nKUTk7/wTs7wXGZ8qBCwSJtxnAB6jBY6n0=;
        b=WL3SdPnyeWRVrqYI6Em3sWcPS4UnCzfy16Mfx+USk/skbY8uhocpBnEFq4PTDsaats
         mC4Gg6t2/jXAfyS49W3AXcr8aRSMceDmqegRgi7GpDsaW0YVSUchprg51K8dEMJkpH80
         f/NwKFDSjjq9eN8fXCTPGzKytt6g+UqL/MGAxIJAOMkDEu/bOBioMwD9cQAIdMi56WVb
         IM4KctodVYkTPVrrH6Zn8uTi1U4Y7u/jWuSIX6Y/oDexvw1kHouLEavVSAvIFPHRD7HF
         bj4vvUmBIXGOpNzwd6YYnOKpMcl2CMVVoN95s5ttF0cFn3ptlPa2E2PIEhP7EYOrs6dX
         6ukA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

At present we have a build check that python-dev and swig are available.
If they are not, we print a message and skip building pylibfdt.

However this check is not currently present with 'make install'. The
install is attempted, and fails. See crbug.com/789189

Split the check out into a separate script and use it twice, once for the
build and once for the install. This corrects the error.

Reported-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 Makefile | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 9ba8121..fffb80e 100644
--- a/Makefile
+++ b/Makefile
@@ -126,19 +126,23 @@ SCRIPTS = dtdiff
 
 all: $(BIN) libfdt
 
-# We need both Python and swig to build pylibfdt.
-.PHONY: maybe_pylibfdt
-maybe_pylibfdt: FORCE
+# We need both Python and swig to build/install pylibfdt.
+# This builds the given make ${target} if those deps are found.
+check_python_deps = \
 	if $(PKG_CONFIG) --cflags python2 >/dev/null 2>&1; then \
 		if which swig >/dev/null 2>&1; then \
 			can_build=yes; \
 		fi; \
 	fi; \
-	if [ "$$can_build" = "yes" ]; then \
-		$(MAKE) pylibfdt; \
+	if [ "$${can_build}" = "yes" ]; then \
+		$(MAKE) $${target}; \
 	else \
-		echo "## Skipping pylibfdt (install python dev and swig to build)"; \
-	fi
+		echo "\#\# Skipping pylibfdt (install python dev and swig to build)"; \
+	fi ;
+
+.PHONY: maybe_pylibfdt
+maybe_pylibfdt: FORCE
+	target=pylibfdt; $(check_python_deps)
 
 ifeq ($(NO_PYTHON),)
 all: maybe_pylibfdt
@@ -208,8 +212,12 @@ install-includes:
 
 install: install-bin install-lib install-includes
 
+.PHONY: maybe_install_pylibfdt
+maybe_install_pylibfdt: FORCE
+	target=install_pylibfdt; $(check_python_deps)
+
 ifeq ($(NO_PYTHON),)
-install: install_pylibfdt
+install: maybe_install_pylibfdt
 endif
 
 $(VERSION_FILE): Makefile FORCE
-- 
2.16.0.rc0.223.g4a4ac83678-goog
