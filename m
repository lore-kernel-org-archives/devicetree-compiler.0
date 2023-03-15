From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] fdtoverlay: Fix usage string to not mention "<type>"
Date: Wed, 15 Mar 2023 11:08:19 +0100
Message-ID: <20230315100819.13387-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

fdtoverlay doesn't have a -t option, so explaining the type formats and
modifier prefixes doesn't make much sense.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+Ir=
Q@public.gmane.org>
---
Hello,

(implicit) v1 was sent nearly a year ago. It wasn't picked up because it
didn't have a Signed-off-by line for me. I didn't add it, because it
wasn't formalized back then. This changed some time ago, so here is an
otherwise unchanged v2.

Best regards
Uwe

 fdtoverlay.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fdtoverlay.c b/fdtoverlay.c
index 5350af65679f..cac6b6576c28 100644
--- a/fdtoverlay.c
+++ b/fdtoverlay.c
@@ -23,9 +23,7 @@
 /* Usage related data. */
 static const char usage_synopsis[] =3D
 	"apply a number of overlays to a base blob\n"
-	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]\n"
-	"\n"
-	USAGE_TYPE_MSG;
+	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]";
 static const char usage_short_opts[] =3D "i:o:v" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] =3D {
 	{"input",            required_argument, NULL, 'i'},
--=20
2.39.2

