From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: [PATCH] fdtoverlay: Drop a a repeated article
Date: Mon, 24 Apr 2023 17:27:19 +0200
Message-ID: <20230424152719.96223-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
        s=2022; t=1682350046;
        bh=c9WEdIf/8JcdEVg+vkOS19XCd0GnU/5B0kM2ZWnJZlY=;
        h=From:To:Cc:Subject:Date:From;
        b=CbJm8JAynyYOUsAbhOYwd/zbIcLar8gKrxRK6oA7gtCSaQPErLXU5wTAhuvzCcNxt
         RZG0Gis90KBIYZnqBxsf0A4yUQ6Bqhe1bSyj41CDljE9FH8FIAjdUBFU0XAcRsZ/Xd
         /jAUWg/vPa5UobeVprweCQms81XDQ3j1LQ+fHxIsY/S8Ra8mAm6/NBmRrjLifWbJBg
         4IsN8mV1IL4Xuh6AsxwpNnAw/Ysp14Z2combOCrCiwJsTHHM1d4MaSntszPL0ez6kb
         jKuLTL7zHtUhbVKyLj5QTIywHoabhSpj29QlCChHv2UZXOMW6mutp06ccKw5n4YoUE
         OGW0EooOXYXBg==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@=
public.gmane.org>
---
 fdtoverlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fdtoverlay.c b/fdtoverlay.c
index cac6b6576c28..4eba0460f240 100644
--- a/fdtoverlay.c
+++ b/fdtoverlay.c
@@ -48,7 +48,7 @@ static void *apply_one(char *base, const char *overlay, s=
ize_t *buf_len,
 	int ret;
=20
 	/*
-	 * We take a copies first, because a a failed apply can trash
+	 * We take a copies first, because a failed apply can trash
 	 * both the base blob and the overlay
 	 */
 	tmpo =3D xmalloc(fdt_totalsize(overlay));
--=20
2.39.2

