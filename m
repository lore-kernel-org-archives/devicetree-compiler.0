From: "Marcus Comstedt" <marcus-S4ne242Fi5M@public.gmane.org>
Subject: [PATCH] libfdt: Remove superfluous NUL character from overlay symbols
Date: Sat, 23 May 2020 17:12:39 +0200
Message-ID: <20200523151239.8849-1-marcus@mc.pp.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mc.pp.se; s=hedgehog;
        t=1590246811; bh=FDTY0fDFR0TRWm5Hv2rOP1z9VadHiEbCO+fU2K0WJpQ=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
         Content-Transfer-Encoding; b=mSZtc22h/+G/h6KjR3vHViwzB4wZfR93a4YZ2
        9mRrQbixS3XQNAX7yAYDj/VMzPHOStec+FMx+04QTeAABzjKWYt2KYY5jMjw5NlNFRr
        xwSbCd813loQ2o9ETP+i+90x9fS1j3dURX2B/gyYulRwv7nk7LpAD5Z/xJTxIkYcL/0
        =
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Marcus Comstedt <marcus-S4ne242Fi5M@public.gmane.org>

The symbol path already ends with a NUL character (something which is
actually checked by the code) and this NUL is included in
rel_path_len, so there is no need to add a second one.

This change fixes incorrect display in the U-Boot command
"fdt list /__symbols__" after applying an overlay with symbols.

Signed-off-by: Marcus Comstedt <marcus-S4ne242Fi5M@public.gmane.org>
---
 libfdt/fdt_overlay.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index b310e49..16d5aa0 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -757,7 +757,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 			   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
 			/* /<fragment-name>/__overlay__ */
 			rel_path = "";
-			rel_path_len = 0;
+			rel_path_len = 1; /* Include NUL character */
 		} else {
 			/* Symbol refers to something that won't end
 			 * up in the target tree */
@@ -794,7 +794,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		}
 
 		ret = fdt_setprop_placeholder(fdt, root_sym, name,
-				len + (len > 1) + rel_path_len + 1, &p);
+				len + (len > 1) + rel_path_len, &p);
 		if (ret < 0)
 			return ret;
 
@@ -820,7 +820,6 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 
 		buf[len] = '/';
 		memcpy(buf + len + 1, rel_path, rel_path_len);
-		buf[len + 1 + rel_path_len] = '\0';
 	}
 
 	return 0;
-- 
2.26.2

