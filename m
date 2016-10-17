From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 2/2] libfdt: fix fdt_stringlist_search()
Date: Mon, 17 Oct 2016 15:08:24 +0900
Message-ID: <1476684504-3626-2-git-send-email-yamada.masahiro@socionext.com>
References: <1476684504-3626-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com u9H662JX032727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1476684363;
        bh=OIpBkzWGqLpjwx6ypX37M2hFeSL8mzsPzyVukz/iF5g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U5xHuiLmGF26RrKpEcTkdZOTyZab192trSfNsksEZDKc/zOGvLgs/jT7JjFtQFi1h
         UDk5j/yo009ZqyszpT1iIuhPUALoVYdaVgGE/QJkh1ZUfzDzdOIxyNx2Fh0c6VwPUR
         8uNZGtrep7eutSJVKaINNYTERhbn9ADRWkOG5pzoxVEDvyp5tRmBxlwbdueF/jQ9Vi
         +oQXEn6Wi03VTp+VerJYDw+eWMu1oi4Pb4CW2+WqJK7QPPGJP3H0teIWI+8iCkVF3q
         E+rG9bLX38QZh+VGgme7o7vCuh9BDJJkqs9TTpTqoN9h/+u76P5YeFRPYKLR4NdWwi
         EDdNYo95HBS6g==
In-Reply-To: <1476684504-3626-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
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
index db8d10f..3d00d2e 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -597,7 +597,7 @@ int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
 
 	list = fdt_getprop(fdt, nodeoffset, property, &length);
 	if (!list)
-		return -length;
+		return length;
 
 	len = strlen(string) + 1;
 	end = list + length;
-- 
1.9.1
