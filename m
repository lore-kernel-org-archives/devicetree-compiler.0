From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 4/4] RFC: Build pylibfdt as part of the normal build process
Date: Thu, 24 Nov 2016 11:07:22 -0700
Message-ID: <1480010842-13957-5-git-send-email-sjg@chromium.org>
References: <1480010842-13957-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gKjJ1tP7DNTI46KRpHzaPkSGHHPWxRxVxWrNkfVG2Jc=;
        b=IZJVOHSaFhFfCRuOgK32sm+3vxTw16FUvbc9+0hS080rejRwdBDm9YWeBeIiJZrUF9
         RlVIBs5rtrk6f7/6VtCkb4fv+ybXn8dcjR0xjaa8YfMl95ptzCc+n73REnKk4YOo0fRr
         5Q4lUYFOVk8bx9tLzJEp4A4DbKYUuuFFW9HdcO8il7U0q0qgTXBqfhHBBry6AMwDDeyr
         5EzIc7652HOpW9iNsMSSjhrqzHlVtOGrW5Mg80XjP/teI5/q7iJtDCda4joTjudZg940
         cluyrzJcf2Ms48OTmJxSi1KOQiVHtOVpO2267UKkPrSerQR7nE0G3CIIpbCdhDy7GZHF
         Cd2Q==
In-Reply-To: <1480010842-13957-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Possible this needs to be made optional. For now just hook it up.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2: None

 Makefile | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 32dcfcf..4996cfd 100644
--- a/Makefile
+++ b/Makefile
@@ -115,7 +115,7 @@ BIN += fdtput
 
 SCRIPTS = dtdiff
 
-all: $(BIN) libfdt
+all: $(BIN) libfdt pylibfdt
 
 
 ifneq ($(DEPTARGETS),)
@@ -202,6 +202,19 @@ dist:
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
@@ -240,6 +253,7 @@ STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
 clean: libfdt_clean tests_clean
 	@$(VECHO) CLEAN
 	rm -f $(STD_CLEANFILES)
+	rm -f $(PYLIBFDT_CLEANFILES)
 	rm -f $(VERSION_FILE)
 	rm -f $(BIN)
 	rm -f dtc-*.tar dtc-*.tar.sign dtc-*.tar.asc
-- 
2.8.0.rc3.226.g39d4020
