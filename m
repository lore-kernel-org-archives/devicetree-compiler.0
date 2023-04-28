From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] doc: dt-object-internal: Fix a typo
Date: Fri, 28 Apr 2023 18:30:34 +0200
Message-ID: <20230428163034.775288-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=839; i=u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; h=from:subject; bh=SjW7mScDdbaJyE3p4Uj/AsKEJogF0ouYnBadBRuwWpY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkS/Spcm0F0GuJWBOaiYHLntQlu1MybgZIhMoin 3djIkKwID6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZEv0qQAKCRCPgPtYfRL+ TgOcB/4m4W7/rqrI8ypUtJsQST6SJinPSLH5ABMrupVw/rGa3Xvrj8szqkNFxqiEsQTTNPgI64e Geq34xNw5LvjmezgHkeAnNPItpLA/oOw+9Z4i2bGD4YsY3cgK5U/mThMg+SDcoEyQPsIDV31FrX NamjYUYVIlNtLloF8WN3017jzP3wHssokHqXAGEVTK5JJcvUnaPDGmDyOOzBQrAQ6fjdrY889hn FudxCT1gzL5R6Yc2+xOvSQ7nTI0zQsmqReD2ma0xc5Qfely8eK3cPV95hnsPYurBcRYFsRGY5Zg RYsb9dKntCa+oG6+Sux1XXKiinOjWFj9Kc2PngR9BiSxhKcQ
X-Developer-Key: i=u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+Ir=
Q@public.gmane.org>
---
 Documentation/dt-object-internal.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-object=
-internal.txt
index 51d68ab93ac9..c7357e6263df 100644
--- a/Documentation/dt-object-internal.txt
+++ b/Documentation/dt-object-internal.txt
@@ -35,7 +35,7 @@ We have a number of peripherals that after probing (using=
 some undefined method)
 should result in different Device Tree configuration.
=20
 We cannot boot with this static tree because due to the configuration of t=
he
-foo platform there exist multiple conficting peripherals DT fragments.
+foo platform there exist multiple conflicting peripherals DT fragments.
=20
 So for the bar peripheral we would have this:
=20
--=20
2.39.2

