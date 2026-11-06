Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994828;
	b=yf5IAsQZNVOb03gCbEI1AZkYDDwBC+GH0X7LrVgot93TYvWM8g99K83gQyRD2pg9PxrV
	 frXXzGQ84wM1eU+9XNCMzoH6tfHl88YVIX23IZM6jiWzawLqY94nElkp3s0e+6VMeId1l
	 EQHkYGNl9PKXE2tbQszgAjyL/6Lp+arPHQYXa5geoBHZVllip0XHQCTR8a/btZhVfaB8H
	 WKVmUWKIYWUfqs84ivO4+SxsblvAAWJnbW+PVr820XnymF1u6lcIcIv+2c4j5fxsJKS7b
	 rObcSiukGcliUBFg2X7H0KYilM6TpGCs63BuKcOdhhtmb+DZThQh+XCSogj3eQiuBAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=es4eZyl6jH/SGGsdEDohfG1IqBkcftJWFjNg+lsxZdU=;
	b=ArnHYNv6ktyqtom4HfD6dCJKTkJxk50AHb6tUwX8LpzZFDHzMsJMszlJvNMK3oZGF33e
	 kbZOIhYo97406clOpE7FjshwMui2uE5Tzvfm3oRx8k2suu5xspld2z0ybJB2RA5LaTwfM
	 aCumyOrH0teaqNyQ57ZiWoIbZhuOaTtXuuQ2YKNGbN+6v7fdr55nSESKbZkSOiw4NkQK3
	 YFdOre8yfaHStRua23fiADoYiEOeQhYPUq41eAFax26cvaJzIGKMzcKf+rALD00poNVFZ
	 DEKvusi/vraQpZx9/0sXjenXvF7M+XPNYZQ44QUi1ZRBxCgZHF5HG0FWTryzfw5t+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MHp6jiTL;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62BB606A32D
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B62BB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MHp6jiTL
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-483c607ccb4so588752fac.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994826; x=1794599626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=es4eZyl6jH/SGGsdEDohfG1IqBkcftJWFjNg+lsxZdU=;
        b=MHp6jiTL0Y+iO2x6aBQEIjDnxmrzkbWStZD3bOLoDxJRtXaaU9P8IH1dmxMRL2q75Y
         KArK4fb+2kDKd+3NwL4CWMYACY/Iyvzpf/4ttnVLA/UUwakLAH+9HXrUoE/vzbdSRyec
         yT3qpBAe8HAMvM1RO70qzunOmLkKT8dG66C/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994826; x=1794599626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=es4eZyl6jH/SGGsdEDohfG1IqBkcftJWFjNg+lsxZdU=;
        b=mEjFWWoNFxdOFn/DG6DLxSp66MDJ5roBeRpWtTZpM+0IhPUZt1SZ8Ap/cKIJx3Ycsy
         7qxCjnlqNvwAwPg9ubXEBiw379hh+BpzHJdR1OpznK8gf1w9Ogo+haErFjt0+JWb/JZx
         +8poaz2D5EqJcNwW0zc3VZlQe98i0ZcT61gIXcjnChAZ7oTh1G/Dlvs6P5Rzx35cGT1R
         IqwPq5srLaGTqslpGMn0Mqic0Ur0UUeo/fWBqbPNMXS5ftJhsXe6TVxvNwT0gv0pztvY
         i+XNWBVAoQU8x7xXVkv99k//n4AA/M5ehrXU2X5kxextu4hoDN4RiV9V+fbinOk2eHrj
         Czww==
X-Gm-Message-State: APuU4Z92DyQncUbnTWpsuQ45VHS/QmsUxA/bFO2/F9cwgAzUBFMfl+Pf
	mWaVuzyXOgvK00mboZnL5milQrSDPaDuFfpjcTPr6bQbiqigytkI//dgghnbbsSgzPXwnNZDu2S
	Pyx6E0w==
