From: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Makefile: Fix build on MSYS2 and Cygwin
Date: Fri, 28 Apr 2017 12:26:09 -0500
Message-ID: <1493400369-7467-1-git-send-email-andy.gross@linaro.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=fE3MHBBgzDgUG9s/lULqA8cXkCPIRumg6Y3V3vf/r88=;
        b=WdfeSig4UltIFw4CcaEFF0jAVBgCQp5tqvgRzl26KSYTUdbhCv51qUniWNAPLRk2XG
         234a8DVOdjbLLCvT3pmlylR8PBVyAPf+FTTwte+xmyd1/2EYdwavLizhgNQKgSLxJhbH
         4Ipr3MIdNnObUDOMvr8RSzYuYgoYFtGrzpWho=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Carles Cuf <carles.cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>

From: Carles Cuf <carles.cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>

The host compiler on MSYS2 and Cygwin does not allow the -fPIC option,
issuing a warning that is treated as an error and stops the build.
Detect whether we're running under MSYS2 or Cygwin and avoid adding
-fPIC to prevent the error from happening.

Signed-off-by: Carles Cufi <carles.cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
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
1.9.1
