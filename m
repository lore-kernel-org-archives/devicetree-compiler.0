Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8385147C91
	for <devicetree-compiler@vger.kernel.org>; Mon, 11 Nov 2024 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318895; cv=none; b=Y4DQiaaWwPndlvhggvLO3OP+v1EEnbrR/W+sDS3G86CFwMW3JE9taAXXYDc+zu3Xhxxk8kpyjLlkKJrsJZCeO5b1RgEH23RRun7pk1w8fbirRRfcwO1tyiNOeoAaMO5umMYdHQfK6IB/U6/YkIXTV31ViVMP0ZDG91UQCin1t2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318895; c=relaxed/simple;
	bh=MZ+XORq0qYNj7TKy8x41tziTp9rQ7ggRSd5YtPGULLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oqy/hDeTZjAqvqE82t8xk1IaLq3LXGanjE8TbPw18zH9NSqckZ411Ft+/wBd0t4IUJHKBgeegGRQ4i0NHm257v7UYLVFG6eNS3q0+X3E2DrAU5nX8LmXOI6tm+lp8rbF4MsA0MLgsH3k5WtxN//G7xNQuiCUlJNUO6/bEybhTB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=2S7OhKUJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="2S7OhKUJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-211a4682fcaso2867775ad.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 11 Nov 2024 01:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731318893; x=1731923693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCpVQM83MiOT2tqWcR0ojYoS29xfC+H26k4SLS3jthA=;
        b=2S7OhKUJv5gDYzjjroAcAo0MhKiewWYVPrM3z1zjJZCQBuA7x2Zd3j70WDlCLyU7CV
         SINcC5dJiNjpxX4aePt6/ArNdOBQAkAyIuzH0UWCIOB/GjBkn43xDfPnJMLfop6r31i5
         7gMkbgX2cm+z2ceZutu9twyy4aD2GiT9GXmt4ziJb90GIQsxX70ua6eh+mMwCWflpFJS
         AkR5cQZYTflVETCv94Purc7aKPrPblsvpHdtrg5fVfNbYyoGpsUyCaUzNO080kCH6tYf
         tEAeicRR1qTmbAWIpm3+GMJugPUxu1Iu3jR3a+VGWjUe6CrjQqj9wjsOpa/jCSdK+10u
         zIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318893; x=1731923693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCpVQM83MiOT2tqWcR0ojYoS29xfC+H26k4SLS3jthA=;
        b=dwFgzsMoOdhwVo+dfGGw5zxFakA3s0eh9dIY/QgAw3BhabjVpP1zGTTb721SOpgxs0
         CMJ38Yqz7+eRslJjQt+1ekGXiawzMfT/DxGuaB9BCD6hQUNSk4nnCNXF9ixs8zsNWsk9
         8Yz5Su7D169A9NKmfT6pxDuXWsIz5ZK5VR8bKCWpxWQASmDbC7dnOfeAKq5N5uod8/fb
         i9cSpcTlmuP4z6kC33QilkBy39cZutdgpyHnnjOYWwTsoTvweXEWiGnhv6oanZ2mUpq+
         W333q8cdllZRa7G1/dxNettDS8dqoeYdO068X/vrM3mflxaBRkqBIB78BXBXtkbZw30l
         D9MA==
X-Gm-Message-State: AOJu0YylnbDE/7ZcQgz36fowXF+zrhWlhh/+J8iOKG6XZ0iCnLDojqrS
	K6AQCGHDjs7ui7DeJMmYCDClZuLMstYq9dcwSj5TdS5CiFLuPhC44n92MGzyrg==
X-Google-Smtp-Source: AGHT+IETh/ALBdpfHPcq30jRJP42Qbgnetp3ST5e40ip08YjoGO0m3V+/ImVyEuDLcMEr884nngCCA==
X-Received: by 2002:a17:903:1104:b0:211:6b60:b767 with SMTP id d9443c01a7336-2118354a258mr167088635ad.31.1731318893095;
        Mon, 11 Nov 2024 01:54:53 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc9073sm72351685ad.1.2024.11.11.01.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:54:52 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Mon, 11 Nov 2024 15:24:33 +0530
