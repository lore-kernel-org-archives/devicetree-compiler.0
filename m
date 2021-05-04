From: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] checks: replace strstr and strrchr with strends
Date: Mon,  3 May 2021 20:59:43 -0700
Message-ID: <20210504035944.8453-4-ilya.lipnitskiy@gmail.com>
References: <20210504035944.8453-1-ilya.lipnitskiy@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5wMoLZP00jf72SdQH9jervCK35TZxW9JshDipNR7+B0=;
        b=qepk46EBBO5402dCVwCp94d68YLDVOADlah6FF6NOYbv8GsnLDtbE8hG6UtBOzVcMp
         rlRFlQUbaywe40+7cI8ZNk7+IVXtsZCQ2LyU7m8ksaKWwUhk97LQrytkqfFnXS5/YY9o
         4OaKKyfofvlSlE+ZIjd2mFPg9KLXmIXaxKHnRttHwIFgJRYlcu8m549JPw8qd/d0FE96
         0r+9o3ufAfcFkS8TS6HbSipbqKpPNGHSARciCxVAGAeR3nZmtqyUbiVD0cjqCERsJbpE
         2lVxaMgDj8aRe5nHahK3drhmBqz6RcJ1jpU4KbWhCCMDrNz0X8GwIZHv8BY4A1bqKLnF
         934A==
In-Reply-To: <20210504035944.8453-1-ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Makes the logic more clear

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 checks.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/checks.c b/checks.c
index 7e9d73af02a3..eb91c8ea22fa 100644
--- a/checks.c
+++ b/checks.c
@@ -687,8 +687,7 @@ static void check_names_is_string_list(struct check *c, struct dt_info *dti,
 	struct property *prop;
 
 	for_each_property(node, prop) {
-		const char *s = strrchr(prop->name, '-');
-		if (!s || !streq(s, "-names"))
+		if (!strends(prop->name, "-names"))
 			continue;
 
 		c->data = prop->name;
@@ -1488,24 +1487,17 @@ WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#thermal-sen
 
 static bool prop_is_gpio(struct property *prop)
 {
-	char *str;
-
 	/*
 	 * *-gpios and *-gpio can appear in property names,
 	 * so skip over any false matches (only one known ATM)
 	 */
-	if (strstr(prop->name, ",nr-gpios"))
+	if (strends(prop->name, ",nr-gpios"))
 		return false;
 
-	str = strrchr(prop->name, '-');
-	if (str)
-		str++;
-	else
-		str = prop->name;
-	if (!(streq(str, "gpios") || streq(str, "gpio")))
-		return false;
-
-	return true;
+	return strends(prop->name, "-gpios") ||
+		streq(prop->name, "gpios") ||
+		strends(prop->name, "-gpio") ||
+		streq(prop->name, "gpio");
 }
 
 static void check_gpios_property(struct check *c,
@@ -1540,13 +1532,10 @@ static void check_deprecated_gpio_property(struct check *c,
 	struct property *prop;
 
 	for_each_property(node, prop) {
-		char *str;
-
 		if (!prop_is_gpio(prop))
 			continue;
 
-		str = strstr(prop->name, "gpio");
-		if (!streq(str, "gpio"))
+		if (!strends(prop->name, "gpio"))
 			continue;
 
 		FAIL_PROP(c, dti, node, prop,
-- 
2.31.1

