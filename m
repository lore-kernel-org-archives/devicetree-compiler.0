Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827123;
	b=QPwcbZm3O8N3eDmDNWkCINd7aPtveCfiubueusvYqnuIQGaG5XuXO7xX6HT36Nz0/Wkr
	 xh4B1qpy4e5r91pR6GywkEk2Fmcm6gtMcDTVWehI6a3/Gb7lMtcs6cDnhM8J/McFCYSeI
	 hwvXjdfSrnMoeTSGR/1SNS2B25AYdqe7etKQQcy2Hll2OcQGeLNXy3WAb/w7chkG+AhBg
	 L77l3F4ArpyPn415/nEoh0PhjCuMFawTIOjyMhCmRT7juPsxD+k8qrIPLc0eifXsD0Cwn
	 wEBeqe/UuNuED0xAD4UpCOzQSjJgXX85KNvrAtf1ssBnBWEzzBTYOvUknIZOLIlPJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m/HT7c2FBEgN0/QhMSvkwkrYz5lOxR2uctDmuzFXquc=;
	b=MvxLu786DX95ws4IjgdMccc/D0zOftO443zqa7k5ef7jQ3ot2Y53lGvzh3Br+Ermi+fe
	 rz8A6UsdVcUn9gU0+OMJyW1qv52FjJA6PJ4ib0oJ45sjLZ++VHKYexeDkQYUPwiSy14vX
	 uQ5JBjxoAOP8YQ0uxsYlS/zjkdM6dvjq8TYK9SCfAncPEhXN2XN79l3vfPK1GZggLH7TH
	 at8GPlQYfX2/ffpA1IqWmF0h+f3Eah6Qx0MIhg/RQm0w7TW3BIgtjKTd0xeih8qBYZVwF
	 cMUQDRASUseBujE2Fpz4y1BF+mIP9N9+eEDg+DMb9VF9oGZ/BMv+w73/1h2A8I9389Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XHc2AsJi;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F2606A847
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3F2606A847
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XHc2AsJi
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so703892fac.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827122; x=1794431922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/HT7c2FBEgN0/QhMSvkwkrYz5lOxR2uctDmuzFXquc=;
        b=XHc2AsJiNrrjpEcb+bGCpIcoz/1oMSbvZKufEDn0S/ZpeQB84qNyieuMsXnqmqqpFP
         qwgU6StkvBPDYvUzeKcxAGYj7Av65rdTSc5G5COcpW/e+wo9ig3ntSVViOBEeIBfOtbO
         6V/mgifxXl6rbcXbVQxACbsUGyBu+kmuZ0btI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827122; x=1794431922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/HT7c2FBEgN0/QhMSvkwkrYz5lOxR2uctDmuzFXquc=;
        b=sG1AfHTWKp6+WBFStHe0uZN9FG82p16Tu7Z0MvS/EKtJ6mGa66hF2gMv1sCIHX4Iq5
         3daLSpXPB2EHv0ElwSDzU/nlkan0hZKGt9vADFwFZyOsjIZZSZZOH9cwUSS08YtH4o/Q
         1NQi+pJKbb1PVyaBXybe429lwEqCusbNJVpkPBKdDk04FJLSPBhxPnrfTcWimIfxF0Z1
         9CIYl9fzARvfJAG3YWovsPOWKxaXcOw/4HhpOLNSCTHQdc4HCEa3M6/2CQkypAFKIeDw
         vXPqRE9s82tGF87Oie95CXygTqxQr/VEX8knEsu/jhVreEpEUjLFxaHp0fEX8067PpR1
         q59w==
X-Gm-Message-State: APuU4Z+XsxW5EqdXjq8wmhufaWUSI6aK9LLHNwUw4tPN7j0WOLHynbVp
	S0YWay8cC06zx4Qo4a2Jj7T1aIm1cSoi1VPg2c1TzplM4krH+f1KocpNFL1svJvR5NmuruYAyY8
	iIdjUsQ==
