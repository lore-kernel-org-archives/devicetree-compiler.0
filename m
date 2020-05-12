From: Claudio Fontana <cfontana-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] Makefile: when building libfdt only, do not add unneeded deps
Date: Tue, 12 May 2020 12:33:15 +0200
Message-ID: <20200512103315.1926-1-cfontana@suse.de>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Claudio Fontana <cfontana-l3A5Bk7waGM@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

implemented originally for the QEMU consumer of libfdt.

Signed-off-by: Claudio Fontana <cfontana-l3A5Bk7waGM@public.gmane.org>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index f02aa19..cb256e8 100644
--- a/Makefile
+++ b/Makefile
@@ -176,6 +176,7 @@ endif
 
 
 ifneq ($(DEPTARGETS),)
+ifneq ($(MAKECMDGOALS),libfdt)
 -include $(DTC_OBJS:%.o=%.d)
 -include $(CONVERT_OBJS:%.o=%.d)
 -include $(FDTDUMP_OBJS:%.o=%.d)
@@ -183,6 +184,7 @@ ifneq ($(DEPTARGETS),)
 -include $(FDTPUT_OBJS:%.o=%.d)
 -include $(FDTOVERLAY_OBJS:%.o=%.d)
 endif
+endif
 
 
 
@@ -318,7 +320,9 @@ ifeq ($(NO_PYTHON),0)
 TESTS_PYLIBFDT += maybe_pylibfdt
 endif
 
+ifneq ($(MAKECMDGOALS),libfdt)
 include tests/Makefile.tests
+endif
 
 #
 # Clean rules
-- 
2.16.4

