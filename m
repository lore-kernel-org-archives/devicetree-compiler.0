From: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Remove duplicated -Werror in dtc Makefile
Date: Tue,  3 Nov 2015 13:02:00 +0100
Message-ID: <1446552120-18659-1-git-send-email-thuth@redhat.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The "-Werror" compiler flag is currently declared twice in the
Makefile, one time in WARNINGS, and one time in CFLAGS. Let's
remove one of them.

Signed-off-by: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c1d0757..75ab67e 100644
--- a/Makefile
+++ b/Makefile
@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
 CPPFLAGS = -I libfdt -I .
 WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
+CFLAGS = -g -Os -fPIC $(WARNINGS)
 
 BISON = bison
 LEX = flex
-- 
1.8.3.1
