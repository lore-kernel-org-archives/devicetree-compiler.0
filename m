Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827128;
	b=Pj2BSA6j8pJ6rNc/nIdQXlZyGgIf/MRgFb2gbe7KivlMnw62JFJluF1nhn5FhdE9OsTx
	 Vh75IkuuxV12mZi/if89gYk3w7b0diCzJuUvwKS9q06CiK/2wRczpyXNvxlH+/pn8t0dy
	 pZQmKwknBA6smp7nJt8Ab/1zAEXo8I4E1UFku/z0QPW6moA6R4QMeIvaL/el14qiMojGq
	 dpmC0TyiMvQ/nFtqbK56ro4mC1i20fKwAF1mhaEpqFatPOcc7VBBhoZXYQroBiMqWMlE9
	 KmlmOFCzgeTKAZoexwy86+j22HD/UVDq0ARV6xLpJEZFFRjIVgpvz4YXuHB/EZsMVsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2AWN7Y/iUr2T3kfp1IIQKfYWEq1yfvZ1L7PAaMOP/yg=;
	b=cVZ4doEbFlAM0hMatwHaYyuYA5jMCboRJu9A2NZisQnmUCHReA4SZMB2wm8IqDq2oGzH
	 dzF7/3iTe6101Yq1yddKzu0xOVY1iW8LL9gpoowtAElMakmKC8U5P4SObnvpvmsvKhe77
	 vQIC9sTkBKNUTeoy59MTsC6Tsz5CwlXf4YxXCRMtTpMW/dJ6XyHY3a7+LoUejlBvVp1yq
	 S7Zom1NcLWb/N0/Edh79dNZmfT6zjKFMXv/wxB6Ruy9NHq9OLweOumKoRT8j5/0Ysw1s+
	 ql6iagiIlCQEPf6af4tr66tUwNKFLZ2RjsTb0xzdHS/ZOyVpZzynZgeBP/hnVkmMMpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lqu4wJCs;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C682608C991
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C682608C991
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lqu4wJCs
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a71d0c4233so611347fac.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827127; x=1794431927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AWN7Y/iUr2T3kfp1IIQKfYWEq1yfvZ1L7PAaMOP/yg=;
        b=lqu4wJCsk31BFRXjOM4pjaTvR2x2bg6sUSBScoFYg5oX9OjzDbwgtZ96OkWGKsv3xv
         KRhx6dQX/feCEf+BDF39vg3Smxe4LHYsnV5wgcsE+VpQaF0qGOAdFq693ruOEeJe5PfW
         JFT4VTLDFmEuwFq7Y2utvqheF4Ma0EV0ZpLkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827127; x=1794431927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AWN7Y/iUr2T3kfp1IIQKfYWEq1yfvZ1L7PAaMOP/yg=;
        b=tW1HrbQiA/LY+JqXwhFtbDmMo7bDz9UapWuU/37mPeaXruQD1LuCH1Xpm58V/epqNL
         m9mLSrUlvOzQFwo8CWtdTuS/lO8vqn6jvuwlhSWRzC2Qmu93J0VJyM9YoFmC/6pR+qIa
         ODuiBzSqlu86psiYoaqkh/hZliNQQLK2tN5CyI5lF48LnTTFjib2xjiZQene3kzBfZQC
         mhHplxmJuO1blbGM6hegvC2e43plWMJcQbWe0lOaPg8Pzn7qByrrlebIMn0Lut34AwkJ
         l+5PpfZzrmEAasR70utuIwBftAQ8PO5PSBgXrnuZNyo5SDOCyXXvzhwNEoBiOkzwop+7
         wJfg==
X-Gm-Message-State: APuU4Z/9GlZ2ZmF0Exn8KRM11ZKfkPrCkG79tAKmTV6nhZ3rpAJ55E5/
	cOL3GUU1PmRmb2bQYG8Bh+HFTUwwS43ZkF53qmGpGAuragq5fK6s29T4F1NDzewBt2bTM7JOTdg
	6XERH7g==
