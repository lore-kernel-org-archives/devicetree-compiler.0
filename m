From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 5/6] pylibfdt: Rename libfdt.swig to libfdt.i
Date: Wed, 29 Mar 2017 12:15:40 -0600
Message-ID: <20170329181541.28856-6-sjg@chromium.org>
References: <20170329181541.28856-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3fOjzrrRWpiQcgO5Qg5FsNhSawv2Z6ghiMXWFj+pefw=;
        b=peXQ9N7psRa+/MtXYhwD5iOXJQ0iAsFg1b0tJflsOI2uXrh1X/ITqKTNUBhfgm8E4m
         96wcMBKjmGQDWHV7mbYC5rCPv+GefnwK0ABhfaMJtPKegeYmxkPurTFowhGOmuV6SL12
         qAzNzRvS0bTa87DaA6LvSUU9WOu1/GYU7SKDlGL4wKQAX7rqWU+5l4c59XkQevPjXJ/R
         Fv1YK0ncUQ0/fFs8xYm4vfMzCZ1JULgPfSR2FYCrd0QyaSyLQ3eaESDDR4pPnM+RwiLN
         ZxASBUvpywN4iJkbu/rra+QgQjOcRgPJ+PBuVV4Kov6UhNBekaqzRsQBydRQOjjAH61w
         2izw==
In-Reply-To: <20170329181541.28856-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The .i extension allows Python distutils to automatically handle the swig
file. Rename it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2:
- Add new patch to rename libfdt.swig to libfdt.i

 pylibfdt/Makefile.pylibfdt         | 2 +-
 pylibfdt/{libfdt.swig => libfdt.i} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename pylibfdt/{libfdt.swig => libfdt.i} (100%)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 0d95c11..06f9296 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -13,7 +13,7 @@ $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
 	@$(VECHO) PYMOD $@
 	$(call run_setup, $^, build_ext --inplace)
 
-$(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
+$(WRAP): $(PYLIBFDT_srcdir)/libfdt.i
 	@$(VECHO) SWIG $@
 	$(SWIG) -python -o $@ $<
 
diff --git a/pylibfdt/libfdt.swig b/pylibfdt/libfdt.i
similarity index 100%
rename from pylibfdt/libfdt.swig
rename to pylibfdt/libfdt.i
-- 
2.12.2.564.g063fe858b8-goog
