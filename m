From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] fdtoverlay: Fix usage string to not mention "<type>"
Date: Tue, 22 Mar 2022 09:08:59 +0100
Message-ID: <20220322080859.230337-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066; i=uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org; h=from:subject; bh=VPz+ufxaoetaMTi+rVd3VB4Aw3IrHvoXj2YoosubJrA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiOYQCGft6t51CDw7NBjFgKCqH7a7XxHbbzQs43clU 8ohMdOiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYjmEAgAKCRDB/BR4rcrsCWuNB/ 9H2tsjTYpJkRYkTcObmNrhcBw9hBTTW5vi8Zt4pxTE37QbvwVqxeUOTCydWOo2G9fT7V9z/v+pHLGe J8taiegf4uOppBdP7RNeCL7+oSaaccaucMKMt1hYYxSfUaJzyKD2Cu++tNYUb9YLwwc+Q4XCDTBmGY fmRQhmeY/SwHWPFaB/1gHzpg3BWlQNpOWF43hGQrUDanEU/WKlcECvEZqZPWkh63lXT68SeXg0U9Pl br7hP/q5yz5js3QST+vvUR2NLg597pV7KkXCIxRKBl5y9i3NTjazAQl+MURX52uMbGafuUB2p+Kq5C 1HAUFGkwT0bCxTd2Xn/qHUqIWHPpi/
X-Developer-Key: i=uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org

fdtoverlay doesn't have a -t option, so explaining the type formats and
modifier prefixes doesn't make much sense.
---
Hello,

I was unsure if I'm supposed to add a signed-off-by line. It's not
formalized in the git repo, so I assume it won't have any juristical
semantic anyhow and I didn't add it.

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
 static const char usage_synopsis[] =
 	"apply a number of overlays to a base blob\n"
-	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]\n"
-	"\n"
-	USAGE_TYPE_MSG;
+	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]";
 static const char usage_short_opts[] = "i:o:v" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
 	{"input",            required_argument, NULL, 'i'},

base-commit: c001fc01a43e7a06447c06ea3d50bd60641322b8
-- 
2.35.1

