Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994806;
	b=RWmtUsPsWbLvcFpaeAi5WP+s1JExh02VueNOTFCzhoK+IN7kY1oEbQDlnytZdRnmOKxw
	 BRwylLhvj0st4MTMB/cucGA6bGGseCPbndUiYgEVqXTb2hMeXvuuxB7UOfoqX8RGQURQw
	 zt081WTz5rQbiIVQVhMC4SahgQKUWcyFJDTzMlHVpHyMIYw9KBnZbqDLGo5FuhPGA075b
	 47euFqWkJJnJ5FVB/VU2a5LKwLbYtSTzzfxXQUSKU9UwxTPvKjc4od2rcjiFkvJHDy5Lq
	 3U6WJifrlep2WUzsgchKXyi7L6jGqaIDL5UF65s6AhJ5NutTb68852lA/ttG8p7+Jeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KG2esNehdRG2Uakp9H15zctI1R5DIvXWSNrAdxKJ63E=;
	b=e9tvvirRn1qGvvOV6HTohZ42adF8KIe7CnFJ8KhVDQFWEuTr/wN+cGG2gXogdvm0mm2r
	 zrf1c6BDILTlU2RdSgzOIGfkAElf972Nivdzcn+2msoDrOxQGeqMMMHCe2Y56oT+b5Idm
	 UjlFB8fydCgZL63J3ASGCX7B18eDF9TkHF8nkN92NiVvHzhnFx7CuoAdCZ3FW5ZubEQq7
	 IOh3nk99fODycHDkRscHP2m13Wngx4twjpcGZ/0vMYEjp6IkyKEtSmnGiDa2BLSRlwR2x
	 gjpSI1BMSvHBEroFCzoQ50OJwAxjVww2QUgFzdmr1deRYxwTl7Agozt7+q4B8P6Awgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PnS+GUpF;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41292606A32C
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41292606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PnS+GUpF
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a822463a22so583176fac.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994805; x=1794599605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KG2esNehdRG2Uakp9H15zctI1R5DIvXWSNrAdxKJ63E=;
        b=PnS+GUpFb6ul2Wbk2G82Upnui8VvVnjSZqEbbSVbEFpIKDhuqftAWh2g6s5WxqCrML
         oE786uv9pa/j1ewnWesmA309T9sp9IBvtl5dYH+rkAL5W/y9IMCIBpNWoIe0kH+A0hA0
         k4kBRcdBjixT7AAxnETGFSaoXWlIvxRqcPe+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994805; x=1794599605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KG2esNehdRG2Uakp9H15zctI1R5DIvXWSNrAdxKJ63E=;
        b=OkwYeBCrYeg2iB1sDgDnmN/DNZgxevwPtuQowE5aKDtcCkvYUQ5cmKAczGACWoyqIu
         Qfuo9ckbqJTIURr/62cKuCgqKez+aCmPMX14WXb+O0Yr1Lh7neLlCGX/HsIOZuTiLdJs
         Ix6kywlanRd3219RryxVSmRas4lyLsw0SwPWbQVslcwgCke5vCAEzjRv6BmbbRCgTYeu
         98aIHdbx4Oi9F/b0P7gUXs8zuT9cZ7feTi8GnQfCxZaVG881bc0oiqUG4/+IsNmndYoI
         O3WE8+LkwrVpq9RLf1wpRzKBnnACCcZWFLj/5qB8r+MD8D4NFcL9uiUUheakKbZ0k3Xt
         iLUA==
X-Gm-Message-State: APuU4Z8Smg/uU8T2K8oiTv/cdrJfygtaR3e7rGs5Z4YoGREYo/aMEAyt
	pmrhf8pzA9HpBhu2bJxOr3He4/tljziCcCi529OYscMSYTSZJC3nN4iJnSENZYHlG7xus37ir4H
	C6HdRRw==
X-Gm-Gg: AYBFou0Ujns6yWVIpf+76ob2UrvEvUxQl6vE1KscUK1SGVgM60rqybBWi23G5GczXrb
	lRlgUUPV8KvGBsr9+DeHWsaXoUAULef9PleQEr7q3OGlBCOg8RAmT1H7OkHuphpJ14RVluruti4
	sbApTK0/ts24W9cLKrl/GnNTWda3ZwP0HGY8VhZq8H29Fj3oZvwF1dmdtT3xhlZPD0U4ql4gakY
	mGVdY0RxzKAOTV4nIIrMyzCOiST+sqW9LbOk3ibPuam8eTBSvMqmn8a7JGZR6RRQcroGAUe7eJV
	miMbPfe6l43Bc8E4yib085EMvXGWpdCZfw5eASDSQxP+dmuOhPntV4EFJ20t1IgtvEbsHXyb5da
	ib05Gn19E0Vps6Rq564iiwiwqJb7pWUjhrzIaPhbRtj9JoZa9LpT4xZuOeRClZco944WnZoap5U
	G1Xel61o1EjCoS2O3z4JJjcqTBqwzDywWFIL0TQ18nRyA4LaE0spS9htmd4HF8t5EwF7zI/D+ZX
	EJ0/xZ0LKE3xtCOWczhE7440fYf5fKhtayqka7VYU8QtYL4XQHiZC/eaBR+3580GW0F9Xsdz4I5
	s90QCMbtwHDJ0JzNHlgZTgCpfHtOD6fjQ5idFFramPl9tmlw8EUVn8ZWl7I+t7wqBj+6eWAEPyU
	Tio/u7u7zwXrLCqilU2j5
X-Received: by 2002:a05:6870:1653:b0:4a8:1837:bc27 with SMTP id 586e51a60fabf-4ad984dc9b5mr2397531fac.3.1793994805252;
        Fri, 06 Nov 2026 11:53:25 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:23 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 09/18] dtc: Move path-reference handling out of the grammar
Date: Fri,  6 Nov 2026 12:51:36 -0700
Message-ID: <20261106195159.2623314-10-sjg@chromium.org>
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

The grammar action for a top-level &{/path} { ... } holds its merge
logic, including making an overlay fragment in a plugin.

Move it into merge_ref(), which can tell a path from a label by looking
at the reference, and use a single rule for both kinds of reference.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

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

