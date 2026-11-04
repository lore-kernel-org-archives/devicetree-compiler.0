Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827136;
	b=ntW72r/ekI/4AEVuvvEoBTB+tfn51jBRh5vyZquzjW9NlRGcIdvqKZ7ElYMiFjwqgJVn
	 YGlqQQLMGYSiWeOipome9+aQ2oFuXsjejfmoIr35NKBI3gRmCyg2KCZK30YtcNzOgIaYO
	 qnjqGMctL9AZlLPZLkgn4O0EVENReQ5DLnVP16hEWQmv+hzPUGzHt2bsMaHoOgxSGIjQu
	 E/1IezdTp7fs6+TQS27Fn59SMkQZCmYiqOQXx2PfwSPZFUsSHQxQbvQidJyITH947qlcU
	 7hJ2nGHBgjKSTry6nn0SP4v5R4OGhN6sGOf6NeQzEvvZr04gsC3T8eLFT6Hs6PcdIbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=71b7ezOdwBycQ4AAEIu4cc0gmbOkS7aofQ7TjFJbvME=;
	b=zKxLYWNhZnEIrK3jWOJfZlAZupTY7uvilJpvkSkbln3XL9Sswi7ssWISq1d1/9yJf+Ec
	 mnz+xt0ykMuxymUQiuUSPL/sDAtvQqn16Y6eQCqOjlte2YIaiaKi1FXLRMmsmeoBvsp6a
	 vEMeCj6jsN2BKfwpOvjdljK6lVOvVikOesWj5B1qe2bCYVs+ltuMKAGxmT5RdNeMQ7RLU
	 3Hjml5xV2A2kIW5VLR82E+UsZTuDySkqnIUTyz4whXMEtnnHdEtDGgmHphqZ8mzCotUer
	 5BZpkK+GUqcQxAetkzQSq8OoVLcvs+cog5N3xSgZp7WpUMSEy+ogVFaIQ59lMNEHruw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cSZA6XTT;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BA7606A849
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BA7606A849
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cSZA6XTT
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-5326cdde017so407841b6e.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827135; x=1794431935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71b7ezOdwBycQ4AAEIu4cc0gmbOkS7aofQ7TjFJbvME=;
        b=cSZA6XTTc51N+Gx4+SYRXC2ripKv/jW4H/ucfQ/LGKjxbqlfXFgeWnwYJDqADHxGB/
         GPfVF6CLdVq8iG6Tx827AAWh9HA6ZTp0ej0mOZVN+QwpwF5hebHJZZObY45pNoVmiR7P
         rnDUqJM8VpOHaPLOuTht/5RLHGbwtBdOXyWHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827135; x=1794431935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71b7ezOdwBycQ4AAEIu4cc0gmbOkS7aofQ7TjFJbvME=;
        b=cCdZtIveVDZkPjCLepFDqp1GF9znaSuvL+lMIm/FM4CdtGY7E+TFjf8YtIfWXDwHNw
         orRgaQxu/gQGxU0pXF88zJAx6UH2AueJxs8PUs1BRoRzrvqKLsdHvhIU9KoZaC9sBETm
         nhyZGCQShnmKWJ9JhwjQ8xMS6aJvmjqbwEU12lBMXFkMOriZfMb/5HyM97QsBdhaFc59
         Ct9cd3sEMFBG74ziEFiwtMyuqM2t+iKDdDDp705q3+INbnpSm+hoR8S0bsM6fJ8sp9/E
         po0R3C8HbT0rFKqUEeB4FbLDP2PMIVKB/Qf6oHDkhQHQdl8atMF1ma+UIw1N/Q4CB3NZ
         ARSw==
X-Gm-Message-State: APuU4Z+wjas/R8K2mkPLtabfc4Ae/oLFOpGyH+nfqOim6Fk9RprnbTbi
	pV04JHkTcEQqmC8PeRuwtZSH5sHnFo4kw2ide3ZMJ0C7Uf/ws3Z4mo3D1lsy0oImApgoTdYp1iO
	AJ/Ij7g==
