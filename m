Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998281D0DD4
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Aug 2024 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781295; cv=none; b=PpXySKaysoAuWG7WI887vT6S6Cwtsc0AN1wKtsQjnN/xOq1L9YBe+2wXVfAIBZQEEK/IJURy4sXGQnjgPycSNcy+imYLf+iLPOvPC9IdmT6myF4JKiw/gV9bczzLA1l/b0Lne3FrE8MU9syMqgNVjng/nryTYS2sm1TCbL/HLoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781295; c=relaxed/simple;
	bh=Mt5AIWSVp6+JQzSHNzyXz0OKYZ0ItMQM/tXkoM5dXK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uFkt+ugq71AbXFWHEgEc4KJY7r2rso1sj/rggp7lTkXGFBVxg8Xmrm8OleLXT2OGEbcGJiwBOy6ALY5S8WxJCAQe+XUOdLkcJkk1ytGcFXbQfb+Yf77ms58bqegSpm6waH7F9d4c7XD3z5b6epTaBy9e/20UDm52mCc5597ikUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=dggGSyaa; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="dggGSyaa"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-202089e57d8so36933135ad.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Aug 2024 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724781293; x=1725386093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEbXz2o5f2Z3nSElcDqOFk2yO28U3SiBlZ5Mp/W5NBw=;
        b=dggGSyaaW+88arAPq/jHqHBb2RXWzKez+BfgEH6k6cEvvHYtayKtFlqHuGfXL0/+rR
         YZ1lNNHIg4ywRNNTnYh1y7Xs3ppcvhl+e9N0GRMRgv1EIf0A1iE3iHxDbLy1usJMqrM0
         JyWPATd+YcLned+eO9M2r6LJV+xrkI7qyH9l1QgVIrEe2u+DWsTrlh+wsrmeBnchG1YC
         sv9GCgLsrySGzpIExBIjIX83rZJtzZX/kWMzQq67a+AWE4oJRVZc62ir80687dt6OAl4
         K81Dmd/XSreiftTZTFOmzW7KqkNZvsHsaTp/Nj0WbvN+QLDmoDbmZBQegMQXgtBI+j3S
         h1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781293; x=1725386093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEbXz2o5f2Z3nSElcDqOFk2yO28U3SiBlZ5Mp/W5NBw=;
        b=rmZd2javlwYCtI8tusCcCG/IWDfHXwSyIjQhqTEWMopXWUHZ4Qq6eEgtLrBx9et6Pb
         z2e6U8BaLtrmJzIdVUZXCbQZlDAU1R1RW5E/zUvGhFuQGQymgBh3QA1IWJx9qYOAELuh
         tOjWDSmXCDOn3MIL7qOyZmyQLseYQjteIgyxayo5un4egttVejpEBu1vUqa4nKOpMLm9
         jRHIUZEMRhoAIgLT1khBTfICC0PRnGMYpGtjNWpX0kshXk9ptOUeDfJf/m5i8LG5/IPp
         1ewAXueqJ6nCpL+A7naoCo8a49WulOfVHn6SYFfcK02rkrRAGQa/kwCY0cJVLmZeKUTV
         YitQ==
X-Gm-Message-State: AOJu0YwXoJKfM6SWpMusXYKLGRN8bFgw4skZTiymJsZr1mC8PVuQVk9A
	+7Cc2+0e/EeXtUmbzEHiQTXmtV6/qNwAoq5oAHz+CWK2gpr3hte2xn/VLC7dQg==
X-Google-Smtp-Source: AGHT+IFjrIxID+nk773kZKWAgqFMjBE6ATXEaVAZmnLkvhm1tRMEsRRfe01o9Ze6ebvgf5v6oudEAQ==
X-Received: by 2002:a17:903:2308:b0:1f2:fcc0:66f with SMTP id d9443c01a7336-204dddc5001mr58117315ad.31.1724781292837;
        Tue, 27 Aug 2024 10:54:52 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dbf9asm85763235ad.179.2024.08.27.10.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 10:54:52 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 27 Aug 2024 23:24:24 +0530
