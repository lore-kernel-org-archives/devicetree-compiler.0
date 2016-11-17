From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/4] RFC: Build pylibfdt as part of the normal build process
Date: Thu, 17 Nov 2016 15:53:25 -0700
Message-ID: <1479423205-9817-5-git-send-email-sjg@chromium.org>
References: <1479423205-9817-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=V7G6/6/iq1AlYRZuM0mTBoMthm9P1K8/uVi8uGu4Xmw=;
        b=mTbqVlZLiO1om7j1KLbsPw9ZtFcNR9CJE1y7KgiGJ1Pccre3EjpN1ybK+BM9RGZU9f
         konEkUZ0meF1/v1+mVRxxiavPilKdtFAbE7sz6/dhTiSvJUFMDJ1M5Pw00TXIgRcPTHG
         eN2ji7zwcHC8Rjey5q40RtnR7+fRfy/QyqbS4mqLjf4pui1uiBv6oB8RlTJoAzE/9Kt9
         iomULKXjrBuhmMKww2qXYFBS5cA0NeYQNxtFNAity7s3OtXbZS2+cGMf0UQGW5sVSQU9
         yLrKyRwXo2CsbJUO6y4BKsrV3DOh3PfqCq4t3K01E5UFmighW1T4Z7CYShEFVq1GaJ4V
         o8hQ==
In-Reply-To: <1479423205-9817-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Possible this needs to be made optional. For now just hook it up.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

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
