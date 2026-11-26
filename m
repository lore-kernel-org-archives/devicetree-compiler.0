Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718505;
	b=GMdngca/2qdvgyynGumwEJ0qqtNocPkfdIrjGkUQMkTA70dPzTY1RKTvjZoociK6H1TR
	 3JuL0rdC5X2OaaLjjhtkQAZXSDY1ee/+WeUvHeoMx5h134vzUAc0W2oltERQXIUEZgVnA
	 QfxjXDGtNEt9gnew20/uF79IxkIY7+gbjbDSmrgl9T+4Lmkbfef19K8SMNs2pdVcVf+qo
	 +OY/Kyq5bxuEfbpfSpzCGVgwQwoHiiNepioeBPTYqsruwgN6u3OUkrn2mjNSHzWP+/l4F
	 Rc0NckajSJVPbq8OWQFb8quRYT73g2stDN52E0R06dg+9w017k+1AiX2hXYSF32ODSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EDYaIrZf9nWglKB0hIBHZYjSXwIF0NI8gCE6KCB6S9k=;
	b=1+dpyZuKcM3tousI/3wlLip/BY6oHE0LfG5prg9w2rPDJNxwTlf60lSCnZDL6ymDFkjr
	 +/w5YbrAJL//KEbpdawvC/YtmCPBmUvVr7m6koq3rJNb5Cbg+6bwzA8LHHGeA/TppykqK
	 kRlYDqPsXBNZ4NloSwtLoihbi1lDOjbpe/lv/VQ4kF9aJNTS03dbu9VCPwKvU5Hxnr4WG
	 MlAuti3XPde8PiMmdJ9TSzrVNe+HWODO0s3V0ZBb6HwkHz0Qrph0DyCZZ15aar4HIibD2
	 lg2hzMXAQufkMrO7gvaEvQ2vxbK9MykGUCV0C5GY5s4F3JVMVx5UMt4Uk8guIQC7JnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m3ZV1dS5;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941C606A31E
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E941C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m3ZV1dS5
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-862b3a39d0dso3519294a34.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718504; x=1796323304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDYaIrZf9nWglKB0hIBHZYjSXwIF0NI8gCE6KCB6S9k=;
        b=m3ZV1dS5gzPCZLI5hb6c6yEt+8Rfg1Dex4tUh/O6osEtguLSmHxwBRZquDh56K9+Yd
         dvnqlX0Fatf1pTjngkZgFshmeTPVEUeTDg0v2IgxNEHVqIQ6pzWZ7QsOuoUNIFjeuROa
         BoS8NTYv0dLGNU6yoa+5VjgynPCjRDvlgEDn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718504; x=1796323304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EDYaIrZf9nWglKB0hIBHZYjSXwIF0NI8gCE6KCB6S9k=;
        b=jR6Vt7NakZpiyM70NNte9ZNtJjrsfgPsZK3tji2tCiqqdoN0x/tXYvK5CHuoE2ggyd
         l1c60aMMeulwR/3kqFmTNORyS5dZZTY5X3Wt72f4T2wM6xm8wcdQW/4nvC4qNj/+/5QX
         Rjxin9slIzSYYnAA+bG4ZisGaHdpjzag3BLiD3qObOObkzNBy/ZwN/i8yITHyFN5cSW8
         el5b3VQytm+4yUnLtXuCmmSXuW74xY+xXAxWLfCUt4Fp304uHEEIPfgxI8zZCJQErRhC
         JlnwRGzvW7fjChr75xNNJW+q11lNz3EaTR6vVMHQSK+ow0Dff8h6LJ0uul3PaxdsHsYW
         +PMg==
X-Gm-Message-State: APuU4Z8yyyjtBnlW/iLxVOePVp8zrd2uUrPZbCcej8Sd73yP1a7vKDqE
	rFGdVBiNiF33Ua7c5m00ons4wXdo7oqpiMSJi07S5GM9AxagrU3u1Qvn7N61MI9aXGcV/Zhrsin
	mcgjN1g==
