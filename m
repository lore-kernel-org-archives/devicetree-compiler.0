Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C71553A2
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724961885; cv=none; b=g+zevUG4yRqvGx9fJxihq3vMup+Gs6kmAA24TpfdZsfQz///6dmCbgWFA5njmeU+DC/RhOiU1IKci+1nKTcvs4UbNiPb3/TaQUnGw13OlS6Ja7vJeuA1sxQTItje0goOW5YnMuyRjBlKTCl3AtrCTx5C3oCKQisHk16rI6tGvv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724961885; c=relaxed/simple;
	bh=rDOTJbPRAMRCy/dw+MLXZT7A0BWQeCrTBUrBH++lEsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pY6Zrf2Ym+bOcUQFLeF2my8xij8u+dbPdsYENH37po2HtQG8703IQvq3M1zopoAi4CnQQ39zsDq2/79EuCZXFoVdVhfFT9FI1z6cDmGVt/CCHgz7u6jkqxB0u00Ux/ALfSPzpeeunHxNwsRTwx4xHbvw9p9AO/HTruTOMFbU1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=tXUJ9QiK; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="tXUJ9QiK"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-20223b5c1c0so9927425ad.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724961883; x=1725566683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urSmB3lShHmY+anta9VHkl9WA5iWR3kGQqb97Im9CR4=;
        b=tXUJ9QiKZEbTHJppgQ7ly5MGyaB85VxMNdRZf/NkIBSquDesNVb2xgxcsEM5k5fDk4
         Hp+lScFmCTZCKojWQ+NiwjkiaYEqQCZqjwPg4wY7Kxw2nA4UPG3UoYWDERI7FAXZAF33
         F6gsjX1p2RbmitDb/J3XhmleJny1Z8dkaYbfEUhGIzx6E51pRpvHcLgTeeX1FzLKNhLl
         rHREyBOcspyPi+AcVXq/C7r5ASMUcK6zsLK+ONNdaF8dsltrlmnmq6xSx8FX9kYgzoTo
         AI609k4IpcWpoFFhQZJNcSsabBgbp15RfjlaAK/2Ur+EZ+vHRq1lyyx4iJN7j9QbOb8K
         pUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724961883; x=1725566683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urSmB3lShHmY+anta9VHkl9WA5iWR3kGQqb97Im9CR4=;
        b=s9IMHH1+ZQbvkJMyWBEnAm2p2aDRBWOOdUTY5sfAVtRCZy9apYQkm0SvWDh/7UDUZP
         /nHHCufEIAppMZw+qwh4NhHtPY+EHXVa/OKx4xLjxeODuciIpGYQ0SiCT1Fqq5kuYoCc
         LQWbcFx3JlR0rXptCVMego5jdXQEcR93iCrMRwdOgaqDXZlXRr3fQj1eh/6DPr8hnxnU
         Wm72N9uLHruUJyBaZ1xvEyovH+S+/2EUHgXRGtcZ6b0YlPRUnRKirfZpyNjs2hbCvHdx
         HQvikGLxmKZUMgyDpIVbqXE5UBjkIGVhjivNGVvXCgeEdhfd8vWjKKSN6TlyeFRkMviU
         sG5w==
X-Gm-Message-State: AOJu0YzYfOYBmvW1bH9HKiKvcY7tpDTX8W9TSSlittV/syTrBl8MVkUf
	UUlB0p42ujO2JprMbAY1Q+WNkqlZ+Q2Kw3URrNbqvNsXfRhfTjRIe2mrJ69eGQ==
X-Google-Smtp-Source: AGHT+IHA3LKKJsHeDskUvh2zrFs4tToBSWAICZV+SLc7cYx8JJqEU+d9N7ytnGOVpSadTQ1m7IdP7Q==
X-Received: by 2002:a17:902:c40e:b0:1fb:90e1:c8c0 with SMTP id d9443c01a7336-2050c4b73bcmr56469695ad.63.1724961883384;
        Thu, 29 Aug 2024 13:04:43 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051555140csm15105575ad.244.2024.08.29.13.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 13:04:43 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Fri, 30 Aug 2024 01:33:39 +0530
Subject: [PATCH v2 1/2] dtc: Add /append-property/
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-append-v2-1-ec1e03f110ad@beagleboard.org>
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
In-Reply-To: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>, Simon Glass <sjg@chromium.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5064; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=rDOTJbPRAMRCy/dw+MLXZT7A0BWQeCrTBUrBH++lEsk=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm0NRSe0QgIxot0XD7UBMZtCcdf0QanaNvv5Cq7
 aJj7xIS/wGJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZtDUUgAKCRAFzvXHieVa
 dJXvD/4q+QqCMcrgPcBiRObJOlnvt8b68buKlPwUZrqmCK3omSGNaM4qbT7aoXOUEj/0WqJY/Cm
 yTFg+CR/45HnQ/c26Pr6SKOtpLFrmmSNNHd7aFI+5zNMl7KCjoNgEwuzAdw71TH2h5PJxVC8kZj
 t77b2L8wZEYSE20fZDU6c3+XG1NxcfEHB3Me+UWFtzFvz77d5EOdVKXvQkhFPZ6M9LZ7Rp9zQbu
 A3C8tVeKVR3FYk1RDIMcjffTMnb5AMDW/CAkcbLC7Cac1FOFJs/+IDTDJ3mCVC/o46+ad0bdgUC
 yv9cf1HzJBM2+xlfAD7mnAQk7pZuaqCfb4a4gqCZHZfdtFRJhXErNEJqmckfxwyF1hi6Tdd3Wli
 JCEVtmeyrn0rZUwsXkwMPfQ/5HVfuJFYu0P2+YbeQ6HNV6Cv62V+bMlcIU9wh3wFbFpoYgYCTVW
 3w6ZOA16yeubEcFhyoIAokj6jDa7OJJhST92aoXtNtGAseWM8SU5WqrrKaAsQa3WTk89cynQhB3
 Mj2eD1gK96403v7+FGIvSRQ8kT7wIUe5HPG+2A8aqEUHLm1knuqizPEVcbgSQ8x4rSxqLgmRPud
 NnXYYBGNgXLO8xZXavdqdUo3RJC/LB4UeuJFhX4iaY6SGeOrqaQHhNGoNOWcA29mJcNRaU7bSJv
 d4RpU5ixN9uxxQQ==
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

Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 dtc-lexer.l  |  7 +++++++
 dtc-parser.y |  6 ++++++
 dtc.h        |  5 +++++
 livetree.c   | 29 ++++++++++++++++++++++++-----
 4 files changed, 42 insertions(+), 5 deletions(-)

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
index 4c4aaca..3c9ba5a 100644
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
index 49f7230..d9b4dc9 100644
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
@@ -165,15 +179,20 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
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
+				if (new_prop->append)
+					old_prop->val = data_merge(old_prop->val, new_prop->val);
+				else
+					old_prop->val = new_prop->val;
+
+				old_prop->deleted = false;
+				old_prop->append = false;
 				free(old_prop->srcpos);
 				old_prop->srcpos = new_prop->srcpos;
 				free(new_prop);

-- 
2.46.0

