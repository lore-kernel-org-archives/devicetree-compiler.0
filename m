Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551126;
	b=1Xe4McmoozEkPzCOlH8yIDjzAea39GNGuuMW8etgXxmLzweeBky1g9bPDRPgnHSJftVj
	 AwHC0CD293PcnLU6TP6lTX6gZmZHAW6+8vFB6cluPfzaXow7chyRL3AzVTjVBM7tIh4uO
	 Z80cKL+Y0SwEJcm3iROMgSZAdzlv3QsX3rvlr60jSBLXuNKgase7KljN2WHjsJdAGZOT5
	 1SL3I+lJA++41tgx2xkfqfH2wMIKuZH3315+a5wWWjk66y8afxsc33aHR5M0GmDHXFd5A
	 JvoCDw7izINo0BJKFw/d1eyECQb7OTMRzfTzC4MsdeGqf8e5kXByG3zAbDTZz0+41dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mTOqoKRwVFx+Kr2ZpxPsgKC5iFmmollSjjQDSYRNEk8=;
	b=3p6S+BX4N8kzUc/uVaI0K2leje4l9gWqOyQZ6n382JYRyUaGfvuRWUnWcWooHqzf7ZvZ
	 iEBQ7DbWfme+8atWgIBqaAMDv7/npxzCgvuYCgUcwMLNhYsuEo2kW6mDOvTXOes8NgdUC
	 1OcT5C/j+zBK7KFsljFq7mOSIfcW4NCJrl/gRRRYBsGLnaJQ7CfDSxr4o2XgE7BUvrlGm
	 fDbKLn6NRg4RV3Qr9tm/4s4JagaNBHcDWv3BPP+iD5D5eBRduqGgG/83BzSg7ZG1cgClf
	 VgU43gwA3YenqqzZ8j2zxtXI3yX/p8o2f7Nf+O4rx5CgPpzBGiV3OMXqTOCUsSvVxFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bdU75CBy;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890EC606A326
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bdU75CBy
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f48c750afcso1434507a34.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551124; x=1794155924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTOqoKRwVFx+Kr2ZpxPsgKC5iFmmollSjjQDSYRNEk8=;
        b=bdU75CByXXWYyFGLh9mcAHMxxtl7HhVeD1xbJyKHYEIoqQJJrh5IooOLNCAxVc6QMH
         c2ORImuujRSGPThzzhY82Q9BqEEVMrMlTVdyfZ1bRQYe2N3BqEDH1eDRd+bijAaDR041
         0rfp0H1jxZ/0MziJ2O7WdZLpFPf7MtLx59IUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551124; x=1794155924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mTOqoKRwVFx+Kr2ZpxPsgKC5iFmmollSjjQDSYRNEk8=;
        b=s8KDR1BYM3Z57INVBy+UsUPNsSwj5y2/T2AjUF0tzRMzEMKqU4mOC9ZgBp1PkhpMhL
         9MSrYwHWzMWEcSkWHHtSFyHIpAnhlLcmHzdEWF4A9aGGXxacoqvpWWTAkG2WYqEVbpnE
         Ae2w7EQK/f5/WR8l/sbrWY6EdtZUYLRlJj8mSwC5tYw4/oZSY+bojRY03qLvkjvlAE3b
         QAtMmSZsuLzW3qpWGeYdBYsUmwNUy6zOtCb4uoqeV1sY0cb6JRUmq2V+CwRWvX7/RnZZ
         kqDq6mDOGAfFAuCC+EpMvHQm/2oiNUiaopS6eksfTKjGDxVazaaF75RXDdyhWPK+kLQy
         X9bQ==
X-Gm-Message-State: AFq9FYIL3Bn3QEvuDelnHFvUIv0pDyUnx0ErKIn4hOOhOk3n9VEUH/I/
	S2qa/9BkZjLqRQnnxwyQ+aPhYPL+Ql3MEQPTRUbnXnct/Loxw3zmLjghMTOIQoILdVFGxS4tKJK
	0HlpB8QDt
