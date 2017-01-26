From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] Makefile: Add tags rule
Date: Thu, 26 Jan 2017 10:48:14 -0800
Message-ID: <20170126184814.5325-1-stephen.boyd@linaro.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gZd1UFnKbJMP9IEMLxNXa4ST9OgIxDiyF5WMRdmy53U=;
        b=ACGyDeyFeRxpXG62gXnARLWSlyoBLqujC4N7RbgQCyWa13lvM52IqvWvS41x8r8dJb
         Or61sc4m/Qjq38CP37KN+dyt+mGLPeNeKMRFK+HwrNqctgcS/BZpF3ZYYbx5d+/vNRGL
         qT6GjpNBDxl86WLrFyvC3z0DCDNIuSnGss3ag=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

It's useful to have some tags to jump around sources. We don't
include test sources in the toplevel Makefile because they
probably aren't useful to main program development.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

I noticed my previous patch wasn't pruning the *.tab.[ch] and *.lex.c
files. This version corrects the find command so those aren't included.

 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 32dcfcf8e203..ce05eba6590b 100644
--- a/Makefile
+++ b/Makefile
@@ -218,6 +218,12 @@ kup: dist
 		$(KUPDIR)/dtc-$(dtc_version).tar.gz
 endif
 
+tags: FORCE
+	rm -f tags
+	find . \( -name tests -type d -prune \) -o \
+	       \( ! -name '*.tab.[ch]' ! -name '*.lex.c' \
+	       -name '*.[chly]' -type f -print \) | xargs ctags -a
+
 #
 # Testsuite rules
 #
-- 
2.10.0.297.gf6727b0
