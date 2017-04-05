From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/5] pylibfdt: Rename libfdt.swig to libfdt.i
Date: Wed,  5 Apr 2017 10:01:38 -0600
Message-ID: <20170405160142.10564-2-sjg@chromium.org>
References: <20170405160142.10564-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SF1F6VQebeS+pzfnW7Af/W4LmWlLahg3VEFk9h2bC+M=;
        b=J8Rp4l59k0N1Ff5+0gUMQseUdJwwuB7b3cQwVHf/Xc5bMrFzN5iLRMMiZ7TqxF6e8J
         E2dXKgV5GWbTcX/HwJda9/isLNZfHbPYofNdrwSAd6HaXC99YnYLtsHyY323ZMvBL1PO
         UT+j8zrspK11WPOnRxP8oWVuJ8MsF0wouYnqFQRYstVPm+MJ3v2EnsiOU6rOl1bbxwA9
         ZygMTa5dcxzepIGj6l/xSLDVXzT5norx9rhHLgC+6O2uDaif7I3/rAPV6+9MDMLJ7U1n
         zaeeXnUdZ6Ia6R6sQ+ETNGrnac9A3iF5//XTCYgeesUJJNQS0aSJNsxILgHYvm68BYMn
         CAig==
In-Reply-To: <20170405160142.10564-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Suggested-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---

Changes in v3: None
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
2.12.2.715.g7642488e1d-goog
