Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718507;
	b=qrUeoW0U43F2QTHFfc7wHbzg2/EWxWhNnZJFOg2SoDPmSNe065AX5b/IioXYLLkwhMAU
	 cvFbOadVPoMiGUbbsH/p5cIZSSg8aAr4WGu5gspRg/Reg/GbDEBWiAr5paEhTLe4gTRAu
	 ZNCtCNBwPdCw4X/1dg15AW/3p5fFFlH8pKszNGxgd6sGQI4BpxauFIbJYPCus5DuHO4h7
	 ZYr+JwQGBW/SgOGiElHVKXS/sBdJGmMKIIJm9QrEDqYD9sweyGeO1mpNF0lnPW5AOszH/
	 p+WiZvr3LcUEk4a+MPqwaCFWuxjMsR7XmbkwJJoEFmxzRNmogI0/79ViEXKxOjjg0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pSvizQHi5uGdbulfGXUgjo/7/rmk6m2Ny9GyOMBedD4=;
	b=dNYllZ65Ov4QSsPxoRlWBV5KHtnOvVNrBIIGkZVvLfw1i9NpaAVf1FuPhWO5EGRtDJZm
	 YPstHAETNWmbcDaSIfRVGyz++5w9kwcdBMk6SPtvUMhxW4FswxZY1CobFatLH3JnSaPPu
	 MvObBT04a5brI/GZfiLO2FBjHsNISe04AyhBnwB/p3b6ITNERRnXFeV/SjjnCQcPdSwG+
	 8GtHECVU6B/tcCJ9rLbVwAosPdLlkUedSkhxSpmq8KKiPaMfZ7dcxYrEz4FeChcJ/S6Bo
	 OD6Mv+EmvlW/HjpntrvvNWoA7u/t+xRfA5GLru+wyTbTZultb21I31KjihUYui5NhhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EacQkZCF;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1E4606A31C
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC1E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EacQkZCF
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71aea92f666so4713331eaf.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718506; x=1796323306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSvizQHi5uGdbulfGXUgjo/7/rmk6m2Ny9GyOMBedD4=;
        b=EacQkZCFZMJaU/MatB++mFsSttkOynRoYNoNDFzJceNZrN54zqeVe+K3mtR6OrAKpo
         Gv9Kktj/bWxxglUhxJyYHvcxCfSU6jB7+cIKaqu6dIHsIYcnE2fk15xvV4DbXMsAfFLO
         6nlZCCFS/QoStCJsnkGNTzciu2ARZHvGteiKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718506; x=1796323306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSvizQHi5uGdbulfGXUgjo/7/rmk6m2Ny9GyOMBedD4=;
        b=Jj8WvfeWLTsvfJpjue5bU7GYEYmLHJtt0dgOcDJ+1G6wkvxop1MTploCo61X7UCa60
         yrbtoGQ0WhtfIXQSlf4GaBFpGr7u4lhgZOS42r/IlMcmP4pKY7bK+dKuzRz92GY8wBLd
         O+4OOIyhIvQllh0MQQV2wAiErxQBmCwKKxtIZ53jYSYjhIGETLojkwgG1IlCwg/Sy33p
         aKDfNOR86zu0bXj+YIWCKwAew4djtZ0hxt4/FAnGwurb8JYsGACZIBW2Ff3E4O2krdhb
         5wrQmfoPbbg9oBFt3KoikHzlO+A1iEBRu/QUXJL86vmtW1e45fDQs+bCtt5mRvzkYNFF
         gTsQ==
X-Gm-Message-State: APuU4Z9b5eAx6uTTngy1SjoSeIx9cznN7cVMtFZWe8DAq4H6aTiItPiW
	O8MWSp5R+5NIp0/CuIVVkZHX7dPdMbh4kjNkRlLbDEP0qqjhND+xJlS1y353804uj1g9iuo7N8q
	JnGB75g==
