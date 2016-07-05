From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 02/13] scripts: Makefile.lib: Sanitize DTB names
Date: Tue,  5 Jul 2016 10:26:35 +0200
Message-ID: <20160705082646.25044-3-maxime.ripard@free-electrons.com>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160705082646.25044-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Having dashes as a separator in the DTB name is a quite common practice.

However, the current code to generate objects from DTBs assumes the
separator is an underscore, leading to a compilation error when building a
device tree with dashes.

Replace all the dashes in the DTB name to generate the symbols name, which
should solve this issue.

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 scripts/Makefile.lib | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index e720562623c9..45a0e1d486c0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -275,11 +275,11 @@ cmd_dt_S_dtb=						\
 (							\
 	echo '.section .dtb.init.rodata,"a"';		\
 	echo '.balign 16';				\
-	echo '.global __dtb_$(*F)_begin';		\
-	echo '__dtb_$(*F)_begin:';			\
+	echo '.global __dtb_$(subst -,_,$(*F))_begin';	\
+	echo '__dtb_$(subst -,_,$(*F))_begin:';		\
 	echo '.incbin "$<" ';				\
-	echo '__dtb_$(*F)_end:';			\
-	echo '.global __dtb_$(*F)_end';			\
+	echo '__dtb_$(subst -,_,$(*F))_end:';		\
+	echo '.global __dtb_$(subst -,_,$(*F))_end';	\
 	echo '.balign 16';				\
 ) > $@
 
-- 
2.9.0