X-Gm-Gg: AYBFou1HIGH6/P+NZMPv2LQ/OInJs185zoNmFGRPv/P/jiC11oSltrTUM4lb59lT6TB
	MXfqkOQi7a5l98nb9o0qGys3BycelJDKEFwrMxsY+3bsDOg4UPBiT37ffKPoMcJqZrbBuVsgbV8
	ygm2UzrVhaKryeN2eAkuwgR/PbQLivkntA0WVMlJL8a9EQx6RPZNlObSIJNpUjhNSMSbCsIHJup
	h/kMvE/7JB7w7gwiomWkGCCZtpBPEi+yXmPEoMfVuxCg62YcZMN1smjZ6OE4jA5LGdxLt1BkDhv
	NzT4uX1h/+TX4XEVF+W2Gdb5xTUOx7jmEORpTAInSi6JssA6/kfafHQ9FoMph/J+++7RUxJLSD9
	kLgAdwcD9WLHdniqOG/22UUNnIDRTtDS0gwf4eb68GMO5/lvIp3hUXoGECylxt1iCP7hfUoCzHD
	gepc6b8L10HGUzt8P+aEg4yT6o+dNd7Xfs6eVltX7udt8GcHOHUm0dYp9evooe6VegeW6n5DuNU
	JgdgMnEmJSuR6y0yaJ724dv6L9E/vP7msJfzIVQXxfeF7kP9smYEioap2/3YliG5aRwF1x6A44U
	+7iz00xIM2WFpJs1+SQj/363ScS7cYdf6zJBdjiqYQXDCv2rLWC6XRezcgGsAPx6Im6ol/ADDcU
	1Tje/oSGT8aj9kSPifTCm
X-Received: by 2002:a05:6870:8890:b0:4ad:7a99:392a with SMTP id 586e51a60fabf-4ad988266c5mr2275641fac.21.1793994826544;
        Fri, 06 Nov 2026 11:53:46 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:45 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 16/18] dtc: Add the overlay fragments from merge_fragments()
Date: Fri,  6 Nov 2026 12:51:43 -0700
Message-ID: <20261106195159.2623314-17-sjg@chromium.org>
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

In a plugin, merge_first_ref() and merge_ref() call add_orphan_node() to
turn a fragment which refers to the base tree into an overlay fragment
(a fragment@N node). The grammar actions have always done this, but it
mixes converting the plugin to the overlay format into the functions
which merge each fragment.

Have merge_fragment() tell its caller when a fragment is for the base
tree, and call add_orphan_node() from merge_fragments() instead, so that
none of the merge_*() functions does the conversion. Add a comment for
add_orphan_node() too.

This does not change the output.

Suggested-by: Herve Codina <herve.codina@bootlin.com>
Link: https://lore.kernel.org/devicetree-compiler/20261105100714.47bf0434@bootlin.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---
dtc gives the same output and messages as before for every .dts and
.dtso file in Linux v7.3-12284-g3799eeb906c9

Changes in v3:
- Add new patch to add the overlay fragments from merge_fragments()

 livetree.c | 47 +++++++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/livetree.c b/livetree.c
index f2c7703..c5fec49 100644
--- a/livetree.c
+++ b/livetree.c
@@ -225,6 +225,15 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	return old_node;
 }
 
+/*
+ * Add an overlay fragment (a fragment@N node) to the root of a plugin, for a
+ * node which refers to the base tree. The node becomes the fragment's
+ * __overlay__ subnode and ref gives its target, either a path (target-path)
+ * or a label (target, as a phandle reference). Fragments are numbered in the
+ * order they are added.
+ *
+ * Returns the root node, dt
+ */
 struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 {
 	static unsigned int next_orphan_fragment = 0;
@@ -611,9 +620,9 @@ static struct node *lookup_ref(struct node *dt, struct fragment *f)
 }
 
 /*
- * Make the tree at *dtp from a first fragment which refers to a label or path,
- * rather than being the root node. This is only valid in a plugin, where the
- * fragment becomes an overlay fragment.
+ * Make an empty tree at *dtp for a first fragment which refers to a label or
+ * path, rather than being the root node. This is only valid in a plugin, where
+ * the fragment becomes an overlay fragment.
  *
  * Returns true on success, false on an error, which has been reported.
  */