X-Gm-Gg: AZFdTZfxRFntKWZIoXVv+jT0DZ2YuYuDeZXRibDh967pWOkSqvPO7sBzvJ4oRVY9ern
	/JxAwaqkq70ubcs+T/7kaVOrcn4XHEGC/sQ4A1OgBXWG89yRe9B7taSAHhMhHTpA742K3tQ9LQf
	MMrLVzJjBqdtB+JRb8bg6r8YYljrPE260z2LQ/qDno48VRjn46YChp+0jq10oKo0Fn6kSCnq/NV
	RF9MY1FNIktmaUg3tWsXAY7WKj0f7bFhisHs0Dpe+txwbVAx4OuMkzDZpTDPgnOhsxag1FWojJq
	ndKjwsEgE1T83QIvS8aogKJ6owdVSo/+OXXjdBVq/yWo8VHzrKy8cgL9/F1Em4i3lDJLdaLmDxX
	e0ieMj3N2v3jwSwv18KM7+QXCTaThpMNyZN0SX5shV2ENqoaNwELpqNTDl+JDV2KV4NTo/34TZN
	RzGEyeX9SgpelSbcjJ148Z6WCy/5FgDUAkIykSJvSOlRNCvebOCjCZkD+RvovSHw1Pc3We44aBA
	7p1Y4MNdY78DGNWRRsVaWYU8vUOwi57W2dbeaphh6Rtdp1JQ3XQYRuHoufFf//qt7OFaN9GgirO
	mpyXVPAUP1iwfKC2w3f5c3lxIv02DspD+zUAMepjwg9htBTZ/W03vhXeQqhMdsMJ10OUw+NOdKx
	x8Zk2BVRDKHszyRQPBNvZzg==
X-Received: by 2002:a05:6820:2228:b0:6f6:3762:5f9c with SMTP id 006d021491bc7-71b3929078dmr19502266eaf.11.1795718505793;
        Thu, 26 Nov 2026 10:41:45 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:45 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 05/10] dtc: Move the /omit-if-no-ref/ handling out of the grammar
Date: Thu, 26 Nov 2026 11:41:04 -0700
Message-ID: <20261126184126.1472738-6-sjg@chromium.org>
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

The grammar action for a top-level /omit-if-no-ref/ still holds its
merge logic.

Move it into a new merge_omit_if_no_ref(), passing it a struct
source_layer for the reference.

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
- Return true on success from merge_omit_if_no_ref()
- Use dt_ref instead of fragment_ref

 dtc-parser.y | 12 +++++-------
 dtc.h        |  1 +
 livetree.c   | 21 +++++++++++++++++++++
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 8f8b146..0781784 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -244,14 +244,12 @@ devicetree:
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (target)
-				omit_node_if_unused(target);
-			else
-				ERROR(&@3, "Label or path %s not found", $3);
-
+			struct source_layer *layer;
 
+			layer = build_layer_omit_if_no_ref($3, &@3);
+			if (!merge_omit_if_no_ref($1, layer))
+				treesource_error = true;
+			free_layer(layer);
 			$$ = $1;
 		}
 	;
diff --git a/dtc.h b/dtc.h
index dda7b85..7f06ace 100644
--- a/dtc.h
+++ b/dtc.h
@@ -352,6 +352,7 @@ struct source_layer *build_layer_omit_if_no_ref(char *ref,
 						struct srcpos *ref_srcpos);
 void free_layer(struct source_layer *layer);
 bool merge_delete_node(struct node *dt, struct source_layer *layer);
+bool merge_omit_if_no_ref(struct node *dt, struct source_layer *layer);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index d564e18..8108d9a 100644
--- a/livetree.c
+++ b/livetree.c
@@ -563,6 +563,27 @@ bool merge_delete_node(struct node *dt, struct source_layer *layer)
 	return true;
 }
 
+/*
+ * Mark the node which an /omit-if-no-ref/ source layer refers to, so that it is
+ * dropped if nothing refers to it
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_omit_if_no_ref(struct node *dt, struct source_layer *layer)
+{
+	struct node *target = get_node_by_ref(dt, layer->ref);
+
+	assert(layer->type == LAYER_OMIT_IF_NO_REF);
+	if (!target) {
+		srcpos_error(layer->ref_srcpos, "Error",
+			     "Label or path %s not found", layer->ref);
+		return false;
+	}
+	omit_node_if_unused(target);
+
+	return true;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

