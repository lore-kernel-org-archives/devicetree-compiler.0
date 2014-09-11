From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dtc: Update the usage helper message
Date: Thu, 11 Sep 2014 15:16:37 +0800
Message-ID: <1410419797-93754-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

if #define DEFAULT_FDT_VERSION     17
The message
	Blob version to produce, defaults to %d (for dtb and asm output)
should be
	Blob version to produce, defaults to 17 (for dtb and asm output)

This patch fix it, and delete the redundant 't'.

Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 dtc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/dtc.c b/dtc.c
index e3665b6..8c4add6 100644
--- a/dtc.c
+++ b/dtc.c
@@ -48,6 +48,8 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 }
 
 /* Usage related data. */
+#define FDT_VERSION(version)	_FDT_VERSION(version)
+#define _FDT_VERSION(version)	#version
 static const char usage_synopsis[] = "dtc [options] <input file>";
 static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:hv";
 static struct option const usage_long_opts[] = {
@@ -82,9 +84,9 @@ static const char * const usage_opts_help[] = {
 	 "\t\tdts - device tree source text\n"
 	 "\t\tdtb - device tree blob\n"
 	 "\t\tasm - assembler source",
-	"\n\tBlob version to produce, defaults to %d (for dtb and asm output)", //, DEFAULT_FDT_VERSION);
+	"\n\tBlob version to produce, defaults to "FDT_VERSION(DEFAULT_FDT_VERSION)" (for dtb and asm output)",
 	"\n\tOutput dependency file",
-	"\n\ttMake space for <number> reserve map entries (for dtb and asm output)",
+	"\n\tMake space for <number> reserve map entries (for dtb and asm output)",
 	"\n\tMake the blob at least <bytes> long (extra space)",
 	"\n\tAdd padding to the blob of <bytes> long (extra space)",
 	"\n\tSet the physical boot cpu",
-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