X-Gm-Gg: AZFdTZcxv7K+hDcC5xpR75GsPTtWFFgtn93lwcu18aVSKJD3r25YknW+6YeDOSRA0HI
	INJ3oO2Sf49Ja3gAv4xKDALUQh7wZoktBf0a1zefjtm55TwdvsyNTLko22wUYtAGfv3oU/84tel
	VGeYQfGVowqmRAJAXteNtWduM5uuNrMnX6lPIZa0TzdMxkEeCnhpt7wG1RfFaJPza/960zyh3aE
	TUqcdfXeo+/FHAm4/y/hgvUOfKdgsbz8gpvZhGpy1G/iy6zZ6BoTwllW2C7BUo9VhwDYlhE6IpN
	w/0Nig8/LJN5FXvsR8tYIHFG7nrSatgAil2SNNYhO0r8nYKk8vmS00fd1qSymEhiY4ZsiF6e5HS
	4ljsa4iFe2wFsUT+R4Tdf94md6BaRzcJ1x5gk0s9uqriakLnn73DZbanLTjmW0tAlOqWJOEObbc
	jM8Wwi2+3sbP/9mRSuQdvyN1LS1MYkT6FqGFqPLKAIDcW8D2FiooZmri0mG1G3mHGBnUCONuLGh
	YI9CERpXBlqOBXCxv7Y099aFPiLaCOZ6coM1llmfdeDjG4xPliAq8gx/jpI2g92YrdqG2TncsTJ
	t0w85cvNOFDuk1C/lyCISKFh6I99iS7nTf2kfy2UIEkFvZoqfO3G0oTdxkUN4r+I3nN7TrVPbMA
	Kh0H+sECxaSx9qJlgQJNhOQ==
X-Received: by 2002:a05:6830:438f:b0:862:b7d6:16fa with SMTP id 46e09a7af769-86315ab1ad4mr23504470a34.30.1795718503862;
        Thu, 26 Nov 2026 10:41:43 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:43 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 04/10] dtc: Move the /delete-node/ handling out of the grammar
Date: Thu, 26 Nov 2026 11:41:03 -0700
Message-ID: <20261126184126.1472738-5-sjg@chromium.org>
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

The grammar actions merge each source layer of a dts file into the tree
as it is parsed, so the merge logic is spread over the rules for each
kind of source layer. This makes it hard to follow and to change.

As a first step towards moving this logic into livetree.c, move the
action for a top-level /delete-node/ into a new merge_delete_node(),
passing it a struct source_layer for the reference.

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
- Check the fragment type with assert()
- Return true on success from merge_delete_node()
- Use dt_ref instead of fragment_ref

 dtc-parser.y | 12 +++++-------
 dtc.h        |  1 +
 livetree.c   | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 3acbaa5..8f8b146 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -234,14 +234,12 @@ devicetree:
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
+			struct source_layer *layer;
 
+			layer = build_layer_delete_node($3, &@3);
+			if (!merge_delete_node($1, layer))
+				treesource_error = true;
+			free_layer(layer);
 			$$ = $1;
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
diff --git a/dtc.h b/dtc.h
index 0992b66..dda7b85 100644
--- a/dtc.h
+++ b/dtc.h
@@ -351,6 +351,7 @@ struct source_layer *build_layer_delete_node(char *ref,
 struct source_layer *build_layer_omit_if_no_ref(char *ref,
 						struct srcpos *ref_srcpos);
 void free_layer(struct source_layer *layer);
+bool merge_delete_node(struct node *dt, struct source_layer *layer);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index e858866..d564e18 100644
--- a/livetree.c
+++ b/livetree.c
@@ -543,6 +543,26 @@ bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Delete the node which a /delete-node/ source layer refers to
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_delete_node(struct node *dt, struct source_layer *layer)
+{
+	struct node *target = get_node_by_ref(dt, layer->ref);
+
+	assert(layer->type == LAYER_DELETE_NODE);
+	if (!target) {
+		srcpos_error(layer->ref_srcpos, "Error",
+			     "Label or path %s not found", layer->ref);
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

