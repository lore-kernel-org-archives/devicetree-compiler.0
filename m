Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827126;
	b=5bKZyvc7HL0acw9/sg36MQwyqvnJd8baOyUJF19hVW5Ddb8E8Jd1ZQuG1r3tnzf7ykRq
	 fj2HJNKT2FBJ+MJUQfI7uCItFcaSwRQ3PgXMFS1MaHK0tUV+ZP3HEisDpfBqQA8SRPVUV
	 ElF0vZxaDDKS/5KzhYgpujj/WXP8q+fMSINVr985te4tYf2vb97I4X5j+HCwQ7+zAjq3y
	 HF21XfFzCNDD9NIgiSd5rvQAy2DA8a+eN7n9XcoH0pzB1VTSTk91s39jouXhh+EnLUVPQ
	 8zTgMcIvepa2l133Y9WaDaP8UKRe+hrds2z9Zmc91aMOD5IpGRUUzBOIC1Nlaz8snMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KEGfVupBNY/ItqBxw3HnJU36Rj6YLjgB4ZeKJdglBoU=;
	b=nKcmPSwT69iKOFO0/mJAqXbYj9rBArJhhXLp9Odhj097qD1cpWuY+1gw2H74J6+pkIKq
	 o35s0zDww5noxo38iJeOejXlMA8Xi9W/a/ujWWOPAmmLJIUpIiJDKn6v9VAkllA+IM+EA
	 lWeW/ZpYwhgacSuCwt1sO0ROg3wIy7eQpJ+eks+hkf0xgQtFzEMxvYxz5XiFqTxMIXaop
	 08gX/p852rxnDg1gdwG0YeJdZWVjBR8J/bIqOv7Jpuj6d7askc8Gv/VmAK2OyoG9Cbny1
	 5I4N5TQgkcIfExc0vNyiNRRMD3NrSOAIWNuK62mDORmpxCrVIu+phwBhkWo9hFQDd0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kbSV6Np1;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64768608C98C
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64768608C98C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kbSV6Np1
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-70bf1671c21so751934eaf.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827125; x=1794431925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEGfVupBNY/ItqBxw3HnJU36Rj6YLjgB4ZeKJdglBoU=;
        b=kbSV6Np1wnvy0f0zrDDagdfmmwXENhLQfL+Wh6z4XmR5aJtHxO3GXGWWCp4nxbyWEe
         A6mPbJheHMqXHlqbRso586hesD2ZXUkzo5iBpUW2VdThRquylJxPFa+H9qmlFl2wiJ3a
         HH0iu+hQkHqDbRYgL05Yz2oVlzuLOjrwt/2dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827125; x=1794431925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEGfVupBNY/ItqBxw3HnJU36Rj6YLjgB4ZeKJdglBoU=;
        b=kEd4uBQoQDifwq46d4LL/PHB9PzS1Y3bLlgKrCpwGyTnQvXv33zXOKRL3wT/SdE+k5
         6Iay0hsJM1ZRPwj8Zyc4jMAuNpzjHrKmckopnBN3bmp8/wTyO+1uAu5zslaQFw5Oq1Qg
         BtZylnEqUf7EGXh3Mi30bzQYbYLkyQpgANTvBYRFN5jqtsoLbsG5EO0JnR97Ft2/FPQb
         nH5vKx222JasnbTdAK3WniIBRCu/EIsjXQuQtnBHZwgd9GBjhaLgtAhme4XG5PFYUbvH
         gtSgBc/OzBpiBC1zH+pU2+DSl+TQRD1/zg/R/SKjSjWsfEyxw34KeiSrLS0igI6d9GwS
         9M6g==
X-Gm-Message-State: APuU4Z/D6nNUxemq2YKSoiC8dq6KY/ExG8eaw8NUwbJAPc/ZOFSEy+QD
	DQhoy2CcXPK/QCrg2FqLwmTPKC2mGGb7dogSrvgukmYOglK/f1mu2Pst6p5A2llFFFqbGqAdGKZ
	Z9NPgYA==
