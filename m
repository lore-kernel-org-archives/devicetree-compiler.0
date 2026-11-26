Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718509;
	b=jSfkdCdyTdUFaFEh8kixr2OkvSxETLlmeOdsVEfQ/AKeQWhoDHytoeuG4kMpNWNgRcpa
	 YTyGS2GJEev50D7XsqIIV0Q8ZIYP0Ypf/tuJietNgjFjubADx9wyoMR1i5Af/hsmDA+E/
	 eyg24l0/jBBokxY60D9xbUx0HUkMv/kMHm9b+1z7/lrGwTNgC6CNfXJYeZnY1owaBCzqs
	 KT86g/c0mTFSUE8YwHF3g3Id4MbAwbw21HFBAgJXiyvcXkFxvZRzT4Oe2kydDDyouP6SZ
	 d9zjexbHpk6cPNt/ZHMsK5bV+AyNyJiuhmNfKHdbv7bdaG7zpq4Ugd/TPE8Hum/d9+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nUy0pHRN84KKSSh8pePRyqddxuG7C2LERJK09pIu7DQ=;
	b=wHTbLx0/ik4bOvficw7+Unn8aMcNdZ/xRVRHeyK8kL7bk87ke3fUvG7L9sy3xeQT4j/+
	 DuLUQ5aMFPot9agkU1Tfl1mQ8G0J9QuI4YuGA8llP9iRHTR4ra6nERBNI14FiBufuNWue
	 R7+gkib5z/7YJBVNoNpkuRqzlkRrrzEX0XZsnNr1igqD/FRC4acfIOd/Fa7pdmFq00nLu
	 r0IW1b3jiKduGu/YeE98k3xUyY0r7/di7+dfR+tuBV67vvzd7rG5QLWHE+JUwGSsm7l0k
	 2Tu3RVX7kYSBhS6bueJ7cg1Zti64A5wQg9Sl0QBI/2bCgNENXe4uLqkLLKDvi41BUPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="bS9BV/+O";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F12606A326
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08F12606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bS9BV/+O
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8479f46ecd8so2841663a34.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718508; x=1796323308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUy0pHRN84KKSSh8pePRyqddxuG7C2LERJK09pIu7DQ=;
        b=bS9BV/+OVMBp/XwJms/ecaTy1YN8X+8cDet4V6kCg3vcGmuJqSsbqOuopwO3OgiNjg
         493W6sY/d+dg4wq74rHo8Di3QECkC6qVA9FF5631B2qrKoiS18bdGn6kIW2lKL4A/Om+
         p42+EYYO1sBSe8UseZiAZ+d/OYc+83wDWNgik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718508; x=1796323308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUy0pHRN84KKSSh8pePRyqddxuG7C2LERJK09pIu7DQ=;
        b=J1v8xQNi4yX8YZM21RP9Bdio4XFSS08OSSHQUc0UW1YKmPHmsVofvuhIsoppfSYK8L
         LHB3PFEzGOh2vvekFUx5RFlzrIajoTJPgHvfDcihrvAWEUdr+Qga87J91wS4xBCobymv
         jHzDrLcFeD0IvN1ytz9JrQgC72uu57nYUC97z11u30kXk36vZJqag+jlVuOsSFyhwRqz
         dgZ4yti2B8JWJq5x5iiK1uCS93s2dXOs4FMt8G9XWkvWzUHS2Bh3pQceD1Dm66MDv6Ci
         uY5jUnJeT1CM0fpQdhV83b5qGb21t32FXp2RurL1jlDThvbLFMrA4qSVE2drJpgRQpaY
         o2rg==
X-Gm-Message-State: APuU4Z/XvwXU6tbGF8ogp4VLb+wcMRz6pJZ8RXIS3Qi5sKc6iiREpeGV
	ebB4wwr5smGAu7zvF/zKBOvuDkxvOkOR1i0gUpUZjxcwgPonyk5d2iQKBcPLVTAt0Q+j2WKRJBc
	roYSTQA==
