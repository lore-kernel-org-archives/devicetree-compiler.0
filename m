Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551118;
	b=pqUsG9Ug5BfKiyZU+MLTYj9nX25GXXzxCrS6hkhrGt5MJKnEDnnGjlgJkQ45h6etlr1H
	 wVJQNASyeA4BNZP6s9xUY7LUphr1mEf92nQRUIL+GIJmh4Q1rWrGJalP5OZgYu/iac4mF
	 ujVBep2WLgRUzJ8T8svqIiaRTMrfWAdNsLrj1mJwCkncsr6tyDb4+JaNC6kw3RsdGxRkL
	 hFyO/uD68OiPWEDHClBRzhsAyZ1orKai+FN860ehADF4A80PQGsezkczvR0elzOpRU+ud
	 GcFXUM47sDTSrEdBDPHQF/UGjHy3oHoy/6U+WbJ5Ep2TIvA4aft8BTfpvoSFMl/J8mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TBTpzhSFnK8SgXMOeFnvZ+YjyHTSaYOnDO3O/VOobzc=;
	b=E3BfiO4phUbNHZUb5zx7v3Hp0eCGYnkZXEGxYdiL+t4zMWwQv/Gd4D0UOL+Tdhvhpnfq
	 JetFqrmiVzW5OOFYUfXtN8kQb56vfSbjUAlcHK7AIWcyXGM64D0Pu53RVw6ZOyXev9FZj
	 9kFxZ0gBSlYAr5BmG7P7Mz7qWhnFh3UFvfPk2sj8qer7MhybXn/rixhcMcccOrpGYPfsy
	 bN5ip9zt8ETxk8NryOuxlAIa3hrsMqExOQBXNTfaj/fzeHaABThAFNxAdmn17Z+8Zgaiq
	 3u4OlRysjzWFBgVM2tMW7Bgy3qvhMLsZobCw4Jzve48V0Jj5+t2TvS9Ir+cb+jpSQ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=blToLnCW;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE002606A325
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE002606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=blToLnCW
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-84a248254f4so1660687a34.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551117; x=1794155917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBTpzhSFnK8SgXMOeFnvZ+YjyHTSaYOnDO3O/VOobzc=;
        b=blToLnCWLQNev+c/GSfyScnlLf/rU6rtmaQYv2eOw9qklYLw4zrpZ4EOPVq3cYuMCA
         AStrur/ravuD5fMM3xgKzv77z/z1GKr5zz4JpfxAkfO7CBKvFvVqhX7/yFn/TCQdxAcZ
         ECK3I4TJ1erPk8T6NVGzsYK++fg7FurVeJABs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551117; x=1794155917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBTpzhSFnK8SgXMOeFnvZ+YjyHTSaYOnDO3O/VOobzc=;
        b=Qs1aMfdEtRrvGcmzsIZCsYkyRwiCscetL6tGflFI/QeWpSamVKQ98sHiOX+X5i3BCK
         ZT8VEJB76H0RWoYd8ahUII+GBIMQFV5fNSGzwkAWFcmdb8ftQZdLQ0nKZ3AXYOLeKMpB
         UGJu7TKkrMpVkexVTXRsWrGG8UJ7lG5PA+Vml3I7KTRFsjlTjhLui8+TkYX3Fl+bI0Ym
         k2iq53E1I0p6rRU664lcPIgpP8mQ5H7q0x47wmMR9bKNMSSLalPTAdpKVn+f+tV658rJ
         QsruFRxAa0+0GGgaS6E6+j5UvwJmMswx2OwduyqJgzrB/67TkQuuOdznNWq8wG8EEyKk
         tCPQ==
X-Gm-Message-State: AFq9FYJ4l0bdOGfhm1W8lImHJ6Al+uV96nrGNC1OxgnWyton7Jhy8jl/
	Y/91MeGFsEq2La1e7KhBltMoQMHWt96k0rj8ab0dlLtVkLB2U0osYiyXSg5m74zQwys9QYtEzsL
	ZyVEkyimN
