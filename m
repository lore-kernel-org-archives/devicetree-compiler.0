From: Mike McTernan <mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] libfdt: Validate alias property value is a valid string.
Date: Mon, 10 Oct 2022 11:03:28 +0100
Message-ID: <20221010100328.2207018-1-mikemcternan@google.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S54OHrk533YAv72v1Vs2WjtHj04ZyPZ0YGi81j77ZBk=;
        b=pEpQYRCFD4fH8Mh7WhDZRbL813u7JiJdnLrm4RcTMEO0gz57ZiFQ8XvaYDAUPuuirc
         z/LAnhbTYKpXT+cT41PAOzju2jfALthuMH2EdGEi6IJjHyhwGBbgISUJz7MIZpMJxmUn
         angwtGAgl7JTrl9fpJth1OXy+kdSwN2PC8MvYkJCMf8cxCd0mWkrnso3CLxplhPfo8I2
         /pzUd/fOrlR8L1hoRBWHTxTJJBpyVc40Y/Ydjhd7PKhZPvVl+u1abGokjDfB+HD5LYbK
         QbrW9Mjc8xBIkpUJWRB5/idTBXSHKX09qOHxsvjX22mONc1sC903TKkF2VrTIENAuuYr
         9Kow==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: =?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike McTernan <mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Prevent circular alias resolution causing infinite recursion.

Signed-off-by: Mike McTernan <mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 libfdt/fdt_ro.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 9f6c551..870c4a5 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -525,13 +525,27 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
 const char *fdt_get_alias_namelen(const void *fdt,
 				  const char *name, int namelen)
 {
+	const char *prop;
 	int aliasoffset;
+	int prop_len;
 
 	aliasoffset = fdt_path_offset(fdt, "/aliases");
 	if (aliasoffset < 0)
 		return NULL;
 
-	return fdt_getprop_namelen(fdt, aliasoffset, name, namelen, NULL);
+	prop = fdt_getprop_namelen(fdt, aliasoffset, name, namelen, &prop_len);
+	if (prop && !can_assume(VALID_INPUT)) {
+		/* Validate the alias value.  From the devicetree spec v0.3:
+		 * "An alias value is a device path and is encoded as a string.
+		 *  The value representes the full path to a node, ..."
+		 * A full path must start at the root to prevent recursion.
+		 */
+		if (prop_len < 2 || *prop != '/' || strnlen(prop, prop_len) != prop_len - 1) {
+			prop = NULL;
+		}
+	}
+
+	return prop;
 }
 
 const char *fdt_get_alias(const void *fdt, const char *name)
-- 
2.38.0.rc2.412.g84df46c1b4-goog

