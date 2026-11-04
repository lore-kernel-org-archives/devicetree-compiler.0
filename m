Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827134;
	b=E5djynh+SdMocYSjegY9aJoCu2zQN35RGTQ/jf9KBzRp0LusvY5pe98JkhQplUJH3pXf
	 LKcKc4dqvtwGFBwZUxX4aZnNaQkxSBLX/oiDnesK8dAK4/pduBI+dCMaXVChq5DNfRu0w
	 9JcZ2qA28n6oFLaE2mGeQZGEgGyHqGgrQ65J+5iL6AE80bC7XCe33kGb6G+SUDG5Zzivo
	 0l4vQcbsYBJkoocLB/YdnFLLo8Js+ye5bKP0q3Gevc51QM28oknGVBkIAHp4bBa7vvW7b
	 Q7db80DcZU8GPMxvyILPBX0psb913JusEsY542OXbUcTn/sgbTIPTGuQzrPtXkzqJpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+xMtsC2NpE7rLKDRglrm9LbVXL7PohURL6G+VZROjEo=;
	b=eGmN3M249nRl7E3E4t0wyX2oC4yUIlFHS7eZrU97MTQ3V2RqJXaI0iDNcEiLTIq/Rtyd
	 6udzMW24pp6v1mYK9KLyDa5UJrnw4RyOKh5L/5wBaf6tR6DgeSsEp7iyGPaYFmDqnMPg5
	 51lvE5jFstX9AYpp7A0DsyYWiIqBvCR3JZqSNV/aiNj88Y28eA+EhdT2ttR9axgJp/AmA
	 lGVA9w8eUAcX/usqG6luw16VW5WheY4CHm4QgpcTmnKRn1NCTbNaR25wH/EOxC8OZ2cPe
	 wJLTLn8QiH+W6sXCRMMYEYku/g/fG65BHh4/UQ341aGC403a4krWg3+omKMzexV5kMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BSATQW6j;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A24606A84E
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03A24606A84E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BSATQW6j
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-49de8ea072cso489799fac.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827133; x=1794431933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xMtsC2NpE7rLKDRglrm9LbVXL7PohURL6G+VZROjEo=;
        b=BSATQW6jTcfXpCVnyTbLvFg8ViqWjXf5QKhGFdU38ZD7WyxFxiSSKipMH0/CANWOOT
         ppYcDR+L4MigDARJcPer1s7EkoJJr8TL89Fet+/TtXrbRJBvpjBTjb+XxXy52hhOAZgk
         eM+k/g22OiMw378V1FcAVxAACTNRkJ7DbeBqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827133; x=1794431933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+xMtsC2NpE7rLKDRglrm9LbVXL7PohURL6G+VZROjEo=;
        b=QFl0OUH1kR8BMT6WzHZeAkmrJ9iGsHKEGKiT0lSuSXYm6yYQsvZZRKd7xjKpZIVVMY
         SF33LXNd3ckSWONemhJ7jKJCn8LyOty2vJ0b+V4KsZczUpzBZdraNfVNCl60BD0FhHaH
         HgSlng3FbAJyZwFC2nG2yCOb6VsqjP8mrvvldSuhzoL65z30hlyd3Tff0bC7z1LH0QX1
         BLyq4TnUUATehdSYTitIJ+IcSoVccllbEOlHy5eUSPWMUyY6SRt0EWH63OlQPfBYZjDY
         1lHLva8d+/jQUHETrUhbJuirwR+3PLnb5mQvKLoAew+rgIFQrjzk1p1kgT/BU35h/Poh
         7ytA==
X-Gm-Message-State: APuU4Z+k5l6m7ZJZIJBOk3Cg8AY/NAtLdOfxVtnY2YxtrznQBMptSM6j
	5+FEyBGVdlKnd1qX9s1AoK54xylfhxWQci4Ysc8/hPgyHZ8kmscmxJS+QZc60AvP2QMYJiH6MDQ
	U2pEu8A==
X-Gm-Gg: AYBFou1fGqfXqZjIvFlPIRvdGrGRR/g0uBm/cuz5KdK7gPwzt1MIS3PanuaMCd1iDJz
	U2fI8Q61k4puZs8W1soRHL7AM4r8WjxvBZX0OWeSu7fG+v7ulmTp0gD8EbjaFuVtAJ8xw2PVu8S
	b3pUq2Wor5MDuIbGF8Jl5oXmf/mtHUG1jOL2j4CyYkvubHDgMOvrrIf6Pa/bp79FSafcX8AnK1I
	e7+4hsjbyq+z5a3Fv6dNm+xbBmi77o8UsB1H0T0gcyvFoSDzYGBFjNl9lfg5LPlAqxAznJJxtb2
	xPZhtiYtQPN+uPkCKPiq7UZKqztSmcEVCeBUd7BMs0ueAj18iaGKsKH1IlQqSPUmdeNMRpJikHv
	a6nqNfHeUDlsCuM3r0hmxOuCum08Dt0ZJ/JvFKvOhWNWzPVX+0lBFjIoR0eEIt2mY83Irz2TCd0
	6keN6y+xC/S/Dcz91yv9D3tTewP00cl1+DkgKnVwj66OFRVBft7lOKLag7a2KFs7BfSHCqW830F
	g+/9gV08T+SycGQAfnMR3UM0Kqrrd229Bd2/8fgW/lcWlHZ5LkYQ+6J9AdV2iBhBn92DRsU4UPC
	5tCaouiSNGLj+a5BCG6+sR+GvquCB+Hq2FPZgyfK3VG3Skn3YL16Zl5ecWx2cgWIQjdu/TJBtXt
	mMlc9/2lA7ady97UxadAc/A==
