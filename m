From: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] checks: Suppress warnings on overlay fragments
Date: Wed, 11 Jan 2023 10:34:17 +0800
Message-ID: <20230111023417.24141-1-qun-wei.lin@mediatek.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Lo6+KRJenbl5+Yuc8zvP8T2F5KONtmh1gQgDk3rsKvM=;
        b=DMsawD0xuF9A16vFcyuiiDoPrHq6ar2S1jp5FwOzTClWs85rSYd1eZDsPxcDA8W7k8G/LxXaszlifaMTod30zngeWkvNIwbmBZUThJi9Y/19BZmygCdO+S7Jk2HKs1K+aMaSXVpOr6/v8tNUnaVBMIqMIlXd7Nv4zGUyA3EAWho=;
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kuan-ying.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ladon.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

The overlay fragment is a speial case where some properties are not
present in the overlay source file, but in the base file.

example:
+-----------------------------+--------------------+
| base.dts                    | overlay.dts        |
+-----------------------------+--------------------+
| /dts-v1/;                   | /dts-v1/;          |
|                             | /plugin/;          |
| /{                          |                    |
|   parent: test {            | &parent {          |
|     #address-cells = <1>;   |   child@0 {        |
|     #size-cells = <0>;      |     reg = <0x0>;   |
|   };                        |   };               |
| };                          | };                 |
+-----------------------------+--------------------+

It will cause the following false alarms when compiling the overlay dts.

1. /fragment@0/__overlay__: Character '_' not recommended in node name
2. /fragment@0/__overlay__: Relying on default #address-cells value
3. /fragment@0/__overlay__: Relying on default #size-cells value
4. /fragment@0/__overlay__:reg: property has invalid length (4 bytes)
   (#address-cells == 2, #size-cells == 1)

This workaround will fix them by skip checking for node named __overlay__.

Signed-off-by: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 checks.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/checks.c b/checks.c
index 9f31d26..afa8f23 100644
--- a/checks.c
+++ b/checks.c
@@ -325,6 +325,9 @@ static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
 {
 	int n = strspn(node->name, c->data);
 
+	if (streq(node->name, "__overlay__"))
+		return;
+
 	if (n < node->basenamelen)
 		FAIL(c, dti, node, "Character '%c' not recommended in node name",
 		     node->name[n]);
@@ -767,6 +770,9 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
 		return;
 	}
 
+	if (streq(node->parent->name, "__overlay__"))
+		return;
+
 	if (prop->val.len == 0)
 		FAIL_PROP(c, dti, node, prop, "property is empty");
 
@@ -1197,6 +1203,10 @@ static void check_avoid_default_addr_size(struct check *c, struct dt_info *dti,
 	if (!node->parent)
 		return; /* Ignore root node */
 
+
+	if (streq(node->parent->name, "__overlay__"))
+		return;
+
 	reg = get_property(node, "reg");
 	ranges = get_property(node, "ranges");
 
-- 
2.18.0

