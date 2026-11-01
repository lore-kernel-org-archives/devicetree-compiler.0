Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551121;
	b=Dkk3DwYI2G2R1ye5BtOOKBGgcBfzulkFcIBenl2rRjMMKpXq+ng6wR7Y2MsTQtA3GkgU
	 r4rFMZmyTR/J/v1KMvM/SinL7/nlDg5LaH+BvcY96JCvwdQip9x+BJ5xFEjHHUGagkPVu
	 DoudQb6xG0V+guMEOB67dWh4nikvoZ1aLhS5bTepDeQk8mLehsZfsJrqr10wrpD2JnGcb
	 GtsnwUvuAGVJnJXGJo3CC4ulwaxS5ssYJufTWp9ZaUokYiH6uTU9q+mZDMTdrN3bWIJG4
	 gYQ90WLWgBbwbV8ZTPkYig5tt5SogTAY7KpXxNGmzBJZQ8DHAH7woyWeh7Gu8bIRCgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Avqhk8jEeCqNZtylCa+TZ5GwC9or7NORpLDOlLKqVBo=;
	b=PUpxwTq0gQuhR8xgs4muabiol+Ry5gcL3ezxFRzsYfIxmImIKDNM2FumgJh0fCGMNK4n
	 he6+XpnzbEDACBIQD/bSTfCQ3LLC8tY7oO7KWq0I5UgFZalG2J+vXu7hGyU3z6AX25wPr
	 djSyxFv97tP+5434SQ4WYJlcU1VZOii3lH6cC8u8Lf8vqAidBZXHlF9JOttAPJBrfcw56
	 Cl8ueR33N3+I9MRNVj5I6Nvl32CEbkIUJ+2EvF2cPQPbWMsPJca1xwrffHANwAqRfAAJr
	 dpijkY7RMGtJ50egI8x4EqTzYMdmfQ2219IgKjyCoFwwS1j7z2hRjszKu0lGB5bEfug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mpfKVwx5;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD057606A325
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD057606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mpfKVwx5
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6faddda49e7so1911961eaf.3
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551120; x=1794155920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Avqhk8jEeCqNZtylCa+TZ5GwC9or7NORpLDOlLKqVBo=;
        b=mpfKVwx5pfkupEfm1/FT13X/TsALsZK6CVyIL6JggHEtDsRvclRTghRVsTAUXW9I/5
         Rw8n8X/5zbqLhtod1SXrtYOggWpYDr9UGqvQFIF7klwFUB8cpzZwOYx58osx5TAssrIA
         R3QSCTOcvpTyYBPln+EvpWRrm/RjAnFPdCLME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551120; x=1794155920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Avqhk8jEeCqNZtylCa+TZ5GwC9or7NORpLDOlLKqVBo=;
        b=lK7j57YF5xefA5Sp9xTjZQ+8cucvfgECfxDAnUdSe7jR8W+H/tw9qUo1O7n+G/DZjG
         iL91f0LCaUCdtyb9vbIROCSyZYLatgmwS+S5P6iuztV7KWuvmTVxKSU3BlHkn1llbQT+
         3BUCVAN5LL7h/RqPgxZFnZfVor1+RRD+3pvw2pPN0HT1Vl++5bI2ptcbhai7MrhJZJnt
         V+Ct/moRAFZkxMv7KBIYeQXFZMY8B7XdWF4NkmzXeuOrlyt+oeSsug3TAkaE9Jm20TPZ
         2XigcC1RwxhdzCitfwjo63JyFysUA49+n3vuXfmXmo6ezWfQq4z7MHo+G/McaCc37p3F
         sEvA==
X-Gm-Message-State: AFq9FYIrV3kaTi6HMxO2W/aK22B8QQd8+ra0qTpIorlX70dW9rii7LeT
	KvxKcylm+QJER8Qa9n0BU5TAxsRX+reLJPekCQrNfLdWa4kQWIiUwYzBq5J3h1RQo64whQkcXHK
	Ve9effvi7
