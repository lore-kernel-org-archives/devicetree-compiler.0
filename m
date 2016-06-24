From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 03/12] vsprintf: Include stdarg for va_list
Date: Fri, 24 Jun 2016 16:27:48 +0200
Message-ID: <20160624142757.32735-4-maxime.ripard@free-electrons.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160624142757.32735-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

vsprintf.h doesn't include the stdarg.h file, which means that it relies on
the files that include vsprintf.h to include stdarg.h as well.

Add an explicit include to avoid build errors when simply including that
file.

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 include/vsprintf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/vsprintf.h b/include/vsprintf.h
index 376f5dd32499..60e91d119eee 100644
--- a/include/vsprintf.h
+++ b/include/vsprintf.h
@@ -8,6 +8,8 @@
 #ifndef __VSPRINTF_H
 #define __VSPRINTF_H
 
+#include <stdarg.h>
+
 ulong simple_strtoul(const char *cp, char **endp, unsigned int base);
 
 /**
-- 
2.9.0
