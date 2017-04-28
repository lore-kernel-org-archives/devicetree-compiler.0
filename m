From: Carles Cufi <carles.cufi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Makefile: Fix build on MSYS2 and Cygwin
Date: Fri, 28 Apr 2017 11:12:55 +0200
Message-ID: <20170428091255.9543-1-carles.cufi@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=aPvUBU656Sj0JhM9L3qbDcpqs3lmpKo5czWx2aNf92g=;
        b=LzB7M7PqPFTwbM5s83Vo4y1NYE56xssm8MLmh4rQ6QOfdDlYrL2We4T2psi+xPC50v
         4msGt0Rxn9hrOJDVap0vF/i1me/PDQkp2vAp9gzgKsMwYS5zI9ZE6vQyPEoBduM3vUa4
         ixyeWfTJ1IYfxtXuCmPUdiqXe7FDJ4KO/nNmbc0ZuvdzdOAumL34ut5s8CVLGfHhY6sD
         xh2A71JwWxzD+HWxukGHHaHoavn4XLGuCWcnb5zWOcvKWQ3Zqf6vl3CrgUERXI1Epe3d
         VxKggFKQa4Gaqdm70Xj3TS2os91wgexGBVr2wo3CQicW14EGgCA6JSovT/BEYrqqGhjL
         HagQ==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Carles Cufi <carles.cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>

The host compiler on MSYS2 and Cygwin does not allow the -fPIC option,
issuing a warning that is treated as an error and stops the build.
Detect whether we're running under MSYS2 or Cygwin and avoid adding
-fPIC to prevent the error from happening.

Signed-off-by: Carles Cufi <carles.cufi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Makefile | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index beca4a0..62fb9b8 100644
--- a/Makefile
+++ b/Makefile
@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
 CPPFLAGS = -I libfdt -I .
 WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
+CFLAGS = -g -Os -Werror $(WARNINGS)
 
 BISON = bison
 LEX = flex
@@ -33,7 +33,12 @@ LIBDIR = $(PREFIX)/lib
 INCLUDEDIR = $(PREFIX)/include
 
 HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
-	    sed -e 's/\(cygwin\).*/cygwin/')
+		sed -e 's/\(cygwin\|msys\).*/\1/')
+
+ifneq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin))
+CFLAGS += -fPIC
+LDFLAGS += -fPIC
+endif
 
 ifeq ($(HOSTOS),darwin)
 SHAREDLIB_EXT=dylib
@@ -330,7 +335,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
 
 $(LIBFDT_lib):
 	@$(VECHO) LD $@
-	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_soname) -o $(LIBFDT_lib) $^
+	$(CC) $(LDFLAGS) $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_soname) -o $(LIBFDT_lib) $^
 
 %.lex.c: %.l
 	@$(VECHO) LEX $@
-- 
2.9.3
