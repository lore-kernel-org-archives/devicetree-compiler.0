From: Jia Xianhua <jiaxianhua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] libdtc: remove duplicate judgments
Date: Thu, 15 Sep 2022 16:55:14 +0800
Message-ID: <20220915085514.26996-1-jiaxianhua@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=HI3R9x8HZyK9QG3IUcXB9xF/xGYirFXvA+IloYe8QWk=;
        b=PqhLPJ5U3X2jyIMA1303yTTg6dhSO5SunZl+nHMHikXZVid6ttCFkrwFxNcSaDdCgq
         I9wbcVo2jX9hQFfz2QJvwn3fMB2eqLNgY8sjY/AA9YYElKdpovY+B37VrXUUDCuEH5/M
         TKnb+9cPEnOI182YdtyW1c9ULIbngwDjFg3inzRqRqZJM7vpD3Vq3PljvR4JoH4NReBd
         Vsn0I3XkARe18WobbmMe+0JyWhmSfnZ3UwM7ytfJ2thpF+syeB0p98kxPYgr2SYoaBOx
         a5Yj1CMAhiw2GL6rZ3dM3U9jHCt2M0CliVDOaXe7/cDxj98xfEPeja08R5O7IA4G0prN
         4NLA==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jia Xianhua <jiaxianhua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

There is no need to check the VALID_DTB repeatedly, and can be combined
into one if statement.

Signed-off-by: Jia Xianhua <jiaxianhua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 libfdt/fdt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 9fe7cf4..90a39e8 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -106,7 +106,6 @@ int fdt_check_header(const void *fdt)
 	}
 	hdrsize = fdt_header_size(fdt);
 	if (!can_assume(VALID_DTB)) {
-
 		if ((fdt_totalsize(fdt) < hdrsize)
 		    || (fdt_totalsize(fdt) > INT_MAX))
 			return -FDT_ERR_TRUNCATED;
@@ -115,9 +114,7 @@ int fdt_check_header(const void *fdt)
 		if (!check_off_(hdrsize, fdt_totalsize(fdt),
 				fdt_off_mem_rsvmap(fdt)))
 			return -FDT_ERR_TRUNCATED;
-	}
 
-	if (!can_assume(VALID_DTB)) {
 		/* Bounds check structure block */
 		if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
 			if (!check_off_(hdrsize, fdt_totalsize(fdt),
-- 
2.34.1