Subject: [PATCH v3 1/2] dtc: Add /append-property/
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241111-append-v3-1-609c09401f3f@beagleboard.org>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
In-Reply-To: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>, Simon Glass <sjg@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6324; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=MZ+XORq0qYNj7TKy8x41tziTp9rQ7ggRSd5YtPGULLA=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnMdRixT+t20U5TgEnwxFJuNB8Q21X2++fY/w3o
 JQBmm4UvgGJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZzHUYgAKCRAFzvXHieVa
 dOysD/9pcjKQoNtXJYvnHiYG0B2XmsyibChPMyLBMMU4XHt7PF7xRBTfZ111lWM0VpNQMozQis/
 raV/+jR1mNYhMnrGyV+vQkb0oIH4MBig8n9TYOU4GmlhVq3UiffaiVmHJXJYO9YYHlFPVxFEoCo
 TRajikRvveo8UCHNG6TfosgauTLPL/xcdYP+2WJSGUrxAiWOZhSWeY6kCVgFuMPJJPFrXczf7HH
 yUKpDzG+hKA+3FgFjy/CCt/u+u3sROL4gycv3IG+eSFcd5R3W/vQkyDW5crftEyos402fDAeBQW
 6fWCO/WEBv2C7/W+MUfSsGkCk8Gtu5yJwRR8kMRRw25D5o61b0ZwH83UcrqrFtvhryXhIjliPML
 t6v4zEFGmHDZB708/fgerauICsORncB8TdCSJabklXsSEWAHZZoa0oepPemv+2/2+YfFpQpntAf
 k90EnIJgdFxMX3tk97p5b4iYehTl5sheyEk2pNM7CPgrtvIgDPlc3j5f9LxcVryRnB3NaL3dppS
 KU11BMZUsN8r9S+J621aAnCdHafxUIEgSELYHYz6TrF6tZSn6+JkhAAh3ebsBXaGK7cPr4gfKq1
 ie74dsxVmTwR9J7YwDRgv001VMi5wsK5sbTCvgBC0ZczHhuV8e7tkx61ubhqze+TYeWUuZT98Dm
 4YQqiPwE2lD0G7Q==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow appending values to a property instead of overriding the previous
values of property.

Currently, we have /delete-node/ and /delete-property/, but lack
/append-property/. Hence we end up having to repeat all existing values
when appending to a property (e.g. see [1] appending to clocks from
[2]).

This functionality is also important for creating a device tree based
implementation to support different types of addon-boards such as
mikroBUS, Grove [3], etc.

The annotate feature works similar to how it works for nodes. Here is a
small example:

base.dtsi
```
/dts-v1/;

/ {
	prop = "0";
	propa = <0>;
};
```

app1.dtsi
```
/dts-v1/;

/include/ "base.dtsi"

/ {
	/append-property/ prop = "1";
};
```

app2.dts
```
/dts-v1/;

/include/ "app1.dtsi"

/ {
	/append-property/ prop = "2";
	/append-property/ propa = <2>;
};
```

Output:
```
❯ ../dtc -T -T -o temp.dts app2.dts
❯ cat temp.dts
/dts-v1/;

/ { /* base.dtsi:3:3-7:3, app1.dtsi:5:3-7:3, app2.dts:5:3-8:3 */
	prop = "0", "1", "2"; /* base.dtsi:4:2-4:13, app1.dtsi:6:2-6:31, app2.dts:6:2-6:31 */
	propa = <0x00>, <0x02>; /* base.dtsi:6:3-6:15, app2.dts:7:2-7:32 */
}; /* base.dtsi:3:3-7:3, app1.dtsi:5:3-7:3, app2.dts:5:3-8:3 */
```