X-Gm-Gg: AYBFou2KQEY/OlHSh77RQb/8XEhV8ZfwzTcyaNMJThBLHFawe+78pj9nUT1RZ41G1PK
	WX/ieTa7GRm5auBhhIedRyKO8tkOnv4VvuCNBR5EXL4hZJtDWIdBbklQGWdWzWdM3h7KjhBtuex
	TDdp/BKDnvKY6XOpdbSqXSVU3bjEZ1aGVYnSkXgt4wycVtQHfyGXn0OCHZg2lIIuIa5w1SmpDgO
	/kTvAYNtf32gYjhNdoXHyOF17DATe8HwKf71XdgHmV7Y08TZrXeD2SswB8XMojkWO+MV++VHqAD
	/RibhyBTtXLOzBRRbslr2HqjL1+AzeuwQLyppjjDbxI4+vGZDLtYmcIoBV5H1hm6SDtFLqBAljz
	gsUIEGoAsdFxUbp+J26fDvjQfQ5cY8WpYne336K9gUONjB2LAsr8+74AdX+SDtOQWwYtd89Lp39
	hyuOJWlKfavqWuKZ0m/ISVXR5uX6b4d8yNqJvI7o/2s5uRCiE4EdzAtBXe7fY1JZv1D7hM5vJUF
	BGYEbm5Y3SD6MfhNgj/Jcp0qa81+Ow6ST6qHAjck7oiAL9Aaqu93Pj5aEini5zTngfKJz1/BkF6
	BC3lv2XSNJrPqb4g2TV7qmXbgrf+/nuTrNN1H9Vk1bA148yYCnjeGpw7W07tEFSqbrz87qDFErf
	HKsXCPwjbtCC6Nzx6ej+SWQ==
X-Received: by 2002:a05:6820:1386:b0:704:d59f:2a2f with SMTP id 006d021491bc7-714f2a515e6mr4492895eaf.86.1793551119761;
        Sun, 01 Nov 2026 08:38:39 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:38 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 10/13] dtc: Add merge_fragment() to merge any fragment
Date: Sun,  1 Nov 2026 09:37:04 -0700
Message-ID: <20261101163721.2458982-11-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101163721.2458982-1-sjg@chromium.org>
References: <20261101163721.2458982-1-sjg@chromium.org>
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
fragment. The two rules for a plain label or path reference become one,
using fragment_ref, and the functions used by merge_fragment() become
static.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y | 74 ++++++++++++++++++++--------------------------------
 dtc.h        |  8 +-----
 livetree.c   | 50 ++++++++++++++++++++++++++++++-----
 3 files changed, 74 insertions(+), 58 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 32f7c26..1ed9731 100644
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
+	if (merge_fragment(&dt, f, flags & DTSF_PLUGIN))
+		treesource_error = true;
+	free_fragment(f);
+
+	return dt;
+}
+
 %}
 
 %union {
@@ -168,74 +184,42 @@ fragment_ref:
 devicetree:
 	  '/' nodedef
 		{
-			$$ = name_node($2, "");
+			struct fragment *f = build_fragment(FRAGMENT_ROOT, $2);
+
+			$$ = merge_parsed_fragment(NULL, f, $<flags>-1);
 		}
 	| devicetree '/' nodedef
 		{
-			$$ = merge_nodes($1, $3);
+			struct fragment *f = build_fragment(FRAGMENT_ROOT, $3);
+
+			$$ = merge_parsed_fragment($1, f, $<flags>-1);
 		}
 	| fragment_ref nodedef
 		{
 			$1->node = $2;
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
-			if (merge_first_ref(&$$, $1, $<flags>-1 & DTSF_PLUGIN))
-				treesource_error = true;
+			$$ = merge_parsed_fragment(NULL, $1, $<flags>-1);
 		}
 	| devicetree DT_LABEL fragment_ref nodedef
 		{
 			$3->label = $2;
 			$3->label_srcpos = srcpos_copy(&@2);
 			$3->node = $4;
-			if (merge_labelled_ref($1, $3,
-					       $<flags>-1 & DTSF_PLUGIN))
-				treesource_error = true;
-			$$ = $1;
+			$$ = merge_parsed_fragment($1, $3, $<flags>-1);
 		}
-	| devicetree DT_PATH_REF nodedef
+	| devicetree fragment_ref nodedef
 		{
-			struct fragment *f = build_fragment_ref($2, true, &@2);
-
-			f->node = $3;
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
-			if (merge_path_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
-				treesource_error = true;
-			$$ = $1;
-		}
-	| devicetree DT_LABEL_REF nodedef
-		{
-			struct fragment *f = build_fragment_ref($2, false, &@2);
-
-			f->node = $3;
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
-			if (merge_label_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
-				treesource_error = true;
-			$$ = $1;
+			$2->node = $3;
+			$$ = merge_parsed_fragment($1, $2, $<flags>-1);
 		}
 	| devicetree DT_DEL_NODE fragment_ref ';'
 		{
 			$3->type = FRAGMENT_DELETE_NODE;
-			if (merge_delete_node($1, $3))
-				treesource_error = true;
-			$$ = $1;
+			$$ = merge_parsed_fragment($1, $3, $<flags>-1);
 		}
 	| devicetree DT_OMIT_NO_REF fragment_ref ';'
 		{
 			$3->type = FRAGMENT_OMIT_IF_NO_REF;
-			if (merge_omit_if_no_ref($1, $3))
-				treesource_error = true;
-			$$ = $1;
+			$$ = merge_parsed_fragment($1, $3, $<flags>-1);
 		}
 	;
 
diff --git a/dtc.h b/dtc.h
index 32e4394..41013f5 100644
--- a/dtc.h
+++ b/dtc.h
@@ -368,13 +368,7 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
 				    struct srcpos *srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
-bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin);
-bool merge_labelled_ref(struct node *dt, struct fragment *f,
-			bool plugin);
-bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin);
-bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin);
-bool merge_delete_node(struct node *dt, struct fragment *f);
-bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
+bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index f2244e2..6a290fb 100644
--- a/livetree.c
+++ b/livetree.c
@@ -555,7 +555,7 @@ static bool is_ref_relative(const char *ref)
  *
  * Returns true if there is an error, which has been reported.
  */
-bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
+static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
 {
 	bool error = false;
 
@@ -582,7 +582,7 @@ bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
  *
  * Returns true if there is an error, which has been reported.
  */
-bool merge_labelled_ref(struct node *dt, struct fragment *f, bool plugin)
+static bool merge_labelled_ref(struct node *dt, struct fragment *f, bool plugin)
 {
 	struct node *target = get_node_by_ref(dt, f->ref);
 	bool error = false;
@@ -610,7 +610,7 @@ bool merge_labelled_ref(struct node *dt, struct fragment *f, bool plugin)
  *
  * Returns true if there is an error, which has been reported.
  */
-bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin)
+static bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin)
 {
 	struct node *target;
 
@@ -646,7 +646,7 @@ bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin)
  *
  * Returns true if there is an error, which has been reported.
  */
-bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin)
+static bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin)
 {
 	struct node *target = get_node_by_ref(dt, f->ref);
 
@@ -670,7 +670,7 @@ bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin)
  *
  * Returns true if there is an error, which has been reported.
  */
-bool merge_delete_node(struct node *dt, struct fragment *f)
+static bool merge_delete_node(struct node *dt, struct fragment *f)
 {
 	struct node *target = get_node_by_ref(dt, f->ref);
 
@@ -690,7 +690,7 @@ bool merge_delete_node(struct node *dt, struct fragment *f)
  *
  * Returns true if there is an error, which has been reported.
  */
-bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
+static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
 {
 	struct node *target = get_node_by_ref(dt, f->ref);
 
@@ -704,6 +704,44 @@ bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
 	return false;
 }
 
+/*
+ * Merge a fragment of a dts file into the tree at *dtp, which is NULL for the
+ * first fragment. A reference is looked up in the tree as merged so far.
+ *
+ * Returns true if there is an error, which has been reported.
+ */
+bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
+{
+	struct node *dt = *dtp;
+
+	if (!dt) {
+		/* The first fragment is the root or, in a plugin, a ref */
+		if (f->type == FRAGMENT_ROOT) {
+			*dtp = name_node(f->node, "");
+			return false;
+		}
+		return merge_first_ref(dtp, f, plugin);
+	}
+
+	switch (f->type) {
+	case FRAGMENT_ROOT:
+		*dtp = merge_nodes(dt, f->node);
+		break;
+	case FRAGMENT_REF:
+		if (f->label)
+			return merge_labelled_ref(dt, f, plugin);
+		if (f->path_ref)
+			return merge_path_ref(dt, f, plugin);
+		return merge_label_ref(dt, f, plugin);
+	case FRAGMENT_DELETE_NODE:
+		return merge_delete_node(dt, f);
+	case FRAGMENT_OMIT_IF_NO_REF:
+		return merge_omit_if_no_ref(dt, f);
+	}
+
+	return false;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

