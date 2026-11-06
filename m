Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994816;
	b=yamV9UHLplJ+JHVu1e1sKDD/KsPuGOvVNysJXknyyhCxzEW20nL6GHj3h4sVICYcv/VV
	 83EaA32lpRbvVM/AKi5C7UzmZH42e2Puy65dH5TQyKCcN6ZwsEaCI7VJ8WrAiK4RycTn4
	 ieQ4ua09sdRz1zfWRNN4gHbgMm/TuvSzGKa/Y4AVvoiDEzDNxIDdoIej6O87pb9F0Bltd
	 wg7mL0HTohAj9hId6vxiwkYx9Lh7NbzBg/LrJGlfGYLnAr4r/BR5+1GoEf5E5VDPxMoNU
	 /LFWRHNgkyKRJmg/YmalmVax3xWfNSaFCZbsVej3kr4bh+7/0eIc/d3Lz2jjeISlf1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mboxy/g8r+xzy5K2/y+ttSouTKP+Ny766gRfOnwH0iQ=;
	b=gq6nGdMlyLCKRf3enatmbj49tYRoMLhf9R0IxqR414WxGCTtmjl0T5VQXthM/QpBCQCa
	 eeAw2idxupkj1WOEl7RxP4KzlRTe/Oyq2GCpRpPrMlN7pot4qGb7BszMsuN6oPzDVe9SI
	 A2HDW5mZHQsUOHs1/SD2qwbQgZB5NeFRSNGXsAXQQCXp1uagrCScJgYRixQ3UcY0/LyU9
	 P4f2YlqnOk9854CVx9L2iJyfDYI4KDdrNnI0v0BOGquIzlXKvxtxduNpT7KKgqz60oz3e
	 0jnfwtxwJQ8VqglmLICKA6O6OQA5nku7th/zmBs1Ds59MxPZ1+7az+cJz7vN5f6s37A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SQmP04yX;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD07606A32D
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD07606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SQmP04yX
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4877837890fso501933fac.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994814; x=1794599614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mboxy/g8r+xzy5K2/y+ttSouTKP+Ny766gRfOnwH0iQ=;
        b=SQmP04yX11vQ20AzgKmUpJm2M0hv78eq9BFY4lIv9O2QLS9ptFLAzksYuNVLQ/J/+m
         Uqyp5EfNCNcw8A+NbmrwlRzJ8LwBIWhAtt0pG+9v+ufYN2tWlNm/s3l8RldNrFzvjPC4
         u7zdWV/MtZ6LBGqRAPtoytUFxLmy/Qn9oJ67M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994814; x=1794599614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mboxy/g8r+xzy5K2/y+ttSouTKP+Ny766gRfOnwH0iQ=;
        b=jD3vCugukf3Az3puXtVagLHQ1DCh6gqnB7Qwy3dZZgGIHkJBnKriA/BeyXC7X7CKTt
         9dIm9kIMs/nrFRefAJMl2vTw3zXdANce0B0uHvfQqtct66iN9am18Klzw+uLWq9G8UnD
         tdY2pYDFA1zUOVS9l8eAlPq7azxKyGqLdlEQw940dXOOqAQhCtAqSSin5zcrxddCTNgF
         l3cNpdvDBCBGv7KBSOhioEoimqTsVy3ltKF9Mh5sfjajjRxfYVL8IZObsvrM8+FeLDb9
         aR5v1b6r+jd2s9flYypcySCa5GYYdRSjTVuvOjTf0xWfzLRLbdCL2Ct7otszAr5u++0n
         3YqA==
X-Gm-Message-State: APuU4Z+dIhjQV2LBZQyN/UKjFQZCu+z96o5seWENKrjqYszPFemsFn+M
	JcV2ATAbI5KtaYTQEM8azYi+s34CMrDq6wYecuKhsr+LdiM7jioyH+YXCoOFS8LH0ZxOgZJ95YF
	Ug45Osg==
X-Gm-Gg: AYBFou0NkQIt9YWD9VE/WACg9XZrA8fS1adRXQwHxopBYsjz66u5MvWeFvi41o8QsOq
	YvOzytQeFZrGsjYYlrSNfun71gNcgM9uW3ZbG2RVLSLnduqd4I0cJs+bWvA9bf3HyMWMZEJnXAo
	bk5zdj2AvpVMJYEC+HtTfo7DIA6atDaKCfCOGW6FZ7JhDd3nzBwX9SBavycqA63d7YBEA3xmLEO
	Z4+U6tm6HW9dfLnM6cPxwSd4ig7IAygVvFguhtgrAAD3n3QTnX25cOY9qCo+U8kCx2OjjpGG/UT
	DmeVZApTzvDTRxoflM4SZkwN6sWj+0bwLnMlnn5PhTnKDbonOzZJSfdGq4urLk4UPU0x1ijQ2AY
	i8WL8WcC/kv1B+3syD3IcoULjCEjZfu2USoFm/Q/ZcvFSrG7Huc1DiSb7MB2pu4mgxUZUOGiQk7
	Cy+3xU896aXVNrtg4/n/H4XUxcW3ILQT/9NsrYrr64f+PZLpnAAcgXjSZPqy0mWYe26lLrShhMf
	wxvb5ls/ML9dbjztkXCQ3QGpvvr9E92xaLGDW/jhfHdf05aoLVIh9NJSkZ6we/LbLkBbUmJLoJU
	dyDEmWHuu6Egd7qmbKvE9Vo/4w4aLm+p5WQEX9QFAphs0auktjmfbqWmupBUB8s2etzdB0nzC9u
	t/DTKHp2WTpaK9ZUqCea0
X-Received: by 2002:a05:6870:610e:b0:479:7931:cd6a with SMTP id 586e51a60fabf-4ad98aff1c9mr2252551fac.32.1793994814361;
        Fri, 06 Nov 2026 11:53:34 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:32 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 12/18] dtc: Add merge_fragment() to merge any fragment
Date: Fri,  6 Nov 2026 12:51:39 -0700
Message-ID: <20261106195159.2623314-13-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106195159.2623314-1-sjg@chromium.org>
References: <20261106195159.2623314-1-sjg@chromium.org>
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

(no changes since v2)

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

