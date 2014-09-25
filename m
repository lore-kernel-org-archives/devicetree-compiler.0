From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dtc: Delete the unused start condition INCLUDE
Date: Thu, 25 Sep 2014 01:52:53 +0000
Message-ID: <1411609973-52722-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The scanners of the latest version of dtc and
convert-dtsv0 are no longer use start condition
"INCLUDE". so we should delete it.

Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 convert-dtsv0-lexer.l | 1 -
 dtc-lexer.l           | 1 -
 2 files changed, 2 deletions(-)

diff --git a/convert-dtsv0-lexer.l b/convert-dtsv0-lexer.l
index 548e719..259e527 100644
--- a/convert-dtsv0-lexer.l
+++ b/convert-dtsv0-lexer.l
@@ -19,7 +19,6 @@
 
 %option noyywrap nounput noinput never-interactive
 
-%x INCLUDE
 %x BYTESTRING
 %x PROPNODENAME
 
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 5c9969f..0ee1caf 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -20,7 +20,6 @@
 
 %option noyywrap nounput noinput never-interactive
 
-%x INCLUDE
 %x BYTESTRING
 %x PROPNODENAME
 %s V1
-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
