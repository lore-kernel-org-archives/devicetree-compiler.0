Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827132;
	b=PQMgneGRHr/RaxxT2ty9ZNijpBOgOxcdW/5L2zLQun4ks+V3sWfpim92xO51XO/Dtozf
	 VARBaLp6gIrQU68nxUrWZ+WReXR1UagleR27XiIpm3wXRFPj7I5XnhgUgxcPBfjywgl78
	 elfd20fATxA2QLhNxgjcJOzKZz7CgqFBPz2Z6SxviiRL5694TSsJLfzUYIA0V7ympfXrY
	 PJz5SNKipOS4c5pqFi4UiOvalCAjyNJKVAAlTCcrVx/qE2935BNfOzeyFWUvgeuILEtT0
	 1gP+M1GXnnTOYMojMy7D3cXgCxko/DjSub/108rayzoynRxJDW/nLDC7Hw6ZChv/HXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d1IEvRQJg8f7HjxU+oTdOuWNI/HJ2Fwu6U1a7Qr/Zqo=;
	b=HBFYeZfAIyLsD5fsGAYSw3Fj3Ha5GuY2P+AIXRV9HcVNr+QsWwPqJVK3q6XQWXiadPLq
	 sDYCSu6VaWuE7eN7TWnXJW6zL9QHfdUs74OlZuHaOFMlF476as2++Q+LZMMAyUxXcgRKz
	 uhwtJSCAQqo3Kw7ArJblol9Lfx8ACWWY/WNx4Kw6ilPlqCWY91gOPpOSU+kqjyXKsVbnu
	 m/ijG7h6+zzTs5QjRA7I/QJnQL3U/esCJafjLVNCZUdm5Bp33MdoMdLUlBAaX8Cg0H5hv
	 4o6gs7Q4lz2v5F1JmfZxgYGtht2964+Gf4fFrwcT7EdA9Tt8JsRCqqyLrKnxZvEhwHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BUqfD3eW;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A0F606AB33
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A0F606AB33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BUqfD3eW
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-483d290f398so780777fac.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827131; x=1794431931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1IEvRQJg8f7HjxU+oTdOuWNI/HJ2Fwu6U1a7Qr/Zqo=;
        b=BUqfD3eWum/ZcXctdxNoolXeRLsQ/wzOJIkaHZrTWlpv3wiXmK4LuigKdsJ8PMgCDW
         yLuzFUZMX0XQ4trQNfDiLJiSZclbx57pfbmaHv0uEBqm4rX7GwuoxTs3/6280kcqNM4A
         +Epa+wMhr4iZNJZPjTAH2fVus8BOndKuX1XCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827131; x=1794431931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1IEvRQJg8f7HjxU+oTdOuWNI/HJ2Fwu6U1a7Qr/Zqo=;
        b=yrzwVxSTVy5pMVW3et5tQGxJJxE+knloGNkH+5T+Vev61KtwyLqbfaXceBtZl06zPx
         wz30a6v6mw/OOTa4ba9rGiTntbE9fQmS1JIdwlNhgjb4BnJmE2Wfy0X9qqMVpAa0SmAP
         HgnThfczRHfc7Pdin+Ebbx5j8rTmTGw6z9voAOTniP0oCKSf5rNr/bxXjBlqkUYlq5s1
         Yf87wuMy7uTPxlIRFklCypbyTUroxOqFh5K0mjWkolLZ87I793ZCtU1R5xdXnGg/bjxw
         dvJ6dbn7ga3yFaSyrHrLecDdgd1GvrQjLrSuXQEcZ8r5/EXm7ROa+uEBwXm9T0ygvKey
         RxOg==
X-Gm-Message-State: APuU4Z/1GWDEenDdOSCdaq1Og2o52VO1naAYx0/uRlhZe3lGmvYUEZ2d
	nWIcgPuO6RND+WaW7cEUL6FzyJxRGEHBgJZvls5p8enS7H/PsPRf0OTuufPL2/svcUPgmtLAaBz
	1z+6tkw==
