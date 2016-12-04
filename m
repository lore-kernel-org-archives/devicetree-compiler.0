From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 4/4] Build pylibfdt as part of the normal build process
Date: Sat,  3 Dec 2016 17:48:10 -0700
Message-ID: <1480812490-11926-5-git-send-email-sjg@chromium.org>
References: <1480812490-11926-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6/TaoH4hT+lCEFnLXQRvOS7ygrehT4G3/zuZslapIWw=;
        b=Ds1UcsOliUSNKTQPpBd3MFFSmmZG7gg1/HVarQkumOW9aXx3jgfyEzZ8GP9Fcwi8z/
         HoSfwUf8PstgSPSa1ARh2PFgUw2oWvzV2IhLvL7PVgw/wWhDEBy2Q5YCXV7bTFap0I/9
         TKJBDteAqzj9h3eqesZiFl98kxioE+lnvx/EdykixAOcFAOpVBTR0LmM+q+OhjnVvUnb
         LvoIE/PkMqvCBL1jAbvXf7DRFT0C0i0Kqwn8OhghPE9rMzk5JyA9vI8puAvbBYyVxnWj
         40UeU6dj8bMl0axrRd1LSJk7+Gyl7lA7MS+Nld6C1IbsVNOmzBWFLRjfjF5o9l+CsJOW
         5ugg==
In-Reply-To: <1480812490-11926-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v3: None
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
