From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Makefile: Add tags rule
Date: Wed, 25 Jan 2017 11:26:11 -0800
Message-ID: <20170125192611.11761-1-stephen.boyd@linaro.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=75JtHwWjSeu+2umJJn6BvTiEEF5dA/em687yYT7ybO4=;
        b=EjUx95WeZIRWK6BO7kPaidZz1qofLgeJFZ8YFRIvWnEggfq2Umgi3HL0kBeZA2Wtda
         bxZzZ6s3j9NsAOCv7NII6YosTSRqNcA2XiQCr7zK2p4HwKKzpsIGJDDDhiv0hgDzDC9A
         24BnsC1o4aVXcB3zrFukm0USTydjuTc1KCcng=
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
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 32dcfcf8e203..316d6329cd4b 100644
--- a/Makefile
+++ b/Makefile
@@ -218,6 +218,13 @@ kup: dist
 		$(KUPDIR)/dtc-$(dtc_version).tar.gz
 endif
 
+tags: FORCE
+	rm -f tags
+	find . \( -name tests -type d -prune \) -o \
+	       \( -name '*.[ch]' -type f -print \) -o \
+	       \( -name '*.lex.c' -type f -prune \) -o \
+	       \( -name '*.tab.*' -type f -prune \) | xargs ctags -a
+
 #
 # Testsuite rules
 #
-- 
2.10.0.297.gf6727b0