X-Gm-Gg: AYBFou3QFYoNvCAaXh+m+ewVmODLjuud1Wu3/bkekP5l66L+HePcfXkGrYeRuI0id2l
	Y73zfAFzNDGY+Zh68VZtlZWR1h4AbuJzSMPnmIxQ6ke4DifFDNNhaEmmmfTqroEFgg3leNI/xwB
	95LwAaYmgGZP0N6Fp6v+YCtpOH7M4WhIt+gudr464W8nRKMQsPJ0FUkaTYnfXGeiDY/yBCYDHhl
	S/srEYrG+kDsSbaLiaBL5A5oniXIF4Lc0vUNAgUEQi5g+eypRLHq7DYUwcOGzusBEoZAad2Yumj
	gaKu4WGLaWPoRGISWrL2G4v8sfl095BvOlDBgmOh9dzZfzLcp0T0SM4kDcGKzuMDbvAn8gOHj1a
	wqc3fArm7qX9T1+wOmZOsSRJRRLk0bNRk1aCayQHlhF8zAAXTw/4q7WDRtxNDOqeqtrr3UdHvc1
	JkbmHMTPbUvS0FwIdIHeuoB+UiFsRwxXoMjbiNygfuuxFOFzRzBk++uuSI7tocdJECX14QsFzDZ
	F+54S4NZ8oSlEucyV9EE6p+/Aq8CaUfIUbOZyY4Ovp0JDJfMLvA+tRLpKPiix9alvggUm7T7/mI
	mIaHFt5nkzYbNAWlyY/30GrhuYx+08a3m++u6hyt8gW47Q58jntFPOGoJrMCv5ZAvPJbbV2gp+u
	V7yadqy2qVFEglywepH0/0A68xcO1HLPYMEZnBNfTUB0=
X-Received: by 2002:a05:6830:4490:b0:804:bb22:6d42 with SMTP id 46e09a7af769-85d36405583mr5736071a34.17.1793551124441;
        Sun, 01 Nov 2026 08:38:44 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:42 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 12/13] dtc: Merge the fragments of a dts file after parsing
Date: Sun,  1 Nov 2026 09:37:06 -0700
Message-ID: <20261101163721.2458982-13-sjg@chromium.org>
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

We would like to deal with each top-level fragment of a dts file before
it is merged into the tree, but that requires the fragments to be kept
apart until the whole file is parsed. At present the parser merges each
one as soon as it is parsed. The grammar actions also need to know
whether the file is a plugin, which they find using $<flags>-1

Have the grammar build a list of the fragments instead, in source order,
and merge them with a new merge_fragments() once the whole file is
parsed. This calls merge_fragment() for each one, so the output does not
change, and frees each fragment once it is merged.

The $<flags>-1 term is no longer needed. Within a devicetree action it
reaches back up the parser stack to the value of headers, i.e. the flags
from /dts-v1/ and /plugin/. The sourcefile action passes the same value
to build_dt_info(), which stores it in dti->dtsflags, so
merge_fragments() can use that instead.

There are two differences in the errors. A syntax error later in the
file now stops dtc before any earlier reference errors are reported, and
reference errors now come after any other errors which the parser
reports, such as a division by zero, rather than in source order.

