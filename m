From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dtc: Allow overlays to have .dtbo extension
Date: Wed,  6 Jan 2021 15:26:08 +0530
Message-ID: <30fd0e5f2156665c713cf191c5fea9a5548360c0.1609926856.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rDsopHKKF607Xe9UdumCtEOjuD6D8IDJARDfhwx961A=;
        b=UjuHEcbWMscc6ZSzJ7TDd9JJCm9n4VnkUlStwKAOguAfU/sdlDko1X3O+Il4eCep64
         FNMBnXnaqWF67HUYimnCpXImAWJEkzwV+MWbkc17EMYL/ea/G0B7hQKxtdi0sFF/Tj9z
         x1s3BUdje4Kfc+9MTTJJ78IS/4DaKLqeElEJmfF7jxQl0iH1ydnzMOtNc5BcXAx/Jh93
         6LbgWt66T3Y4Rhhp7pHYyArPqqYNwV8Dnqo+HhnJR2q01PGJt0ODj9fZl6aY/jhAOHy+
         ndgOm1QUNwCgNMmYCzipR+WychdTi4aVTigrqsMZlXe77hrmyz0iwJUgvV99SwM9m2gb
         OSsA==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, anmar.oueja-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Allow the overlays to have .dtbo extension instead of just .dtb. This
allows them to be identified easily by tools as well as humans.

Allow the dtbo outform in dtc.c for the same.

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

---
Hello,

This was earlier posted for the Linux Kernel and here is the thread
where Rob gave his feedback:

https://lore.kernel.org/lkml/CAL_Jsq+0dL=LHo8r9mY_weBP_bQ97UOBnt596J3JoVHwGNinHA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org/
---
 dtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/dtc.c b/dtc.c
index bdb3f5945699..838c5df96c00 100644
--- a/dtc.c
+++ b/dtc.c
@@ -122,6 +122,8 @@ static const char *guess_type_by_name(const char *fname, const char *fallback)
 		return "dts";
 	if (!strcasecmp(s, ".yaml"))
 		return "yaml";
+	if (!strcasecmp(s, ".dtbo"))
+		return "dtb";
 	if (!strcasecmp(s, ".dtb"))
 		return "dtb";
 	return fallback;
@@ -357,6 +359,8 @@ int main(int argc, char *argv[])
 #endif
 	} else if (streq(outform, "dtb")) {
 		dt_to_blob(outf, dti, outversion);
+	} else if (streq(outform, "dtbo")) {
+		dt_to_blob(outf, dti, outversion);
 	} else if (streq(outform, "asm")) {
 		dt_to_asm(outf, dti, outversion);
 	} else if (streq(outform, "null")) {
-- 
2.25.0.rc1.19.g042ed3e048af

