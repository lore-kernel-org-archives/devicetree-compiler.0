Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873517;
	b=gu7C5EOhKnAFRYYbtdG6SVrB0HKMcwCPX65tQWpK+hJ73AUP6XSGlzwrb0ai5W4g6NXT
	 Gu49QL6qlry7vMrRhMRdC8njBUBahu4eRXriF/ko8k2ULwutUjp8KGtl/PWDDJGfMXXsu
	 efn6ol41uWEhKuo/aE1Odk5GinM8DosD+ja7dNzZPq+m7y5Jpi8pLyvpDliw5VMaWHrXO
	 YI53EgBT6WMW40ylwyUMI5uCTW/FX04uh879SDbLwTeABhztVHrHXzJZNEPDG2yfl3oL2
	 h3qFqaCTozSYdP6OFhJY6q5Ml3c9Rs4P8FSb8I3p/+uGZBhhm0fwfawQ18BHhwe4Mmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I0p1bxy5UrJTVv9ggLQUAwhVERcuMiNcohs5nMhLkxs=;
	b=rtGZi9UqMpNeTBSDTzlx1vjBmytqpdQx7Y3nKPMcf8+oPZxOL6UtL7rnWzX5HLjzsd+4
	 Y+qyRE78I+pYYJeBi+4MAfgNFmff4orHfnIum2ir0JUWLI02/wjvS4vvvvPnPA63Go+1q
	 BYnMp7emtNxOK7KPpqEtqZC/3K/GHRvmQIEYDZyh3gMl01NNkfCOsPDuNWasv5enhjgwt
	 6NkDvQEQR4JvWvuXM21iXCUeFE6WvB3xfwv95CknyrqxQNgFXzNNvEf/CRvAEVxnnytVK
	 EhHqGziDqR6lPQVuyt7ptYXy8dIyLHkvv88kTupxVlDg5ujdmRsCbaw3VfFivYYDbdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E+PKRx8K;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83E606A323
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D83E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E+PKRx8K
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8470d7d430fso1733964a34.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873516; x=1795478316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0p1bxy5UrJTVv9ggLQUAwhVERcuMiNcohs5nMhLkxs=;
        b=E+PKRx8KdqM35+F+FwJ1V1an28/zIAi0yOnp6FZP8BiylAvmdDmvIew0jsvbNHdRfk
         n60qbsYGhRevQnr1l7O9xrwEEdMrPxScGXHBbMGx5fbqcvuYEwuBNCmGZqSSrfjD8ToV
         x46xp59G2VOTxbaQl0vsJfk+YqDiDENGJv7zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873516; x=1795478316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I0p1bxy5UrJTVv9ggLQUAwhVERcuMiNcohs5nMhLkxs=;
        b=sbCUGbm9FKKG95nHirKfDd8I9Wmi5IBMvZhAhZImi5oV87hWeZCm0nLkpBKPz94x3s
         Me/QdQryO63OzAW+JSrHvyAg9HVpk9c6QQ8zGcjqTzXMdJC07adovf2sInVQBYKCfapi
         0JSkdzR7Y6+b8HHu2jtVLmz03G2EP4oZMBpT3aAFXRih+NBIPTJcy+GO+MfY1EWIfnvX
         ULreLiuIsgJveWzwtUZ0HFKzhfzbOyYYQ9nfSz+Hb0C+dHvCilIOYvhuNsDOLm0I63FC
         oRUpS+NMib2shG5sLZYdizxE8aqjgtcRJYWhqM6xTgNKg1ehVPoeMD8zWra0kEb61FT0
         yzTA==
X-Gm-Message-State: APuU4Z+c3hX21Mrdu4Yh7GWXl//OgY4jjhskVmMn20+wQKM4YhFD8Sr/
	NjxGikhecG47RVPIN/5PNDQxUzgJyCy3CVONsRYAGRmif8Sk2UhOpDLFLcySzr9c01gUH5l2Lyu
	3XFxRyg==
