Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994822;
	b=kbfrBhMEooFRqZ7SsXieN6yBu8N11jJH1pGAD52cr3zFLExBs76i2pHFoBC70Ehu6eRz
	 9fa6jAkQ31pbUYYC5tP2xNeHZ+IkupwHNyZ2ld1vvQHS29iHaL/ouiYExgkqPbITeo7nr
	 t02XF/fO3h6r2BWlIIPHNrx42uPk084B0yFtRukW2WsAR5coGA7eOcu9sPJjbOrPRA642
	 eOnrcdPM6lO5lQdlxJ71OqXjTXl5Oi6nfS7KrXmma8pPeyiYrGH7IuSakgSS71x9LHbKR
	 BfK7KFop4OnTxOoA3IX7biZ1P8uL6nY+zc26nKT9GExvkiokLfWTth0ifk3UaWyls4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a3hcsb6ZVsmZzvDbxWgJ0dTBojX2SvR/bRtXnB9hfL8=;
	b=ndo0ure7i75A08w8cpQ39ZabyhtOjem3NRSSLgAuWclwVDn9+Fu52CMKfwXFMCcY8OuV
	 WIR3POQzdo54eXbKpl+K66x+1LtKLJLhSDZrx6ef5dAOzYVzevAWWMt/JO5zup2ZTljQl
	 9eM272gswR4ZxDcnkVMDsVKPhZ1K+sk7MpCZU0brpJRx4WMq/7bUDY+EPTyphiseFcOa0
	 E+Nwjzubbj/egOyixxjp7LtH4tSNt7zUZbPlHoSzOIaZtXaMifwZQ/lOrkYEIfkXJYTox
	 tr/TV/F3dJjKzYXt1BIFnfS0UZ7rZHS6T1elOAdRwik/y05qDKvGb1y7ZJX9nQjWZdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WE8I+yTY;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74080606A329
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74080606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WE8I+yTY
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so511891fac.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994821; x=1794599621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3hcsb6ZVsmZzvDbxWgJ0dTBojX2SvR/bRtXnB9hfL8=;
        b=WE8I+yTYBC6Kwdi7gxuenysq1UxYhBwfnKbT7aJJ83SzPcxjJyUgY5TUK49isizZHv
         NCLJFsNl0miAtFTx/FjMVjnqp7xFOG4qh6zd4/HBqxB30htCwT+wDsmv40L2u5uGh2d7
         klYhC9GP/ZZY6Yj38f3513HT+4M0Y22HmbhpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994821; x=1794599621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3hcsb6ZVsmZzvDbxWgJ0dTBojX2SvR/bRtXnB9hfL8=;
        b=dzST1F0k6FoYLU5gGzBM3Ar/C4NiQZWwYCw/M9f5rOEvpjkJQjqiurNQc0z2WXMz2z
         A7XVok4cyWN5FMGrU1dCF3NT6adqd1SY2F7PaDFkRLlBzMK1HAO4u7SGYhXrHyI56d97
         ZtH5F62UIe7XVLpyaTn5hoDW40WeFyjskZIkOGCVMUtYFS3jU9tSqi3dfIm+NfIP1onV
         jBfb6MCgPDXBO9jE/Bl1kxLL/IURLsLxQokoRMcJQTmGObjvuIjkykSIvV4l2qqZRgXz
         tIgtS5KtavnHa22DYgHs+v7uXUc2NqpTlELHe9mGH28KdwK/CmI5+TsQuNE2RFTAYwuo
         zvqQ==
X-Gm-Message-State: APuU4Z+H/rf/jITUiQRFGYVhWoqW/ETVQqljCZqB3ZMImRlOLy/hEnLV
	JnF0Qlp/MuGp+RO5z238SVZT5UYCpSlp9ZiJP+1rh2bpU1dMWQEGU8zLQ5A9iufaaX+f5rFMFzB
	Hhdbi4A==
X-Gm-Gg: AYBFou1sc3sJLYypRW1luE8LMGGhL0/gltMxk1ImLSsi62yVSOC76lOMVjE//w7Q/o9
	4XowlR0Nm/eYQ/ZlXTSe7ZyTIcQG6WF3HKTXgGlV6dddoKNNQISyp0xK6Pxvsct19hqYcfbsYm2
	2r1wTbOSQLpYUWSd5Hn3rHpyp3SSvS8zvy84kLcCdoYQ6aZglBioioIvKr7pVEo9pEG54iTDKXG
	FKGZ9DH9assW8FbYcfHW9amTkfQvAMzZ59pQUBeEzNihGeAC86J/OGCm3oUuqlledylr36JMWqV
	gmfoyZs1rI6vn/zT7lc7OhSRCDhnlGQzK14oYYId2NfHYq1OUGs4S3i4CHX5k4DBJAzrlN7psue
	O6fTU2oDMtpHtKDZRGR1auapUIqhIXVhBIqls0K4SrEVpz9Sb7kzJNG7GeASRnP0cx0KxLaGhtA
	tJFtdorS0Xbczor4YLWP4s+DoOcYeM/TpubewuNngl3CFSSZizHNliHXkQPJqa6gFF3Q2k+sCSp
	5ZXqOnunVhwJ8tEer/vGJ4G5AGM23dWNj3RcktXhFy8BiycQu37GUs+ecCG+myulv+4kTvpygqn
	zx5YksJ4t+c8BAmHD1mFApO+xlgeM+jo0OMOa3SSwH+Ym7NU5lXrfree/xqA+WM9+G5I7xDU8wf
	Gv3ct8RRdweivmAbMB1/v5IVNRkY5C2UsdK+sGF/7CA==
X-Received: by 2002:a05:6870:8a0b:b0:475:e2e9:4f4b with SMTP id 586e51a60fabf-4ad98ac8634mr2517718fac.25.1793994821430;
        Fri, 06 Nov 2026 11:53:41 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:39 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 14/18] dtc: Merge the fragments of a dts file after parsing
Date: Fri,  6 Nov 2026 12:51:41 -0700
Message-ID: <20261106195159.2623314-15-sjg@chromium.org>
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

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---
Apart from the two differences in the errors, dtc gives the same output
and messages as before for every .dts and .dtso file in Linux
v7.3-12284-g3799eeb906c9, and for the dts files in tests/

(no changes since v2)

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

