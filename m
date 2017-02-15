From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 5/5] Build pylibfdt as part of the normal build process
Date: Tue, 14 Feb 2017 20:52:00 -0700
Message-ID: <20170215035200.29934-6-sjg@chromium.org>
References: <20170215035200.29934-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JCKKJDIAWesFpN4QGWullo+hcOY/PCWWMAHTmiC8Q0M=;
        b=CykPR9MwcUbofMNPtXh6DH1CrliHFnqJqANlbcWtIfkrs/9f3+qK7PpnyttJeMmZ4M
         MLgnoEuKQpe8jfdNhEalK1f+fFL7pn/MvSMIHMRUB/rh1KBTzSpQqBPaLuxZCPJ2sOP9
         YI/S+rl6Zj0M4yzQ+i7HaBLmPX6lpZ5yPMklyhkB7sEbGLhwywclI1B5l6qcBr2NfTES
         OuxPzEPGhAeZh0dpr8JTMwyqfb99qp2Zv7z18WYYRUs4gZfoQIL7xDMqlZ0dmt/7QTer
         OOEnUwywiixv6kFdwAyUIGi5rDBkK/7DvU5lNbuGsN2ehM7IJahDjnMTIn6MnAMzySi9
         Wa3Q==
In-Reply-To: <20170215035200.29934-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v5:
- Fix 'possible' typo

Changes in v4: None
Changes in v3: None
Changes in v2: None

 Makefile | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1c48210..4adba10 100644
--- a/Makefile
+++ b/Makefile
@@ -116,7 +116,7 @@ BIN += fdtput
 
 SCRIPTS = dtdiff
 
-all: $(BIN) libfdt
+all: $(BIN) libfdt pylibfdt
 
 
 ifneq ($(DEPTARGETS),)
@@ -203,6 +203,19 @@ dist:
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
@@ -247,6 +260,7 @@ STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
 clean: libfdt_clean tests_clean
 	@$(VECHO) CLEAN
 	rm -f $(STD_CLEANFILES)
+	rm -f $(PYLIBFDT_CLEANFILES)
 	rm -f $(VERSION_FILE)
 	rm -f $(BIN)
 	rm -f dtc-*.tar dtc-*.tar.sign dtc-*.tar.asc
-- 
2.11.0.483.g087da7b7c-goog
