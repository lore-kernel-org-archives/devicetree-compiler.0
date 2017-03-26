From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 6/7] pylibfdt: Use the correct libfdt version in the module
Date: Sun, 26 Mar 2017 13:06:22 -0600
Message-ID: <20170326190623.27518-7-sjg@chromium.org>
References: <20170326190623.27518-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kcJW5jcY1Mr8+U7U00KcPrNGFHoFkeilonWli2y9N64=;
        b=VWgfMge0EoSQv0hbRKE8c7yb6ljxA6rh0elvH+PJYwf+esUd6rc6ckOHNQOaSY61n2
         yyV+MXZjodVYzH8vJV5ZTUEavt2IAqiGu2djrM4ELThFys2R2gp/FNPv+Vmtv+Lfg1C6
         vQV/qK+pKI7o5hlc4t4SOVhiFnt/H+KqZ0cTsrOi8o2FhiFcz9W8WMgl99PEsnLPbug7
         4h389G7XhNIACEdEUGOXi/L6iTFYMr1AOVzQYAwsDJIFP2pdc4tRARXEdlqTYoVGddnf
         BKIg+b0xarnXqko3gXetCzLF2Ilhc0z6dmaFwPpTHhCN1fucW4oVXItd136/qKSSHY2M
         LJ3Q==
In-Reply-To: <20170326190623.27518-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Use the same version number in the module as with the rest of libfdt. This
can be examined with:

   import pkg_resources
   print pkg_resources.require('libfdt')[0].version

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 pylibfdt/Makefile.pylibfdt | 3 ++-
 pylibfdt/setup.py          | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index a0271da..a74cd30 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -8,6 +8,7 @@ PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
 $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
 	@$(VECHO) PYMOD $@
 	SOURCES="$^" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)" \
+	VERSION="$(dtc_version)" \
 	python $(PYLIBFDT_objdir)/setup.py --quiet build_ext --inplace
 
 $(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
@@ -17,7 +18,7 @@ $(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
 install_pylibfdt: $(WRAP) $(PYMODULE)
 	$(VECHO) INSTALL-PYLIB; \
 	SOURCES="$(PYLIBFDT_srcs) $(WRAP)" CPPFLAGS="$(CPPFLAGS)" \
-	OBJDIR="$(PYLIBFDT_objdir)" \
+	OBJDIR="$(PYLIBFDT_objdir)" VERSION="$(dtc_version)" \
 	python $(PYLIBFDT_objdir)/setup.py --quiet install \
 		$(if $(SETUP_PREFIX),--prefix=$(SETUP_PREFIX))
 
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index ef6e2c0..3bafe30 100644
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -16,6 +16,7 @@ progname = sys.argv[0]
 files = os.environ['SOURCES'].split()
 cflags = os.environ['CPPFLAGS'].split()
 objdir = os.environ['OBJDIR']
+version = os.environ['VERSION']
 
 libfdt_module = Extension(
     '_libfdt',
@@ -24,7 +25,7 @@ libfdt_module = Extension(
 )
 
 setup (name = 'libfdt',
-       version = '0.1',
+       version = version,
        author      = "Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>",
        description = """Python binding for libfdt""",
        ext_modules = [libfdt_module],
-- 
2.12.1.578.ge9c3154ca4-goog