X-Gm-Gg: AYBFou1Iq6LYM/RLUucqHpcSAIAKyl6tkhN1CRcyKtunk7NWJfFLzoD3s3SGsGFmYZo
	e/X+BZ5//2eP2GMZ0xtQYWWaA+5lyszY5SoNKg/tK4ftEL6RApKAgxCS9eQI3Esp6XX7qTTv+O1
	N8ZqICxUhVHr0rWQUtQ1+J7lTjZiadkfR+23XurTRtYZKGqnj4VM3pZNaCOMnwlgARgU61PiS1w
	7ZsCuj8UHFQUYC3/GtUm3PWa2qRCzzKgt+yjAjn+l57+0c7ZQVhVbx6XvdW/oN+zluGS0Mck5LJ
	yvcoVChaIQZzf/t2rbHm37QRsJUvH0Mjog9bd9cLIokpsGi+r7Bc0c6MoJwlDick2t7oF7d+PdC
	dAQYVBfcC8EooxDtJtLRkxLBR4aHP3ZTBTXJODK2TZNqIoH2n/tH1452A3xUEg5e1HS1V5BxoJN
	PZUY63tXm2amQrF6G1EigD4FKjawNFESUQ3D1KojvqlCYEE3IkYenOO+DH7nksptLom+OkSSF9c
	Cjt/HYDMshahpdRQpp0EGSYcu/7DJQR4cpy494gIl/F8lh7TRd4xe1Uj3KYq3EbQsvpI46Ln4qf
	Tfz9p1oREPU5+JVRP6a03HNq6f/7D5islDRNiRxtGQUsxzXpUH/evLYGnfBbsY7WlojbOj29++U
	ew4el1O4c58xSnhxH3J56Kw==
X-Received: by 2002:a05:6808:1828:b0:4f1:6ab6:8fc0 with SMTP id 5614622812f47-5640dc2923dmr13688247b6e.15.1793827134721;
        Wed, 04 Nov 2026 13:18:54 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:54 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 14/15] dtc: Merge the fragments of a dts file after parsing
Date: Wed,  4 Nov 2026 14:17:53 -0700
Message-ID: <20261104211807.972610-15-sjg@chromium.org>
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

We would like to deal with each top-level fragment of a dts file before
it is merged into the tree, but that requires the fragments to be kept
apart until the whole file is parsed. At present the parser merges each
one as soon as it is parsed. The grammar actions also need to know
whether the file is a plugin, which they find using $<flags>-1

Have the grammar build a list of the fragments instead, in source order,
passing it to build_dt_info() to store in struct dt_info, and merge them
with a new merge_fragments() once the whole file is parsed. This calls
merge_fragment() for each one, so the output does not change, and frees
each fragment once it is merged.

The $<flags>-1 term is no longer needed. Within a devicetree action it
reaches back up the parser stack to the value of headers, i.e. the flags
from /dts-v1/ and /plugin/. The sourcefile action passes the same value
to build_dt_info(), which stores it in dti->dtsflags, so
merge_fragments() can use that instead.

There are two differences in the errors. A syntax error later in the
file now stops dtc before any earlier reference errors are reported, and
reference errors now come after any other errors which the parser
reports, such as a division by zero, rather than in source order.

Apart from these, dtc gives the same output and messages as before for
all 4246 .dts and .dtso files in Linux v7.3-12284-g3799eeb906c9, and for
the dts files in tests/

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Pass the list to build_dt_info(), adding it to struct dt_info here
- Return true on success from merge_fragments()

 dtc-parser.y | 65 ++++++++++++++++------------------------------------
 dtc.h        |  6 +++--
 flattree.c   |  2 +-
 fstree.c     |  2 +-
 livetree.c   | 40 +++++++++++++++++++++++++++++---
 5 files changed, 63 insertions(+), 52 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 9cda518..0ff04c7 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -24,22 +24,6 @@ extern void yyerror(char const *s);
 extern struct dt_info *parser_output;
 extern bool treesource_error;
 