X-Gm-Gg: AZFdTZcF0s4bnl8hSkDabcP5XzR4bpi8qjt5Oog0E/TZFf+ssJNKbomiYhGU7BUzLcy
	AXFszCI7g/ugzXvnGL7SUJxR1MUrhDdcsGFSBz4TlBZ9CRcar6mtSIOC56bQhrpCkh5dxUXhc64
	cbRqEoeDVs8B+c/ZRfSFUZ7E4a6QdchKiDfv0fkoCiZBpT5e+GtLA03fvzqKm9iT4j+yu2K/XuJ
	r5XIc2qsXvFWX4xOP/kLzayQIZq2PBxF3tabJALgq/fMhwAk8oa2q5WwEnxBLfR2DWQRQQUG7G3
	zHjvrWd87PiRQPHVA7ojCSTt188A8y8HfIurR8uM8Y68OTZq3W8Hexy3fIPynJDPRoakSKQU947
	1IlBDydvKLHTC3u5viuFsKCP0Zu+Oi9OuZGjvkvngCIOyeGy9M1vA0+4DzjTcJlySRskKeiPdpe
	UQ8u2KHemlurQ7WZHkWdTpoEgA9mFfFZD8zHv0X/RU3V2ir/Dbd1Wt1qoIxOlipaSUF/0drYrkU
	Vt+dqMknsi7onpDyNmDuQJEP078er9kOeQcA2Mt/ZhyQU+DgLEplNXAjc6YsZfm69iiicYvQ2Ul
	0wBSP+xvsxYUrV5Gs+ZSPrP4ECg090OlmxUQyPpSPNdf6l7vTtDE0OlB7vTv0z4vaWCyhanwaex
	cU9JsyZBWcsg6lTcTt+M7WQ==
X-Received: by 2002:a05:6830:2b20:b0:821:a094:b26d with SMTP id 46e09a7af769-863156719f1mr22438871a34.13.1795718507859;
        Thu, 26 Nov 2026 10:41:47 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:47 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 06/10] dtc: Move label-reference handling out of the grammar
Date: Thu, 26 Nov 2026 11:41:05 -0700
Message-ID: <20261126184126.1472738-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126184126.1472738-1-sjg@chromium.org>
References: <20261126184126.1472738-1-sjg@chromium.org>
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

Move it into a new merge_ref(), passing it a struct source_layer for the
reference and node.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---

Changes in v5:
- Use the term 'source layer' rather than 'fragment'

Changes in v4:
- Free the fragment after merging it

Changes in v2:
- Build the fragment in one step, with build_fragment_ref()
- Check the fragment type with assert()
- Rename merge_label_ref() to merge_ref()
- Return true on success from merge_ref()

 dtc-parser.y | 24 ++++++++++--------------
 dtc.h        |  1 +
 livetree.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 0781784..37c588b 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -215,21 +215,17 @@ devicetree:
 		}
 	| devicetree DT_LABEL_REF nodedef
 		{
-			struct node *target = get_node_by_ref($1, $2);
+			struct source_layer *layer;
 
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
+			layer = build_layer_ref(NULL, $2, &@2, $3);
+			/*
+			 * We rely on the rule being always:
+			 *   versioninfo plugindecl memreserves devicetree
+			 * so $-1 is what we want (plugindecl)
+			 */
+			if (!merge_ref($1, layer, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
+			free_layer(layer);
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
diff --git a/dtc.h b/dtc.h
index 7f06ace..eaf247f 100644
--- a/dtc.h
+++ b/dtc.h
@@ -351,6 +351,7 @@ struct source_layer *build_layer_delete_node(char *ref,
 struct source_layer *build_layer_omit_if_no_ref(char *ref,
 						struct srcpos *ref_srcpos);
 void free_layer(struct source_layer *layer);
+bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin);
 bool merge_delete_node(struct node *dt, struct source_layer *layer);
 bool merge_omit_if_no_ref(struct node *dt, struct source_layer *layer);
 
diff --git a/livetree.c b/livetree.c
index 8108d9a..18ac4ab 100644
--- a/livetree.c
+++ b/livetree.c
@@ -543,6 +543,32 @@ bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Merge a source layer which refers to a label into the node with that label.
+ * In a plugin, a label which is not found becomes an overlay fragment.
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin)
+{
+	struct node *target = get_node_by_ref(dt, layer->ref);
+
+	assert(layer->type == LAYER_NODE);
+	if (target) {
+		merge_nodes(target, layer->node);
+		return true;
+	}
+	if (!plugin) {
+		srcpos_error(layer->ref_srcpos, "Error",
+			     "Label or path %s not found", layer->ref);
+		return false;
+	}
+	/* The label may be in the base tree, so add a fragment@N node for it */
+	add_orphan_node(dt, layer->node, layer->ref);
+
+	return true;
+}
+
 /*
  * Delete the node which a /delete-node/ source layer refers to
  *
-- 
2.43.0

