From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH] checks: fix sound-dai phandle with arg property check
Date: Mon,  4 Dec 2017 10:07:23 +0100
Message-ID: <20171204090723.4810-1-peda@axentia.se>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentiatech.onmicrosoft.com; s=selector1-axentia-se;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=07UI53/Uy22bSaEdHIWnuRp0Q3IX7gOrY/saixkeBC4=;
 b=rEQnA/LG+f1yuEzsRW49qnIN/YAx+Ejgeu+iibydFECOeg0iayOaw5QLacX7W79E7+EEqAyWaxfsQakRZSTRU/yqyDTTJT0gv6SACZHGBOgvCqjAcbs/aD9/tLoZnG4KkF3CMnoHH03OucPbRg5kiu1I2WLc2PNhwe30EKOfWgU=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

The property is named "sound-dai", not "sound-dais".

Fixes: b3bbac02d5e3 ("checks: add phandle with arg property checks")
Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
---
 checks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Hi!

I don't know if this needs more work? Maybe #sound-dai-cells is optional?
Maybe there's a lot of fall-out in the kernel? Anyway, "sound-dais" is
definitely not right...

BTW, I reviewed the other properties added by the fixed patch and found
no other similar spelling mistake.

Cheers,
Peter

diff --git a/checks.c b/checks.c
index f5bf5f9..334c2a4 100644
--- a/checks.c
+++ b/checks.c
@@ -1066,7 +1066,7 @@ WARNING_PROPERTY_PHANDLE_CELLS(phys, "phys", "#phy-cells");
 WARNING_PROPERTY_PHANDLE_CELLS(power_domains, "power-domains", "#power-domain-cells");
 WARNING_PROPERTY_PHANDLE_CELLS(pwms, "pwms", "#pwm-cells");
 WARNING_PROPERTY_PHANDLE_CELLS(resets, "resets", "#reset-cells");
-WARNING_PROPERTY_PHANDLE_CELLS(sound_dais, "sound-dais", "#sound-dai-cells");
+WARNING_PROPERTY_PHANDLE_CELLS(sound_dai, "sound-dai", "#sound-dai-cells");
 WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#thermal-sensor-cells");
 
 static bool prop_is_gpio(struct property *prop)
@@ -1269,7 +1269,7 @@ static struct check *check_table[] = {
 	&power_domains_property,
 	&pwms_property,
 	&resets_property,
-	&sound_dais_property,
+	&sound_dai_property,
 	&thermal_sensors_property,
 
 	&deprecated_gpio_property,
-- 
2.11.0
