Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718516;
	b=2Hy5/l3nr8h4H4lRovTupDk8XqtJswc6kDV/tF02Yo7Oxr5hZGmLPvQ5wiNB8vSrghgp
	 fUcmhWdmqo6EPTaR1gsFfqFOBqFIOjtOPyBiq4i8LTzgoyu9tsOLIJlliZ+SRn94o+wnt
	 6Wa03swG4Lh3zCe5e6qftrWO/gxtRgox9OsW0f11nXo4EXbCaI4JH/HsNvzz/hgF2Wp1j
	 fhm5ivvvDQTlA/l6KQsVYX+H7J6EvG2kyjdOmThmw+s/3ozuFB0hdScKMrpocDnF7g1S9
	 2S53/a3FgSiHvzfO7+dJczFRz++HRvDo4hIPeV3MPtQkxSYteWc2LcUq3slO5nr3xtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xlcnY6HXza20TvaaKpm+68xcF4QEwznvkEe34SX3Ciw=;
	b=n+0q/gmx6VnqWUkNwOHDyMk+pFcuSuPiuYa85T/wSBXYXdOwzHDghr4DVB2F3t3ZV6kx
	 16JOWkEyzCIu/PsqbkQUza4shTG6x4dFIADDzDIZ2rKm+Odfc27g6cwDpgkti7XC0ore2
	 0Y1PRp8OJcukyGexPVp2rDhALWKscc8Pum1vviLsOmrfjgRM8EYfpr6xVOeImcjuTkTMH
	 mAJF8Z2C8Kh62ZTNWZAaVWvHAffUnGeIStIzzSPRvI/pojBGCf75yRj9HpmRvtRo89BH5
	 ivs7qed7lqsgGos7Css2lMyqV+r5HjlPFVmA58ee98qQuxXXyp3kTOnKvRTiWfPcFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Kgu6UUe+;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93363606A321
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93363606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Kgu6UUe+
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843cf077f10so9718987a34.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718515; x=1796323315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlcnY6HXza20TvaaKpm+68xcF4QEwznvkEe34SX3Ciw=;
        b=Kgu6UUe+DYfqv/InovYrv88tGRhM5nVLV8DsE/C6AmEgLTZCwC3o35lmk2NnQmelYO
         9Wlns/wGopXHJuY7qhErfxSyhVy63mJsKevm2/DVeXrFpsANWpFtm+hqMsyRfQ8DU+hC
         dHW1zndYkaTifqaBHqj/KRClZ07BZnFLJXtnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718515; x=1796323315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlcnY6HXza20TvaaKpm+68xcF4QEwznvkEe34SX3Ciw=;
        b=K44M43rC3AThzKL3Ipw6iHq6aa5GMBCh3poCRDLb4ubuKN5paZCp+Gq9z5DS188KoL
         aElhSECJu7HwLJZVaRd6OMkWNdZDUp1jb47slbgnITeCZSdmRiefgtpcwBzg823/CA3u
         h45Op/loM4xFwgj9UYuDYxc89UvYMve5iniK+pOCoZIcSFiJK6Iv/Buq+OqztTING1lF
         jXTly0QuP9Zxi4S6J/qOwOky0Z1txDZjAhqmBUbBHbAZEWWDfBDy7bYPiqDd6msVwrJt
         sX2oYAMliBBA26jtBjkdZj9Eyco4ZasE2yeQeWXMMeDJtGJpxACBZ1G0n+cidCVHwkbt
         TwOg==
X-Gm-Message-State: APuU4Z8xUCEAkCBvh0HSx9Aa1X9qnhnKBocrtGk962GMVL+TdnYMN0pR
	QupgRBOEd6Arg1K1x6IK7dPi31MJ0278EU8yQ/oTaZa2P/imaj8aLjXE7ERjwl4KWlYfw1Y/n8S
	yvDD0QA==
X-Gm-Gg: AZFdTZe0GDu5K7L7afOqw7/9KMlBElhRzWVJ4ti49FztQRV0243Y/WapoLAqfQlorB6
	mEmqtyBLZRFrHbdb+8zTfUD5HjKOXzAaTc4rFw95DSy7Gc4lrdTUk822i8TFzHdm2v0Ej9BPWdg
	MQm9NUEW6uoc38CHoZnCqMQt24+xX1sCO5YwrSOD05iuxXKTTh0g19vNRSWk6nshAoWVf8cnPk3
	0sKbXIrjqW39Fl8sHH04ARc2cxpnyv7vLD4aTWGSp2+cy84rZ5rRGKwLJK/nRiP0Xzshk98XRi2
	lRcbi+6zmM+IYFwxup//ae2lOjvwvSK6F3379svy3C3pAv4icmqVojqCwU80i2Mu9sy7p7hLh3F
	mPjyC2d7JyMrq7X6urmWi6hdepfBeL6KXDdRlSHUCDOIdVi9RtJf/yz3JfhiVdHz0CGa2n1mLcx
	d7vftnjvcMgZneujZM/4jgwIVDHePCe1E31wvfiyEVqjuFd1sbd0c/xV+QkloYtkhtTWPSUYr82
	CAkuFCEG44qJil/LINmjWcnJGlIH+4RZXM+rfXx3WBhjEIprmshpVF9ethmksfTMDb8mwoklOEV
	Fken3PKsCRmAI319gTN8uIqoK1Nn/xj8yGPNc/jOrXOxEoBYWoIXbkEqrqPYd1Apym3YWVGFRzd
	NUvFRDHrEbu39heUASjU6Jg==
X-Received: by 2002:a05:6830:4125:b0:862:ca2e:91a6 with SMTP id 46e09a7af769-863158d55bfmr22778857a34.19.1795718515498;
        Thu, 26 Nov 2026 10:41:55 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:54 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 10/10] dtc: Move first-reference handling out of the grammar
Date: Thu, 26 Nov 2026 11:41:09 -0700
Message-ID: <20261126184126.1472738-11-sjg@chromium.org>
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

In a plugin, the first source layer can refer to a label or path instead
of being the root node. The grammar action for this holds its merge
logic, which makes an overlay fragment in a new tree.

Move it into a new merge_first_ref(), passing it a struct source_layer
for the reference and node. This is the last user of is_ref_relative()
in the grammar, so make that function static.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

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
index a33f021..72552be 100644
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

