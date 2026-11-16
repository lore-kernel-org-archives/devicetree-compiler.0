Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873534;
	b=UPjH5NhSH7OMr8btsM8t5Z5SGqlegOC5Z1po2+nwjq1GftBP509vNgAKqC5daPJ+oGId
	 aYA21OLqbCEt3LcxgZrTDe5dIIFc05Zoq6Cm3SLvdCHvhUD7aynfZ2hEybyLB/6sZFEbJ
	 dKWPzXGloDrl/vFqZ+weaJfDuY4qFSbPGiE9Jn9PL4TIfzhC5BCP9VAYHlIwYal826+rJ
	 MiiLxT69U/3edKCfGeKKuqFL6Gocvr8SyQjurMwXaFMvaV+wVRvvyMBdTCIVuG7eqSs2s
	 7EZ3/OZp5/bJlvGwg4URFzKNaY8AdERK5zVYMGQcmAJnfw+5mFoazEywIHp45xpx7yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+Im9H3JC4gArwrPMQFxNmwG6WoLpplJ3/HT2tfQHGsk=;
	b=B+03e7ElD93pCxUqGD3kcLDUfDQiyMNfoDVgWQG5ijnKIiuSOJQ9V8Rpza5mHpAKlTo7
	 nC4yL6QfmZf4HhxNAqtDB+2MPTl+r3yFLteDSai6b30PPEvpcJOsUgq69IgDJJ8BU8loZ
	 h0pjRZu9EpcswxkLe8DcQp9jRHUo0SlclmRM7DUKXwci9V15WVoWw1gRkwNS3HlAH6pRF
	 Cbt3lHocQeaxk7eDQc2eOSmmkcyDzjEvSxS6DVFidepP7MK5w5xahsg0OrxgJLmIcLe9m
	 vqA5+oaRvB6sj8A2t6Afx6WEhdo+yfB49iSbX5j+pL9w9MTs1NMrHrxFVbActOfnzVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nu6Yqz+G;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B9606A329
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 660B9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nu6Yqz+G
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-862a19300b7so1023457a34.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873533; x=1795478333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Im9H3JC4gArwrPMQFxNmwG6WoLpplJ3/HT2tfQHGsk=;
        b=Nu6Yqz+G8tPUoeewUyjvlC6iNl/kYHGeptev3xjeMDh5X3o3gaWfFJ63T2+594jRXI
         jfuqKGl1mM+V7FsTKY9c1dDwnQgHG5vPUP/ibbZEOJtrlT6U3zsxx8MGfZgB5cAVj18Y
         sKos7h1RFDkXKo9Z+kbfZMAkOJppUmkZOIU5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873533; x=1795478333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Im9H3JC4gArwrPMQFxNmwG6WoLpplJ3/HT2tfQHGsk=;
        b=bomKAosXmrbtFzBERoD3mZmSyw2YYfISxxBzdrB34PEMIfV+c2gp2tnjJaf6HnsV3R
         q+GWQhj9t1wDTREMJ74obZk8nIbC7afQNVTTIixRRy7fHX2dhwtOYCeYMaHR5UqwG3FM
         Q+RJwN02UwjlE7geklR/qWCMNRIu7u6Y+BuFB1vS7vkRflPjOb/x2Vv0OqI2NDn87j67
         ljYev0ZWsxpgzLHRhJsaeqAkyn1AEYAodd5mi5mWiyyOJ8GFO03vOTpU4k0m1F92jb3W
         7lHoAI3TzgMG23njPLiGx52K28Efx5B+OOsxSgehSGBgziWbPs+pbDi/J5qa6FRI+EwQ
         zp+A==
X-Gm-Message-State: APuU4Z/G30osuScnx16cGXJwqb7Ct30FqQ10qEyJuQULS+dgjU2RvaL0
	gxQY/Gt4u+c3tbPkI2NbPz7MD1sX7d/V0TD3x1m7d7iTNtiZZtjleShokJfiOAH/xGnNT9BELUC
	aj+q7Cw==
X-Gm-Gg: AYBFou3+KyemL4bM1FKdglYnVB0ysYcZIqDwg/ARGIS1UPghBjYMdaXNTsHNO4ReRz8
	KizZbBsQCvAYiE5V1//3vIlsDiC3WhA/9XC0cdrHOAjZhoTS+FxpKFl36S7BzIfcHRMGmzQlCTM
	ESWABuL3PRP7DL4TehOs93dpXTTJFqM1L/FI+aSTOCg3toXsZ7zkHKgzMtQXGm15GiHB4Fpgh2t
	TJXbVQdnoiZxAcjunSgZiAMlr7UerpiDKJvIa3qSvSbvCKvudAQC08N+J1HdHBNWyT2q0ITUZM0
	jnOq9S1c9re+Qpg0BV7kAcD8lYjVZY7xe86hGqq88Wc98DacsCxiCmp0LEppRdA7fbo/QloJGcR
	hKtAQtzkzc87wq7O9VhxpgyiScKF2DfkD3zRgYvP1jmG7n1jjy4CebCBqy5QsENLaqyk2OWfhz9
	wA7RUxkUfVXDLsFQdtvBT0Bhn7P/Hpr2KIpn4vkdP8VRDH1Lgsjn25lD+ZZkus/E4nW2nKEPBxJ
	QAiebM4ZVBtC6E0uwg2MfT5z3PU7Ne+t5fquBMkIkKutRB8FjBPsjLAOqKlA5XbATsJEdp8LiBU
	PQXlNVcz6nFTiuU9U0mg9i0N47SSskj6/sTKQw9pjKrHsEUCr9JLw0OOYxk72WK3RPXfwBtdHR3
	AvkId509Wsw/z0+asJEu/8Q==
X-Received: by 2002:a05:6830:3116:b0:862:ca2e:919f with SMTP id 46e09a7af769-862ca2e9facmr5960837a34.18.1794873532750;
        Mon, 16 Nov 2026 15:58:52 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:51 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 08/10] dtc: Move path-reference handling out of the grammar
Date: Mon, 16 Nov 2026 16:58:02 -0700
Message-ID: <20261116235813.935070-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116235813.935070-1-sjg@chromium.org>
References: <20261116235813.935070-1-sjg@chromium.org>
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

Changes in v4:
- Look up the reference once, at the top of merge_ref()

Changes in v2:
- Combine merge_path_ref() into merge_ref()
- Combine the rules for label and path references, using dt_ref

 dtc-parser.y | 27 +--------------------------
 livetree.c   | 30 +++++++++++++++++++++---------
 2 files changed, 22 insertions(+), 35 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 7e1e6c7..c85b77d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -192,32 +192,7 @@ devicetree:
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
index 2ed57ae..290467f 100644
--- a/livetree.c
+++ b/livetree.c
@@ -541,29 +541,41 @@ bool is_ref_relative(const char *ref)
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
 	struct node *target = get_node_by_ref(dt, f->ref);
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
+		if (f->ref[0] == '/' || !target) {
+			/* Add a fragment@N node for the reference */
+			add_orphan_node(dt, f->node, f->ref);
+			return ok;
+		}
 	}
-	if (!plugin) {
+
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