X-Gm-Gg: AYBFou1j6TKKmcWqlR8vOtDVy1ilwty6jZWQizqern38RIzwWm5pw5mGT8WGMv6v34Y
	ZhXVU9sZi9kXUKIznXU8LUohXeGjRgLAq7upsByUELmOhzjx2+skW1RnfD6oq5Oql/gjL+CpehP
	bw/b9Gf+dS1dyRju6XVlcAHP7RBJeUJ7aSzM17awuuxRlej+1uYo7Tko68uk7T2idxUubCZ7S1a
	3yNTjjMyzEz9WnIsCgNPJasYfcrBNAMjDKy7UJ67JVzHUbVAkBl2dB9aMO7gnNtn1dICxBuScz/
	xgIsA8thRtQe5q7cuJ0YSQI/2WxQFTIV7jWbePlD8WEeOQUiNHlmwobiC9mO8hv9SNA6lo4ZxNV
	1JvsHj8r98Exh/exlpklamBNl+ZVrh+VlTEPbV5b4JkTrxqxwuzHJc4p9AqASy/nR7CWX+71K5U
	y7gnUtaDz/6U3fkCwnX5arUtjAT/fg+JyLMpOAdTGrLC1jJoOCECkO+43gsCupRzMNtbF/3oc9p
	ijrgOuk/CyjE7CmbpHJMWFhJ1KAqh/0QGDc/0pclwJZPIPGT2Jbyjln8zvrXI5Ej8G6qdVCaBNe
	6KVmRgaelt28OIluEK+FcAlfKqpByWMJP+YLKQDvz7w4+Trjbu6THqqtCb5A3wmzh8471H0fyJt
	Sx7cr8zN4OBk4fa2nklLySw+yvi46Y+BTOmg4pPhTr8k=
X-Received: by 2002:a05:6871:8787:b0:448:8bdd:8358 with SMTP id 586e51a60fabf-4a90763f98bmr11177550fac.15.1793827121353;
        Wed, 04 Nov 2026 13:18:41 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:40 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 07/15] dtc: Move label-reference handling out of the grammar
Date: Wed,  4 Nov 2026 14:17:46 -0700
Message-ID: <20261104211807.972610-8-sjg@chromium.org>
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

The grammar action for a top-level &label { ... } holds its merge logic,
including making an overlay fragment in a plugin when the label is not
found.

Move it into a new merge_ref(), passing it a struct fragment for the
reference and node.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Rename merge_label_ref() to merge_ref()
- Build the fragment in one step, with build_fragment_ref()
- Return true on success from merge_ref()
- Check the fragment type with assert()

 dtc-parser.y | 23 +++++++++--------------
 dtc.h        |  1 +
 livetree.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 9b9b6db..c58a66d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -214,21 +214,16 @@ devicetree:
 		}
 	| devicetree DT_LABEL_REF nodedef
 		{
-			struct node *target = get_node_by_ref($1, $2);
+			struct fragment *f;
 
-			if (target) {
-				merge_nodes(target, $3);
-			} else {
-				/*
-				 * We rely on the rule being always:
-				 *   versioninfo plugindecl memreserves devicetree
-				 * so $-1 is what we want (plugindecl)
-				 */
-				if ($<flags>-1 & DTSF_PLUGIN)
-					add_orphan_node($1, $3, $2);
-				else
-					ERROR(&@2, "Label or path %s not found", $2);
-			}
+			f = build_fragment_ref(NULL, NULL, $2, &@2, $3);
+			/*
+			 * We rely on the rule being always:
+			 *   versioninfo plugindecl memreserves devicetree
+			 * so $-1 is what we want (plugindecl)
+			 */
+			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
diff --git a/dtc.h b/dtc.h
index 8c4d7bf..9b4389b 100644
--- a/dtc.h
+++ b/dtc.h
@@ -373,6 +373,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
 bool is_ref_relative(const char *ref);
+bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
diff --git a/livetree.c b/livetree.c
index 3ff4e14..179866d 100644
--- a/livetree.c
+++ b/livetree.c
@@ -573,6 +573,32 @@ bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Merge a fragment which refers to a label into the node with that label. In
+ * a plugin, a label which is not found becomes an overlay fragment.
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	assert(f->type == FRAGMENT_NODE);
+	if (target) {
+		merge_nodes(target, f->node);
+		return true;
+	}
+	if (!plugin) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return false;
+	}
+	/* The label may be in the base tree, so add a fragment@N node for it */
+	add_orphan_node(dt, f->node, f->ref);
+
+	return true;
+}
+
 /*
  * Delete the node which a /delete-node/ fragment refers to
  *
-- 
2.43.0

