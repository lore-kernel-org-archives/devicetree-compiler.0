Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718513;
	b=LqOViwRfLG18vYcJOX+H3c+m/M8QQP9Grk+058E0P5mKfma17gRjdfEU6mQIFefEQvQk
	 +zCfFjV8h7HbdMSYj6x5jIWC3Ddzm60JNfrbgIMchsEw+94lCFIW5nAJ7hZfHdF5hpn9y
	 ZCLTD8E6aQkZWY3qgprYFKKEDZiFqve8YWc/jEQyUQ8TdoGCpEcLd2vse0hIJfVS6+Z94
	 MbVysC3cSNEXQxTv1CLFAsYSJH9HbF/hPvfgqyGDrTxgmrphxowqEc9PQ7f5Y9VxfnNva
	 RwzONOoJsg/7bYOEUTtsfT1kX6aCIKbXPryoSy3uqi2FUYkvOO62NpJXtUZqimfPAoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hifgvC9yh+Tjh2GLRA9Xa7HCkYzT6FU9ePdPIOCC+zs=;
	b=joOGDRhRaEbZ8TN5G9ptaiqakpVdAMn8Y8Ro352WCJqfa7vtTk9DTnr6iEQCjKtNMgw5
	 Ti3rzyErc6rq7+C7bdGdINBDOobmjfLr9x0kN0ZkZogh6cSLhdFq8XnqPk8jGx9Az1GeG
	 4YnIn/Z9Y7UNrj99eHIXGQzPIqr8ZmkMaHcVHNqUZMyQTg8beN/TP6+f47G8ahWwqoUxU
	 bG4REQlt8Tyifr7V7dV6wGwCO8zyxgQmrPaEMVT53SYr+ZpudtJd7MPh1iytKZyGJ8JYe
	 EdGBS2dtdKxGhK1JV3vkyhLRtRRPuu4GoEXwqm30X82SqgPg1UKGUNWGu24zqZkpobw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UhoqsZuY;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D0606A323
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26D0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UhoqsZuY
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-85c1135c286so5384602a34.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718512; x=1796323312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hifgvC9yh+Tjh2GLRA9Xa7HCkYzT6FU9ePdPIOCC+zs=;
        b=UhoqsZuYE5I4OEQhEQuXQ4wxB6FgdD68bW8ejRhX8O7kQRgHRDcABo1ci7zgLq1Vot
         EUXhwpyBOo6pzaLVwzyu66PivlGjetRjdQIkE5OBGlVoN300vkAb2p6IjzIV+aJP9TOR
         Eh2Nmg+JAEl9xviFwStu55tPSwBQBqif4m0yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718512; x=1796323312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hifgvC9yh+Tjh2GLRA9Xa7HCkYzT6FU9ePdPIOCC+zs=;
        b=Uyi+FXglCLppXY81HEUEBx39PpoxtcKq/pPJNlqdgL2KisdZGIgbWc04oQn2oVHAjj
         K5xXiaDeSbejuce4BOf/gCOOOzn2BMcr+tyJjtmdUe73fSWQtfdW2rIYtY0OEKQCkBva
         7VeQkBVjkExoUAH2LJFA1Jp00K2T1Sy7wDqLaZNb5HNpt/SyMrFQ6KeBR3TJOsPS8HpJ
         g0xlZJEH9B2a8zv836gQ8PUJz3kitHcXO7py+zblXM5sII7ssrygsuEmsCotxsTJ4aQ1
         knrFcalRcy7UKJB3bYvyVxpfF4gH5qexw/0UIp162x8nDCxHr6t0X2ZTu6Agmxn358aG
         Klrw==
X-Gm-Message-State: APuU4Z/wN16vAjVcJ9o4Q0OSEfB84UhwelxBCyvHkY30qY89MAtLUD05
	GrRWvsc71de5mm7jvUFUAhuwaOkra5h5lnzbwi56FFnIM2/V/d6ZCVdq93A2etDI6/TmtZocBG9
	YzVgu7g==
