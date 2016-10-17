From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 1/2] libfdt: fix fdt_stringlist_count()
Date: Mon, 17 Oct 2016 15:08:23 +0900
Message-ID: <1476684504-3626-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com u9H662JW032727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1476684363;
        bh=8fh/sqZjXe4k8ijcOEP68wrw5hzRAnsLWRprCBtrvuo=;
        h=From:To:Cc:Subject:Date:From;
        b=pMQSfrUzl3tI5Z15pFh94yqcVnBYZt8mhOo8lsOlcTPrMY9UGVfgKl5gyOw55qOTN
         sY1orpAG3r009NkfDapmc36vZUkh46ZWAcbXkjDIoWd7PHjfENGNrdcew5y/oqKHI3
         mfflnRqIXHVdQZXA2ot4MA2UVOJ1ZJe1wgL/dfzq5l72zQc/2tfTOmf0j0Z+w26xT2
         H1CvrQrrTIEFHvXBK5BpB5+pf1upCzqNm1wcQ3LvtkwloMKmtgwya7SU3OCa+FDkI4
         qTfdMQYmGsR/uwlaHXzhLtJkxAix9QiR2LQO1sTujYwcpQntxahKw7TyGE5ZBft8oV
         KIME5Bs4EQzwg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

If fdt_getprop() fails, negative error code should be returned.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 libfdt/fdt_ro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 0459098..db8d10f 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -571,7 +571,7 @@ int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property)
 
 	list = fdt_getprop(fdt, nodeoffset, property, &length);
 	if (!list)
-		return -length;
+		return length;
 
 	end = list + length;
 
-- 
1.9.1
