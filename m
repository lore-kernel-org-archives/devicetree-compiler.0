From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/7] pylibfdt: Use package_dir to set the package directory
Date: Sun, 26 Mar 2017 13:06:20 -0600
Message-ID: <20170326190623.27518-5-sjg@chromium.org>
References: <20170326190623.27518-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=24xhZUpG3/tLQURaR2Mcn8p2gtQtG1epGbg2S/nol5Q=;
        b=I2Q2MUf+nINn1MpPDOFMGIkpx73TZ+gOPhwVutw2mvCJTW3IjEDQtu9Q/1Fqf26hVF
         4eMFpHxkvljUNWDObKWGlf4V7EDECMZ/Pk1wDow/MoHxiY9Cxndw2XhMQ9aCt4uOOraD
         BkpfLTei/X3sMvxwYzwQc8u9MhIm8dRrPvNchx62BYtOCPiG2296lKcIA+OPqnqMTuXO
         mTl3N9kgdRTHt5DtD9RYdFBDsBonX75PNuUYnQ3YoO8xFsTfHhzHWkZwBbPaNqDuWohp
         uLkUyv0fxbaKkQYPPG2F/K1ffzAHGljMsNXj73opPjY96MAypY+p9cCD9m1aTkSJruM7
         /d7w==
In-Reply-To: <20170326190623.27518-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

At present we manually move _libfdt.so into the correct place. Provide a
package directory so we can avoid needing to do this.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 pylibfdt/Makefile.pylibfdt | 3 +--
 pylibfdt/setup.py          | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 3d99fd4..861e67c 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -7,9 +7,8 @@ PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
 
 $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
 	@$(VECHO) PYMOD $@
-	SOURCES="$^" CPPFLAGS="$(CPPFLAGS)" \
+	SOURCES="$^" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)" \
 	python $(PYLIBFDT_objdir)/setup.py --quiet build_ext --inplace
-	mv _libfdt.so $(PYMODULE)
 
 $(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
 	@$(VECHO) SWIG $@
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index e45f110..ef6e2c0 100644
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -5,6 +5,7 @@ setup.py file for SWIG libfdt
 
 Files to be built into the extension are provided in SOURCES
 C flags to use are provided in CPPFLAGS
+Object file directory is provided in OBJDIR
 """
 
 from distutils.core import setup, Extension
@@ -14,6 +15,7 @@ import sys
 progname = sys.argv[0]
 files = os.environ['SOURCES'].split()
 cflags = os.environ['CPPFLAGS'].split()
+objdir = os.environ['OBJDIR']
 
 libfdt_module = Extension(
     '_libfdt',
@@ -26,5 +28,6 @@ setup (name = 'libfdt',
        author      = "Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>",
        description = """Python binding for libfdt""",
        ext_modules = [libfdt_module],
+       package_dir = {'': objdir},
        py_modules = ["libfdt"],
        )
-- 
2.12.1.578.ge9c3154ca4-goog
