From: "=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?=" <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] fdt_get_phandle: Return invalid phandles as 0
Date: Mon,  1 Aug 2022 13:31:34 +0100
Message-ID: <20220801123134.1499236-1-ptosi@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:from:to:cc;
        bh=wrDmWQeaK5zbdNp8+AZxuxuYglGDH22LTqDcaz2pRyg=;
        b=n6YHUANRxzxBSj+lPl9La7pOjzZl4whkXrhY+mo9uzWZGbgcAsg+WHmsvpQppUTLIa
         S1RCC13f3A9TkLRFv//pTdwKsOjVIKwCysib7jDEdiLgDk2UKRAez5PaGsWGSLbmaUqw
         mQo84FutznVaeNSi11a9d6AmkGib0rAhCQI63rh0SdaVLR1lFlp8bPudwPOn99SmPm93
         F5YjRKPbn6Wv4/bzx05koWARKOZslMFRJdH+Q4uqhfxUvweVRHcwmmSh4HMfI4Ux3gpA
         wDewCimzWZ60TyULOvoqLGw3qLyhD27Pt/Q2rrhMP/er9yzvQHgFRp/5kFXTcIuqMQQk
         lt9A==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: =?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If a tree contains an invalid <u32> value as its <phandle> property,
mask it with '0' (invalid value) instead of returning it from
fdt_get_phandle().

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 libfdt/fdt_ro.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 9f6c551..7d1da6d 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -507,6 +507,7 @@ const void *fdt_getprop(const void *fdt, int nodeoffset=
,
=20
 uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
 {
+	uint32_t phandle;
 	const fdt32_t *php;
 	int len;
=20
@@ -519,7 +520,11 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffs=
et)
 			return 0;
 	}
=20
-	return fdt32_ld_(php);
+	phandle =3D fdt32_ld_(php);
+	if (phandle > (uint32_t)FDT_MAX_PHANDLE)
+		phandle =3D 0;
+
+	return phandle;
 }
=20
 const char *fdt_get_alias_namelen(const void *fdt,
--=20
2.37.1.455.g008518b4e5-goog