X-Gm-Gg: AYBFou2ZHWke3xa9ZJ9VB0tSxLMIlOTGKap9pGwYXDA+tu/JiZJI5W8mSYsPCV8odWM
	qWamU1VAwJybSvDicTHXd66Lg4UM+ELWDgtiroGI49YCsh3E5VNETmOZqusYTR4mKbuNZRNyhSb
	Tshifef1Tq4dGLkUDTP0EGfn56qto3YWqVJneO+WYYBiOGG/ilS22x+NMVSAPrt/66V3Fi5HF3o
	tf7qNjSICx6YjeTecGrdcU9gwpi7DZsGOxMJBSBhiVwQ//nPAdfSPsPVV72iELsIlKCmNqCaipX
	uD44/RpZALLiusw6+rYBetqtDPX4pPXy1sJ6tb6emyoevJ0b4Zo98yy3Ss5zCF/x16PqA8V1TUb
	sKWoliUQ/8Un+5tKB4zjXRg1V27uTvoLCwcUa54xLiZC4/Za0yYO46wDH+8prepBgNjDilxCE0I
	XRfoQ9ZhmzAAx8peQmQvb0DhZ8K/HeiXCLMtEHsU7uBIcDXLoTS9+PFWQj2pggf2AChyBrRJmHd
	HrqPqyd0PzTfxgTx02EHvzWXeB3hckLs8R8n+HP1egooeuJR7IYNdXNykseC9ekoO4LGX6CYFpg
	Fty4ADgoW/gKD2a+CPkLs8AdZUWSs5oJ2lllN++ILm7OuOQXafHg9+nUUTePprPcKhU+iyKiZvP
	boYXbxXwE0o1k3SRWrGvE2OFYoUqphDc2mXEIb5eEyqU=
X-Received: by 2002:a05:6820:c0cf:10b0:6de:ba4f:af00 with SMTP id 006d021491bc7-714f2a0099dmr7360315eaf.63.1793827125345;
        Wed, 04 Nov 2026 13:18:45 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:44 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 09/15] dtc: Move path-reference handling out of the grammar
Date: Wed,  4 Nov 2026 14:17:48 -0700
Message-ID: <20261104211807.972610-10-sjg@chromium.org>
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

The grammar action for a top-level &{/path} { ... } holds its merge
logic, including making an overlay fragment in a plugin.

Move it into merge_ref(), which can tell a path from a label by looking
at the reference, and use a single rule for both kinds of reference.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Combine merge_path_ref() into merge_ref()
- Combine the rules for label and path references, using dt_ref

 dtc-parser.y | 27 +--------------------------
 livetree.c   | 33 +++++++++++++++++++++++----------
 2 files changed, 24 insertions(+), 36 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 3614d71..3ec9254 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -191,32 +191,7 @@ devicetree:
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
 			struct fragment *f;
 
diff --git a/livetree.c b/livetree.c
index 179866d..2e9a3b2 100644
--- a/livetree.c
+++ b/livetree.c
@@ -574,29 +574,42 @@ bool is_ref_relative(const char *ref)
 }
 
 /*
- * Merge a fragment which refers to a label into the node with that label. In
- * a plugin, a label which is not found becomes an overlay fragment.
+ * Merge a fragment which refers to a label or path into the node it refers to.
+ *
+ * In a plugin, a path always refers to the base tree and a label may do so, if
+ * it is not found. In both cases, the fragment becomes an overlay fragment.
  *
  * Returns true on success, false on an error, which has been reported.
  */
 bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 {
-	struct node *target = get_node_by_ref(dt, f->ref);
+	struct node *target;
+	bool ok = true;
 
 	assert(f->type == FRAGMENT_NODE);
-	if (target) {
-		merge_nodes(target, f->node);
-		return true;
+	if (plugin) {
+		if (is_ref_relative(f->ref)) {
+			srcpos_error(f->ref_srcpos, "Error",
+				     "Label-relative reference %s not supported in plugin",
+				     f->ref);
+			ok = false;
+		}
+		if (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref)) {
+			/* Add a fragment@N node for the reference */
+			add_orphan_node(dt, f->node, f->ref);
+			return ok;
+		}
 	}
-	if (!plugin) {
+
+	target = get_node_by_ref(dt, f->ref);
+	if (!target) {
 		srcpos_error(f->ref_srcpos, "Error",
 			     "Label or path %s not found", f->ref);
 		return false;
 	}
-	/* The label may be in the base tree, so add a fragment@N node for it */
-	add_orphan_node(dt, f->node, f->ref);
+	merge_nodes(target, f->node);
 
-	return true;
+	return ok;
 }
 
 /*
-- 
2.43.0

