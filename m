From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] write_propval_string: Use a list of strings instead of "\0" in a string
Date: Wed, 26 Apr 2023 20:24:05 +0200
Message-ID: <20230426182405.572729-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

A string that contains '\0' can be written as a list of strings e.g.

	clock-names =3D "di0_pll\0di1_pll\0di0_sel\0di1_sel\0di2_sel\0di3_sel\0di0=
\0di1";

is equivalent to

	clock-names =3D "di0_pll", "di1_pll", "di0_sel", "di1_sel", "di2_sel", "di=
3_sel", "di0", "di1";

The latter is easier to read, to use this format instead.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+Ir=
Q@public.gmane.org>
---
 treesource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/treesource.c b/treesource.c
index 33fedee82d58..de30188189fb 100644
--- a/treesource.c
+++ b/treesource.c
@@ -87,7 +87,7 @@ static void write_propval_string(FILE *f, const char *s, =
size_t len)
 			fprintf(f, "\\\"");
 			break;
 		case '\0':
-			fprintf(f, "\\0");
+			fprintf(f, "\", \"");
 			break;
 		default:
 			if (isprint((unsigned char)c))
--=20
2.39.2