X-Gm-Gg: AYBFou3m/Tq1lwt+yic6VmGZ6DMVK9hkwmQ+hkFu47vWQF7myriGLvtRePJWNvPRRhg
	x0SKrOoeG96+CqdpgIKY1ke/WfXH3PITMaKQInf6zgEi3OYORTVz2/SAWsrgrMveNNGCH7L/dpJ
	1AXWbvPs4vW7g65NDPqGznWythU2/bBSIoQYPtFrN/YW3wvXDhEThCzDndUkPGWYZVSYPG3yUGg
	yy/IURk1OIobkZZFlD6jPJiXE0alw+csBtXMg5nMbo5LNzonD8srufMYZ46nCUiLLCwQCsezfhc
	JGYc1uT10ETvnQ0QGcTEbp8JGSJX06S8UXJCaL0p7EQNcoQqekPyeggRCeSaOAJtMCDwsgiByOM
	tg0cryS9UAwX5iV9CZ7RTPUUMvbhI2QAVFQyBCqXgJZNxH8Dz7/1Jh4esAa2lWQQcw+dOyX6zgo
	QbIFJetb0TiqhicC6PxdFqrxKelyzvADDyKFH4fUbSkL2QXn4j6h4QX/JwoPpZ//IDJ9GealsZE
	35m8xuZqSJhvkPw4aMxQlaXTzodrsphkLzYWXDzVxEzEB8PrVDYf+QOUV+rixTg/ujl8CRBVVLS
	Cyivwcg5QI3ujTn0vHPAUW2SBC1j5jMTJuc8EB5KfuFFU35ul1i3Fkwa3w3gbzSEPbdB6US8lVt
	VGWBsHVBeAMMcpotxxutXsQi4fQVyqCuVpMuZGheqi7UG
X-Received: by 2002:a05:6870:2dca:b0:49d:999d:c25a with SMTP id 586e51a60fabf-4a90729b213mr12789680fac.6.1793827127122;
        Wed, 04 Nov 2026 13:18:47 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:46 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 10/15] dtc: Move labelled-reference handling out of the grammar
Date: Wed,  4 Nov 2026 14:17:49 -0700
Message-ID: <20261104211807.972610-11-sjg@chromium.org>
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

The grammar action for a top-level label: &ref { ... } holds its merge
logic, which adds the label to the node referred to.

Move it into merge_ref(), passing it a struct fragment with the label.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Combine merge_labelled_ref() into merge_ref()
- Use dt_ref instead of fragment_ref

 dtc-parser.y | 13 ++++---------
 livetree.c   | 14 ++++++++++----
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 3ec9254..8d505a1 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -179,16 +179,11 @@ devicetree:
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
-				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
+			struct fragment *f;
 
-			if (target) {
-				add_label(&target->labels, $2);
-				merge_nodes(target, $4);
-			} else
-				ERROR(&@3, "Label or path %s not found", $3);
+			f = build_fragment_ref($2, &@2, $3, &@3, $4);
+			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
 			$$ = $1;
 		}
 	| devicetree dt_ref nodedef
diff --git a/livetree.c b/livetree.c
index 2e9a3b2..7ab9437 100644
--- a/livetree.c
+++ b/livetree.c
@@ -574,10 +574,12 @@ bool is_ref_relative(const char *ref)
 }
 
 /*
- * Merge a fragment which refers to a label or path into the node it refers to.
+ * Merge a fragment which refers to a label or path into the node it refers to,
+ * adding any label in the fragment to that node.
  *
  * In a plugin, a path always refers to the base tree and a label may do so, if
- * it is not found. In both cases, the fragment becomes an overlay fragment.
+ * it is not found. In both cases, the fragment becomes an overlay fragment,
+ * unless it adds a label, which needs a node in the plugin itself.
  *
  * Returns true on success, false on an error, which has been reported.
  */
@@ -589,12 +591,14 @@ bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 	assert(f->type == FRAGMENT_NODE);
 	if (plugin) {
 		if (is_ref_relative(f->ref)) {
-			srcpos_error(f->ref_srcpos, "Error",
+			srcpos_error(f->label ? f->label_srcpos : f->ref_srcpos,
+				     "Error",
 				     "Label-relative reference %s not supported in plugin",
 				     f->ref);
 			ok = false;
 		}
-		if (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref)) {
+		if (!f->label &&
+		    (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref))) {
 			/* Add a fragment@N node for the reference */
 			add_orphan_node(dt, f->node, f->ref);
 			return ok;
@@ -607,6 +611,8 @@ bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 			     "Label or path %s not found", f->ref);
 		return false;
 	}
+	if (f->label)
+		add_label(&target->labels, f->label);
 	merge_nodes(target, f->node);
 
 	return ok;
-- 
2.43.0

