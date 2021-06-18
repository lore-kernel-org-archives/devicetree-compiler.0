From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 5/5] Makefile: add -Wsign-compare to warning options
Date: Fri, 18 Jun 2021 18:20:30 +0100
Message-ID: <20210618172030.9684-6-andre.przywara@arm.com>
References: <20210618172030.9684-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210618172030.9684-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Now that all signedness comparison warnings in the source tree have been
fixed, let's enable the warning option, to avoid them creeping in again.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ea8c659..ee77115 100644
--- a/Makefile
+++ b/Makefile
@@ -21,7 +21,7 @@ CONFIG_LOCALVERSION =
 ASSUME_MASK ?= 0
 
 CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
-WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
+WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs -Wsign-compare \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
 CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
 
-- 
2.17.5

