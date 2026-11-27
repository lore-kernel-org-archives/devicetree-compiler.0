Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810518;
	b=RhQYn2KKefBmCmZJMozHbfq3sykL55Q9BwWpwWqUy/rap90MJQ4Ulka/3C6J7EhInbwO
	 T5Pa398YmtROzuoQS5Lrk5TfQsKLKSKhyNlPzUMaUvDIH6ech+ZZpEYppa1cehVtvgPDP
	 /zGb2MgLS4e9mizLOPSzFrafe/GGyLjOT1fzesQwp6dw7PuTo+XgYaxreqDpvO89bsG0g
	 yJ4UE22Zq/ENEB37Pin8Og1WZApH24qa6o9YbjWMD/4EU5XfJoCogg2SEwomFTJjd+zZB
	 xHSL7fL95arvgbQs5/ZMDNTJ2cg0FX0HvzJnWltMnYkwFqw3N98X07vzqxfdbCQYR0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YreZaMNynqZnsGykitEMx5KE8tXGu5bkcry4A8e92bE=;
	b=1w5Uu0ERF8MwaNJl9Y/otwv7tnPFsKK5qEsj6F4UnSBfMAnWTpKGThqVtqrqDtKsZtby
	 OaS/IvXl5ItRPLpuE6ipiPXG9lpfFoJY0ss3FW/GM/E0s5Jmach3jZZo1uZCrYQ+vHN6O
	 I+zYNoBAEtCwFCrq/Svy55BKJUs9aCfY6cgi+XuOvDw3BVVDDP41lhrk88ykCH4U8qXxc
	 ATRk8lbfOsZ+tkoC0Nh7wXlZJVRWqQV5isfdUEX2EbN2Iq+o5TSnzaT7ii2+JZtA+YYDX
	 GoVkzmRE67g0ToIqza0WUWoAFkYafXY90AjVV2xiCoG1WujWOqkJTGh1nfKqlFnHCcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AnBBfT75;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CC6606A31E
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 20:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CC6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AnBBfT75
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4b8587b395aso4851092fac.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795810517; x=1796415317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YreZaMNynqZnsGykitEMx5KE8tXGu5bkcry4A8e92bE=;
        b=AnBBfT757dhhqXb5QQ0quTr3DqLB9Q+75wRmWZmOGkYleOaDFx/zs2B7uob9WbnprB
         0YjEgGNjWZD9nxxEH+LznZ3LBFBTCNU7AlcRz77KT905TRC+7Xu5GzbZ3g4t4F7tbPAH
         CLcW9IxFFufCTHn+lsOqaTs27P5ltxPlXPAL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810517; x=1796415317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YreZaMNynqZnsGykitEMx5KE8tXGu5bkcry4A8e92bE=;
        b=BHqiOwpMX37AWZCcy0kuLs7MGX2Qs9nYEle9AoeP5KPUx3iB6FaGxXXTyAoHGemWJ2
         OrtZVbfOto9zPEEi4bfCh3TeCvQKKkVdKGqS2sokiQHpg7JKidfxkX0MrtkmWWKUeBQk
         /XgcC2+7HtDV86yWJfh6NWHqUK3KsXOGKZIBxYT+k9yKY7vSmuZU6cy4ylh6I2Sf7oqa
         KF+lqt1OzGZXR1UMZwJhKYlY2aURRI5xITPPPJWFDIensX2L8ZkG9pfCC1FtvzTX8C4f
         hlwkZvTNvo4KTRIrrZZwJZIUQiGB2E91iTWwAjuIrk8TAle+AoQ/tIrqFWkUWgmw8vkI
         bncA==
X-Gm-Message-State: APuU4Z+FR5JsMfhsvbQAvh0FJpBf6+6ifl01N2fSu1YhC6KzdzDTPm7M
	ywtawj1MHuqZyJSfkaf1fUKMS6x9LiGz7twuuxNpaV3ENPlR67hMpl6843j4Mk8HGY8nS6pkGDu
	U0jTmqA==
