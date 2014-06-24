From: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Subject: [PATCH 1/2] Only wipeout *.test.dtb
Date: Tue, 24 Jun 2014 13:33:41 -0500
Message-ID: <1403634821-7554-1-git-send-email-jack@codezen.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Keep make clean from deleting all root .dtbs
---
 tests/Makefile.tests | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 9adedec..7020a02 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -41,7 +41,7 @@ TESTS_TARGETS = $(TESTS) $(TESTS_TREES)
 TESTS_DEPFILES = $(TESTS:%=%.d) \
 	$(addprefix $(TESTS_PREFIX),testutils.d trees.d dumptrees.d)
 
-TESTS_CLEANFILES_L =  *.output vglog.* vgcore.* *.dtb *.test.dts *.dtsv1 tmp.*
+TESTS_CLEANFILES_L =  *.output vglog.* vgcore.* *.test.dtb *.test.dts *.dtsv1 tmp.*
 TESTS_CLEANFILES_L += dumptrees
 TESTS_CLEANFILES = $(TESTS) $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
 
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
