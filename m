From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 5/5] Build pylibfdt as part of the normal build process
Date: Sun,  5 Feb 2017 13:13:23 -0700
Message-ID: <20170205201323.15411-6-sjg@chromium.org>
References: <20170205201323.15411-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lzQY0C7fiOWqqFT9jCwPMMpN/GquqzVX96eD8PgW+QM=;
        b=MC5e3YXpJJJ5S7IqRcBAMc1FBe4Ui5cEB81Br5bdjKZuUl0IYqaIKpxebkFyHrzkKK
         3X6DNdolQDzPpLxGMVd7Qpe8SSzOoQHtAQkJXcoIoVhq5rxkTatDHAR36/EmNVe+uiXp
         L6XDEmxVN00dUBfYRNZYa4vSp+wv0rWaaiPpUoCXnRu3CP6oUElSBx5hq4qpv84s2b+4
         8KVK+g/y/82g7QAv+Hmx8KVYPNd17a0Ka/6icDsPDDSF2wZTJUkxRWFrEQT4ne6LOMCy
         Vp9fzzxZVMFRnWgh8a1hHFBd7kNkQXgexGeG8WcgGFDs5Zw2B8w3agAQIO66ALQFZsxa
         kucg==
In-Reply-To: <20170205201323.15411-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v4: None
Changes in v3: None
Changes in v2: None

 Makefile | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ce05eba..c516d9f 100644
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
@@ -246,6 +259,7 @@ STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
 clean: libfdt_clean tests_clean
 	@$(VECHO) CLEAN
 	rm -f $(STD_CLEANFILES)
+	rm -f $(PYLIBFDT_CLEANFILES)
 	rm -f $(VERSION_FILE)
 	rm -f $(BIN)
 	rm -f dtc-*.tar dtc-*.tar.sign dtc-*.tar.asc
-- 
2.11.0.483.g087da7b7c-goog
