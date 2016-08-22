From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] libfdt: simplify fdt_del_mem_rsv()
Date: Mon, 22 Aug 2016 18:55:49 +0900
Message-ID: <1471859749-1210-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com u7M9rlTH023326
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1471859627;
        bh=cwkpUmSZKFNzc/GmI/Tkc0r0z2M2pQVoy0vwu1u1JZY=;
        h=From:To:Cc:Subject:Date:From;
        b=FTp/H8BFr/xYKj9vRlQYZm0+iQr4XMS3b1dCyoeoyEbB15XKn3Evz+JaPsI4JKynk
         buXSei5WOruMXXAEbQno068D/v3iTZp5Gxd2Gom6wMEpj05U4VX4JD9JZzUw4Fs+zw
         xo5ejPEVNUybw/WIsYWFuMp/eIQ4eu1sq61U4nJPBCESC/VkKP2dIfdemDt9ZwP8zy
         o5CC3T/bvf5Thg+r3lXG9vS2P0AUvhnr6BO/CspX7UVTL4qaTR8uvc3UH2Un5iYF2s
         2+B7KIU3C1ny5m8eB/tVvjClLRPOh+imFdKu8fcOHlO2G02iyu+sRPgs/sFfBncQfN
         ewMI6tNeLjeMg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

The variable "err" is unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
 libfdt/fdt_rw.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 8be02b1..2eed4f5 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -191,17 +191,13 @@ int fdt_add_mem_rsv(void *fdt, uint64_t address, uint64_t size)
 int fdt_del_mem_rsv(void *fdt, int n)
 {
 	struct fdt_reserve_entry *re = _fdt_mem_rsv_w(fdt, n);
-	int err;
 
 	FDT_RW_CHECK_HEADER(fdt);
 
 	if (n >= fdt_num_mem_rsv(fdt))
 		return -FDT_ERR_NOTFOUND;
 
-	err = _fdt_splice_mem_rsv(fdt, re, 1, 0);
-	if (err)
-		return err;
-	return 0;
+	return _fdt_splice_mem_rsv(fdt, re, 1, 0);
 }
 
 static int _fdt_resize_property(void *fdt, int nodeoffset, const char *name,
-- 
1.9.1