X-Gm-Gg: AYBFou0ohWQD5u7Zh509FWYO0Ah3oK7KAKXckL461a2aq/FHs2ZSwsULC2SUSmlbBNE
	1y0gu8Z3JOj74jMh/gxrKGiaL3e4wBliPKY765Qjen9Sbwwh6rpbEhH2Jh3k+rzsJwuXWSro9TQ
	4SWHLN+VG7CGOKaaLDi8dGtdu8GE258fHSzUYmQcSPECPNrfTh7+wB8My4kLph8wCH8P50O3FyO
	su7S7+aqP/pEZxcK3CqsxJjQ4gdyRiLPoh4ddnG7LR8Dw0yTXjzOlGdGxAFmpUUUh2GdFCjAS2m
	oXOEHaloTxcwh1QBYYobFBK6toI2BMGjsktvOtJt2YOSsxXtz0DRHuxEBsJk9bYjyuFJWiASRDJ
	xI5ZQvBtWH7GJhe+r1p5sn6o/ep0MRrbOWXZ73CSA9dF1d1Is5G+JbHpgg8rUFuGmBbFWhT/h0d
	86m0WeRgsdZ5Mzq8KQbeHkhFaoqbcg38RgKfivxdHMIYOR6w/oJ9ldhJXBMQcKj6zZm05QOgDKi
	b2dPtOcioGvJsTcDzB54eeEluwUIlbIQflcwCdS7W4q32my6p6P3fjen9riwkBJ1wz5iwxRjft9
	91nEwocuKBO0xfQfLjF+Lt0QFDUd1Ncnp9DktfDXq3Dk8Z5l73oPDN7+MUNCSxupA2U96coJgre
	wcx7BS6o5+/D+KSW51rS9ug==
X-Received: by 2002:a05:6870:56a8:b0:49e:5b59:abd0 with SMTP id 586e51a60fabf-4a9076cd068mr12534320fac.24.1793827130873;
        Wed, 04 Nov 2026 13:18:50 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:50 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 12/15] dtc: Add merge_fragment() to merge any fragment
Date: Wed,  4 Nov 2026 14:17:51 -0700
Message-ID: <20261104211807.972610-13-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104211807.972610-1-sjg@chromium.org>
References: <20261104211807.972610-1-sjg@chromium.org>
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

Each grammar action which merges a fragment calls the function for its
own kind of fragment, sets treesource_error if that fails, and finds out
whether the file is a plugin using $<flags>-1

Add merge_fragment() to merge any fragment, choosing the function by the
type of fragment and whether it is the first. Have each action build a
struct fragment and pass it to a new merge_parsed_fragment() helper,
which calls merge_fragment(), sets treesource_error and frees the
fragment. The functions used by merge_fragment() become static.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Use the new constructors and return true on success
- Use dt_ref instead of fragment_ref
- Combine the label and path rules earlier, in the path-reference patch

 dtc-parser.y | 53 ++++++++++++++++++++++++++--------------------------
 dtc.h        |  5 +----
 livetree.c   | 42 +++++++++++++++++++++++++++++++++++++----
 3 files changed, 66 insertions(+), 34 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index abeee0d..9cda518 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -24,6 +24,22 @@ extern void yyerror(char const *s);
 extern struct dt_info *parser_output;
 extern bool treesource_error;
 