dtc gives the same output and messages as before for all 4162 .dts and
.dtso files in Linux v7.3-12284-g3799eeb906c9, and for the dts files in
tests/

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y | 43 +++++++++++++------------------------------
 dtc.h        |  2 +-
 livetree.c   | 36 ++++++++++++++++++++++++++++++++++--
 3 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 1ed9731..c1aa4ad 100644
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
-	if (merge_fragment(&dt, f, flags & DTSF_PLUGIN))
-		treesource_error = true;
-	free_fragment(f);
-
-	return dt;
-}
-
 %}
 
 %union {
@@ -94,7 +78,7 @@ static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
 %type <labelref> dt_ref
 %type <fragment> fragment_ref
 
-%type <node> devicetree
+%type <fragment> devicetree
 %type <node> nodedef
 %type <node> subnode
 %type <nodelist> subnodes
@@ -119,8 +103,10 @@ static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
 sourcefile:
 	  headers memreserves devicetree
 		{
-			parser_output = build_dt_info($1, $2, $3,
-			                              guess_boot_cpuid($3));
+			parser_output = build_dt_info($1, $2, NULL, 0);
+			parser_output->fragments = $3;
+			if (merge_fragments(parser_output))
+				treesource_error = true;
 		}
 	;
 
@@ -184,42 +170,39 @@ fragment_ref:
 devicetree:
 	  '/' nodedef
 		{
-			struct fragment *f = build_fragment(FRAGMENT_ROOT, $2);
-
-			$$ = merge_parsed_fragment(NULL, f, $<flags>-1);
+			$$ = build_fragment(FRAGMENT_ROOT, $2);
 		}
 	| devicetree '/' nodedef
 		{
-			struct fragment *f = build_fragment(FRAGMENT_ROOT, $3);
-
-			$$ = merge_parsed_fragment($1, f, $<flags>-1);
+			$$ = append_fragment($1, build_fragment(FRAGMENT_ROOT,
+								$3));
 		}
 	| fragment_ref nodedef
 		{
 			$1->node = $2;
-			$$ = merge_parsed_fragment(NULL, $1, $<flags>-1);
+			$$ = $1;
 		}
 	| devicetree DT_LABEL fragment_ref nodedef
 		{
 			$3->label = $2;
 			$3->label_srcpos = srcpos_copy(&@2);
 			$3->node = $4;
-			$$ = merge_parsed_fragment($1, $3, $<flags>-1);
+			$$ = append_fragment($1, $3);
 		}
 	| devicetree fragment_ref nodedef
 		{
 			$2->node = $3;
-			$$ = merge_parsed_fragment($1, $2, $<flags>-1);
+			$$ = append_fragment($1, $2);
 		}
 	| devicetree DT_DEL_NODE fragment_ref ';'
 		{
 			$3->type = FRAGMENT_DELETE_NODE;
-			$$ = merge_parsed_fragment($1, $3, $<flags>-1);
+			$$ = append_fragment($1, $3);
 		}
 	| devicetree DT_OMIT_NO_REF fragment_ref ';'
 		{
 			$3->type = FRAGMENT_OMIT_IF_NO_REF;
-			$$ = merge_parsed_fragment($1, $3, $<flags>-1);
+			$$ = append_fragment($1, $3);
 		}
 	;
 
diff --git a/dtc.h b/dtc.h
index 41013f5..fdd0d75 100644
--- a/dtc.h
+++ b/dtc.h
@@ -368,7 +368,6 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
 				    struct srcpos *srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
-bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin);
 
 struct dt_info {
 	unsigned int dtsflags;
@@ -386,6 +385,7 @@ struct dt_info {
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys);
+bool merge_fragments(struct dt_info *dti);
 void sort_tree(struct dt_info *dti);
 void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
diff --git a/livetree.c b/livetree.c
index 1e012d4..68ad3c3 100644
--- a/livetree.c
+++ b/livetree.c
@@ -537,7 +537,8 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	dti->fragments = NULL;
 	dti->boot_cpuid_phys = boot_cpuid_phys;
 
-	fill_fullpaths(dti->dt, "");
+	if (tree)
+		fill_fullpaths(dti->dt, "");
 
 	return dti;
 }
@@ -718,7 +719,8 @@ static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
  *
  * Returns true if there is an error, which has been reported.
  */
-bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
+static bool merge_fragment(struct node **dtp, struct fragment *f,
+			   bool plugin)
 {
 	struct node *dt = *dtp;
 
@@ -750,6 +752,36 @@ bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
 	return false;
 }
 
+/*
+ * Merge the fragments of a dts file into a single tree, in source order.
+ *
+ * Returns true if there are errors, which have been reported.
+ */
+bool merge_fragments(struct dt_info *dti)
+{
+	bool plugin = dti->dtsflags & DTSF_PLUGIN;
+	struct fragment *f, *next;
+	struct node *dt = NULL;
+	bool error = false;
+
+	if (!dti->fragments)
+		return false;
+
+	for (f = dti->fragments; f; f = next) {
+		next = f->next;
+		if (merge_fragment(&dt, f, plugin))
+			error = true;
+		free_fragment(f);
+	}
+
+	dti->dt = dt;
+	dti->fragments = NULL;
+	dti->boot_cpuid_phys = guess_boot_cpuid(dt);
+	fill_fullpaths(dti->dt, "");
+
+	return error;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

