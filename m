From: "Cufi, Carles" <Carles.Cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Subject: [PATCH v3] Makefile: Fix build on MSYS2 and Cygwin
Date: Fri, 19 May 2017 08:59:45 +0000
Message-ID: <fbfcae5e928349259253031367f5217c@nordicsemi.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The host compiler on MSYS2 and Cygwin does not allow the -fPIC option,
issuing a warning that is treated as an error and stops the build.
Detect whether we're running under MSYS2 or Cygwin and avoid adding
-fPIC to prevent the error from happening.

Signed-off-by: Carles Cufi <carles.cufi-PJhPDxyh5AhSHonuZl5R5Q@public.gmane.org>
---
 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7fa2be8..0688dcf 100644
--- a/Makefile
+++ b/Makefile
@@ -33,17 +33,22 @@ LIBDIR = $(PREFIX)/lib
 INCLUDEDIR = $(PREFIX)/include
 
 HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
-	    sed -e 's/\(cygwin\).*/cygwin/')
+	    sed -e 's/\(cygwin\|msys\).*/\1/')
 
 ifeq ($(HOSTOS),darwin)
 SHAREDLIB_EXT     = dylib
 SHAREDLIB_CFLAGS  = -fPIC
 SHAREDLIB_LDFLAGS = -fPIC -dynamiclib -Wl,-install_name -Wl,
 else
+ifeq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin))
+SHAREDLIB_EXT     = so
+SHAREDLIB_LDFLAGS = -shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
+else
 SHAREDLIB_EXT     = so
 SHAREDLIB_CFLAGS  = -fPIC
 SHAREDLIB_LDFLAGS = -fPIC -shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
 endif
+endif
 
 #
 # Overall rules
-- 
2.9.3
