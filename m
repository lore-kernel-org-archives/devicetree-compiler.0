From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v8 5/5] Build pylibfdt as part of the normal build process
Date: Tue, 28 Feb 2017 22:34:15 -0700
Message-ID: <20170301053415.5388-6-sjg@chromium.org>
References: <20170301053415.5388-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PWjRjddCQoKBMtlXeAwtQChFmRppyZXytdKRr7/W8Bg=;
        b=t4P0vNuMH8izNA+i/T1TecTXnXG+4DiAt9/W8i4wAUM/ya6hatABqUSzRdNXIGw2ZQ
         ACsi0kjbzqKUhaLFjBlQvxjBPVpjrIXSBBdWZEe6D9UqflCI5JEOKrPv6E/OorQCwMM5
         5Q2i834bjP1zl50k2mo9BGAnn/QRuSZNflQpCdbV5xc5pH6+fGjbq1+dntcMJzkqhxpA
         VZIKA8aiSnhjxHu+ZA1/nmmh27WRoI1jB3qoHlgqiKRTblbk40waXys7GK+ZRPr2o/BW
         3+pB8c9FMkbBzWLX8tZgMyRt5clrLHUZKyeMMjodOfgRQJ0u4x2h7HrKzVWR8UBoYqII
         ZQMw==
In-Reply-To: <20170301053415.5388-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Possibly this needs to be made optional. For now just hook it up.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v8:
- Only build pylibfdt if we have swig and Python.h

Changes in v7: None
Changes in v6: None
Changes in v5:
- Fix 'possible' typo

Changes in v4: None
Changes in v3: None
Changes in v2: None

 Makefile | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1c48210..7a4304d 100644
--- a/Makefile
+++ b/Makefile
@@ -116,7 +116,21 @@ BIN += fdtput
 
 SCRIPTS = dtdiff
 
-all: $(BIN) libfdt
+# We need both Python and swig to build pylibfdt.
+.PHONY: maybe_pylibfdt
+maybe_pylibfdt: FORCE
+	if pkg-config --cflags python >/dev/null 2>&1; then \
+		if which swig >/dev/null; then \
+			can_build=yes; \
+		fi; \
+	fi; \
+	if [ "$$can_build" == "yes" ]; then \
+		$(MAKE) pylibfdt; \
+	else \
+		echo "Please install python-dev and swig to build pylibfdt"; \
+	fi
+
+all: $(BIN) libfdt maybe_pylibfdt
 
 
 ifneq ($(DEPTARGETS),)
@@ -203,6 +217,19 @@ dist:
 	cat ../dtc-$(dtc_version).tar | \
 		gzip -9 > ../dtc-$(dtc_version).tar.gz
 
+
+#
+# Rules for pylibfdt
+#
+PYLIBFDT_srcdir = pylibfdt
+PYLIBFDT_objdir = pylibfdt
+
+include $(PYLIBFDT_srcdir)/Makefile.pylibfdt
+
+.PHONY: pylibfdt
+pylibfdt: $(PYLIBFDT_objdir)/_libfdt.so
+
+
 #
 # Release signing and uploading
 # This is for maintainer convenience, don't try this at home.
@@ -247,6 +274,7 @@ STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
 clean: libfdt_clean tests_clean
 	@$(VECHO) CLEAN
 	rm -f $(STD_CLEANFILES)
+	rm -f $(PYLIBFDT_CLEANFILES)
 	rm -f $(VERSION_FILE)
 	rm -f $(BIN)
 	rm -f dtc-*.tar dtc-*.tar.sign dtc-*.tar.asc
-- 
2.12.0.rc1.440.g5b76565f74-goog