+/*
+ * Merge a fragment into the tree as soon as it is parsed. The flags come
+ * from the actions using $<flags>-1, which relies on the rule being always:
+ *   headers memreserves devicetree
+ * so $-1 is the value of headers
+ */
+static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
+					  unsigned int flags)
+{
+	if (!merge_fragment(&dt, f, flags & DTSF_PLUGIN))
+		treesource_error = true;
+	free_fragment(f);
+
+	return dt;
+}
+
 %}
 
 %union {
@@ -155,65 +171,50 @@ dt_ref: DT_LABEL_REF | DT_PATH_REF;
 devicetree:
 	  '/' nodedef
 		{
-			$$ = name_node($2, "");
+			struct fragment *f = build_fragment_root($2);
+
+			$$ = merge_parsed_fragment(NULL, f, $<flags>-1);
 		}
 	| devicetree '/' nodedef
 		{
-			$$ = merge_nodes($1, $3);
+			struct fragment *f = build_fragment_root($3);
+
+			$$ = merge_parsed_fragment($1, f, $<flags>-1);
 		}
 	| dt_ref nodedef
 		{
 			struct fragment *f;
 
 			f = build_fragment_ref(NULL, NULL, $1, &@1, $2);
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
-			if (!merge_first_ref(&$$, f, $<flags>-1 & DTSF_PLUGIN))
-				treesource_error = true;
+			$$ = merge_parsed_fragment(NULL, f, $<flags>-1);
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
 			struct fragment *f;
 
 			f = build_fragment_ref($2, &@2, $3, &@3, $4);
-			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
-				treesource_error = true;
-			$$ = $1;
+			$$ = merge_parsed_fragment($1, f, $<flags>-1);
 		}
 	| devicetree dt_ref nodedef
 		{
 			struct fragment *f;
 
 			f = build_fragment_ref(NULL, NULL, $2, &@2, $3);
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
-			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
-				treesource_error = true;
-			$$ = $1;
+			$$ = merge_parsed_fragment($1, f, $<flags>-1);
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
 		{
 			struct fragment *f;
 
 			f = build_fragment_delete_node($3, &@3);
-			if (!merge_delete_node($1, f))
-				treesource_error = true;
-			$$ = $1;
+			$$ = merge_parsed_fragment($1, f, $<flags>-1);
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
 		{
 			struct fragment *f;
 
 			f = build_fragment_omit_if_no_ref($3, &@3);
-			if (!merge_omit_if_no_ref($1, f))
-				treesource_error = true;
-			$$ = $1;
+			$$ = merge_parsed_fragment($1, f, $<flags>-1);
 		}
 	;
 
diff --git a/dtc.h b/dtc.h
index 1befd5c..e223bc2 100644
--- a/dtc.h
+++ b/dtc.h
@@ -372,10 +372,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
-bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin);
-bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
-bool merge_delete_node(struct node *dt, struct fragment *f);
-bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
+bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index 26d39df..a1d5d71 100644
--- a/livetree.c
+++ b/livetree.c
@@ -580,7 +580,7 @@ static bool is_ref_relative(const char *ref)
  *
  * Returns true on success, false on an error, which has been reported.
  */
-bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
+static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
 {
 	bool ok = true;
 
@@ -611,7 +611,7 @@ bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
  *
  * Returns true on success, false on an error, which has been reported.
  */
-bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
+static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 {
 	struct node *target;
 	bool ok = true;
@@ -651,7 +651,7 @@ bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
  *
  * Returns true on success, false on an error, which has been reported.
  */
-bool merge_delete_node(struct node *dt, struct fragment *f)
+static bool merge_delete_node(struct node *dt, struct fragment *f)
 {
 	struct node *target = get_node_by_ref(dt, f->ref);
 
@@ -672,7 +672,7 @@ bool merge_delete_node(struct node *dt, struct fragment *f)
  *
  * Returns true on success, false on an error, which has been reported.
  */
-bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
+static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
 {
 	struct node *target = get_node_by_ref(dt, f->ref);
 
@@ -687,6 +687,40 @@ bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
 	return true;
 }
 
+/*
+ * Merge a fragment of a dts file into the tree at *dtp, which is NULL for the
+ * first fragment. A reference is looked up in the tree as merged so far.
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
+{
+	struct node *dt = *dtp;
+
+	if (!dt) {
+		/* The first fragment is the root or, in a plugin, a ref */
+		if (!f->ref) {
+			*dtp = name_node(f->node, "");
+			return true;
+		}
+		return merge_first_ref(dtp, f, plugin);
+	}
+
+	switch (f->type) {
+	case FRAGMENT_NODE:
+		if (f->ref)
+			return merge_ref(dt, f, plugin);
+		*dtp = merge_nodes(dt, f->node);
+		break;
+	case FRAGMENT_DELETE_NODE:
+		return merge_delete_node(dt, f);
+	case FRAGMENT_OMIT_IF_NO_REF:
+		return merge_omit_if_no_ref(dt, f);
+	}
+
+	return true;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

