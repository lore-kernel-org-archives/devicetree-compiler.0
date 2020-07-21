From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 1/4] dtc: Include stdlib.h in util.h
Date: Tue, 21 Jul 2020 16:58:57 +0100
Message-ID: <20200721155900.9147-2-andrei.ziureaev@arm.com>
References: <20200721155900.9147-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200721155900.9147-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If used on its own, util.h needs stdlib.h for exit(), malloc() and
realloc().

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---
 util.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util.h b/util.h
index 5a4172d..a771b46 100644
--- a/util.h
+++ b/util.h
@@ -2,6 +2,7 @@
 #ifndef UTIL_H
 #define UTIL_H
 
+#include <stdlib.h>
 #include <stdarg.h>
 #include <stdbool.h>
 #include <getopt.h>
-- 
2.17.1

