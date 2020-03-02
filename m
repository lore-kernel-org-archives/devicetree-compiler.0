From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/4] libfdt: Use VALID_INPUT for FDT_ERR_BADSTATE checks
Date: Mon,  2 Mar 2020 12:02:55 -0700
Message-ID: <20200302190255.51426-4-sjg@chromium.org>
References: <20200302190255.51426-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EGwcDJ19CxFzrmKMba7Aq/V1UmeICqSmlWFMqWs6PO0=;
        b=SmtjqweOlf2htmPvwdzp2iNYjyazlP65oe/hyEBdxiMDLbUu5wobJJgiv06Dn72Jjz
         3b8K6e7N1+MgR9T6kh5xj7HOf13NbUhS+lFx+1k9eJQj915czXvTkgYhH49+XHtYJwFX
         Ao+pthKl8dCDWxSfb0pr55Zu8XUf2SNMoM0kM=
In-Reply-To: <20200302190255.51426-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This error indicates a logic bug in the code calling libfdt, so VALID_DTB
is not really the right check. Update it to use VALID_INPUT instead.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Suggested-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---

 libfdt/fdt.c    | 2 +-
 libfdt/fdt_sw.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 4419204..c28fcc1 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -33,7 +33,7 @@ int32_t fdt_ro_probe_(const void *fdt)
 		}
 	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
 		/* Unfinished sequential-write blob */
-		if (fdt_size_dt_struct(fdt) == 0)
+		if (!can_assume(VALID_INPUT) && fdt_size_dt_struct(fdt) == 0)
 			return -FDT_ERR_BADSTATE;
 	} else {
 		return -FDT_ERR_BADMAGIC;
diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 352193c..26759d5 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -12,7 +12,7 @@
 
 static int fdt_sw_probe_(void *fdt)
 {
-	if (!can_assume(VALID_DTB)) {
+	if (!can_assume(VALID_INPUT)) {
 		if (fdt_magic(fdt) == FDT_MAGIC)
 			return -FDT_ERR_BADSTATE;
 		else if (fdt_magic(fdt) != FDT_SW_MAGIC)
@@ -41,7 +41,7 @@ static int fdt_sw_probe_memrsv_(void *fdt)
 	if (err)
 		return err;
 
-	if (!can_assume(VALID_DTB) && fdt_off_dt_strings(fdt) != 0)
+	if (!can_assume(VALID_INPUT) && fdt_off_dt_strings(fdt) != 0)
 		return -FDT_ERR_BADSTATE;
 	return 0;
 }
@@ -67,7 +67,8 @@ static int fdt_sw_probe_struct_(void *fdt)
 	if (err)
 		return err;
 
-	if (fdt_off_dt_strings(fdt) != fdt_totalsize(fdt))
+	if (!can_assume(VALID_INPUT) &&
+	    fdt_off_dt_strings(fdt) != fdt_totalsize(fdt))
 		return -FDT_ERR_BADSTATE;
 	return 0;
 }
-- 
2.25.0.265.gbab2e86ba0-goog