X-Gm-Gg: AYBFou1Ze0/X79Ar84Efwe71LsSxaQvJnQ91lhIbrV6L9lYbHGPz15eV0oIBB6zh1Dl
	sL8wKoxgT69p/aJxiwKpxMH2wR+c1XsegAIlt8TKBD0kolNHWN5gMQ1lxBrofLmOABlX4yEd1Yw
	ytXw5qR+WG4cRr4yYLYYQzdM+WS6LyZfR2aRxxsLnXAO1zVpx+lVNTouCSXt3IIRi7UMj4RJN1r
	z/9rNWu/BFpPNSrP2SqyPVV8VsklrCAGsg2FtC3A0FwjcDthMdnF65uIUXZcg+h3KRS0rKmeisf
	jzuCDOeBHEYO0OhAxJUOiIyTNQZ8Cb6pAz2ar3PG56uoCr4mqv51Ho41P49yHki5uJeRabMmkEp
	pMPjr1zDHHUKSLF6orDzZ2MO85JtuBLwRAXhbPftSA6lOWUYdQTpIOZo62yYWwGUTbL7R+HM7La
	lQyBkX9vDhL74uTdsRgMCJGJYjxooIGuJN5ep+SUpmP7gGnuVQz/vzNnu5GjZYJK5Xwzgj2R5DH
	vMtLz6LeYU5rAeXbjqebKLECTSHDE7wZOZXIxAlXJPbl1z/VbMgL0rXbq7bxG/Tm3T7KWvkGn5L
	ZYFTe6zAxoqa8poLMGzhlUj6BY6XKNCBzJxpDIHo3+sJloPx6h8/42idR5/Rac8JTUUIC3Z0/vp
	gkGMZ3oyXv5CemKnEqBA2ebyKeeXrjVWogcSxrbuWa1Y=
X-Received: by 2002:a05:6830:4494:b0:824:df9:971 with SMTP id 46e09a7af769-85d3636d0fcmr5876934a34.10.1793551116942;
        Sun, 01 Nov 2026 08:38:36 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:36 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 09/13] dtc: Move first-reference handling out of the grammar
Date: Sun,  1 Nov 2026 09:37:03 -0700
Message-ID: <20261101163721.2458982-10-sjg@chromium.org>
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

In a plugin, the first top-level fragment can refer to a label or path
instead of being the root node. The grammar action for this holds its
merge logic, which makes an overlay fragment in a new tree.

Move it into a new merge_first_ref(), passing it a struct fragment from
fragment_ref, with the node added. This is the last user of
is_ref_relative() in the grammar, so make that function static.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y | 13 ++++---------
 dtc.h        |  2 +-
 livetree.c   | 30 +++++++++++++++++++++++++++++-
 3 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 0e6c4c2..32f7c26 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -174,21 +174,16 @@ devicetree:
 		{
 			$$ = merge_nodes($1, $3);
 		}
-	| dt_ref nodedef
+	| fragment_ref nodedef
 		{
+			$1->node = $2;
 			/*
 			 * We rely on the rule being always:
 			 *   versioninfo plugindecl memreserves devicetree
 			 * so $-1 is what we want (plugindecl)
 			 */
-			if (!($<flags>-1 & DTSF_PLUGIN))
-				ERROR(&@2, "Label or path %s not found", $1);
-			else if (is_ref_relative($1))
-				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1);
-			$$ = add_orphan_node(
-					name_node(build_node(NULL, NULL, NULL),
-						  ""),
-					$2, $1);
+			if (merge_first_ref(&$$, $1, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
 		}
 	| devicetree DT_LABEL fragment_ref nodedef
 		{
diff --git a/dtc.h b/dtc.h
index 75b1c0f..32e4394 100644
--- a/dtc.h
+++ b/dtc.h
@@ -368,7 +368,7 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
 				    struct srcpos *srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
-bool is_ref_relative(const char *ref);
+bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin);
 bool merge_labelled_ref(struct node *dt, struct fragment *f,
 			bool plugin);
 bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin);
diff --git a/livetree.c b/livetree.c
index 76474cd..f2244e2 100644
--- a/livetree.c
+++ b/livetree.c
@@ -543,11 +543,39 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 }
 
 /* Check whether a reference is relative to a label, e.g. &{label/node} */
-bool is_ref_relative(const char *ref)
+static bool is_ref_relative(const char *ref)
 {
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Make the tree at *dtp from a first fragment which refers to a label or path,
+ * rather than being the root node. This is only valid in a plugin, where the
+ * fragment becomes an overlay fragment.
+ *
+ * Returns true if there is an error, which has been reported.
+ */
+bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
+{
+	bool error = false;
+
+	if (!plugin) {
+		srcpos_error(f->node->srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		error = true;
+	} else if (is_ref_relative(f->ref)) {
+		srcpos_error(f->node->srcpos, "Error",
+			     "Label-relative reference %s not supported in plugin",
+			     f->ref);
+		error = true;
+	}
+	/* Make a new, empty tree with a fragment@N node for the reference */
+	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
+			       f->node, f->ref);
+
+	return error;
+}
+
 /*
  * Merge a fragment of the form 'label: &ref { ... }' into the node which ref
  * refers to, adding the label to that node
-- 
2.43.0

