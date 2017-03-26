From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 7/7] pylibfdt: Use the call function to simplify the Makefile
Date: Sun, 26 Mar 2017 13:06:23 -0600
Message-ID: <20170326190623.27518-8-sjg@chromium.org>
References: <20170326190623.27518-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VduIONCVcks+iz1ky6Lfvm5P+SWRVql4C0zHqUPZ8pY=;
        b=nHOjptquNiPfUw3vCCMyZikJ6lT8LlyciYwFx8PCSGAtYWZ4tIVA3notpXi1pm2IW8
         2MyuoCEk/ffykiGsBuS1XHXE/EhWqZZKUlvAQzv6r8RVy3SenpaY+FXur1/GQejH7d+U
         51emvPzQyBzIIsKp0KquQpd8/Pf34DRQwgwgzTPVmwigPHAvpDGXO8oFTKDMPp8HqkV2
         igEU2t7tPLHod0ytlVlk0ao4j7T+QyNQ1BS7ifocMitcMVJTJK4NTXSxhLk8Cr13zRo+
         rgNdf2bvcEw+CEE111jGKevEvde+tRRguY2N0OxGkCoG7MROBmz0oJ48RDykdcfn++il
         44yA==
In-Reply-To: <20170326190623.27518-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This is in a separate patch since I not sure if GNU make features
are permitted in the Makefile.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 pylibfdt/Makefile.pylibfdt | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index a74cd30..0d95c11 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -5,11 +5,13 @@ PYLIBFDT_srcs = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_SRCS))
 WRAP = $(PYLIBFDT_objdir)/libfdt_wrap.c
 PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
 
+run_setup = SOURCES="$(1)" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)" \
+	VERSION="$(dtc_version)" \
+	python $(PYLIBFDT_objdir)/setup.py --quiet $(2)
+
 $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
 	@$(VECHO) PYMOD $@
-	SOURCES="$^" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)" \
-	VERSION="$(dtc_version)" \
-	python $(PYLIBFDT_objdir)/setup.py --quiet build_ext --inplace
+	$(call run_setup, $^, build_ext --inplace)
 
 $(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
 	@$(VECHO) SWIG $@
@@ -17,10 +19,8 @@ $(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
 
 install_pylibfdt: $(WRAP) $(PYMODULE)
 	$(VECHO) INSTALL-PYLIB; \
-	SOURCES="$(PYLIBFDT_srcs) $(WRAP)" CPPFLAGS="$(CPPFLAGS)" \
-	OBJDIR="$(PYLIBFDT_objdir)" VERSION="$(dtc_version)" \
-	python $(PYLIBFDT_objdir)/setup.py --quiet install \
-		$(if $(SETUP_PREFIX),--prefix=$(SETUP_PREFIX))
+	$(call run_setup, $(PYLIBFDT_srcs) $(WRAP), \
+		install $(if $(SETUP_PREFIX),--prefix=$(SETUP_PREFIX)))
 
 maybe_install_pylibfdt:
 	if [ -e $(PYMODULE) ]; then \
-- 
2.12.1.578.ge9c3154ca4-goog