[3] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
[2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts#L39
[1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L3334

Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 dtc-lexer.l  |  7 +++++++
 dtc-parser.y |  6 ++++++
 dtc.h        |  5 +++++
 livetree.c   | 36 +++++++++++++++++++++++++++++-------
 4 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index de60a70b6bdbcb5ae4336ea4171ad6f645e91b36..5da4ca5bbacbababa43d00199d5bb3bc15c8ff6a 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -137,6 +137,13 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_DEL_NODE;
 		}
 
+<*>"/append-property/"	{
+			DPRINT("Keyword: /append-property/\n");
+			DPRINT("<PROPNODENAME>\n");
+			BEGIN(PROPNODENAME);
+			return DT_APP_PROP;
+		}
+
 <*>"/omit-if-no-ref/"	{
 			DPRINT("Keyword: /omit-if-no-ref/\n");
 			DPRINT("<PROPNODENAME>\n");
diff --git a/dtc-parser.y b/dtc-parser.y
index 4d5eece526243460203157464e3cd75f781e50e7..94ce405ab289ca82680a62bfe71e590f7b2e5e8e 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -58,6 +58,7 @@ static bool is_ref_relative(const char *ref)
 %token DT_BITS
 %token DT_DEL_PROP
 %token DT_DEL_NODE
+%token DT_APP_PROP
 %token DT_OMIT_NO_REF
 %token <propnodename> DT_PROPNODENAME
 %token <integer> DT_LITERAL
@@ -296,6 +297,11 @@ propdef:
 			$$ = build_property_delete($2);
 			free($2);
 		}
+	| DT_APP_PROP DT_PROPNODENAME '=' propdata ';'
+		{
+			$$ = build_property_append($2, $4, &@$);
+			free($2);
+		}
 	| DT_LABEL propdef
 		{
 			add_label(&$2->labels, $1);
diff --git a/dtc.h b/dtc.h
index 4c4aaca1fc417c9d93e904e64b2c40216ee1b093..3c9ba5aa92e90dd50995596b753e246d4fa52b24 100644
--- a/dtc.h
+++ b/dtc.h
@@ -205,6 +205,9 @@ struct bus_type {
 
 struct property {
 	bool deleted;
+	/* Flag to indicate if the property value should be appended instead
+	 * of being overwritten */
+	bool append;
 	char *name;
 	struct data val;
 
@@ -263,6 +266,8 @@ void delete_labels(struct label **labels);
 struct property *build_property(const char *name, struct data val,
 				struct srcpos *srcpos);
 struct property *build_property_delete(const char *name);
+struct property *build_property_append(const char *name, struct data val,
+				       struct srcpos *srcpos);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
 
diff --git a/livetree.c b/livetree.c
index 49f723002f855764452b30b5a979b6096730a33b..04f5014ab227f2458b8a93fcc6c8cb3a1388fd0d 100644
--- a/livetree.c
+++ b/livetree.c
@@ -62,6 +62,20 @@ struct property *build_property_delete(const char *name)
 	return new;
 }
 
+struct property *build_property_append(const char *name, struct data val,
+				       struct srcpos *srcpos)
+{
+	struct property *new = xmalloc(sizeof(*new));
+
+	memset(new, 0, sizeof(*new));
+	new->name = xstrdup(name);
+	new->append = true;
+	new->val = val;
+	new->srcpos = srcpos_copy(srcpos);
+
+	return new;
+}
+
 struct property *chain_property(struct property *first, struct property *list)
 {
 	assert(first->next == NULL);
@@ -151,8 +165,8 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	for_each_label_withdel(new_node->labels, l)
 		add_label(&old_node->labels, l->label);
 
-	/* Move properties from the new node to the old node.  If there
-	 * is a collision, replace the old value with the new */
+	/* Move properties from the new node to the old node. If there
+	 * is a collision, replace/append the old value with the new */
 	while (new_node->proplist) {
 		/* Pop the property off the list */
 		new_prop = new_node->proplist;
@@ -165,17 +179,25 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 			continue;
 		}
 
-		/* Look for a collision, set new value if there is */
+		/* Look for a collision, set new value/append if there is */
 		for_each_property_withdel(old_node, old_prop) {
 			if (streq(old_prop->name, new_prop->name)) {
 				/* Add new labels to old property */
 				for_each_label_withdel(new_prop->labels, l)
 					add_label(&old_prop->labels, l->label);
 
-				old_prop->val = new_prop->val;
-				old_prop->deleted = 0;
-				free(old_prop->srcpos);
-				old_prop->srcpos = new_prop->srcpos;
+				if (new_prop->append) {
+					old_prop->val = data_merge(old_prop->val, new_prop->val);
+					old_prop->srcpos = srcpos_extend(old_prop->srcpos, new_prop->srcpos);
+				}
+				else {
+					old_prop->val = new_prop->val;
+					free(old_prop->srcpos);
+					old_prop->srcpos = new_prop->srcpos;
+				}
+
+				old_prop->deleted = false;
+				old_prop->append = false;
 				free(new_prop);
 				new_prop = NULL;
 				break;

-- 
2.47.0

