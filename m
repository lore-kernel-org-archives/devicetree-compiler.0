From: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Subject: [PATCH] Makefile.tests: Add LIBDL make(1) variable for portability sake
Date: Wed,  3 Jan 2018 22:30:13 -0600
Message-ID: <20180104043013.97083-1-kevans@FreeBSD.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

Some platforms (many, if not all, of the *BSD projects) do not provide a libdl,
and instead provide the same functionality in libc. Instead of forcing these
platforms to patch out the link against libdl, add a LIBDL make(1) variable to
allow the -ldl argument to be excluded easily via make(1) arguments.

Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
---
 tests/Makefile.tests | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 2258135..262944a 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -54,9 +54,12 @@ tests:	$(TESTS) $(TESTS_TREES)
 
 $(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_archive)
 
+# Not necessary on all platforms; allow -ldl to be excluded instead of forcing
+# other platforms to patch it out.
+LIBDL = -ldl
 $(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_archive)
 	@$(VECHO) LD [libdl] $@
-	$(LINK.c) -o $@ $^ -ldl
+	$(LINK.c) -o $@ $^ $(LIBDL)
 
 $(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o \
 		util.o $(LIBFDT_archive)
-- 
2.15.1