X-Received: by 2002:a05:687c:419b:10b0:4a9:6d5b:2696 with SMTP id 586e51a60fabf-4a96d5bf21cmr4216462fac.39.1793827132673;
        Wed, 04 Nov 2026 13:18:52 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:52 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 13/15] dtc: Add helpers for the errors when merging a fragment
Date: Wed,  4 Nov 2026 14:17:52 -0700
Message-ID: <20261104211807.972610-14-sjg@chromium.org>
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

Three of the merge functions look up the node which a fragment refers to
and report 'Label or path not found' if it is missing, and two check
for a label-relative reference in a plugin. Each of these has its own
copy of the error, so a change to a message or its position must be made
in several places.

Add lookup_ref() to look up the node, reporting an error if it is not
found, and check_relative_ref() to report a label-relative reference.
Use these in the merge functions.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Return true from check_relative_ref() if the reference is OK

 livetree.c | 75 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/livetree.c b/livetree.c
index a1d5d71..a70a7ba 100644
--- a/livetree.c
+++ b/livetree.c
@@ -573,6 +573,40 @@ static bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Report an error at pos if a fragment uses a label-relative reference, which
+ * a plugin does not support
+ *
+ * Returns true if the reference is OK, false if there is an error
+ */
+static bool check_relative_ref(struct fragment *f, struct srcpos *pos)
+{
+	if (!is_ref_relative(f->ref))
+		return true;
+	srcpos_error(pos, "Error",
+		     "Label-relative reference %s not supported in plugin",
+		     f->ref);
+
+	return false;
+}
+
+/*
+ * Look up the node which a fragment refers to, reporting an error if it is
+ * not found
+ *
+ * Returns the node, or NULL if it is not found
+ */
+static struct node *lookup_ref(struct node *dt, struct fragment *f)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	if (!target)
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+
+	return target;
+}
+
 /*
  * Make the tree at *dtp from a first fragment which refers to a label or path,
  * rather than being the root node. This is only valid in a plugin, where the
@@ -582,17 +616,14 @@ static bool is_ref_relative(const char *ref)
  */
 static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
 {
-	bool ok = true;
+	bool ok;
 
-	if (!plugin) {
+	if (plugin) {
+		ok = check_relative_ref(f, f->node->srcpos);
+	} else {
 		srcpos_error(f->node->srcpos, "Error",
 			     "Label or path %s not found", f->ref);
 		ok = false;
-	} else if (is_ref_relative(f->ref)) {
-		srcpos_error(f->node->srcpos, "Error",
-			     "Label-relative reference %s not supported in plugin",
-			     f->ref);
-		ok = false;
 	}
 	/* Make a new, empty tree with a fragment@N node for the reference */
 	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
@@ -618,13 +649,8 @@ static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 
 	assert(f->type == FRAGMENT_NODE);
 	if (plugin) {
-		if (is_ref_relative(f->ref)) {
-			srcpos_error(f->label ? f->label_srcpos : f->ref_srcpos,
-				     "Error",
-				     "Label-relative reference %s not supported in plugin",
-				     f->ref);
-			ok = false;
-		}
+		ok = check_relative_ref(f, f->label ? f->label_srcpos :
+					f->ref_srcpos);
 		if (!f->label &&
 		    (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref))) {
 			/* Add a fragment@N node for the reference */
@@ -633,12 +659,9 @@ static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 		}
 	}
 
-	target = get_node_by_ref(dt, f->ref);
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	target = lookup_ref(dt, f);
+	if (!target)
 		return false;
-	}
 	if (f->label)
 		add_label(&target->labels, f->label);
 	merge_nodes(target, f->node);
@@ -653,14 +676,11 @@ static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
  */
 static bool merge_delete_node(struct node *dt, struct fragment *f)
 {
-	struct node *target = get_node_by_ref(dt, f->ref);
+	struct node *target = lookup_ref(dt, f);
 
 	assert(f->type == FRAGMENT_DELETE_NODE);
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	if (!target)
 		return false;
-	}
 	delete_node(target);
 
 	return true;
@@ -674,14 +694,11 @@ static bool merge_delete_node(struct node *dt, struct fragment *f)
  */
 static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
 {
-	struct node *target = get_node_by_ref(dt, f->ref);
+	struct node *target = lookup_ref(dt, f);
 
 	assert(f->type == FRAGMENT_OMIT_IF_NO_REF);
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	if (!target)
 		return false;
-	}
 	omit_node_if_unused(target);
 
 	return true;
-- 
2.43.0

