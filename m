From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 3/6] pylibfdt: Use the correct libfdt version in the module
Date: Wed, 29 Mar 2017 12:15:38 -0600
Message-ID: <20170329181541.28856-4-sjg@chromium.org>
References: <20170329181541.28856-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iJkCKML0VIRPPVDIgh31Z/Ee89Qc6nlTcZ0PTxPHX1E=;
        b=tMTfODCxnABnU5aLnZvx2q0T9AM76OL8Mt3VvGNdnvBAEmqWqYS6Sc/m9f8VeZaV7l
         mEOrKZvievAyycK8HlEUfAPzBmNc2AexwCCRdY0P2iuELIQxb0iffZbjujbyqHdFw9Pz
         1XlW7CdlDG0yvR77xxk52tcb/XkyONmWXa/LpkRPX8g5EswBZdVnWcqATE2oTBMRAlpV
         YTtIwHEkZu3XvMfJWq/YXmG6P4ITQrCVsKAtaynSMPdcfut++Ar9PTPWINnATVkQNQm1
         evimS/7AHYlTyFrlvhd9u5FghwK8oAaqQW08creNiWuD3Scz/qTYxUJDdEID1oJZCJOQ
         YJmA==
In-Reply-To: <20170329181541.28856-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v2:
- Add a comment about the VERSION environment variable

 pylibfdt/Makefile.pylibfdt | 3 ++-
 pylibfdt/setup.py          | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index ef6e2c0..9f87fe9 100644
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -6,6 +6,7 @@ setup.py file for SWIG libfdt
 Files to be built into the extension are provided in SOURCES
 C flags to use are provided in CPPFLAGS
 Object file directory is provided in OBJDIR
+Version is provided in VERSION
 """
 
 from distutils.core import setup, Extension
@@ -16,6 +17,7 @@ progname = sys.argv[0]
 files = os.environ['SOURCES'].split()
 cflags = os.environ['CPPFLAGS'].split()
 objdir = os.environ['OBJDIR']
+version = os.environ['VERSION']
 
 libfdt_module = Extension(
     '_libfdt',
@@ -24,7 +26,7 @@ libfdt_module = Extension(
 )
 
 setup (name = 'libfdt',
-       version = '0.1',
+       version = version,
        author      = "Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>",
        description = """Python binding for libfdt""",
        ext_modules = [libfdt_module],
-- 
2.12.2.564.g063fe858b8-goog
