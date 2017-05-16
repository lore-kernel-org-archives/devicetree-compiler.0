From: "Cufi, Carles" <Carles.Cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Subject: [PATCH v2] Makefile: Fix build on MSYS2 and Cygwin
Date: Tue, 16 May 2017 08:30:45 +0000
Message-ID: <cd57ad6bd43f413eafdef078cc895432@nordicsemi.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The host compiler on MSYS2 and Cygwin does not allow the -fPIC option,
issuing a warning that is treated as an error and stops the build.
Detect whether we're running under MSYS2 or Cygwin and avoid adding
-fPIC to prevent the error from happening.

Signed-off-by: Carles Cufi <carles.cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
---
 Makefile | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index beca4a0..7ac343d 100644
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
@@ -33,14 +33,19 @@ LIBDIR = $(PREFIX)/lib
 INCLUDEDIR = $(PREFIX)/include
 
 HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
-	    sed -e 's/\(cygwin\).*/cygwin/')
+		sed -e 's/\(cygwin\|msys\).*/\1/')
+
+ifneq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin))
+COMPILE_OPTIONS += -fPIC
+SHAREDLIB_LINK_OPTIONS += -fPIC
+endif
 
 ifeq ($(HOSTOS),darwin)
 SHAREDLIB_EXT=dylib
-SHAREDLIB_LINK_OPTIONS=-dynamiclib -Wl,-install_name -Wl,
+SHAREDLIB_LINK_OPTIONS +=-dynamiclib -Wl,-install_name -Wl,
 else
 SHAREDLIB_EXT=so
-SHAREDLIB_LINK_OPTIONS=-shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
+SHAREDLIB_LINK_OPTIONS +=-shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
 endif
 
 #
@@ -302,7 +307,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
 
 %.o: %.c
 	@$(VECHO) CC $@
-	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(COMPILE_OPTIONS) -o $@ -c $<
 
 %.o: %.S
 	@$(VECHO) AS $@
@@ -322,7 +327,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
 
 %.s:	%.c
 	@$(VECHO) CC -S $@
-	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -S $<
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(COMPILE_OPTIONS) -o $@ -S $<
 
 %.a:
 	@$(VECHO) AR $@
@@ -330,7 +335,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
 
 $(LIBFDT_lib):
 	@$(VECHO) LD $@
-	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_soname) -o $(LIBFDT_lib) $^
+	$(CC) $(LDFLAGS) $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_soname) -o $(LIBFDT_lib) $^
 
 %.lex.c: %.l
 	@$(VECHO) LEX $@
-- 
2.9.3