-/*
- * Merge a fragment into the tree as soon as it is parsed. The flags come
- * from the actions using $<flags>-1, which relies on the rule being always:
- *   headers memreserves devicetree
- * so $-1 is the value of headers
- */
-static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
-					  unsigned int flags)
-{
-	if (!merge_fragment(&dt, f, flags & DTSF_PLUGIN))
-		treesource_error = true;
-	free_fragment(f);
-
-	return dt;
-}
-
 %}
 
 %union {
@@ -58,6 +42,7 @@ static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
 	struct node *node;
 	struct node *nodelist;
 	struct reserve_info *re;
+	struct fragment *fragment;
 	uint64_t integer;
 	unsigned int flags;
 }
@@ -92,7 +77,7 @@ static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
 %type <proplist> proplist
 %type <labelref> dt_ref
 
-%type <node> devicetree
+%type <fragment> devicetree
 %type <node> nodedef
 %type <node> subnode
 %type <nodelist> subnodes
@@ -117,8 +102,9 @@ static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
 sourcefile:
 	  headers memreserves devicetree
 		{
-			parser_output = build_dt_info($1, $2, $3,
-			                              guess_boot_cpuid($3));
+			parser_output = build_dt_info($1, $2, NULL, $3, 0);
+			if (!merge_fragments(parser_output))
+				treesource_error = true;
 		}
 	;
 
@@ -171,50 +157,39 @@ dt_ref: DT_LABEL_REF | DT_PATH_REF;
 devicetree:
 	  '/' nodedef
 		{
-			struct fragment *f = build_fragment_root($2);
-
-			$$ = merge_parsed_fragment(NULL, f, $<flags>-1);
+			$$ = build_fragment_root($2);
 		}
 	| devicetree '/' nodedef
 		{
-			struct fragment *f = build_fragment_root($3);
-
-			$$ = merge_parsed_fragment($1, f, $<flags>-1);
+			$$ = append_fragment($1, build_fragment_root($3));
 		}
 	| dt_ref nodedef
 		{
-			struct fragment *f;
-
-			f = build_fragment_ref(NULL, NULL, $1, &@1, $2);
-			$$ = merge_parsed_fragment(NULL, f, $<flags>-1);
+			$$ = build_fragment_ref(NULL, NULL, $1, &@1, $2);
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
-			struct fragment *f;
-
-			f = build_fragment_ref($2, &@2, $3, &@3, $4);
-			$$ = merge_parsed_fragment($1, f, $<flags>-1);
+			$$ = append_fragment($1, build_fragment_ref($2, &@2,
+								    $3, &@3,
+								    $4));
 		}
 	| devicetree dt_ref nodedef
 		{
-			struct fragment *f;
-
-			f = build_fragment_ref(NULL, NULL, $2, &@2, $3);
-			$$ = merge_parsed_fragment($1, f, $<flags>-1);
+			$$ = append_fragment($1, build_fragment_ref(NULL, NULL,
+								    $2, &@2,
+								    $3));
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
 		{
-			struct fragment *f;
-
-			f = build_fragment_delete_node($3, &@3);
-			$$ = merge_parsed_fragment($1, f, $<flags>-1);
+			$$ = append_fragment($1,
+					     build_fragment_delete_node($3,
+									&@3));
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
 		{
-			struct fragment *f;
-
-			f = build_fragment_omit_if_no_ref($3, &@3);
-			$$ = merge_parsed_fragment($1, f, $<flags>-1);
+			$$ = append_fragment($1,
+					     build_fragment_omit_if_no_ref($3,
+									   &@3));
 		}
 	;
 
diff --git a/dtc.h b/dtc.h
index e223bc2..437efbc 100644
--- a/dtc.h
+++ b/dtc.h
@@ -372,13 +372,13 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
-bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin);
 
 struct dt_info {
 	unsigned int dtsflags;
 	struct reserve_info *reservelist;
 	uint32_t boot_cpuid_phys;
 	struct node *dt;		/* the device tree */
+	struct fragment *fragments;	/* not yet merged into dt */
 	const char *outname;		/* filename being written to, "-" for stdout */
 };
 
@@ -388,7 +388,9 @@ struct dt_info {
 
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
-			      struct node *tree, uint32_t boot_cpuid_phys);
+			      struct node *tree, struct fragment *fragments,
+			      uint32_t boot_cpuid_phys);
+bool merge_fragments(struct dt_info *dti);
 void sort_tree(struct dt_info *dti);
 void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