X-Gm-Gg: AYBFou13Zi2Wk97rc35dRcqX9x4iEt1x6JehmEmb6UkEbQXdSGESsvRH3sXIRMBw4sT
	2M56BmVGwD3joLNyaz2XTQcjnW7lJyNqONkH5SZPAq76+jD0g7rWrrowrNoFU8QlbqJJVsMTFZJ
	KDgPE5d+BcN5LYUjRr0xKWg4Pk8FwubHBcp+jKLMq7HF9J+x5U/KhaO8ovEb3yD/RoVxkqKPKIV
	7K/HvYfriliZM2A9PecyGE0UPX49/TwgqmcqdrPo2TEQF7gVYZVv5LXT8ywd7kcH8nx+2R1AhNB
	hvfKHjaxSuQs5IoeWKaxiJjFiSpjUQHbpTjTiQ1jG8tIAdyqza7PBiytpHALy7OG62Npa8bgxyP
	rLdW4X2ooB/nA9B9QdxEvLmCX7UULrgQkaBJ9djcIBO0coskw3IufZCHiUEtt5FSpP2d+Ch6rUz
	+cIpH0MABfmR9NEF40MB715JFrzlYsHXECsToYNUb2B8VOEYlqLSinO0+KRUdbJMCWmOwd3/viH
	gyvL9TCbGnbgDNttD8OZGvJMIt60Te4W9l+e1AMBqp61cqZ1Wt48thEk9ohtnXUs25ZesPXD14/
	4rhpyfSSictRBd1Tgqy2NdrFk5aCd0WaYczUwfFWd3kx6uAdydiLjkJdY07iHEAagBqkvcTCnqr
	VOqlpJ8HdlzUBPeRMVGhHgg==
X-Received: by 2002:a05:6830:7181:b0:816:b03e:f9dc with SMTP id 46e09a7af769-862898cbb06mr12194263a34.5.1794873516153;
        Mon, 16 Nov 2026 15:58:36 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:33 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 03/10] dtc: Move the /delete-node/ handling out of the grammar
Date: Mon, 16 Nov 2026 16:57:57 -0700
Message-ID: <20261116235813.935070-4-sjg@chromium.org>
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

The grammar actions merge each top-level fragment of a dts file into the
tree as it is parsed, so the merge logic is spread over the rules for
each kind of fragment. This makes it hard to follow and to change.

As a first step towards moving this logic into livetree.c, move the
action for a top-level /delete-node/ into a new merge_delete_node(),
passing it a struct fragment for the reference.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Free the fragment after merging it

Changes in v2:
- Check the fragment type with assert()
- Return true on success from merge_delete_node()
- Use dt_ref instead of fragment_ref

 dtc-parser.y | 12 +++++-------
 dtc.h        |  1 +
 livetree.c   | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 45a699a..6bf96a7 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -239,14 +239,12 @@ devicetree:
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (target)
-				delete_node(target);
-			else
-				ERROR(&@3, "Label or path %s not found", $3);
-
+			struct fragment *f;
 
+			f = build_fragment_delete_node($3, &@3);
+			if (!merge_delete_node($1, f))
+				treesource_error = true;
+			free_fragment(f);
 			$$ = $1;
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
diff --git a/dtc.h b/dtc.h
index ac18616..41ba438 100644
--- a/dtc.h
+++ b/dtc.h
@@ -351,6 +351,7 @@ struct fragment *build_fragment_delete_node(char *ref,
 struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 void free_fragment(struct fragment *f);
+bool merge_delete_node(struct node *dt, struct fragment *f);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index 4231c64..ce47fe2 100644
--- a/livetree.c
+++ b/livetree.c
@@ -534,6 +534,26 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	return dti;
 }
 
+/*
+ * Delete the node which a /delete-node/ fragment refers to
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_delete_node(struct node *dt, struct fragment *f)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	assert(f->type == FRAGMENT_DELETE_NODE);
+	if (!target) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return false;
+	}
+	delete_node(target);
+
+	return true;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

