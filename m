From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 4/9] libfdt: Add new headers and defines
Date: Fri, 27 May 2016 11:13:17 +0200
Message-ID: <1464340402-2249-5-git-send-email-maxime.ripard@free-electrons.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464340402-2249-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The libfdt overlay support introduces a bunch of new includes and
functions.

Make sure we are able to build it by adding the needed glue.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 include/libfdt_env.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/libfdt_env.h b/include/libfdt_env.h
index 273b5d30f867..2d2196031332 100644
--- a/include/libfdt_env.h
+++ b/include/libfdt_env.h
@@ -23,6 +23,13 @@ typedef __be64 fdt64_t;
 #define fdt64_to_cpu(x)		be64_to_cpu(x)
 #define cpu_to_fdt64(x)		cpu_to_be64(x)
 
+#ifdef __UBOOT__
+#include "malloc.h"
+#include "vsprintf.h"
+
+#define strtol(cp, endp, base)	simple_strtol(cp, endp, base)
+#endif
+
 /* adding a ramdisk needs 0x44 bytes in version 2008.10 */
 #define FDT_RAMDISK_OVERHEAD	0x80
 
-- 
2.8.2
