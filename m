From: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] checks: tigthen up nr-gpios prop exception
Date: Mon,  5 Apr 2021 16:28:55 -0700
Message-ID: <20210405232855.51816-1-ilya.lipnitskiy@gmail.com>
References: <20210405052617.2471954-1-ilya.lipnitskiy@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=48r1+qqnn3DaNYJawDl127imPYfbuEk13sFwTYMmTx4=;
        b=gbwLjU6H3vRAPKwtYjOVNT1OPn0B3yz2l1n0hvm51kR1TyMfONEezwErb0eVvkQR8C
         ZvAybu2LgQlRzFokkD5qIBLmcwuUoYwxoIEVw27aElMSkHpVuPrlgowtcXfOo78rXOIK
         G+5h4ZJjLAbOv8cr0C/fifUn5yOMN/zKewPogR0TImqBR2qA4LZjZp/Yt/MsfTVSeYNM
         zLnvyuwX3cWe0cnTbt65xbpRas8mVuHc3JDnckyfR4wui+r40BZuBKf4o5fxzRNll/Jp
         Wh6ny/X2RMjnOhMH01EKJCO8t5po13p4cE9rScAmgZSljq1h5qIpTBXnNPSHuwST3VNu
         +zkQ==
In-Reply-To: <20210405052617.2471954-1-ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

There are no instances of nr-gpio in the Linux kernel tree, only
"[<vendor>,]nr-gpios", so make the check stricter.

nr-gpios without a "vendor," prefix is also invalid, according to the DT
spec[0], and there are no DT files in the Linux kernel tree with
non-vendor nr-gpios. There are some drivers, but they are not DT spec
compliant, so don't suppress the check for them.

[0]:
Link: https://github.com/devicetree-org/dt-schema/blob/cb53a16a1eb3e2169ce170c071e47940845ec26e/schemas/gpio/gpio-consumer.yaml#L20

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index c4207720ce8c..7e9d73af02a3 100644
--- a/checks.c
+++ b/checks.c
@@ -1494,7 +1494,7 @@ static bool prop_is_gpio(struct property *prop)
 	 * *-gpios and *-gpio can appear in property names,
 	 * so skip over any false matches (only one known ATM)
 	 */
-	if (strstr(prop->name, "nr-gpio"))
+	if (strstr(prop->name, ",nr-gpios"))
 		return false;
 
 	str = strrchr(prop->name, '-');
-- 
2.31.1