X-Gm-Gg: AZFdTZe/Gi55qzg4hFlOPJtbw2Shf9pBtlgEC1DusjxFcSp+JsF+leRX+0A0kj1XqHB
	CX1vN2VShDH/c9HXePeTrsEG9p4b+JpHUX0hts5p1SVLDNOqit52IcQV8gizL4Nr7CwlZ+4t4mW
	BeCBhmkxQQqcjeh5Qt4tR9uMrS1UE+sWlunwzuNtipIbNsoIQOuifZWJDVeO6Ew0TR1YQUzK9W/
	cWiqyD+YJR2/JNFNjMC0oEjIeKQUCBOiwasYDEv5SS7v+ffeWhYVmjEa1ivtj/P6hZDJ8kKRFee
	Nj02O712VLAjBH0D9Vd+bjGnxJ1VYQk8FJAL9gi+6PZuHvyjf/B3u+Jbt9XmAqTEbM370/aBfbc
	X8qJVx9QNF6CYla0l2y0mVgnycse4u64lAxwL7ZHee1L5zLDLh+GsbUepEnB49OXbSZIVttXuIA
	tJDCpd4E/XRAXuzicOi7sqX5n1YAwuAw2JuljOIIVg5JhDg9oaBrqgwfdimXVU1XPcp+GjcydYo
	/zgixxvN1IHgtP7/dTxR0wuSyZbgcO0ovEReIA9jYxAPDoc2B4hUaU6l9TRrc3X93FF6d2jV2nt
	gMn6di/F8BC/u4g0bgz/OSV9gTpjKZPGyJd6fu5Aykd1zmiTnVy3nQCaLF01z1L/0VVFnbu7NnS
	tH9m3Tw==
X-Received: by 2002:a05:6809:18a:10b0:57e:8bd6:d617 with SMTP id 5614622812f47-57e8bd6d7damr3013382b6e.30.1795810517145;
        Fri, 27 Nov 2026 12:15:17 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm18881561b6e.16.2026.11.27.12.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:15 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 2/6] dtc: Move first-reference handling out of the grammar
Date: Fri, 27 Nov 2026 13:14:45 -0700
Message-ID: <20261127201457.1837712-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127201457.1837712-1-sjg@chromium.org>
References: <20261127201457.1837712-1-sjg@chromium.org>
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

In a plugin, the first source layer can refer to a label or path instead
of being the root node. The grammar action for this holds its merge
logic, which makes an overlay fragment in a new tree.

Move it into a new merge_first_ref(), passing it a struct source_layer
for the reference and node. This is the last user of is_ref_relative()
in the grammar, so make that function static.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---

(no changes since v5)

Changes in v5:
- Use the term 'source layer' rather than 'fragment'

Changes in v4:
- Free the fragment after merging it

Changes in v2:
- Return true on success from merge_first_ref()
- Use dt_ref instead of fragment_ref

 dtc-parser.y | 15 +++++++--------
 dtc.h        |  3 ++-
 livetree.c   | 31 ++++++++++++++++++++++++++++++-
 3 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 98b68b1..4a6da6d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -164,19 +164,18 @@ devicetree:
 		}
 	| dt_ref nodedef
 		{
+			struct source_layer *layer;
+
+			layer = build_layer_ref(NULL, $1, &@1, $2);
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
+			if (!merge_first_ref(&$$, layer,
+					     $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
+			free_layer(layer);
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
diff --git a/dtc.h b/dtc.h
index eaf247f..97db4dc 100644
--- a/dtc.h
+++ b/dtc.h
@@ -351,6 +351,8 @@ struct source_layer *build_layer_delete_node(char *ref,
 struct source_layer *build_layer_omit_if_no_ref(char *ref,
 						struct srcpos *ref_srcpos);
 void free_layer(struct source_layer *layer);
+bool merge_first_ref(struct node **dtp, struct source_layer *layer,
+		     bool plugin);
 bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin);
 bool merge_delete_node(struct node *dt, struct source_layer *layer);
 bool merge_omit_if_no_ref(struct node *dt, struct source_layer *layer);
@@ -370,7 +372,6 @@ struct dt_info {
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys);
-bool is_ref_relative(const char *ref);
 void sort_tree(struct dt_info *dti);
 void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
diff --git a/livetree.c b/livetree.c
index 76bfa39..96f4cf2 100644
--- a/livetree.c
+++ b/livetree.c
@@ -538,11 +538,40 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 }
 
 /* Check whether a reference is relative to a label, e.g. &{label/node} */
-bool is_ref_relative(const char *ref)
+static bool is_ref_relative(const char *ref)
 {
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Make the tree at *dtp from a first source layer which refers to a label or
+ * path, rather than being the root node. This is only valid in a plugin, where
+ * the source layer becomes an overlay fragment.
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_first_ref(struct node **dtp, struct source_layer *layer,
+		     bool plugin)
+{
+	bool ok = true;
+
+	if (!plugin) {
+		srcpos_error(layer->node->srcpos, "Error",
+			     "Label or path %s not found", layer->ref);
+		ok = false;
+	} else if (is_ref_relative(layer->ref)) {
+		srcpos_error(layer->node->srcpos, "Error",
+			     "Label-relative reference %s not supported in plugin",
+			     layer->ref);
+		ok = false;
+	}
+	/* Make a new, empty tree with a fragment@N node for the reference */
+	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
+			       layer->node, layer->ref);
+
+	return ok;
+}
+
 /*
  * Merge a source layer which refers to a label or path into the node it refers
  * to, adding any label in the source layer to that node.
-- 
2.43.0

