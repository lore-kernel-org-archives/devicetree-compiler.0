From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/7] pylibfdt: Use environment to pass C flags and files
Date: Sun, 26 Mar 2017 13:06:19 -0600
Message-ID: <20170326190623.27518-4-sjg@chromium.org>
References: <20170326190623.27518-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EPq4lheiaq2k8nCAVl+hxENnt++r91dmj8RCsTt79SE=;
        b=jhg7CDGqdBwSsvifMNYjbQmvHnJmU8KO4pmV56zmifXz/vG3JRiSakMHBrO3vyvYwp
         HW8ZFhA+LEbGSlN6xaTLt5/g3PLtBMSp6mA71pgaCEdVjWAzxKpeE+d645iCWsGNE1ML
         kDovohXY0L4kTG/9pgMnR2cNmX3S7wudgZKvCYEK8KWHzkZKNI+31R35kskAooN/cBps
         Fw+zizUnSVXfxO9gIju3Hdxh9X6JDbOEBL+NzSDTmlCcOn6673LZ2pS3HWfPYpYHCQlQ
         IBleTpsWYcgMqWUHe/gNE1V5GA5ShHNI6TuHOyNsMKOp3jBL/glTf9K77UmyACubiAJN
         8pDA==
In-Reply-To: <20170326190623.27518-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

At present setup.py adjusts its command line when running, so that the
C flags and file list can be passed as arguments. Pass them in environment
variables instead, so we can avoid this messiness. It also allows us to
support the 'install' command.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 pylibfdt/Makefile.pylibfdt |  3 ++-
 pylibfdt/setup.py          | 16 ++++++----------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
index 0d8c010..3d99fd4 100644
--- a/pylibfdt/Makefile.pylibfdt
+++ b/pylibfdt/Makefile.pylibfdt
@@ -7,7 +7,8 @@ PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
 
 $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
 	@$(VECHO) PYMOD $@
-	python $(PYLIBFDT_objdir)/setup.py "$(CPPFLAGS)" $^
+	SOURCES="$^" CPPFLAGS="$(CPPFLAGS)" \
+	python $(PYLIBFDT_objdir)/setup.py --quiet build_ext --inplace
 	mv _libfdt.so $(PYMODULE)
 
 $(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index 0ff160c..e45f110 100644
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -2,6 +2,9 @@
 
 """
 setup.py file for SWIG libfdt
+
+Files to be built into the extension are provided in SOURCES
+C flags to use are provided in CPPFLAGS
 """
 
 from distutils.core import setup, Extension
@@ -9,22 +12,15 @@ import os
 import sys
 
 progname = sys.argv[0]
-cflags = sys.argv[1]
-files = sys.argv[2:]
-
-if cflags:
-    cflags = [flag for flag in cflags.split(' ') if flag]
-else:
-    cflags = None
+files = os.environ['SOURCES'].split()
+cflags = os.environ['CPPFLAGS'].split()
 
 libfdt_module = Extension(
     '_libfdt',
     sources = files,
-    extra_compile_args =  cflags
+    extra_compile_args = cflags
 )
 
-sys.argv = [progname, '--quiet', 'build_ext', '--inplace']
-
 setup (name = 'libfdt',
        version = '0.1',
        author      = "Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>",
-- 
2.12.1.578.ge9c3154ca4-goog
