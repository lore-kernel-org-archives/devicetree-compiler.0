From: "=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?=" <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] libfdt: Don't mask fdt_get_name() returned error
Date: Fri, 29 Jul 2022 14:00:19 +0100
Message-ID: <20220729130019.804288-1-ptosi@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:from:to:cc;
        bh=uCB9Zkuj7qAAEoJf/JB68OaS0f62bDwDQ8GLKmTAI6I=;
        b=RayT+tEahiHpMOiJMvwhF04wdw/n3AosumaEknbqrDzeXOTAz5td7LWhbK0AlNANEr
         61tzI68p5GJKahZfpggWflJmPRq6cYbli3Ex3ypp4qOIo6/SwQ6Gd5XzYuubziK4ucxb
         6MSODQ/G9U0SDwlxaWOKccEyshuWErSx7ZVxfPuYVTh0IO6JzapgTHVVhVshKJVOccuS
         OZ1hV/nsuGQ50r3Qr9ZWayPniCTeLn0cjyGc2kM11ZlO2yF6jRZhaQ4+c9TRLLKQCVBv
         crE2l0JKR5vjlQnU/VRSizpZyrGzc9Ew7oW+7i98gk5rGp10suYgLOp8jlWR71Cs8I+I
         XZFA==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: =?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike McTernan <mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Return the error code from fdt_get_name() (contained in len when the
result is NULL) instead of masking it with FDT_ERR_BADSTRUCTURE.

Fixes: fda71da26e7f ("libfdt: Handle failed get_name() on BEGIN_NODE")
Reported-by: Mike McTernan <mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 libfdt/fdt_check.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 71390ee..a21ebbc 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -66,7 +66,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 				int len;
=20
 				name =3D fdt_get_name(fdt, offset, &len);
-				if (!name || *name || len)
+				if (!name)
+					return len;
+
+				if (*name || len)
 					return -FDT_ERR_BADSTRUCTURE;
 			}
 			break;
--=20
2.37.1.455.g008518b4e5-goog