X-Gm-Gg: AZFdTZcC0dKu6xZNyjDC5K6hQVkqaJaaICKJVv+B85UI90pxXzs1Fvr9VRW+1qR9Q57
	WGYULOw172fSN94h9UFBPgV0Z7M6nYfQFcfB7p4i0FWLk82D4tFICbBqU1Yj4JU2HVclbLe1iBU
	4BDzvaWGjRlbGEnCjNZFty+QsggkO8NMHRZP13wGP9Tf7qv4jw1ZwkHk6dogjPmZcqs9th/T6mM
	DISW+FQSX/UG7hyqthIqWi7x5Qd78W+I31NKqKUn3OwAYQPT4ua5mgCtT1H/Ndj80ue7nLePs7d
	39Z8AyOjVvrluadI+kI5u+s53Vj2t9dISAgq7Q+vggeQHp9hfkln/KtFHS+oWCa0huu0O2kzruf
	Tvp+MaDAv1WvOAdrTnfiiQW8d/GxkHoLPNREiZuF8jdtlOxMtmwWKFseJBzgS6haISQrUM//mrV
	fbqWQqwdQB0BROd3i7xrD7jbsoKna36tGcjBpKlD4P2S7aoTgLWjn+RnCZybtyHqKarhklTh7tF
	tC1y0XhqJP/Z3ZfGRYqD1iW/vjcspDh7JvExNXap7rUJpt2wt/JBH1gdFgJKUEE24W6wkSe8RFc
	byFtZL7zPWnOtRSmdmz2QtBe1fDVu0q3nsce09dauob2T9BLSKQbptpuaBpbzwZVsA3Tj2JHwjk
	0mr6S8x6Uqh+gOezKudoIr2z/sxPqBWzO50hQejcI/Qg=
X-Received: by 2002:a05:6830:82f6:b0:85f:ee8:26c1 with SMTP id 46e09a7af769-86315994ac9mr24950864a34.22.1795718511796;
        Thu, 26 Nov 2026 10:41:51 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:51 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 08/10] dtc: Move path-reference handling out of the grammar
Date: Thu, 26 Nov 2026 11:41:07 -0700
Message-ID: <20261126184126.1472738-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126184126.1472738-1-sjg@chromium.org>
References: <20261126184126.1472738-1-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The grammar action for a top-level &{/path} { ... } holds its merge
logic, including making an overlay fragment in a plugin.

Move it into merge_ref(), which can tell a path from a label by looking
at the reference, and use a single rule for both kinds of reference.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---

Changes in v5:
- Use the term 'source layer' rather than 'fragment'

Changes in v4:
- Look up the reference once, at the top of merge_ref()

Changes in v2:
- Combine merge_path_ref() into merge_ref()
- Combine the rules for label and path references, using dt_ref

 dtc-parser.y | 27 +--------------------------
 livetree.c   | 31 ++++++++++++++++++++++---------
 2 files changed, 23 insertions(+), 35 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 8e67182..993eb7b 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -192,32 +192,7 @@ devicetree:
 				ERROR(&@3, "Label or path %s not found", $3);
 			$$ = $1;
 		}
-	| devicetree DT_PATH_REF nodedef
-		{
-			struct node *target = get_node_by_ref($1, $2);
-
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
-			if ($<flags>-1 & DTSF_PLUGIN) {
-				if (is_ref_relative($2))
-					ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
-				/* A path is in the base tree and a label may be */
-				if ($2[0] == '/' || !target)
-					add_orphan_node($1, $3, $2);
-				else
-					merge_nodes(target, $3);
-			} else {
-				if (target)
-					merge_nodes(target, $3);
-				else
-					ERROR(&@2, "Label or path %s not found", $2);
-			}
-			$$ = $1;
-		}
-	| devicetree DT_LABEL_REF nodedef
+	| devicetree dt_ref nodedef
 		{
 			struct source_layer *layer;
 
diff --git a/livetree.c b/livetree.c
index 18ac4ab..0be2da2 100644
--- a/livetree.c
+++ b/livetree.c
@@ -544,29 +544,42 @@ bool is_ref_relative(const char *ref)
 }
 
 /*
- * Merge a source layer which refers to a label into the node with that label.
- * In a plugin, a label which is not found becomes an overlay fragment.
+ * Merge a source layer which refers to a label or path into the node it refers
+ * to.
+ *
+ * In a plugin, a path always refers to the base tree and a label may do so, if
+ * it is not found. In both cases, the source layer becomes an overlay fragment.
  *
  * Returns true on success, false on an error, which has been reported.
  */
 bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin)
 {
 	struct node *target = get_node_by_ref(dt, layer->ref);
+	bool ok = true;
 
 	assert(layer->type == LAYER_NODE);
-	if (target) {
-		merge_nodes(target, layer->node);
-		return true;
+	if (plugin) {
+		if (is_ref_relative(layer->ref)) {
+			srcpos_error(layer->ref_srcpos, "Error",
+				     "Label-relative reference %s not supported in plugin",
+				     layer->ref);
+			ok = false;
+		}
+		if (layer->ref[0] == '/' || !target) {
+			/* Add a fragment@N node for the reference */
+			add_orphan_node(dt, layer->node, layer->ref);
+			return ok;
+		}
 	}
-	if (!plugin) {
+
+	if (!target) {
 		srcpos_error(layer->ref_srcpos, "Error",
 			     "Label or path %s not found", layer->ref);
 		return false;
 	}
-	/* The label may be in the base tree, so add a fragment@N node for it */
-	add_orphan_node(dt, layer->node, layer->ref);
+	merge_nodes(target, layer->node);
 
-	return true;
+	return ok;
 }
 
 /*
-- 
2.43.0