diff --git a/flattree.c b/flattree.c
index f3b698c..aa183a0 100644
--- a/flattree.c
+++ b/flattree.c
@@ -923,5 +923,5 @@ struct dt_info *dt_from_blob(const char *fname)
 	if (get_subnode(tree, "__fixups__") || get_subnode(tree, "__local_fixups__"))
 		dtsflags |= DTSF_PLUGIN;
 
-	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys);
+	return build_dt_info(dtsflags, reservelist, tree, NULL, boot_cpuid_phys);
 }
diff --git a/fstree.c b/fstree.c
index 0f9a534..88ff4ba 100644
--- a/fstree.c
+++ b/fstree.c
@@ -72,5 +72,5 @@ struct dt_info *dt_from_fs(const char *dirname)
 	tree = read_fstree(dirname);
 	tree = name_node(tree, "");
 
-	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree));
+	return build_dt_info(DTSF_V1, NULL, tree, NULL, guess_boot_cpuid(tree));
 }
diff --git a/livetree.c b/livetree.c
index a70a7ba..f2c7703 100644
--- a/livetree.c
+++ b/livetree.c
@@ -552,7 +552,8 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
-			      struct node *tree, uint32_t boot_cpuid_phys)
+			      struct node *tree, struct fragment *fragments,
+			      uint32_t boot_cpuid_phys)
 {
 	struct dt_info *dti;
 
@@ -560,9 +561,11 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	dti->dtsflags = dtsflags;
 	dti->reservelist = reservelist;
 	dti->dt = tree;
+	dti->fragments = fragments;
 	dti->boot_cpuid_phys = boot_cpuid_phys;
 
-	fill_fullpaths(dti->dt, "");
+	if (tree)
+		fill_fullpaths(dti->dt, "");
 
 	return dti;
 }
@@ -710,7 +713,8 @@ static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
  *
  * Returns true on success, false on an error, which has been reported.
  */
-bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
+static bool merge_fragment(struct node **dtp, struct fragment *f,
+			   bool plugin)
 {
 	struct node *dt = *dtp;
 
@@ -738,6 +742,36 @@ bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
 	return true;
 }
 
+/*
+ * Merge the fragments of a dts file into a single tree, in source order.
+ *
+ * Returns true on success, false on errors, which have been reported.
+ */
+bool merge_fragments(struct dt_info *dti)
+{
+	bool plugin = dti->dtsflags & DTSF_PLUGIN;
+	struct fragment *f, *next;
+	struct node *dt = NULL;
+	bool ok = true;
+
+	if (!dti->fragments)
+		return true;
+
+	for (f = dti->fragments; f; f = next) {
+		next = f->next;
+		if (!merge_fragment(&dt, f, plugin))
+			ok = false;
+		free_fragment(f);
+	}
+
+	dti->dt = dt;
+	dti->fragments = NULL;
+	dti->boot_cpuid_phys = guess_boot_cpuid(dt);
+	fill_fullpaths(dti->dt, "");
+
+	return ok;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

