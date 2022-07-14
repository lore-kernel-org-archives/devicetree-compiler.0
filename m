From: "=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?=" <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] libfdt: Handle failed get_name() on BEGIN_NODE
Date: Thu, 14 Jul 2022 09:38:48 +0100
Message-ID: <20220714083848.958492-1-ptosi@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=AF+pcP7nX9ZfrwhI5TIvpjKRmHQ5dP8i6Apyum657Uw=;
        b=U3f59qEDvcIPP5gynfY+vzwXJEgLNMDkJZK0SceB6HpntuH1pkykXlkhPfvyalBbS1
         6p1H80mFI/LfOssjabYRTYAH5meoMTO58NPgMooQAuFllSfo0m6FQpLWBzRQ+fyA4qrF
         pbshC3GgSAyPY56xR2uc0nTSet/Em4JurcbhzCD3ALMClGFc/JygB696srvIL6z2WIMa
         iJ6mAmYfPsNQ7H57SSY58Qu7pWZ+qClMeN8/CicTfcGVCh7WF8gA0dbC+7QwqBTQ8tO8
         L8hC6ugtQ10o7TogTrtn9CfDRwCufWiGODRdUz2vXNOKCoIocBGbNcu2+XPT75YAQTxd
         J0rA==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Validate the return value of fdt_get_name() as an ill-formed DT, causing
it to fail, could result in fdt_check_full() dereferencing NULL.

fixes: a2def5479950 ("libfdt: Check that the root-node name is empty")
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 libfdt/fdt_check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index fa410a8..71390ee 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -66,7 +66,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 				int len;
=20
 				name =3D fdt_get_name(fdt, offset, &len);
-				if (*name || len)
+				if (!name || *name || len)
 					return -FDT_ERR_BADSTRUCTURE;
 			}
 			break;
--=20
2.37.0.170.g444d1eabd0-goog