Subject: [PATCH 1/2] dtc: Add /append-property/
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-append-v1-1-d7a126ef1be3@beagleboard.org>
References: <20240827-append-v1-0-d7a126ef1be3@beagleboard.org>
In-Reply-To: <20240827-append-v1-0-d7a126ef1be3@beagleboard.org>
To: lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4930; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=Mt5AIWSVp6+JQzSHNzyXz0OKYZ0ItMQM/tXkoM5dXK0=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmzhLlIaCkZbGkaRUAiUK8HWnAbuYY2kmKYpQhW
 MyDCaG/JMOJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZs4S5QAKCRAFzvXHieVa
 dG6DD/0YqsjGJz8NFyRX6juAL00cA0fqswGkqq58FK23o0tYUEZlhbPV2VI5GjYWPK95xdpb7E9
 g3mZJjdmi9LR0WJt841lKs+QT4ajm34kOZvo4xwdiS5m1Mc7YtjA6tJLA893yVOE6h9dBUcMvM6
 TsurnCUCGiYy9bA80WavPVpu6kyLjXdveqZQdOAhjpgfrnZn0mNVkPnpECaKZbyShFdgsEvp8Cq
 MINzpd4O5KvuMqGNE6mnY7SZIYsIa26kHvyFw7hZNbJ8kL6r/ifXTLeQGmbfLgDBn7DH63ijNfS
 ZUEWVI+BlLQ9z53VIuOpT3CdySyEzO9+6ZDMoavz7gmDNikLtXcM6Bz25x7QAUbqcui8i3musJv
 /cngwLQe8Ob11R7QGi5yEukvp6MCnXcOSKqcSMFD/pFh/6dqUy44ice63GZ8oY5VM3TkT0GJ4h1
 cE7QaCjaJbnPjLc9Ogsr1HJs2iyU9K970OElIdy7ZftOJ3+hmXlzoHsOMH/HXB9gbVEBWnn1cVO
 JAS0f6GK2BF1f8KKYNDsYbAKvr56Ao7CLuLi0SniekTZf0944dtdcUA89iviHO5tTwCA+Y/mvqC
 UnihUFvxrMMm0Ihf4v5TkDIt4DAYngQQr6L5IXzcl7vRO5yNeWOAsp1tRfn5cmYyEJCD8VbOy0E
 IAz+txRW9AnoiDw==
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

[3] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
[2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts#L39
[1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L3334

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 dtc-lexer.l  |  7 +++++++
 dtc-parser.y |  6 ++++++
 dtc.h        |  3 +++
 livetree.c   | 30 +++++++++++++++++++++++++-----
 4 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index de60a70..5da4ca5 100644
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
index 4d5eece..94ce405 100644
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
index 4c4aaca..06771c5 100644
--- a/dtc.h
+++ b/dtc.h
@@ -205,6 +205,7 @@ struct bus_type {
 
 struct property {
 	bool deleted;
+	bool append;
 	char *name;
 	struct data val;
 
@@ -263,6 +264,8 @@ void delete_labels(struct label **labels);
 struct property *build_property(const char *name, struct data val,
 				struct srcpos *srcpos);
 struct property *build_property_delete(const char *name);
+struct property *build_property_append(const char *name, struct data val,
+				       struct srcpos *srcpos);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
 
diff --git a/livetree.c b/livetree.c
index 49f7230..74eca1b 100644
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
@@ -165,15 +179,21 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
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
+				if (new_prop->append) {
+					old_prop->val = data_merge(old_prop->val, new_prop->val);
+				} else {
+					old_prop->val = new_prop->val;
+				}
+
+				old_prop->deleted = false;
+				old_prop->append = false;
 				free(old_prop->srcpos);
 				old_prop->srcpos = new_prop->srcpos;
 				free(new_prop);

-- 
2.46.0

