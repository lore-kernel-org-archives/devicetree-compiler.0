From: Prusov Igor Vladimirovich <Igor.V.Prusov-wnI+JWxWOPs@public.gmane.org>
Subject: [PATCH] fdtdump: fix output of bytestring properties
Date: Wed, 08 Jul 2015 19:20:30 +0300
Message-ID: <559D4DCE.4040000@mcst.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Currently, when fdtdump prints bytestring property, it prints ffffff 
in front of bytes with first bit equal to 1 (0x80 - 0xff)

For example:
property = [80];
will become
property = [ffffff80];
This patch fixes it.

Signed-off-by: Igor Prusov <Igor.V.Prusov-wnI+JWxWOPs@public.gmane.org>
---
 util.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -up util.c{.orig,}
--- util.c.orig    2015-07-08 16:45:49.374127737 +0300
+++ util.c    2015-07-08 16:45:53.095127906 +0300
@@ -378,7 +378,7 @@ void utilfdt_print_data(const char *data
     } else {
         printf(" = [");
         for (i = 0; i < len; i++)
-            printf("%02x%s", *p++, i < len - 1 ? " " : "");
+            printf("%02hhx%s", *p++, i < len - 1 ? " " : "");
         printf("]");
     }
 }