@@ -628,9 +637,7 @@ static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
 			     "Label or path %s not found", f->ref);
 		ok = false;
 	}
-	/* Make a new, empty tree with a fragment@N node for the reference */
-	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
-			       f->node, f->ref);
+	*dtp = name_node(build_node(NULL, NULL, NULL), "");
 
 	return ok;
 }
@@ -640,12 +647,14 @@ static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
  * adding any label in the fragment to that node.
  *
  * In a plugin, a path always refers to the base tree and a label may do so, if
- * it is not found. In both cases, the fragment becomes an overlay fragment,
- * unless it adds a label, which needs a node in the plugin itself.
+ * it is not found. In both cases, *for_basep is set to true so that the
+ * fragment becomes an overlay fragment, unless it adds a label, which needs a
+ * node in the plugin itself.
  *
  * Returns true on success, false on an error, which has been reported.
  */
-static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
+static bool merge_ref(struct node *dt, struct fragment *f, bool plugin,
+		      bool *for_basep)
 {
 	struct node *target;
 	bool ok = true;
@@ -656,8 +665,7 @@ static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 					f->ref_srcpos);
 		if (!f->label &&
 		    (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref))) {
-			/* Add a fragment@N node for the reference */
-			add_orphan_node(dt, f->node, f->ref);
+			*for_basep = true;
 			return ok;
 		}
 	}
@@ -709,12 +717,13 @@ static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
 
 /*
  * Merge a fragment of a dts file into the tree at *dtp, which is NULL for the
- * first fragment. A reference is looked up in the tree as merged so far.
+ * first fragment. A reference is looked up in the tree as merged so far. If
+ * the fragment is for the base tree, *for_basep is set to true.
  *
  * Returns true on success, false on an error, which has been reported.
  */
 static bool merge_fragment(struct node **dtp, struct fragment *f,
-			   bool plugin)
+			   bool plugin, bool *for_basep)
 {
 	struct node *dt = *dtp;
 
@@ -724,13 +733,14 @@ static bool merge_fragment(struct node **dtp, struct fragment *f,
 			*dtp = name_node(f->node, "");
 			return true;
 		}
+		*for_basep = true;
 		return merge_first_ref(dtp, f, plugin);
 	}
 
 	switch (f->type) {
 	case FRAGMENT_NODE:
 		if (f->ref)
-			return merge_ref(dt, f, plugin);
+			return merge_ref(dt, f, plugin, for_basep);
 		*dtp = merge_nodes(dt, f->node);
 		break;
 	case FRAGMENT_DELETE_NODE:
@@ -743,7 +753,8 @@ static bool merge_fragment(struct node **dtp, struct fragment *f,
 }
 
 /*
- * Merge the fragments of a dts file into a single tree, in source order.
+ * Merge the fragments of a dts file into a single tree, in source order. In a
+ * plugin, each fragment for the base tree becomes an overlay fragment.
  *
  * Returns true on success, false on errors, which have been reported.
  */
@@ -758,9 +769,13 @@ bool merge_fragments(struct dt_info *dti)
 		return true;
 
 	for (f = dti->fragments; f; f = next) {
+		bool for_base = false;
+
 		next = f->next;
-		if (!merge_fragment(&dt, f, plugin))
+		if (!merge_fragment(&dt, f, plugin, &for_base))
 			ok = false;
+		if (for_base)
+			add_orphan_node(dt, f->node, f->ref);
 		free_fragment(f);
 	}
 
-- 
2.43.0

